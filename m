Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C239A20ADFE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 17:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743526819; cv=none; b=pW+BhJcqTbPlVU9kZe/EE9u4EaA56cX5oYgZ/LUPo81QVIlYqvjvYVlNzyGi4kcOKRBTDDLSef8+mpuM+ObmChKlGSE5bvV7yjUZvFv6dpYp6bI/SMEwtc/to6KuZ7G2ijhqfwf2hyaiU0fmoMzRNHK+DQOiqr6Q3JQnPjK/+IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743526819; c=relaxed/simple;
	bh=foDclbP/TlQRrCu8tgdi2aoPJ8hCxjzAQL0730Nl08c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B1lVncPtU9E2WBgl6FRwJbR7Ktv93ixxj0whE7ft47n8kUMFQ1pt8tiA57fCjyqg+e9y8I7IDE5Ee9eBQfXibKvThOg3Y7L33R9wm2zbDLU6a6kav0bUQPYckYPS9XKtKHzjS9bYWLUrXFf0ynrDUMF9xawZfcvqqWFuacrOUZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bUXAa56q; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bUXAa56q"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso43831645e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743526814; x=1744131614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63rntMu6mHz+tpAooeaR2mvAWehtxxAhVQYDRfaydoE=;
        b=bUXAa56q0gZtPQGP7+Xp3cfDCSAt0FFhUMetNbo7mpiRb3plFgRIyPbhVBx7Fh5f3h
         D/Pcm1xQMcxFJJylB8aRPGmAW5U4pzugRUidQ4S9fGu16GjQfeeC2iL/uwXgz9+xGzo5
         nCXSnwobC3BsjI5E5/XvRgR0VE1olyhL307wqEyBerDJE49pJfsESlIMUO1YYlQWfJhh
         6yRNfDxTt5RYO0N2y6Z5b2DHEtSU3sXRbeP/fddS7SS0omjwss0JpqMf7yEFSqSVJUCt
         fcil2hgPPblmzBu+YZ+qiNOcIurCYtbnBn95/dWntAX73uz6E26EgWll7Tx0NNFXc+JE
         6gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743526814; x=1744131614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63rntMu6mHz+tpAooeaR2mvAWehtxxAhVQYDRfaydoE=;
        b=MlyoT1/pEApHjEtvsqeyvRcDFvakw9E85vFwP3ikgOp6n85UydgXFMjcD0QgDFlUbA
         FwHTtBTfN2dnnB1uRtJhfj4l5++Dya3Cif+9oBFT80co94D4rPFEnmcxRDJLnjVxb3G5
         rbxRVVZlJDHcclsCGvnhS83U94dFtLp6YvzRn0DkSAZTnfXlj9H5mkJJDWhKt5jsRYNl
         DdstIeq8iYMQhCxTHf5CAxeKCoTA47UnNfkGXq0qiWyfBvyObYRwsoHbPbA0eHdMuE6f
         xygGIQv8YYHdrcuugb1I7sC17vlA8Uk81nNLZWotmyWZA8y+Vu6FmnF2i9UKr/FSadcB
         fQLg==
X-Forwarded-Encrypted: i=1; AJvYcCXPzogvP4v/fLBe3fDzeHVLoUdi7N/nhTlveNpHaPMwWMJ1eUhAhTXYFHDCVoddqlDZ5uPJJ8KansZ7Bro=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT2juaG5R96ENTBIpM3GKHcJXqRW1G1F4kg1AskST7bi9UQH+W
	EjHmMb4PmrVuM+xXKoo/G4sL8vo6qqTm8j1S0nMu/w74RyMR9msC
X-Gm-Gg: ASbGncu0VsqBYcUDDRgO8sPpoTM3ONkGejHExIDpXQX66axtc2U98e4iL6E5EX27w+I
	10WK+Qn0iV9uTQLVarf+D2TorW5/ZLreMslnEl/rlHOu1dktIW3idwvW7yKE2HQPvnJDQts/u6t
	Nri+MJOt05CE1ZGQly2UVGhA9xLJSmuvUxdHYLV14c3Ymea/BwgJxJtorUKhHDwE3bKX1g9dN3/
	+DKzPAuOqDHt6O6LrznM5Rn6g/VSti8WLdCBZGg3S7TzfB7cFrFX3h/zgyNtD4UJ5A4BrL5/iUY
	ohV/xgaFm68EYo2weSN8kwv5MiXn01KOlLuw4cI=
X-Google-Smtp-Source: AGHT+IFbxHMFA0W3St3sHLWQk/4FDHJ2Lyt4bjYdbnL/pzUpL00RhBxIR58DyEIGJ7ZA8mnSPQccQA==
X-Received: by 2002:a05:600c:1e8a:b0:43c:f81d:34 with SMTP id 5b1f17b1804b1-43ea7c717d1mr45707665e9.9.1743526813798;
        Tue, 01 Apr 2025 10:00:13 -0700 (PDT)
Received: from pc.. ([41.206.42.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fccfe2fsm161520215e9.22.2025.04.01.10.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 10:00:13 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] staging: rtl8723bs: fix check lines should not end with a '('
Date: Tue,  1 Apr 2025 19:59:36 +0300
Message-ID: <6d74b5c827923d1df30aefa66540f499bf62636a.1743524096.git.karanja99erick@gmail.com>
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

 Fix Line should not end with a '('
    so as to adhere to the Linux kernel
    coding-style guidelines.

Reported by checkpatch:
	CHECK: line should not end with a '('

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   | 898 ++++++++----------
 1 file changed, 398 insertions(+), 500 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index e3c67f98e8c0..6edb76cb3b6c 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -15,9 +15,7 @@ static struct coex_sta_8723b_1ant *pCoexSta = &GLCoexSta8723b1Ant;
 
 /*  local function proto type if needed */
 /*  local function start with halbtc8723b1ant_ */
-static u8 halbtc8723b1ant_BtRssiState(
-	u8 level_num, u8 rssi_thresh, u8 rssi_thresh1
-)
+static u8 halbtc8723b1ant_BtRssiState(u8 level_num, u8 rssi_thresh, u8 rssi_thresh1)
 {
 	s32 bt_rssi = 0;
 	u8 bt_rssi_state = pCoexSta->preBtRssiState;
@@ -25,9 +23,8 @@ static u8 halbtc8723b1ant_BtRssiState(
 	bt_rssi = pCoexSta->bt_rssi;
 
 	if (level_num == 2) {
-		if (
-			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_LOW) ||
-			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_LOW)
+		if ((pCoexSta->preBtRssiState == BTC_RSSI_STATE_LOW) ||
+		    (pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_LOW)
 		) {
 			if (bt_rssi >= (rssi_thresh + BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT))
 
@@ -44,16 +41,14 @@ static u8 halbtc8723b1ant_BtRssiState(
 		if (rssi_thresh > rssi_thresh1)
 			return pCoexSta->preBtRssiState;
 
-		if (
-			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_LOW) ||
-			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_LOW)
+		if ((pCoexSta->preBtRssiState == BTC_RSSI_STATE_LOW) ||
+		    (pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_LOW)
 		) {
 			if (bt_rssi >= (rssi_thresh + BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT))
 				bt_rssi_state = BTC_RSSI_STATE_MEDIUM;
 			else
 				bt_rssi_state = BTC_RSSI_STATE_STAY_LOW;
-		} else if (
-			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_MEDIUM) ||
+		} else if ((pCoexSta->preBtRssiState == BTC_RSSI_STATE_MEDIUM) ||
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_MEDIUM)
 		) {
 			if (bt_rssi >= (rssi_thresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT))
@@ -75,24 +70,21 @@ static u8 halbtc8723b1ant_BtRssiState(
 	return bt_rssi_state;
 }
 
-static void halbtc8723b1ant_UpdateRaMask(
-	struct btc_coexist *bt_coexist, bool force_exec, u32 dis_rate_mask
-)
+static void halbtc8723b1ant_UpdateRaMask(struct btc_coexist *bt_coexist, bool force_exec,
+					 u32 dis_rate_mask)
 {
 	pCoexDm->curRaMask = dis_rate_mask;
 
 	if (force_exec || (pCoexDm->preRaMask != pCoexDm->curRaMask))
-		bt_coexist->fBtcSet(
-			bt_coexist,
-			BTC_SET_ACT_UPDATE_RAMASK,
-			&pCoexDm->curRaMask
+		bt_coexist->fBtcSet(bt_coexist,
+				    BTC_SET_ACT_UPDATE_RAMASK,
+				    &pCoexDm->curRaMask
 		);
 	pCoexDm->preRaMask = pCoexDm->curRaMask;
 }
 
-static void halbtc8723b1ant_AutoRateFallbackRetry(
-	struct btc_coexist *bt_coexist, bool force_exec, u8 type
-)
+static void halbtc8723b1ant_AutoRateFallbackRetry(struct btc_coexist *bt_coexist, bool force_exec,
+						  u8 type)
 {
 	bool wifi_under_b_mode = false;
 
@@ -101,17 +93,12 @@ static void halbtc8723b1ant_AutoRateFallbackRetry(
 	if (force_exec || (pCoexDm->preArfrType != pCoexDm->curArfrType)) {
 		switch (pCoexDm->curArfrType) {
 		case 0:	/*  normal mode */
-			bt_coexist->fBtcWrite4Byte(
-				bt_coexist, 0x430, pCoexDm->backupArfrCnt1
-			);
-			bt_coexist->fBtcWrite4Byte(
-				bt_coexist, 0x434, pCoexDm->backupArfrCnt2
-			);
+			bt_coexist->fBtcWrite4Byte(bt_coexist, 0x430, pCoexDm->backupArfrCnt1);
+			bt_coexist->fBtcWrite4Byte(bt_coexist, 0x434, pCoexDm->backupArfrCnt2);
 			break;
 		case 1:
-			bt_coexist->fBtcGet(
-				bt_coexist, BTC_GET_BL_WIFI_UNDER_B_MODE, &wifi_under_b_mode
-			);
+			bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_UNDER_B_MODE,
+					    &wifi_under_b_mode);
 			if (wifi_under_b_mode) {
 				bt_coexist->fBtcWrite4Byte(bt_coexist, 0x430, 0x0);
 				bt_coexist->fBtcWrite4Byte(bt_coexist, 0x434, 0x01010101);
@@ -128,21 +115,14 @@ static void halbtc8723b1ant_AutoRateFallbackRetry(
 	pCoexDm->preArfrType = pCoexDm->curArfrType;
 }
 
-static void halbtc8723b1ant_RetryLimit(
-	struct btc_coexist *bt_coexist, bool force_exec, u8 type
-)
+static void halbtc8723b1ant_RetryLimit(struct btc_coexist *bt_coexist, bool force_exec, u8 type)
 {
 	pCoexDm->curRetryLimitType = type;
 
-	if (
-		force_exec ||
-		(pCoexDm->preRetryLimitType != pCoexDm->curRetryLimitType)
-	) {
+	if (force_exec || (pCoexDm->preRetryLimitType != pCoexDm->curRetryLimitType)) {
 		switch (pCoexDm->curRetryLimitType) {
 		case 0:	/*  normal mode */
-			bt_coexist->fBtcWrite2Byte(
-				bt_coexist, 0x42a, pCoexDm->backupRetryLimit
-			);
+			bt_coexist->fBtcWrite2Byte(bt_coexist, 0x42a, pCoexDm->backupRetryLimit);
 			break;
 		case 1:	/*  retry limit =8 */
 			bt_coexist->fBtcWrite2Byte(bt_coexist, 0x42a, 0x0808);
@@ -155,20 +135,15 @@ static void halbtc8723b1ant_RetryLimit(
 	pCoexDm->preRetryLimitType = pCoexDm->curRetryLimitType;
 }
 
-static void halbtc8723b1ant_AmpduMaxTime(
-	struct btc_coexist *bt_coexist, bool force_exec, u8 type
-)
+static void halbtc8723b1ant_AmpduMaxTime(struct btc_coexist *bt_coexist, bool force_exec, u8 type)
 {
 	pCoexDm->curAmpduTimeType = type;
 
-	if (
-		force_exec || (pCoexDm->preAmpduTimeType != pCoexDm->curAmpduTimeType)
+	if (force_exec || (pCoexDm->preAmpduTimeType != pCoexDm->curAmpduTimeType)
 	) {
 		switch (pCoexDm->curAmpduTimeType) {
 		case 0:	/*  normal mode */
-			bt_coexist->fBtcWrite1Byte(
-				bt_coexist, 0x456, pCoexDm->backupAmpduMaxTime
-			);
+			bt_coexist->fBtcWrite1Byte(bt_coexist, 0x456, pCoexDm->backupAmpduMaxTime);
 			break;
 		case 1:	/*  AMPDU timw = 0x38 * 32us */
 			bt_coexist->fBtcWrite1Byte(bt_coexist, 0x456, 0x38);
@@ -181,14 +156,9 @@ static void halbtc8723b1ant_AmpduMaxTime(
 	pCoexDm->preAmpduTimeType = pCoexDm->curAmpduTimeType;
 }
 
-static void halbtc8723b1ant_LimitedTx(
-	struct btc_coexist *bt_coexist,
-	bool force_exec,
-	u8 ra_mask_type,
-	u8 arfr_type,
-	u8 retry_limit_type,
-	u8 ampdu_time_type
-)
+static void halbtc8723b1ant_LimitedTx(struct btc_coexist *bt_coexist, bool force_exec,
+				      u8 ra_mask_type, u8 arfr_type,
+				      u8 retry_limit_type, u8 ampdu_time_type)
 {
 	switch (ra_mask_type) {
 	case 0:	/*  normal mode */
@@ -209,13 +179,11 @@ static void halbtc8723b1ant_LimitedTx(
 	halbtc8723b1ant_AmpduMaxTime(bt_coexist, force_exec, ampdu_time_type);
 }
 
-static void halbtc8723b1ant_LimitedRx(
-	struct btc_coexist *bt_coexist,
-	bool force_exec,
-	bool rej_ap_agg_pkt,
-	bool bt_ctrl_agg_buf_size,
-	u8 agg_buf_size
-)
+static void halbtc8723b1ant_LimitedRx(struct btc_coexist *bt_coexist,
+				      bool force_exec,
+				      bool rej_ap_agg_pkt,
+				      bool bt_ctrl_agg_buf_size,
+				      u8 agg_buf_size)
 {
 	bool bRejectRxAgg = rej_ap_agg_pkt;
 	bool bBtCtrlRxAggSize = bt_ctrl_agg_buf_size;
@@ -224,13 +192,9 @@ static void halbtc8723b1ant_LimitedRx(
 	/*  */
 	/*	Rx Aggregation related setting */
 	/*  */
-	bt_coexist->fBtcSet(
-		bt_coexist, BTC_SET_BL_TO_REJ_AP_AGG_PKT, &bRejectRxAgg
-	);
+	bt_coexist->fBtcSet(bt_coexist, BTC_SET_BL_TO_REJ_AP_AGG_PKT, &bRejectRxAgg);
 	/*  decide BT control aggregation buf size or not */
-	bt_coexist->fBtcSet(
-		bt_coexist, BTC_SET_BL_BT_CTRL_AGG_SIZE, &bBtCtrlRxAggSize
-	);
+	bt_coexist->fBtcSet(bt_coexist, BTC_SET_BL_BT_CTRL_AGG_SIZE, &bBtCtrlRxAggSize);
 	/*  aggregation buf size, only work when BT control Rx aggregation size. */
 	bt_coexist->fBtcSet(bt_coexist, BTC_SET_U1_AGG_BUF_SIZE, &rxAggSize);
 	/*  real update aggregation setting */
@@ -307,9 +271,7 @@ static void halbtc8723b1ant_MonitorWiFiCtr(struct btc_coexist *bt_coexist)
 
 	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_BUSY, &wifi_busy);
 	bt_coexist->fBtcGet(bt_coexist, BTC_GET_S4_WIFI_RSSI, &wifi_rssi);
-	bt_coexist->fBtcGet(
-		bt_coexist, BTC_GET_BL_WIFI_UNDER_B_MODE, &wifi_under_b_mode
-	);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_UNDER_B_MODE, &wifi_under_b_mode);
 
 	if (pCoexSta->bUnderIps) {
 		pCoexSta->nCRCOK_CCK = 0;
@@ -339,17 +301,13 @@ static void halbtc8723b1ant_MonitorWiFiCtr(struct btc_coexist *bt_coexist)
 	bt_coexist->fBtcWrite1ByteBitMask(bt_coexist, 0xf16, 0x1, 0x0);
 
 	if (wifi_busy && (wifi_rssi >= 30) && !wifi_under_b_mode) {
-		if (
-			(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_BUSY) ||
-			(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY) ||
-			(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_SCO_BUSY)
+		if ((pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_BUSY) ||
+		    (pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY) ||
+		    (pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_SCO_BUSY)
 		) {
-			if (
-				pCoexSta->nCRCOK_CCK > (
-					pCoexSta->nCRCOK_11g +
-					pCoexSta->nCRCOK_11n +
-					pCoexSta->nCRCOK_11nAgg
-				)
+			if (pCoexSta->nCRCOK_CCK > (pCoexSta->nCRCOK_11g +
+						    pCoexSta->nCRCOK_11n +
+						    pCoexSta->nCRCOK_11nAgg)
 			) {
 				if (nCCKLockCounter < 5)
 					nCCKLockCounter++;
@@ -391,14 +349,10 @@ static bool halbtc8723b1ant_IsWifiStatusChanged(struct btc_coexist *bt_coexist)
 	bool wifi_busy = false, bUnder4way = false, bBtHsOn = false;
 	bool bWifiConnected = false;
 
-	bt_coexist->fBtcGet(
-		bt_coexist, BTC_GET_BL_WIFI_CONNECTED, &bWifiConnected
-	);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_CONNECTED, &bWifiConnected);
 	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_BUSY, &wifi_busy);
 	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_HS_OPERATION, &bBtHsOn);
-	bt_coexist->fBtcGet(
-		bt_coexist, BTC_GET_BL_WIFI_4_WAY_PROGRESS, &bUnder4way
-	);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_4_WAY_PROGRESS, &bUnder4way);
 
 	if (bWifiConnected) {
 		if (wifi_busy != bPreWifiBusy) {
@@ -440,44 +394,40 @@ static void halbtc8723b1ant_UpdateBtLinkInfo(struct btc_coexist *bt_coexist)
 	}
 
 	/*  check if Sco only */
-	if (
-		pBtLinkInfo->bScoExist &&
-		!pBtLinkInfo->bA2dpExist &&
-		!pBtLinkInfo->bPanExist &&
-		!pBtLinkInfo->bHidExist
+	if (pBtLinkInfo->bScoExist &&
+	    !pBtLinkInfo->bA2dpExist &&
+	    !pBtLinkInfo->bPanExist &&
+	    !pBtLinkInfo->bHidExist
 	)
 		pBtLinkInfo->bScoOnly = true;
 	else
 		pBtLinkInfo->bScoOnly = false;
 
 	/*  check if A2dp only */
-	if (
-		!pBtLinkInfo->bScoExist &&
-		pBtLinkInfo->bA2dpExist &&
-		!pBtLinkInfo->bPanExist &&
-		!pBtLinkInfo->bHidExist
+	if (!pBtLinkInfo->bScoExist &&
+	    pBtLinkInfo->bA2dpExist &&
+	    !pBtLinkInfo->bPanExist &&
+	    !pBtLinkInfo->bHidExist
 	)
 		pBtLinkInfo->bA2dpOnly = true;
 	else
 		pBtLinkInfo->bA2dpOnly = false;
 
 	/*  check if Pan only */
-	if (
-		!pBtLinkInfo->bScoExist &&
-		!pBtLinkInfo->bA2dpExist &&
-		pBtLinkInfo->bPanExist &&
-		!pBtLinkInfo->bHidExist
+	if (!pBtLinkInfo->bScoExist &&
+	    !pBtLinkInfo->bA2dpExist &&
+	    pBtLinkInfo->bPanExist &&
+	    !pBtLinkInfo->bHidExist
 	)
 		pBtLinkInfo->bPanOnly = true;
 	else
 		pBtLinkInfo->bPanOnly = false;
 
 	/*  check if Hid only */
-	if (
-		!pBtLinkInfo->bScoExist &&
-		!pBtLinkInfo->bA2dpExist &&
-		!pBtLinkInfo->bPanExist &&
-		pBtLinkInfo->bHidExist
+	if (!pBtLinkInfo->bScoExist &&
+	    !pBtLinkInfo->bA2dpExist &&
+	    !pBtLinkInfo->bPanExist &&
+	    pBtLinkInfo->bHidExist
 	)
 		pBtLinkInfo->bHidOnly = true;
 	else
@@ -551,9 +501,7 @@ static u8 halbtc8723b1ant_ActionAlgorithm(struct btc_coexist *bt_coexist)
 		if (pBtLinkInfo->bScoExist) {
 			if (pBtLinkInfo->bHidExist && pBtLinkInfo->bA2dpExist) {
 				algorithm = BT_8723B_1ANT_COEX_ALGO_HID;
-			} else if (
-				pBtLinkInfo->bHidExist && pBtLinkInfo->bPanExist
-			) {
+			} else if (pBtLinkInfo->bHidExist && pBtLinkInfo->bPanExist) {
 				if (bBtHsOn)
 					algorithm = BT_8723B_1ANT_COEX_ALGO_HID_A2DP;
 				else
@@ -565,10 +513,9 @@ static u8 halbtc8723b1ant_ActionAlgorithm(struct btc_coexist *bt_coexist)
 					algorithm = BT_8723B_1ANT_COEX_ALGO_PANEDR_HID;
 			}
 		} else {
-			if (
-				pBtLinkInfo->bHidExist &&
-				pBtLinkInfo->bPanExist &&
-				pBtLinkInfo->bA2dpExist
+			if (pBtLinkInfo->bHidExist &&
+			    pBtLinkInfo->bPanExist &&
+			    pBtLinkInfo->bA2dpExist
 			) {
 				if (bBtHsOn)
 					algorithm = BT_8723B_1ANT_COEX_ALGO_HID_A2DP;
@@ -578,10 +525,9 @@ static u8 halbtc8723b1ant_ActionAlgorithm(struct btc_coexist *bt_coexist)
 		}
 	} else if (numOfDiffProfile >= 3) {
 		if (pBtLinkInfo->bScoExist) {
-			if (
-				pBtLinkInfo->bHidExist &&
-				pBtLinkInfo->bPanExist &&
-				pBtLinkInfo->bA2dpExist
+			if (pBtLinkInfo->bHidExist &&
+			    pBtLinkInfo->bPanExist &&
+			    pBtLinkInfo->bA2dpExist
 			) {
 				if (!bBtHsOn)
 					algorithm = BT_8723B_1ANT_COEX_ALGO_PANEDR_HID;
@@ -593,9 +539,8 @@ static u8 halbtc8723b1ant_ActionAlgorithm(struct btc_coexist *bt_coexist)
 	return algorithm;
 }
 
-static void halbtc8723b1ant_SetSwPenaltyTxRateAdaptive(
-	struct btc_coexist *bt_coexist, bool bLowPenaltyRa
-)
+static void halbtc8723b1ant_SetSwPenaltyTxRateAdaptive(struct btc_coexist *bt_coexist,
+						       bool bLowPenaltyRa)
 {
 	u8 H2C_Parameter[6] = {0};
 
@@ -612,9 +557,8 @@ static void halbtc8723b1ant_SetSwPenaltyTxRateAdaptive(
 	bt_coexist->fBtcFillH2c(bt_coexist, 0x69, 6, H2C_Parameter);
 }
 
-static void halbtc8723b1ant_LowPenaltyRa(
-	struct btc_coexist *bt_coexist, bool force_exec, bool bLowPenaltyRa
-)
+static void halbtc8723b1ant_LowPenaltyRa(struct btc_coexist *bt_coexist,
+					 bool force_exec, bool bLowPenaltyRa)
 {
 	pCoexDm->bCurLowPenaltyRa = bLowPenaltyRa;
 
@@ -622,19 +566,17 @@ static void halbtc8723b1ant_LowPenaltyRa(
 		if (pCoexDm->bPreLowPenaltyRa == pCoexDm->bCurLowPenaltyRa)
 			return;
 	}
-	halbtc8723b1ant_SetSwPenaltyTxRateAdaptive(
-		bt_coexist, pCoexDm->bCurLowPenaltyRa
-	);
+	halbtc8723b1ant_SetSwPenaltyTxRateAdaptive(bt_coexist,
+						   pCoexDm->bCurLowPenaltyRa);
 
 	pCoexDm->bPreLowPenaltyRa = pCoexDm->bCurLowPenaltyRa;
 }
 
-static void halbtc8723b1ant_SetCoexTable(
-	struct btc_coexist *bt_coexist,
-	u32 val0x6c0,
-	u32 val0x6c4,
-	u32 val0x6c8,
-	u8 val0x6cc
+static void halbtc8723b1ant_SetCoexTable(struct btc_coexist *bt_coexist,
+					 u32 val0x6c0,
+					 u32 val0x6c4,
+					 u32 val0x6c8,
+					 u8 val0x6cc
 )
 {
 	bt_coexist->fBtcWrite4Byte(bt_coexist, 0x6c0, val0x6c0);
@@ -646,13 +588,12 @@ static void halbtc8723b1ant_SetCoexTable(
 	bt_coexist->fBtcWrite1Byte(bt_coexist, 0x6cc, val0x6cc);
 }
 
-static void halbtc8723b1ant_CoexTable(
-	struct btc_coexist *bt_coexist,
-	bool force_exec,
-	u32 val0x6c0,
-	u32 val0x6c4,
-	u32 val0x6c8,
-	u8 val0x6cc
+static void halbtc8723b1ant_CoexTable(struct btc_coexist *bt_coexist,
+				      bool force_exec,
+				      u32 val0x6c0,
+				      u32 val0x6c4,
+				      u32 val0x6c8,
+				      u8 val0x6cc
 )
 {
 	pCoexDm->curVal0x6c0 = val0x6c0;
@@ -661,8 +602,7 @@ static void halbtc8723b1ant_CoexTable(
 	pCoexDm->curVal0x6cc = val0x6cc;
 
 	if (!force_exec) {
-		if (
-			(pCoexDm->preVal0x6c0 == pCoexDm->curVal0x6c0) &&
+		if ((pCoexDm->preVal0x6c0 == pCoexDm->curVal0x6c0) &&
 		    (pCoexDm->preVal0x6c4 == pCoexDm->curVal0x6c4) &&
 		    (pCoexDm->preVal0x6c8 == pCoexDm->curVal0x6c8) &&
 		    (pCoexDm->preVal0x6cc == pCoexDm->curVal0x6cc)
@@ -670,9 +610,7 @@ static void halbtc8723b1ant_CoexTable(
 			return;
 	}
 
-	halbtc8723b1ant_SetCoexTable(
-		bt_coexist, val0x6c0, val0x6c4, val0x6c8, val0x6cc
-	);
+	halbtc8723b1ant_SetCoexTable(bt_coexist, val0x6c0, val0x6c4, val0x6c8, val0x6cc);
 
 	pCoexDm->preVal0x6c0 = pCoexDm->curVal0x6c0;
 	pCoexDm->preVal0x6c4 = pCoexDm->curVal0x6c4;
@@ -680,61 +618,82 @@ static void halbtc8723b1ant_CoexTable(
 	pCoexDm->preVal0x6cc = pCoexDm->curVal0x6cc;
 }
 
-static void halbtc8723b1ant_CoexTableWithType(
-	struct btc_coexist *bt_coexist, bool force_exec, u8 type
-)
+static void halbtc8723b1ant_CoexTableWithType(struct btc_coexist *bt_coexist, bool force_exec,
+					      u8 type)
 {
 	pCoexSta->nCoexTableType = type;
 
 	switch (type) {
 	case 0:
-		halbtc8723b1ant_CoexTable(
-			bt_coexist, force_exec, 0x55555555, 0x55555555, 0xffffff, 0x3
-		);
+		halbtc8723b1ant_CoexTable(bt_coexist,
+					  force_exec,
+					  0x55555555,
+					  0x55555555,
+					  0xffffff,
+					  0x3);
 		break;
 	case 1:
-		halbtc8723b1ant_CoexTable(
-			bt_coexist, force_exec, 0x55555555, 0x5a5a5a5a, 0xffffff, 0x3
-		);
+		halbtc8723b1ant_CoexTable(bt_coexist,
+					  force_exec,
+					  0x55555555,
+					  0x5a5a5a5a,
+					  0xffffff,
+					  0x3);
 		break;
 	case 2:
-		halbtc8723b1ant_CoexTable(
-			bt_coexist, force_exec, 0x5a5a5a5a, 0x5a5a5a5a, 0xffffff, 0x3
-		);
+		halbtc8723b1ant_CoexTable(bt_coexist,
+					  force_exec,
+					  0x5a5a5a5a,
+					  0x5a5a5a5a,
+					  0xffffff,
+					  0x3);
 		break;
 	case 3:
-		halbtc8723b1ant_CoexTable(
-			bt_coexist, force_exec, 0xaaaa5555, 0xaaaa5a5a, 0xffffff, 0x3
-		);
+		halbtc8723b1ant_CoexTable(bt_coexist,
+					  force_exec,
+					  0xaaaa5555,
+					  0xaaaa5a5a,
+					  0xffffff,
+					  0x3);
 		break;
 	case 4:
-		halbtc8723b1ant_CoexTable(
-			bt_coexist, force_exec, 0x55555555, 0xaaaa5a5a, 0xffffff, 0x3
-		);
+		halbtc8723b1ant_CoexTable(bt_coexist,
+					  force_exec,
+					  0x55555555,
+					  0xaaaa5a5a,
+					  0xffffff,
+					  0x3);
 		break;
 	case 5:
-		halbtc8723b1ant_CoexTable(
-			bt_coexist, force_exec, 0x5a5a5a5a, 0xaaaa5a5a, 0xffffff, 0x3
-		);
+		halbtc8723b1ant_CoexTable(bt_coexist,
+					  force_exec,
+					  0x5a5a5a5a,
+					  0xaaaa5a5a,
+					  0xffffff,
+					  0x3);
 		break;
 	case 6:
-		halbtc8723b1ant_CoexTable(
-			bt_coexist, force_exec, 0x55555555, 0xaaaaaaaa, 0xffffff, 0x3
-		);
+		halbtc8723b1ant_CoexTable(bt_coexist,
+					  force_exec,
+					  0x55555555,
+					  0xaaaaaaaa,
+					  0xffffff,
+					  0x3);
 		break;
 	case 7:
-		halbtc8723b1ant_CoexTable(
-			bt_coexist, force_exec, 0xaaaaaaaa, 0xaaaaaaaa, 0xffffff, 0x3
-		);
+		halbtc8723b1ant_CoexTable(bt_coexist,
+					  force_exec,
+					  0xaaaaaaaa,
+					  0xaaaaaaaa,
+					  0xffffff,
+					  0x3);
 		break;
 	default:
 		break;
 	}
 }
 
-static void halbtc8723b1ant_SetFwIgnoreWlanAct(
-	struct btc_coexist *bt_coexist, bool bEnable
-)
+static void halbtc8723b1ant_SetFwIgnoreWlanAct(struct btc_coexist *bt_coexist, bool bEnable)
 {
 	u8 H2C_Parameter[1] = {0};
 
@@ -744,8 +703,9 @@ static void halbtc8723b1ant_SetFwIgnoreWlanAct(
 	bt_coexist->fBtcFillH2c(bt_coexist, 0x63, 1, H2C_Parameter);
 }
 
-static void halbtc8723b1ant_IgnoreWlanAct(
-	struct btc_coexist *bt_coexist, bool force_exec, bool bEnable
+static void halbtc8723b1ant_IgnoreWlanAct(struct btc_coexist *bt_coexist,
+					  bool force_exec,
+					  bool bEnable
 )
 {
 	pCoexDm->bCurIgnoreWlanAct = bEnable;
@@ -759,9 +719,7 @@ static void halbtc8723b1ant_IgnoreWlanAct(
 	pCoexDm->bPreIgnoreWlanAct = pCoexDm->bCurIgnoreWlanAct;
 }
 
-static void halbtc8723b1ant_SetLpsRpwm(
-	struct btc_coexist *bt_coexist, u8 lpsVal, u8 rpwmVal
-)
+static void halbtc8723b1ant_SetLpsRpwm(struct btc_coexist *bt_coexist, u8 lpsVal, u8 rpwmVal)
 {
 	u8 lps = lpsVal;
 	u8 rpwm = rpwmVal;
@@ -770,17 +728,18 @@ static void halbtc8723b1ant_SetLpsRpwm(
 	bt_coexist->fBtcSet(bt_coexist, BTC_SET_U1_RPWM_VAL, &rpwm);
 }
 
-static void halbtc8723b1ant_LpsRpwm(
-	struct btc_coexist *bt_coexist, bool force_exec, u8 lpsVal, u8 rpwmVal
+static void halbtc8723b1ant_LpsRpwm(struct btc_coexist *bt_coexist,
+				    bool force_exec,
+				    u8 lpsVal,
+				    u8 rpwmVal
 )
 {
 	pCoexDm->curLps = lpsVal;
 	pCoexDm->curRpwm = rpwmVal;
 
 	if (!force_exec) {
-		if (
-			(pCoexDm->preLps == pCoexDm->curLps) &&
-			(pCoexDm->preRpwm == pCoexDm->curRpwm)
+		if ((pCoexDm->preLps == pCoexDm->curLps) &&
+		    (pCoexDm->preRpwm == pCoexDm->curRpwm)
 		) {
 			return;
 		}
@@ -791,15 +750,17 @@ static void halbtc8723b1ant_LpsRpwm(
 	pCoexDm->preRpwm = pCoexDm->curRpwm;
 }
 
-static void halbtc8723b1ant_SwMechanism(
-	struct btc_coexist *bt_coexist, bool bLowPenaltyRA
+static void halbtc8723b1ant_SwMechanism(struct btc_coexist *bt_coexist,
+					bool bLowPenaltyRA
 )
 {
 	halbtc8723b1ant_LowPenaltyRa(bt_coexist, NORMAL_EXEC, bLowPenaltyRA);
 }
 
-static void halbtc8723b1ant_SetAntPath(
-	struct btc_coexist *bt_coexist, u8 antPosType, bool bInitHwCfg, bool bWifiOff
+static void halbtc8723b1ant_SetAntPath(struct btc_coexist *bt_coexist,
+				       u8 antPosType,
+				       bool bInitHwCfg,
+				       bool bWifiOff
 )
 {
 	struct btc_board_info *pBoardInfo = &bt_coexist->boardInfo;
@@ -984,8 +945,9 @@ static void halbtc8723b1ant_SetAntPath(
 	}
 }
 
-static void halbtc8723b1ant_SetFwPstdma(
-	struct btc_coexist *bt_coexist, u8 byte1, u8 byte2, u8 byte3, u8 byte4, u8 byte5
+static void halbtc8723b1ant_SetFwPstdma(struct btc_coexist *bt_coexist,
+					u8 byte1, u8 byte2, u8 byte3,
+					u8 byte4, u8 byte5
 )
 {
 	u8 H2C_Parameter[5] = {0};
@@ -1020,8 +982,9 @@ static void halbtc8723b1ant_SetFwPstdma(
 }
 
 
-static void halbtc8723b1ant_PsTdma(
-	struct btc_coexist *bt_coexist, bool force_exec, bool bTurnOn, u8 type
+static void halbtc8723b1ant_PsTdma(struct btc_coexist *bt_coexist,
+				   bool force_exec,
+				   bool bTurnOn, u8 type
 )
 {
 	struct btc_bt_link_info *pBtLinkInfo = &bt_coexist->btLinkInfo;
@@ -1037,9 +1000,8 @@ static void halbtc8723b1ant_PsTdma(
 	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_BUSY, &wifi_busy);
 
 	if (!force_exec) {
-		if (
-			(pCoexDm->bPrePsTdmaOn == pCoexDm->bCurPsTdmaOn) &&
-			(pCoexDm->prePsTdma == pCoexDm->curPsTdma)
+		if ((pCoexDm->bPrePsTdmaOn == pCoexDm->bCurPsTdmaOn) &&
+		    (pCoexDm->prePsTdma == pCoexDm->curPsTdma)
 		)
 			return;
 	}
@@ -1065,202 +1027,180 @@ static void halbtc8723b1ant_PsTdma(
 
 		switch (type) {
 		default:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0x51, 0x1a, 0x1a, 0x0, psTdmaByte4Val
+			halbtc8723b1ant_SetFwPstdma(bt_coexist,
+						    0x51,
+						    0x1a,
+						    0x1a,
+						    0x0,
+						    psTdmaByte4Val
 			);
 			break;
 		case 1:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist,
-				psTdmaByte0Val,
-				0x3a + nWiFiDurationAdjust,
-				0x03,
-				psTdmaByte3Val,
-				psTdmaByte4Val
+			halbtc8723b1ant_SetFwPstdma(bt_coexist,
+						    psTdmaByte0Val,
+						    0x3a + nWiFiDurationAdjust,
+						    0x03,
+						    psTdmaByte3Val,
+						    psTdmaByte4Val
 			);
 			break;
 		case 2:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist,
-				psTdmaByte0Val,
-				0x2d + nWiFiDurationAdjust,
-				0x03,
-				psTdmaByte3Val,
-				psTdmaByte4Val
+			halbtc8723b1ant_SetFwPstdma(bt_coexist,
+						    psTdmaByte0Val,
+						    0x2d + nWiFiDurationAdjust,
+						    0x03,
+						    psTdmaByte3Val,
+						    psTdmaByte4Val
 			);
 			break;
 		case 3:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0x51, 0x1d, 0x1d, 0x0, 0x10
+			halbtc8723b1ant_SetFwPstdma(bt_coexist,
+						    0x51,
+						    0x1d,
+						    0x1d,
+						    0x0,
+						    0x10
 			);
 			break;
 		case 4:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0x93, 0x15, 0x3, 0x14, 0x0
+			halbtc8723b1ant_SetFwPstdma(bt_coexist,
+						    0x93,
+						    0x15,
+						    0x3,
+						    0x14,
+						    0x0
 			);
 			break;
 		case 5:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0x61, 0x15, 0x3, 0x11, 0x10
+			halbtc8723b1ant_SetFwPstdma(bt_coexist,
+						    0x61,
+						    0x15,
+						    0x3,
+						    0x11,
+						    0x10
 			);
 			break;
 		case 6:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0x61, 0x20, 0x3, 0x11, 0x11
+			halbtc8723b1ant_SetFwPstdma(bt_coexist,
+						    0x61,
+						    0x20,
+						    0x3,
+						    0x11,
+						    0x11
 			);
 			break;
 		case 7:
-			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x13, 0xc, 0x5, 0x0, 0x0);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist,
+						    0x13,
+						    0xc,
+						    0x5,
+						    0x0,
+						    0x0
+			);
 			break;
 		case 8:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0x93, 0x25, 0x3, 0x10, 0x0
+			halbtc8723b1ant_SetFwPstdma(bt_coexist,
+						    0x93,
+						    0x25,
+						    0x3,
+						    0x10,
+						    0x0
 			);
 			break;
 		case 9:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist,
-				psTdmaByte0Val,
-				0x21,
-				0x3,
-				psTdmaByte3Val,
-				psTdmaByte4Val
+			halbtc8723b1ant_SetFwPstdma(bt_coexist,
+						    psTdmaByte0Val,
+						    0x21,
+						    0x3,
+						    psTdmaByte3Val,
+						    psTdmaByte4Val
 			);
 			break;
 		case 10:
 			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x13, 0xa, 0xa, 0x0, 0x40);
 			break;
 		case 11:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist,
-				psTdmaByte0Val,
-				0x21,
-				0x03,
-				psTdmaByte3Val,
-				psTdmaByte4Val
+			halbtc8723b1ant_SetFwPstdma(bt_coexist,
+						    psTdmaByte0Val,
+						    0x21,
+						    0x03,
+						    psTdmaByte3Val,
+						    psTdmaByte4Val
 			);
 			break;
 		case 12:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0x51, 0x0a, 0x0a, 0x0, 0x50
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x51, 0x0a, 0x0a, 0x0, 0x50);
 			break;
 		case 13:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0x51, 0x12, 0x12, 0x0, 0x10
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x51, 0x12, 0x12, 0x0, 0x10);
 			break;
 		case 14:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0x51, 0x21, 0x3, 0x10, psTdmaByte4Val
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x51, 0x21, 0x3, 0x10,
+						    psTdmaByte4Val);
 			break;
 		case 15:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0x13, 0xa, 0x3, 0x8, 0x0
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x13, 0xa, 0x3, 0x8, 0x0);
 			break;
 		case 16:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0x93, 0x15, 0x3, 0x10, 0x0
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x93, 0x15, 0x3, 0x10, 0x0);
 			break;
 		case 18:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0x93, 0x25, 0x3, 0x10, 0x0
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x93, 0x25, 0x3, 0x10, 0x0);
 			break;
 		case 20:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0x61, 0x3f, 0x03, 0x11, 0x10
-
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x61, 0x3f, 0x03, 0x11, 0x10);
 			break;
 		case 21:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0x61, 0x25, 0x03, 0x11, 0x11
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x61, 0x25, 0x03, 0x11, 0x11);
 			break;
 		case 22:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0x61, 0x25, 0x03, 0x11, 0x10
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x61, 0x25, 0x03, 0x11, 0x10);
 			break;
 		case 23:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0xe3, 0x25, 0x3, 0x31, 0x18
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0xe3, 0x25, 0x3, 0x31, 0x18);
 			break;
 		case 24:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0xe3, 0x15, 0x3, 0x31, 0x18
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0xe3, 0x15, 0x3, 0x31, 0x18);
 			break;
 		case 25:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0xe3, 0xa, 0x3, 0x31, 0x18
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0xe3, 0xa, 0x3, 0x31, 0x18);
 			break;
 		case 26:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0xe3, 0xa, 0x3, 0x31, 0x18
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0xe3, 0xa, 0x3, 0x31, 0x18);
 			break;
 		case 27:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0xe3, 0x25, 0x3, 0x31, 0x98
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0xe3, 0x25, 0x3, 0x31, 0x98);
 			break;
 		case 28:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0x69, 0x25, 0x3, 0x31, 0x0
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x69, 0x25, 0x3, 0x31, 0x0);
 			break;
 		case 29:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0xab, 0x1a, 0x1a, 0x1, 0x10
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0xab, 0x1a, 0x1a, 0x1, 0x10);
 			break;
 		case 30:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0x51, 0x30, 0x3, 0x10, 0x10
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x51, 0x30, 0x3, 0x10, 0x10);
 			break;
 		case 31:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0xd3, 0x1a, 0x1a, 0x0, 0x58
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0xd3, 0x1a, 0x1a, 0x0, 0x58);
 			break;
 		case 32:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0x61, 0x35, 0x3, 0x11, 0x11
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x61, 0x35, 0x3, 0x11, 0x11);
 			break;
 		case 33:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0xa3, 0x25, 0x3, 0x30, 0x90
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0xa3, 0x25, 0x3, 0x30, 0x90);
 			break;
 		case 34:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0x53, 0x1a, 0x1a, 0x0, 0x10
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x53, 0x1a, 0x1a, 0x0, 0x10);
 			break;
 		case 35:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0x63, 0x1a, 0x1a, 0x0, 0x10
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x63, 0x1a, 0x1a, 0x0, 0x10);
 			break;
 		case 36:
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0xd3, 0x12, 0x3, 0x14, 0x50
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0xd3, 0x12, 0x3, 0x14, 0x50);
 			break;
 		case 40: /*  SoftAP only with no sta associated, BT disable , TDMA mode for power saving */
 			/* here softap mode screen off will cost 70-80mA for phone */
-			halbtc8723b1ant_SetFwPstdma(
-				bt_coexist, 0x23, 0x18, 0x00, 0x10, 0x24
-			);
+			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x23, 0x18, 0x00, 0x10, 0x24);
 			break;
 		}
 	} else {
@@ -1269,29 +1209,24 @@ static void halbtc8723b1ant_PsTdma(
 		switch (type) {
 		case 8: /* PTA Control */
 			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x8, 0x0, 0x0, 0x0, 0x0);
-			halbtc8723b1ant_SetAntPath(
-				bt_coexist, BTC_ANT_PATH_PTA, false, false
-			);
+			halbtc8723b1ant_SetAntPath(bt_coexist, BTC_ANT_PATH_PTA, false, false);
 			break;
 		case 0:
 		default:  /* Software control, Antenna at BT side */
 			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x0, 0x0, 0x0, 0x0, 0x0);
-			halbtc8723b1ant_SetAntPath(
-				bt_coexist, BTC_ANT_PATH_BT, false, false
-			);
+			halbtc8723b1ant_SetAntPath(bt_coexist, BTC_ANT_PATH_BT, false, false);
 			break;
 		case 9:   /* Software control, Antenna at WiFi side */
 			halbtc8723b1ant_SetFwPstdma(bt_coexist, 0x0, 0x0, 0x0, 0x0, 0x0);
-			halbtc8723b1ant_SetAntPath(
-				bt_coexist, BTC_ANT_PATH_WIFI, false, false
-			);
+			halbtc8723b1ant_SetAntPath(bt_coexist, BTC_ANT_PATH_WIFI, false, false);
 			break;
 		}
 	}
 
 	rssiAdjustVal = 0;
-	bt_coexist->fBtcSet(
-		bt_coexist, BTC_SET_U1_RSSI_ADJ_VAL_FOR_1ANT_COEX_TYPE, &rssiAdjustVal
+	bt_coexist->fBtcSet(bt_coexist,
+			    BTC_SET_U1_RSSI_ADJ_VAL_FOR_1ANT_COEX_TYPE,
+			    &rssiAdjustVal
 	);
 
 	/*  update pre state */
@@ -1306,37 +1241,32 @@ static bool halbtc8723b1ant_IsCommonAction(struct btc_coexist *bt_coexist)
 	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_CONNECTED, &bWifiConnected);
 	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_BUSY, &wifi_busy);
 
-	if (
-		!bWifiConnected &&
-		pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_NON_CONNECTED_IDLE
+	if (!bWifiConnected &&
+	    pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_NON_CONNECTED_IDLE
 	) {
 		/* halbtc8723b1ant_SwMechanism(bt_coexist, false); */
 
 		bCommon = true;
-	} else if (
-		bWifiConnected &&
-		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_NON_CONNECTED_IDLE)
+	} else if (bWifiConnected &&
+		   (pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_NON_CONNECTED_IDLE)
 	) {
 		/* halbtc8723b1ant_SwMechanism(bt_coexist, false); */
 
 		bCommon = true;
-	} else if (
-		!bWifiConnected &&
-		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE)
+	} else if (!bWifiConnected &&
+		   (pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE)
 	) {
 		/* halbtc8723b1ant_SwMechanism(bt_coexist, false); */
 
 		bCommon = true;
-	} else if (
-		bWifiConnected &&
-		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE)
+	} else if (bWifiConnected &&
+		   (pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE)
 	) {
 		/* halbtc8723b1ant_SwMechanism(bt_coexist, false); */
 
 		bCommon = true;
-	} else if (
-		!bWifiConnected &&
-		(pCoexDm->btStatus != BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE)
+	} else if (!bWifiConnected &&
+		   (pCoexDm->btStatus != BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE)
 	) {
 		/* halbtc8723b1ant_SwMechanism(bt_coexist, false); */
 
@@ -1349,24 +1279,20 @@ static bool halbtc8723b1ant_IsCommonAction(struct btc_coexist *bt_coexist)
 }
 
 
-static void halbtc8723b1ant_TdmaDurationAdjustForAcl(
-	struct btc_coexist *bt_coexist, u8 wifiStatus
-)
+static void halbtc8723b1ant_TdmaDurationAdjustForAcl(struct btc_coexist *bt_coexist, u8 wifiStatus)
 {
 	static s32 up, dn, m, n, WaitCount;
 	s32 result;   /* 0: no change, +1: increase WiFi duration, -1: decrease WiFi duration */
 	u8 retryCount = 0, btInfoExt;
 
-	if (
-		(wifiStatus == BT_8723B_1ANT_WIFI_STATUS_NON_CONNECTED_ASSO_AUTH_SCAN) ||
-		(wifiStatus == BT_8723B_1ANT_WIFI_STATUS_CONNECTED_SCAN) ||
-		(wifiStatus == BT_8723B_1ANT_WIFI_STATUS_CONNECTED_SPECIAL_PKT)
+	if ((wifiStatus == BT_8723B_1ANT_WIFI_STATUS_NON_CONNECTED_ASSO_AUTH_SCAN) ||
+	    (wifiStatus == BT_8723B_1ANT_WIFI_STATUS_CONNECTED_SCAN) ||
+	    (wifiStatus == BT_8723B_1ANT_WIFI_STATUS_CONNECTED_SPECIAL_PKT)
 	) {
-		if (
-			pCoexDm->curPsTdma != 1 &&
-			pCoexDm->curPsTdma != 2 &&
-			pCoexDm->curPsTdma != 3 &&
-			pCoexDm->curPsTdma != 9
+		if (pCoexDm->curPsTdma != 1 &&
+		    pCoexDm->curPsTdma != 2 &&
+		    pCoexDm->curPsTdma != 3 &&
+		    pCoexDm->curPsTdma != 9
 		) {
 			halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 9);
 			pCoexDm->psTdmaDuAdjType = 9;
@@ -1457,9 +1383,8 @@ static void halbtc8723b1ant_TdmaDurationAdjustForAcl(
 		}
 
 		if (result == -1) {
-			if (
-				BT_INFO_8723B_1ANT_A2DP_BASIC_RATE(btInfoExt) &&
-				((pCoexDm->curPsTdma == 1) || (pCoexDm->curPsTdma == 2))
+			if (BT_INFO_8723B_1ANT_A2DP_BASIC_RATE(btInfoExt) &&
+			    ((pCoexDm->curPsTdma == 1) || (pCoexDm->curPsTdma == 2))
 			) {
 				halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 9);
 				pCoexDm->psTdmaDuAdjType = 9;
@@ -1474,9 +1399,8 @@ static void halbtc8723b1ant_TdmaDurationAdjustForAcl(
 				pCoexDm->psTdmaDuAdjType = 11;
 			}
 		} else if (result == 1) {
-			if (
-				BT_INFO_8723B_1ANT_A2DP_BASIC_RATE(btInfoExt) &&
-				((pCoexDm->curPsTdma == 1) || (pCoexDm->curPsTdma == 2))
+			if (BT_INFO_8723B_1ANT_A2DP_BASIC_RATE(btInfoExt) &&
+			    ((pCoexDm->curPsTdma == 1) || (pCoexDm->curPsTdma == 2))
 			) {
 				halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 9);
 				pCoexDm->psTdmaDuAdjType = 9;
@@ -1492,20 +1416,21 @@ static void halbtc8723b1ant_TdmaDurationAdjustForAcl(
 			}
 		}
 
-		if (
-			pCoexDm->curPsTdma != 1 &&
-			pCoexDm->curPsTdma != 2 &&
-			pCoexDm->curPsTdma != 9 &&
-			pCoexDm->curPsTdma != 11
+		if (pCoexDm->curPsTdma != 1 &&
+		    pCoexDm->curPsTdma != 2 &&
+		    pCoexDm->curPsTdma != 9 &&
+		    pCoexDm->curPsTdma != 11
 		) /*  recover to previous adjust type */
-			halbtc8723b1ant_PsTdma(
-				bt_coexist, NORMAL_EXEC, true, pCoexDm->psTdmaDuAdjType
+			halbtc8723b1ant_PsTdma(bt_coexist,
+					       NORMAL_EXEC,
+					       true,
+					       pCoexDm->psTdmaDuAdjType
 			);
 	}
 }
 
-static void halbtc8723b1ant_PsTdmaCheckForPowerSaveState(
-	struct btc_coexist *bt_coexist, bool bNewPsState
+static void halbtc8723b1ant_PsTdmaCheckForPowerSaveState(struct btc_coexist *bt_coexist,
+							 bool bNewPsState
 )
 {
 	u8 lpsMode = 0x0;
@@ -1526,8 +1451,10 @@ static void halbtc8723b1ant_PsTdmaCheckForPowerSaveState(
 	}
 }
 
-static void halbtc8723b1ant_PowerSaveState(
-	struct btc_coexist *bt_coexist, u8 psType, u8 lpsVal, u8 rpwmVal
+static void halbtc8723b1ant_PowerSaveState(struct btc_coexist *bt_coexist,
+					   u8 psType,
+					   u8 lpsVal,
+					   u8 rpwmVal
 )
 {
 	bool bLowPwrDisable = false;
@@ -1536,8 +1463,9 @@ static void halbtc8723b1ant_PowerSaveState(
 	case BTC_PS_WIFI_NATIVE:
 		/*  recover to original 32k low power setting */
 		bLowPwrDisable = false;
-		bt_coexist->fBtcSet(
-			bt_coexist, BTC_SET_ACT_DISABLE_LOW_POWER, &bLowPwrDisable
+		bt_coexist->fBtcSet(bt_coexist,
+				    BTC_SET_ACT_DISABLE_LOW_POWER,
+				    &bLowPwrDisable
 		);
 		bt_coexist->fBtcSet(bt_coexist, BTC_SET_ACT_NORMAL_LPS, NULL);
 		pCoexSta->bForceLpsOn = false;
@@ -1547,8 +1475,9 @@ static void halbtc8723b1ant_PowerSaveState(
 		halbtc8723b1ant_LpsRpwm(bt_coexist, NORMAL_EXEC, lpsVal, rpwmVal);
 		/*  when coex force to enter LPS, do not enter 32k low power. */
 		bLowPwrDisable = true;
-		bt_coexist->fBtcSet(
-			bt_coexist, BTC_SET_ACT_DISABLE_LOW_POWER, &bLowPwrDisable
+		bt_coexist->fBtcSet(bt_coexist,
+				    BTC_SET_ACT_DISABLE_LOW_POWER,
+				    &bLowPwrDisable
 		);
 		/*  power save must executed before psTdma. */
 		bt_coexist->fBtcSet(bt_coexist, BTC_SET_ACT_ENTER_LPS, NULL);
@@ -1607,10 +1536,9 @@ static void halbtc8723b1ant_ActionBtInquiry(struct btc_coexist *bt_coexist)
 		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, false, 8);
 
 		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 0);
-	} else if (
-		pBtLinkInfo->bScoExist ||
-		pBtLinkInfo->bHidExist ||
-		pBtLinkInfo->bA2dpExist
+	} else if (pBtLinkInfo->bScoExist ||
+		   pBtLinkInfo->bHidExist ||
+		   pBtLinkInfo->bA2dpExist
 	) {
 		/*  SCO/HID/A2DP busy */
 		halbtc8723b1ant_PowerSaveState(bt_coexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
@@ -1630,8 +1558,8 @@ static void halbtc8723b1ant_ActionBtInquiry(struct btc_coexist *bt_coexist)
 	}
 }
 
-static void halbtc8723b1ant_ActionBtScoHidOnlyBusy(
-	struct btc_coexist *bt_coexist, u8 wifiStatus
+static void halbtc8723b1ant_ActionBtScoHidOnlyBusy(struct btc_coexist *bt_coexist,
+						   u8 wifiStatus
 )
 {
 	struct btc_bt_link_info *pBtLinkInfo = &bt_coexist->btLinkInfo;
@@ -1650,8 +1578,8 @@ static void halbtc8723b1ant_ActionBtScoHidOnlyBusy(
 	}
 }
 
-static void halbtc8723b1ant_ActionWifiConnectedBtAclBusy(
-	struct btc_coexist *bt_coexist, u8 wifiStatus
+static void halbtc8723b1ant_ActionWifiConnectedBtAclBusy(struct btc_coexist *bt_coexist,
+							 u8 wifiStatus
 )
 {
 	struct btc_bt_link_info *pBtLinkInfo = &bt_coexist->btLinkInfo;
@@ -1682,16 +1610,14 @@ static void halbtc8723b1ant_ActionWifiConnectedBtAclBusy(
 		pCoexDm->bAutoTdmaAdjust = false;
 
 		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
-	} else if (
-		pBtLinkInfo->bPanOnly ||
-		(pBtLinkInfo->bHidExist && pBtLinkInfo->bPanExist)
+	} else if (pBtLinkInfo->bPanOnly ||
+		   (pBtLinkInfo->bHidExist && pBtLinkInfo->bPanExist)
 	) { /* PAN(OPP, FTP), HID+PAN(OPP, FTP) */
 		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 3);
 		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
 		pCoexDm->bAutoTdmaAdjust = false;
-	} else if (
-		(pBtLinkInfo->bA2dpExist && pBtLinkInfo->bPanExist) ||
-		(pBtLinkInfo->bHidExist && pBtLinkInfo->bA2dpExist && pBtLinkInfo->bPanExist)
+	} else if ((pBtLinkInfo->bA2dpExist && pBtLinkInfo->bPanExist) ||
+		   (pBtLinkInfo->bHidExist && pBtLinkInfo->bA2dpExist && pBtLinkInfo->bPanExist)
 	) { /* A2DP+PAN(OPP, FTP), HID+A2DP+PAN(OPP, FTP) */
 		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 13);
 		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
@@ -1714,9 +1640,7 @@ static void halbtc8723b1ant_ActionWifiNotConnected(struct btc_coexist *bt_coexis
 	halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 0);
 }
 
-static void halbtc8723b1ant_ActionWifiNotConnectedScan(
-	struct btc_coexist *bt_coexist
-)
+static void halbtc8723b1ant_ActionWifiNotConnectedScan(struct btc_coexist *bt_coexist)
 {
 	struct btc_bt_link_info *pBtLinkInfo = &bt_coexist->btLinkInfo;
 
@@ -1734,12 +1658,11 @@ static void halbtc8723b1ant_ActionWifiNotConnectedScan(
 			halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 20);
 			halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
 		}
-	} else if (
-		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_SCO_BUSY) ||
-		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY)
+	} else if ((pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_SCO_BUSY) ||
+		   (pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY)
 	) {
-		halbtc8723b1ant_ActionBtScoHidOnlyBusy(
-			bt_coexist, BT_8723B_1ANT_WIFI_STATUS_CONNECTED_SCAN
+		halbtc8723b1ant_ActionBtScoHidOnlyBusy(bt_coexist,
+						       BT_8723B_1ANT_WIFI_STATUS_CONNECTED_SCAN
 		);
 	} else {
 		/* Bryant Add */
@@ -1748,19 +1671,16 @@ static void halbtc8723b1ant_ActionWifiNotConnectedScan(
 	}
 }
 
-static void halbtc8723b1ant_ActionWifiNotConnectedAssoAuth(
-	struct btc_coexist *bt_coexist
-)
+static void halbtc8723b1ant_ActionWifiNotConnectedAssoAuth(struct btc_coexist *bt_coexist)
 {
 	struct btc_bt_link_info *pBtLinkInfo = &bt_coexist->btLinkInfo;
 
 	halbtc8723b1ant_PowerSaveState(bt_coexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
 
 	/*  tdma and coex table */
-	if (
-		(pBtLinkInfo->bScoExist) ||
-		(pBtLinkInfo->bHidExist) ||
-		(pBtLinkInfo->bA2dpExist)
+	if ((pBtLinkInfo->bScoExist) ||
+	    (pBtLinkInfo->bHidExist) ||
+	    (pBtLinkInfo->bA2dpExist)
 	) {
 		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 32);
 		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
@@ -1791,12 +1711,11 @@ static void halbtc8723b1ant_ActionWifiConnectedScan(struct btc_coexist *bt_coexi
 			halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 20);
 			halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
 		}
-	} else if (
-		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_SCO_BUSY) ||
-		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY)
+	} else if ((pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_SCO_BUSY) ||
+		   (pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY)
 	) {
-		halbtc8723b1ant_ActionBtScoHidOnlyBusy(
-			bt_coexist, BT_8723B_1ANT_WIFI_STATUS_CONNECTED_SCAN
+		halbtc8723b1ant_ActionBtScoHidOnlyBusy(bt_coexist,
+						       BT_8723B_1ANT_WIFI_STATUS_CONNECTED_SCAN
 		);
 	} else {
 		/* Bryant Add */
@@ -1805,19 +1724,16 @@ static void halbtc8723b1ant_ActionWifiConnectedScan(struct btc_coexist *bt_coexi
 	}
 }
 
-static void halbtc8723b1ant_ActionWifiConnectedSpecialPacket(
-	struct btc_coexist *bt_coexist
-)
+static void halbtc8723b1ant_ActionWifiConnectedSpecialPacket(struct btc_coexist *bt_coexist)
 {
 	struct btc_bt_link_info *pBtLinkInfo = &bt_coexist->btLinkInfo;
 
 	halbtc8723b1ant_PowerSaveState(bt_coexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
 
 	/*  tdma and coex table */
-	if (
-		(pBtLinkInfo->bScoExist) ||
-		(pBtLinkInfo->bHidExist) ||
-		(pBtLinkInfo->bA2dpExist)
+	if ((pBtLinkInfo->bScoExist) ||
+	    (pBtLinkInfo->bHidExist) ||
+	    (pBtLinkInfo->bA2dpExist)
 	) {
 		halbtc8723b1ant_PsTdma(bt_coexist, NORMAL_EXEC, true, 32);
 		halbtc8723b1ant_CoexTableWithType(bt_coexist, NORMAL_EXEC, 4);
@@ -1857,30 +1773,34 @@ static void halbtc8723b1ant_ActionWifiConnected(struct btc_coexist *bt_coexist)
 	bt_coexist->fBtcGet(bt_coexist, BTC_GET_BL_WIFI_BUSY, &wifi_busy);
 
 	/*  power save state */
-	if (
-		!bApEnable &&
-		pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_BUSY &&
-		!bt_coexist->btLinkInfo.bHidOnly
+	if (!bApEnable &&
+	    pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_BUSY &&
+	    !bt_coexist->btLinkInfo.bHidOnly
 	) {
 		if (bt_coexist->btLinkInfo.bA2dpOnly) { /* A2DP */
 			if (!wifi_busy)
-				halbtc8723b1ant_PowerSaveState(
-					bt_coexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0
+				halbtc8723b1ant_PowerSaveState(bt_coexist,
+							       BTC_PS_WIFI_NATIVE,
+							       0x0,
+							       0x0
 				);
 			else { /* busy */
 				if  (pCoexSta->nScanAPNum >= BT_8723B_1ANT_WIFI_NOISY_THRESH)  /* no force LPS, no PS-TDMA, use pure TDMA */
-					halbtc8723b1ant_PowerSaveState(
-						bt_coexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0
+					halbtc8723b1ant_PowerSaveState(bt_coexist,
+								       BTC_PS_WIFI_NATIVE,
+								       0x0,
+								       0x0
 					);
 				else
-					halbtc8723b1ant_PowerSaveState(
-						bt_coexist, BTC_PS_LPS_ON, 0x50, 0x4
+					halbtc8723b1ant_PowerSaveState(bt_coexist,
+								       BTC_PS_LPS_ON,
+								       0x50,
+								       0x4
 					);
 			}
-		} else if (
-			(!pCoexSta->bPanExist) &&
-			(!pCoexSta->bA2dpExist) &&
-			(!pCoexSta->bHidExist)
+		} else if ((!pCoexSta->bPanExist) &&
+			   (!pCoexSta->bA2dpExist) &&
+			   (!pCoexSta->bHidExist)
 		)
 			halbtc8723b1ant_PowerSaveState(bt_coexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
 		else
@@ -1891,13 +1811,11 @@ static void halbtc8723b1ant_ActionWifiConnected(struct btc_coexist *bt_coexist)
 	/*  tdma and coex table */
 	if (!wifi_busy) {
 		if (pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_BUSY) {
-			halbtc8723b1ant_ActionWifiConnectedBtAclBusy(
-				bt_coexist,
+			halbtc8723b1ant_ActionWifiConnectedBtAclBusy(bt_coexist,
 				BT_8723B_1ANT_WIFI_STATUS_CONNECTED_IDLE
 			);
-		} else if (
-			(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_SCO_BUSY) ||
-			(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY)
+		} else if ((pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_SCO_BUSY) ||
+			   (pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY)
 		) {
 			halbtc8723b1ant_ActionBtScoHidOnlyBusy(bt_coexist,
 				BT_8723B_1ANT_WIFI_STATUS_CONNECTED_IDLE);
@@ -1911,16 +1829,13 @@ static void halbtc8723b1ant_ActionWifiConnected(struct btc_coexist *bt_coexist)
 		}
 	} else {
 		if (pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_BUSY) {
-			halbtc8723b1ant_ActionWifiConnectedBtAclBusy(
-				bt_coexist,
+			halbtc8723b1ant_ActionWifiConnectedBtAclBusy(bt_coexist,
 				BT_8723B_1ANT_WIFI_STATUS_CONNECTED_BUSY
 			);
-		} else if (
-			(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_SCO_BUSY) ||
-			(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY)
+		} else if ((pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_SCO_BUSY) ||
+			   (pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY)
 		) {
-			halbtc8723b1ant_ActionBtScoHidOnlyBusy(
-				bt_coexist,
+			halbtc8723b1ant_ActionBtScoHidOnlyBusy(bt_coexist,
 				BT_8723B_1ANT_WIFI_STATUS_CONNECTED_BUSY
 			);
 		} else {
@@ -2001,29 +1916,25 @@ static void halbtc8723b1ant_RunCoexistMechanism(struct btc_coexist *bt_coexist)
 	if (pCoexSta->bUnderIps)
 		return;
 
-	if (
-		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_BUSY) ||
-		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_SCO_BUSY) ||
-		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY)
+	if ((pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_BUSY) ||
+	    (pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_SCO_BUSY) ||
+	    (pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY)
 	){
 		bIncreaseScanDevNum = true;
 	}
 
-	bt_coexist->fBtcSet(
-		bt_coexist,
-		BTC_SET_BL_INC_SCAN_DEV_NUM,
-		&bIncreaseScanDevNum
+	bt_coexist->fBtcSet(bt_coexist,
+			    BTC_SET_BL_INC_SCAN_DEV_NUM,
+			    &bIncreaseScanDevNum
 	);
-	bt_coexist->fBtcGet(
-		bt_coexist,
-		BTC_GET_BL_WIFI_CONNECTED,
-		&bWifiConnected
+	bt_coexist->fBtcGet(bt_coexist,
+			    BTC_GET_BL_WIFI_CONNECTED,
+			    &bWifiConnected
 	);
 
-	bt_coexist->fBtcGet(
-		bt_coexist,
-		BTC_GET_U4_WIFI_LINK_STATUS,
-		&wifiLinkStatus
+	bt_coexist->fBtcGet(bt_coexist,
+			    BTC_GET_U4_WIFI_LINK_STATUS,
+			    &wifiLinkStatus
 	);
 	numOfWifiLink = wifiLinkStatus >> 16;
 
@@ -2099,10 +2010,9 @@ static void halbtc8723b1ant_InitCoexDm(struct btc_coexist *bt_coexist)
 	pCoexSta->popEventCnt = 0;
 }
 
-static void halbtc8723b1ant_InitHwConfig(
-	struct btc_coexist *bt_coexist,
-	bool bBackUp,
-	bool bWifiOnly
+static void halbtc8723b1ant_InitHwConfig(struct btc_coexist *bt_coexist,
+					 bool bBackUp,
+					 bool bWifiOnly
 )
 {
 	bt_coexist->fBtcWrite1ByteBitMask(bt_coexist, 0x550, 0x8, 0x1);  /* enable TBTT nterrupt */
@@ -2253,9 +2163,7 @@ void EXhalbtc8723b1ant_ScanNotify(struct btc_coexist *bt_coexist, u8 type)
 	} else {
 		pCoexSta->bWiFiIsHighPriTask = false;
 
-		bt_coexist->fBtcGet(
-			bt_coexist, BTC_GET_U1_AP_NUM, &pCoexSta->nScanAPNum
-		);
+		bt_coexist->fBtcGet(bt_coexist, BTC_GET_U1_AP_NUM, &pCoexSta->nScanAPNum);
 	}
 
 	if (bt_coexist->btInfo.bBtDisabled)
@@ -2271,8 +2179,7 @@ void EXhalbtc8723b1ant_ScanNotify(struct btc_coexist *bt_coexist, u8 type)
 
 	if (numOfWifiLink >= 2) {
 		halbtc8723b1ant_LimitedTx(bt_coexist, NORMAL_EXEC, 0, 0, 0, 0);
-		halbtc8723b1ant_LimitedRx(
-			bt_coexist, NORMAL_EXEC, false, bt_ctrl_agg_buf_size, agg_buf_size
+		halbtc8723b1ant_LimitedRx(bt_coexist, NORMAL_EXEC, false, bt_ctrl_agg_buf_size, agg_buf_size
 		);
 		halbtc8723b1ant_ActionWifiMultiPort(bt_coexist);
 		return;
@@ -2307,10 +2214,9 @@ void EXhalbtc8723b1ant_ConnectNotify(struct btc_coexist *bt_coexist, u8 type)
 	bool bt_ctrl_agg_buf_size = false;
 	u8 agg_buf_size = 5;
 
-	if (
-		bt_coexist->bManualControl ||
-		bt_coexist->bStopCoexDm ||
-		bt_coexist->btInfo.bBtDisabled
+	if (bt_coexist->bManualControl ||
+	    bt_coexist->bStopCoexDm ||
+	    bt_coexist->btInfo.bBtDisabled
 	)
 		return;
 
@@ -2358,10 +2264,9 @@ void EXhalbtc8723b1ant_MediaStatusNotify(struct btc_coexist *bt_coexist, u8 type
 	u8 wifiCentralChnl;
 	bool wifi_under_b_mode = false;
 
-	if (
-		bt_coexist->bManualControl ||
-		bt_coexist->bStopCoexDm ||
-		bt_coexist->btInfo.bBtDisabled
+	if (bt_coexist->bManualControl ||
+	    bt_coexist->bStopCoexDm ||
+	    bt_coexist->btInfo.bBtDisabled
 	)
 		return;
 
@@ -2417,17 +2322,15 @@ void EXhalbtc8723b1ant_SpecialPacketNotify(struct btc_coexist *bt_coexist, u8 ty
 	bool bt_ctrl_agg_buf_size = false;
 	u8 agg_buf_size = 5;
 
-	if (
-		bt_coexist->bManualControl ||
-		bt_coexist->bStopCoexDm ||
-		bt_coexist->btInfo.bBtDisabled
+	if (bt_coexist->bManualControl ||
+	    bt_coexist->bStopCoexDm ||
+	    bt_coexist->btInfo.bBtDisabled
 	)
 		return;
 
-	if (
-		type == BTC_PACKET_DHCP ||
-		type == BTC_PACKET_EAPOL ||
-		type == BTC_PACKET_ARP
+	if (type == BTC_PACKET_DHCP ||
+	    type == BTC_PACKET_EAPOL ||
+	    type == BTC_PACKET_ARP
 	) {
 		if (type == BTC_PACKET_ARP) {
 			pCoexDm->nArpCnt++;
@@ -2445,15 +2348,16 @@ void EXhalbtc8723b1ant_SpecialPacketNotify(struct btc_coexist *bt_coexist, u8 ty
 
 	pCoexSta->specialPktPeriodCnt = 0;
 
-	bt_coexist->fBtcGet(
-		bt_coexist, BTC_GET_U4_WIFI_LINK_STATUS, &wifiLinkStatus
-	);
+	bt_coexist->fBtcGet(bt_coexist, BTC_GET_U4_WIFI_LINK_STATUS, &wifiLinkStatus);
 	numOfWifiLink = wifiLinkStatus >> 16;
 
 	if (numOfWifiLink >= 2) {
 		halbtc8723b1ant_LimitedTx(bt_coexist, NORMAL_EXEC, 0, 0, 0, 0);
-		halbtc8723b1ant_LimitedRx(
-			bt_coexist, NORMAL_EXEC, false, bt_ctrl_agg_buf_size, agg_buf_size
+		halbtc8723b1ant_LimitedRx(bt_coexist,
+					  NORMAL_EXEC,
+					  false,
+					  bt_ctrl_agg_buf_size,
+					  agg_buf_size
 		);
 		halbtc8723b1ant_ActionWifiMultiPort(bt_coexist);
 		return;
@@ -2468,17 +2372,14 @@ void EXhalbtc8723b1ant_SpecialPacketNotify(struct btc_coexist *bt_coexist, u8 ty
 		return;
 	}
 
-	if (
-		type == BTC_PACKET_DHCP ||
-		type == BTC_PACKET_EAPOL ||
-		((type == BTC_PACKET_ARP) && (pCoexSta->bWiFiIsHighPriTask))
+	if (type == BTC_PACKET_DHCP ||
+	    type == BTC_PACKET_EAPOL ||
+	    ((type == BTC_PACKET_ARP) && (pCoexSta->bWiFiIsHighPriTask))
 	)
 		halbtc8723b1ant_ActionWifiConnectedSpecialPacket(bt_coexist);
 }
 
-void EXhalbtc8723b1ant_BtInfoNotify(
-	struct btc_coexist *bt_coexist, u8 *tmpBuf, u8 length
-)
+void EXhalbtc8723b1ant_BtInfoNotify(struct btc_coexist *bt_coexist, u8 *tmpBuf, u8 length)
 {
 	u8 btInfo = 0;
 	u8 i, rspSource = 0;
@@ -2585,9 +2486,8 @@ void EXhalbtc8723b1ant_BtInfoNotify(
 	} else if (btInfo == BT_INFO_8723B_1ANT_B_CONNECTION)	{
 		/*  connection exists but no busy */
 		pCoexDm->btStatus = BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE;
-	} else if (
-		(btInfo & BT_INFO_8723B_1ANT_B_SCO_ESCO) ||
-		(btInfo & BT_INFO_8723B_1ANT_B_SCO_BUSY)
+	} else if ((btInfo & BT_INFO_8723B_1ANT_B_SCO_ESCO) ||
+		   (btInfo & BT_INFO_8723B_1ANT_B_SCO_BUSY)
 	) {
 		pCoexDm->btStatus = BT_8723B_1ANT_BT_STATUS_SCO_BUSY;
 	} else if (btInfo & BT_INFO_8723B_1ANT_B_ACL_BUSY) {
@@ -2599,10 +2499,9 @@ void EXhalbtc8723b1ant_BtInfoNotify(
 		pCoexDm->btStatus = BT_8723B_1ANT_BT_STATUS_MAX;
 	}
 
-	if (
-		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_BUSY) ||
-		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_SCO_BUSY) ||
-		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY)
+	if ((pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_BUSY) ||
+	    (pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_SCO_BUSY) ||
+	    (pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_ACL_SCO_BUSY)
 	)
 		bBtBusy = true;
 	else
@@ -2656,9 +2555,8 @@ void EXhalbtc8723b1ant_Periodical(struct btc_coexist *bt_coexist)
 	halbtc8723b1ant_MonitorBtCtr(bt_coexist);
 	halbtc8723b1ant_MonitorWiFiCtr(bt_coexist);
 
-	if (
-		halbtc8723b1ant_IsWifiStatusChanged(bt_coexist) ||
-		pCoexDm->bAutoTdmaAdjust
+	if (halbtc8723b1ant_IsWifiStatusChanged(bt_coexist) ||
+	    pCoexDm->bAutoTdmaAdjust
 	)
 		halbtc8723b1ant_RunCoexistMechanism(bt_coexist);
 
-- 
2.43.0

