Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2773520ADF9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269132; cv=none; b=Mdh8424gJdyNWugGjX8MhG8Eh2ZXht+Pp/YSFzHjWYyW0L1Q4sulcdIAJvX11OPb9Db82UUg9UlEBQUC69KZpsTj/XB4yvksvDDNsxR2a9PNAaYs6TE4LuPKYTWNl2XtilknTl8vwFunnlCslwhceJezkSrTsZWlvFGPzocBviA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269132; c=relaxed/simple;
	bh=8dH6+g92VQES3ftQWMiuuopF3g10eK3crUEyrnHuCl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h39nVc5xbfJ0+JGn+ZqHfLPC+f11/E2Jd39hg42utVD8aFKHjvXWVzGz15SkKGR4rE5W5hutnd98sBZX3HzE2Hz/JZJ5++mdbUfgNspaQfoFLE2roMyVBa00K3ykYljnPz+FCBK5xy2RN6Y1biaPUsH/xUivQlnLwUuWn8EYbPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2sc8rel; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2sc8rel"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso3391425e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744269128; x=1744873928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pl/+DUVxi7AcDtcZxL2s+ahzJl40wiTXFkQxBjrab7o=;
        b=a2sc8relFAum54vEo3qcGLaQazDWooWLcphusrjnS6woI+/+skro7a/UkTlszoGy/7
         q5N5vE0s6WEXXlqr8A19y+wha42oK/DZHB+N1LqZiRNd2cWkwtAok8hR5QhZ89WBqo77
         AwYUOE4IckJsPpdb+9EJxH71H/+rHW/doGS8bnIwRO9RsIEglFQkS3g3tSsqmwzsN6Kh
         WUNq2045DpbHOK/bhx0UbiLtY9NDSTN3MfRQeTtXSSc+o76gFONCACtZYs6NmlITyUjy
         cFy8pEC6ZhssjklHaM5cdk34l9XwzF7f64n380Qvs9YnuMu0bvw2oAJqU6gm0DNmGvpK
         oOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744269128; x=1744873928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pl/+DUVxi7AcDtcZxL2s+ahzJl40wiTXFkQxBjrab7o=;
        b=mAjHrnivSdaS9VkqPjNWUB6++LigMCn4OyLMv5kmJZuPqTgfhJT0SA8YrPQ2jDG9il
         rKJBjg/oH1iPBdNVJ8IN0x0q+jjOxmn77w+BqUCJvttM4/AL7t0CRXeMZIf0XloU+i4c
         q64VdTGj3rtsTWQWWR3EKN7apkPnwcP0Nb0ma34JsY6V4ClOb/2sncQDiJigj6gPBD7k
         b4nUJhNutb7GioWuEo+HEVI8XEMIw6zxCs9Z/07DrutyDvTIb/tkC6yz8M4e3IFZoE7m
         jAq2LPWulTSHCJbgdxRTwoLXG4hERKn5rCeTqORgtY6DBuFjdkE37wOYpC76vjSbytgf
         iMxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpPJ3fvNEQt0LVekVitykQv5/9rzSMQvQA2zbK3AVBPGKqyJGiqEKSOF2I4XC6uwgWn4vMC8hxEFbBNX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZkB7iPW4NldMQ9qcNJfdmca+e9LsdXbCcMjUAojT84k/BZ6At
	of+V86+bxxWCRYJGVlW/MYkyM1L/lcyOSFX/topMKDgFJU9lub6f
X-Gm-Gg: ASbGncvoFS4phhtQMSmea15zcqXnUiMkC77nAphBZljnLbA7SmcsY1R+AF9WL8fLk8y
	99R6UDQYAAxxFzQ0LOFTvWm79rKZQZ0yzfNcLnx774aDhTiOvSzMI2havob0TEXyhZW2sQqW5tv
	EEcOxWFFD6Ajbs8ywizAGUfKkd7qg2pQ//q0M1jzep90/R7G3nY2dVKWTzgjPTzrtyojLktY76Y
	9v2gaGNnVqqvsDdzBzrK1n90LgGJ+uAOHr/J7Hzbf7gJ7L1XamizWhKglY9lc9hv22WX/g70xS2
	GQVnahjkJMaeibLcL5Lu4BfGEW9ITsJdygXhi8LAYCQqoy1Q
X-Google-Smtp-Source: AGHT+IFKOizKNgXJiOVsYiBv3HK64AKvXsvFVzNgoDyi5iko/WqkzEdPTzOiUR8ZxNMs9nkR7CrXAQ==
X-Received: by 2002:a5d:64a9:0:b0:397:8ef9:9963 with SMTP id ffacd0b85a97d-39d8f4effebmr1176752f8f.55.1744269128257;
        Thu, 10 Apr 2025 00:12:08 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5e90sm40831765e9.38.2025.04.10.00.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:12:07 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] staging: rtl8723bs: Initialize variables at declaration in rtl8723b_hal_init.c
Date: Thu, 10 Apr 2025 10:11:51 +0300
Message-ID: <4d52a207eadd99ad998214aa8eb059f725c94802.1744268316.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744268316.git.karanja99erick@gmail.com>
References: <cover.1744268316.git.karanja99erick@gmail.com>
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
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 81 ++++++-------------
 1 file changed, 24 insertions(+), 57 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e15ec6452fd0..893cab0532ed 100644
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
@@ -835,9 +827,8 @@ static void hal_ReadEFuse_BT(
 			}
 
 			if (offset < EFUSE_BT_MAX_SECTION) {
-				u16 addr;
+				u16 addr = offset * PGPKT_DATA_SIZE;
 
-				addr = offset * PGPKT_DATA_SIZE;
 				for (i = 0; i < EFUSE_MAX_WORD_UNIT; i++) {
 					/*  Check word enable condition in the section */
 					if (!(wden & (0x01<<i))) {
@@ -1196,10 +1187,9 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 	u16 val16;
-	u8 val8;
+	u8 val8 = DIS_TSF_UDT;
 
 
-	val8 = DIS_TSF_UDT;
 	val16 = val8 | (val8 << 8); /*  port0 and port1 */
 
 	/*  Enable prot0 beacon function for PSTDMA */
@@ -1496,10 +1486,7 @@ s32 rtl8723b_InitLLTTable(struct adapter *padapter)
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
@@ -2273,9 +2260,8 @@ void rtl8723b_fill_fake_txdesc(
 	/*  Encrypt the data frame if under security mode excepct null data. Suggested by CCW. */
 	/*  */
 	if (bDataFrame) {
-		u32 EncAlg;
+		u32 EncAlg = padapter->securitypriv.dot11PrivacyAlgrthm;
 
-		EncAlg = padapter->securitypriv.dot11PrivacyAlgrthm;
 		switch (EncAlg) {
 		case _NO_PRIVACY_:
 			SET_TX_DESC_SEC_TYPE_8723B(pDesc, 0x0);
@@ -2378,9 +2364,7 @@ static void hw_var_set_opmode(struct adapter *padapter, u8 variable, u8 *val)
 static void hw_var_set_macaddr(struct adapter *padapter, u8 variable, u8 *val)
 {
 	u8 idx = 0;
-	u32 reg_macid;
-
-	reg_macid = REG_MACID;
+	u32 reg_macid = REG_MACID;
 
 	for (idx = 0 ; idx < 6; idx++)
 		rtw_write8(GET_PRIMARY_ADAPTER(padapter), (reg_macid+idx), val[idx]);
@@ -2389,9 +2373,7 @@ static void hw_var_set_macaddr(struct adapter *padapter, u8 variable, u8 *val)
 static void hw_var_set_bssid(struct adapter *padapter, u8 variable, u8 *val)
 {
 	u8 idx = 0;
-	u32 reg_bssid;
-
-	reg_bssid = REG_BSSID;
+	u32 reg_bssid = REG_BSSID;
 
 	for (idx = 0 ; idx < 6; idx++)
 		rtw_write8(padapter, (reg_bssid+idx), val[idx]);
@@ -2399,9 +2381,7 @@ static void hw_var_set_bssid(struct adapter *padapter, u8 variable, u8 *val)
 
 static void hw_var_set_bcn_func(struct adapter *padapter, u8 variable, u8 *val)
 {
-	u32 bcn_ctrl_reg;
-
-	bcn_ctrl_reg = REG_BCN_CTRL;
+	u32 bcn_ctrl_reg = REG_BCN_CTRL;
 
 	if (*(u8 *)val)
 		rtw_write8(padapter, bcn_ctrl_reg, (EN_BCN_FUNCTION | EN_TXBCN_RPT));
@@ -2422,12 +2402,8 @@ static void hw_var_set_correct_tsf(struct adapter *padapter, u8 variable, u8 *va
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
 
@@ -2543,15 +2519,12 @@ static void hw_var_set_mlme_join(struct adapter *padapter, u8 variable, u8 *val)
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
@@ -2850,12 +2823,11 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 
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
@@ -3226,9 +3198,7 @@ void GetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
  */
 u8 SetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, void *pval)
 {
-	u8 bResult;
-
-	bResult = _SUCCESS;
+	u8 bResult = _SUCCESS;
 
 	switch (variable) {
 	default:
@@ -3244,9 +3214,7 @@ u8 SetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
  */
 u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, void *pval)
 {
-	u8 bResult;
-
-	bResult = _SUCCESS;
+	u8 bResult = _SUCCESS;
 
 	switch (variable) {
 	case HAL_DEF_MAX_RECVBUF_SZ:
@@ -3281,9 +3249,8 @@ u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
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

