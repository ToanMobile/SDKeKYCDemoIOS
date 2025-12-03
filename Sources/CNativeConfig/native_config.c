//
//  native_config.c
//  SDKCore
//
//  Native configuration implementation for iOS
//  Equivalent to Android's libnative-config.so
//

#include "include/native_config.h"

// Environment: DEV
// BASE_URL (APIGW) for DEV
static const char* DEV_APIGW_URL = "https://apigw.finos.asia";
// BASE_URL_API for DEV
static const char* DEV_API_URL = "https://api.finos.asia";

// Environment: PROD
// BASE_URL (APIGW) for PROD
static const char* PROD_APIGW_URL = "https://apigw.prod.finos.asia/";
// BASE_URL_API for PROD
static const char* PROD_API_URL = "https://api.prod.finos.asia/";

/**
 * Get DEV APIGW URL
 */
const char* getNativeDevApigwURL(void) {
    return DEV_APIGW_URL;
}

/**
 * Get DEV API URL
 */
const char* getNativeDevApiURL(void) {
    return DEV_API_URL;
}

/**
 * Get PROD APIGW URL
 */
const char* getNativeProdApigwURL(void) {
    return PROD_APIGW_URL;
}

/**
 * Get PROD API URL
 */
const char* getNativeProdApiURL(void) {
    return PROD_API_URL;
}

