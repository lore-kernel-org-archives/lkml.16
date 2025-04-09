Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9854D25D908
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744193062; cv=none; b=MXBODSykjOOaNKiXDkv4m+s5lEPbnpUYBMn6NEietNqGsXioArPOw4isYMoQnQWQvwN1opZOe7wFdid4+eFL8OvMS5xTWRqs5ldbBMu89AahRS1ZkpmPib60lF3AbUA44umoQ53aOU3Fvb9lsuwLmobz2+BBFVq32L2IyFCkexc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744193062; c=relaxed/simple;
	bh=WnoJ0PIhBCizQsaB0J6OXZzdneIQzB5SWyb2HjwPjmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gMyFMD6LunJNLpmtgxfriegvh7oIDN8ymBkzO6Vrc4QYQpWY9PKJimLHOyYDW98VK47IvwY5hG3ynCrAKL84kF57mVls7pvMFICu1w4JFDYatTJKRWCvXTRVWuO+mTrWki336kA6N0p497Ot8Qh/C2m8yFCA1ziv6UBirbqea2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VOz1jvAM; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VOz1jvAM"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf257158fso45975505e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 03:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744193059; x=1744797859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VC5fxHs8CeiwKADjawPGTUOJECA0Psky3GgKPj4Ekoc=;
        b=VOz1jvAMCBllzoElYeqspHv0qgo9KzTDgYL2V3EDpAYUFfOqpycWQ41STCaTTW0QgK
         V8O0v6zG0Sb2m26hxvdVK+N32TllAGg+mErypil6RaZ5+8hp+CzBTYRy2rVzpoiIg3JD
         X9Wq4J637mnv0An36PEW3zbfmdi1ndBtisQNz6HkejiLD3ABZKA7Wyjggc/2pruRQ5dk
         smwGU4tJS/FodgbkFdXmktTfmpNHC+oyMTN8m7/ZlkIuj1iZ6x5ceNHI9APZrRNCk1Be
         MgSsr6CgNTIresLSCAERdZDbMBUjqOSiGy8BreZIO0rlpiU9y3aikscZmk0qr8ASJ3EV
         wuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744193059; x=1744797859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VC5fxHs8CeiwKADjawPGTUOJECA0Psky3GgKPj4Ekoc=;
        b=mf/AkBzp8BCQScOtNWQkGdbqJudf7VnxjHUwsHe47DCLOcUEkFbzlQ263Sn5PjPUja
         Ql4edpuo3sjYKtTn0zh/HaNHdtUgLEyZaGRqsLKw3mvkEVr8TsSbctxbyA/ttwknfAO/
         aSSRY7+Ip1DAIQ8uX3VRUL8s752TwDDmztRHxC8D876VRbGDVHcADEU8p+wiOh4DHNhu
         OOjNMiBTatbGtZGreQQEydPTXhUnnEJaVDEC3Pt+ngJoU9Zq/VZu/IWk4++1w76QV6EX
         CGnZNhIF8BdvkHQ9BZqI9U9EL3HUf4XhFLBw2OklUUU6vhMc1kwPq2Mce91sgA1Ql1TJ
         OTeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGGPu7DhY/ClqxV0+gA+IkYZpDL2ZwUemA3zhZ0MY1m8945tg7+NHjlxATmE6MqLWJxoAuioAsM4iKivk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB0ewg0UCrOroQ+KXekuxwOJY8jSY7vy54rUoHvlQDRH6kMK05
	2jSH8NSgccucZ6zCDo6Y00NQZdtZpVnkkcRFQ9sccEvxB0TuXgQ1
X-Gm-Gg: ASbGncu/XZy87a4DeOohK4WGc2X+AHhPVhIvb+IfCjWcjuKXLDuw4aVe3tnIY1bq04D
	fK6lb0s27e8fxxC+FErsfEPI/XNsNe3tzjQwOl+BTQwoLWXPN3+vqOP/RVJvfTwpU2rsso8DRBq
	Mq83uuSeiscOQBdUc6IvlZXZp7G22Zw2URwqsjnwg4lgmjacFCbNDLdNqM/EV02NtlkSHvrw51b
	dj4/ILv6CXkHEgCiyygNXgTW9BzfGtYwEoFQ302p+BsCvgVjonqBjrEEHE/ebgtDoKgc1vRGvOr
	rDUIJSh2H4KtYTt79wG1of4Na7D8ncZiYNaMJA==
X-Google-Smtp-Source: AGHT+IH0nKJUVbc50t7mTes5ovg4GgAkVaz1UTKljMjTHPB4yYKVLS/PxCuutuNL9VHzd7Cnpi+unQ==
X-Received: by 2002:a05:600c:1f16:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-43f1fe01880mr18160855e9.13.1744193058483;
        Wed, 09 Apr 2025 03:04:18 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f205ecac8sm14930295e9.4.2025.04.09.03.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 03:04:18 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] staging: rtl8723bs: Improve code readability
Date: Wed,  9 Apr 2025 13:04:04 +0300
Message-ID: <97a2637f3ccefb3de0e15fd04f29f5f209f2a506.1744192642.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744192642.git.karanja99erick@gmail.com>
References: <cover.1744192642.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the code more readable by moving trivial
initializations up with the declarations instead
of wasting a line on that.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 84 ++++++-------------
 1 file changed, 25 insertions(+), 59 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e15ec6452fd0..2cf2c66140f1 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -501,8 +501,7 @@ void Hal_GetEfuseDefinition(
 	switch (type) {
 	case TYPE_EFUSE_MAX_SECTION:
 		{
-			u8 *pMax_section;
-			pMax_section = pOut;
+			u8 *pMax_section = pOut;
 
 			if (efuseType == EFUSE_WIFI)
 				*pMax_section = EFUSE_MAX_SECTION_8723B;
@@ -513,8 +512,7 @@ void Hal_GetEfuseDefinition(
 
 	case TYPE_EFUSE_REAL_CONTENT_LEN:
 		{
-			u16 *pu2Tmp;
-			pu2Tmp = pOut;
+			u16 *pu2Tmp = pOut;
 
 			if (efuseType == EFUSE_WIFI)
 				*pu2Tmp = EFUSE_REAL_CONTENT_LEN_8723B;
@@ -525,8 +523,7 @@ void Hal_GetEfuseDefinition(
 
 	case TYPE_AVAILABLE_EFUSE_BYTES_BANK:
 		{
-			u16 *pu2Tmp;
-			pu2Tmp = pOut;
+			u16 *pu2Tmp = pOut;
 
 			if (efuseType == EFUSE_WIFI)
 				*pu2Tmp = (EFUSE_REAL_CONTENT_LEN_8723B-EFUSE_OOB_PROTECT_BYTES);
@@ -537,8 +534,7 @@ void Hal_GetEfuseDefinition(
 
 	case TYPE_AVAILABLE_EFUSE_BYTES_TOTAL:
 		{
-			u16 *pu2Tmp;
-			pu2Tmp = pOut;
+			u16 *pu2Tmp = pOut;
 
 			if (efuseType == EFUSE_WIFI)
 				*pu2Tmp = (EFUSE_REAL_CONTENT_LEN_8723B-EFUSE_OOB_PROTECT_BYTES);
@@ -549,8 +545,7 @@ void Hal_GetEfuseDefinition(
 
 	case TYPE_EFUSE_MAP_LEN:
 		{
-			u16 *pu2Tmp;
-			pu2Tmp = pOut;
+			u16 *pu2Tmp = pOut;
 
 			if (efuseType == EFUSE_WIFI)
 				*pu2Tmp = EFUSE_MAX_MAP_LEN;
@@ -561,8 +556,7 @@ void Hal_GetEfuseDefinition(
 
 	case TYPE_EFUSE_PROTECT_BYTES_BANK:
 		{
-			u8 *pu1Tmp;
-			pu1Tmp = pOut;
+			u8 *pu1Tmp = pOut;
 
 			if (efuseType == EFUSE_WIFI)
 				*pu1Tmp = EFUSE_OOB_PROTECT_BYTES;
@@ -573,8 +567,7 @@ void Hal_GetEfuseDefinition(
 
 	case TYPE_EFUSE_CONTENT_LEN_BANK:
 		{
-			u16 *pu2Tmp;
-			pu2Tmp = pOut;
+			u16 *pu2Tmp = pOut;
 
 			if (efuseType == EFUSE_WIFI)
 				*pu2Tmp = EFUSE_REAL_CONTENT_LEN_8723B;
@@ -585,8 +578,7 @@ void Hal_GetEfuseDefinition(
 
 	default:
 		{
-			u8 *pu1Tmp;
-			pu1Tmp = pOut;
+			u8 *pu1Tmp = pOut;
 			*pu1Tmp = 0;
 		}
 		break;
@@ -729,10 +721,9 @@ static void hal_ReadEFuse_WiFi(
 		}
 
 		if (offset < EFUSE_MAX_SECTION_8723B) {
-			u16 addr;
+			u16 addr = offset * PGPKT_DATA_SIZE;
 			/*  Get word enable value from PG header */
 
-			addr = offset * PGPKT_DATA_SIZE;
 			for (i = 0; i < EFUSE_MAX_WORD_UNIT; i++) {
 				/*  Check word enable condition in the section */
 				if (!(wden & (0x01<<i))) {
@@ -835,9 +826,8 @@ static void hal_ReadEFuse_BT(
 			}
 
 			if (offset < EFUSE_BT_MAX_SECTION) {
-				u16 addr;
+				u16 addr = offset * PGPKT_DATA_SIZE;
 
-				addr = offset * PGPKT_DATA_SIZE;
 				for (i = 0; i < EFUSE_MAX_WORD_UNIT; i++) {
 					/*  Check word enable condition in the section */
 					if (!(wden & (0x01<<i))) {
@@ -1196,10 +1186,9 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 	u16 val16;
-	u8 val8;
+	u8 val8 = DIS_TSF_UDT;
 
 
-	val8 = DIS_TSF_UDT;
 	val16 = val8 | (val8 << 8); /*  port0 and port1 */
 
 	/*  Enable prot0 beacon function for PSTDMA */
@@ -1496,10 +1485,7 @@ s32 rtl8723b_InitLLTTable(struct adapter *padapter)
 {
 	unsigned long start, passing_time;
 	u32 val32;
-	s32 ret;
-
-
-	ret = _FAIL;
+	s32 ret = _FAIL;
 
 	val32 = rtw_read32(padapter, REG_AUTO_LLT);
 	val32 |= BIT_AUTO_INIT_LLT;
@@ -2273,9 +2259,8 @@ void rtl8723b_fill_fake_txdesc(
 	/*  Encrypt the data frame if under security mode excepct null data. Suggested by CCW. */
 	/*  */
 	if (bDataFrame) {
-		u32 EncAlg;
+		u32 EncAlg = padapter->securitypriv.dot11PrivacyAlgrthm;
 
-		EncAlg = padapter->securitypriv.dot11PrivacyAlgrthm;
 		switch (EncAlg) {
 		case _NO_PRIVACY_:
 			SET_TX_DESC_SEC_TYPE_8723B(pDesc, 0x0);
@@ -2378,9 +2363,7 @@ static void hw_var_set_opmode(struct adapter *padapter, u8 variable, u8 *val)
 static void hw_var_set_macaddr(struct adapter *padapter, u8 variable, u8 *val)
 {
 	u8 idx = 0;
-	u32 reg_macid;
-
-	reg_macid = REG_MACID;
+	u32 reg_macid = REG_MACID;
 
 	for (idx = 0 ; idx < 6; idx++)
 		rtw_write8(GET_PRIMARY_ADAPTER(padapter), (reg_macid+idx), val[idx]);
@@ -2389,9 +2372,7 @@ static void hw_var_set_macaddr(struct adapter *padapter, u8 variable, u8 *val)
 static void hw_var_set_bssid(struct adapter *padapter, u8 variable, u8 *val)
 {
 	u8 idx = 0;
-	u32 reg_bssid;
-
-	reg_bssid = REG_BSSID;
+	u32 reg_bssid = REG_BSSID;
 
 	for (idx = 0 ; idx < 6; idx++)
 		rtw_write8(padapter, (reg_bssid+idx), val[idx]);
@@ -2399,9 +2380,7 @@ static void hw_var_set_bssid(struct adapter *padapter, u8 variable, u8 *val)
 
 static void hw_var_set_bcn_func(struct adapter *padapter, u8 variable, u8 *val)
 {
-	u32 bcn_ctrl_reg;
-
-	bcn_ctrl_reg = REG_BCN_CTRL;
+	u32 bcn_ctrl_reg = REG_BCN_CTRL;
 
 	if (*(u8 *)val)
 		rtw_write8(padapter, bcn_ctrl_reg, (EN_BCN_FUNCTION | EN_TXBCN_RPT));
@@ -2422,12 +2401,8 @@ static void hw_var_set_correct_tsf(struct adapter *padapter, u8 variable, u8 *va
 {
 	u8 val8;
 	u64 tsf;
-	struct mlme_ext_priv *pmlmeext;
-	struct mlme_ext_info *pmlmeinfo;
-
-
-	pmlmeext = &padapter->mlmeextpriv;
-	pmlmeinfo = &pmlmeext->mlmext_info;
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	tsf = pmlmeext->TSFValue-do_div(pmlmeext->TSFValue, (pmlmeinfo->bcn_interval*1024))-1024; /* us */
 
@@ -2543,15 +2518,12 @@ static void hw_var_set_mlme_join(struct adapter *padapter, u8 variable, u8 *val)
 	u8 val8;
 	u16 val16;
 	u32 val32;
-	u8 RetryLimit;
-	u8 type;
-	struct mlme_priv *pmlmepriv;
+	u8 RetryLimit = 0x30;
+	u8 type = *(u8 *)val;
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct eeprom_priv *pEEPROM;
 
 
-	RetryLimit = 0x30;
-	type = *(u8 *)val;
-	pmlmepriv = &padapter->mlmepriv;
 	pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
 
 	if (type == 0) { /*  prepare to join */
@@ -2850,12 +2822,11 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 
 	case HW_VAR_ACK_PREAMBLE:
 		{
-			u8 regTmp;
+			u8 regTmp = 0;
 			u8 bShortPreamble = *val;
 
 			/*  Joseph marked out for Netgear 3500 TKIP channel 7 issue.(Temporarily) */
 			/* regTmp = (pHalData->nCur40MhzPrimeSC)<<5; */
-			regTmp = 0;
 			if (bShortPreamble)
 				regTmp |= 0x80;
 			rtw_write8(padapter, REG_RRSR+2, regTmp);
@@ -3226,9 +3197,7 @@ void GetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
  */
 u8 SetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, void *pval)
 {
-	u8 bResult;
-
-	bResult = _SUCCESS;
+	u8 bResult = _SUCCESS;
 
 	switch (variable) {
 	default:
@@ -3244,9 +3213,7 @@ u8 SetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
  */
 u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, void *pval)
 {
-	u8 bResult;
-
-	bResult = _SUCCESS;
+	u8 bResult = _SUCCESS;
 
 	switch (variable) {
 	case HAL_DEF_MAX_RECVBUF_SZ:
@@ -3281,9 +3248,8 @@ u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
 	case HW_DEF_RA_INFO_DUMP:
 		{
 			u8 mac_id = *(u8 *)pval;
-			u32 cmd;
+			u32 cmd = 0x40000100 | mac_id;
 
-			cmd = 0x40000100 | mac_id;
 			rtw_write32(padapter, REG_HMEBOX_DBG_2_8723B, cmd);
 			msleep(10);
 			rtw_read32(padapter, 0x2F0);	// info 1
-- 
2.43.0

