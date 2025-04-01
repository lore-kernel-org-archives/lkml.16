Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C9120DD43
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 17:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743526816; cv=none; b=ue6kX6hwTTW42QnB6nhuudSbwFMZlkpkt+Y8D9plmPZoRhgV0AAWkXLEyugA5dSsQQYRELoztyzs54rgUBEp7V/S1p5xXSWQSxAGXpURDb0Uw6oWyRn2MExXoUWYBbhjis0nSd44RrE69o8GiC3DUaBT9ktpBUSorgWnKNXHmy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743526816; c=relaxed/simple;
	bh=hlzmE8prqMc9nZzcnbktxRVznxIGQtp9lQLNTgqI1pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h2x8MN8KNXTMSb28JsovDn1PsLQvAhg9z8NtgMRA9EAAFZfIZu97g9VweUkcYFtL2a2jPoMGqkNbPRHNBrnHseEn1Fr3E8AzyrNv4RE3ipFPyONGYSvDedQn4KII1QUzaw4PEB4+kgPhZXLGgCuvxS3ZXjUHuxxjnb9YzarNdYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LI6t7M2z; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LI6t7M2z"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso55370395e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 10:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743526809; x=1744131609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBY1/kg4kjBJyP71RXqJVRWXiXwUXG4V5OuWsQC8Kok=;
        b=LI6t7M2zdpSIB7N+qo2kfmC8HbbZ339zki3r9MdjPCPdnwRbym6lVT2a/k6r4bWgYO
         xKhKNdgyEnhBy7hadi3n0oBFBWtKmw5Zl6XIl8WTZg1fdplpBWt8gRxaiPNUXSkXtEwq
         hZxjh7DWh+EiG14W2I5ZDQ87k2yIQlSXa1qv+H9AhU4k8JcQA3S51ioyljes8orcgUiF
         uTfXJVXLRnLrVub9M9zfl57ikytC6x5IntDqmF3a/T93x9GTUMtw6eqyqRlkGP+MBlHj
         3FTyKDNz63M3oke8/xkB5rw2QCb8UaIEsg2uALBvBch9G0VECb4XkGJ5bwS7MRLWONaD
         vY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743526809; x=1744131609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBY1/kg4kjBJyP71RXqJVRWXiXwUXG4V5OuWsQC8Kok=;
        b=eFWrPbR6vX5QMFPTMzne/iqr/Ukfo8Ppl6iUllHBR8MG7oVNmHH33p4TdBh66qdz3L
         xLwMAVXEZxaqE+d51lVMhUAYIqTH1qKoenP1HXUaunxbeOO8Zuo4GoK4+WL+ZfF6biIu
         VMWWnLF3og/Ml9h5+fmIswPQzXioWkheccBlLsIYbOedDisZ1C5V0nNNHuT8+RmnLDkD
         x4oYrv27KLq9+0+SYGKSvo4Nvp3kFBAZBZ5gRNTPX/yT8u+a5b5TxiQsozj16sCBlbCG
         NwJaCiV+y7zZYCqb3DnisSUz4ZpcLu8m1HLcp4eSPmOxxRhkqGUZBoh/Ud8RR3AGCDCk
         N+Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWXRVfLiqH4MxwTQy2q01udSPlEl+5InKVXD3DrhiGlXJZMP+1WfUx6IAnp5hVYY3TUy0/lYLwaMk1Nu18=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFekMW8LqeI+nB//qi4aronKoJS0sOumTVIrSckNAG38oHQt2Y
	k0SN/cKFXziLGZIsndZMWo3F8pCRyLmDh5rR+Gl2xba3SJBbHv1F6IlQ1vzs4XA=
X-Gm-Gg: ASbGncuFjk/U4CZXbdHO44K2Eb2f+yGLF/8L6PidNAM84ioBKKxTURPvaPU9HSrLD8A
	o3xk+MBM0TIG140kNsgTEdTImB2/6MyxXSErM6ScPiyeTFWK1mhRC17dLjQwWHGmNqowKk3Nnlu
	trThsxVJkjXciWB0TVLRJVNFV/PaZwXH3oycx+bxIUFHcHiIJhmhl2ABFG+aWD0HEJkEaB0EHdd
	jGvLk93PlKhXFtx9UGdXOrku/gJVoCOSRLrhn7btZVZ1PWWA1/NSGRove+0K2rVernamxgIlZr1
	0eoIyQdsNppWkKE/s8SwVQg4HNffW2PeYZvQqou53TTk8PQYjQ==
X-Google-Smtp-Source: AGHT+IEVI1ci0mOKwwIvU/nmccJGGvWpW1vzl780D1zsAQUiDUgeHjlVAhJ9M1nVXHjKfVusmwyR6Q==
X-Received: by 2002:a05:600c:1382:b0:43c:e7ae:4bc9 with SMTP id 5b1f17b1804b1-43db61e0348mr105475955e9.1.1743526808519;
        Tue, 01 Apr 2025 10:00:08 -0700 (PDT)
Received: from pc.. ([41.206.42.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fccfe2fsm161520215e9.22.2025.04.01.10.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 10:00:07 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] staging: rtl8723bs: Rename variables
Date: Tue,  1 Apr 2025 19:59:35 +0300
Message-ID: <c82a6c26eda3389458820938f439d4aa04e582d9.1743524096.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743524096.git.karanja99erick@gmail.com>
References: <cover.1743524096.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename  variables to adhere to Linux kernel coding
standards by using snake_case instead of CamelCase
and ensure proper encoding of the variables by removing
initial 'p' for pointers and initial 'b' for boolean.

    Fixes checkpatch.pl warning:
        CHECK: Avoid CamelCase: <supportRateNum>

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   | 1266 ++++++++---------
 1 file changed, 633 insertions(+), 633 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index b3d7f50fac4c..e3c67f98e8c0 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -16,74 +16,74 @@ static struct coex_sta_8723b_1ant *pCoexSta = &GLCoexSta8723b1Ant;
 /*  local function proto type if needed */
 /*  local function start with halbtc8723b1ant_ */
 static u8 halbtc8723b1ant_BtRssiState(
-	u8 levelNum, u8 rssiThresh, u8 rssiThresh1
+	u8 level_num, u8 rssi_thresh, u8 rssi_thresh1
 )
 {
-	s32 btRssi = 0;
-	u8 btRssiState = pCoexSta->preBtRssiState;
+	s32 bt_rssi = 0;
+	u8 bt_rssi_state = pCoexSta->preBtRssiState;
 
-	btRssi = pCoexSta->btRssi;
+	bt_rssi = pCoexSta->bt_rssi;
 
-	if (levelNum == 2) {
+	if (level_num == 2) {
 		if (
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_LOW) ||
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_LOW)
 		) {
-			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT))
+			if (bt_rssi >= (rssi_thresh + BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT))
 
-				btRssiState = BTC_RSSI_STATE_HIGH;
+				bt_rssi_state = BTC_RSSI_STATE_HIGH;
 			else
-				btRssiState = BTC_RSSI_STATE_STAY_LOW;
+				bt_rssi_state = BTC_RSSI_STATE_STAY_LOW;
 		} else {
-			if (btRssi < rssiThresh)
-				btRssiState = BTC_RSSI_STATE_LOW;
+			if (bt_rssi < rssi_thresh)
+				bt_rssi_state = BTC_RSSI_STATE_LOW;
 			else
-				btRssiState = BTC_RSSI_STATE_STAY_HIGH;
+				bt_rssi_state = BTC_RSSI_STATE_STAY_HIGH;
 		}
-	} else if (levelNum == 3) {
-		if (rssiThresh > rssiThresh1)
+	} else if (level_num == 3) {
+		if (rssi_thresh > rssi_thresh1)
 			return pCoexSta->preBtRssiState;
 
 		if (
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_LOW) ||
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_LOW)
 		) {
-			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT))
-				btRssiState = BTC_RSSI_STATE_MEDIUM;
+			if (bt_rssi >= (rssi_thresh + BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT))
+				bt_rssi_state = BTC_RSSI_STATE_MEDIUM;
 			else
-				btRssiState = BTC_RSSI_STATE_STAY_LOW;
+				bt_rssi_state = BTC_RSSI_STATE_STAY_LOW;
 		} else if (
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_MEDIUM) ||
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_MEDIUM)
 		) {
-			if (btRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT))
-				btRssiState = BTC_RSSI_STATE_HIGH;
-			else if (btRssi < rssiThresh)
-				btRssiState = BTC_RSSI_STATE_LOW;
+			if (bt_rssi >= (rssi_thresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT))
+				bt_rssi_state = BTC_RSSI_STATE_HIGH;
+			else if (bt_rssi < rssi_thresh)
+				bt_rssi_state = BTC_RSSI_STATE_LOW;
 			else
-				btRssiState = BTC_RSSI_STATE_STAY_MEDIUM;
+				bt_rssi_state = BTC_RSSI_STATE_STAY_MEDIUM;
 		} else {
-			if (btRssi < rssiThresh1)
-				btRssiState = BTC_RSSI_STATE_MEDIUM;
+			if (bt_rssi < rssi_thresh1)
+				bt_rssi_state = BTC_RSSI_STATE_MEDIUM;
 			else
-				btRssiState = BTC_RSSI_STATE_STAY_HIGH;
+				bt_rssi_state = BTC_RSSI_STATE_STAY_HIGH;
 		}
 	}
 
-	pCoexSta->preBtRssiState = btRssiState;
+	pCoexSta->preBtRssiState = bt_rssi_state;
 
-	return btRssiState;
+	return bt_rssi_state;
 }
 
 static void halbtc8723b1ant_UpdateRaMask(
-	struct btc_coexist *pBtCoexist, bool bForceExec, u32 disRateMask
+	struct btc_coexist *bt_coexist, bool force_exec, u32 dis_rate_mask
 )
 {
-	pCoexDm->curRaMask = disRateMask;
+	pCoexDm->curRaMask = dis_rate_mask;
 
-	if (bForceExec || (pCoexDm->preRaMask != pCoexDm->curRaMask))
-		pBtCoexist->fBtcSet(
-			pBtCoexist,
+	if (force_exec || (pCoexDm->preRaMask != pCoexDm->curRaMask))
+		bt_coexist->fBtcSet(
+			bt_coexist,
 			BTC_SET_ACT_UPDATE_RAMASK,
 			&pCoexDm->curRaMask
 		);
@@ -91,33 +91,33 @@ static void halbtc8723b1ant_UpdateRaMask(
 }
 
 static void halbtc8723b1ant_AutoRateFallbackRetry(
-	struct btc_coexist *pBtCoexist, bool bForceExec, u8 type
+	struct btc_coexist *bt_coexist, bool force_exec, u8 type
 )
 {
-	bool bWifiUnderBMode = false;
+	bool wifi_under_b_mode = false;
 
 	pCoexDm->curArfrType = type;
 
-	if (bForceExec || (pCoexDm->preArfrType != pCoexDm->curArfrType)) {
+	if (force_exec || (pCoexDm->preArfrType != pCoexDm->curArfrType)) {
 		switch (pCoexDm->curArfrType) {
 		case 0:	/*  normal mode */
-			pBtCoexist->fBtcWrite4Byte(
-				pBtCoexist, 0x430, pCoexDm->backupArfrCnt1
+			bt_coexist->fBtcWrite4Byte(
+				bt_coexist, 0x430, pCoexDm->backupArfrCnt1
 			);
-			pBtCoexist->fBtcWrite4Byte(
-				pBtCoexist, 0x434, pCoexDm->backupArfrCnt2
+			bt_coexist->fBtcWrite4Byte(
+				bt_coexist, 0x434, pCoexDm->backupArfrCnt2
 			);
 			break;
 		case 1:
-			pBtCoexist->fBtcGet(
-				pBtCoexist, BTC_GET_BL_WIFI_UNDER_B_MODE, &bWifiUnderBMode
+			bt_coexist->fBtcGet(
+				bt_coexist, BTC_GET_BL_WIFI_UNDER_B_MODE, &wifi_under_b_mode
 			);
-			if (bWifiUnderBMode) {
-				pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x430, 0x0);
-				pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x434, 0x01010101);
+			if (wifi_under_b_mode) {
+				bt_coexist->fBtcWrite4Byte(bt_coexist, 0x430, 0x0);
+				bt_coexist->fBtcWrite4Byte(bt_coexist, 0x434, 0x01010101);
 			} else {
-				pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x430, 0x0);
-				pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x434, 0x04030201);
+				bt_coexist->fBtcWrite4Byte(bt_coexist, 0x430, 0x0);
+				bt_coexist->fBtcWrite4Byte(bt_coexist, 0x434, 0x04030201);
 			}
 			break;
 		default:
@@ -129,23 +129,23 @@ static void halbtc8723b1ant_AutoRateFallbackRetry(
 }
 
 static void halbtc8723b1ant_RetryLimit(
-	struct btc_coexist *pBtCoexist, bool bForceExec, u8 type
+	struct btc_coexist *bt_coexist, bool force_exec, u8 type
 )
 {
 	pCoexDm->curRetryLimitType = type;
 
 	if (
-		bForceExec ||
+		force_exec ||
 		(pCoexDm->preRetryLimitType != pCoexDm->curRetryLimitType)
 	) {
 		switch (pCoexDm->curRetryLimitType) {
 		case 0:	/*  normal mode */
-			pBtCoexist->fBtcWrite2Byte(
-				pBtCoexist, 0x42a, pCoexDm->backupRetryLimit
+			bt_coexist->fBtcWrite2Byte(
+				bt_coexist, 0x42a, pCoexDm->backupRetryLimit
 			);
 			break;
 		case 1:	/*  retry limit =8 */
-			pBtCoexist->fBtcWrite2Byte(pBtCoexist, 0x42a, 0x0808);
+			bt_coexist->fBtcWrite2Byte(bt_coexist, 0x42a, 0x0808);
 			break;
 		default:
 			break;
@@ -156,22 +156,22 @@ static void halbtc8723b1ant_RetryLimit(
 }
 
 static void halbtc8723b1ant_AmpduMaxTime(
-	struct btc_coexist *pBtCoexist, bool bForceExec, u8 type
+	struct btc_coexist *bt_coexist, bool force_exec, u8 type
 )
 {
 	pCoexDm->curAmpduTimeType = type;
 
 	if (
-		bForceExec || (pCoexDm->preAmpduTimeType != pCoexDm->curAmpduTimeType)
+		force_exec || (pCoexDm->preAmpduTimeType != pCoexDm->curAmpduTimeType)
 	) {
 		switch (pCoexDm->curAmpduTimeType) {
 		case 0:	/*  normal mode */
-			pBtCoexist->fBtcWrite1Byte(
-				pBtCoexist, 0x456, pCoexDm->backupAmpduMaxTime
+			bt_coexist->fBtcWrite1Byte(
+				bt_coexist, 0x456, pCoexDm->backupAmpduMaxTime
 			);
 			break;
 		case 1:	/*  AMPDU timw = 0x38 * 32us */
-			pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x456, 0x38);
+			bt_coexist->fBtcWrite1Byte(bt_coexist, 0x456, 0x38);
 			break;
 		default:
 			break;
@@ -182,64 +182,64 @@ static void halbtc8723b1ant_AmpduMaxTime(
 }
 
 static void halbtc8723b1ant_LimitedTx(
-	struct btc_coexist *pBtCoexist,
-	bool bForceExec,
-	u8 raMaskType,
-	u8 arfrType,
-	u8 retryLimitType,
-	u8 ampduTimeType
+	struct btc_coexist *bt_coexist,
+	bool force_exec,
+	u8 ra_mask_type,
+	u8 arfr_type,
+	u8 retry_limit_type,
+	u8 ampdu_time_type
 )
 {
-	switch (raMaskType) {
+	switch (ra_mask_type) {
 	case 0:	/*  normal mode */
-		halbtc8723b1ant_UpdateRaMask(pBtCoexist, bForceExec, 0x0);
+		halbtc8723b1ant_UpdateRaMask(bt_coexist, force_exec, 0x0);
 		break;
 	case 1:	/*  disable cck 1/2 */
-		halbtc8723b1ant_UpdateRaMask(pBtCoexist, bForceExec, 0x00000003);
+		halbtc8723b1ant_UpdateRaMask(bt_coexist, force_exec, 0x00000003);
 		break;
 	case 2:	/*  disable cck 1/2/5.5, ofdm 6/9/12/18/24, mcs 0/1/2/3/4 */
-		halbtc8723b1ant_UpdateRaMask(pBtCoexist, bForceExec, 0x0001f1f7);
+		halbtc8723b1ant_UpdateRaMask(bt_coexist, force_exec, 0x0001f1f7);
 		break;
 	default:
 		break;
 	}
 
-	halbtc8723b1ant_AutoRateFallbackRetry(pBtCoexist, bForceExec, arfrType);
-	halbtc8723b1ant_RetryLimit(pBtCoexist, bForceExec, retryLimitType);
-	halbtc8723b1ant_AmpduMaxTime(pBtCoexist, bForceExec, ampduTimeType);
+	halbtc8723b1ant_AutoRateFallbackRetry(bt_coexist, force_exec, arfr_type);
+	halbtc8723b1ant_RetryLimit(bt_coexist, force_exec, retry_limit_type);
+	halbtc8723b1ant_AmpduMaxTime(bt_coexist, force_exec, ampdu_time_type);
 }
 
 static void halbtc8723b1ant_LimitedRx(
-	struct btc_coexist *pBtCoexist,
-	bool bForceExec,
-	bool bRejApAggPkt,
-	bool bBtCtrlAggBufSize,
-	u8 aggBufSize
+	struct btc_coexist *bt_coexist,
+	bool force_exec,
+	bool rej_ap_agg_pkt,
+	bool bt_ctrl_agg_buf_size,
+	u8 agg_buf_size
 )
 {
-	bool bRejectRxAgg = bRejApAggPkt;
-	bool bBtCtrlRxAggSize = bBtCtrlAggBufSize;
-	u8 rxAggSize = aggBufSize;
+	bool bRejectRxAgg = rej_ap_agg_pkt;
+	bool bBtCtrlRxAggSize = bt_ctrl_agg_buf_size;
+	u8 rxAggSize = agg_buf_size;
 
 	/*  */
 	/*	Rx Aggregation related setting */
 	/*  */
-	pBtCoexist->fBtcSet(
-		pBtCoexist, BTC_SET_BL_TO_REJ_AP_AGG_PKT, &bRejectRxAgg
+	bt_coexist->fBtcSet(
+		bt_coexist, BTC_SET_BL_TO_REJ_AP_AGG_PKT, &bRejectRxAgg
 	);
 	/*  decide BT control aggregation buf size or not */
-	pBtCoexist->fBtcSet(
-		pBtCoexist, BTC_SET_BL_BT_CTRL_AGG_SIZE, &bBtCtrlRxAggSize
+	bt_coexist->fBtcSet(
+		bt_coexist, BTC_SET_BL_BT_CTRL_AGG_SIZE, &bBtCtrlRxAggSize
 	);
 	/*  aggregation buf size, only work when BT control Rx aggregation size. */
-	pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_U1_AGG_BUF_SIZE, &rxAggSize);
+	bt_coexist->fBtcSet(bt_coexist, BTC_SET_U1_AGG_BUF_SIZE, &rxAggSize);
 	/*  real update aggregation setting */
-	pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_ACT_AGGREGATE_CTRL, NULL);
+	bt_coexist->fBtcSet(bt_coexist, BTC_SET_ACT_AGGREGATE_CTRL, NULL);
 
 
 }
 
-static void halbtc8723b1ant_QueryBtInfo(struct btc_coexist *pBtCoexist)
+static void halbtc8723b1ant_QueryBtInfo(struct btc_coexist *bt_coexist)
 {
 	u8 H2C_Parameter[1] = {0};
 
@@ -247,17 +247,17 @@ static void halbtc8723b1ant_QueryBtInfo(struct btc_coexist *pBtCoexist)
 
 	H2C_Parameter[0] |= BIT0;	/*  trigger */
 
-	pBtCoexist->fBtcFillH2c(pBtCoexist, 0x61, 1, H2C_Parameter);
+	bt_coexist->fBtcFillH2c(bt_coexist, 0x61, 1, H2C_Parameter);
 }
 
-static void halbtc8723b1ant_MonitorBtCtr(struct btc_coexist *pBtCoexist)
+static void halbtc8723b1ant_MonitorBtCtr(struct btc_coexist *bt_coexist)
 {
 	u32 regHPTxRx, regLPTxRx, u4Tmp;
 	u32 regHPTx = 0, regHPRx = 0, regLPTx = 0, regLPRx = 0;
 	static u8 NumOfBtCounterChk;
 
        /* to avoid 0x76e[3] = 1 (WLAN_Act control by PTA) during IPS */
-	/* if (! (pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x76e) & 0x8)) */
+	/* if (! (bt_coexist->fBtcRead1Byte(bt_coexist, 0x76e) & 0x8)) */
 
 	if (pCoexSta->bUnderIps) {
 		pCoexSta->highPriorityTx = 65535;
@@ -270,11 +270,11 @@ static void halbtc8723b1ant_MonitorBtCtr(struct btc_coexist *pBtCoexist)
 	regHPTxRx = 0x770;
 	regLPTxRx = 0x774;
 
-	u4Tmp = pBtCoexist->fBtcRead4Byte(pBtCoexist, regHPTxRx);
+	u4Tmp = bt_coexist->fBtcRead4Byte(bt_coexist, regHPTxRx);
 	regHPTx = u4Tmp & bMaskLWord;
 	regHPRx = (u4Tmp & bMaskHWord) >> 16;
 
-	u4Tmp = pBtCoexist->fBtcRead4Byte(pBtCoexist, regLPTxRx);
+	u4Tmp = bt_coexist->fBtcRead4Byte(bt_coexist, regLPTxRx);
 	regLPTx = u4Tmp & bMaskLWord;
 	regLPRx = (u4Tmp & bMaskHWord) >> 16;
 
@@ -287,28 +287,28 @@ static void halbtc8723b1ant_MonitorBtCtr(struct btc_coexist *pBtCoexist)
 		pCoexSta->popEventCnt++;
 
 	/*  reset counter */
-	pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x76e, 0xc);
+	bt_coexist->fBtcWrite1Byte(bt_coexist, 0x76e, 0xc);
 
 	if ((regHPTx == 0) && (regHPRx == 0) && (regLPTx == 0) && (regLPRx == 0)) {
 		NumOfBtCounterChk++;
 		if (NumOfBtCounterChk >= 3) {
-			halbtc8723b1ant_QueryBtInfo(pBtCoexist);
+			halbtc8723b1ant_QueryBtInfo(bt_coexist);
 			NumOfBtCounterChk = 0;
 		}
 	}
 }
 
 
-static void halbtc8723b1ant_MonitorWiFiCtr(struct btc_coexist *pBtCoexist)
+static void halbtc8723b1ant_MonitorWiFiCtr(struct btc_coexist *bt_coexist)
 {
-	s32	wifiRssi = 0;
-	bool bWifiBusy = false, bWifiUnderBMode = false;
+	s32	wifi_rssi = 0;
+	bool wifi_busy = false, wifi_under_b_mode = false;
 	static u8 nCCKLockCounter;
 
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_BUSY, &bWifiBusy);
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_S4_WIFI_RSSI, &wifiRssi);
-	pBtCoexist->fBtcGet(
-		pBtCoexist, BTC_GET_BL_WIFI_UNDER_B_MODE, &bWifiUnderBMode
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_BUSY, &wifi_busy);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_S4_WIFI_RSSI, &wifi_rssi);
+	bt_coexist->fBtcGet(
+		bt_coexist, BTC_GET_BL_WIFI_UNDER_B_MODE, &wifi_under_b_mode
 	);
 
 	if (pCoexSta->bUnderIps) {
@@ -322,23 +322,23 @@ static void halbtc8723b1ant_MonitorWiFiCtr(struct btc_coexist *pBtCoexist)
 		pCoexSta->nCRCErr_11n = 0;
 		pCoexSta->nCRCErr_11nAgg = 0;
 	} else {
-		pCoexSta->nCRCOK_CCK	= pBtCoexist->fBtcRead4Byte(pBtCoexist, 0xf88);
-		pCoexSta->nCRCOK_11g	= pBtCoexist->fBtcRead2Byte(pBtCoexist, 0xf94);
-		pCoexSta->nCRCOK_11n	= pBtCoexist->fBtcRead2Byte(pBtCoexist, 0xf90);
-		pCoexSta->nCRCOK_11nAgg = pBtCoexist->fBtcRead2Byte(pBtCoexist, 0xfb8);
+		pCoexSta->nCRCOK_CCK	= bt_coexist->fBtcRead4Byte(bt_coexist, 0xf88);
+		pCoexSta->nCRCOK_11g	= bt_coexist->fBtcRead2Byte(bt_coexist, 0xf94);
+		pCoexSta->nCRCOK_11n	= bt_coexist->fBtcRead2Byte(bt_coexist, 0xf90);
+		pCoexSta->nCRCOK_11nAgg = bt_coexist->fBtcRead2Byte(bt_coexist, 0xfb8);
 
-		pCoexSta->nCRCErr_CCK	 = pBtCoexist->fBtcRead4Byte(pBtCoexist, 0xf84);
-		pCoexSta->nCRCErr_11g	 = pBtCoexist->fBtcRead2Byte(pBtCoexist, 0xf96);
-		pCoexSta->nCRCErr_11n	 = pBtCoexist->fBtcRead2Byte(pBtCoexist, 0xf92);
-		pCoexSta->nCRCErr_11nAgg = pBtCoexist->fBtcRead2Byte(pBtCoexist, 0xfba);
+		pCoexSta->nCRCErr_CCK	 = bt_coexist->fBtcRead4Byte(bt_coexist, 0xf84);
+		pCoexSta->nCRCErr_11g	 = bt_coexist->fBtcRead2Byte(bt_coexist, 0xf96);
+		pCoexSta->nCRCErr_11n	 = bt_coexist->fBtcRead2Byte(bt_coexist, 0xf92);
+		pCoexSta->nCRCErr_11nAgg = bt_coexist->fBtcRead2Byte(bt_coexist, 0xfba);
 	}
 
 
 	/* reset counter */
-	pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0xf16, 0x1, 0x1);
-	pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0xf16, 0x1, 0x0);
+	bt_coexist->fBtcWrite1ByteBitMask(bt_coexist, 0xf16, 0x1, 0x1);
+	bt_coexist->fBtcWrite1ByteBitMask(bt_coexist, 0xf16, 0x1, 0x0);
 
-	if (bWifiBusy && (wifiRssi >= 30) && !bWifiUnderBMode) {
+	if (wifi_busy && (wifi_rssi >= 30) && !wifi_under_b_mode) {
 		if (
 			(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_BUSY) ||
 			(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY) ||
@@ -385,24 +385,24 @@ static void halbtc8723b1ant_MonitorWiFiCtr(struct btc_coexist *pBtCoexist)
 
 }
 
-static bool halbtc8723b1ant_IsWifiStatusChanged(struct btc_coexist *pBtCoexist)
+static bool halbtc8723b1ant_IsWifiStatusChanged(struct btc_coexist *bt_coexist)
 {
 	static bool	bPreWifiBusy, bPreUnder4way, bPreBtHsOn;
-	bool bWifiBusy = false, bUnder4way = false, bBtHsOn = false;
+	bool wifi_busy = false, bUnder4way = false, bBtHsOn = false;
 	bool bWifiConnected = false;
 
-	pBtCoexist->fBtcGet(
-		pBtCoexist, BTC_GET_BL_WIFI_CONNECTED, &bWifiConnected
+	bt_coexist->fBtcGet(
+		bt_coexist, BTC_GET_BL_WIFI_CONNECTED, &bWifiConnected
 	);
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_BUSY, &bWifiBusy);
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_HS_OPERATION, &bBtHsOn);
-	pBtCoexist->fBtcGet(
-		pBtCoexist, BTC_GET_BL_WIFI_4_WAY_PROGRESS, &bUnder4way
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_BUSY, &wifi_busy);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_HS_OPERATION, &bBtHsOn);
+	bt_coexist->fBtcGet(
+		bt_coexist, BTC_GET_BL_WIFI_4_WAY_PROGRESS, &bUnder4way
 	);
 
 	if (bWifiConnected) {
-		if (bWifiBusy != bPreWifiBusy) {
-			bPreWifiBusy = bWifiBusy;
+		if (wifi_busy != bPreWifiBusy) {
+			bPreWifiBusy = wifi_busy;
 			return true;
 		}
 
@@ -420,12 +420,12 @@ static bool halbtc8723b1ant_IsWifiStatusChanged(struct btc_coexist *pBtCoexist)
 	return false;
 }
 
-static void halbtc8723b1ant_UpdateBtLinkInfo(struct btc_coexist *pBtCoexist)
+static void halbtc8723b1ant_UpdateBtLinkInfo(struct btc_coexist *bt_coexist)
 {
-	struct btc_bt_link_info *pBtLinkInfo = &pBtCoexist->btLinkInfo;
+	struct btc_bt_link_info *pBtLinkInfo = &bt_coexist->btLinkInfo;
 	bool bBtHsOn = false;
 
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_HS_OPERATION, &bBtHsOn);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_HS_OPERATION, &bBtHsOn);
 
 	pBtLinkInfo->bBtLinkExist = pCoexSta->bBtLinkExist;
 	pBtLinkInfo->bScoExist = pCoexSta->bScoExist;
@@ -484,14 +484,14 @@ static void halbtc8723b1ant_UpdateBtLinkInfo(struct btc_coexist *pBtCoexist)
 		pBtLinkInfo->bHidOnly = false;
 }
 
-static u8 halbtc8723b1ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
+static u8 halbtc8723b1ant_ActionAlgorithm(struct btc_coexist *bt_coexist)
 {
-	struct btc_bt_link_info *pBtLinkInfo = &pBtCoexist->btLinkInfo;
+	struct btc_bt_link_info *pBtLinkInfo = &bt_coexist->btLinkInfo;
 	bool bBtHsOn = false;
 	u8 algorithm = BT_8723B_1ANT_COEX_ALGO_UNDEFINED;
 	u8 numOfDiffProfile = 0;
 
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_HS_OPERATION, &bBtHsOn);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_HS_OPERATION, &bBtHsOn);
 
 	if (!pBtLinkInfo->bBtLinkExist)
 		return algorithm;
@@ -594,7 +594,7 @@ static u8 halbtc8723b1ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 }
 
 static void halbtc8723b1ant_SetSwPenaltyTxRateAdaptive(
-	struct btc_coexist *pBtCoexist, bool bLowPenaltyRa
+	struct btc_coexist *bt_coexist, bool bLowPenaltyRa
 )
 {
 	u8 H2C_Parameter[6] = {0};
@@ -609,46 +609,46 @@ static void halbtc8723b1ant_SetSwPenaltyTxRateAdaptive(
 		H2C_Parameter[5] = 0xf9;	/* MCS5 or OFDM36 */
 	}
 
-	pBtCoexist->fBtcFillH2c(pBtCoexist, 0x69, 6, H2C_Parameter);
+	bt_coexist->fBtcFillH2c(bt_coexist, 0x69, 6, H2C_Parameter);
 }
 
 static void halbtc8723b1ant_LowPenaltyRa(
-	struct btc_coexist *pBtCoexist, bool bForceExec, bool bLowPenaltyRa
+	struct btc_coexist *bt_coexist, bool force_exec, bool bLowPenaltyRa
 )
 {
 	pCoexDm->bCurLowPenaltyRa = bLowPenaltyRa;
 
-	if (!bForceExec) {
+	if (!force_exec) {
 		if (pCoexDm->bPreLowPenaltyRa == pCoexDm->bCurLowPenaltyRa)
 			return;
 	}
 	halbtc8723b1ant_SetSwPenaltyTxRateAdaptive(
-		pBtCoexist, pCoexDm->bCurLowPenaltyRa
+		bt_coexist, pCoexDm->bCurLowPenaltyRa
 	);
 
 	pCoexDm->bPreLowPenaltyRa = pCoexDm->bCurLowPenaltyRa;
 }
 
 static void halbtc8723b1ant_SetCoexTable(
-	struct btc_coexist *pBtCoexist,
+	struct btc_coexist *bt_coexist,
 	u32 val0x6c0,
 	u32 val0x6c4,
 	u32 val0x6c8,
 	u8 val0x6cc
 )
 {
-	pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x6c0, val0x6c0);
+	bt_coexist->fBtcWrite4Byte(bt_coexist, 0x6c0, val0x6c0);
 
-	pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x6c4, val0x6c4);
+	bt_coexist->fBtcWrite4Byte(bt_coexist, 0x6c4, val0x6c4);
 
-	pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x6c8, val0x6c8);
+	bt_coexist->fBtcWrite4Byte(bt_coexist, 0x6c8, val0x6c8);
 
-	pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x6cc, val0x6cc);
+	bt_coexist->fBtcWrite1Byte(bt_coexist, 0x6cc, val0x6cc);
 }
 
 static void halbtc8723b1ant_CoexTable(
-	struct btc_coexist *pBtCoexist,
-	bool bForceExec,
+	struct btc_coexist *bt_coexist,
+	bool force_exec,
 	u32 val0x6c0,
 	u32 val0x6c4,
 	u32 val0x6c8,
@@ -660,7 +660,7 @@ static void halbtc8723b1ant_CoexTable(
 	pCoexDm->curVal0x6c8 = val0x6c8;
 	pCoexDm->curVal0x6cc = val0x6cc;
 
-	if (!bForceExec) {
+	if (!force_exec) {
 		if (
 			(pCoexDm->preVal0x6c0 == pCoexDm->curVal0x6c0) &&
 		    (pCoexDm->preVal0x6c4 == pCoexDm->curVal0x6c4) &&
@@ -671,7 +671,7 @@ static void halbtc8723b1ant_CoexTable(
 	}
 
 	halbtc8723b1ant_SetCoexTable(
-		pBtCoexist, val0x6c0, val0x6c4, val0x6c8, val0x6cc
+		bt_coexist, val0x6c0, val0x6c4, val0x6c8, val0x6cc
 	);
 
 	pCoexDm->preVal0x6c0 = pCoexDm->curVal0x6c0;
@@ -681,7 +681,7 @@ static void halbtc8723b1ant_CoexTable(
 }
 
 static void halbtc8723b1ant_CoexTableWithType(
-	struct btc_coexist *pBtCoexist, bool bForceExec, u8 type
+	struct btc_coexist *bt_coexist, bool force_exec, u8 type
 )
 {
 	pCoexSta->nCoexTableType = type;
@@ -689,42 +689,42 @@ static void halbtc8723b1ant_CoexTableWithType(
 	switch (type) {
 	case 0:
 		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0x55555555, 0x55555555, 0xffffff, 0x3
+			bt_coexist, force_exec, 0x55555555, 0x55555555, 0xffffff, 0x3
 		);
 		break;
 	case 1:
 		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0x55555555, 0x5a5a5a5a, 0xffffff, 0x3
+			bt_coexist, force_exec, 0x55555555, 0x5a5a5a5a, 0xffffff, 0x3
 		);
 		break;
 	case 2:
 		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0x5a5a5a5a, 0x5a5a5a5a, 0xffffff, 0x3
+			bt_coexist, force_exec, 0x5a5a5a5a, 0x5a5a5a5a, 0xffffff, 0x3
 		);
 		break;
 	case 3:
 		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0xaaaa5555, 0xaaaa5a5a, 0xffffff, 0x3
+			bt_coexist, force_exec, 0xaaaa5555, 0xaaaa5a5a, 0xffffff, 0x3
 		);
 		break;
 	case 4:
 		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0x55555555, 0xaaaa5a5a, 0xffffff, 0x3
+			bt_coexist, force_exec, 0x55555555, 0xaaaa5a5a, 0xffffff, 0x3
 		);
 		break;
 	case 5:
 		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0x5a5a5a5a, 0xaaaa5a5a, 0xffffff, 0x3
+			bt_coexist, force_exec, 0x5a5a5a5a, 0xaaaa5a5a, 0xffffff, 0x3
 		);
 		break;
 	case 6:
 		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0x55555555, 0xaaaaaaaa, 0xffffff, 0x3
+			bt_coexist, force_exec, 0x55555555, 0xaaaaaaaa, 0xffffff, 0x3
 		);
 		break;
 	case 7:
 		halbtc8723b1ant_CoexTable(
-			pBtCoexist, bForceExec, 0xaaaaaaaa, 0xaaaaaaaa, 0xffffff, 0x3
+			bt_coexist, force_exec, 0xaaaaaaaa, 0xaaaaaaaa, 0xffffff, 0x3
 		);
 		break;
 	default:
@@ -733,7 +733,7 @@ static void halbtc8723b1ant_CoexTableWithType(
 }
 
 static void halbtc8723b1ant_SetFwIgnoreWlanAct(
-	struct btc_coexist *pBtCoexist, bool bEnable
+	struct btc_coexist *bt_coexist, bool bEnable
 )
 {
 	u8 H2C_Parameter[1] = {0};
@@ -741,43 +741,43 @@ static void halbtc8723b1ant_SetFwIgnoreWlanAct(
 	if (bEnable)
 		H2C_Parameter[0] |= BIT0; /* function enable */
 
-	pBtCoexist->fBtcFillH2c(pBtCoexist, 0x63, 1, H2C_Parameter);
+	bt_coexist->fBtcFillH2c(bt_coexist, 0x63, 1, H2C_Parameter);
 }
 
 static void halbtc8723b1ant_IgnoreWlanAct(
-	struct btc_coexist *pBtCoexist, bool bForceExec, bool bEnable
+	struct btc_coexist *bt_coexist, bool force_exec, bool bEnable
 )
 {
 	pCoexDm->bCurIgnoreWlanAct = bEnable;
 
-	if (!bForceExec) {
+	if (!force_exec) {
 		if (pCoexDm->bPreIgnoreWlanAct == pCoexDm->bCurIgnoreWlanAct)
 			return;
 	}
-	halbtc8723b1ant_SetFwIgnoreWlanAct(pBtCoexist, bEnable);
+	halbtc8723b1ant_SetFwIgnoreWlanAct(bt_coexist, bEnable);
 
 	pCoexDm->bPreIgnoreWlanAct = pCoexDm->bCurIgnoreWlanAct;
 }
 
 static void halbtc8723b1ant_SetLpsRpwm(
-	struct btc_coexist *pBtCoexist, u8 lpsVal, u8 rpwmVal
+	struct btc_coexist *bt_coexist, u8 lpsVal, u8 rpwmVal
 )
 {
 	u8 lps = lpsVal;
 	u8 rpwm = rpwmVal;
 
-	pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_U1_LPS_VAL, &lps);
-	pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_U1_RPWM_VAL, &rpwm);
+	bt_coexist->fBtcSet(bt_coexist, BTC_SET_U1_LPS_VAL, &lps);
+	bt_coexist->fBtcSet(bt_coexist, BTC_SET_U1_RPWM_VAL, &rpwm);
 }
 
 static void halbtc8723b1ant_LpsRpwm(
-	struct btc_coexist *pBtCoexist, bool bForceExec, u8 lpsVal, u8 rpwmVal
+	struct btc_coexist *bt_coexist, bool force_exec, u8 lpsVal, u8 rpwmVal
 )
 {
 	pCoexDm->curLps = lpsVal;
 	pCoexDm->curRpwm = rpwmVal;
 
-	if (!bForceExec) {
+	if (!force_exec) {
 		if (
 			(pCoexDm->preLps == pCoexDm->curLps) &&
 			(pCoexDm->preRpwm == pCoexDm->curRpwm)
@@ -785,89 +785,89 @@ static void halbtc8723b1ant_LpsRpwm(
 			return;
 		}
 	}
-	halbtc8723b1ant_SetLpsRpwm(pBtCoexist, lpsVal, rpwmVal);
+	halbtc8723b1ant_SetLpsRpwm(bt_coexist, lpsVal, rpwmVal);
 
 	pCoexDm->preLps = pCoexDm->curLps;
 	pCoexDm->preRpwm = pCoexDm->curRpwm;
 }
 
 static void halbtc8723b1ant_SwMechanism(
-	struct btc_coexist *pBtCoexist, bool bLowPenaltyRA
+	struct btc_coexist *bt_coexist, bool bLowPenaltyRA
 )
 {
-	halbtc8723b1ant_LowPenaltyRa(pBtCoexist, NORMAL_EXEC, bLowPenaltyRA);
+	halbtc8723b1ant_LowPenaltyRa(bt_coexist, NORMAL_EXEC, bLowPenaltyRA);
 }
 
 static void halbtc8723b1ant_SetAntPath(
-	struct btc_coexist *pBtCoexist, u8 antPosType, bool bInitHwCfg, bool bWifiOff
+	struct btc_coexist *bt_coexist, u8 antPosType, bool bInitHwCfg, bool bWifiOff
 )
 {
-	struct btc_board_info *pBoardInfo = &pBtCoexist->boardInfo;
+	struct btc_board_info *pBoardInfo = &bt_coexist->boardInfo;
 	u32 fwVer = 0, u4Tmp = 0, cntBtCalChk = 0;
 	bool bPgExtSwitch = false;
 	bool bUseExtSwitch = false;
 	bool bIsInMpMode = false;
 	u8 H2C_Parameter[2] = {0}, u1Tmp = 0;
 
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_EXT_SWITCH, &bPgExtSwitch);
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_FW_VER, &fwVer); /*  [31:16]=fw ver, [15:0]=fw sub ver */
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_EXT_SWITCH, &bPgExtSwitch);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_U4_WIFI_FW_VER, &fwVer); /*  [31:16]=fw ver, [15:0]=fw sub ver */
 
 	if ((fwVer > 0 && fwVer < 0xc0000) || bPgExtSwitch)
 		bUseExtSwitch = true;
 
 	if (bInitHwCfg) {
-		pBtCoexist->fBtcSetRfReg(pBtCoexist, BTC_RF_A, 0x1, 0xfffff, 0x780); /* WiFi TRx Mask on */
-		pBtCoexist->fBtcSetBtReg(pBtCoexist, BTC_BT_REG_RF, 0x3c, 0x15); /* BT TRx Mask on */
+		bt_coexist->fBtcSetRfReg(bt_coexist, BTC_RF_A, 0x1, 0xfffff, 0x780); /* WiFi TRx Mask on */
+		bt_coexist->fBtcSetBtReg(bt_coexist, BTC_BT_REG_RF, 0x3c, 0x15); /* BT TRx Mask on */
 
 		if (fwVer >= 0x180000) {
 			/* Use H2C to set GNT_BT to HIGH */
 			H2C_Parameter[0] = 1;
-			pBtCoexist->fBtcFillH2c(pBtCoexist, 0x6E, 1, H2C_Parameter);
+			bt_coexist->fBtcFillH2c(bt_coexist, 0x6E, 1, H2C_Parameter);
 		} else /*  set grant_bt to high */
-			pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x765, 0x18);
+			bt_coexist->fBtcWrite1Byte(bt_coexist, 0x765, 0x18);
 
 		/* set wlan_act control by PTA */
-		pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x76e, 0x4);
+		bt_coexist->fBtcWrite1Byte(bt_coexist, 0x76e, 0x4);
 
-		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x1); /* BT select s0/s1 is controlled by WiFi */
+		bt_coexist->fBtcWrite1ByteBitMask(bt_coexist, 0x67, 0x20, 0x1); /* BT select s0/s1 is controlled by WiFi */
 
-		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x39, 0x8, 0x1);
-		pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x974, 0xff);
-		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x944, 0x3, 0x3);
-		pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x930, 0x77);
+		bt_coexist->fBtcWrite1ByteBitMask(bt_coexist, 0x39, 0x8, 0x1);
+		bt_coexist->fBtcWrite1Byte(bt_coexist, 0x974, 0xff);
+		bt_coexist->fBtcWrite1ByteBitMask(bt_coexist, 0x944, 0x3, 0x3);
+		bt_coexist->fBtcWrite1Byte(bt_coexist, 0x930, 0x77);
 	} else if (bWifiOff) {
 		if (fwVer >= 0x180000) {
 			/* Use H2C to set GNT_BT to HIGH */
 			H2C_Parameter[0] = 1;
-			pBtCoexist->fBtcFillH2c(pBtCoexist, 0x6E, 1, H2C_Parameter);
+			bt_coexist->fBtcFillH2c(bt_coexist, 0x6E, 1, H2C_Parameter);
 		} else /*  set grant_bt to high */
-			pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x765, 0x18);
+			bt_coexist->fBtcWrite1Byte(bt_coexist, 0x765, 0x18);
 
 		/* set wlan_act to always low */
-		pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x76e, 0x4);
+		bt_coexist->fBtcWrite1Byte(bt_coexist, 0x76e, 0x4);
 
-		pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_IS_IN_MP_MODE, &bIsInMpMode);
+		bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_IS_IN_MP_MODE, &bIsInMpMode);
 		if (!bIsInMpMode)
-			pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x0); /* BT select s0/s1 is controlled by BT */
+			bt_coexist->fBtcWrite1ByteBitMask(bt_coexist, 0x67, 0x20, 0x0); /* BT select s0/s1 is controlled by BT */
 		else
-			pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x1); /* BT select s0/s1 is controlled by WiFi */
+			bt_coexist->fBtcWrite1ByteBitMask(bt_coexist, 0x67, 0x20, 0x1); /* BT select s0/s1 is controlled by WiFi */
 
 		/*  0x4c[24:23]= 00, Set Antenna control by BT_RFE_CTRL	BT Vendor 0xac = 0xf002 */
-		u4Tmp = pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x4c);
+		u4Tmp = bt_coexist->fBtcRead4Byte(bt_coexist, 0x4c);
 		u4Tmp &= ~BIT23;
 		u4Tmp &= ~BIT24;
-		pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x4c, u4Tmp);
+		bt_coexist->fBtcWrite4Byte(bt_coexist, 0x4c, u4Tmp);
 	} else {
 		/* Use H2C to set GNT_BT to LOW */
 		if (fwVer >= 0x180000) {
-			if (pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x765) != 0) {
+			if (bt_coexist->fBtcRead1Byte(bt_coexist, 0x765) != 0) {
 				H2C_Parameter[0] = 0;
-				pBtCoexist->fBtcFillH2c(pBtCoexist, 0x6E, 1, H2C_Parameter);
+				bt_coexist->fBtcFillH2c(bt_coexist, 0x6E, 1, H2C_Parameter);
 			}
 		} else {
 			/*  BT calibration check */
 			while (cntBtCalChk <= 20) {
-				u1Tmp = pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x49d);
+				u1Tmp = bt_coexist->fBtcRead1Byte(bt_coexist, 0x49d);
 				cntBtCalChk++;
 
 				if (u1Tmp & BIT0)
@@ -877,34 +877,34 @@ static void halbtc8723b1ant_SetAntPath(
 			}
 
 			/*  set grant_bt to PTA */
-			pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x765, 0x0);
+			bt_coexist->fBtcWrite1Byte(bt_coexist, 0x765, 0x0);
 		}
 
-		if (pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x76e) != 0xc)
+		if (bt_coexist->fBtcRead1Byte(bt_coexist, 0x76e) != 0xc)
 			/* set wlan_act control by PTA */
-			pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x76e, 0xc);
+			bt_coexist->fBtcWrite1Byte(bt_coexist, 0x76e, 0xc);
 	}
 
 	if (bUseExtSwitch) {
 		if (bInitHwCfg) {
 			/*  0x4c[23]= 0, 0x4c[24]= 1  Antenna control by WL/BT */
-			u4Tmp = pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x4c);
+			u4Tmp = bt_coexist->fBtcRead4Byte(bt_coexist, 0x4c);
 			u4Tmp &= ~BIT23;
 			u4Tmp |= BIT24;
-			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x4c, u4Tmp);
+			bt_coexist->fBtcWrite4Byte(bt_coexist, 0x4c, u4Tmp);
 
-			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x0); /*  fixed internal switch S1->WiFi, S0->BT */
+			bt_coexist->fBtcWrite4Byte(bt_coexist, 0x948, 0x0); /*  fixed internal switch S1->WiFi, S0->BT */
 
 			if (pBoardInfo->btdmAntPos == BTC_ANTENNA_AT_MAIN_PORT) {
 				/* tell firmware "no antenna inverse" */
 				H2C_Parameter[0] = 0;
 				H2C_Parameter[1] = 1;  /* ext switch type */
-				pBtCoexist->fBtcFillH2c(pBtCoexist, 0x65, 2, H2C_Parameter);
+				bt_coexist->fBtcFillH2c(bt_coexist, 0x65, 2, H2C_Parameter);
 			} else {
 				/* tell firmware "antenna inverse" */
 				H2C_Parameter[0] = 1;
 				H2C_Parameter[1] = 1;  /* ext switch type */
-				pBtCoexist->fBtcFillH2c(pBtCoexist, 0x65, 2, H2C_Parameter);
+				bt_coexist->fBtcFillH2c(bt_coexist, 0x65, 2, H2C_Parameter);
 			}
 		}
 
@@ -913,48 +913,48 @@ static void halbtc8723b1ant_SetAntPath(
 		switch (antPosType) {
 		case BTC_ANT_PATH_WIFI:
 			if (pBoardInfo->btdmAntPos == BTC_ANTENNA_AT_MAIN_PORT)
-				pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x92c, 0x3, 0x1);
+				bt_coexist->fBtcWrite1ByteBitMask(bt_coexist, 0x92c, 0x3, 0x1);
 			else
-				pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x92c, 0x3, 0x2);
+				bt_coexist->fBtcWrite1ByteBitMask(bt_coexist, 0x92c, 0x3, 0x2);
 			break;
 		case BTC_ANT_PATH_BT:
 			if (pBoardInfo->btdmAntPos == BTC_ANTENNA_AT_MAIN_PORT)
-				pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x92c, 0x3, 0x2);
+				bt_coexist->fBtcWrite1ByteBitMask(bt_coexist, 0x92c, 0x3, 0x2);
 			else
-				pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x92c, 0x3, 0x1);
+				bt_coexist->fBtcWrite1ByteBitMask(bt_coexist, 0x92c, 0x3, 0x1);
 			break;
 		default:
 		case BTC_ANT_PATH_PTA:
 			if (pBoardInfo->btdmAntPos == BTC_ANTENNA_AT_MAIN_PORT)
-				pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x92c, 0x3, 0x1);
+				bt_coexist->fBtcWrite1ByteBitMask(bt_coexist, 0x92c, 0x3, 0x1);
 			else
-				pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x92c, 0x3, 0x2);
+				bt_coexist->fBtcWrite1ByteBitMask(bt_coexist, 0x92c, 0x3, 0x2);
 			break;
 		}
 
 	} else {
 		if (bInitHwCfg) {
 			/*  0x4c[23]= 1, 0x4c[24]= 0  Antenna control by 0x64 */
-			u4Tmp = pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x4c);
+			u4Tmp = bt_coexist->fBtcRead4Byte(bt_coexist, 0x4c);
 			u4Tmp |= BIT23;
 			u4Tmp &= ~BIT24;
-			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x4c, u4Tmp);
+			bt_coexist->fBtcWrite4Byte(bt_coexist, 0x4c, u4Tmp);
 
 			/* Fix Ext switch Main->S1, Aux->S0 */
-			pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x64, 0x1, 0x0);
+			bt_coexist->fBtcWrite1ByteBitMask(bt_coexist, 0x64, 0x1, 0x0);
 
 			if (pBoardInfo->btdmAntPos == BTC_ANTENNA_AT_MAIN_PORT) {
 
 				/* tell firmware "no antenna inverse" */
 				H2C_Parameter[0] = 0;
 				H2C_Parameter[1] = 0;  /* internal switch type */
-				pBtCoexist->fBtcFillH2c(pBtCoexist, 0x65, 2, H2C_Parameter);
+				bt_coexist->fBtcFillH2c(bt_coexist, 0x65, 2, H2C_Parameter);
 			} else {
 
 				/* tell firmware "antenna inverse" */
 				H2C_Parameter[0] = 1;
 				H2C_Parameter[1] = 0;  /* internal switch type */
-				pBtCoexist->fBtcFillH2c(pBtCoexist, 0x65, 2, H2C_Parameter);
+				bt_coexist->fBtcFillH2c(bt_coexist, 0x65, 2, H2C_Parameter);
 			}
 		}
 
@@ -963,36 +963,36 @@ static void halbtc8723b1ant_SetAntPath(
 		switch (antPosType) {
 		case BTC_ANT_PATH_WIFI:
 			if (pBoardInfo->btdmAntPos == BTC_ANTENNA_AT_MAIN_PORT)
-				pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x0);
+				bt_coexist->fBtcWrite4Byte(bt_coexist, 0x948, 0x0);
 			else
-				pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x280);
+				bt_coexist->fBtcWrite4Byte(bt_coexist, 0x948, 0x280);
 			break;
 		case BTC_ANT_PATH_BT:
 			if (pBoardInfo->btdmAntPos == BTC_ANTENNA_AT_MAIN_PORT)
-				pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x280);
+				bt_coexist->fBtcWrite4Byte(bt_coexist, 0x948, 0x280);
 			else
-				pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x0);
+				bt_coexist->fBtcWrite4Byte(bt_coexist, 0x948, 0x0);
 			break;
 		default:
 		case BTC_ANT_PATH_PTA:
 			if (pBoardInfo->btdmAntPos == BTC_ANTENNA_AT_MAIN_PORT)
-				pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x200);
+				bt_coexist->fBtcWrite4Byte(bt_coexist, 0x948, 0x200);
 			else
-				pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x80);
+				bt_coexist->fBtcWrite4Byte(bt_coexist, 0x948, 0x80);
 			break;
 		}
 	}
 }
 
 static void halbtc8723b1ant_SetFwPstdma(
-	struct btc_coexist *pBtCoexist, u8 byte1, u8 byte2, u8 byte3, u8 byte4, u8 byte5
+	struct btc_coexist *bt_coexist, u8 byte1, u8 byte2, u8 byte3, u8 byte4, u8 byte5
 )
 {
 	u8 H2C_Parameter[5] = {0};
 	u8 realByte1 = byte1, realByte5 = byte5;
 	bool bApEnable = false;
 
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_AP_MODE_ENABLE, &bApEnable);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_AP_MODE_ENABLE, &bApEnable);
 
 	if (bApEnable) {
 		if (byte1 & BIT4 && !(byte1 & BIT5)) {
@@ -1016,16 +1016,16 @@ static void halbtc8723b1ant_SetFwPstdma(
 	pCoexDm->psTdmaPara[3] = byte4;
 	pCoexDm->psTdmaPara[4] = realByte5;
 
-	pBtCoexist->fBtcFillH2c(pBtCoexist, 0x60, 5, H2C_Parameter);
+	bt_coexist->fBtcFillH2c(bt_coexist, 0x60, 5, H2C_Parameter);
 }
 
 
 static void halbtc8723b1ant_PsTdma(
-	struct btc_coexist *pBtCoexist, bool bForceExec, bool bTurnOn, u8 type
+	struct btc_coexist *bt_coexist, bool force_exec, bool bTurnOn, u8 type
 )
 {
-	struct btc_bt_link_info *pBtLinkInfo = &pBtCoexist->btLinkInfo;
-	bool bWifiBusy = false;
+	struct btc_bt_link_info *pBtLinkInfo = &bt_coexist->btLinkInfo;
+	bool wifi_busy = false;
 	u8 rssiAdjustVal = 0;
 	u8 psTdmaByte4Val = 0x50, psTdmaByte0Val = 0x51, psTdmaByte3Val =  0x10;
 	s8 nWiFiDurationAdjust = 0x0;
@@ -1034,9 +1034,9 @@ static void halbtc8723b1ant_PsTdma(
 	pCoexDm->bCurPsTdmaOn = bTurnOn;
 	pCoexDm->curPsTdma = type;
 
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_BUSY, &bWifiBusy);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_BUSY, &wifi_busy);
 
-	if (!bForceExec) {
+	if (!force_exec) {
 		if (
 			(pCoexDm->bPrePsTdmaOn == pCoexDm->bCurPsTdmaOn) &&
 			(pCoexDm->prePsTdma == pCoexDm->curPsTdma)
@@ -1066,12 +1066,12 @@ static void halbtc8723b1ant_PsTdma(
 		switch (type) {
 		default:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x51, 0x1a, 0x1a, 0x0, psTdmaByte4Val
+				bt_coexist, 0x51, 0x1a, 0x1a, 0x0, psTdmaByte4Val
 			);
 			break;
 		case 1:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist,
+				bt_coexist,
 				psTdmaByte0Val,
 				0x3a + nWiFiDurationAdjust,
 				0x03,
@@ -1081,7 +1081,7 @@ static void halbtc8723b1ant_PsTdma(
 			break;
 		case 2:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist,
+				bt_coexist,
 				psTdmaByte0Val,
 				0x2d + nWiFiDurationAdjust,
 				0x03,
@@ -1091,35 +1091,35 @@ static void halbtc8723b1ant_PsTdma(
 			break;
 		case 3:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x51, 0x1d, 0x1d, 0x0, 0x10
+				bt_coexist, 0x51, 0x1d, 0x1d, 0x0, 0x10
 			);
 			break;
 		case 4:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x93, 0x15, 0x3, 0x14, 0x0
+				bt_coexist, 0x93, 0x15, 0x3, 0x14, 0x0
 			);
 			break;
 		case 5:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x61, 0x15, 0x3, 0x11, 0x10
+				bt_coexist, 0x61, 0x15, 0x3, 0x11, 0x10
 			);
 			break;
 		case 6:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x61, 0x20, 0x3, 0x11, 0x11
+				bt_coexist, 0x61, 0x20, 0x3, 0x11, 0x11
 			);
 			break;
 		case 7:
-			halbtc8723b1ant_SetFwPstdma(pBtCoexist, 0x13, 0xc, 0x5, 0x0, 0x0);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x13, 0xc, 0x5, 0x0, 0x0);
 			break;
 		case 8:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x93, 0x25, 0x3, 0x10, 0x0
+				bt_coexist, 0x93, 0x25, 0x3, 0x10, 0x0
 			);
 			break;
 		case 9:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist,
+				bt_coexist,
 				psTdmaByte0Val,
 				0x21,
 				0x3,
@@ -1128,11 +1128,11 @@ static void halbtc8723b1ant_PsTdma(
 			);
 			break;
 		case 10:
-			halbtc8723b1ant_SetFwPstdma(pBtCoexist, 0x13, 0xa, 0xa, 0x0, 0x40);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x13, 0xa, 0xa, 0x0, 0x40);
 			break;
 		case 11:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist,
+				bt_coexist,
 				psTdmaByte0Val,
 				0x21,
 				0x03,
@@ -1142,124 +1142,124 @@ static void halbtc8723b1ant_PsTdma(
 			break;
 		case 12:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x51, 0x0a, 0x0a, 0x0, 0x50
+				bt_coexist, 0x51, 0x0a, 0x0a, 0x0, 0x50
 			);
 			break;
 		case 13:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x51, 0x12, 0x12, 0x0, 0x10
+				bt_coexist, 0x51, 0x12, 0x12, 0x0, 0x10
 			);
 			break;
 		case 14:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x51, 0x21, 0x3, 0x10, psTdmaByte4Val
+				bt_coexist, 0x51, 0x21, 0x3, 0x10, psTdmaByte4Val
 			);
 			break;
 		case 15:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x13, 0xa, 0x3, 0x8, 0x0
+				bt_coexist, 0x13, 0xa, 0x3, 0x8, 0x0
 			);
 			break;
 		case 16:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x93, 0x15, 0x3, 0x10, 0x0
+				bt_coexist, 0x93, 0x15, 0x3, 0x10, 0x0
 			);
 			break;
 		case 18:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x93, 0x25, 0x3, 0x10, 0x0
+				bt_coexist, 0x93, 0x25, 0x3, 0x10, 0x0
 			);
 			break;
 		case 20:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x61, 0x3f, 0x03, 0x11, 0x10
+				bt_coexist, 0x61, 0x3f, 0x03, 0x11, 0x10
 
 			);
 			break;
 		case 21:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x61, 0x25, 0x03, 0x11, 0x11
+				bt_coexist, 0x61, 0x25, 0x03, 0x11, 0x11
 			);
 			break;
 		case 22:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x61, 0x25, 0x03, 0x11, 0x10
+				bt_coexist, 0x61, 0x25, 0x03, 0x11, 0x10
 			);
 			break;
 		case 23:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0xe3, 0x25, 0x3, 0x31, 0x18
+				bt_coexist, 0xe3, 0x25, 0x3, 0x31, 0x18
 			);
 			break;
 		case 24:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0xe3, 0x15, 0x3, 0x31, 0x18
+				bt_coexist, 0xe3, 0x15, 0x3, 0x31, 0x18
 			);
 			break;
 		case 25:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0xe3, 0xa, 0x3, 0x31, 0x18
+				bt_coexist, 0xe3, 0xa, 0x3, 0x31, 0x18
 			);
 			break;
 		case 26:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0xe3, 0xa, 0x3, 0x31, 0x18
+				bt_coexist, 0xe3, 0xa, 0x3, 0x31, 0x18
 			);
 			break;
 		case 27:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0xe3, 0x25, 0x3, 0x31, 0x98
+				bt_coexist, 0xe3, 0x25, 0x3, 0x31, 0x98
 			);
 			break;
 		case 28:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x69, 0x25, 0x3, 0x31, 0x0
+				bt_coexist, 0x69, 0x25, 0x3, 0x31, 0x0
 			);
 			break;
 		case 29:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0xab, 0x1a, 0x1a, 0x1, 0x10
+				bt_coexist, 0xab, 0x1a, 0x1a, 0x1, 0x10
 			);
 			break;
 		case 30:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x51, 0x30, 0x3, 0x10, 0x10
+				bt_coexist, 0x51, 0x30, 0x3, 0x10, 0x10
 			);
 			break;
 		case 31:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0xd3, 0x1a, 0x1a, 0x0, 0x58
+				bt_coexist, 0xd3, 0x1a, 0x1a, 0x0, 0x58
 			);
 			break;
 		case 32:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x61, 0x35, 0x3, 0x11, 0x11
+				bt_coexist, 0x61, 0x35, 0x3, 0x11, 0x11
 			);
 			break;
 		case 33:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0xa3, 0x25, 0x3, 0x30, 0x90
+				bt_coexist, 0xa3, 0x25, 0x3, 0x30, 0x90
 			);
 			break;
 		case 34:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x53, 0x1a, 0x1a, 0x0, 0x10
+				bt_coexist, 0x53, 0x1a, 0x1a, 0x0, 0x10
 			);
 			break;
 		case 35:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x63, 0x1a, 0x1a, 0x0, 0x10
+				bt_coexist, 0x63, 0x1a, 0x1a, 0x0, 0x10
 			);
 			break;
 		case 36:
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0xd3, 0x12, 0x3, 0x14, 0x50
+				bt_coexist, 0xd3, 0x12, 0x3, 0x14, 0x50
 			);
 			break;
 		case 40: /*  SoftAP only with no sta associated, BT disable , TDMA mode for power saving */
 			/* here softap mode screen off will cost 70-80mA for phone */
 			halbtc8723b1ant_SetFwPstdma(
-				pBtCoexist, 0x23, 0x18, 0x00, 0x10, 0x24
+				bt_coexist, 0x23, 0x18, 0x00, 0x10, 0x24
 			);
 			break;
 		}
@@ -1268,30 +1268,30 @@ static void halbtc8723b1ant_PsTdma(
 		/*  disable PS tdma */
 		switch (type) {
 		case 8: /* PTA Control */
-			halbtc8723b1ant_SetFwPstdma(pBtCoexist, 0x8, 0x0, 0x0, 0x0, 0x0);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x8, 0x0, 0x0, 0x0, 0x0);
 			halbtc8723b1ant_SetAntPath(
-				pBtCoexist, BTC_ANT_PATH_PTA, false, false
+				bt_coexist, BTC_ANT_PATH_PTA, false, false
 			);
 			break;
 		case 0:
 		default:  /* Software control, Antenna at BT side */
-			halbtc8723b1ant_SetFwPstdma(pBtCoexist, 0x0, 0x0, 0x0, 0x0, 0x0);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x0, 0x0, 0x0, 0x0, 0x0);
 			halbtc8723b1ant_SetAntPath(
-				pBtCoexist, BTC_ANT_PATH_BT, false, false
+				bt_coexist, BTC_ANT_PATH_BT, false, false
 			);
 			break;
 		case 9:   /* Software control, Antenna at WiFi side */
-			halbtc8723b1ant_SetFwPstdma(pBtCoexist, 0x0, 0x0, 0x0, 0x0, 0x0);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x0, 0x0, 0x0, 0x0, 0x0);
 			halbtc8723b1ant_SetAntPath(
-				pBtCoexist, BTC_ANT_PATH_WIFI, false, false
+				bt_coexist, BTC_ANT_PATH_WIFI, false, false
 			);
 			break;
 		}
 	}
 
 	rssiAdjustVal = 0;
-	pBtCoexist->fBtcSet(
-		pBtCoexist, BTC_SET_U1_RSSI_ADJ_VAL_FOR_1ANT_COEX_TYPE, &rssiAdjustVal
+	bt_coexist->fBtcSet(
+		bt_coexist, BTC_SET_U1_RSSI_ADJ_VAL_FOR_1ANT_COEX_TYPE, &rssiAdjustVal
 	);
 
 	/*  update pre state */
@@ -1299,46 +1299,46 @@ static void halbtc8723b1ant_PsTdma(
 	pCoexDm->prePsTdma = pCoexDm->curPsTdma;
 }
 
-static bool halbtc8723b1ant_IsCommonAction(struct btc_coexist *pBtCoexist)
+static bool halbtc8723b1ant_IsCommonAction(struct btc_coexist *bt_coexist)
 {
-	bool bCommon = false, bWifiConnected = false, bWifiBusy = false;
+	bool bCommon = false, bWifiConnected = false, wifi_busy = false;
 
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_CONNECTED, &bWifiConnected);
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_BUSY, &bWifiBusy);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_CONNECTED, &bWifiConnected);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_BUSY, &wifi_busy);
 
 	if (
 		!bWifiConnected &&
 		pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_NON_CONNECTED_IDLE
 	) {
-		/* halbtc8723b1ant_SwMechanism(pBtCoexist, false); */
+		/* halbtc8723b1ant_SwMechanism(bt_coexist, false); */
 
 		bCommon = true;
 	} else if (
 		bWifiConnected &&
 		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_NON_CONNECTED_IDLE)
 	) {
-		/* halbtc8723b1ant_SwMechanism(pBtCoexist, false); */
+		/* halbtc8723b1ant_SwMechanism(bt_coexist, false); */
 
 		bCommon = true;
 	} else if (
 		!bWifiConnected &&
 		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE)
 	) {
-		/* halbtc8723b1ant_SwMechanism(pBtCoexist, false); */
+		/* halbtc8723b1ant_SwMechanism(bt_coexist, false); */
 
 		bCommon = true;
 	} else if (
 		bWifiConnected &&
 		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE)
 	) {
-		/* halbtc8723b1ant_SwMechanism(pBtCoexist, false); */
+		/* halbtc8723b1ant_SwMechanism(bt_coexist, false); */
 
 		bCommon = true;
 	} else if (
 		!bWifiConnected &&
 		(pCoexDm->btStatus != BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE)
 	) {
-		/* halbtc8723b1ant_SwMechanism(pBtCoexist, false); */
+		/* halbtc8723b1ant_SwMechanism(bt_coexist, false); */
 
 		bCommon = true;
 	} else {
@@ -1350,7 +1350,7 @@ static bool halbtc8723b1ant_IsCommonAction(struct btc_coexist *pBtCoexist)
 
 
 static void halbtc8723b1ant_TdmaDurationAdjustForAcl(
-	struct btc_coexist *pBtCoexist, u8 wifiStatus
+	struct btc_coexist *bt_coexist, u8 wifiStatus
 )
 {
 	static s32 up, dn, m, n, WaitCount;
@@ -1368,7 +1368,7 @@ static void halbtc8723b1ant_TdmaDurationAdjustForAcl(
 			pCoexDm->curPsTdma != 3 &&
 			pCoexDm->curPsTdma != 9
 		) {
-			halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 9);
+			halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 9);
 			pCoexDm->psTdmaDuAdjType = 9;
 
 			up = 0;
@@ -1384,7 +1384,7 @@ static void halbtc8723b1ant_TdmaDurationAdjustForAcl(
 	if (!pCoexDm->bAutoTdmaAdjust) {
 		pCoexDm->bAutoTdmaAdjust = true;
 
-		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 2);
+		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 2);
 		pCoexDm->psTdmaDuAdjType = 2;
 		/*  */
 		up = 0;
@@ -1461,16 +1461,16 @@ static void halbtc8723b1ant_TdmaDurationAdjustForAcl(
 				BT_INFO_8723B_1ANT_A2DP_BASIC_RATE(btInfoExt) &&
 				((pCoexDm->curPsTdma == 1) || (pCoexDm->curPsTdma == 2))
 			) {
-				halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 9);
+				halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 9);
 				pCoexDm->psTdmaDuAdjType = 9;
 			} else if (pCoexDm->curPsTdma == 1) {
-				halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 2);
+				halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 2);
 				pCoexDm->psTdmaDuAdjType = 2;
 			} else if (pCoexDm->curPsTdma == 2) {
-				halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 9);
+				halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 9);
 				pCoexDm->psTdmaDuAdjType = 9;
 			} else if (pCoexDm->curPsTdma == 9) {
-				halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 11);
+				halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 11);
 				pCoexDm->psTdmaDuAdjType = 11;
 			}
 		} else if (result == 1) {
@@ -1478,16 +1478,16 @@ static void halbtc8723b1ant_TdmaDurationAdjustForAcl(
 				BT_INFO_8723B_1ANT_A2DP_BASIC_RATE(btInfoExt) &&
 				((pCoexDm->curPsTdma == 1) || (pCoexDm->curPsTdma == 2))
 			) {
-				halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 9);
+				halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 9);
 				pCoexDm->psTdmaDuAdjType = 9;
 			} else if (pCoexDm->curPsTdma == 11) {
-				halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 9);
+				halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 9);
 				pCoexDm->psTdmaDuAdjType = 9;
 			} else if (pCoexDm->curPsTdma == 9) {
-				halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 2);
+				halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 2);
 				pCoexDm->psTdmaDuAdjType = 2;
 			} else if (pCoexDm->curPsTdma == 2) {
-				halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 1);
+				halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 1);
 				pCoexDm->psTdmaDuAdjType = 1;
 			}
 		}
@@ -1499,27 +1499,27 @@ static void halbtc8723b1ant_TdmaDurationAdjustForAcl(
 			pCoexDm->curPsTdma != 11
 		) /*  recover to previous adjust type */
 			halbtc8723b1ant_PsTdma(
-				pBtCoexist, NORMAL_EXEC, true, pCoexDm->psTdmaDuAdjType
+				bt_coexist, NORMAL_EXEC, true, pCoexDm->psTdmaDuAdjType
 			);
 	}
 }
 
 static void halbtc8723b1ant_PsTdmaCheckForPowerSaveState(
-	struct btc_coexist *pBtCoexist, bool bNewPsState
+	struct btc_coexist *bt_coexist, bool bNewPsState
 )
 {
 	u8 lpsMode = 0x0;
 
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U1_LPS_MODE, &lpsMode);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_U1_LPS_MODE, &lpsMode);
 
 	if (lpsMode) {	/*  already under LPS state */
 		if (bNewPsState) {
 			/*  keep state under LPS, do nothing. */
 		} else /*  will leave LPS state, turn off psTdma first */
-			halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, false, 0);
+			halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, false, 0);
 	} else {						/*  NO PS state */
 		if (bNewPsState) /*  will enter LPS state, turn off psTdma first */
-			halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, false, 0);
+			halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, false, 0);
 		else {
 			/*  keep state under NO PS state, do nothing. */
 		}
@@ -1527,7 +1527,7 @@ static void halbtc8723b1ant_PsTdmaCheckForPowerSaveState(
 }
 
 static void halbtc8723b1ant_PowerSaveState(
-	struct btc_coexist *pBtCoexist, u8 psType, u8 lpsVal, u8 rpwmVal
+	struct btc_coexist *bt_coexist, u8 psType, u8 lpsVal, u8 rpwmVal
 )
 {
 	bool bLowPwrDisable = false;
@@ -1536,27 +1536,27 @@ static void halbtc8723b1ant_PowerSaveState(
 	case BTC_PS_WIFI_NATIVE:
 		/*  recover to original 32k low power setting */
 		bLowPwrDisable = false;
-		pBtCoexist->fBtcSet(
-			pBtCoexist, BTC_SET_ACT_DISABLE_LOW_POWER, &bLowPwrDisable
+		bt_coexist->fBtcSet(
+			bt_coexist, BTC_SET_ACT_DISABLE_LOW_POWER, &bLowPwrDisable
 		);
-		pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_ACT_NORMAL_LPS, NULL);
+		bt_coexist->fBtcSet(bt_coexist, BTC_SET_ACT_NORMAL_LPS, NULL);
 		pCoexSta->bForceLpsOn = false;
 		break;
 	case BTC_PS_LPS_ON:
-		halbtc8723b1ant_PsTdmaCheckForPowerSaveState(pBtCoexist, true);
-		halbtc8723b1ant_LpsRpwm(pBtCoexist, NORMAL_EXEC, lpsVal, rpwmVal);
+		halbtc8723b1ant_PsTdmaCheckForPowerSaveState(bt_coexist, true);
+		halbtc8723b1ant_LpsRpwm(bt_coexist, NORMAL_EXEC, lpsVal, rpwmVal);
 		/*  when coex force to enter LPS, do not enter 32k low power. */
 		bLowPwrDisable = true;
-		pBtCoexist->fBtcSet(
-			pBtCoexist, BTC_SET_ACT_DISABLE_LOW_POWER, &bLowPwrDisable
+		bt_coexist->fBtcSet(
+			bt_coexist, BTC_SET_ACT_DISABLE_LOW_POWER, &bLowPwrDisable
 		);
 		/*  power save must executed before psTdma. */
-		pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_ACT_ENTER_LPS, NULL);
+		bt_coexist->fBtcSet(bt_coexist, BTC_SET_ACT_ENTER_LPS, NULL);
 		pCoexSta->bForceLpsOn = true;
 		break;
 	case BTC_PS_LPS_OFF:
-		halbtc8723b1ant_PsTdmaCheckForPowerSaveState(pBtCoexist, false);
-		pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_ACT_LEAVE_LPS, NULL);
+		halbtc8723b1ant_PsTdmaCheckForPowerSaveState(bt_coexist, false);
+		bt_coexist->fBtcSet(bt_coexist, BTC_SET_ACT_LEAVE_LPS, NULL);
 		pCoexSta->bForceLpsOn = false;
 		break;
 	default:
@@ -1575,86 +1575,86 @@ static void halbtc8723b1ant_PowerSaveState(
 /*	Non-Software Coex Mechanism start */
 /*  */
 /*  */
-static void halbtc8723b1ant_ActionWifiMultiPort(struct btc_coexist *pBtCoexist)
+static void halbtc8723b1ant_ActionWifiMultiPort(struct btc_coexist *bt_coexist)
 {
-	halbtc8723b1ant_PowerSaveState(pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
+	halbtc8723b1ant_PowerSaveState(bt_coexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
 
-	halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, false, 8);
-	halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 2);
+	halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, false, 8);
+	halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 2);
 }
 
-static void halbtc8723b1ant_ActionHs(struct btc_coexist *pBtCoexist)
+static void halbtc8723b1ant_ActionHs(struct btc_coexist *bt_coexist)
 {
-	halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 5);
-	halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 2);
+	halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 5);
+	halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 2);
 }
 
-static void halbtc8723b1ant_ActionBtInquiry(struct btc_coexist *pBtCoexist)
+static void halbtc8723b1ant_ActionBtInquiry(struct btc_coexist *bt_coexist)
 {
-	struct btc_bt_link_info *pBtLinkInfo = &pBtCoexist->btLinkInfo;
+	struct btc_bt_link_info *pBtLinkInfo = &bt_coexist->btLinkInfo;
 	bool bWifiConnected = false;
 	bool bApEnable = false;
-	bool bWifiBusy = false;
+	bool wifi_busy = false;
 	bool bBtBusy = false;
 
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_AP_MODE_ENABLE, &bApEnable);
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_CONNECTED, &bWifiConnected);
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_BUSY, &bWifiBusy);
-	pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_BL_BT_TRAFFIC_BUSY, &bBtBusy);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_AP_MODE_ENABLE, &bApEnable);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_CONNECTED, &bWifiConnected);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_BUSY, &wifi_busy);
+	bt_coexist->fBtcSet(bt_coexist, BTC_SET_BL_BT_TRAFFIC_BUSY, &bBtBusy);
 
 	if (!bWifiConnected && !pCoexSta->bWiFiIsHighPriTask) {
-		halbtc8723b1ant_PowerSaveState(pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
-		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, false, 8);
+		halbtc8723b1ant_PowerSaveState(bt_coexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
+		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, false, 8);
 
-		halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 0);
+		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 0);
 	} else if (
 		pBtLinkInfo->bScoExist ||
 		pBtLinkInfo->bHidExist ||
 		pBtLinkInfo->bA2dpExist
 	) {
 		/*  SCO/HID/A2DP busy */
-		halbtc8723b1ant_PowerSaveState(pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
-		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 32);
+		halbtc8723b1ant_PowerSaveState(bt_coexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
+		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 32);
 
-		halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 4);
-	} else if (pBtLinkInfo->bPanExist || bWifiBusy) {
-		halbtc8723b1ant_PowerSaveState(pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
-		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 20);
+		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
+	} else if (pBtLinkInfo->bPanExist || wifi_busy) {
+		halbtc8723b1ant_PowerSaveState(bt_coexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
+		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 20);
 
-		halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 4);
+		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
 	} else {
-		halbtc8723b1ant_PowerSaveState(pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
-		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, false, 8);
+		halbtc8723b1ant_PowerSaveState(bt_coexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
+		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, false, 8);
 
-		halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 7);
+		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 7);
 	}
 }
 
 static void halbtc8723b1ant_ActionBtScoHidOnlyBusy(
-	struct btc_coexist *pBtCoexist, u8 wifiStatus
+	struct btc_coexist *bt_coexist, u8 wifiStatus
 )
 {
-	struct btc_bt_link_info *pBtLinkInfo = &pBtCoexist->btLinkInfo;
+	struct btc_bt_link_info *pBtLinkInfo = &bt_coexist->btLinkInfo;
 	bool bWifiConnected = false;
 
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_CONNECTED, &bWifiConnected);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_CONNECTED, &bWifiConnected);
 
 	/*  tdma and coex table */
 
 	if (pBtLinkInfo->bScoExist) {
-		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 5);
-		halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 5);
+		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 5);
+		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 5);
 	} else { /* HID */
-		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 6);
-		halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 5);
+		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 6);
+		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 5);
 	}
 }
 
 static void halbtc8723b1ant_ActionWifiConnectedBtAclBusy(
-	struct btc_coexist *pBtCoexist, u8 wifiStatus
+	struct btc_coexist *bt_coexist, u8 wifiStatus
 )
 {
-	struct btc_bt_link_info *pBtLinkInfo = &pBtCoexist->btLinkInfo;
+	struct btc_bt_link_info *pBtLinkInfo = &bt_coexist->btLinkInfo;
 
 	halbtc8723b1ant_BtRssiState(2, 28, 0);
 
@@ -1664,97 +1664,97 @@ static void halbtc8723b1ant_ActionWifiConnectedBtAclBusy(
 		pBtLinkInfo->bSlaveRole = false;
 
 	if (pBtLinkInfo->bHidOnly) { /* HID */
-		halbtc8723b1ant_ActionBtScoHidOnlyBusy(pBtCoexist, wifiStatus);
+		halbtc8723b1ant_ActionBtScoHidOnlyBusy(bt_coexist, wifiStatus);
 		pCoexDm->bAutoTdmaAdjust = false;
 		return;
 	} else if (pBtLinkInfo->bA2dpOnly) { /* A2DP */
 		if (wifiStatus == BT_8723B_1ANT_WIFI_STATUS_CONNECTED_IDLE) {
-			halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 32);
-			halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 4);
+			halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 32);
+			halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
 			pCoexDm->bAutoTdmaAdjust = false;
 		} else {
-			halbtc8723b1ant_TdmaDurationAdjustForAcl(pBtCoexist, wifiStatus);
-			halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 4);
+			halbtc8723b1ant_TdmaDurationAdjustForAcl(bt_coexist, wifiStatus);
+			halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
 			pCoexDm->bAutoTdmaAdjust = true;
 		}
 	} else if (pBtLinkInfo->bHidExist && pBtLinkInfo->bA2dpExist) { /* HID+A2DP */
-		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 14);
+		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 14);
 		pCoexDm->bAutoTdmaAdjust = false;
 
-		halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 4);
+		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
 	} else if (
 		pBtLinkInfo->bPanOnly ||
 		(pBtLinkInfo->bHidExist && pBtLinkInfo->bPanExist)
 	) { /* PAN(OPP, FTP), HID+PAN(OPP, FTP) */
-		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 3);
-		halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 4);
+		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 3);
+		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
 		pCoexDm->bAutoTdmaAdjust = false;
 	} else if (
 		(pBtLinkInfo->bA2dpExist && pBtLinkInfo->bPanExist) ||
 		(pBtLinkInfo->bHidExist && pBtLinkInfo->bA2dpExist && pBtLinkInfo->bPanExist)
 	) { /* A2DP+PAN(OPP, FTP), HID+A2DP+PAN(OPP, FTP) */
-		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 13);
-		halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 4);
+		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 13);
+		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
 		pCoexDm->bAutoTdmaAdjust = false;
 	} else {
 		/* BT no-profile busy (0x9) */
-		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 32);
-		halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 4);
+		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 32);
+		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
 		pCoexDm->bAutoTdmaAdjust = false;
 	}
 }
 
-static void halbtc8723b1ant_ActionWifiNotConnected(struct btc_coexist *pBtCoexist)
+static void halbtc8723b1ant_ActionWifiNotConnected(struct btc_coexist *bt_coexist)
 {
 	/*  power save state */
-	halbtc8723b1ant_PowerSaveState(pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
+	halbtc8723b1ant_PowerSaveState(bt_coexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
 
 	/*  tdma and coex table */
-	halbtc8723b1ant_PsTdma(pBtCoexist, FORCE_EXEC, false, 8);
-	halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 0);
+	halbtc8723b1ant_PsTdma(bt_coexist, FORCE_EXEC, false, 8);
+	halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 0);
 }
 
 static void halbtc8723b1ant_ActionWifiNotConnectedScan(
-	struct btc_coexist *pBtCoexist
+	struct btc_coexist *bt_coexist
 )
 {
-	struct btc_bt_link_info *pBtLinkInfo = &pBtCoexist->btLinkInfo;
+	struct btc_bt_link_info *pBtLinkInfo = &bt_coexist->btLinkInfo;
 
-	halbtc8723b1ant_PowerSaveState(pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
+	halbtc8723b1ant_PowerSaveState(bt_coexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
 
 	/*  tdma and coex table */
 	if (pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_BUSY) {
 		if (pBtLinkInfo->bA2dpExist) {
-			halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 32);
-			halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 4);
+			halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 32);
+			halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
 		} else if (pBtLinkInfo->bA2dpExist && pBtLinkInfo->bPanExist) {
-			halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 22);
-			halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 4);
+			halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 22);
+			halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
 		} else {
-			halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 20);
-			halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 4);
+			halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 20);
+			halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
 		}
 	} else if (
 		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_SCO_BUSY) ||
 		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY)
 	) {
 		halbtc8723b1ant_ActionBtScoHidOnlyBusy(
-			pBtCoexist, BT_8723B_1ANT_WIFI_STATUS_CONNECTED_SCAN
+			bt_coexist, BT_8723B_1ANT_WIFI_STATUS_CONNECTED_SCAN
 		);
 	} else {
 		/* Bryant Add */
-		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, false, 8);
-		halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 2);
+		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, false, 8);
+		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 2);
 	}
 }
 
 static void halbtc8723b1ant_ActionWifiNotConnectedAssoAuth(
-	struct btc_coexist *pBtCoexist
+	struct btc_coexist *bt_coexist
 )
 {
-	struct btc_bt_link_info *pBtLinkInfo = &pBtCoexist->btLinkInfo;
+	struct btc_bt_link_info *pBtLinkInfo = &bt_coexist->btLinkInfo;
 
-	halbtc8723b1ant_PowerSaveState(pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
+	halbtc8723b1ant_PowerSaveState(bt_coexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
 
 	/*  tdma and coex table */
 	if (
@@ -1762,56 +1762,56 @@ static void halbtc8723b1ant_ActionWifiNotConnectedAssoAuth(
 		(pBtLinkInfo->bHidExist) ||
 		(pBtLinkInfo->bA2dpExist)
 	) {
-		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 32);
-		halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 4);
+		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 32);
+		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
 	} else if (pBtLinkInfo->bPanExist) {
-		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 20);
-		halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 4);
+		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 20);
+		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
 	} else {
-		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, false, 8);
-		halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 2);
+		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, false, 8);
+		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 2);
 	}
 }
 
-static void halbtc8723b1ant_ActionWifiConnectedScan(struct btc_coexist *pBtCoexist)
+static void halbtc8723b1ant_ActionWifiConnectedScan(struct btc_coexist *bt_coexist)
 {
-	struct btc_bt_link_info *pBtLinkInfo = &pBtCoexist->btLinkInfo;
+	struct btc_bt_link_info *pBtLinkInfo = &bt_coexist->btLinkInfo;
 
-	halbtc8723b1ant_PowerSaveState(pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
+	halbtc8723b1ant_PowerSaveState(bt_coexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
 
 	/*  tdma and coex table */
 	if (pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_BUSY) {
 		if (pBtLinkInfo->bA2dpExist) {
-			halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 32);
-			halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 4);
+			halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 32);
+			halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
 		} else if (pBtLinkInfo->bA2dpExist && pBtLinkInfo->bPanExist) {
-			halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 22);
-			halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 4);
+			halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 22);
+			halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
 		} else {
-			halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 20);
-			halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 4);
+			halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 20);
+			halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
 		}
 	} else if (
 		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_SCO_BUSY) ||
 		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY)
 	) {
 		halbtc8723b1ant_ActionBtScoHidOnlyBusy(
-			pBtCoexist, BT_8723B_1ANT_WIFI_STATUS_CONNECTED_SCAN
+			bt_coexist, BT_8723B_1ANT_WIFI_STATUS_CONNECTED_SCAN
 		);
 	} else {
 		/* Bryant Add */
-		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, false, 8);
-		halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 2);
+		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, false, 8);
+		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 2);
 	}
 }
 
 static void halbtc8723b1ant_ActionWifiConnectedSpecialPacket(
-	struct btc_coexist *pBtCoexist
+	struct btc_coexist *bt_coexist
 )
 {
-	struct btc_bt_link_info *pBtLinkInfo = &pBtCoexist->btLinkInfo;
+	struct btc_bt_link_info *pBtLinkInfo = &bt_coexist->btLinkInfo;
 
-	halbtc8723b1ant_PowerSaveState(pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
+	halbtc8723b1ant_PowerSaveState(bt_coexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
 
 	/*  tdma and coex table */
 	if (
@@ -1819,62 +1819,62 @@ static void halbtc8723b1ant_ActionWifiConnectedSpecialPacket(
 		(pBtLinkInfo->bHidExist) ||
 		(pBtLinkInfo->bA2dpExist)
 	) {
-		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 32);
-		halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 4);
+		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 32);
+		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
 	} else if (pBtLinkInfo->bPanExist) {
-		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 20);
-		halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 4);
+		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 20);
+		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
 	} else {
-		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, false, 8);
-		halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 2);
+		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, false, 8);
+		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 2);
 	}
 }
 
-static void halbtc8723b1ant_ActionWifiConnected(struct btc_coexist *pBtCoexist)
+static void halbtc8723b1ant_ActionWifiConnected(struct btc_coexist *bt_coexist)
 {
-	bool bWifiBusy = false;
+	bool wifi_busy = false;
 	bool bScan = false, bLink = false, bRoam = false;
 	bool bUnder4way = false, bApEnable = false;
 
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_4_WAY_PROGRESS, &bUnder4way);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_4_WAY_PROGRESS, &bUnder4way);
 	if (bUnder4way) {
-		halbtc8723b1ant_ActionWifiConnectedSpecialPacket(pBtCoexist);
+		halbtc8723b1ant_ActionWifiConnectedSpecialPacket(bt_coexist);
 		return;
 	}
 
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_SCAN, &bScan);
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_LINK, &bLink);
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_ROAM, &bRoam);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_SCAN, &bScan);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_LINK, &bLink);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_ROAM, &bRoam);
 	if (bScan || bLink || bRoam) {
 		if (bScan)
-			halbtc8723b1ant_ActionWifiConnectedScan(pBtCoexist);
+			halbtc8723b1ant_ActionWifiConnectedScan(bt_coexist);
 		else
-			halbtc8723b1ant_ActionWifiConnectedSpecialPacket(pBtCoexist);
+			halbtc8723b1ant_ActionWifiConnectedSpecialPacket(bt_coexist);
 		return;
 	}
 
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_AP_MODE_ENABLE, &bApEnable);
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_BUSY, &bWifiBusy);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_AP_MODE_ENABLE, &bApEnable);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_BUSY, &wifi_busy);
 
 	/*  power save state */
 	if (
 		!bApEnable &&
 		pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_BUSY &&
-		!pBtCoexist->btLinkInfo.bHidOnly
+		!bt_coexist->btLinkInfo.bHidOnly
 	) {
-		if (pBtCoexist->btLinkInfo.bA2dpOnly) { /* A2DP */
-			if (!bWifiBusy)
+		if (bt_coexist->btLinkInfo.bA2dpOnly) { /* A2DP */
+			if (!wifi_busy)
 				halbtc8723b1ant_PowerSaveState(
-					pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0
+					bt_coexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0
 				);
 			else { /* busy */
 				if  (pCoexSta->nScanAPNum >= BT_8723B_1ANT_WIFI_NOISY_THRESH)  /* no force LPS, no PS-TDMA, use pure TDMA */
 					halbtc8723b1ant_PowerSaveState(
-						pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0
+						bt_coexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0
 					);
 				else
 					halbtc8723b1ant_PowerSaveState(
-						pBtCoexist, BTC_PS_LPS_ON, 0x50, 0x4
+						bt_coexist, BTC_PS_LPS_ON, 0x50, 0x4
 					);
 			}
 		} else if (
@@ -1882,37 +1882,37 @@ static void halbtc8723b1ant_ActionWifiConnected(struct btc_coexist *pBtCoexist)
 			(!pCoexSta->bA2dpExist) &&
 			(!pCoexSta->bHidExist)
 		)
-			halbtc8723b1ant_PowerSaveState(pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
+			halbtc8723b1ant_PowerSaveState(bt_coexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
 		else
-			halbtc8723b1ant_PowerSaveState(pBtCoexist, BTC_PS_LPS_ON, 0x50, 0x4);
+			halbtc8723b1ant_PowerSaveState(bt_coexist, BTC_PS_LPS_ON, 0x50, 0x4);
 	} else
-		halbtc8723b1ant_PowerSaveState(pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
+		halbtc8723b1ant_PowerSaveState(bt_coexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
 
 	/*  tdma and coex table */
-	if (!bWifiBusy) {
+	if (!wifi_busy) {
 		if (pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_BUSY) {
 			halbtc8723b1ant_ActionWifiConnectedBtAclBusy(
-				pBtCoexist,
+				bt_coexist,
 				BT_8723B_1ANT_WIFI_STATUS_CONNECTED_IDLE
 			);
 		} else if (
 			(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_SCO_BUSY) ||
 			(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY)
 		) {
-			halbtc8723b1ant_ActionBtScoHidOnlyBusy(pBtCoexist,
+			halbtc8723b1ant_ActionBtScoHidOnlyBusy(bt_coexist,
 				BT_8723B_1ANT_WIFI_STATUS_CONNECTED_IDLE);
 		} else {
-			halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, false, 8);
+			halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, false, 8);
 
 			if ((pCoexSta->highPriorityTx) + (pCoexSta->highPriorityRx) <= 60)
-				halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 2);
+				halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 2);
 			else
-				halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 7);
+				halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 7);
 		}
 	} else {
 		if (pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_BUSY) {
 			halbtc8723b1ant_ActionWifiConnectedBtAclBusy(
-				pBtCoexist,
+				bt_coexist,
 				BT_8723B_1ANT_WIFI_STATUS_CONNECTED_BUSY
 			);
 		} else if (
@@ -1920,60 +1920,60 @@ static void halbtc8723b1ant_ActionWifiConnected(struct btc_coexist *pBtCoexist)
 			(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY)
 		) {
 			halbtc8723b1ant_ActionBtScoHidOnlyBusy(
-				pBtCoexist,
+				bt_coexist,
 				BT_8723B_1ANT_WIFI_STATUS_CONNECTED_BUSY
 			);
 		} else {
-			halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, false, 8);
+			halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, false, 8);
 
 			if ((pCoexSta->highPriorityTx) + (pCoexSta->highPriorityRx) <= 60)
-				halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 2);
+				halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 2);
 			else
-				halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 7);
+				halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 7);
 		}
 	}
 }
 
-static void halbtc8723b1ant_RunSwCoexistMechanism(struct btc_coexist *pBtCoexist)
+static void halbtc8723b1ant_RunSwCoexistMechanism(struct btc_coexist *bt_coexist)
 {
 	u8 algorithm = 0;
 
-	algorithm = halbtc8723b1ant_ActionAlgorithm(pBtCoexist);
+	algorithm = halbtc8723b1ant_ActionAlgorithm(bt_coexist);
 	pCoexDm->curAlgorithm = algorithm;
 
-	if (halbtc8723b1ant_IsCommonAction(pBtCoexist)) {
+	if (halbtc8723b1ant_IsCommonAction(bt_coexist)) {
 
 	} else {
 		switch (pCoexDm->curAlgorithm) {
 		case BT_8723B_1ANT_COEX_ALGO_SCO:
-			/* halbtc8723b1ant_ActionSco(pBtCoexist); */
+			/* halbtc8723b1ant_ActionSco(bt_coexist); */
 			break;
 		case BT_8723B_1ANT_COEX_ALGO_HID:
-			/* halbtc8723b1ant_ActionHid(pBtCoexist); */
+			/* halbtc8723b1ant_ActionHid(bt_coexist); */
 			break;
 		case BT_8723B_1ANT_COEX_ALGO_A2DP:
-			/* halbtc8723b1ant_ActionA2dp(pBtCoexist); */
+			/* halbtc8723b1ant_ActionA2dp(bt_coexist); */
 			break;
 		case BT_8723B_1ANT_COEX_ALGO_A2DP_PANHS:
-			/* halbtc8723b1ant_ActionA2dpPanHs(pBtCoexist); */
+			/* halbtc8723b1ant_ActionA2dpPanHs(bt_coexist); */
 			break;
 		case BT_8723B_1ANT_COEX_ALGO_PANEDR:
-			/* halbtc8723b1ant_ActionPanEdr(pBtCoexist); */
+			/* halbtc8723b1ant_ActionPanEdr(bt_coexist); */
 			break;
 		case BT_8723B_1ANT_COEX_ALGO_PANHS:
-			/* halbtc8723b1ant_ActionPanHs(pBtCoexist); */
+			/* halbtc8723b1ant_ActionPanHs(bt_coexist); */
 			break;
 		case BT_8723B_1ANT_COEX_ALGO_PANEDR_A2DP:
-			/* halbtc8723b1ant_ActionPanEdrA2dp(pBtCoexist); */
+			/* halbtc8723b1ant_ActionPanEdrA2dp(bt_coexist); */
 			break;
 		case BT_8723B_1ANT_COEX_ALGO_PANEDR_HID:
-			/* halbtc8723b1ant_ActionPanEdrHid(pBtCoexist); */
+			/* halbtc8723b1ant_ActionPanEdrHid(bt_coexist); */
 			break;
 		case BT_8723B_1ANT_COEX_ALGO_HID_A2DP_PANEDR:
-			/* halbtc8723b1ant_ActionHidA2dpPanEdr(pBtCoexist); */
+			/* halbtc8723b1ant_ActionHidA2dpPanEdr(bt_coexist); */
 			break;
 		case BT_8723B_1ANT_COEX_ALGO_HID_A2DP:
-			/* halbtc8723b1ant_ActionHidA2dp(pBtCoexist); */
+			/* halbtc8723b1ant_ActionHidA2dp(bt_coexist); */
 			break;
 		default:
 			break;
@@ -1982,20 +1982,20 @@ static void halbtc8723b1ant_RunSwCoexistMechanism(struct btc_coexist *pBtCoexist
 	}
 }
 
-static void halbtc8723b1ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
+static void halbtc8723b1ant_RunCoexistMechanism(struct btc_coexist *bt_coexist)
 {
-	struct btc_bt_link_info *pBtLinkInfo = &pBtCoexist->btLinkInfo;
+	struct btc_bt_link_info *pBtLinkInfo = &bt_coexist->btLinkInfo;
 	bool bWifiConnected = false, bBtHsOn = false;
 	bool bIncreaseScanDevNum = false;
-	bool bBtCtrlAggBufSize = false;
-	u8 aggBufSize = 5;
+	bool bt_ctrl_agg_buf_size = false;
+	u8 agg_buf_size = 5;
 	u32 wifiLinkStatus = 0;
 	u32 numOfWifiLink = 0;
 
-	if (pBtCoexist->bManualControl)
+	if (bt_coexist->bManualControl)
 		return;
 
-	if (pBtCoexist->bStopCoexDm)
+	if (bt_coexist->bStopCoexDm)
 		return;
 
 	if (pCoexSta->bUnderIps)
@@ -2009,61 +2009,61 @@ static void halbtc8723b1ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
 		bIncreaseScanDevNum = true;
 	}
 
-	pBtCoexist->fBtcSet(
-		pBtCoexist,
+	bt_coexist->fBtcSet(
+		bt_coexist,
 		BTC_SET_BL_INC_SCAN_DEV_NUM,
 		&bIncreaseScanDevNum
 	);
-	pBtCoexist->fBtcGet(
-		pBtCoexist,
+	bt_coexist->fBtcGet(
+		bt_coexist,
 		BTC_GET_BL_WIFI_CONNECTED,
 		&bWifiConnected
 	);
 
-	pBtCoexist->fBtcGet(
-		pBtCoexist,
+	bt_coexist->fBtcGet(
+		bt_coexist,
 		BTC_GET_U4_WIFI_LINK_STATUS,
 		&wifiLinkStatus
 	);
 	numOfWifiLink = wifiLinkStatus >> 16;
 
 	if ((numOfWifiLink >= 2) || (wifiLinkStatus & WIFI_P2P_GO_CONNECTED)) {
-		halbtc8723b1ant_LimitedTx(pBtCoexist, NORMAL_EXEC, 0, 0, 0, 0);
-		halbtc8723b1ant_LimitedRx(pBtCoexist, NORMAL_EXEC, false, bBtCtrlAggBufSize, aggBufSize);
+		halbtc8723b1ant_LimitedTx(bt_coexist, NORMAL_EXEC, 0, 0, 0, 0);
+		halbtc8723b1ant_LimitedRx(bt_coexist, NORMAL_EXEC, false, bt_ctrl_agg_buf_size, agg_buf_size);
 
 		if ((pBtLinkInfo->bA2dpExist) && (pCoexSta->bC2hBtInquiryPage))
-			halbtc8723b1ant_ActionBtInquiry(pBtCoexist);
+			halbtc8723b1ant_ActionBtInquiry(bt_coexist);
 		else
-			halbtc8723b1ant_ActionWifiMultiPort(pBtCoexist);
+			halbtc8723b1ant_ActionWifiMultiPort(bt_coexist);
 
 		return;
 	}
 
 	if ((pBtLinkInfo->bBtLinkExist) && (bWifiConnected)) {
-		halbtc8723b1ant_LimitedTx(pBtCoexist, NORMAL_EXEC, 1, 1, 0, 1);
+		halbtc8723b1ant_LimitedTx(bt_coexist, NORMAL_EXEC, 1, 1, 0, 1);
 
 		if (pBtLinkInfo->bScoExist)
-			halbtc8723b1ant_LimitedRx(pBtCoexist, NORMAL_EXEC, false, true, 0x5);
+			halbtc8723b1ant_LimitedRx(bt_coexist, NORMAL_EXEC, false, true, 0x5);
 		else
-			halbtc8723b1ant_LimitedRx(pBtCoexist, NORMAL_EXEC, false, true, 0x8);
+			halbtc8723b1ant_LimitedRx(bt_coexist, NORMAL_EXEC, false, true, 0x8);
 
-		halbtc8723b1ant_SwMechanism(pBtCoexist, true);
-		halbtc8723b1ant_RunSwCoexistMechanism(pBtCoexist);  /* just print debug message */
+		halbtc8723b1ant_SwMechanism(bt_coexist, true);
+		halbtc8723b1ant_RunSwCoexistMechanism(bt_coexist);  /* just print debug message */
 	} else {
-		halbtc8723b1ant_LimitedTx(pBtCoexist, NORMAL_EXEC, 0, 0, 0, 0);
+		halbtc8723b1ant_LimitedTx(bt_coexist, NORMAL_EXEC, 0, 0, 0, 0);
 
-		halbtc8723b1ant_LimitedRx(pBtCoexist, NORMAL_EXEC, false, false, 0x5);
+		halbtc8723b1ant_LimitedRx(bt_coexist, NORMAL_EXEC, false, false, 0x5);
 
-		halbtc8723b1ant_SwMechanism(pBtCoexist, false);
-		halbtc8723b1ant_RunSwCoexistMechanism(pBtCoexist); /* just print debug message */
+		halbtc8723b1ant_SwMechanism(bt_coexist, false);
+		halbtc8723b1ant_RunSwCoexistMechanism(bt_coexist); /* just print debug message */
 	}
 
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_HS_OPERATION, &bBtHsOn);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_HS_OPERATION, &bBtHsOn);
 	if (pCoexSta->bC2hBtInquiryPage) {
-		halbtc8723b1ant_ActionBtInquiry(pBtCoexist);
+		halbtc8723b1ant_ActionBtInquiry(bt_coexist);
 		return;
 	} else if (bBtHsOn) {
-		halbtc8723b1ant_ActionHs(pBtCoexist);
+		halbtc8723b1ant_ActionHs(bt_coexist);
 		return;
 	}
 
@@ -2071,62 +2071,62 @@ static void halbtc8723b1ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
 	if (!bWifiConnected) {
 		bool bScan = false, bLink = false, bRoam = false;
 
-		pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_SCAN, &bScan);
-		pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_LINK, &bLink);
-		pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_ROAM, &bRoam);
+		bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_SCAN, &bScan);
+		bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_LINK, &bLink);
+		bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_ROAM, &bRoam);
 
 		if (bScan || bLink || bRoam) {
 			if (bScan)
-				halbtc8723b1ant_ActionWifiNotConnectedScan(pBtCoexist);
+				halbtc8723b1ant_ActionWifiNotConnectedScan(bt_coexist);
 			else
-				halbtc8723b1ant_ActionWifiNotConnectedAssoAuth(pBtCoexist);
+				halbtc8723b1ant_ActionWifiNotConnectedAssoAuth(bt_coexist);
 		} else
-			halbtc8723b1ant_ActionWifiNotConnected(pBtCoexist);
+			halbtc8723b1ant_ActionWifiNotConnected(bt_coexist);
 	} else /*  wifi LPS/Busy */
-		halbtc8723b1ant_ActionWifiConnected(pBtCoexist);
+		halbtc8723b1ant_ActionWifiConnected(bt_coexist);
 }
 
-static void halbtc8723b1ant_InitCoexDm(struct btc_coexist *pBtCoexist)
+static void halbtc8723b1ant_InitCoexDm(struct btc_coexist *bt_coexist)
 {
 	/*  force to reset coex mechanism */
 
 	/*  sw all off */
-	halbtc8723b1ant_SwMechanism(pBtCoexist, false);
+	halbtc8723b1ant_SwMechanism(bt_coexist, false);
 
-	/* halbtc8723b1ant_PsTdma(pBtCoexist, FORCE_EXEC, false, 8); */
-	halbtc8723b1ant_CoexTableWithType(pBtCoexist, FORCE_EXEC, 0);
+	/* halbtc8723b1ant_PsTdma(bt_coexist, FORCE_EXEC, false, 8); */
+	halbtc8723b1ant_CoexTableWithType(bt_coexist, FORCE_EXEC, 0);
 
 	pCoexSta->popEventCnt = 0;
 }
 
 static void halbtc8723b1ant_InitHwConfig(
-	struct btc_coexist *pBtCoexist,
+	struct btc_coexist *bt_coexist,
 	bool bBackUp,
 	bool bWifiOnly
 )
 {
-	pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x550, 0x8, 0x1);  /* enable TBTT nterrupt */
+	bt_coexist->fBtcWrite1ByteBitMask(bt_coexist, 0x550, 0x8, 0x1);  /* enable TBTT nterrupt */
 
 	/*  0x790[5:0]= 0x5 */
-	pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x790, 0x5);
+	bt_coexist->fBtcWrite1Byte(bt_coexist, 0x790, 0x5);
 
 	/*  Enable counter statistics */
-	pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x778, 0x1);
-	pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x40, 0x20, 0x1);
+	bt_coexist->fBtcWrite1Byte(bt_coexist, 0x778, 0x1);
+	bt_coexist->fBtcWrite1ByteBitMask(bt_coexist, 0x40, 0x20, 0x1);
 
 	/* Antenna config */
 	if (bWifiOnly) {
-		halbtc8723b1ant_SetAntPath(pBtCoexist, BTC_ANT_PATH_WIFI, true, false);
-		halbtc8723b1ant_PsTdma(pBtCoexist, FORCE_EXEC, false, 9);
+		halbtc8723b1ant_SetAntPath(bt_coexist, BTC_ANT_PATH_WIFI, true, false);
+		halbtc8723b1ant_PsTdma(bt_coexist, FORCE_EXEC, false, 9);
 	} else
-		halbtc8723b1ant_SetAntPath(pBtCoexist, BTC_ANT_PATH_BT, true, false);
+		halbtc8723b1ant_SetAntPath(bt_coexist, BTC_ANT_PATH_BT, true, false);
 
 	/*  PTA parameter */
-	halbtc8723b1ant_CoexTableWithType(pBtCoexist, FORCE_EXEC, 0);
+	halbtc8723b1ant_CoexTableWithType(bt_coexist, FORCE_EXEC, 0);
 
-	pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x948);
-	pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x765);
-	pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x67);
+	bt_coexist->fBtcRead4Byte(bt_coexist, 0x948);
+	bt_coexist->fBtcRead1Byte(bt_coexist, 0x765);
+	bt_coexist->fBtcRead1Byte(bt_coexist, 0x67);
 }
 
 /*  */
@@ -2135,22 +2135,22 @@ static void halbtc8723b1ant_InitHwConfig(
 /*  */
 /*  extern function start with EXhalbtc8723b1ant_ */
 /*  */
-void EXhalbtc8723b1ant_PowerOnSetting(struct btc_coexist *pBtCoexist)
+void EXhalbtc8723b1ant_PowerOnSetting(struct btc_coexist *bt_coexist)
 {
-	struct btc_board_info *pBoardInfo = &pBtCoexist->boardInfo;
+	struct btc_board_info *pBoardInfo = &bt_coexist->boardInfo;
 	u8 u1Tmp = 0x0;
 	u16 u2Tmp = 0x0;
 
-	pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x67, 0x20);
+	bt_coexist->fBtcWrite1Byte(bt_coexist, 0x67, 0x20);
 
 	/*  enable BB, REG_SYS_FUNC_EN such that we can write 0x948 correctly. */
-	u2Tmp = pBtCoexist->fBtcRead2Byte(pBtCoexist, 0x2);
-	pBtCoexist->fBtcWrite2Byte(pBtCoexist, 0x2, u2Tmp | BIT0 | BIT1);
+	u2Tmp = bt_coexist->fBtcRead2Byte(bt_coexist, 0x2);
+	bt_coexist->fBtcWrite2Byte(bt_coexist, 0x2, u2Tmp | BIT0 | BIT1);
 
 	/*  set GRAN_BT = 1 */
-	pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x765, 0x18);
+	bt_coexist->fBtcWrite1Byte(bt_coexist, 0x765, 0x18);
 	/*  set WLAN_ACT = 0 */
-	pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x76e, 0x4);
+	bt_coexist->fBtcWrite1Byte(bt_coexist, 0x76e, 0x4);
 
 	/*  */
 	/*  S0 or S1 setting and Local register setting(By the setting fw can get ant number, S0/S1, ... info) */
@@ -2159,71 +2159,71 @@ void EXhalbtc8723b1ant_PowerOnSetting(struct btc_coexist *pBtCoexist)
 	/*	BIT1: "0" for internal switch; "1" for external switch */
 	/*	BIT2: "0" for one antenna; "1" for two antenna */
 	/*  NOTE: here default all internal switch and 1-antenna ==> BIT1 = 0 and BIT2 = 0 */
-	if (pBtCoexist->chipInterface == BTC_INTF_USB) {
+	if (bt_coexist->chipInterface == BTC_INTF_USB) {
 		/*  fixed at S0 for USB interface */
-		pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x0);
+		bt_coexist->fBtcWrite4Byte(bt_coexist, 0x948, 0x0);
 
 		u1Tmp |= 0x1;	/*  antenna inverse */
-		pBtCoexist->fBtcWriteLocalReg1Byte(pBtCoexist, 0xfe08, u1Tmp);
+		bt_coexist->fBtcWriteLocalReg1Byte(bt_coexist, 0xfe08, u1Tmp);
 
 		pBoardInfo->btdmAntPos = BTC_ANTENNA_AT_AUX_PORT;
 	} else {
 		/*  for PCIE and SDIO interface, we check efuse 0xc3[6] */
 		if (pBoardInfo->singleAntPath == 0) {
 			/*  set to S1 */
-			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x280);
+			bt_coexist->fBtcWrite4Byte(bt_coexist, 0x948, 0x280);
 			pBoardInfo->btdmAntPos = BTC_ANTENNA_AT_MAIN_PORT;
 		} else if (pBoardInfo->singleAntPath == 1) {
 			/*  set to S0 */
-			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x0);
+			bt_coexist->fBtcWrite4Byte(bt_coexist, 0x948, 0x0);
 			u1Tmp |= 0x1;	/*  antenna inverse */
 			pBoardInfo->btdmAntPos = BTC_ANTENNA_AT_AUX_PORT;
 		}
 
-		if (pBtCoexist->chipInterface == BTC_INTF_PCI)
-			pBtCoexist->fBtcWriteLocalReg1Byte(pBtCoexist, 0x384, u1Tmp);
-		else if (pBtCoexist->chipInterface == BTC_INTF_SDIO)
-			pBtCoexist->fBtcWriteLocalReg1Byte(pBtCoexist, 0x60, u1Tmp);
+		if (bt_coexist->chipInterface == BTC_INTF_PCI)
+			bt_coexist->fBtcWriteLocalReg1Byte(bt_coexist, 0x384, u1Tmp);
+		else if (bt_coexist->chipInterface == BTC_INTF_SDIO)
+			bt_coexist->fBtcWriteLocalReg1Byte(bt_coexist, 0x60, u1Tmp);
 	}
 }
 
-void EXhalbtc8723b1ant_InitHwConfig(struct btc_coexist *pBtCoexist, bool bWifiOnly)
+void EXhalbtc8723b1ant_InitHwConfig(struct btc_coexist *bt_coexist, bool bWifiOnly)
 {
-	halbtc8723b1ant_InitHwConfig(pBtCoexist, true, bWifiOnly);
+	halbtc8723b1ant_InitHwConfig(bt_coexist, true, bWifiOnly);
 }
 
-void EXhalbtc8723b1ant_InitCoexDm(struct btc_coexist *pBtCoexist)
+void EXhalbtc8723b1ant_InitCoexDm(struct btc_coexist *bt_coexist)
 {
-	pBtCoexist->bStopCoexDm = false;
+	bt_coexist->bStopCoexDm = false;
 
-	halbtc8723b1ant_InitCoexDm(pBtCoexist);
+	halbtc8723b1ant_InitCoexDm(bt_coexist);
 
-	halbtc8723b1ant_QueryBtInfo(pBtCoexist);
+	halbtc8723b1ant_QueryBtInfo(bt_coexist);
 }
 
-void EXhalbtc8723b1ant_IpsNotify(struct btc_coexist *pBtCoexist, u8 type)
+void EXhalbtc8723b1ant_IpsNotify(struct btc_coexist *bt_coexist, u8 type)
 {
-	if (pBtCoexist->bManualControl ||	pBtCoexist->bStopCoexDm)
+	if (bt_coexist->bManualControl ||	bt_coexist->bStopCoexDm)
 		return;
 
 	if (type == BTC_IPS_ENTER) {
 		pCoexSta->bUnderIps = true;
 
-		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, false, 0);
-		halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 0);
-		halbtc8723b1ant_SetAntPath(pBtCoexist, BTC_ANT_PATH_BT, false, true);
+		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, false, 0);
+		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 0);
+		halbtc8723b1ant_SetAntPath(bt_coexist, BTC_ANT_PATH_BT, false, true);
 	} else if (type == BTC_IPS_LEAVE) {
 		pCoexSta->bUnderIps = false;
 
-		halbtc8723b1ant_InitHwConfig(pBtCoexist, false, false);
-		halbtc8723b1ant_InitCoexDm(pBtCoexist);
-		halbtc8723b1ant_QueryBtInfo(pBtCoexist);
+		halbtc8723b1ant_InitHwConfig(bt_coexist, false, false);
+		halbtc8723b1ant_InitCoexDm(bt_coexist);
+		halbtc8723b1ant_QueryBtInfo(bt_coexist);
 	}
 }
 
-void EXhalbtc8723b1ant_LpsNotify(struct btc_coexist *pBtCoexist, u8 type)
+void EXhalbtc8723b1ant_LpsNotify(struct btc_coexist *bt_coexist, u8 type)
 {
-	if (pBtCoexist->bManualControl || pBtCoexist->bStopCoexDm)
+	if (bt_coexist->bManualControl || bt_coexist->bStopCoexDm)
 		return;
 
 	if (type == BTC_LPS_ENABLE)
@@ -2232,85 +2232,85 @@ void EXhalbtc8723b1ant_LpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 		pCoexSta->bUnderLps = false;
 }
 
-void EXhalbtc8723b1ant_ScanNotify(struct btc_coexist *pBtCoexist, u8 type)
+void EXhalbtc8723b1ant_ScanNotify(struct btc_coexist *bt_coexist, u8 type)
 {
 	bool bWifiConnected = false, bBtHsOn = false;
 	u32 wifiLinkStatus = 0;
 	u32 numOfWifiLink = 0;
-	bool bBtCtrlAggBufSize = false;
-	u8 aggBufSize = 5;
+	bool bt_ctrl_agg_buf_size = false;
+	u8 agg_buf_size = 5;
 
-	if (pBtCoexist->bManualControl || pBtCoexist->bStopCoexDm)
+	if (bt_coexist->bManualControl || bt_coexist->bStopCoexDm)
 		return;
 
 	if (type == BTC_SCAN_START) {
 		pCoexSta->bWiFiIsHighPriTask = true;
 
-		halbtc8723b1ant_PsTdma(pBtCoexist, FORCE_EXEC, false, 8);  /* Force antenna setup for no scan result issue */
-		pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x948);
-		pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x765);
-		pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x67);
+		halbtc8723b1ant_PsTdma(bt_coexist, FORCE_EXEC, false, 8);  /* Force antenna setup for no scan result issue */
+		bt_coexist->fBtcRead4Byte(bt_coexist, 0x948);
+		bt_coexist->fBtcRead1Byte(bt_coexist, 0x765);
+		bt_coexist->fBtcRead1Byte(bt_coexist, 0x67);
 	} else {
 		pCoexSta->bWiFiIsHighPriTask = false;
 
-		pBtCoexist->fBtcGet(
-			pBtCoexist, BTC_GET_U1_AP_NUM, &pCoexSta->nScanAPNum
+		bt_coexist->fBtcGet(
+			bt_coexist, BTC_GET_U1_AP_NUM, &pCoexSta->nScanAPNum
 		);
 	}
 
-	if (pBtCoexist->btInfo.bBtDisabled)
+	if (bt_coexist->btInfo.bBtDisabled)
 		return;
 
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_HS_OPERATION, &bBtHsOn);
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_CONNECTED, &bWifiConnected);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_HS_OPERATION, &bBtHsOn);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_CONNECTED, &bWifiConnected);
 
-	halbtc8723b1ant_QueryBtInfo(pBtCoexist);
+	halbtc8723b1ant_QueryBtInfo(bt_coexist);
 
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_LINK_STATUS, &wifiLinkStatus);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_U4_WIFI_LINK_STATUS, &wifiLinkStatus);
 	numOfWifiLink = wifiLinkStatus >> 16;
 
 	if (numOfWifiLink >= 2) {
-		halbtc8723b1ant_LimitedTx(pBtCoexist, NORMAL_EXEC, 0, 0, 0, 0);
+		halbtc8723b1ant_LimitedTx(bt_coexist, NORMAL_EXEC, 0, 0, 0, 0);
 		halbtc8723b1ant_LimitedRx(
-			pBtCoexist, NORMAL_EXEC, false, bBtCtrlAggBufSize, aggBufSize
+			bt_coexist, NORMAL_EXEC, false, bt_ctrl_agg_buf_size, agg_buf_size
 		);
-		halbtc8723b1ant_ActionWifiMultiPort(pBtCoexist);
+		halbtc8723b1ant_ActionWifiMultiPort(bt_coexist);
 		return;
 	}
 
 	if (pCoexSta->bC2hBtInquiryPage) {
-		halbtc8723b1ant_ActionBtInquiry(pBtCoexist);
+		halbtc8723b1ant_ActionBtInquiry(bt_coexist);
 		return;
 	} else if (bBtHsOn) {
-		halbtc8723b1ant_ActionHs(pBtCoexist);
+		halbtc8723b1ant_ActionHs(bt_coexist);
 		return;
 	}
 
 	if (type == BTC_SCAN_START) {
 		if (!bWifiConnected)	/*  non-connected scan */
-			halbtc8723b1ant_ActionWifiNotConnectedScan(pBtCoexist);
+			halbtc8723b1ant_ActionWifiNotConnectedScan(bt_coexist);
 		else	/*  wifi is connected */
-			halbtc8723b1ant_ActionWifiConnectedScan(pBtCoexist);
+			halbtc8723b1ant_ActionWifiConnectedScan(bt_coexist);
 	} else if (type == BTC_SCAN_FINISH) {
 		if (!bWifiConnected)	/*  non-connected scan */
-			halbtc8723b1ant_ActionWifiNotConnected(pBtCoexist);
+			halbtc8723b1ant_ActionWifiNotConnected(bt_coexist);
 		else
-			halbtc8723b1ant_ActionWifiConnected(pBtCoexist);
+			halbtc8723b1ant_ActionWifiConnected(bt_coexist);
 	}
 }
 
-void EXhalbtc8723b1ant_ConnectNotify(struct btc_coexist *pBtCoexist, u8 type)
+void EXhalbtc8723b1ant_ConnectNotify(struct btc_coexist *bt_coexist, u8 type)
 {
 	bool bWifiConnected = false, bBtHsOn = false;
 	u32 wifiLinkStatus = 0;
 	u32 numOfWifiLink = 0;
-	bool bBtCtrlAggBufSize = false;
-	u8 aggBufSize = 5;
+	bool bt_ctrl_agg_buf_size = false;
+	u8 agg_buf_size = 5;
 
 	if (
-		pBtCoexist->bManualControl ||
-		pBtCoexist->bStopCoexDm ||
-		pBtCoexist->btInfo.bBtDisabled
+		bt_coexist->bManualControl ||
+		bt_coexist->bStopCoexDm ||
+		bt_coexist->btInfo.bBtDisabled
 	)
 		return;
 
@@ -2322,79 +2322,79 @@ void EXhalbtc8723b1ant_ConnectNotify(struct btc_coexist *pBtCoexist, u8 type)
 		/* pCoexDm->nArpCnt = 0; */
 	}
 
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_LINK_STATUS, &wifiLinkStatus);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_U4_WIFI_LINK_STATUS, &wifiLinkStatus);
 	numOfWifiLink = wifiLinkStatus >> 16;
 	if (numOfWifiLink >= 2) {
-		halbtc8723b1ant_LimitedTx(pBtCoexist, NORMAL_EXEC, 0, 0, 0, 0);
-		halbtc8723b1ant_LimitedRx(pBtCoexist, NORMAL_EXEC, false, bBtCtrlAggBufSize, aggBufSize);
-		halbtc8723b1ant_ActionWifiMultiPort(pBtCoexist);
+		halbtc8723b1ant_LimitedTx(bt_coexist, NORMAL_EXEC, 0, 0, 0, 0);
+		halbtc8723b1ant_LimitedRx(bt_coexist, NORMAL_EXEC, false, bt_ctrl_agg_buf_size, agg_buf_size);
+		halbtc8723b1ant_ActionWifiMultiPort(bt_coexist);
 		return;
 	}
 
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_HS_OPERATION, &bBtHsOn);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_HS_OPERATION, &bBtHsOn);
 	if (pCoexSta->bC2hBtInquiryPage) {
-		halbtc8723b1ant_ActionBtInquiry(pBtCoexist);
+		halbtc8723b1ant_ActionBtInquiry(bt_coexist);
 		return;
 	} else if (bBtHsOn) {
-		halbtc8723b1ant_ActionHs(pBtCoexist);
+		halbtc8723b1ant_ActionHs(bt_coexist);
 		return;
 	}
 
 	if (type == BTC_ASSOCIATE_START) {
-		halbtc8723b1ant_ActionWifiNotConnectedAssoAuth(pBtCoexist);
+		halbtc8723b1ant_ActionWifiNotConnectedAssoAuth(bt_coexist);
 	} else if (type == BTC_ASSOCIATE_FINISH) {
-		pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_CONNECTED, &bWifiConnected);
+		bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_CONNECTED, &bWifiConnected);
 		if (!bWifiConnected) /*  non-connected scan */
-			halbtc8723b1ant_ActionWifiNotConnected(pBtCoexist);
+			halbtc8723b1ant_ActionWifiNotConnected(bt_coexist);
 		else
-			halbtc8723b1ant_ActionWifiConnected(pBtCoexist);
+			halbtc8723b1ant_ActionWifiConnected(bt_coexist);
 	}
 }
 
-void EXhalbtc8723b1ant_MediaStatusNotify(struct btc_coexist *pBtCoexist, u8 type)
+void EXhalbtc8723b1ant_MediaStatusNotify(struct btc_coexist *bt_coexist, u8 type)
 {
 	u8 H2C_Parameter[3] = {0};
 	u32 wifiBw;
 	u8 wifiCentralChnl;
-	bool bWifiUnderBMode = false;
+	bool wifi_under_b_mode = false;
 
 	if (
-		pBtCoexist->bManualControl ||
-		pBtCoexist->bStopCoexDm ||
-		pBtCoexist->btInfo.bBtDisabled
+		bt_coexist->bManualControl ||
+		bt_coexist->bStopCoexDm ||
+		bt_coexist->btInfo.bBtDisabled
 	)
 		return;
 
 	if (type == BTC_MEDIA_CONNECT) {
-		pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_UNDER_B_MODE, &bWifiUnderBMode);
+		bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_UNDER_B_MODE, &wifi_under_b_mode);
 
 		/* Set CCK Tx/Rx high Pri except 11b mode */
-		if (bWifiUnderBMode) {
-			pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x6cd, 0x00); /* CCK Tx */
-			pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x6cf, 0x00); /* CCK Rx */
+		if (wifi_under_b_mode) {
+			bt_coexist->fBtcWrite1Byte(bt_coexist, 0x6cd, 0x00); /* CCK Tx */
+			bt_coexist->fBtcWrite1Byte(bt_coexist, 0x6cf, 0x00); /* CCK Rx */
 		} else {
-			pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x6cd, 0x10); /* CCK Tx */
-			pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x6cf, 0x10); /* CCK Rx */
+			bt_coexist->fBtcWrite1Byte(bt_coexist, 0x6cd, 0x10); /* CCK Tx */
+			bt_coexist->fBtcWrite1Byte(bt_coexist, 0x6cf, 0x10); /* CCK Rx */
 		}
 
-		pCoexDm->backupArfrCnt1 = pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x430);
-		pCoexDm->backupArfrCnt2 = pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x434);
-		pCoexDm->backupRetryLimit = pBtCoexist->fBtcRead2Byte(pBtCoexist, 0x42a);
-		pCoexDm->backupAmpduMaxTime = pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x456);
+		pCoexDm->backupArfrCnt1 = bt_coexist->fBtcRead4Byte(bt_coexist, 0x430);
+		pCoexDm->backupArfrCnt2 = bt_coexist->fBtcRead4Byte(bt_coexist, 0x434);
+		pCoexDm->backupRetryLimit = bt_coexist->fBtcRead2Byte(bt_coexist, 0x42a);
+		pCoexDm->backupAmpduMaxTime = bt_coexist->fBtcRead1Byte(bt_coexist, 0x456);
 	} else {
 		pCoexDm->nArpCnt = 0;
 
-		pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x6cd, 0x0); /* CCK Tx */
-		pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x6cf, 0x0); /* CCK Rx */
+		bt_coexist->fBtcWrite1Byte(bt_coexist, 0x6cd, 0x0); /* CCK Tx */
+		bt_coexist->fBtcWrite1Byte(bt_coexist, 0x6cf, 0x0); /* CCK Rx */
 	}
 
 	/*  only 2.4G we need to inform bt the chnl mask */
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U1_WIFI_CENTRAL_CHNL, &wifiCentralChnl);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_U1_WIFI_CENTRAL_CHNL, &wifiCentralChnl);
 	if ((type == BTC_MEDIA_CONNECT) && (wifiCentralChnl <= 14)) {
 		/* H2C_Parameter[0] = 0x1; */
 		H2C_Parameter[0] = 0x0;
 		H2C_Parameter[1] = wifiCentralChnl;
-		pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_BW, &wifiBw);
+		bt_coexist->fBtcGet(bt_coexist, BTC_GET_U4_WIFI_BW, &wifiBw);
 
 		if (wifiBw == BTC_WIFI_BW_HT40)
 			H2C_Parameter[2] = 0x30;
@@ -2406,21 +2406,21 @@ void EXhalbtc8723b1ant_MediaStatusNotify(struct btc_coexist *pBtCoexist, u8 type
 	pCoexDm->wifiChnlInfo[1] = H2C_Parameter[1];
 	pCoexDm->wifiChnlInfo[2] = H2C_Parameter[2];
 
-	pBtCoexist->fBtcFillH2c(pBtCoexist, 0x66, 3, H2C_Parameter);
+	bt_coexist->fBtcFillH2c(bt_coexist, 0x66, 3, H2C_Parameter);
 }
 
-void EXhalbtc8723b1ant_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 type)
+void EXhalbtc8723b1ant_SpecialPacketNotify(struct btc_coexist *bt_coexist, u8 type)
 {
 	bool bBtHsOn = false;
 	u32 wifiLinkStatus = 0;
 	u32 numOfWifiLink = 0;
-	bool bBtCtrlAggBufSize = false;
-	u8 aggBufSize = 5;
+	bool bt_ctrl_agg_buf_size = false;
+	u8 agg_buf_size = 5;
 
 	if (
-		pBtCoexist->bManualControl ||
-		pBtCoexist->bStopCoexDm ||
-		pBtCoexist->btInfo.bBtDisabled
+		bt_coexist->bManualControl ||
+		bt_coexist->bStopCoexDm ||
+		bt_coexist->btInfo.bBtDisabled
 	)
 		return;
 
@@ -2432,7 +2432,7 @@ void EXhalbtc8723b1ant_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 ty
 		if (type == BTC_PACKET_ARP) {
 			pCoexDm->nArpCnt++;
 
-			if (pCoexDm->nArpCnt >= 10) /*  if APR PKT > 10 after connect, do not go to ActionWifiConnectedSpecialPacket(pBtCoexist) */
+			if (pCoexDm->nArpCnt >= 10) /*  if APR PKT > 10 after connect, do not go to ActionWifiConnectedSpecialPacket(bt_coexist) */
 				pCoexSta->bWiFiIsHighPriTask = false;
 			else
 				pCoexSta->bWiFiIsHighPriTask = true;
@@ -2445,26 +2445,26 @@ void EXhalbtc8723b1ant_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 ty
 
 	pCoexSta->specialPktPeriodCnt = 0;
 
-	pBtCoexist->fBtcGet(
-		pBtCoexist, BTC_GET_U4_WIFI_LINK_STATUS, &wifiLinkStatus
+	bt_coexist->fBtcGet(
+		bt_coexist, BTC_GET_U4_WIFI_LINK_STATUS, &wifiLinkStatus
 	);
 	numOfWifiLink = wifiLinkStatus >> 16;
 
 	if (numOfWifiLink >= 2) {
-		halbtc8723b1ant_LimitedTx(pBtCoexist, NORMAL_EXEC, 0, 0, 0, 0);
+		halbtc8723b1ant_LimitedTx(bt_coexist, NORMAL_EXEC, 0, 0, 0, 0);
 		halbtc8723b1ant_LimitedRx(
-			pBtCoexist, NORMAL_EXEC, false, bBtCtrlAggBufSize, aggBufSize
+			bt_coexist, NORMAL_EXEC, false, bt_ctrl_agg_buf_size, agg_buf_size
 		);
-		halbtc8723b1ant_ActionWifiMultiPort(pBtCoexist);
+		halbtc8723b1ant_ActionWifiMultiPort(bt_coexist);
 		return;
 	}
 
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_HS_OPERATION, &bBtHsOn);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_HS_OPERATION, &bBtHsOn);
 	if (pCoexSta->bC2hBtInquiryPage) {
-		halbtc8723b1ant_ActionBtInquiry(pBtCoexist);
+		halbtc8723b1ant_ActionBtInquiry(bt_coexist);
 		return;
 	} else if (bBtHsOn) {
-		halbtc8723b1ant_ActionHs(pBtCoexist);
+		halbtc8723b1ant_ActionHs(bt_coexist);
 		return;
 	}
 
@@ -2473,11 +2473,11 @@ void EXhalbtc8723b1ant_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 ty
 		type == BTC_PACKET_EAPOL ||
 		((type == BTC_PACKET_ARP) && (pCoexSta->bWiFiIsHighPriTask))
 	)
-		halbtc8723b1ant_ActionWifiConnectedSpecialPacket(pBtCoexist);
+		halbtc8723b1ant_ActionWifiConnectedSpecialPacket(bt_coexist);
 }
 
 void EXhalbtc8723b1ant_BtInfoNotify(
-	struct btc_coexist *pBtCoexist, u8 *tmpBuf, u8 length
+	struct btc_coexist *bt_coexist, u8 *tmpBuf, u8 length
 )
 {
 	u8 btInfo = 0;
@@ -2509,32 +2509,32 @@ void EXhalbtc8723b1ant_BtInfoNotify(
 		else
 			pCoexSta->bC2hBtPage = false;
 
-		pCoexSta->btRssi = pCoexSta->btInfoC2h[rspSource][3] * 2 - 90;
+		pCoexSta->bt_rssi = pCoexSta->btInfoC2h[rspSource][3] * 2 - 90;
 		/* pCoexSta->btInfoC2h[rspSource][3]*2+10; */
 
 		pCoexSta->btInfoExt = pCoexSta->btInfoC2h[rspSource][4];
 
 		pCoexSta->bBtTxRxMask = (pCoexSta->btInfoC2h[rspSource][2] & 0x40);
-		pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_BL_BT_TX_RX_MASK, &pCoexSta->bBtTxRxMask);
+		bt_coexist->fBtcSet(bt_coexist, BTC_SET_BL_BT_TX_RX_MASK, &pCoexSta->bBtTxRxMask);
 
 		if (!pCoexSta->bBtTxRxMask) {
 			/* BT into is responded by BT FW and BT RF REG 0x3C != 0x15 => Need to switch BT TRx Mask */
-			pBtCoexist->fBtcSetBtReg(pBtCoexist, BTC_BT_REG_RF, 0x3c, 0x15);
+			bt_coexist->fBtcSetBtReg(bt_coexist, BTC_BT_REG_RF, 0x3c, 0x15);
 		}
 
 		/*  Here we need to resend some wifi info to BT */
 		/*  because bt is reset and loss of the info. */
 		if (pCoexSta->btInfoExt & BIT1) {
-			pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_CONNECTED, &bWifiConnected);
+			bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_CONNECTED, &bWifiConnected);
 			if (bWifiConnected)
-				EXhalbtc8723b1ant_MediaStatusNotify(pBtCoexist, BTC_MEDIA_CONNECT);
+				EXhalbtc8723b1ant_MediaStatusNotify(bt_coexist, BTC_MEDIA_CONNECT);
 			else
-				EXhalbtc8723b1ant_MediaStatusNotify(pBtCoexist, BTC_MEDIA_DISCONNECT);
+				EXhalbtc8723b1ant_MediaStatusNotify(bt_coexist, BTC_MEDIA_DISCONNECT);
 		}
 
 		if (pCoexSta->btInfoExt & BIT3) {
-			if (!pBtCoexist->bManualControl && !pBtCoexist->bStopCoexDm)
-				halbtc8723b1ant_IgnoreWlanAct(pBtCoexist, FORCE_EXEC, false);
+			if (!bt_coexist->bManualControl && !bt_coexist->bStopCoexDm)
+				halbtc8723b1ant_IgnoreWlanAct(bt_coexist, FORCE_EXEC, false);
 		} else {
 			/*  BT already NOT ignore Wlan active, do nothing here. */
 		}
@@ -2576,7 +2576,7 @@ void EXhalbtc8723b1ant_BtInfoNotify(
 			pCoexSta->bScoExist = false;
 	}
 
-	halbtc8723b1ant_UpdateBtLinkInfo(pBtCoexist);
+	halbtc8723b1ant_UpdateBtLinkInfo(bt_coexist);
 
 	btInfo = btInfo & 0x1f;  /* mask profile bit for connect-ilde identification (for CSR case: A2DP idle --> 0x41) */
 
@@ -2607,60 +2607,60 @@ void EXhalbtc8723b1ant_BtInfoNotify(
 		bBtBusy = true;
 	else
 		bBtBusy = false;
-	pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_BL_BT_TRAFFIC_BUSY, &bBtBusy);
+	bt_coexist->fBtcSet(bt_coexist, BTC_SET_BL_BT_TRAFFIC_BUSY, &bBtBusy);
 
-	halbtc8723b1ant_RunCoexistMechanism(pBtCoexist);
+	halbtc8723b1ant_RunCoexistMechanism(bt_coexist);
 }
 
-void EXhalbtc8723b1ant_HaltNotify(struct btc_coexist *pBtCoexist)
+void EXhalbtc8723b1ant_HaltNotify(struct btc_coexist *bt_coexist)
 {
-	halbtc8723b1ant_PowerSaveState(pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
-	halbtc8723b1ant_PsTdma(pBtCoexist, FORCE_EXEC, false, 0);
-	halbtc8723b1ant_SetAntPath(pBtCoexist, BTC_ANT_PATH_BT, false, true);
+	halbtc8723b1ant_PowerSaveState(bt_coexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
+	halbtc8723b1ant_PsTdma(bt_coexist, FORCE_EXEC, false, 0);
+	halbtc8723b1ant_SetAntPath(bt_coexist, BTC_ANT_PATH_BT, false, true);
 
-	halbtc8723b1ant_IgnoreWlanAct(pBtCoexist, FORCE_EXEC, true);
+	halbtc8723b1ant_IgnoreWlanAct(bt_coexist, FORCE_EXEC, true);
 
-	EXhalbtc8723b1ant_MediaStatusNotify(pBtCoexist, BTC_MEDIA_DISCONNECT);
+	EXhalbtc8723b1ant_MediaStatusNotify(bt_coexist, BTC_MEDIA_DISCONNECT);
 
-	pBtCoexist->bStopCoexDm = true;
+	bt_coexist->bStopCoexDm = true;
 }
 
-void EXhalbtc8723b1ant_PnpNotify(struct btc_coexist *pBtCoexist, u8 pnpState)
+void EXhalbtc8723b1ant_PnpNotify(struct btc_coexist *bt_coexist, u8 pnpState)
 {
 	if (pnpState == BTC_WIFI_PNP_SLEEP) {
-		halbtc8723b1ant_PowerSaveState(pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
-		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, false, 0);
-		halbtc8723b1ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 2);
-		halbtc8723b1ant_SetAntPath(pBtCoexist, BTC_ANT_PATH_BT, false, true);
+		halbtc8723b1ant_PowerSaveState(bt_coexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
+		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, false, 0);
+		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 2);
+		halbtc8723b1ant_SetAntPath(bt_coexist, BTC_ANT_PATH_BT, false, true);
 
-		pBtCoexist->bStopCoexDm = true;
+		bt_coexist->bStopCoexDm = true;
 	} else if (pnpState == BTC_WIFI_PNP_WAKE_UP) {
-		pBtCoexist->bStopCoexDm = false;
-		halbtc8723b1ant_InitHwConfig(pBtCoexist, false, false);
-		halbtc8723b1ant_InitCoexDm(pBtCoexist);
-		halbtc8723b1ant_QueryBtInfo(pBtCoexist);
+		bt_coexist->bStopCoexDm = false;
+		halbtc8723b1ant_InitHwConfig(bt_coexist, false, false);
+		halbtc8723b1ant_InitCoexDm(bt_coexist);
+		halbtc8723b1ant_QueryBtInfo(bt_coexist);
 	}
 }
 
-void EXhalbtc8723b1ant_Periodical(struct btc_coexist *pBtCoexist)
+void EXhalbtc8723b1ant_Periodical(struct btc_coexist *bt_coexist)
 {
 	static u8 disVerInfoCnt;
 	u32 fwVer = 0, btPatchVer = 0;
 
 	if (disVerInfoCnt <= 5) {
 		disVerInfoCnt += 1;
-		pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_BT_PATCH_VER, &btPatchVer);
-		pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_FW_VER, &fwVer);
+		bt_coexist->fBtcGet(bt_coexist, BTC_GET_U4_BT_PATCH_VER, &btPatchVer);
+		bt_coexist->fBtcGet(bt_coexist, BTC_GET_U4_WIFI_FW_VER, &fwVer);
 	}
 
-	halbtc8723b1ant_MonitorBtCtr(pBtCoexist);
-	halbtc8723b1ant_MonitorWiFiCtr(pBtCoexist);
+	halbtc8723b1ant_MonitorBtCtr(bt_coexist);
+	halbtc8723b1ant_MonitorWiFiCtr(bt_coexist);
 
 	if (
-		halbtc8723b1ant_IsWifiStatusChanged(pBtCoexist) ||
+		halbtc8723b1ant_IsWifiStatusChanged(bt_coexist) ||
 		pCoexDm->bAutoTdmaAdjust
 	)
-		halbtc8723b1ant_RunCoexistMechanism(pBtCoexist);
+		halbtc8723b1ant_RunCoexistMechanism(bt_coexist);
 
 	pCoexSta->specialPktPeriodCnt++;
 }
-- 
2.43.0

