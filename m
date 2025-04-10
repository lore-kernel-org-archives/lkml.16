Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB0A28A416
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290418; cv=none; b=SU/3d9quyDF3crMmsvO0vh8el8qDcGbxeZU4UtKVMTQgEAyutnH3oxspN2t1je9kOzA5jPuGkSmNHyrq4CU+rmAkwgn0P+DLnzXmA2/rmE+DYhGsXqpn4SnC3zTtfVhO1SE3uHCNj6i6VbOwGHPvCAvKvZxDZ6a6yZ/rex4Jo/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290418; c=relaxed/simple;
	bh=VQttRYk06QeNSdaixcvW75tIFIHyV7qGhkk7znS/CnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MGQQ8h63fAMkrJP/49nnkVKJkLQNQKlXt45k8t2/uzYVKZJ2qJXId+b2vajzzIHGsQVKmNZKHorfNpUcYaiDCgZLNdsL+8KAIm2IxjpkiXFHs22ZACcsCZ1uPvDDoUsmW1BEIjRGOHUtMgu3YwNTvWZuQvl5pW0PJfx1F2Bmd8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPpFm7lY; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPpFm7lY"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so13269075e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744290414; x=1744895214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0CfpqZfR6A02wrSENtQAj4aEGC4bV9WD+ngWaFTJ9KI=;
        b=RPpFm7lYj8Oi6z6zGOsvDsZYshUNZFHEEzia7v1fK2NzYrpcvoRlPdM3fRbqpe9I9d
         4cMjiTURvxUu1Eg5tccdkmhJQWfjVZhA0vPoWrmxzzbZP162piRxznkpkMW5RGDphiHA
         JXe/igMWRkBPqvP3zF2NFI1AHFRdBkDEOns+jmdUvTFt2SuoXoD8QmnfyYkKDNLiuzjW
         CjteCCnq+BE2f4KlEmNpvG/dY+HChfT7LHxxN9eV9W1JcyWonGTo5SGkigPZ9dDDYhpu
         7jz+BKmo5z0Q3A6TsSGurcYMdEZP46t7ULPLrb+PHzUP62ZAI3WlUrQZlLtQX9kpoBye
         ifQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290414; x=1744895214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0CfpqZfR6A02wrSENtQAj4aEGC4bV9WD+ngWaFTJ9KI=;
        b=qcxAtyZckhhXO9aj6WK49Bj2O0SgnCzX8ANIsILyjyyznnAWTTOeXPzs8AC2G9S4nk
         dqHhYBPI5cluPQs08PInaqrMGc1naRBhr4DXRWlO2mw67K40yW8RGGDytknA6aEBHXZy
         dU5144ZgbCVt3drcRAdH2LDSjPym22MypySiU9kI0FmmhL6qmiqdB7dEXS9zM32Grh8Y
         yHzSqRJnkwyo3kTvJvxlDZPPnD9XtFbr3k6vJglkAcO9IUKC5zNve3q7HrtMFjj3Jd3P
         0dNrrjYG1xvasBF5PvHCpszXo2bNmkAm4z0OOAdRkOItFtXQama1bdxKDSF7GQmvhyKS
         +AWg==
X-Forwarded-Encrypted: i=1; AJvYcCUDvhvQ40dyOmnQ5Wm+cFu1UJhS+i2kxHrd3bBojSRpsSBBi5qBRzlcMfcRPIhXwZxQY2npw/xhmwhCApQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyvolubpzsMULImd9kR1iJP654n2ob9RXwE5c+EluuqDVWEKT5
	J+Q0g8Uq9jEMx55VmxcBC8qyBfVqraoLw1V69Tl3I/z8q+MGYeZU
X-Gm-Gg: ASbGncvdfCYuNIC9wt7g3lOOYrJR3Mhxk3u+AvWCMKDec0JkIAl+0L8dYCV/XdX2vBQ
	Bh+8AGwNlSTOMjqR3pb4+SbPpV7Eeqwaf57NkAjzGH1vVuS4d3mb6VDIASrk0bjr2vbemJyYejI
	nlZktenR65uBDt9xLpqxpbuSVpOiKwruHdwqvCpZTSVZB/5VHLNn/9TL4NsR9T3DHGhHrMN+BGJ
	vDrE/J7vk1aYzw0HfmPiD1m0lZayz8HeamdLR7lDHUgdjz/d4npr988LOh3Y/st7fMNrXN+305Q
	fr7qEXgzVVJ8xxi3YgXHjQPU8s44NsNcgjShDQ==
X-Google-Smtp-Source: AGHT+IFY3Pun8EqtRMDa2wxLsxLrjnH81SPKup6hFWWMfsvZiMwFXtrIpt5JoTGjSsXV58WmNvts8w==
X-Received: by 2002:a05:600c:34c2:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-43f2efe1e4dmr25903935e9.3.1744290412068;
        Thu, 10 Apr 2025 06:06:52 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc6dsm55013045e9.28.2025.04.10.06.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:06:51 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] staging: rtl8723bs: Initialize variables at declaration in hal_btcoex.c
Date: Thu, 10 Apr 2025 16:06:10 +0300
Message-ID: <b6aeed41cce1dba2bf8a6afdbec95d4bdd789260.1744285781.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744285781.git.karanja99erick@gmail.com>
References: <cover.1744285781.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the code more concise and readable by integrating the initialization
directly into the variable declaration in cases where the initialization
is simple and doesn't depend on other variables or complex expressions.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c | 174 ++++++---------------
 1 file changed, 45 insertions(+), 129 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 9105594d2dde..b29c6cdf2e21 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -28,10 +28,7 @@ static u8 halbtcoutsrc_IsBtCoexistAvailable(struct btc_coexist *pBtCoexist)
 
 static void halbtcoutsrc_LeaveLps(struct btc_coexist *pBtCoexist)
 {
-	struct adapter *padapter;
-
-
-	padapter = pBtCoexist->Adapter;
+	struct adapter *padapter = pBtCoexist->Adapter;
 
 	pBtCoexist->btInfo.bBtCtrlLps = true;
 	pBtCoexist->btInfo.bBtLpsOn = false;
@@ -41,10 +38,7 @@ static void halbtcoutsrc_LeaveLps(struct btc_coexist *pBtCoexist)
 
 static void halbtcoutsrc_EnterLps(struct btc_coexist *pBtCoexist)
 {
-	struct adapter *padapter;
-
-
-	padapter = pBtCoexist->Adapter;
+	struct adapter *padapter = pBtCoexist->Adapter;
 
 	pBtCoexist->btInfo.bBtCtrlLps = true;
 	pBtCoexist->btInfo.bBtLpsOn = true;
@@ -54,9 +48,7 @@ static void halbtcoutsrc_EnterLps(struct btc_coexist *pBtCoexist)
 
 static void halbtcoutsrc_NormalLps(struct btc_coexist *pBtCoexist)
 {
-	struct adapter *padapter;
-
-	padapter = pBtCoexist->Adapter;
+	struct adapter *padapter = pBtCoexist->Adapter;
 
 	if (pBtCoexist->btInfo.bBtCtrlLps) {
 		pBtCoexist->btInfo.bBtLpsOn = false;
@@ -73,15 +65,13 @@ static void halbtcoutsrc_NormalLps(struct btc_coexist *pBtCoexist)
  */
 static void halbtcoutsrc_LeaveLowPower(struct btc_coexist *pBtCoexist)
 {
-	struct adapter *padapter;
-	s32 ready;
+	struct adapter *padapter = pBtCoexist->Adapter;
+	s32 ready = _FAIL;
 	unsigned long stime;
 	unsigned long utime;
 	u32 timeout; /*  unit: ms */
 
 
-	padapter = pBtCoexist->Adapter;
-	ready = _FAIL;
 #ifdef LPS_RPWM_WAIT_MS
 	timeout = LPS_RPWM_WAIT_MS;
 #else /*  !LPS_RPWM_WAIT_MS */
@@ -108,10 +98,9 @@ static void halbtcoutsrc_LeaveLowPower(struct btc_coexist *pBtCoexist)
  */
 static void halbtcoutsrc_NormalLowPower(struct btc_coexist *pBtCoexist)
 {
-	struct adapter *padapter;
+	struct adapter *padapter = pBtCoexist->Adapter;
 
 
-	padapter = pBtCoexist->Adapter;
 	rtw_unregister_task_alive(padapter, BTCOEX_ALIVE);
 }
 
@@ -126,12 +115,8 @@ static void halbtcoutsrc_DisableLowPower(struct btc_coexist *pBtCoexist, u8 bLow
 
 static void halbtcoutsrc_AggregationCheck(struct btc_coexist *pBtCoexist)
 {
-	struct adapter *padapter;
-	bool bNeedToAct;
-
-
-	padapter = pBtCoexist->Adapter;
-	bNeedToAct = false;
+	struct adapter *padapter = pBtCoexist->Adapter;
+	bool bNeedToAct = false;
 
 	if (pBtCoexist->btInfo.bRejectAggPkt) {
 		rtw_btcoex_RejectApAggregatedPacket(padapter, true);
@@ -176,14 +161,9 @@ static u8 halbtcoutsrc_IsWifiBusy(struct adapter *padapter)
 
 static u32 _halbtcoutsrc_GetWifiLinkStatus(struct adapter *padapter)
 {
-	struct mlme_priv *pmlmepriv;
-	u8 bp2p;
-	u32 portConnectedStatus;
-
-
-	pmlmepriv = &padapter->mlmepriv;
-	bp2p = false;
-	portConnectedStatus = 0;
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	u8 bp2p = false;
+	u32 portConnectedStatus = 0;
 
 	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE) == true) {
 		if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
@@ -210,14 +190,9 @@ static u32 halbtcoutsrc_GetWifiLinkStatus(struct btc_coexist *pBtCoexist)
 	/*  [15:0]=> port connected bit define */
 	/*  */
 
-	struct adapter *padapter;
+	struct adapter *padapter = pBtCoexist->Adapter;
 	u32 retVal;
-	u32 portConnectedStatus, numOfConnectedPort;
-
-
-	padapter = pBtCoexist->Adapter;
-	portConnectedStatus = 0;
-	numOfConnectedPort = 0;
+	u32 portConnectedStatus = 0, numOfConnectedPort = 0;
 
 	retVal = _halbtcoutsrc_GetWifiLinkStatus(padapter);
 	if (retVal) {
@@ -244,11 +219,9 @@ static s32 halbtcoutsrc_GetWifiRssi(struct adapter *padapter)
 
 static u8 halbtcoutsrc_GetWifiScanAPNum(struct adapter *padapter)
 {
-	struct mlme_ext_priv *pmlmeext;
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	static u8 scan_AP_num;
 
-	pmlmeext = &padapter->mlmeextpriv;
-
 	if (!GLBtcWiFiInScanState) {
 		if (pmlmeext->sitesurvey_res.bss_cnt > 0xFF)
 			scan_AP_num = 0xFF;
@@ -363,8 +336,7 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getType, void *pOutBuf)
 
 	case BTC_GET_U4_WIFI_TRAFFIC_DIRECTION:
 		{
-			struct rt_link_detect_t *plinkinfo;
-			plinkinfo = &padapter->mlmepriv.LinkDetectInfo;
+			struct rt_link_detect_t *plinkinfo = &padapter->mlmepriv.LinkDetectInfo;
 
 			if (plinkinfo->NumTxOkInPeriod > plinkinfo->NumRxOkInPeriod)
 				*pU4Tmp = BTC_WIFI_TRAFFIC_TX;
@@ -425,16 +397,13 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getType, void *pOutBuf)
 
 static u8 halbtcoutsrc_Set(void *pBtcContext, u8 setType, void *pInBuf)
 {
-	struct btc_coexist *pBtCoexist;
-	struct adapter *padapter;
-	u8 *pu8;
+	struct btc_coexist *pBtCoexist = (struct btc_coexist *)pBtcContext;
+	struct adapter *padapter = pBtCoexist->Adapter;
+	u8 *pu8 = pInBuf;
 	u32 *pU4Tmp;
 	u8 ret;
 
 
-	pBtCoexist = (struct btc_coexist *)pBtcContext;
-	padapter = pBtCoexist->Adapter;
-	pu8 = pInBuf;
 	pU4Tmp = pInBuf;
 	ret = true;
 
@@ -565,65 +534,43 @@ static u8 halbtcoutsrc_Set(void *pBtcContext, u8 setType, void *pInBuf)
 /*  */
 static u8 halbtcoutsrc_Read1Byte(void *pBtcContext, u32 RegAddr)
 {
-	struct btc_coexist *pBtCoexist;
-	struct adapter *padapter;
-
-
-	pBtCoexist = (struct btc_coexist *)pBtcContext;
-	padapter = pBtCoexist->Adapter;
+	struct btc_coexist *pBtCoexist = (struct btc_coexist *)pBtcContext;
+	struct adapter *padapter = pBtCoexist->Adapter;
 
 	return rtw_read8(padapter, RegAddr);
 }
 
 static u16 halbtcoutsrc_Read2Byte(void *pBtcContext, u32 RegAddr)
 {
-	struct btc_coexist *pBtCoexist;
-	struct adapter *padapter;
-
-
-	pBtCoexist = (struct btc_coexist *)pBtcContext;
-	padapter = pBtCoexist->Adapter;
+	struct btc_coexist *pBtCoexist = (struct btc_coexist *)pBtcContext;
+	struct adapter *padapter = pBtCoexist->Adapter;
 
 	return	rtw_read16(padapter, RegAddr);
 }
 
 static u32 halbtcoutsrc_Read4Byte(void *pBtcContext, u32 RegAddr)
 {
-	struct btc_coexist *pBtCoexist;
-	struct adapter *padapter;
-
-
-	pBtCoexist = (struct btc_coexist *)pBtcContext;
-	padapter = pBtCoexist->Adapter;
+	struct btc_coexist *pBtCoexist = (struct btc_coexist *)pBtcContext;
+	struct adapter *padapter = pBtCoexist->Adapter;
 
 	return	rtw_read32(padapter, RegAddr);
 }
 
 static void halbtcoutsrc_Write1Byte(void *pBtcContext, u32 RegAddr, u8 Data)
 {
-	struct btc_coexist *pBtCoexist;
-	struct adapter *padapter;
-
-
-	pBtCoexist = (struct btc_coexist *)pBtcContext;
-	padapter = pBtCoexist->Adapter;
+	struct btc_coexist *pBtCoexist = (struct btc_coexist *)pBtcContext;
+	struct adapter *padapter = pBtCoexist->Adapter;
 
 	rtw_write8(padapter, RegAddr, Data);
 }
 
 static void halbtcoutsrc_BitMaskWrite1Byte(void *pBtcContext, u32 regAddr, u8 bitMask, u8 data1b)
 {
-	struct btc_coexist *pBtCoexist;
-	struct adapter *padapter;
-	u8 originalValue, bitShift;
+	struct btc_coexist *pBtCoexist = (struct btc_coexist *)pBtcContext;
+	struct adapter *padapter = pBtCoexist->Adapter;
+	u8 originalValue = 0, bitShift = 0;
 	u8 i;
 
-
-	pBtCoexist = (struct btc_coexist *)pBtcContext;
-	padapter = pBtCoexist->Adapter;
-	originalValue = 0;
-	bitShift = 0;
-
 	if (bitMask != 0xFF) {
 		originalValue = rtw_read8(padapter, regAddr);
 
@@ -641,24 +588,16 @@ static void halbtcoutsrc_BitMaskWrite1Byte(void *pBtcContext, u32 regAddr, u8 bi
 
 static void halbtcoutsrc_Write2Byte(void *pBtcContext, u32 RegAddr, u16 Data)
 {
-	struct btc_coexist *pBtCoexist;
-	struct adapter *padapter;
-
-
-	pBtCoexist = (struct btc_coexist *)pBtcContext;
-	padapter = pBtCoexist->Adapter;
+	struct btc_coexist *pBtCoexist = (struct btc_coexist *)pBtcContext;
+	struct adapter *padapter = pBtCoexist->Adapter;
 
 	rtw_write16(padapter, RegAddr, Data);
 }
 
 static void halbtcoutsrc_Write4Byte(void *pBtcContext, u32 RegAddr, u32 Data)
 {
-	struct btc_coexist *pBtCoexist;
-	struct adapter *padapter;
-
-
-	pBtCoexist = (struct btc_coexist *)pBtcContext;
-	padapter = pBtCoexist->Adapter;
+	struct btc_coexist *pBtCoexist = (struct btc_coexist *)pBtcContext;
+	struct adapter *padapter = pBtCoexist->Adapter;
 
 	rtw_write32(padapter, RegAddr, Data);
 }
@@ -676,12 +615,8 @@ static void halbtcoutsrc_WriteLocalReg1Byte(void *pBtcContext, u32 RegAddr, u8 D
 
 static void halbtcoutsrc_SetBbReg(void *pBtcContext, u32 RegAddr, u32 BitMask, u32 Data)
 {
-	struct btc_coexist *pBtCoexist;
-	struct adapter *padapter;
-
-
-	pBtCoexist = (struct btc_coexist *)pBtcContext;
-	padapter = pBtCoexist->Adapter;
+	struct btc_coexist *pBtCoexist = (struct btc_coexist *)pBtcContext;
+	struct adapter *padapter = pBtCoexist->Adapter;
 
 	PHY_SetBBReg(padapter, RegAddr, BitMask, Data);
 }
@@ -689,44 +624,32 @@ static void halbtcoutsrc_SetBbReg(void *pBtcContext, u32 RegAddr, u32 BitMask, u
 
 static u32 halbtcoutsrc_GetBbReg(void *pBtcContext, u32 RegAddr, u32 BitMask)
 {
-	struct btc_coexist *pBtCoexist;
-	struct adapter *padapter;
-
-
-	pBtCoexist = (struct btc_coexist *)pBtcContext;
-	padapter = pBtCoexist->Adapter;
+	struct btc_coexist *pBtCoexist = (struct btc_coexist *)pBtcContext;
+	struct adapter *padapter = pBtCoexist->Adapter;
 
 	return PHY_QueryBBReg(padapter, RegAddr, BitMask);
 }
 
 static void halbtcoutsrc_SetRfReg(void *pBtcContext, u8 eRFPath, u32 RegAddr, u32 BitMask, u32 Data)
 {
-	struct btc_coexist *pBtCoexist;
-	struct adapter *padapter;
-
-
-	pBtCoexist = (struct btc_coexist *)pBtcContext;
-	padapter = pBtCoexist->Adapter;
+	struct btc_coexist *pBtCoexist = (struct btc_coexist *)pBtcContext;
+	struct adapter *padapter = pBtCoexist->Adapter;
 
 	PHY_SetRFReg(padapter, eRFPath, RegAddr, BitMask, Data);
 }
 
 static u32 halbtcoutsrc_GetRfReg(void *pBtcContext, u8 eRFPath, u32 RegAddr, u32 BitMask)
 {
-	struct btc_coexist *pBtCoexist;
-	struct adapter *padapter;
-
-
-	pBtCoexist = (struct btc_coexist *)pBtcContext;
-	padapter = pBtCoexist->Adapter;
+	struct btc_coexist *pBtCoexist = (struct btc_coexist *)pBtcContext;
+	struct adapter *padapter = pBtCoexist->Adapter;
 
 	return PHY_QueryRFReg(padapter, eRFPath, RegAddr, BitMask);
 }
 
 static void halbtcoutsrc_SetBtReg(void *pBtcContext, u8 RegType, u32 RegAddr, u32 Data)
 {
-	struct btc_coexist *pBtCoexist;
-	struct adapter *padapter;
+	struct btc_coexist *pBtCoexist = (struct btc_coexist *)pBtcContext;
+	struct adapter *padapter = pBtCoexist->Adapter;
 	u8 CmdBuffer1[4] = {0};
 	u8 CmdBuffer2[4] = {0};
 	u8 *AddrToSet = (u8 *)&RegAddr;
@@ -734,9 +657,6 @@ static void halbtcoutsrc_SetBtReg(void *pBtcContext, u8 RegType, u32 RegAddr, u3
 	u8 OperVer = 0;
 	u8 ReqNum = 0;
 
-	pBtCoexist = (struct btc_coexist *)pBtcContext;
-	padapter = pBtCoexist->Adapter;
-
 	CmdBuffer1[0] |= (OperVer & 0x0f);						/* Set OperVer */
 	CmdBuffer1[0] |= ((ReqNum << 4) & 0xf0);				/* Set ReqNum */
 	CmdBuffer1[1] = 0x0d;									/* Set OpCode to BT_LO_OP_WRITE_REG_VALUE */
@@ -761,12 +681,8 @@ static u32 halbtcoutsrc_GetBtReg(void *pBtcContext, u8 RegType, u32 RegAddr)
 
 static void halbtcoutsrc_FillH2cCmd(void *pBtcContext, u8 elementId, u32 cmdLen, u8 *pCmdBuffer)
 {
-	struct btc_coexist *pBtCoexist;
-	struct adapter *padapter;
-
-
-	pBtCoexist = (struct btc_coexist *)pBtcContext;
-	padapter = pBtCoexist->Adapter;
+	struct btc_coexist *pBtCoexist = (struct btc_coexist *)pBtcContext;
+	struct adapter *padapter = pBtCoexist->Adapter;
 
 	rtw_hal_fill_h2c_cmd(padapter, elementId, cmdLen, pCmdBuffer);
 }
-- 
2.43.0

