//
//  native_config.h
//  SDKCore
//
//  Native configuration library for iOS
//  Equivalent to Android's libnative-config.so
//

#ifndef native_config_h
#define native_config_h

#ifdef __cplusplus
extern "C" {
#endif

/**
 * Get DEV APIGW URL (BASE_URL for DEV)
 * @return DEV APIGW URL string (must not be freed by caller)
 */
const char* getNativeDevApigwURL(void);

/**
 * Get DEV API URL (BASE_URL_API for DEV)
 * @return DEV API URL string (must not be freed by caller)
 */
const char* getNativeDevApiURL(void);

/**
 * Get PROD APIGW URL (BASE_URL for PROD)
 * @return PROD APIGW URL string (must not be freed by caller)
 */
const char* getNativeProdApigwURL(void);

/**
 * Get PROD API URL (BASE_URL_API for PROD)
 * @return PROD API URL string (must not be freed by caller)
 */
const char* getNativeProdApiURL(void);

#ifdef __cplusplus
}
#endif

#endif /* native_config_h */

