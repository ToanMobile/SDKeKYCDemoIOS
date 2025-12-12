#!/usr/bin/env python3
"""
Auto-add Run Script Build Phase to Xcode project for iOS 26.1+ fix
This script modifies project.pbxproj to add the fix script automatically
"""

import re
import sys
import os
import uuid

def generate_uuid():
    """Generate a 24-character hex UUID for Xcode project"""
    return os.urandom(12).hex().upper()[:24]

def find_target_section(content, target_name):
    """Find the target section in pbxproj"""
    # Look for target with name matching target_name
    pattern = rf'/\* {re.escape(target_name)} \*/ = \{{[^}}]*isa = PBXNativeTarget[^}}]*\}};'
    match = re.search(pattern, content, re.DOTALL)
    if match:
        return match.group(0)
    return None

def add_run_script_phase(pbxproj_path, target_name="SDKeKYC_IOS", script_path=None):
    """Add Run Script Build Phase to Xcode project"""
    
    if not os.path.exists(pbxproj_path):
        print(f"Error: Project file not found: {pbxproj_path}")
        return False
    
    with open(pbxproj_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Check if script phase already exists
    if "Fix Frameworks Info.plist" in content:
        print("✓ Run Script phase already exists")
        return True
    
    # Generate UUIDs
    script_phase_uuid = generate_uuid()
    script_uuid = generate_uuid()
    
    # Find target UUID
    target_pattern = rf'/\* {re.escape(target_name)} \*/ = \{{[^}}]*isa = PBXNativeTarget[^}}]*buildPhases = \(([^)]+)\)'
    target_match = re.search(target_pattern, content, re.DOTALL)
    
    if not target_match:
        print(f"Error: Target '{target_name}' not found")
        return False
    
    build_phases = target_match.group(1)
    build_phase_uuids = re.findall(r'([0-9A-F]{24})', build_phases)
    
    # Create Run Script Build Phase entry
    script_phase_entry = f"""
\t\t{script_phase_uuid} /* Fix Frameworks Info.plist */ = {{
\t\t\tisa = PBXShellScriptBuildPhase;
\t\t\tbuildActionMask = 2147483647;
\t\t\tfiles = (
\t\t\t);
\t\t\tinputFileListPaths = (
\t\t\t);
\t\t\tinputPaths = (
\t\t\t);
\t\t\tname = "Fix Frameworks Info.plist";
\t\t\toutputFileListPaths = (
\t\t\t);
\t\t\toutputPaths = (
\t\t\t);
\t\t\trunOnlyForDeploymentPostprocessing = 0;
\t\t\tshellPath = /bin/sh;
\t\t\tshellScript = "if [ -f \\"{script_path}\\" ]; then\\n    \\"{script_path}\\"\\nfi\\n";
\t\t}};"""
    
    # Add to buildPhases array (after Embed Frameworks if exists)
    # For simplicity, add at the end
    new_build_phases = build_phases.rstrip()
    if new_build_phases:
        new_build_phases += f",\n\t\t\t\t{script_phase_uuid} /* Fix Frameworks Info.plist */"
    else:
        new_build_phases = f"\t\t\t\t{script_phase_uuid} /* Fix Frameworks Info.plist */"
    
    # Replace buildPhases
    new_content = content.replace(build_phases, new_build_phases)
    
    # Add script phase definition before /* End PBXShellScriptBuildPhase section */
    end_script_pattern = r'/\* End PBXShellScriptBuildPhase section \*/'
    if re.search(end_script_pattern, new_content):
        new_content = re.sub(
            end_script_pattern,
            script_phase_entry + '\n\t\t/* End PBXShellScriptBuildPhase section */',
            new_content
        )
    else:
        # Add before /* End PBXBuildFile section */
        end_build_file_pattern = r'/\* End PBXBuildFile section \*/'
        if re.search(end_build_file_pattern, new_content):
            new_content = re.sub(
                end_build_file_pattern,
                script_phase_entry + '\n\t\t/* End PBXBuildFile section */',
                new_content
            )
    
    # Backup original
    backup_path = pbxproj_path + '.backup'
    with open(backup_path, 'w', encoding='utf-8') as f:
        f.write(content)
    
    # Write new content
    with open(pbxproj_path, 'w', encoding='utf-8') as f:
        f.write(new_content)
    
    print(f"✓ Added Run Script Build Phase to {target_name}")
    print(f"✓ Backup saved to: {backup_path}")
    return True

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: python3 auto_add_fix_script.py <path_to_project.pbxproj> [target_name] [script_path]")
        print("Example: python3 auto_add_fix_script.py SDKeKYC_IOS.xcodeproj/project.pbxproj")
        sys.exit(1)
    
    pbxproj_path = sys.argv[1]
    target_name = sys.argv[2] if len(sys.argv) > 2 else "SDKeKYC_IOS"
    # Default script path - try scripts/ directory first, fallback to root
    if len(sys.argv) > 3:
        script_path = sys.argv[3]
    else:
        # Use find command to locate script in scripts/ directory, with fallback
        # Escape properly for shell script in Xcode Build Phase
        script_path = 'SCRIPT_PATH=$(find "${SRCROOT}/.swiftpm/checkouts" -path "*/scripts/fix_frameworks_infoplist.sh" 2>/dev/null | head -1); if [ -n "$SCRIPT_PATH" ] && [ -f "$SCRIPT_PATH" ]; then "$SCRIPT_PATH"; fi'
    
    if add_run_script_phase(pbxproj_path, target_name, script_path):
        print("\n✓ Success! Run Script Build Phase added.")
        print("  Open Xcode project and verify in Build Phases tab.")
        sys.exit(0)
    else:
        print("\n✗ Failed to add Run Script Build Phase")
        sys.exit(1)
