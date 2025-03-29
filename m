Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602A418DB0D
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 11:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743246152; cv=none; b=M4ukrcOe4da4OJFMLQM+/BSMnxCn/BucGBA7wh8aYKYnbewpmgGuiarRL85SLxRTinvyOGybzLjgNL1KU50jlUDuZrmb0xg/fJ61C3q1V5GQx2/77ySQ5KvPkWhPff/iJ+dEtK+7C2nN6zX1hEviER6VJjQXXnqz5rAijLKs7Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743246152; c=relaxed/simple;
	bh=xT1hFBvxJyL0MG7jIT0EpvJDYPx6HtmCgNESF0M7Iqk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ShWYZZlLbluPYuVmJhJhw80c0u9le4nVKtVr1hWjkYFdDxnU3UvQYNjT3ubO47rbNTmEC4ASTAlIkcEDF0R2zf1A7FUuntrFnGlIlxnBUE9ZaH0n1FTuHcxsMsNlx68aiKhyZFav5i7bdUaoNeLdYWgnQU/drclRcpf8FYK4TR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5PBp96C; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5PBp96C"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso5526501a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 04:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743246144; x=1743850944; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NBarHRNr5vuRMQ7XpLQf55nJSSqRSPGz7+TX68jjUfk=;
        b=f5PBp96C77bmJkYg1O3WsfQdMh2zMRgtjnEL04+vLH3Fx3SwNHg3A/bWlhlMy6vOqW
         UC0yj0NGr2G2FEMcFtxY46GfNAOemiL9+3CFYIPGLwWnGbT5y1rqnwsOG7pBB9rtC2Ic
         nVTKeehUUPpeCAXunaP4GKRp/yiJsZ9ypVxZEeitDXfkCsuuAxFycdn032I7GOlESdE6
         k42KCIftS8OVwIi7R+9kyuzyqQNGDe4HtNRfjB2lqkHdedT9dwjDKn771eEqdkrrgqv7
         L7sBd2hgCYbntdJbbG/LjHvzkzUUPHWHnyLTbWFkZSRjmIRwougXBZRtdqFpexYcL/7t
         LvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743246144; x=1743850944;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NBarHRNr5vuRMQ7XpLQf55nJSSqRSPGz7+TX68jjUfk=;
        b=CeTV2ATjj9TOQXZrTkYGc8DM3ERG5y1pYFQD8cROUP9IcksI8sR6mr6rJ4HlaFU7v/
         sQ0K8bhqxLzcCEiTrXPFWTqtlnpS6hjRZ0qbiVC3rJnYq+6OxqjEPCkiFniDHO+NZQyz
         j1azk3Q2E3mDwYbPZm0yIrDmR7f65T6gZBOv9wc8qGrDWrxqGT0onmjewEFn9/nhc6V3
         y8VYu7pIZEw9RKj1qoSaWuwRaP86jPZEuA2o1tBP50Hq2ehkKiXLXlMUVRJO4DAcDjV3
         D+u4jkKWbbwmsOVCcvY76utkJPtMtj9TJ7kGfSl3evCtM+6sZlKcnQvkpLtw8rgftJTn
         ZBRA==
X-Forwarded-Encrypted: i=1; AJvYcCXGmlwCY8kdLpa4ROsbjX803xq+9GWMcDy2PVU1ioKhWTrX0qHaAWNlsGssrf5M2uE1wRY4caAMIV70wZw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn3j2iYRlluEMWx0APDJt08loQW6c90mvvBaQWYWo7/u12Ch5W
	rUX8l+NV0hkJ0SFpwgUm5KA0Vnuj5W1nuLg55rZJtyFCexXwtv6mPFW7F1Tp
X-Gm-Gg: ASbGnct2Bfc26Xt/LjMNcO2szkfBEPjPnKF6F+1x7rsdJPN5rYYw+MwWuifLxq+BJj2
	0mCyo/1GFDqmt4jIlSc5KcWrLpl+qb15KXcLF+bqE3piMf0fehQlZqrJtg+AP9hhsR2kyo+LvRY
	3rIIYI2sjIC0A0FkiOQoJoFinUsLrPzN+Sbungk2oSoXvnuGEZU4QCVpyV2sr5ZNlhBfUU/7XMg
	Bndd6AH0XNqRS8jdCP96HC+JVQFVRkDvJJw70KPyVkd8UY9n88nBk4Kd2FX/Li3QVL8aSamNEw7
	wnbCuozodhjuNXCA0+T+V57uz/A6T63+jTFEBSlVmv1DgzbKFq7EwhfzupRk
X-Google-Smtp-Source: AGHT+IGRAVDyGZBtvHz2uKUzmD5pCA9h+cak8PkDqTplrgKHpRUWo7b8cXAYFQrTpJ+6He7938Eggw==
X-Received: by 2002:a05:6402:4305:b0:5d9:82bc:ad06 with SMTP id 4fb4d7f45d1cf-5edfcbe93c7mr2113719a12.3.1743246142755;
        Sat, 29 Mar 2025 04:02:22 -0700 (PDT)
Received: from HP-650 ([105.112.114.162])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16f10d6sm2842518a12.47.2025.03.29.04.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 04:02:21 -0700 (PDT)
Date: Sat, 29 Mar 2025 12:01:57 +0100
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev, julia.lawall@inria.fr
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove unnecessary type encoding in
 variable names
Message-ID: <Z+fTJRBOZ+66zmsh@HP-650>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

type encoding in variable names are not a standard in Linux kernel coding
style.

Remove redundant type prefixes (e.g, `b`, `p`) in variable names,
as explicit type encoding is not necessary in Linux kernel code which
uses type definitions rather than variable name prefixes

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 1184 ++++++++---------
 drivers/staging/rtl8723bs/hal/odm.c           |  462 +++----
 .../staging/rtl8723bs/hal/odm_CfoTracking.c   |  130 +-
 3 files changed, 888 insertions(+), 888 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 81149ab81904..8b58f6c6d8f7 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -8,7 +8,7 @@
 #include <drv_types.h>
 #include "odm_precomp.h"
 
-/*  MACRO definition for pRFCalibrateInfo->TxIQC_8723B[0] */
+/*  MACRO definition for rf_calibrate_info->TxIQC_8723B[0] */
 #define		PATH_S0							1 /*  RF_PATH_B */
 #define		IDX_0xC94						0
 #define		IDX_0xC80						1
@@ -17,7 +17,7 @@
 #define		KEY							0
 #define		VAL							1
 
-/*  MACRO definition for pRFCalibrateInfo->TxIQC_8723B[1] */
+/*  MACRO definition for rf_calibrate_info->TxIQC_8723B[1] */
 #define		PATH_S1							0 /*  RF_PATH_A */
 #define		IDX_0xC4C						2
 
@@ -41,7 +41,7 @@ static u8 DeltaSwingTableIdx_2GA_P_8188E[] = {
 
 
 static void setIqkMatrix_8723B(
-	struct dm_odm_t *pDM_Odm,
+	struct dm_odm_t *dm_odm,
 	u8 OFDM_index,
 	u8 RFPath,
 	s32 IqkResult_X,
@@ -73,26 +73,26 @@ static void setIqkMatrix_8723B(
 			 * element B is always 0
 			 */
 			value32 = (ele_D<<22)|((ele_C&0x3F)<<16)|ele_A;
-			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, bMaskDWord, value32);
+			PHY_SetBBReg(dm_odm->Adapter, rOFDM0_XATxIQImbalance, bMaskDWord, value32);
 
 			value32 = (ele_C&0x000003C0)>>6;
-			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XCTxAFE, bMaskH4Bits, value32);
+			PHY_SetBBReg(dm_odm->Adapter, rOFDM0_XCTxAFE, bMaskH4Bits, value32);
 
 			value32 = ((IqkResult_X * ele_D)>>7)&0x01;
-			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT24, value32);
+			PHY_SetBBReg(dm_odm->Adapter, rOFDM0_ECCAThreshold, BIT24, value32);
 			break;
 		case RF_PATH_B:
 			/* write new elements A, C, D to regC88 and regC9C,
 			 * element B is always 0
 			 */
 			value32 = (ele_D<<22)|((ele_C&0x3F)<<16)|ele_A;
-			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, bMaskDWord, value32);
+			PHY_SetBBReg(dm_odm->Adapter, rOFDM0_XBTxIQImbalance, bMaskDWord, value32);
 
 			value32 = (ele_C&0x000003C0)>>6;
-			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskH4Bits, value32);
+			PHY_SetBBReg(dm_odm->Adapter, rOFDM0_XDTxAFE, bMaskH4Bits, value32);
 
 			value32 = ((IqkResult_X * ele_D)>>7)&0x01;
-			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT28, value32);
+			PHY_SetBBReg(dm_odm->Adapter, rOFDM0_ECCAThreshold, BIT28, value32);
 
 			break;
 		default:
@@ -101,15 +101,15 @@ static void setIqkMatrix_8723B(
 	} else {
 		switch (RFPath) {
 		case RF_PATH_A:
-			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, bMaskDWord, OFDMSwingTable_New[OFDM_index]);
-			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XCTxAFE, bMaskH4Bits, 0x00);
-			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT24, 0x00);
+			PHY_SetBBReg(dm_odm->Adapter, rOFDM0_XATxIQImbalance, bMaskDWord, OFDMSwingTable_New[OFDM_index]);
+			PHY_SetBBReg(dm_odm->Adapter, rOFDM0_XCTxAFE, bMaskH4Bits, 0x00);
+			PHY_SetBBReg(dm_odm->Adapter, rOFDM0_ECCAThreshold, BIT24, 0x00);
 			break;
 
 		case RF_PATH_B:
-			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, bMaskDWord, OFDMSwingTable_New[OFDM_index]);
-			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskH4Bits, 0x00);
-			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT28, 0x00);
+			PHY_SetBBReg(dm_odm->Adapter, rOFDM0_XBTxIQImbalance, bMaskDWord, OFDMSwingTable_New[OFDM_index]);
+			PHY_SetBBReg(dm_odm->Adapter, rOFDM0_XDTxAFE, bMaskH4Bits, 0x00);
+			PHY_SetBBReg(dm_odm->Adapter, rOFDM0_ECCAThreshold, BIT28, 0x00);
 			break;
 
 		default:
@@ -119,31 +119,31 @@ static void setIqkMatrix_8723B(
 }
 
 
-static void setCCKFilterCoefficient(struct dm_odm_t *pDM_Odm, u8 CCKSwingIndex)
+static void setCCKFilterCoefficient(struct dm_odm_t *dm_odm, u8 CCKSwingIndex)
 {
-	if (!pDM_Odm->RFCalibrateInfo.bCCKinCH14) {
-		rtw_write8(pDM_Odm->Adapter, 0xa22, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][0]);
-		rtw_write8(pDM_Odm->Adapter, 0xa23, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][1]);
-		rtw_write8(pDM_Odm->Adapter, 0xa24, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][2]);
-		rtw_write8(pDM_Odm->Adapter, 0xa25, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][3]);
-		rtw_write8(pDM_Odm->Adapter, 0xa26, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][4]);
-		rtw_write8(pDM_Odm->Adapter, 0xa27, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][5]);
-		rtw_write8(pDM_Odm->Adapter, 0xa28, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][6]);
-		rtw_write8(pDM_Odm->Adapter, 0xa29, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][7]);
+	if (!dm_odm->RFCalibrateInfo.bCCKinCH14) {
+		rtw_write8(dm_odm->Adapter, 0xa22, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][0]);
+		rtw_write8(dm_odm->Adapter, 0xa23, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][1]);
+		rtw_write8(dm_odm->Adapter, 0xa24, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][2]);
+		rtw_write8(dm_odm->Adapter, 0xa25, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][3]);
+		rtw_write8(dm_odm->Adapter, 0xa26, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][4]);
+		rtw_write8(dm_odm->Adapter, 0xa27, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][5]);
+		rtw_write8(dm_odm->Adapter, 0xa28, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][6]);
+		rtw_write8(dm_odm->Adapter, 0xa29, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][7]);
 	} else {
-		rtw_write8(pDM_Odm->Adapter, 0xa22, CCKSwingTable_Ch14_New[CCKSwingIndex][0]);
-		rtw_write8(pDM_Odm->Adapter, 0xa23, CCKSwingTable_Ch14_New[CCKSwingIndex][1]);
-		rtw_write8(pDM_Odm->Adapter, 0xa24, CCKSwingTable_Ch14_New[CCKSwingIndex][2]);
-		rtw_write8(pDM_Odm->Adapter, 0xa25, CCKSwingTable_Ch14_New[CCKSwingIndex][3]);
-		rtw_write8(pDM_Odm->Adapter, 0xa26, CCKSwingTable_Ch14_New[CCKSwingIndex][4]);
-		rtw_write8(pDM_Odm->Adapter, 0xa27, CCKSwingTable_Ch14_New[CCKSwingIndex][5]);
-		rtw_write8(pDM_Odm->Adapter, 0xa28, CCKSwingTable_Ch14_New[CCKSwingIndex][6]);
-		rtw_write8(pDM_Odm->Adapter, 0xa29, CCKSwingTable_Ch14_New[CCKSwingIndex][7]);
+		rtw_write8(dm_odm->Adapter, 0xa22, CCKSwingTable_Ch14_New[CCKSwingIndex][0]);
+		rtw_write8(dm_odm->Adapter, 0xa23, CCKSwingTable_Ch14_New[CCKSwingIndex][1]);
+		rtw_write8(dm_odm->Adapter, 0xa24, CCKSwingTable_Ch14_New[CCKSwingIndex][2]);
+		rtw_write8(dm_odm->Adapter, 0xa25, CCKSwingTable_Ch14_New[CCKSwingIndex][3]);
+		rtw_write8(dm_odm->Adapter, 0xa26, CCKSwingTable_Ch14_New[CCKSwingIndex][4]);
+		rtw_write8(dm_odm->Adapter, 0xa27, CCKSwingTable_Ch14_New[CCKSwingIndex][5]);
+		rtw_write8(dm_odm->Adapter, 0xa28, CCKSwingTable_Ch14_New[CCKSwingIndex][6]);
+		rtw_write8(dm_odm->Adapter, 0xa29, CCKSwingTable_Ch14_New[CCKSwingIndex][7]);
 	}
 }
 
 void DoIQK_8723B(
-	struct dm_odm_t *pDM_Odm,
+	struct dm_odm_t *dm_odm,
 	u8 DeltaThermalIndex,
 	u8 ThermalValue,
 	u8 Threshold
@@ -169,14 +169,14 @@ void DoIQK_8723B(
  *
  *---------------------------------------------------------------------------*/
 void ODM_TxPwrTrackSetPwr_8723B(
-	struct dm_odm_t *pDM_Odm,
+	struct dm_odm_t *dm_odm,
 	enum pwrtrack_method Method,
 	u8 RFPath,
 	u8 ChannelMappedIndex
 )
 {
-	struct adapter *Adapter = pDM_Odm->Adapter;
-	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
+	struct adapter *Adapter = dm_odm->Adapter;
+	struct hal_com_data *hal_data = GET_HAL_DATA(Adapter);
 	u8 PwrTrackingLimit_OFDM = 34; /* 0dB */
 	u8 PwrTrackingLimit_CCK = 28; /* 2dB */
 	u8 TxRate = 0xFF;
@@ -184,11 +184,11 @@ void ODM_TxPwrTrackSetPwr_8723B(
 	u8 Final_CCK_Swing_Index = 0;
 
 	{
-		u16 rate = *(pDM_Odm->pForcedDataRate);
+		u16 rate = *(dm_odm->pForcedDataRate);
 
 		if (!rate) { /* auto rate */
-			if (pDM_Odm->TxRate != 0xFF)
-				TxRate = HwRateToMRate(pDM_Odm->TxRate);
+			if (dm_odm->TxRate != 0xFF)
+				TxRate = HwRateToMRate(dm_odm->TxRate);
 		} else /* force rate */
 			TxRate = (u8)rate;
 
@@ -213,23 +213,23 @@ void ODM_TxPwrTrackSetPwr_8723B(
 			PwrTrackingLimit_OFDM = 34; /* 2dB */
 
 		else
-			PwrTrackingLimit_OFDM =  pDM_Odm->DefaultOfdmIndex;   /* Default OFDM index = 30 */
+			PwrTrackingLimit_OFDM =  dm_odm->DefaultOfdmIndex;   /* Default OFDM index = 30 */
 	}
 
 	if (Method == TXAGC) {
-		struct adapter *Adapter = pDM_Odm->Adapter;
+		struct adapter *Adapter = dm_odm->Adapter;
 
-		pDM_Odm->Remnant_OFDMSwingIdx[RFPath] = pDM_Odm->Absolute_OFDMSwingIdx[RFPath];
+		dm_odm->Remnant_OFDMSwingIdx[RFPath] = dm_odm->Absolute_OFDMSwingIdx[RFPath];
 
-		pDM_Odm->Modify_TxAGC_Flag_PathA = true;
-		pDM_Odm->Modify_TxAGC_Flag_PathA_CCK = true;
+		dm_odm->Modify_TxAGC_Flag_PathA = true;
+		dm_odm->Modify_TxAGC_Flag_PathA_CCK = true;
 
-		PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, pHalData->CurrentChannel, CCK);
-		PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, pHalData->CurrentChannel, OFDM);
-		PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, pHalData->CurrentChannel, HT_MCS0_MCS7);
+		PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, hal_data->CurrentChannel, CCK);
+		PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, hal_data->CurrentChannel, OFDM);
+		PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, hal_data->CurrentChannel, HT_MCS0_MCS7);
 	} else if (Method == BBSWING) {
-		Final_OFDM_Swing_Index = pDM_Odm->DefaultOfdmIndex + pDM_Odm->Absolute_OFDMSwingIdx[RFPath];
-		Final_CCK_Swing_Index = pDM_Odm->DefaultCckIndex + pDM_Odm->Absolute_OFDMSwingIdx[RFPath];
+		Final_OFDM_Swing_Index = dm_odm->DefaultOfdmIndex + dm_odm->Absolute_OFDMSwingIdx[RFPath];
+		Final_CCK_Swing_Index = dm_odm->DefaultCckIndex + dm_odm->Absolute_OFDMSwingIdx[RFPath];
 
 		/*  Adjust BB swing by OFDM IQ matrix */
 		if (Final_OFDM_Swing_Index >= PwrTrackingLimit_OFDM)
@@ -239,69 +239,69 @@ void ODM_TxPwrTrackSetPwr_8723B(
 
 		if (Final_CCK_Swing_Index >= CCK_TABLE_SIZE)
 			Final_CCK_Swing_Index = CCK_TABLE_SIZE-1;
-		else if (pDM_Odm->BbSwingIdxCck <= 0)
+		else if (dm_odm->BbSwingIdxCck <= 0)
 			Final_CCK_Swing_Index = 0;
 
-		setIqkMatrix_8723B(pDM_Odm, Final_OFDM_Swing_Index, RFPath,
-			pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][0],
-			pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][1]);
+		setIqkMatrix_8723B(dm_odm, Final_OFDM_Swing_Index, RFPath,
+			dm_odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][0],
+			dm_odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][1]);
 
-		setCCKFilterCoefficient(pDM_Odm, Final_CCK_Swing_Index);
+		setCCKFilterCoefficient(dm_odm, Final_CCK_Swing_Index);
 
 	} else if (Method == MIX_MODE) {
-		Final_OFDM_Swing_Index = pDM_Odm->DefaultOfdmIndex + pDM_Odm->Absolute_OFDMSwingIdx[RFPath];
-		Final_CCK_Swing_Index = pDM_Odm->DefaultCckIndex + pDM_Odm->Absolute_OFDMSwingIdx[RFPath];
+		Final_OFDM_Swing_Index = dm_odm->DefaultOfdmIndex + dm_odm->Absolute_OFDMSwingIdx[RFPath];
+		Final_CCK_Swing_Index = dm_odm->DefaultCckIndex + dm_odm->Absolute_OFDMSwingIdx[RFPath];
 
 		if (Final_OFDM_Swing_Index > PwrTrackingLimit_OFDM) { /* BBSwing higher then Limit */
-			pDM_Odm->Remnant_OFDMSwingIdx[RFPath] = Final_OFDM_Swing_Index - PwrTrackingLimit_OFDM;
+			dm_odm->Remnant_OFDMSwingIdx[RFPath] = Final_OFDM_Swing_Index - PwrTrackingLimit_OFDM;
 
-			setIqkMatrix_8723B(pDM_Odm, PwrTrackingLimit_OFDM, RFPath,
-				pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][0],
-				pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][1]);
+			setIqkMatrix_8723B(dm_odm, PwrTrackingLimit_OFDM, RFPath,
+				dm_odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][0],
+				dm_odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][1]);
 
-			pDM_Odm->Modify_TxAGC_Flag_PathA = true;
-			PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, pHalData->CurrentChannel, OFDM);
-			PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, pHalData->CurrentChannel, HT_MCS0_MCS7);
+			dm_odm->Modify_TxAGC_Flag_PathA = true;
+			PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, hal_data->CurrentChannel, OFDM);
+			PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, hal_data->CurrentChannel, HT_MCS0_MCS7);
 		} else if (Final_OFDM_Swing_Index <= 0) {
-			pDM_Odm->Remnant_OFDMSwingIdx[RFPath] = Final_OFDM_Swing_Index;
+			dm_odm->Remnant_OFDMSwingIdx[RFPath] = Final_OFDM_Swing_Index;
 
-			setIqkMatrix_8723B(pDM_Odm, 0, RFPath,
-				pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][0],
-				pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][1]);
+			setIqkMatrix_8723B(dm_odm, 0, RFPath,
+				dm_odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][0],
+				dm_odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][1]);
 
-			pDM_Odm->Modify_TxAGC_Flag_PathA = true;
-			PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, pHalData->CurrentChannel, OFDM);
-			PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, pHalData->CurrentChannel, HT_MCS0_MCS7);
+			dm_odm->Modify_TxAGC_Flag_PathA = true;
+			PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, hal_data->CurrentChannel, OFDM);
+			PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, hal_data->CurrentChannel, HT_MCS0_MCS7);
 		} else {
-			setIqkMatrix_8723B(pDM_Odm, Final_OFDM_Swing_Index, RFPath,
-				pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][0],
-				pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][1]);
-
-			if (pDM_Odm->Modify_TxAGC_Flag_PathA) { /* If TxAGC has changed, reset TxAGC again */
-				pDM_Odm->Remnant_OFDMSwingIdx[RFPath] = 0;
-				PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, pHalData->CurrentChannel, OFDM);
-				PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, pHalData->CurrentChannel, HT_MCS0_MCS7);
-				pDM_Odm->Modify_TxAGC_Flag_PathA = false;
+			setIqkMatrix_8723B(dm_odm, Final_OFDM_Swing_Index, RFPath,
+				dm_odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][0],
+				dm_odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[ChannelMappedIndex][1]);
+
+			if (dm_odm->Modify_TxAGC_Flag_PathA) { /* If TxAGC has changed, reset TxAGC again */
+				dm_odm->Remnant_OFDMSwingIdx[RFPath] = 0;
+				PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, hal_data->CurrentChannel, OFDM);
+				PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, hal_data->CurrentChannel, HT_MCS0_MCS7);
+				dm_odm->Modify_TxAGC_Flag_PathA = false;
 			}
 		}
 
 		if (Final_CCK_Swing_Index > PwrTrackingLimit_CCK) {
-			pDM_Odm->Remnant_CCKSwingIdx = Final_CCK_Swing_Index - PwrTrackingLimit_CCK;
-			setCCKFilterCoefficient(pDM_Odm, PwrTrackingLimit_CCK);
-			pDM_Odm->Modify_TxAGC_Flag_PathA_CCK = true;
-			PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, pHalData->CurrentChannel, CCK);
+			dm_odm->Remnant_CCKSwingIdx = Final_CCK_Swing_Index - PwrTrackingLimit_CCK;
+			setCCKFilterCoefficient(dm_odm, PwrTrackingLimit_CCK);
+			dm_odm->Modify_TxAGC_Flag_PathA_CCK = true;
+			PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, hal_data->CurrentChannel, CCK);
 		} else if (Final_CCK_Swing_Index <= 0) { /*  Lowest CCK Index = 0 */
-			pDM_Odm->Remnant_CCKSwingIdx = Final_CCK_Swing_Index;
-			setCCKFilterCoefficient(pDM_Odm, 0);
-			pDM_Odm->Modify_TxAGC_Flag_PathA_CCK = true;
-			PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, pHalData->CurrentChannel, CCK);
+			dm_odm->Remnant_CCKSwingIdx = Final_CCK_Swing_Index;
+			setCCKFilterCoefficient(dm_odm, 0);
+			dm_odm->Modify_TxAGC_Flag_PathA_CCK = true;
+			PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, hal_data->CurrentChannel, CCK);
 		} else {
-			setCCKFilterCoefficient(pDM_Odm, Final_CCK_Swing_Index);
+			setCCKFilterCoefficient(dm_odm, Final_CCK_Swing_Index);
 
-			if (pDM_Odm->Modify_TxAGC_Flag_PathA_CCK) { /* If TxAGC has changed, reset TxAGC again */
-				pDM_Odm->Remnant_CCKSwingIdx = 0;
-				PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, pHalData->CurrentChannel, CCK);
-				pDM_Odm->Modify_TxAGC_Flag_PathA_CCK = false;
+			if (dm_odm->Modify_TxAGC_Flag_PathA_CCK) { /* If TxAGC has changed, reset TxAGC again */
+				dm_odm->Remnant_CCKSwingIdx = 0;
+				PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, hal_data->CurrentChannel, CCK);
+				dm_odm->Modify_TxAGC_Flag_PathA_CCK = false;
 			}
 		}
 	} else
@@ -309,30 +309,30 @@ void ODM_TxPwrTrackSetPwr_8723B(
 }
 
 static void GetDeltaSwingTable_8723B(
-	struct dm_odm_t *pDM_Odm,
+	struct dm_odm_t *dm_odm,
 	u8 **TemperatureUP_A,
 	u8 **TemperatureDOWN_A,
 	u8 **TemperatureUP_B,
 	u8 **TemperatureDOWN_B
 )
 {
-	struct adapter *Adapter = pDM_Odm->Adapter;
-	struct odm_rf_cal_t *pRFCalibrateInfo = &pDM_Odm->RFCalibrateInfo;
-	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
-	u16 rate = *(pDM_Odm->pForcedDataRate);
-	u8 channel = pHalData->CurrentChannel;
+	struct adapter *Adapter = dm_odm->Adapter;
+	struct odm_rf_cal_t *rf_calibrate_info = &dm_odm->RFCalibrateInfo;
+	struct hal_com_data *hal_data = GET_HAL_DATA(Adapter);
+	u16 rate = *(dm_odm->pForcedDataRate);
+	u8 channel = hal_data->CurrentChannel;
 
 	if (1 <= channel && channel <= 14) {
 		if (IS_CCK_RATE(rate)) {
-			*TemperatureUP_A   = pRFCalibrateInfo->DeltaSwingTableIdx_2GCCKA_P;
-			*TemperatureDOWN_A = pRFCalibrateInfo->DeltaSwingTableIdx_2GCCKA_N;
-			*TemperatureUP_B   = pRFCalibrateInfo->DeltaSwingTableIdx_2GCCKB_P;
-			*TemperatureDOWN_B = pRFCalibrateInfo->DeltaSwingTableIdx_2GCCKB_N;
+			*TemperatureUP_A   = rf_calibrate_info->DeltaSwingTableIdx_2GCCKA_P;
+			*TemperatureDOWN_A = rf_calibrate_info->DeltaSwingTableIdx_2GCCKA_N;
+			*TemperatureUP_B   = rf_calibrate_info->DeltaSwingTableIdx_2GCCKB_P;
+			*TemperatureDOWN_B = rf_calibrate_info->DeltaSwingTableIdx_2GCCKB_N;
 		} else {
-			*TemperatureUP_A   = pRFCalibrateInfo->DeltaSwingTableIdx_2GA_P;
-			*TemperatureDOWN_A = pRFCalibrateInfo->DeltaSwingTableIdx_2GA_N;
-			*TemperatureUP_B   = pRFCalibrateInfo->DeltaSwingTableIdx_2GB_P;
-			*TemperatureDOWN_B = pRFCalibrateInfo->DeltaSwingTableIdx_2GB_N;
+			*TemperatureUP_A   = rf_calibrate_info->DeltaSwingTableIdx_2GA_P;
+			*TemperatureDOWN_A = rf_calibrate_info->DeltaSwingTableIdx_2GA_N;
+			*TemperatureUP_B   = rf_calibrate_info->DeltaSwingTableIdx_2GB_P;
+			*TemperatureDOWN_B = rf_calibrate_info->DeltaSwingTableIdx_2GB_N;
 		}
 	} else {
 		*TemperatureUP_A   = (u8 *)DeltaSwingTableIdx_2GA_P_8188E;
@@ -343,19 +343,19 @@ static void GetDeltaSwingTable_8723B(
 }
 
 
-void ConfigureTxpowerTrack_8723B(struct txpwrtrack_cfg *pConfig)
+void ConfigureTxpowerTrack_8723B(struct txpwrtrack_cfg *config)
 {
-	pConfig->SwingTableSize_CCK = CCK_TABLE_SIZE;
-	pConfig->SwingTableSize_OFDM = OFDM_TABLE_SIZE;
-	pConfig->Threshold_IQK = IQK_THRESHOLD;
-	pConfig->AverageThermalNum = AVG_THERMAL_NUM_8723B;
-	pConfig->RfPathCount = MAX_PATH_NUM_8723B;
-	pConfig->ThermalRegAddr = RF_T_METER_8723B;
-
-	pConfig->ODM_TxPwrTrackSetPwr = ODM_TxPwrTrackSetPwr_8723B;
-	pConfig->DoIQK = DoIQK_8723B;
-	pConfig->PHY_LCCalibrate = PHY_LCCalibrate_8723B;
-	pConfig->GetDeltaSwingTable = GetDeltaSwingTable_8723B;
+	config->SwingTableSize_CCK = CCK_TABLE_SIZE;
+	config->SwingTableSize_OFDM = OFDM_TABLE_SIZE;
+	config->Threshold_IQK = IQK_THRESHOLD;
+	config->AverageThermalNum = AVG_THERMAL_NUM_8723B;
+	config->RfPathCount = MAX_PATH_NUM_8723B;
+	config->ThermalRegAddr = RF_T_METER_8723B;
+
+	config->ODM_TxPwrTrackSetPwr = ODM_TxPwrTrackSetPwr_8723B;
+	config->DoIQK = DoIQK_8723B;
+	config->PHY_LCCalibrate = PHY_LCCalibrate_8723B;
+	config->GetDeltaSwingTable = GetDeltaSwingTable_8723B;
 }
 
 /* 1 7. IQK */
@@ -363,83 +363,83 @@ void ConfigureTxpowerTrack_8723B(struct txpwrtrack_cfg *pConfig)
 
 /* bit0 = 1 => Tx OK, bit1 = 1 => Rx OK */
 static u8 phy_PathA_IQK_8723B(
-	struct adapter *padapter, bool configPathB, u8 RF_Path
+	struct adapter *adapter, bool configPathB, u8 RF_Path
 )
 {
 	u32 regEAC, regE94, regE9C, tmp, Path_SEL_BB /*, regEA4*/;
 	u8 result = 0x00;
 
-	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
-	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
+	struct hal_com_data	*hal_data = GET_HAL_DATA(adapter);
+	struct dm_odm_t *dm_odm = &hal_data->odmpriv;
 
 	/*  Save RF Path */
-	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord);
+	Path_SEL_BB = PHY_QueryBBReg(dm_odm->Adapter, 0x948, bMaskDWord);
 
 	/* leave IQK mode */
-	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
+	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
 	/* 	enable path A PA in TXIQK mode */
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0003f);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xc7f87);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0003f);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xc7f87);
 	/* 	disable path B PA in TXIQK mode */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, bRFRegOffsetMask, 0x00020); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x40ec1); */
+/* 	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0xed, bRFRegOffsetMask, 0x00020); */
+/* 	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x40ec1); */
 
 	/* 1 Tx IQK */
 	/* IQK setting */
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK, bMaskDWord, 0x01007c00);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK, bMaskDWord, 0x01004800);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK, bMaskDWord, 0x01007c00);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK, bMaskDWord, 0x01004800);
 	/* path-A IQK setting */
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_A, bMaskDWord, 0x18008c1c);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_A, bMaskDWord, 0x38008c1c);
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x8214010a); */
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x821303ea);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_Tone_A, bMaskDWord, 0x18008c1c);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_Tone_A, bMaskDWord, 0x38008c1c);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
+/* 	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x8214010a); */
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x821303ea);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
 
 	/* LO calibration setting */
-	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Rsp, bMaskDWord, 0x00462911);
+	PHY_SetBBReg(dm_odm->Adapter, rIQK_AGC_Rsp, bMaskDWord, 0x00462911);
 
 	/* enter IQK mode */
-	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
+	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
 
 	/* Ant switch */
 	if (configPathB || (RF_Path == 0))
 		/*  wifi switch to S1 */
-		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000000);
+		PHY_SetBBReg(dm_odm->Adapter, 0x948, bMaskDWord, 0x00000000);
 	else
 		/*  wifi switch to S0 */
-		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
+		PHY_SetBBReg(dm_odm->Adapter, 0x948, bMaskDWord, 0x00000280);
 
 	/* GNT_BT = 0 */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
+	PHY_SetBBReg(dm_odm->Adapter, 0x764, bMaskDWord, 0x00000800);
 
 	/* One shot, path A LOK & IQK */
-	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf9000000);
-	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
+	PHY_SetBBReg(dm_odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf9000000);
+	PHY_SetBBReg(dm_odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
 
 	/*  delay x ms */
 	/* PlatformStallExecution(IQK_DELAY_TIME_8723B*1000); */
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB);
+	PHY_SetBBReg(dm_odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB);
 	/* GNT_BT = 1 */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00001800);
+	PHY_SetBBReg(dm_odm->Adapter, 0x764, bMaskDWord, 0x00001800);
 
 	/* leave IQK mode */
-	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
+	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
 
 	/*  Check failed */
-	regEAC = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
-	regE94 = PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord);
-	regE9C = PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord);
+	regEAC = PHY_QueryBBReg(dm_odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
+	regE94 = PHY_QueryBBReg(dm_odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord);
+	regE9C = PHY_QueryBBReg(dm_odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord);
 
 
 	/* Allen 20131125 */
@@ -464,82 +464,82 @@ static u8 phy_PathA_IQK_8723B(
 
 /* bit0 = 1 => Tx OK, bit1 = 1 => Rx OK */
 static u8 phy_PathA_RxIQK8723B(
-	struct adapter *padapter, bool configPathB, u8 RF_Path
+	struct adapter *adapter, bool configPathB, u8 RF_Path
 )
 {
 	u32 regEAC, regE94, regE9C, regEA4, u4tmp, tmp, Path_SEL_BB;
 	u8 result = 0x00;
-	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
-	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
+	struct hal_com_data *hal_data = GET_HAL_DATA(adapter);
+	struct dm_odm_t *dm_odm = &hal_data->odmpriv;
 
 	/*  Save RF Path */
-	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord);
+	Path_SEL_BB = PHY_QueryBBReg(dm_odm->Adapter, 0x948, bMaskDWord);
 
 	/* leave IQK mode */
-	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
+	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 	/* 1 Get TXIMR setting */
 	/* modify RXIQK mode table */
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
 	/* LNA2 off, PA on for Dcut */
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7fb7);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
-	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7fb7);
+/* 	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
+	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
 
 	/* IQK setting */
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK, bMaskDWord, 0x01007c00);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK, bMaskDWord, 0x01004800);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK, bMaskDWord, 0x01007c00);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK, bMaskDWord, 0x01004800);
 
 	/* path-A IQK setting */
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_A, bMaskDWord, 0x18008c1c);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_A, bMaskDWord, 0x38008c1c);
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_Tone_A, bMaskDWord, 0x18008c1c);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_Tone_A, bMaskDWord, 0x38008c1c);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82160c1f); */
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82130ff0);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
+/* 	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82160c1f); */
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82130ff0);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
 
 	/* LO calibration setting */
-	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Rsp, bMaskDWord, 0x0046a911);
+	PHY_SetBBReg(dm_odm->Adapter, rIQK_AGC_Rsp, bMaskDWord, 0x0046a911);
 
 	/* enter IQK mode */
-	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
+	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
 
 	/* Ant switch */
 	if (configPathB || (RF_Path == 0))
 		/*  wifi switch to S1 */
-		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000000);
+		PHY_SetBBReg(dm_odm->Adapter, 0x948, bMaskDWord, 0x00000000);
 	else
 		/*  wifi switch to S0 */
-		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
+		PHY_SetBBReg(dm_odm->Adapter, 0x948, bMaskDWord, 0x00000280);
 
 	/* GNT_BT = 0 */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
+	PHY_SetBBReg(dm_odm->Adapter, 0x764, bMaskDWord, 0x00000800);
 
 	/* One shot, path A LOK & IQK */
-	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf9000000);
-	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
+	PHY_SetBBReg(dm_odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf9000000);
+	PHY_SetBBReg(dm_odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
 
 	/*  delay x ms */
 	/* PlatformStallExecution(IQK_DELAY_TIME_8723B*1000); */
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB);
+	PHY_SetBBReg(dm_odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB);
 	/* GNT_BT = 1 */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00001800);
+	PHY_SetBBReg(dm_odm->Adapter, 0x764, bMaskDWord, 0x00001800);
 
 	/* leave IQK mode */
-	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
+	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
 	/*  Check failed */
-	regEAC = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
-	regE94 = PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord);
-	regE9C = PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord);
+	regEAC = PHY_QueryBBReg(dm_odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
+	regE94 = PHY_QueryBBReg(dm_odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord);
+	regE9C = PHY_QueryBBReg(dm_odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord);
 
 	/* Allen 20131125 */
 	tmp = (regE9C & 0x03FF0000)>>16;
@@ -559,78 +559,78 @@ static u8 phy_PathA_RxIQK8723B(
 		return result;
 
 	u4tmp = 0x80007C00 | (regE94&0x3FF0000) | ((regE9C&0x3FF0000) >> 16);
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK, bMaskDWord, u4tmp);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK, bMaskDWord, u4tmp);
 
 	/* modify RXIQK mode table */
-	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
+	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
 	/* LAN2 on, PA off for Dcut */
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7d77);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7d77);
+/* 	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
 
 	/* PA, PAD setting */
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0xf80);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x55, bRFRegOffsetMask, 0x4021f);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0xf80);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0x55, bRFRegOffsetMask, 0x4021f);
 
 
 	/* IQK setting */
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK, bMaskDWord, 0x01004800);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK, bMaskDWord, 0x01004800);
 
 	/* path-A IQK setting */
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_A, bMaskDWord, 0x38008c1c);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_A, bMaskDWord, 0x18008c1c);
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_Tone_A, bMaskDWord, 0x38008c1c);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_Tone_A, bMaskDWord, 0x18008c1c);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82110000);
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x281604c2); */
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x2813001f);
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82110000);
+/* 	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x281604c2); */
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x2813001f);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
 
 	/* LO calibration setting */
-	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Rsp, bMaskDWord, 0x0046a8d1);
+	PHY_SetBBReg(dm_odm->Adapter, rIQK_AGC_Rsp, bMaskDWord, 0x0046a8d1);
 
 	/* enter IQK mode */
-	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
+	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
 
 	/* Ant switch */
 	if (configPathB || (RF_Path == 0))
 		/*  wifi switch to S1 */
-		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000000);
+		PHY_SetBBReg(dm_odm->Adapter, 0x948, bMaskDWord, 0x00000000);
 	else
 		/*  wifi switch to S0 */
-		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
+		PHY_SetBBReg(dm_odm->Adapter, 0x948, bMaskDWord, 0x00000280);
 
 	/* GNT_BT = 0 */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
+	PHY_SetBBReg(dm_odm->Adapter, 0x764, bMaskDWord, 0x00000800);
 
 	/* One shot, path A LOK & IQK */
-	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf9000000);
-	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
+	PHY_SetBBReg(dm_odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf9000000);
+	PHY_SetBBReg(dm_odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
 
 	/*  delay x ms */
 	/* PlatformStallExecution(IQK_DELAY_TIME_8723B*1000); */
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB);
+	PHY_SetBBReg(dm_odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB);
 	/* GNT_BT = 1 */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00001800);
+	PHY_SetBBReg(dm_odm->Adapter, 0x764, bMaskDWord, 0x00001800);
 
     /* leave IQK mode */
-	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
+	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
 	/*  Check failed */
-	regEAC = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
-	regEA4 = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord);
+	regEAC = PHY_QueryBBReg(dm_odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
+	regEA4 = PHY_QueryBBReg(dm_odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord);
 
 	/* 	PA/PAD controlled by 0x0 */
 	/* leave IQK mode */
-	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0x780);
+	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0x780);
 
 	/* Allen 20131125 */
 	tmp = (regEAC & 0x03FF0000)>>16;
@@ -651,79 +651,79 @@ static u8 phy_PathA_RxIQK8723B(
 }
 
 /* bit0 = 1 => Tx OK, bit1 = 1 => Rx OK */
-static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
+static u8 phy_PathB_IQK_8723B(struct adapter *adapter)
 {
 	u32 regEAC, regE94, regE9C, tmp, Path_SEL_BB/*, regEC4, regECC, Path_SEL_BB*/;
 	u8 result = 0x00;
-	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
-	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
+	struct hal_com_data	*hal_data = GET_HAL_DATA(adapter);
+	struct dm_odm_t *dm_odm = &hal_data->odmpriv;
 
 	/*  Save RF Path */
-	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord);
+	Path_SEL_BB = PHY_QueryBBReg(dm_odm->Adapter, 0x948, bMaskDWord);
 
     /* leave IQK mode */
-	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
+	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
 	/* 	in TXIQK mode */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x20000); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0003f); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xc7f87); */
+/* 	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1); */
+/* 	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x20000); */
+/* 	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0003f); */
+/* 	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xc7f87); */
 	/* 	enable path B PA in TXIQK mode */
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x30fc1);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x30fc1);
 
 
 
 	/* 1 Tx IQK */
 	/* IQK setting */
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK, bMaskDWord, 0x01007c00);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK, bMaskDWord, 0x01004800);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK, bMaskDWord, 0x01007c00);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK, bMaskDWord, 0x01004800);
 	/* path-A IQK setting */
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_A, bMaskDWord, 0x18008c1c);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_A, bMaskDWord, 0x38008c1c);
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_Tone_A, bMaskDWord, 0x18008c1c);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_Tone_A, bMaskDWord, 0x38008c1c);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82140114); */
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x821303ea);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
+/* 	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82140114); */
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x821303ea);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
 
 	/* LO calibration setting */
-	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Rsp, bMaskDWord, 0x00462911);
+	PHY_SetBBReg(dm_odm->Adapter, rIQK_AGC_Rsp, bMaskDWord, 0x00462911);
 
 	/* enter IQK mode */
-	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
+	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
 
 	/* switch to path B */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
+	PHY_SetBBReg(dm_odm->Adapter, 0x948, bMaskDWord, 0x00000280);
+/* 	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
 
 	/* GNT_BT = 0 */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
+	PHY_SetBBReg(dm_odm->Adapter, 0x764, bMaskDWord, 0x00000800);
 
 	/* One shot, path B LOK & IQK */
-	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf9000000);
-	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
+	PHY_SetBBReg(dm_odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf9000000);
+	PHY_SetBBReg(dm_odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
 
 	/*  delay x ms */
 	/* PlatformStallExecution(IQK_DELAY_TIME_88E*1000); */
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB);
+	PHY_SetBBReg(dm_odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB);
 	/* GNT_BT = 1 */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00001800);
+	PHY_SetBBReg(dm_odm->Adapter, 0x764, bMaskDWord, 0x00001800);
 
     /* leave IQK mode */
-	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
+	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
 	/*  Check failed */
-	regEAC = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
-	regE94 = PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord);
-	regE9C = PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord);
+	regEAC = PHY_QueryBBReg(dm_odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
+	regE94 = PHY_QueryBBReg(dm_odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord);
+	regE9C = PHY_QueryBBReg(dm_odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord);
 
 	/* Allen 20131125 */
 	tmp = (regE9C & 0x03FF0000)>>16;
@@ -744,63 +744,63 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
 }
 
 /* bit0 = 1 => Tx OK, bit1 = 1 => Rx OK */
-static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
+static u8 phy_PathB_RxIQK8723B(struct adapter *adapter, bool configPathB)
 {
 	u32 regE94, regE9C, regEA4, regEAC, u4tmp, tmp, Path_SEL_BB;
 	u8 result = 0x00;
-	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
-	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
+	struct hal_com_data *hal_data = GET_HAL_DATA(adapter);
+	struct dm_odm_t *dm_odm = &hal_data->odmpriv;
 
 	/*  Save RF Path */
-	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord);
+	Path_SEL_BB = PHY_QueryBBReg(dm_odm->Adapter, 0x948, bMaskDWord);
     /* leave IQK mode */
-	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
+	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
 	/* switch to path B */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
+	PHY_SetBBReg(dm_odm->Adapter, 0x948, bMaskDWord, 0x00000280);
 	/* modify RXIQK mode table */
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7fb7);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7fb7);
 	/* open PA S1 & SMIXER */
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x30fcd);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x30fcd);
 
 
 	/* IQK setting */
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK, bMaskDWord, 0x01007c00);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK, bMaskDWord, 0x01004800);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK, bMaskDWord, 0x01007c00);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK, bMaskDWord, 0x01004800);
 
 
 	/* path-B IQK setting */
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_A, bMaskDWord, 0x18008c1c);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_A, bMaskDWord, 0x38008c1c);
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_Tone_A, bMaskDWord, 0x18008c1c);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_Tone_A, bMaskDWord, 0x38008c1c);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82160c1f); */
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82130ff0);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
+/* 	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82160c1f); */
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82130ff0);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
 
 	/* LO calibration setting */
-	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Rsp, bMaskDWord, 0x0046a911);
+	PHY_SetBBReg(dm_odm->Adapter, rIQK_AGC_Rsp, bMaskDWord, 0x0046a911);
 
     /* enter IQK mode */
-	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
+	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
 
 	/* switch to path B */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
+	PHY_SetBBReg(dm_odm->Adapter, 0x948, bMaskDWord, 0x00000280);
+/* 	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
 
 	/* GNT_BT = 0 */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
+	PHY_SetBBReg(dm_odm->Adapter, 0x764, bMaskDWord, 0x00000800);
 
 	/* One shot, path B TXIQK @ RXIQK */
-	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf9000000);
-	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
+	PHY_SetBBReg(dm_odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf9000000);
+	PHY_SetBBReg(dm_odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
 
 
 	/*  delay x ms */
@@ -808,17 +808,17 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB);
+	PHY_SetBBReg(dm_odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB);
 	/* GNT_BT = 1 */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00001800);
+	PHY_SetBBReg(dm_odm->Adapter, 0x764, bMaskDWord, 0x00001800);
 
     /* leave IQK mode */
-	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
+	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
 	/*  Check failed */
-	regEAC = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
-	regE94 = PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord);
-	regE9C = PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord);
+	regEAC = PHY_QueryBBReg(dm_odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
+	regE94 = PHY_QueryBBReg(dm_odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord);
+	regE9C = PHY_QueryBBReg(dm_odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord);
 
 	/* Allen 20131125 */
 	tmp = (regE9C & 0x03FF0000)>>16;
@@ -838,77 +838,77 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 		return result;
 
 	u4tmp = 0x80007C00 | (regE94&0x3FF0000)  | ((regE9C&0x3FF0000) >> 16);
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK, bMaskDWord, u4tmp);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK, bMaskDWord, u4tmp);
 
 	/* modify RXIQK mode table */
 	/* 20121009, Kordan> RF Mode = 3 */
-	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7d77);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
+	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7d77);
+/* 	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
 
 	/* open PA S1 & close SMIXER */
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x30ebd);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x30ebd);
 
 	/* PA, PAD setting */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0xf80); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x56, bRFRegOffsetMask, 0x51000); */
+/* 	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0xf80); */
+/* 	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0x56, bRFRegOffsetMask, 0x51000); */
 
 	/* IQK setting */
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK, bMaskDWord, 0x01004800);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK, bMaskDWord, 0x01004800);
 
 	/* path-B IQK setting */
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_A, bMaskDWord, 0x38008c1c);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_A, bMaskDWord, 0x18008c1c);
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_Tone_A, bMaskDWord, 0x38008c1c);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_Tone_A, bMaskDWord, 0x18008c1c);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82110000);
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x281604c2); */
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x2813001f);
-	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
-	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82110000);
+/* 	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x281604c2); */
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x2813001f);
+	PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
+	PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
 
 	/* LO calibration setting */
-	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Rsp, bMaskDWord, 0x0046a8d1);
+	PHY_SetBBReg(dm_odm->Adapter, rIQK_AGC_Rsp, bMaskDWord, 0x0046a8d1);
 
     /* enter IQK mode */
-	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
+	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
 
 	/* switch to path B */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
+	PHY_SetBBReg(dm_odm->Adapter, 0x948, bMaskDWord, 0x00000280);
+/* 	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
 
 	/* GNT_BT = 0 */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
+	PHY_SetBBReg(dm_odm->Adapter, 0x764, bMaskDWord, 0x00000800);
 
 	/* One shot, path B LOK & IQK */
-	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf9000000);
-	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
+	PHY_SetBBReg(dm_odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf9000000);
+	PHY_SetBBReg(dm_odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
 
 	/*  delay x ms */
 	/* PlatformStallExecution(IQK_DELAY_TIME_88E*1000); */
 	mdelay(IQK_DELAY_TIME_8723B);
 
 	/* restore Ant Path */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB);
+	PHY_SetBBReg(dm_odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB);
 	/* GNT_BT = 1 */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00001800);
+	PHY_SetBBReg(dm_odm->Adapter, 0x764, bMaskDWord, 0x00001800);
 
     /* leave IQK mode */
-	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
+	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
 	/*  Check failed */
-	regEAC = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
-	regEA4 = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord);
+	regEAC = PHY_QueryBBReg(dm_odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
+	regEA4 = PHY_QueryBBReg(dm_odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord);
 
 	/* 	PA/PAD controlled by 0x0 */
 	/* leave IQK mode */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, 0xffffff00, 0x00000000); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_B, 0xdf, bRFRegOffsetMask, 0x180); */
+/* 	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, 0xffffff00, 0x00000000); */
+/* 	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_B, 0xdf, bRFRegOffsetMask, 0x180); */
 
 
 
@@ -931,33 +931,33 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 }
 
 static void _PHY_PathAFillIQKMatrix8723B(
-	struct adapter *padapter,
-	bool bIQKOK,
+	struct adapter *adapter,
+	bool iqkok,
 	s32 result[][8],
 	u8 final_candidate,
-	bool bTxOnly
+	bool tx_only
 )
 {
 	u32 Oldval_0, X, TX0_A, reg;
 	s32 Y, TX0_C;
-	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
-	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
+	struct hal_com_data	*hal_data = GET_HAL_DATA(adapter);
+	struct dm_odm_t *dm_odm = &hal_data->odmpriv;
 
-	struct odm_rf_cal_t *pRFCalibrateInfo = &pDM_Odm->RFCalibrateInfo;
+	struct odm_rf_cal_t *rf_calibrate_info = &dm_odm->RFCalibrateInfo;
 
 	if (final_candidate == 0xFF)
 		return;
 
-	else if (bIQKOK) {
-		Oldval_0 = (PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, bMaskDWord) >> 22) & 0x3FF;
+	else if (iqkok) {
+		Oldval_0 = (PHY_QueryBBReg(dm_odm->Adapter, rOFDM0_XATxIQImbalance, bMaskDWord) >> 22) & 0x3FF;
 
 		X = result[final_candidate][0];
 		if ((X & 0x00000200) != 0)
 			X = X | 0xFFFFFC00;
 		TX0_A = (X * Oldval_0) >> 8;
-		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, 0x3FF, TX0_A);
+		PHY_SetBBReg(dm_odm->Adapter, rOFDM0_XATxIQImbalance, 0x3FF, TX0_A);
 
-		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT(31), ((X*Oldval_0>>7) & 0x1));
+		PHY_SetBBReg(dm_odm->Adapter, rOFDM0_ECCAThreshold, BIT(31), ((X*Oldval_0>>7) & 0x1));
 
 		Y = result[final_candidate][1];
 		if ((Y & 0x00000200) != 0)
@@ -965,74 +965,74 @@ static void _PHY_PathAFillIQKMatrix8723B(
 
 		/* 2 Tx IQC */
 		TX0_C = (Y * Oldval_0) >> 8;
-		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XCTxAFE, 0xF0000000, ((TX0_C&0x3C0)>>6));
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][KEY] = rOFDM0_XCTxAFE;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XCTxAFE, bMaskDWord);
+		PHY_SetBBReg(dm_odm->Adapter, rOFDM0_XCTxAFE, 0xF0000000, ((TX0_C&0x3C0)>>6));
+		rf_calibrate_info->TxIQC_8723B[PATH_S1][IDX_0xC94][KEY] = rOFDM0_XCTxAFE;
+		rf_calibrate_info->TxIQC_8723B[PATH_S1][IDX_0xC94][VAL] = PHY_QueryBBReg(dm_odm->Adapter, rOFDM0_XCTxAFE, bMaskDWord);
 
-		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, 0x003F0000, (TX0_C&0x3F));
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][KEY] = rOFDM0_XATxIQImbalance;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, bMaskDWord);
+		PHY_SetBBReg(dm_odm->Adapter, rOFDM0_XATxIQImbalance, 0x003F0000, (TX0_C&0x3F));
+		rf_calibrate_info->TxIQC_8723B[PATH_S1][IDX_0xC80][KEY] = rOFDM0_XATxIQImbalance;
+		rf_calibrate_info->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL] = PHY_QueryBBReg(dm_odm->Adapter, rOFDM0_XATxIQImbalance, bMaskDWord);
 
-		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT(29), ((Y*Oldval_0>>7) & 0x1));
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][KEY] = rOFDM0_ECCAThreshold;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, bMaskDWord);
+		PHY_SetBBReg(dm_odm->Adapter, rOFDM0_ECCAThreshold, BIT(29), ((Y*Oldval_0>>7) & 0x1));
+		rf_calibrate_info->TxIQC_8723B[PATH_S1][IDX_0xC4C][KEY] = rOFDM0_ECCAThreshold;
+		rf_calibrate_info->TxIQC_8723B[PATH_S1][IDX_0xC4C][VAL] = PHY_QueryBBReg(dm_odm->Adapter, rOFDM0_ECCAThreshold, bMaskDWord);
 
-		if (bTxOnly) {
+		if (tx_only) {
 			/*  <20130226, Kordan> Saving RxIQC, otherwise not initialized. */
-			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
-			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] = 0xfffffff & PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
-			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
-/* 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
-			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = 0x40000100;
+			rf_calibrate_info->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
+			rf_calibrate_info->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] = 0xfffffff & PHY_QueryBBReg(dm_odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
+			rf_calibrate_info->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
+/* 			rf_calibrate_info->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = PHY_QueryBBReg(dm_odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
+			rf_calibrate_info->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = 0x40000100;
 			return;
 		}
 
 		reg = result[final_candidate][2];
 
 		/* 2 Rx IQC */
-		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, 0x3FF, reg);
+		PHY_SetBBReg(dm_odm->Adapter, rOFDM0_XARxIQImbalance, 0x3FF, reg);
 		reg = result[final_candidate][3] & 0x3F;
-		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, 0xFC00, reg);
-		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
-		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord);
+		PHY_SetBBReg(dm_odm->Adapter, rOFDM0_XARxIQImbalance, 0xFC00, reg);
+		rf_calibrate_info->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
+		rf_calibrate_info->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = PHY_QueryBBReg(dm_odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord);
 
 		reg = (result[final_candidate][3] >> 6) & 0xF;
-		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, 0xF0000000, reg);
-		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
-		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
+		PHY_SetBBReg(dm_odm->Adapter, rOFDM0_RxIQExtAnta, 0xF0000000, reg);
+		rf_calibrate_info->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
+		rf_calibrate_info->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] = PHY_QueryBBReg(dm_odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
 
 	}
 }
 
 static void _PHY_PathBFillIQKMatrix8723B(
-	struct adapter *padapter,
-	bool bIQKOK,
+	struct adapter *adapter,
+	bool iqkok,
 	s32 result[][8],
 	u8 final_candidate,
-	bool bTxOnly /* do Tx only */
+	bool tx_only /* do Tx only */
 )
 {
 	u32 Oldval_1, X, TX1_A, reg;
 	s32	Y, TX1_C;
-	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
-	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
+	struct hal_com_data	*hal_data = GET_HAL_DATA(adapter);
+	struct dm_odm_t *dm_odm = &hal_data->odmpriv;
 
-	struct odm_rf_cal_t *pRFCalibrateInfo = &pDM_Odm->RFCalibrateInfo;
+	struct odm_rf_cal_t *rf_calibrate_info = &dm_odm->RFCalibrateInfo;
 
 	if (final_candidate == 0xFF)
 		return;
 
-	else if (bIQKOK) {
-		Oldval_1 = (PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, bMaskDWord) >> 22) & 0x3FF;
+	else if (iqkok) {
+		Oldval_1 = (PHY_QueryBBReg(dm_odm->Adapter, rOFDM0_XBTxIQImbalance, bMaskDWord) >> 22) & 0x3FF;
 
 		X = result[final_candidate][4];
 		if ((X & 0x00000200) != 0)
 			X = X | 0xFFFFFC00;
 		TX1_A = (X * Oldval_1) >> 8;
 
-		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, 0x3FF, TX1_A);
+		PHY_SetBBReg(dm_odm->Adapter, rOFDM0_XBTxIQImbalance, 0x3FF, TX1_A);
 
-		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT(27), ((X*Oldval_1>>7) & 0x1));
+		PHY_SetBBReg(dm_odm->Adapter, rOFDM0_ECCAThreshold, BIT(27), ((X*Oldval_1>>7) & 0x1));
 
 		Y = result[final_candidate][5];
 		if ((Y & 0x00000200) != 0)
@@ -1041,41 +1041,41 @@ static void _PHY_PathBFillIQKMatrix8723B(
 		TX1_C = (Y * Oldval_1) >> 8;
 
 		/* 2 Tx IQC */
-		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, 0xF0000000, ((TX1_C&0x3C0)>>6));
-/* 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][KEY] = rOFDM0_XDTxAFE; */
-/* 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord); */
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][KEY] = rOFDM0_XCTxAFE;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord);
-
-		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, 0x003F0000, (TX1_C&0x3F));
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][KEY] = rOFDM0_XATxIQImbalance;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, bMaskDWord);
-
-		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT(25), ((Y*Oldval_1>>7) & 0x1));
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][KEY] = rOFDM0_ECCAThreshold;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, bMaskDWord);
-
-		if (bTxOnly) {
-			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
-/* 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
-			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = 0x40000100;
-			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
-			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = 0x0fffffff & PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
+		PHY_SetBBReg(dm_odm->Adapter, rOFDM0_XDTxAFE, 0xF0000000, ((TX1_C&0x3C0)>>6));
+/* 		rf_calibrate_info->TxIQC_8723B[PATH_S0][IDX_0xC9C][KEY] = rOFDM0_XDTxAFE; */
+/* 		rf_calibrate_info->TxIQC_8723B[PATH_S0][IDX_0xC9C][VAL] = PHY_QueryBBReg(dm_odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord); */
+		rf_calibrate_info->TxIQC_8723B[PATH_S0][IDX_0xC94][KEY] = rOFDM0_XCTxAFE;
+		rf_calibrate_info->TxIQC_8723B[PATH_S0][IDX_0xC94][VAL] = PHY_QueryBBReg(dm_odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord);
+
+		PHY_SetBBReg(dm_odm->Adapter, rOFDM0_XBTxIQImbalance, 0x003F0000, (TX1_C&0x3F));
+		rf_calibrate_info->TxIQC_8723B[PATH_S0][IDX_0xC80][KEY] = rOFDM0_XATxIQImbalance;
+		rf_calibrate_info->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL] = PHY_QueryBBReg(dm_odm->Adapter, rOFDM0_XBTxIQImbalance, bMaskDWord);
+
+		PHY_SetBBReg(dm_odm->Adapter, rOFDM0_ECCAThreshold, BIT(25), ((Y*Oldval_1>>7) & 0x1));
+		rf_calibrate_info->TxIQC_8723B[PATH_S0][IDX_0xC4C][KEY] = rOFDM0_ECCAThreshold;
+		rf_calibrate_info->TxIQC_8723B[PATH_S0][IDX_0xC4C][VAL] = PHY_QueryBBReg(dm_odm->Adapter, rOFDM0_ECCAThreshold, bMaskDWord);
+
+		if (tx_only) {
+			rf_calibrate_info->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
+/* 			rf_calibrate_info->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = PHY_QueryBBReg(dm_odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
+			rf_calibrate_info->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = 0x40000100;
+			rf_calibrate_info->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
+			rf_calibrate_info->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = 0x0fffffff & PHY_QueryBBReg(dm_odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
 			return;
 		}
 
 		/* 2 Rx IQC */
 		reg = result[final_candidate][6];
-		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBRxIQImbalance, 0x3FF, reg);
+		PHY_SetBBReg(dm_odm->Adapter, rOFDM0_XBRxIQImbalance, 0x3FF, reg);
 		reg = result[final_candidate][7] & 0x3F;
-		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBRxIQImbalance, 0xFC00, reg);
-		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
-		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBRxIQImbalance, bMaskDWord);
+		PHY_SetBBReg(dm_odm->Adapter, rOFDM0_XBRxIQImbalance, 0xFC00, reg);
+		rf_calibrate_info->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
+		rf_calibrate_info->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = PHY_QueryBBReg(dm_odm->Adapter, rOFDM0_XBRxIQImbalance, bMaskDWord);
 
 		reg = (result[final_candidate][7] >> 6) & 0xF;
-/* 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_AGCRSSITable, 0x0000F000, reg); */
-		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
-		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = (reg << 28)|(PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord)&0x0fffffff);
+/* 		PHY_SetBBReg(dm_odm->Adapter, rOFDM0_AGCRSSITable, 0x0000F000, reg); */
+		rf_calibrate_info->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
+		rf_calibrate_info->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = (reg << 28)|(PHY_QueryBBReg(dm_odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord)&0x0fffffff);
 	}
 }
 
@@ -1084,33 +1084,33 @@ static void _PHY_PathBFillIQKMatrix8723B(
 /*  */
 /*  MP Already declare in odm.c */
 
-void ODM_SetIQCbyRFpath(struct dm_odm_t *pDM_Odm, u32 RFpath)
+void ODM_SetIQCbyRFpath(struct dm_odm_t *dm_odm, u32 RFpath)
 {
 
-	struct odm_rf_cal_t *pRFCalibrateInfo = &pDM_Odm->RFCalibrateInfo;
+	struct odm_rf_cal_t *rf_calibrate_info = &dm_odm->RFCalibrateInfo;
 
 	if (
-		(pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL] != 0x0) &&
-		(pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] != 0x0) &&
-		(pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL] != 0x0) &&
-		(pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] != 0x0)
+		(rf_calibrate_info->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL] != 0x0) &&
+		(rf_calibrate_info->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] != 0x0) &&
+		(rf_calibrate_info->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL] != 0x0) &&
+		(rf_calibrate_info->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] != 0x0)
 	) {
 		if (RFpath) { /* S1: RFpath = 0, S0:RFpath = 1 */
 			/* S0 TX IQC */
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][VAL]);
+			PHY_SetBBReg(dm_odm->Adapter, rf_calibrate_info->TxIQC_8723B[PATH_S0][IDX_0xC94][KEY], bMaskDWord, rf_calibrate_info->TxIQC_8723B[PATH_S0][IDX_0xC94][VAL]);
+			PHY_SetBBReg(dm_odm->Adapter, rf_calibrate_info->TxIQC_8723B[PATH_S0][IDX_0xC80][KEY], bMaskDWord, rf_calibrate_info->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL]);
+			PHY_SetBBReg(dm_odm->Adapter, rf_calibrate_info->TxIQC_8723B[PATH_S0][IDX_0xC4C][KEY], bMaskDWord, rf_calibrate_info->TxIQC_8723B[PATH_S0][IDX_0xC4C][VAL]);
 			/* S0 RX IQC */
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL]);
+			PHY_SetBBReg(dm_odm->Adapter, rf_calibrate_info->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY], bMaskDWord, rf_calibrate_info->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL]);
+			PHY_SetBBReg(dm_odm->Adapter, rf_calibrate_info->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY], bMaskDWord, rf_calibrate_info->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL]);
 		} else {
 			/* S1 TX IQC */
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][VAL]);
+			PHY_SetBBReg(dm_odm->Adapter, rf_calibrate_info->TxIQC_8723B[PATH_S1][IDX_0xC94][KEY], bMaskDWord, rf_calibrate_info->TxIQC_8723B[PATH_S1][IDX_0xC94][VAL]);
+			PHY_SetBBReg(dm_odm->Adapter, rf_calibrate_info->TxIQC_8723B[PATH_S1][IDX_0xC80][KEY], bMaskDWord, rf_calibrate_info->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL]);
+			PHY_SetBBReg(dm_odm->Adapter, rf_calibrate_info->TxIQC_8723B[PATH_S1][IDX_0xC4C][KEY], bMaskDWord, rf_calibrate_info->TxIQC_8723B[PATH_S1][IDX_0xC4C][VAL]);
 			/* S1 RX IQC */
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL]);
+			PHY_SetBBReg(dm_odm->Adapter, rf_calibrate_info->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY], bMaskDWord, rf_calibrate_info->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL]);
+			PHY_SetBBReg(dm_odm->Adapter, rf_calibrate_info->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY], bMaskDWord, rf_calibrate_info->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL]);
 		}
 	}
 }
@@ -1121,114 +1121,114 @@ static bool ODM_CheckPowerStatus(struct adapter *Adapter)
 }
 
 static void _PHY_SaveADDARegisters8723B(
-	struct adapter *padapter,
+	struct adapter *adapter,
 	u32 *ADDAReg,
 	u32 *ADDABackup,
 	u32 RegisterNum
 )
 {
 	u32 i;
-	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
-	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
+	struct hal_com_data *hal_data = GET_HAL_DATA(adapter);
+	struct dm_odm_t *dm_odm = &hal_data->odmpriv;
 
-	if (!ODM_CheckPowerStatus(padapter))
+	if (!ODM_CheckPowerStatus(adapter))
 		return;
 
 	for (i = 0 ; i < RegisterNum ; i++) {
-		ADDABackup[i] = PHY_QueryBBReg(pDM_Odm->Adapter, ADDAReg[i], bMaskDWord);
+		ADDABackup[i] = PHY_QueryBBReg(dm_odm->Adapter, ADDAReg[i], bMaskDWord);
 	}
 }
 
 
 static void _PHY_SaveMACRegisters8723B(
-	struct adapter *padapter, u32 *MACReg, u32 *MACBackup
+	struct adapter *adapter, u32 *MACReg, u32 *MACBackup
 )
 {
 	u32 i;
-	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
-	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
+	struct hal_com_data	*hal_data = GET_HAL_DATA(adapter);
+	struct dm_odm_t *dm_odm = &hal_data->odmpriv;
 
 	for (i = 0 ; i < (IQK_MAC_REG_NUM - 1); i++) {
-		MACBackup[i] = rtw_read8(pDM_Odm->Adapter, MACReg[i]);
+		MACBackup[i] = rtw_read8(dm_odm->Adapter, MACReg[i]);
 	}
-	MACBackup[i] = rtw_read32(pDM_Odm->Adapter, MACReg[i]);
+	MACBackup[i] = rtw_read32(dm_odm->Adapter, MACReg[i]);
 
 }
 
 
 static void _PHY_ReloadADDARegisters8723B(
-	struct adapter *padapter,
+	struct adapter *adapter,
 	u32 *ADDAReg,
 	u32 *ADDABackup,
 	u32 RegiesterNum
 )
 {
 	u32 i;
-	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
-	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
+	struct hal_com_data	*hal_data = GET_HAL_DATA(adapter);
+	struct dm_odm_t *dm_odm = &hal_data->odmpriv;
 
 	for (i = 0 ; i < RegiesterNum; i++) {
-		PHY_SetBBReg(pDM_Odm->Adapter, ADDAReg[i], bMaskDWord, ADDABackup[i]);
+		PHY_SetBBReg(dm_odm->Adapter, ADDAReg[i], bMaskDWord, ADDABackup[i]);
 	}
 }
 
 static void _PHY_ReloadMACRegisters8723B(
-	struct adapter *padapter, u32 *MACReg, u32 *MACBackup
+	struct adapter *adapter, u32 *MACReg, u32 *MACBackup
 )
 {
 	u32 i;
 
 	for (i = 0 ; i < (IQK_MAC_REG_NUM - 1); i++) {
-		rtw_write8(padapter, MACReg[i], (u8)MACBackup[i]);
+		rtw_write8(adapter, MACReg[i], (u8)MACBackup[i]);
 	}
-	rtw_write32(padapter, MACReg[i], MACBackup[i]);
+	rtw_write32(adapter, MACReg[i], MACBackup[i]);
 }
 
 
 static void _PHY_PathADDAOn8723B(
-	struct adapter *padapter,
+	struct adapter *adapter,
 	u32 *ADDAReg,
 	bool is2T
 )
 {
 	u32 pathOn;
 	u32 i;
-	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
-	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
+	struct hal_com_data *hal_data = GET_HAL_DATA(adapter);
+	struct dm_odm_t *dm_odm = &hal_data->odmpriv;
 
 	pathOn = 0x01c00014;
 	if (!is2T) {
 		pathOn = 0x01c00014;
-		PHY_SetBBReg(pDM_Odm->Adapter, ADDAReg[0], bMaskDWord, 0x01c00014);
+		PHY_SetBBReg(dm_odm->Adapter, ADDAReg[0], bMaskDWord, 0x01c00014);
 	} else {
-		PHY_SetBBReg(pDM_Odm->Adapter, ADDAReg[0], bMaskDWord, pathOn);
+		PHY_SetBBReg(dm_odm->Adapter, ADDAReg[0], bMaskDWord, pathOn);
 	}
 
 	for (i = 1 ; i < IQK_ADDA_REG_NUM ; i++) {
-		PHY_SetBBReg(pDM_Odm->Adapter, ADDAReg[i], bMaskDWord, pathOn);
+		PHY_SetBBReg(dm_odm->Adapter, ADDAReg[i], bMaskDWord, pathOn);
 	}
 
 }
 
 static void _PHY_MACSettingCalibration8723B(
-	struct adapter *padapter, u32 *MACReg, u32 *MACBackup
+	struct adapter *adapter, u32 *MACReg, u32 *MACBackup
 )
 {
 	u32 i = 0;
-	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
-	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
+	struct hal_com_data	*hal_data = GET_HAL_DATA(adapter);
+	struct dm_odm_t *dm_odm = &hal_data->odmpriv;
 
-	rtw_write8(pDM_Odm->Adapter, MACReg[i], 0x3F);
+	rtw_write8(dm_odm->Adapter, MACReg[i], 0x3F);
 
 	for (i = 1 ; i < (IQK_MAC_REG_NUM - 1); i++) {
-		rtw_write8(pDM_Odm->Adapter, MACReg[i], (u8)(MACBackup[i]&(~BIT3)));
+		rtw_write8(dm_odm->Adapter, MACReg[i], (u8)(MACBackup[i]&(~BIT3)));
 	}
-	rtw_write8(pDM_Odm->Adapter, MACReg[i], (u8)(MACBackup[i]&(~BIT5)));
+	rtw_write8(dm_odm->Adapter, MACReg[i], (u8)(MACBackup[i]&(~BIT5)));
 
 }
 
 static bool phy_SimularityCompare_8723B(
-	struct adapter *padapter,
+	struct adapter *adapter,
 	s32 result[][8],
 	u8  c1,
 	u8  c2
@@ -1311,20 +1311,20 @@ static bool phy_SimularityCompare_8723B(
 
 
 static void phy_IQCalibrate_8723B(
-	struct adapter *padapter,
+	struct adapter *adapter,
 	s32 result[][8],
 	u8 t,
 	bool is2T,
 	u8 RF_Path
 )
 {
-	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
-	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
+	struct hal_com_data	*hal_data = GET_HAL_DATA(adapter);
+	struct dm_odm_t *dm_odm = &hal_data->odmpriv;
 
 	u32 i;
 	u8 PathAOK, PathBOK;
-	u8 tmp0xc50 = (u8)PHY_QueryBBReg(pDM_Odm->Adapter, 0xC50, bMaskByte0);
-	u8 tmp0xc58 = (u8)PHY_QueryBBReg(pDM_Odm->Adapter, 0xC58, bMaskByte0);
+	u8 tmp0xc50 = (u8)PHY_QueryBBReg(dm_odm->Adapter, 0xC50, bMaskByte0);
+	u8 tmp0xc58 = (u8)PHY_QueryBBReg(dm_odm->Adapter, 0xC58, bMaskByte0);
 	u32 ADDA_REG[IQK_ADDA_REG_NUM] = {
 		rFPGA0_XCD_SwitchControl,
 		rBlue_Tooth,
@@ -1372,69 +1372,69 @@ static void phy_IQCalibrate_8723B(
 	if (t == 0) {
 
 		/*  Save ADDA parameters, turn Path A ADDA on */
-		_PHY_SaveADDARegisters8723B(padapter, ADDA_REG, pDM_Odm->RFCalibrateInfo.ADDA_backup, IQK_ADDA_REG_NUM);
-		_PHY_SaveMACRegisters8723B(padapter, IQK_MAC_REG, pDM_Odm->RFCalibrateInfo.IQK_MAC_backup);
-		_PHY_SaveADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup, IQK_BB_REG_NUM);
+		_PHY_SaveADDARegisters8723B(adapter, ADDA_REG, dm_odm->RFCalibrateInfo.ADDA_backup, IQK_ADDA_REG_NUM);
+		_PHY_SaveMACRegisters8723B(adapter, IQK_MAC_REG, dm_odm->RFCalibrateInfo.IQK_MAC_backup);
+		_PHY_SaveADDARegisters8723B(adapter, IQK_BB_REG_92C, dm_odm->RFCalibrateInfo.IQK_BB_backup, IQK_BB_REG_NUM);
 	}
 
-	_PHY_PathADDAOn8723B(padapter, ADDA_REG, is2T);
+	_PHY_PathADDAOn8723B(adapter, ADDA_REG, is2T);
 
 /* no serial mode */
 
 	/* save RF path for 8723B */
-/* 	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord); */
-/* 	Path_SEL_RF = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff); */
+/* 	Path_SEL_BB = PHY_QueryBBReg(dm_odm->Adapter, 0x948, bMaskDWord); */
+/* 	Path_SEL_RF = PHY_QueryRFReg(dm_odm->Adapter, RF_PATH_A, 0xb0, 0xfffff); */
 
 	/* MAC settings */
-	_PHY_MACSettingCalibration8723B(padapter, IQK_MAC_REG, pDM_Odm->RFCalibrateInfo.IQK_MAC_backup);
+	_PHY_MACSettingCalibration8723B(adapter, IQK_MAC_REG, dm_odm->RFCalibrateInfo.IQK_MAC_backup);
 
 	/* BB setting */
-	/* PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_RFMOD, BIT24, 0x00); */
-	PHY_SetBBReg(pDM_Odm->Adapter, rCCK0_AFESetting, 0x0f000000, 0xf);
-	PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_TRxPathEnable, bMaskDWord, 0x03a05600);
-	PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_TRMuxPar, bMaskDWord, 0x000800e4);
-	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XCD_RFInterfaceSW, bMaskDWord, 0x22204000);
+	/* PHY_SetBBReg(dm_odm->Adapter, rFPGA0_RFMOD, BIT24, 0x00); */
+	PHY_SetBBReg(dm_odm->Adapter, rCCK0_AFESetting, 0x0f000000, 0xf);
+	PHY_SetBBReg(dm_odm->Adapter, rOFDM0_TRxPathEnable, bMaskDWord, 0x03a05600);
+	PHY_SetBBReg(dm_odm->Adapter, rOFDM0_TRMuxPar, bMaskDWord, 0x000800e4);
+	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_XCD_RFInterfaceSW, bMaskDWord, 0x22204000);
 
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT10, 0x01); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT26, 0x01); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XA_RFInterfaceOE, BIT10, 0x00); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XB_RFInterfaceOE, BIT10, 0x00); */
+/* 	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT10, 0x01); */
+/* 	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT26, 0x01); */
+/* 	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_XA_RFInterfaceOE, BIT10, 0x00); */
+/* 	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_XB_RFInterfaceOE, BIT10, 0x00); */
 
 
 /* RX IQ calibration setting for 8723B D cut large current issue when leaving IPS */
 
-	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x30000);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7fb7);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x60fbd);
+	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x30000);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7fb7);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x60fbd);
 
 /* path A TX IQK */
 	for (i = 0 ; i < retryCount ; i++) {
-		PathAOK = phy_PathA_IQK_8723B(padapter, is2T, RF_Path);
+		PathAOK = phy_PathA_IQK_8723B(adapter, is2T, RF_Path);
 /* 		if (PathAOK == 0x03) { */
 		if (PathAOK == 0x01) {
 			/*  Path A Tx IQK Success */
-			PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
-			pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_A] = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x8, bRFRegOffsetMask);
+			PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
+			dm_odm->RFCalibrateInfo.TxLOK[RF_PATH_A] = PHY_QueryRFReg(dm_odm->Adapter, RF_PATH_A, 0x8, bRFRegOffsetMask);
 
-				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16;
-				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16;
+				result[t][0] = (PHY_QueryBBReg(dm_odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16;
+				result[t][1] = (PHY_QueryBBReg(dm_odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16;
 			break;
 		}
 	}
 
 /* path A RXIQK */
 	for (i = 0 ; i < retryCount ; i++) {
-		PathAOK = phy_PathA_RxIQK8723B(padapter, is2T, RF_Path);
+		PathAOK = phy_PathA_RxIQK8723B(adapter, is2T, RF_Path);
 		if (PathAOK == 0x03) {
-/* 				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-/* 				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-				result[t][2] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
-				result[t][3] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
+/* 				result[t][0] = (PHY_QueryBBReg(dm_odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
+/* 				result[t][1] = (PHY_QueryBBReg(dm_odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
+				result[t][2] = (PHY_QueryBBReg(dm_odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
+				result[t][3] = (PHY_QueryBBReg(dm_odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 			break;
 		}
 	}
@@ -1447,26 +1447,26 @@ static void phy_IQCalibrate_8723B(
 
 		/* path B TX IQK */
 		for (i = 0 ; i < retryCount ; i++) {
-			PathBOK = phy_PathB_IQK_8723B(padapter);
+			PathBOK = phy_PathB_IQK_8723B(adapter);
 			if (PathBOK == 0x01) {
 				/*  Path B Tx IQK Success */
-				PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
-				pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_B] = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_B, 0x8, bRFRegOffsetMask);
+				PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
+				dm_odm->RFCalibrateInfo.TxLOK[RF_PATH_B] = PHY_QueryRFReg(dm_odm->Adapter, RF_PATH_B, 0x8, bRFRegOffsetMask);
 
-				result[t][4] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16;
-				result[t][5] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16;
+				result[t][4] = (PHY_QueryBBReg(dm_odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16;
+				result[t][5] = (PHY_QueryBBReg(dm_odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16;
 				break;
 			}
 		}
 
 /* path B RX IQK */
 		for (i = 0 ; i < retryCount ; i++) {
-			PathBOK = phy_PathB_RxIQK8723B(padapter, is2T);
+			PathBOK = phy_PathB_RxIQK8723B(adapter, is2T);
 			if (PathBOK == 0x03) {
-/* 				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-/* 				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-				result[t][6] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
-				result[t][7] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
+/* 				result[t][0] = (PHY_QueryBBReg(dm_odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
+/* 				result[t][1] = (PHY_QueryBBReg(dm_odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
+				result[t][6] = (PHY_QueryBBReg(dm_odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
+				result[t][7] = (PHY_QueryBBReg(dm_odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 				break;
 			}
 		}
@@ -1475,120 +1475,120 @@ static void phy_IQCalibrate_8723B(
 	}
 
 	/* Back to BB mode, load original value */
-	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0);
+	PHY_SetBBReg(dm_odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0);
 
 	if (t != 0) {
 		/*  Reload ADDA power saving parameters */
-		_PHY_ReloadADDARegisters8723B(padapter, ADDA_REG, pDM_Odm->RFCalibrateInfo.ADDA_backup, IQK_ADDA_REG_NUM);
+		_PHY_ReloadADDARegisters8723B(adapter, ADDA_REG, dm_odm->RFCalibrateInfo.ADDA_backup, IQK_ADDA_REG_NUM);
 
 		/*  Reload MAC parameters */
-		_PHY_ReloadMACRegisters8723B(padapter, IQK_MAC_REG, pDM_Odm->RFCalibrateInfo.IQK_MAC_backup);
+		_PHY_ReloadMACRegisters8723B(adapter, IQK_MAC_REG, dm_odm->RFCalibrateInfo.IQK_MAC_backup);
 
-		_PHY_ReloadADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup, IQK_BB_REG_NUM);
+		_PHY_ReloadADDARegisters8723B(adapter, IQK_BB_REG_92C, dm_odm->RFCalibrateInfo.IQK_BB_backup, IQK_BB_REG_NUM);
 
 		/* Reload RF path */
-/* 		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
-/* 		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff, Path_SEL_RF); */
+/* 		PHY_SetBBReg(dm_odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
+/* 		PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0xb0, 0xfffff, Path_SEL_RF); */
 
 		/* Allen initial gain 0xc50 */
 		/*  Restore RX initial gain */
-		PHY_SetBBReg(pDM_Odm->Adapter, 0xc50, bMaskByte0, 0x50);
-		PHY_SetBBReg(pDM_Odm->Adapter, 0xc50, bMaskByte0, tmp0xc50);
+		PHY_SetBBReg(dm_odm->Adapter, 0xc50, bMaskByte0, 0x50);
+		PHY_SetBBReg(dm_odm->Adapter, 0xc50, bMaskByte0, tmp0xc50);
 		if (is2T) {
-			PHY_SetBBReg(pDM_Odm->Adapter, 0xc58, bMaskByte0, 0x50);
-			PHY_SetBBReg(pDM_Odm->Adapter, 0xc58, bMaskByte0, tmp0xc58);
+			PHY_SetBBReg(dm_odm->Adapter, 0xc58, bMaskByte0, 0x50);
+			PHY_SetBBReg(dm_odm->Adapter, 0xc58, bMaskByte0, tmp0xc58);
 		}
 
 		/* load 0xe30 IQC default value */
-		PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_A, bMaskDWord, 0x01008c00);
-		PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_A, bMaskDWord, 0x01008c00);
+		PHY_SetBBReg(dm_odm->Adapter, rTx_IQK_Tone_A, bMaskDWord, 0x01008c00);
+		PHY_SetBBReg(dm_odm->Adapter, rRx_IQK_Tone_A, bMaskDWord, 0x01008c00);
 
 	}
 
 }
 
 
-static void phy_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm, bool is2T)
+static void phy_LCCalibrate_8723B(struct dm_odm_t *dm_odm, bool is2T)
 {
 	u8 tmpReg;
 	u32 RF_Amode = 0, RF_Bmode = 0, LC_Cal;
-	struct adapter *padapter = pDM_Odm->Adapter;
+	struct adapter *adapter = dm_odm->Adapter;
 
 	/* Check continuous TX and Packet TX */
-	tmpReg = rtw_read8(pDM_Odm->Adapter, 0xd03);
+	tmpReg = rtw_read8(dm_odm->Adapter, 0xd03);
 
 	if ((tmpReg&0x70) != 0)			/* Deal with contisuous TX case */
-		rtw_write8(pDM_Odm->Adapter, 0xd03, tmpReg&0x8F);	/* disable all continuous TX */
+		rtw_write8(dm_odm->Adapter, 0xd03, tmpReg&0x8F);	/* disable all continuous TX */
 	else							/*  Deal with Packet TX case */
-		rtw_write8(pDM_Odm->Adapter, REG_TXPAUSE, 0xFF);		/*  block all queues */
+		rtw_write8(dm_odm->Adapter, REG_TXPAUSE, 0xFF);		/*  block all queues */
 
 	if ((tmpReg&0x70) != 0) {
 		/* 1. Read original RF mode */
 		/* Path-A */
-		RF_Amode = PHY_QueryRFReg(padapter, RF_PATH_A, RF_AC, bMask12Bits);
+		RF_Amode = PHY_QueryRFReg(adapter, RF_PATH_A, RF_AC, bMask12Bits);
 
 		/* Path-B */
 		if (is2T)
-			RF_Bmode = PHY_QueryRFReg(padapter, RF_PATH_B, RF_AC, bMask12Bits);
+			RF_Bmode = PHY_QueryRFReg(adapter, RF_PATH_B, RF_AC, bMask12Bits);
 
 		/* 2. Set RF mode = standby mode */
 		/* Path-A */
-		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_AC, bMask12Bits, (RF_Amode&0x8FFFF)|0x10000);
+		PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_AC, bMask12Bits, (RF_Amode&0x8FFFF)|0x10000);
 
 		/* Path-B */
 		if (is2T)
-			PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_B, RF_AC, bMask12Bits, (RF_Bmode&0x8FFFF)|0x10000);
+			PHY_SetRFReg(dm_odm->Adapter, RF_PATH_B, RF_AC, bMask12Bits, (RF_Bmode&0x8FFFF)|0x10000);
 	}
 
 	/* 3. Read RF reg18 */
-	LC_Cal = PHY_QueryRFReg(padapter, RF_PATH_A, RF_CHNLBW, bMask12Bits);
+	LC_Cal = PHY_QueryRFReg(adapter, RF_PATH_A, RF_CHNLBW, bMask12Bits);
 
 	/* 4. Set LC calibration begin	bit15 */
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xB0, bRFRegOffsetMask, 0xDFBE0); /*  LDO ON */
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_CHNLBW, bMask12Bits, LC_Cal|0x08000);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0xB0, bRFRegOffsetMask, 0xDFBE0); /*  LDO ON */
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_CHNLBW, bMask12Bits, LC_Cal|0x08000);
 
 	mdelay(100);
 
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xB0, bRFRegOffsetMask, 0xDFFE0); /*  LDO OFF */
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0xB0, bRFRegOffsetMask, 0xDFFE0); /*  LDO OFF */
 
 	/*  Channel 10 LC calibration issue for 8723bs with 26M xtal */
-	if (pDM_Odm->SupportInterface == ODM_ITRF_SDIO && pDM_Odm->PackageType >= 0x2) {
-		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_CHNLBW, bMask12Bits, LC_Cal);
+	if (dm_odm->SupportInterface == ODM_ITRF_SDIO && dm_odm->PackageType >= 0x2) {
+		PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_CHNLBW, bMask12Bits, LC_Cal);
 	}
 
 	/* Restore original situation */
 	if ((tmpReg&0x70) != 0) { /* Deal with contisuous TX case */
 		/* Path-A */
-		rtw_write8(pDM_Odm->Adapter, 0xd03, tmpReg);
-		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_AC, bMask12Bits, RF_Amode);
+		rtw_write8(dm_odm->Adapter, 0xd03, tmpReg);
+		PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_AC, bMask12Bits, RF_Amode);
 
 		/* Path-B */
 		if (is2T)
-			PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_B, RF_AC, bMask12Bits, RF_Bmode);
+			PHY_SetRFReg(dm_odm->Adapter, RF_PATH_B, RF_AC, bMask12Bits, RF_Bmode);
 	} else /*  Deal with Packet TX case */
-		rtw_write8(pDM_Odm->Adapter, REG_TXPAUSE, 0x00);
+		rtw_write8(dm_odm->Adapter, REG_TXPAUSE, 0x00);
 }
 
 /* IQK version:V2.5    20140123 */
 /* IQK is controlled by Is2ant, RF path */
 void PHY_IQCalibrate_8723B(
-	struct adapter *padapter,
-	bool bReCovery,
-	bool bRestore,
+	struct adapter *adapter,
+	bool recovery,
+	bool restore,
 	bool Is2ant,	/* false:1ant, true:2-ant */
 	u8 RF_Path	/* 0:S1, 1:S0 */
 )
 {
-	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
+	struct hal_com_data	*hal_data = GET_HAL_DATA(adapter);
 
-	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
+	struct dm_odm_t *dm_odm = &hal_data->odmpriv;
 
 	s32 result[4][8];	/* last is final result */
 	u8 i, final_candidate;
-	bool bPathAOK, bPathBOK;
+	bool path_a_ok, path_b_ok;
 	s32 RegE94, RegE9C, RegEA4, RegEB4, RegEBC, RegEC4, RegTmp = 0;
 	bool is12simular, is13simular, is23simular;
-	bool bSingleTone = false, bCarrierSuppression = false;
+	bool single_tone = false, carrier_suppression = false;
 	u32 IQK_BB_REG_92C[IQK_BB_REG_NUM] = {
 		rOFDM0_XARxIQImbalance,
 		rOFDM0_XBRxIQImbalance,
@@ -1603,76 +1603,76 @@ void PHY_IQCalibrate_8723B(
 /* 	u32 		Path_SEL_BB = 0; */
 	u32 		GNT_BT_default;
 
-	if (!ODM_CheckPowerStatus(padapter))
+	if (!ODM_CheckPowerStatus(adapter))
 		return;
 
-	if (!(pDM_Odm->SupportAbility & ODM_RF_CALIBRATION))
+	if (!(dm_odm->SupportAbility & ODM_RF_CALIBRATION))
 		return;
 
 	/*  20120213<Kordan> Turn on when continuous Tx to pass lab testing. (required by Edlu) */
-	if (bSingleTone || bCarrierSuppression)
+	if (single_tone || carrier_suppression)
 		return;
 
-	if (pDM_Odm->RFCalibrateInfo.bIQKInProgress)
+	if (dm_odm->RFCalibrateInfo.bIQKInProgress)
 		return;
 
 
-	pDM_Odm->RFCalibrateInfo.bIQKInProgress = true;
+	dm_odm->RFCalibrateInfo.bIQKInProgress = true;
 
-	if (bRestore) {
+	if (restore) {
 		u32 offset, data;
 		u8 path, bResult = SUCCESS;
-		struct odm_rf_cal_t *pRFCalibrateInfo = &pDM_Odm->RFCalibrateInfo;
+		struct odm_rf_cal_t *rf_calibrate_info = &dm_odm->RFCalibrateInfo;
 
-		path = (PHY_QueryBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskByte0) == 0x00) ? RF_PATH_A : RF_PATH_B;
+		path = (PHY_QueryBBReg(dm_odm->Adapter, rS0S1_PathSwitch, bMaskByte0) == 0x00) ? RF_PATH_A : RF_PATH_B;
 
 		/*  Restore TX IQK */
 		for (i = 0; i < 3; ++i) {
-			offset = pRFCalibrateInfo->TxIQC_8723B[path][i][0];
-			data = pRFCalibrateInfo->TxIQC_8723B[path][i][1];
+			offset = rf_calibrate_info->TxIQC_8723B[path][i][0];
+			data = rf_calibrate_info->TxIQC_8723B[path][i][1];
 			if ((offset == 0) || (data == 0)) {
 				bResult = FAIL;
 				break;
 			}
-			PHY_SetBBReg(pDM_Odm->Adapter, offset, bMaskDWord, data);
+			PHY_SetBBReg(dm_odm->Adapter, offset, bMaskDWord, data);
 		}
 
 		/*  Restore RX IQK */
 		for (i = 0; i < 2; ++i) {
-			offset = pRFCalibrateInfo->RxIQC_8723B[path][i][0];
-			data = pRFCalibrateInfo->RxIQC_8723B[path][i][1];
+			offset = rf_calibrate_info->RxIQC_8723B[path][i][0];
+			data = rf_calibrate_info->RxIQC_8723B[path][i][1];
 			if ((offset == 0) || (data == 0)) {
 				bResult = FAIL;
 				break;
 			}
-			PHY_SetBBReg(pDM_Odm->Adapter, offset, bMaskDWord, data);
+			PHY_SetBBReg(dm_odm->Adapter, offset, bMaskDWord, data);
 		}
 
-		if (pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_A] == 0) {
+		if (dm_odm->RFCalibrateInfo.TxLOK[RF_PATH_A] == 0) {
 			bResult = FAIL;
 		} else {
-			PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXM_IDAC, bRFRegOffsetMask, pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_A]);
-			PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_B, RF_TXM_IDAC, bRFRegOffsetMask, pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_B]);
+			PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_TXM_IDAC, bRFRegOffsetMask, dm_odm->RFCalibrateInfo.TxLOK[RF_PATH_A]);
+			PHY_SetRFReg(dm_odm->Adapter, RF_PATH_B, RF_TXM_IDAC, bRFRegOffsetMask, dm_odm->RFCalibrateInfo.TxLOK[RF_PATH_B]);
 		}
 
 		if (bResult == SUCCESS)
 			return;
 	}
 
-	if (bReCovery) {
-		_PHY_ReloadADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup_recover, 9);
+	if (recovery) {
+		_PHY_ReloadADDARegisters8723B(adapter, IQK_BB_REG_92C, dm_odm->RFCalibrateInfo.IQK_BB_backup_recover, 9);
 		return;
 	}
 
 	/* save default GNT_BT */
-	GNT_BT_default = PHY_QueryBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord);
+	GNT_BT_default = PHY_QueryBBReg(dm_odm->Adapter, 0x764, bMaskDWord);
 	/*  Save RF Path */
-/* 	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord); */
-/* 	Path_SEL_RF = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff); */
+/* 	Path_SEL_BB = PHY_QueryBBReg(dm_odm->Adapter, 0x948, bMaskDWord); */
+/* 	Path_SEL_RF = PHY_QueryRFReg(dm_odm->Adapter, RF_PATH_A, 0xb0, 0xfffff); */
 
     /* set GNT_BT = 0, pause BT traffic */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT12, 0x0); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT11, 0x1); */
+/* 	PHY_SetBBReg(dm_odm->Adapter, 0x764, BIT12, 0x0); */
+/* 	PHY_SetBBReg(dm_odm->Adapter, 0x764, BIT11, 0x1); */
 
 
 	for (i = 0; i < 8; i++) {
@@ -1683,18 +1683,18 @@ void PHY_IQCalibrate_8723B(
 	}
 
 	final_candidate = 0xff;
-	bPathAOK = false;
-	bPathBOK = false;
+	path_a_ok = false;
+	path_b_ok = false;
 	is12simular = false;
 	is23simular = false;
 	is13simular = false;
 
 
 	for (i = 0; i < 3; i++) {
-		phy_IQCalibrate_8723B(padapter, result, i, Is2ant, RF_Path);
+		phy_IQCalibrate_8723B(adapter, result, i, Is2ant, RF_Path);
 
 		if (i == 1) {
-			is12simular = phy_SimularityCompare_8723B(padapter, result, 0, 1);
+			is12simular = phy_SimularityCompare_8723B(adapter, result, 0, 1);
 			if (is12simular) {
 				final_candidate = 0;
 				break;
@@ -1702,14 +1702,14 @@ void PHY_IQCalibrate_8723B(
 		}
 
 		if (i == 2) {
-			is13simular = phy_SimularityCompare_8723B(padapter, result, 0, 2);
+			is13simular = phy_SimularityCompare_8723B(adapter, result, 0, 2);
 			if (is13simular) {
 				final_candidate = 0;
 
 				break;
 			}
 
-			is23simular = phy_SimularityCompare_8723B(padapter, result, 1, 2);
+			is23simular = phy_SimularityCompare_8723B(adapter, result, 1, 2);
 			if (is23simular) {
 				final_candidate = 1;
 			} else {
@@ -1734,87 +1734,87 @@ void PHY_IQCalibrate_8723B(
 	}
 
 	if (final_candidate != 0xff) {
-		pDM_Odm->RFCalibrateInfo.RegE94 = RegE94 = result[final_candidate][0];
-		pDM_Odm->RFCalibrateInfo.RegE9C = RegE9C = result[final_candidate][1];
+		dm_odm->RFCalibrateInfo.RegE94 = RegE94 = result[final_candidate][0];
+		dm_odm->RFCalibrateInfo.RegE9C = RegE9C = result[final_candidate][1];
 		RegEA4 = result[final_candidate][2];
-		pDM_Odm->RFCalibrateInfo.RegEB4 = RegEB4 = result[final_candidate][4];
-		pDM_Odm->RFCalibrateInfo.RegEBC = RegEBC = result[final_candidate][5];
+		dm_odm->RFCalibrateInfo.RegEB4 = RegEB4 = result[final_candidate][4];
+		dm_odm->RFCalibrateInfo.RegEBC = RegEBC = result[final_candidate][5];
 		RegEC4 = result[final_candidate][6];
-		bPathAOK = bPathBOK = true;
+		path_a_ok = path_b_ok = true;
 	} else {
-		pDM_Odm->RFCalibrateInfo.RegE94 = pDM_Odm->RFCalibrateInfo.RegEB4 = 0x100;	/* X default value */
-		pDM_Odm->RFCalibrateInfo.RegE9C = pDM_Odm->RFCalibrateInfo.RegEBC = 0x0;		/* Y default value */
+		dm_odm->RFCalibrateInfo.RegE94 = dm_odm->RFCalibrateInfo.RegEB4 = 0x100;	/* X default value */
+		dm_odm->RFCalibrateInfo.RegE9C = dm_odm->RFCalibrateInfo.RegEBC = 0x0;		/* Y default value */
 	}
 
 	{
 		if (RegE94 != 0)
-			_PHY_PathAFillIQKMatrix8723B(padapter, bPathAOK, result, final_candidate, (RegEA4 == 0));
+			_PHY_PathAFillIQKMatrix8723B(adapter, path_a_ok, result, final_candidate, (RegEA4 == 0));
 	}
 	{
 		if (RegEB4 != 0)
-			_PHY_PathBFillIQKMatrix8723B(padapter, bPathBOK, result, final_candidate, (RegEC4 == 0));
+			_PHY_PathBFillIQKMatrix8723B(adapter, path_b_ok, result, final_candidate, (RegEC4 == 0));
 	}
 
 /* To Fix BSOD when final_candidate is 0xff */
 /* by sherry 20120321 */
 	if (final_candidate < 4) {
 		for (i = 0; i < IQK_MATRIX_REG_NUM; i++)
-			pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[0][i] = result[final_candidate][i];
+			dm_odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[0][i] = result[final_candidate][i];
 	}
 
-	_PHY_SaveADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup_recover, 9);
+	_PHY_SaveADDARegisters8723B(adapter, IQK_BB_REG_92C, dm_odm->RFCalibrateInfo.IQK_BB_backup_recover, 9);
 
 	/* restore GNT_BT */
-	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, GNT_BT_default);
+	PHY_SetBBReg(dm_odm->Adapter, 0x764, bMaskDWord, GNT_BT_default);
 	/*  Restore RF Path */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff, Path_SEL_RF); */
+/* 	PHY_SetBBReg(dm_odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
+/* 	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0xb0, 0xfffff, Path_SEL_RF); */
 
 	/* Resotr RX mode table parameter */
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xe6177);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
-	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x300bd);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xe6177);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
+	PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x300bd);
 
 	/* set GNT_BT = HW control */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT12, 0x0); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT11, 0x0); */
+/* 	PHY_SetBBReg(dm_odm->Adapter, 0x764, BIT12, 0x0); */
+/* 	PHY_SetBBReg(dm_odm->Adapter, 0x764, BIT11, 0x0); */
 
 	if (Is2ant) {
 		if (RF_Path == 0x0)	/* S1 */
-			ODM_SetIQCbyRFpath(pDM_Odm, 0);
+			ODM_SetIQCbyRFpath(dm_odm, 0);
 		else	/* S0 */
-			ODM_SetIQCbyRFpath(pDM_Odm, 1);
+			ODM_SetIQCbyRFpath(dm_odm, 1);
 	}
 
-	pDM_Odm->RFCalibrateInfo.bIQKInProgress = false;
+	dm_odm->RFCalibrateInfo.bIQKInProgress = false;
 }
 
 
-void PHY_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm)
+void PHY_LCCalibrate_8723B(struct dm_odm_t *dm_odm)
 {
-	bool		bSingleTone = false, bCarrierSuppression = false;
+	bool		single_tone = false, carrier_suppression = false;
 	u32 		timeout = 2000, timecount = 0;
 
-	if (!(pDM_Odm->SupportAbility & ODM_RF_CALIBRATION))
+	if (!(dm_odm->SupportAbility & ODM_RF_CALIBRATION))
 		return;
 
 	/*  20120213<Kordan> Turn on when continuous Tx to pass lab testing. (required by Edlu) */
-	if (bSingleTone || bCarrierSuppression)
+	if (single_tone || carrier_suppression)
 		return;
 
-	while (*(pDM_Odm->pbScanInProcess) && timecount < timeout) {
+	while (*(dm_odm->pbScanInProcess) && timecount < timeout) {
 		mdelay(50);
 		timecount += 50;
 	}
 
-	pDM_Odm->RFCalibrateInfo.bLCKInProgress = true;
+	dm_odm->RFCalibrateInfo.bLCKInProgress = true;
 
 
-	phy_LCCalibrate_8723B(pDM_Odm, false);
+	phy_LCCalibrate_8723B(dm_odm, false);
 
 
-	pDM_Odm->RFCalibrateInfo.bLCKInProgress = false;
+	dm_odm->RFCalibrateInfo.bLCKInProgress = false;
 }
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 8d6131f0ad47..91fed68bbb3c 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -281,45 +281,45 @@ u32 TxScalingTable_Jaguar[TXSCALE_TABLE_SIZE] = {
 
 /* Remove Edca by Yu Chen */
 
-static void odm_CommonInfoSelfInit(struct dm_odm_t *pDM_Odm)
+static void odm_CommonInfoSelfInit(struct dm_odm_t *dm_odm)
 {
-	pDM_Odm->bCckHighPower = (bool) PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG(CCK_RPT_FORMAT, pDM_Odm), ODM_BIT(CCK_RPT_FORMAT, pDM_Odm));
-	pDM_Odm->RFPathRxEnable = (u8) PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG(BB_RX_PATH, pDM_Odm), ODM_BIT(BB_RX_PATH, pDM_Odm));
+	dm_odm->bCckHighPower = (bool) PHY_QueryBBReg(dm_odm->Adapter, ODM_REG(CCK_RPT_FORMAT, dm_odm), ODM_BIT(CCK_RPT_FORMAT, dm_odm));
+	dm_odm->RFPathRxEnable = (u8) PHY_QueryBBReg(dm_odm->Adapter, ODM_REG(BB_RX_PATH, dm_odm), ODM_BIT(BB_RX_PATH, dm_odm));
 
-	pDM_Odm->TxRate = 0xFF;
+	dm_odm->TxRate = 0xFF;
 }
 
-static void odm_CommonInfoSelfUpdate(struct dm_odm_t *pDM_Odm)
+static void odm_CommonInfoSelfUpdate(struct dm_odm_t *dm_odm)
 {
 	u8 EntryCnt = 0;
 	u8 i;
-	PSTA_INFO_T	pEntry;
+	PSTA_INFO_T	entry;
 
-	if (*(pDM_Odm->pBandWidth) == ODM_BW40M) {
-		if (*(pDM_Odm->pSecChOffset) == 1)
-			pDM_Odm->ControlChannel = *(pDM_Odm->pChannel)-2;
-		else if (*(pDM_Odm->pSecChOffset) == 2)
-			pDM_Odm->ControlChannel = *(pDM_Odm->pChannel)+2;
+	if (*(dm_odm->pBandWidth) == ODM_BW40M) {
+		if (*(dm_odm->pSecChOffset) == 1)
+			dm_odm->ControlChannel = *(dm_odm->pChannel)-2;
+		else if (*(dm_odm->pSecChOffset) == 2)
+			dm_odm->ControlChannel = *(dm_odm->pChannel)+2;
 	} else
-		pDM_Odm->ControlChannel = *(pDM_Odm->pChannel);
+		dm_odm->ControlChannel = *(dm_odm->pChannel);
 
 	for (i = 0; i < ODM_ASSOCIATE_ENTRY_NUM; i++) {
-		pEntry = pDM_Odm->pODM_StaInfo[i];
-		if (IS_STA_VALID(pEntry))
+		entry = dm_odm->pODM_StaInfo[i];
+		if (IS_STA_VALID(entry))
 			EntryCnt++;
 	}
 
 	if (EntryCnt == 1)
-		pDM_Odm->bOneEntryOnly = true;
+		dm_odm->bOneEntryOnly = true;
 	else
-		pDM_Odm->bOneEntryOnly = false;
+		dm_odm->bOneEntryOnly = false;
 }
 
-static void odm_CmnInfoInit_Debug(struct dm_odm_t *pDM_Odm)
+static void odm_CmnInfoInit_Debug(struct dm_odm_t *dm_odm)
 {
 }
 
-static void odm_BasicDbgMessage(struct dm_odm_t *pDM_Odm)
+static void odm_BasicDbgMessage(struct dm_odm_t *dm_odm)
 {
 }
 
@@ -330,39 +330,39 @@ static void odm_BasicDbgMessage(struct dm_odm_t *pDM_Odm)
 /* 3 Rate Adaptive */
 /* 3 ============================================================ */
 
-static void odm_RateAdaptiveMaskInit(struct dm_odm_t *pDM_Odm)
+static void odm_RateAdaptiveMaskInit(struct dm_odm_t *dm_odm)
 {
-	struct odm_rate_adaptive *pOdmRA = &pDM_Odm->RateAdaptive;
+	struct odm_rate_adaptive *odm_ra = &dm_odm->RateAdaptive;
 
-	pOdmRA->Type = DM_Type_ByDriver;
-	if (pOdmRA->Type == DM_Type_ByDriver)
-		pDM_Odm->bUseRAMask = true;
+	odm_ra->Type = DM_Type_ByDriver;
+	if (odm_ra->Type == DM_Type_ByDriver)
+		dm_odm->bUseRAMask = true;
 	else
-		pDM_Odm->bUseRAMask = false;
+		dm_odm->bUseRAMask = false;
 
-	pOdmRA->RATRState = DM_RATR_STA_INIT;
-	pOdmRA->LdpcThres = 35;
-	pOdmRA->bUseLdpc = false;
-	pOdmRA->HighRSSIThresh = 50;
-	pOdmRA->LowRSSIThresh = 20;
+	odm_ra->RATRState = DM_RATR_STA_INIT;
+	odm_ra->LdpcThres = 35;
+	odm_ra->bUseLdpc = false;
+	odm_ra->HighRSSIThresh = 50;
+	odm_ra->LowRSSIThresh = 20;
 }
 
 u32 ODM_Get_Rate_Bitmap(
-	struct dm_odm_t *pDM_Odm,
+	struct dm_odm_t *dm_odm,
 	u32 macid,
 	u32 ra_mask,
 	u8 rssi_level
 )
 {
-	PSTA_INFO_T	pEntry;
+	PSTA_INFO_T	entry;
 	u32 rate_bitmap = 0;
 	u8 WirelessMode;
 
-	pEntry = pDM_Odm->pODM_StaInfo[macid];
-	if (!IS_STA_VALID(pEntry))
+	entry = dm_odm->pODM_StaInfo[macid];
+	if (!IS_STA_VALID(entry))
 		return ra_mask;
 
-	WirelessMode = pEntry->wireless_mode;
+	WirelessMode = entry->wireless_mode;
 
 	switch (WirelessMode) {
 	case ODM_WM_B:
@@ -396,7 +396,7 @@ u32 ODM_Get_Rate_Bitmap(
 		else if (rssi_level == DM_RATR_STA_MIDDLE)
 			rate_bitmap = 0x000ff000;
 		else {
-			if (*(pDM_Odm->pBandWidth) == ODM_BW40M)
+			if (*(dm_odm->pBandWidth) == ODM_BW40M)
 				rate_bitmap = 0x000ff015;
 			else
 				rate_bitmap = 0x000ff005;
@@ -412,25 +412,25 @@ u32 ODM_Get_Rate_Bitmap(
 
 }
 
-static void odm_RefreshRateAdaptiveMaskCE(struct dm_odm_t *pDM_Odm)
+static void odm_RefreshRateAdaptiveMaskCE(struct dm_odm_t *dm_odm)
 {
 	u8 i;
-	struct adapter *padapter =  pDM_Odm->Adapter;
+	struct adapter *padapter =  dm_odm->Adapter;
 
 	if (padapter->bDriverStopped)
 		return;
 
-	if (!pDM_Odm->bUseRAMask)
+	if (!dm_odm->bUseRAMask)
 		return;
 
 	for (i = 0; i < ODM_ASSOCIATE_ENTRY_NUM; i++) {
-		PSTA_INFO_T pstat = pDM_Odm->pODM_StaInfo[i];
+		PSTA_INFO_T pstat = dm_odm->pODM_StaInfo[i];
 
 		if (IS_STA_VALID(pstat)) {
 			if (is_multicast_ether_addr(pstat->hwaddr))  /* if (psta->mac_id == 1) */
 				continue;
 
-			if (true == ODM_RAStateCheck(pDM_Odm, pstat->rssi_stat.UndecoratedSmoothedPWDB, false, &pstat->rssi_level)) {
+			if (true == ODM_RAStateCheck(dm_odm, pstat->rssi_stat.UndecoratedSmoothedPWDB, false, &pstat->rssi_level)) {
 				rtw_hal_update_ra_mask(pstat, pstat->rssi_level);
 			}
 
@@ -455,34 +455,34 @@ static void odm_RefreshRateAdaptiveMaskCE(struct dm_odm_t *pDM_Odm)
 *
 * --------------------------------------------------------------------------
 */
-static void odm_RefreshRateAdaptiveMask(struct dm_odm_t *pDM_Odm)
+static void odm_RefreshRateAdaptiveMask(struct dm_odm_t *dm_odm)
 {
 
-	if (!(pDM_Odm->SupportAbility & ODM_BB_RA_MASK))
+	if (!(dm_odm->SupportAbility & ODM_BB_RA_MASK))
 		return;
 
-	odm_RefreshRateAdaptiveMaskCE(pDM_Odm);
+	odm_RefreshRateAdaptiveMaskCE(dm_odm);
 }
 
 /*  Return Value: bool */
 /*  - true: RATRState is changed. */
 bool ODM_RAStateCheck(
-	struct dm_odm_t *pDM_Odm,
+	struct dm_odm_t *dm_odm,
 	s32 RSSI,
-	bool bForceUpdate,
-	u8 *pRATRState
+	bool force_update,
+	u8 *ratrstate
 )
 {
-	struct odm_rate_adaptive *pRA = &pDM_Odm->RateAdaptive;
+	struct odm_rate_adaptive *ra = &dm_odm->RateAdaptive;
 	const u8 GoUpGap = 5;
-	u8 HighRSSIThreshForRA = pRA->HighRSSIThresh;
-	u8 LowRSSIThreshForRA = pRA->LowRSSIThresh;
+	u8 HighRSSIThreshForRA = ra->HighRSSIThresh;
+	u8 LowRSSIThreshForRA = ra->LowRSSIThresh;
 	u8 RATRState;
 
 	/*  Threshold Adjustment: */
 	/*  when RSSI state trends to go up one or two levels, make sure RSSI is high enough. */
 	/*  Here GoUpGap is added to solve the boundary's level alternation issue. */
-	switch (*pRATRState) {
+	switch (*ratrstate) {
 	case DM_RATR_STA_INIT:
 	case DM_RATR_STA_HIGH:
 		break;
@@ -497,8 +497,8 @@ bool ODM_RAStateCheck(
 		break;
 
 	default:
-		netdev_dbg(pDM_Odm->Adapter->pnetdev,
-			   "wrong rssi level setting %d !", *pRATRState);
+		netdev_dbg(dm_odm->Adapter->pnetdev,
+			   "wrong rssi level setting %d !", *ratrstate);
 		break;
 	}
 
@@ -510,8 +510,8 @@ bool ODM_RAStateCheck(
 	else
 		RATRState = DM_RATR_STA_LOW;
 
-	if (*pRATRState != RATRState || bForceUpdate) {
-		*pRATRState = RATRState;
+	if (*ratrstate != RATRState || force_update) {
+		*ratrstate = RATRState;
 		return true;
 	}
 
@@ -524,24 +524,24 @@ bool ODM_RAStateCheck(
 /* 3 RSSI Monitor */
 /* 3 ============================================================ */
 
-static void odm_RSSIMonitorInit(struct dm_odm_t *pDM_Odm)
+static void odm_RSSIMonitorInit(struct dm_odm_t *dm_odm)
 {
-	struct ra_t *pRA_Table = &pDM_Odm->DM_RA_Table;
+	struct ra_t *ra_Table = &dm_odm->DM_RA_Table;
 
-	pRA_Table->firstconnect = false;
+	ra_Table->firstconnect = false;
 
 }
 
 static void FindMinimumRSSI(struct adapter *padapter)
 {
-	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
-	struct dm_priv *pdmpriv = &pHalData->dmpriv;
-	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
+	struct hal_com_data	*hal_data = GET_HAL_DATA(padapter);
+	struct dm_priv *pdmpriv = &hal_data->dmpriv;
+	struct dm_odm_t *dm_odm = &hal_data->odmpriv;
 
 	/* 1 1.Determine the minimum RSSI */
 
 	if (
-		(pDM_Odm->bLinked != true) &&
+		(dm_odm->bLinked != true) &&
 		(pdmpriv->EntryMinUndecoratedSmoothedPWDB == 0)
 	) {
 		pdmpriv->MinUndecoratedPWDBForDM = 0;
@@ -549,28 +549,28 @@ static void FindMinimumRSSI(struct adapter *padapter)
 		pdmpriv->MinUndecoratedPWDBForDM = pdmpriv->EntryMinUndecoratedSmoothedPWDB;
 }
 
-static void odm_RSSIMonitorCheckCE(struct dm_odm_t *pDM_Odm)
+static void odm_RSSIMonitorCheckCE(struct dm_odm_t *dm_odm)
 {
-	struct adapter *Adapter = pDM_Odm->Adapter;
-	struct hal_com_data	*pHalData = GET_HAL_DATA(Adapter);
-	struct dm_priv *pdmpriv = &pHalData->dmpriv;
+	struct adapter *Adapter = dm_odm->Adapter;
+	struct hal_com_data	*hal_data = GET_HAL_DATA(Adapter);
+	struct dm_priv *pdmpriv = &hal_data->dmpriv;
 	int i;
-	int tmpEntryMaxPWDB = 0, tmpEntryMinPWDB = 0xff;
+	int tmentryMaxPWDB = 0, tmentryMinPWDB = 0xff;
 	u8 sta_cnt = 0;
 	u32 PWDB_rssi[NUM_STA] = {0};/* 0~15]:MACID, [16~31]:PWDB_rssi */
-	struct ra_t *pRA_Table = &pDM_Odm->DM_RA_Table;
+	struct ra_t *ra_Table = &dm_odm->DM_RA_Table;
 
-	if (pDM_Odm->bLinked != true)
+	if (dm_odm->bLinked != true)
 		return;
 
-	pRA_Table->firstconnect = pDM_Odm->bLinked;
+	ra_Table->firstconnect = dm_odm->bLinked;
 
 	/* if (check_fwstate(&Adapter->mlmepriv, WIFI_AP_STATE|WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE) == true) */
 	{
 		struct sta_info *psta;
 
 		for (i = 0; i < ODM_ASSOCIATE_ENTRY_NUM; i++) {
-			psta = pDM_Odm->pODM_StaInfo[i];
+			psta = dm_odm->pODM_StaInfo[i];
 			if (IS_STA_VALID(psta)) {
 				if (is_multicast_ether_addr(psta->hwaddr))  /* if (psta->mac_id == 1) */
 					continue;
@@ -578,11 +578,11 @@ static void odm_RSSIMonitorCheckCE(struct dm_odm_t *pDM_Odm)
 				if (psta->rssi_stat.UndecoratedSmoothedPWDB == (-1))
 					continue;
 
-				if (psta->rssi_stat.UndecoratedSmoothedPWDB < tmpEntryMinPWDB)
-					tmpEntryMinPWDB = psta->rssi_stat.UndecoratedSmoothedPWDB;
+				if (psta->rssi_stat.UndecoratedSmoothedPWDB < tmentryMinPWDB)
+					tmentryMinPWDB = psta->rssi_stat.UndecoratedSmoothedPWDB;
 
-				if (psta->rssi_stat.UndecoratedSmoothedPWDB > tmpEntryMaxPWDB)
-					tmpEntryMaxPWDB = psta->rssi_stat.UndecoratedSmoothedPWDB;
+				if (psta->rssi_stat.UndecoratedSmoothedPWDB > tmentryMaxPWDB)
+					tmentryMaxPWDB = psta->rssi_stat.UndecoratedSmoothedPWDB;
 
 				if (psta->rssi_stat.UndecoratedSmoothedPWDB != (-1))
 					PWDB_rssi[sta_cnt++] = (psta->mac_id | (psta->rssi_stat.UndecoratedSmoothedPWDB<<16));
@@ -591,7 +591,7 @@ static void odm_RSSIMonitorCheckCE(struct dm_odm_t *pDM_Odm)
 
 		for (i = 0; i < sta_cnt; i++) {
 			if (PWDB_rssi[i] != (0)) {
-				if (pHalData->fw_ractrl == true)/*  Report every sta's RSSI to FW */
+				if (hal_data->fw_ractrl == true)/*  Report every sta's RSSI to FW */
 					rtl8723b_set_rssi_cmd(Adapter, (u8 *)(&PWDB_rssi[i]));
 			}
 		}
@@ -599,63 +599,63 @@ static void odm_RSSIMonitorCheckCE(struct dm_odm_t *pDM_Odm)
 
 
 
-	if (tmpEntryMaxPWDB != 0)	/*  If associated entry is found */
-		pdmpriv->EntryMaxUndecoratedSmoothedPWDB = tmpEntryMaxPWDB;
+	if (tmentryMaxPWDB != 0)	/*  If associated entry is found */
+		pdmpriv->EntryMaxUndecoratedSmoothedPWDB = tmentryMaxPWDB;
 	else
 		pdmpriv->EntryMaxUndecoratedSmoothedPWDB = 0;
 
-	if (tmpEntryMinPWDB != 0xff) /*  If associated entry is found */
-		pdmpriv->EntryMinUndecoratedSmoothedPWDB = tmpEntryMinPWDB;
+	if (tmentryMinPWDB != 0xff) /*  If associated entry is found */
+		pdmpriv->EntryMinUndecoratedSmoothedPWDB = tmentryMinPWDB;
 	else
 		pdmpriv->EntryMinUndecoratedSmoothedPWDB = 0;
 
 	FindMinimumRSSI(Adapter);/* get pdmpriv->MinUndecoratedPWDBForDM */
 
-	pDM_Odm->RSSI_Min = pdmpriv->MinUndecoratedPWDBForDM;
-	/* ODM_CmnInfoUpdate(&pHalData->odmpriv , ODM_CMNINFO_RSSI_MIN, pdmpriv->MinUndecoratedPWDBForDM); */
+	dm_odm->RSSI_Min = pdmpriv->MinUndecoratedPWDBForDM;
+	/* ODM_CmnInfoUpdate(&hal_data->odmpriv , ODM_CMNINFO_RSSI_MIN, pdmpriv->MinUndecoratedPWDBForDM); */
 }
 
-static void odm_RSSIMonitorCheck(struct dm_odm_t *pDM_Odm)
+static void odm_RSSIMonitorCheck(struct dm_odm_t *dm_odm)
 {
-	if (!(pDM_Odm->SupportAbility & ODM_BB_RSSI_MONITOR))
+	if (!(dm_odm->SupportAbility & ODM_BB_RSSI_MONITOR))
 		return;
 
-	odm_RSSIMonitorCheckCE(pDM_Odm);
+	odm_RSSIMonitorCheckCE(dm_odm);
 
 }	/*  odm_RSSIMonitorCheck */
 
 /* 3 ============================================================ */
 /* 3 SW Antenna Diversity */
 /* 3 ============================================================ */
-static void odm_SwAntDetectInit(struct dm_odm_t *pDM_Odm)
+static void odm_SwAntDetectInit(struct dm_odm_t *dm_odm)
 {
-	struct swat_t *pDM_SWAT_Table = &pDM_Odm->DM_SWAT_Table;
+	struct swat_t *dm_swat_table = &dm_odm->DM_SWAT_Table;
 
-	pDM_SWAT_Table->SWAS_NoLink_BK_Reg92c = rtw_read32(pDM_Odm->Adapter, rDPDT_control);
-	pDM_SWAT_Table->PreAntenna = MAIN_ANT;
-	pDM_SWAT_Table->CurAntenna = MAIN_ANT;
-	pDM_SWAT_Table->SWAS_NoLink_State = 0;
+	dm_swat_table->SWAS_NoLink_BK_Reg92c = rtw_read32(dm_odm->Adapter, rDPDT_control);
+	dm_swat_table->PreAntenna = MAIN_ANT;
+	dm_swat_table->CurAntenna = MAIN_ANT;
+	dm_swat_table->SWAS_NoLink_State = 0;
 }
 
 /* 3 ============================================================ */
 /* 3 Tx Power Tracking */
 /* 3 ============================================================ */
 
-static u8 getSwingIndex(struct dm_odm_t *pDM_Odm)
+static u8 getSwingIndex(struct dm_odm_t *dm_odm)
 {
-	struct adapter *Adapter = pDM_Odm->Adapter;
+	struct adapter *Adapter = dm_odm->Adapter;
 	u8 i = 0;
 	u32 bbSwing;
 	u32 swingTableSize;
-	u32 *pSwingTable;
+	u32 *swing_table;
 
 	bbSwing = PHY_QueryBBReg(Adapter, rOFDM0_XATxIQImbalance, 0xFFC00000);
 
-	pSwingTable = OFDMSwingTable_New;
+	swing_table = OFDMSwingTable_New;
 	swingTableSize = OFDM_TABLE_SIZE;
 
 	for (i = 0; i < swingTableSize; ++i) {
-		u32 tableValue = pSwingTable[i];
+		u32 tableValue = swing_table[i];
 
 		if (tableValue >= 0x100000)
 			tableValue >>= 22;
@@ -665,62 +665,62 @@ static u8 getSwingIndex(struct dm_odm_t *pDM_Odm)
 	return i;
 }
 
-void odm_TXPowerTrackingInit(struct dm_odm_t *pDM_Odm)
+void odm_TXPowerTrackingInit(struct dm_odm_t *dm_odm)
 {
-	u8 defaultSwingIndex = getSwingIndex(pDM_Odm);
+	u8 defaultSwingIndex = getSwingIndex(dm_odm);
 	u8 p = 0;
-	struct adapter *Adapter = pDM_Odm->Adapter;
-	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
+	struct adapter *Adapter = dm_odm->Adapter;
+	struct hal_com_data *hal_data = GET_HAL_DATA(Adapter);
 
 
-	struct dm_priv *pdmpriv = &pHalData->dmpriv;
+	struct dm_priv *pdmpriv = &hal_data->dmpriv;
 
 	pdmpriv->bTXPowerTracking = true;
 	pdmpriv->TXPowercount = 0;
 	pdmpriv->bTXPowerTrackingInit = false;
 
-	if (*(pDM_Odm->mp_mode) != 1)
+	if (*(dm_odm->mp_mode) != 1)
 		pdmpriv->TxPowerTrackControl = true;
 	else
 		pdmpriv->TxPowerTrackControl = false;
 
-	/* pDM_Odm->RFCalibrateInfo.TxPowerTrackControl = true; */
-	pDM_Odm->RFCalibrateInfo.ThermalValue = pHalData->EEPROMThermalMeter;
-	pDM_Odm->RFCalibrateInfo.ThermalValue_IQK = pHalData->EEPROMThermalMeter;
-	pDM_Odm->RFCalibrateInfo.ThermalValue_LCK = pHalData->EEPROMThermalMeter;
+	/* dm_odm->RFCalibrateInfo.TxPowerTrackControl = true; */
+	dm_odm->RFCalibrateInfo.ThermalValue = hal_data->EEPROMThermalMeter;
+	dm_odm->RFCalibrateInfo.ThermalValue_IQK = hal_data->EEPROMThermalMeter;
+	dm_odm->RFCalibrateInfo.ThermalValue_LCK = hal_data->EEPROMThermalMeter;
 
 	/*  The index of "0 dB" in SwingTable. */
-	pDM_Odm->DefaultOfdmIndex = (defaultSwingIndex >= OFDM_TABLE_SIZE) ? 30 : defaultSwingIndex;
-	pDM_Odm->DefaultCckIndex = 20;
+	dm_odm->DefaultOfdmIndex = (defaultSwingIndex >= OFDM_TABLE_SIZE) ? 30 : defaultSwingIndex;
+	dm_odm->DefaultCckIndex = 20;
 
-	pDM_Odm->BbSwingIdxCckBase = pDM_Odm->DefaultCckIndex;
-	pDM_Odm->RFCalibrateInfo.CCK_index = pDM_Odm->DefaultCckIndex;
+	dm_odm->BbSwingIdxCckBase = dm_odm->DefaultCckIndex;
+	dm_odm->RFCalibrateInfo.CCK_index = dm_odm->DefaultCckIndex;
 
 	for (p = RF_PATH_A; p < MAX_RF_PATH; ++p) {
-		pDM_Odm->BbSwingIdxOfdmBase[p] = pDM_Odm->DefaultOfdmIndex;
-		pDM_Odm->RFCalibrateInfo.OFDM_index[p] = pDM_Odm->DefaultOfdmIndex;
-		pDM_Odm->RFCalibrateInfo.DeltaPowerIndex[p] = 0;
-		pDM_Odm->RFCalibrateInfo.DeltaPowerIndexLast[p] = 0;
-		pDM_Odm->RFCalibrateInfo.PowerIndexOffset[p] = 0;
+		dm_odm->BbSwingIdxOfdmBase[p] = dm_odm->DefaultOfdmIndex;
+		dm_odm->RFCalibrateInfo.OFDM_index[p] = dm_odm->DefaultOfdmIndex;
+		dm_odm->RFCalibrateInfo.DeltaPowerIndex[p] = 0;
+		dm_odm->RFCalibrateInfo.DeltaPowerIndexLast[p] = 0;
+		dm_odm->RFCalibrateInfo.PowerIndexOffset[p] = 0;
 	}
 
 }
 
-void ODM_TXPowerTrackingCheck(struct dm_odm_t *pDM_Odm)
+void ODM_TXPowerTrackingCheck(struct dm_odm_t *dm_odm)
 {
-	struct adapter *Adapter = pDM_Odm->Adapter;
+	struct adapter *Adapter = dm_odm->Adapter;
 
-	if (!(pDM_Odm->SupportAbility & ODM_RF_TX_PWR_TRACK))
+	if (!(dm_odm->SupportAbility & ODM_RF_TX_PWR_TRACK))
 		return;
 
-	if (!pDM_Odm->RFCalibrateInfo.TM_Trigger) { /* at least delay 1 sec */
-		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_T_METER_NEW, (BIT17 | BIT16), 0x03);
+	if (!dm_odm->RFCalibrateInfo.TM_Trigger) { /* at least delay 1 sec */
+		PHY_SetRFReg(dm_odm->Adapter, RF_PATH_A, RF_T_METER_NEW, (BIT17 | BIT16), 0x03);
 
-		pDM_Odm->RFCalibrateInfo.TM_Trigger = 1;
+		dm_odm->RFCalibrateInfo.TM_Trigger = 1;
 		return;
 	} else {
 		ODM_TXPowerTrackingCallback_ThermalMeter(Adapter);
-		pDM_Odm->RFCalibrateInfo.TM_Trigger = 0;
+		dm_odm->RFCalibrateInfo.TM_Trigger = 0;
 	}
 }
 
@@ -731,26 +731,26 @@ void ODM_TXPowerTrackingCheck(struct dm_odm_t *pDM_Odm)
 /*  */
 /*  2011/09/21 MH Add to describe different team necessary resource allocate?? */
 /*  */
-void ODM_DMInit(struct dm_odm_t *pDM_Odm)
+void ODM_DMInit(struct dm_odm_t *dm_odm)
 {
 
-	odm_CommonInfoSelfInit(pDM_Odm);
-	odm_CmnInfoInit_Debug(pDM_Odm);
-	odm_DIGInit(pDM_Odm);
-	odm_NHMCounterStatisticsInit(pDM_Odm);
-	odm_AdaptivityInit(pDM_Odm);
-	odm_RateAdaptiveMaskInit(pDM_Odm);
-	ODM_CfoTrackingInit(pDM_Odm);
-	ODM_EdcaTurboInit(pDM_Odm);
-	odm_RSSIMonitorInit(pDM_Odm);
-	odm_TXPowerTrackingInit(pDM_Odm);
+	odm_CommonInfoSelfInit(dm_odm);
+	odm_CmnInfoInit_Debug(dm_odm);
+	odm_DIGInit(dm_odm);
+	odm_NHMCounterStatisticsInit(dm_odm);
+	odm_AdaptivityInit(dm_odm);
+	odm_RateAdaptiveMaskInit(dm_odm);
+	ODM_CfoTrackingInit(dm_odm);
+	ODM_EdcaTurboInit(dm_odm);
+	odm_RSSIMonitorInit(dm_odm);
+	odm_TXPowerTrackingInit(dm_odm);
 
-	ODM_ClearTxPowerTrackingState(pDM_Odm);
+	ODM_ClearTxPowerTrackingState(dm_odm);
 
-	odm_DynamicBBPowerSavingInit(pDM_Odm);
-	odm_DynamicTxPowerInit(pDM_Odm);
+	odm_DynamicBBPowerSavingInit(dm_odm);
+	odm_DynamicTxPowerInit(dm_odm);
 
-	odm_SwAntDetectInit(pDM_Odm);
+	odm_SwAntDetectInit(dm_odm);
 }
 
 /*  */
@@ -758,58 +758,58 @@ void ODM_DMInit(struct dm_odm_t *pDM_Odm)
 /*  You can not add any dummy function here, be care, you can only use DM structure */
 /*  to perform any new ODM_DM. */
 /*  */
-void ODM_DMWatchdog(struct dm_odm_t *pDM_Odm)
+void ODM_DMWatchdog(struct dm_odm_t *dm_odm)
 {
-	odm_CommonInfoSelfUpdate(pDM_Odm);
-	odm_BasicDbgMessage(pDM_Odm);
-	odm_FalseAlarmCounterStatistics(pDM_Odm);
-	odm_NHMCounterStatistics(pDM_Odm);
+	odm_CommonInfoSelfUpdate(dm_odm);
+	odm_BasicDbgMessage(dm_odm);
+	odm_FalseAlarmCounterStatistics(dm_odm);
+	odm_NHMCounterStatistics(dm_odm);
 
-	odm_RSSIMonitorCheck(pDM_Odm);
+	odm_RSSIMonitorCheck(dm_odm);
 
 	/* For CE Platform(SPRD or Tablet) */
 	/* 8723A or 8189ES platform */
 	/* NeilChen--2012--08--24-- */
 	/* Fix Leave LPS issue */
-	if ((adapter_to_pwrctl(pDM_Odm->Adapter)->pwr_mode != PS_MODE_ACTIVE) /*  in LPS mode */
+	if ((adapter_to_pwrctl(dm_odm->Adapter)->pwr_mode != PS_MODE_ACTIVE) /*  in LPS mode */
 		/*  */
-		/* (pDM_Odm->SupportICType & (ODM_RTL8723A))|| */
-		/* (pDM_Odm->SupportICType & (ODM_RTL8188E) &&(&&(((pDM_Odm->SupportInterface  == ODM_ITRF_SDIO))) */
+		/* (dm_odm->SupportICType & (ODM_RTL8723A))|| */
+		/* (dm_odm->SupportICType & (ODM_RTL8188E) &&(&&(((dm_odm->SupportInterface  == ODM_ITRF_SDIO))) */
 		/*  */
 	) {
-			odm_DIGbyRSSI_LPS(pDM_Odm);
+			odm_DIGbyRSSI_LPS(dm_odm);
 	} else
-		odm_DIG(pDM_Odm);
+		odm_DIG(dm_odm);
 
 	{
-		struct dig_t *pDM_DigTable = &pDM_Odm->DM_DigTable;
+		struct dig_t *dm_dig_table = &dm_odm->DM_DigTable;
 
-		odm_Adaptivity(pDM_Odm, pDM_DigTable->CurIGValue);
+		odm_Adaptivity(dm_odm, dm_dig_table->CurIGValue);
 	}
-	odm_CCKPacketDetectionThresh(pDM_Odm);
+	odm_CCKPacketDetectionThresh(dm_odm);
 
-	if (*(pDM_Odm->pbPowerSaving) == true)
+	if (*(dm_odm->pbPowerSaving) == true)
 		return;
 
 
-	odm_RefreshRateAdaptiveMask(pDM_Odm);
-	odm_EdcaTurboCheck(pDM_Odm);
-	ODM_CfoTracking(pDM_Odm);
+	odm_RefreshRateAdaptiveMask(dm_odm);
+	odm_EdcaTurboCheck(dm_odm);
+	ODM_CfoTracking(dm_odm);
 
-	ODM_TXPowerTrackingCheck(pDM_Odm);
+	ODM_TXPowerTrackingCheck(dm_odm);
 
-	/* odm_EdcaTurboCheck(pDM_Odm); */
+	/* odm_EdcaTurboCheck(dm_odm); */
 
 	/* 2010.05.30 LukeLee: For CE platform, files in IC subfolders may not be included to be compiled, */
 	/*  so compile flags must be left here to prevent from compile errors */
-	pDM_Odm->PhyDbgInfo.NumQryBeaconPkt = 0;
+	dm_odm->PhyDbgInfo.NumQryBeaconPkt = 0;
 }
 
 
 /*  */
 /*  Init /.. Fixed HW value. Only init time. */
 /*  */
-void ODM_CmnInfoInit(struct dm_odm_t *pDM_Odm, enum odm_cmninfo_e CmnInfo, u32 Value)
+void ODM_CmnInfoInit(struct dm_odm_t *dm_odm, enum odm_cmninfo_e CmnInfo, u32 Value)
 {
 	/*  */
 	/*  This section is used for init value */
@@ -819,77 +819,77 @@ void ODM_CmnInfoInit(struct dm_odm_t *pDM_Odm, enum odm_cmninfo_e CmnInfo, u32 V
 	/*  Fixed ODM value. */
 	/*  */
 	case ODM_CMNINFO_ABILITY:
-		pDM_Odm->SupportAbility = (u32)Value;
+		dm_odm->SupportAbility = (u32)Value;
 		break;
 
 	case ODM_CMNINFO_PLATFORM:
-		pDM_Odm->SupportPlatform = (u8)Value;
+		dm_odm->SupportPlatform = (u8)Value;
 		break;
 
 	case ODM_CMNINFO_INTERFACE:
-		pDM_Odm->SupportInterface = (u8)Value;
+		dm_odm->SupportInterface = (u8)Value;
 		break;
 
 	case ODM_CMNINFO_IC_TYPE:
-		pDM_Odm->SupportICType = Value;
+		dm_odm->SupportICType = Value;
 		break;
 
 	case ODM_CMNINFO_CUT_VER:
-		pDM_Odm->CutVersion = (u8)Value;
+		dm_odm->CutVersion = (u8)Value;
 		break;
 
 	case ODM_CMNINFO_FAB_VER:
-		pDM_Odm->FabVersion = (u8)Value;
+		dm_odm->FabVersion = (u8)Value;
 		break;
 
 	case ODM_CMNINFO_RFE_TYPE:
-		pDM_Odm->RFEType = (u8)Value;
+		dm_odm->RFEType = (u8)Value;
 		break;
 
 	case    ODM_CMNINFO_RF_ANTENNA_TYPE:
-		pDM_Odm->AntDivType = (u8)Value;
+		dm_odm->AntDivType = (u8)Value;
 		break;
 
 	case ODM_CMNINFO_PACKAGE_TYPE:
-		pDM_Odm->PackageType = (u8)Value;
+		dm_odm->PackageType = (u8)Value;
 		break;
 
 	case ODM_CMNINFO_EXT_LNA:
-		pDM_Odm->ExtLNA = (u8)Value;
+		dm_odm->ExtLNA = (u8)Value;
 		break;
 
 	case ODM_CMNINFO_EXT_PA:
-		pDM_Odm->ExtPA = (u8)Value;
+		dm_odm->ExtPA = (u8)Value;
 		break;
 
 	case ODM_CMNINFO_GPA:
-		pDM_Odm->TypeGPA = (enum odm_type_gpa_e)Value;
+		dm_odm->TypeGPA = (enum odm_type_gpa_e)Value;
 		break;
 	case ODM_CMNINFO_APA:
-		pDM_Odm->TypeAPA = (enum odm_type_apa_e)Value;
+		dm_odm->TypeAPA = (enum odm_type_apa_e)Value;
 		break;
 	case ODM_CMNINFO_GLNA:
-		pDM_Odm->TypeGLNA = (enum odm_type_glna_e)Value;
+		dm_odm->TypeGLNA = (enum odm_type_glna_e)Value;
 		break;
 	case ODM_CMNINFO_ALNA:
-		pDM_Odm->TypeALNA = (enum odm_type_alna_e)Value;
+		dm_odm->TypeALNA = (enum odm_type_alna_e)Value;
 		break;
 
 	case ODM_CMNINFO_EXT_TRSW:
-		pDM_Odm->ExtTRSW = (u8)Value;
+		dm_odm->ExtTRSW = (u8)Value;
 		break;
 	case ODM_CMNINFO_PATCH_ID:
-		pDM_Odm->PatchID = (u8)Value;
+		dm_odm->PatchID = (u8)Value;
 		break;
 	case ODM_CMNINFO_BINHCT_TEST:
-		pDM_Odm->bInHctTest = (bool)Value;
+		dm_odm->bInHctTest = (bool)Value;
 		break;
 	case ODM_CMNINFO_BWIFI_TEST:
-		pDM_Odm->bWIFITest = (bool)Value;
+		dm_odm->bWIFITest = (bool)Value;
 		break;
 
 	case ODM_CMNINFO_SMART_CONCURRENT:
-		pDM_Odm->bDualMacSmartConcurrent = (bool)Value;
+		dm_odm->bDualMacSmartConcurrent = (bool)Value;
 		break;
 
 	/* To remove the compiler warning, must add an empty default statement to handle the other values. */
@@ -901,7 +901,7 @@ void ODM_CmnInfoInit(struct dm_odm_t *pDM_Odm, enum odm_cmninfo_e CmnInfo, u32 V
 }
 
 
-void ODM_CmnInfoHook(struct dm_odm_t *pDM_Odm, enum odm_cmninfo_e CmnInfo, void *pValue)
+void ODM_CmnInfoHook(struct dm_odm_t *dm_odm, enum odm_cmninfo_e CmnInfo, void *value)
 {
 	/*  */
 	/*  Hook call by reference pointer. */
@@ -911,110 +911,110 @@ void ODM_CmnInfoHook(struct dm_odm_t *pDM_Odm, enum odm_cmninfo_e CmnInfo, void
 	/*  Dynamic call by reference pointer. */
 	/*  */
 	case ODM_CMNINFO_MAC_PHY_MODE:
-		pDM_Odm->pMacPhyMode = pValue;
+		dm_odm->pMacPhyMode = value;
 		break;
 
 	case ODM_CMNINFO_TX_UNI:
-		pDM_Odm->pNumTxBytesUnicast = pValue;
+		dm_odm->pNumTxBytesUnicast = value;
 		break;
 
 	case ODM_CMNINFO_RX_UNI:
-		pDM_Odm->pNumRxBytesUnicast = pValue;
+		dm_odm->pNumRxBytesUnicast = value;
 		break;
 
 	case ODM_CMNINFO_WM_MODE:
-		pDM_Odm->pwirelessmode = pValue;
+		dm_odm->pwirelessmode = value;
 		break;
 
 	case ODM_CMNINFO_SEC_CHNL_OFFSET:
-		pDM_Odm->pSecChOffset = pValue;
+		dm_odm->pSecChOffset = value;
 		break;
 
 	case ODM_CMNINFO_SEC_MODE:
-		pDM_Odm->pSecurity = pValue;
+		dm_odm->pSecurity = value;
 		break;
 
 	case ODM_CMNINFO_BW:
-		pDM_Odm->pBandWidth = pValue;
+		dm_odm->pBandWidth = value;
 		break;
 
 	case ODM_CMNINFO_CHNL:
-		pDM_Odm->pChannel = pValue;
+		dm_odm->pChannel = value;
 		break;
 
 	case ODM_CMNINFO_DMSP_GET_VALUE:
-		pDM_Odm->pbGetValueFromOtherMac = pValue;
+		dm_odm->pbGetValueFromOtherMac = value;
 		break;
 
 	case ODM_CMNINFO_BUDDY_ADAPTOR:
-		pDM_Odm->pBuddyAdapter = pValue;
+		dm_odm->pBuddyAdapter = value;
 		break;
 
 	case ODM_CMNINFO_DMSP_IS_MASTER:
-		pDM_Odm->pbMasterOfDMSP = pValue;
+		dm_odm->pbMasterOfDMSP = value;
 		break;
 
 	case ODM_CMNINFO_SCAN:
-		pDM_Odm->pbScanInProcess = pValue;
+		dm_odm->pbScanInProcess = value;
 		break;
 
 	case ODM_CMNINFO_POWER_SAVING:
-		pDM_Odm->pbPowerSaving = pValue;
+		dm_odm->pbPowerSaving = value;
 		break;
 
 	case ODM_CMNINFO_ONE_PATH_CCA:
-		pDM_Odm->pOnePathCCA = pValue;
+		dm_odm->pOnePathCCA = value;
 		break;
 
 	case ODM_CMNINFO_DRV_STOP:
-		pDM_Odm->pbDriverStopped =  pValue;
+		dm_odm->pbDriverStopped =  value;
 		break;
 
 	case ODM_CMNINFO_PNP_IN:
-		pDM_Odm->pbDriverIsGoingToPnpSetPowerSleep =  pValue;
+		dm_odm->pbDriverIsGoingToPnpSetPowerSleep =  value;
 		break;
 
 	case ODM_CMNINFO_INIT_ON:
-		pDM_Odm->pinit_adpt_in_progress =  pValue;
+		dm_odm->pinit_adpt_in_progress =  value;
 		break;
 
 	case ODM_CMNINFO_ANT_TEST:
-		pDM_Odm->pAntennaTest =  pValue;
+		dm_odm->pAntennaTest =  value;
 		break;
 
 	case ODM_CMNINFO_NET_CLOSED:
-		pDM_Odm->pbNet_closed = pValue;
+		dm_odm->pbNet_closed = value;
 		break;
 
 	case ODM_CMNINFO_FORCED_RATE:
-		pDM_Odm->pForcedDataRate = pValue;
+		dm_odm->pForcedDataRate = value;
 		break;
 
 	case ODM_CMNINFO_FORCED_IGI_LB:
-		pDM_Odm->pu1ForcedIgiLb = pValue;
+		dm_odm->pu1ForcedIgiLb = value;
 		break;
 
 	case ODM_CMNINFO_MP_MODE:
-		pDM_Odm->mp_mode = pValue;
+		dm_odm->mp_mode = value;
 		break;
 
 	/* case ODM_CMNINFO_RTSTA_AID: */
-	/* pDM_Odm->pAidMap =  (u8 *)pValue; */
+	/* dm_odm->pAidMap =  (u8 *)value; */
 	/* break; */
 
 	/* case ODM_CMNINFO_BT_COEXIST: */
-	/* pDM_Odm->BTCoexist = (bool *)pValue; */
+	/* dm_odm->BTCoexist = (bool *)value; */
 
 	/* case ODM_CMNINFO_STA_STATUS: */
-	/* pDM_Odm->pODM_StaInfo[] = (PSTA_INFO_T)pValue; */
+	/* dm_odm->pODM_StaInfo[] = (PSTA_INFO_T)value; */
 	/* break; */
 
 	/* case ODM_CMNINFO_PHY_STATUS: */
-	/* pDM_Odm->pPhyInfo = (ODM_PHY_INFO *)pValue; */
+	/* dm_odm->pPhyInfo = (ODM_PHY_INFO *)value; */
 	/* break; */
 
 	/* case ODM_CMNINFO_MAC_STATUS: */
-	/* pDM_Odm->pMacInfo = (struct odm_mac_status_info *)pValue; */
+	/* dm_odm->pMacInfo = (struct odm_mac_status_info *)value; */
 	/* break; */
 	/* To remove the compiler warning, must add an empty default statement to handle the other values. */
 	default:
@@ -1026,10 +1026,10 @@ void ODM_CmnInfoHook(struct dm_odm_t *pDM_Odm, enum odm_cmninfo_e CmnInfo, void
 
 
 void ODM_CmnInfoPtrArrayHook(
-	struct dm_odm_t *pDM_Odm,
+	struct dm_odm_t *dm_odm,
 	enum odm_cmninfo_e CmnInfo,
 	u16 Index,
-	void *pValue
+	void *value
 )
 {
 	/*  */
@@ -1040,7 +1040,7 @@ void ODM_CmnInfoPtrArrayHook(
 	/*  Dynamic call by reference pointer. */
 	/*  */
 	case ODM_CMNINFO_STA_STATUS:
-		pDM_Odm->pODM_StaInfo[Index] = (PSTA_INFO_T)pValue;
+		dm_odm->pODM_StaInfo[Index] = (PSTA_INFO_T)value;
 		break;
 	/* To remove the compiler warning, must add an empty default statement to handle the other values. */
 	default:
@@ -1054,95 +1054,95 @@ void ODM_CmnInfoPtrArrayHook(
 /*  */
 /*  Update Band/CHannel/.. The values are dynamic but non-per-packet. */
 /*  */
-void ODM_CmnInfoUpdate(struct dm_odm_t *pDM_Odm, u32 CmnInfo, u64 Value)
+void ODM_CmnInfoUpdate(struct dm_odm_t *dm_odm, u32 CmnInfo, u64 Value)
 {
 	/*  */
 	/*  This init variable may be changed in run time. */
 	/*  */
 	switch (CmnInfo) {
 	case ODM_CMNINFO_LINK_IN_PROGRESS:
-		pDM_Odm->bLinkInProcess = (bool)Value;
+		dm_odm->bLinkInProcess = (bool)Value;
 		break;
 
 	case ODM_CMNINFO_ABILITY:
-		pDM_Odm->SupportAbility = (u32)Value;
+		dm_odm->SupportAbility = (u32)Value;
 		break;
 
 	case ODM_CMNINFO_WIFI_DIRECT:
-		pDM_Odm->bWIFI_Direct = (bool)Value;
+		dm_odm->bWIFI_Direct = (bool)Value;
 		break;
 
 	case ODM_CMNINFO_WIFI_DISPLAY:
-		pDM_Odm->bWIFI_Display = (bool)Value;
+		dm_odm->bWIFI_Display = (bool)Value;
 		break;
 
 	case ODM_CMNINFO_LINK:
-		pDM_Odm->bLinked = (bool)Value;
+		dm_odm->bLinked = (bool)Value;
 		break;
 
 	case ODM_CMNINFO_STATION_STATE:
-		pDM_Odm->bsta_state = (bool)Value;
+		dm_odm->bsta_state = (bool)Value;
 		break;
 
 	case ODM_CMNINFO_RSSI_MIN:
-		pDM_Odm->RSSI_Min = (u8)Value;
+		dm_odm->RSSI_Min = (u8)Value;
 		break;
 
 	case ODM_CMNINFO_RA_THRESHOLD_HIGH:
-		pDM_Odm->RateAdaptive.HighRSSIThresh = (u8)Value;
+		dm_odm->RateAdaptive.HighRSSIThresh = (u8)Value;
 		break;
 
 	case ODM_CMNINFO_RA_THRESHOLD_LOW:
-		pDM_Odm->RateAdaptive.LowRSSIThresh = (u8)Value;
+		dm_odm->RateAdaptive.LowRSSIThresh = (u8)Value;
 		break;
 	/*  The following is for BT HS mode and BT coexist mechanism. */
 	case ODM_CMNINFO_BT_ENABLED:
-		pDM_Odm->bBtEnabled = (bool)Value;
+		dm_odm->bBtEnabled = (bool)Value;
 		break;
 
 	case ODM_CMNINFO_BT_HS_CONNECT_PROCESS:
-		pDM_Odm->bBtConnectProcess = (bool)Value;
+		dm_odm->bBtConnectProcess = (bool)Value;
 		break;
 
 	case ODM_CMNINFO_BT_HS_RSSI:
-		pDM_Odm->btHsRssi = (u8)Value;
+		dm_odm->btHsRssi = (u8)Value;
 		break;
 
 	case ODM_CMNINFO_BT_OPERATION:
-		pDM_Odm->bBtHsOperation = (bool)Value;
+		dm_odm->bBtHsOperation = (bool)Value;
 		break;
 
 	case ODM_CMNINFO_BT_LIMITED_DIG:
-		pDM_Odm->bBtLimitedDig = (bool)Value;
+		dm_odm->bBtLimitedDig = (bool)Value;
 		break;
 
 	case ODM_CMNINFO_BT_DISABLE_EDCA:
-		pDM_Odm->bBtDisableEdcaTurbo = (bool)Value;
+		dm_odm->bBtDisableEdcaTurbo = (bool)Value;
 		break;
 
 /*
 	case	ODM_CMNINFO_OP_MODE:
-		pDM_Odm->OPMode = (u8)Value;
+		dm_odm->OPMode = (u8)Value;
 		break;
 
 	case	ODM_CMNINFO_WM_MODE:
-		pDM_Odm->WirelessMode = (u8)Value;
+		dm_odm->WirelessMode = (u8)Value;
 		break;
 
 	case	ODM_CMNINFO_SEC_CHNL_OFFSET:
-		pDM_Odm->SecChOffset = (u8)Value;
+		dm_odm->SecChOffset = (u8)Value;
 		break;
 
 	case	ODM_CMNINFO_SEC_MODE:
-		pDM_Odm->Security = (u8)Value;
+		dm_odm->Security = (u8)Value;
 		break;
 
 	case	ODM_CMNINFO_BW:
-		pDM_Odm->BandWidth = (u8)Value;
+		dm_odm->BandWidth = (u8)Value;
 		break;
 
 	case	ODM_CMNINFO_CHNL:
-		pDM_Odm->Channel = (u8)Value;
+		dm_odm->Channel = (u8)Value;
 		break;
 */
 	default:
diff --git a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
index 928c58be6c9b..000d5d44bc23 100644
--- a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
+++ b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
@@ -7,153 +7,153 @@
 
 #include "odm_precomp.h"
 
-static void odm_SetCrystalCap(void *pDM_VOID, u8 CrystalCap)
+static void odm_SetCrystalCap(void *dm_void, u8 CrystalCap)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
-	struct cfo_tracking *pCfoTrack = &pDM_Odm->DM_CfoTrack;
+	struct dm_odm_t *dm_odm = (struct dm_odm_t *)dm_void;
+	struct cfo_tracking *cfo_track = &dm_odm->DM_CfoTrack;
 
-	if (pCfoTrack->CrystalCap == CrystalCap)
+	if (cfo_track->CrystalCap == CrystalCap)
 		return;
 
-	pCfoTrack->CrystalCap = CrystalCap;
+	cfo_track->CrystalCap = CrystalCap;
 
 	/*  0x2C[23:18] = 0x2C[17:12] = CrystalCap */
 	CrystalCap = CrystalCap & 0x3F;
 	PHY_SetBBReg(
-		pDM_Odm->Adapter,
+		dm_odm->Adapter,
 		REG_MAC_PHY_CTRL,
 		0x00FFF000,
 		(CrystalCap | (CrystalCap << 6))
 	);
 }
 
-static u8 odm_GetDefaultCrytaltalCap(void *pDM_VOID)
+static u8 odm_GetDefaultCrytaltalCap(void *dm_void)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *dm_odm = (struct dm_odm_t *)dm_void;
 
-	struct adapter *Adapter = pDM_Odm->Adapter;
+	struct adapter *Adapter = dm_odm->Adapter;
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 
 	return pHalData->CrystalCap & 0x3f;
 }
 
-static void odm_SetATCStatus(void *pDM_VOID, bool ATCStatus)
+static void odm_SetATCStatus(void *dm_void, bool ATCStatus)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
-	struct cfo_tracking *pCfoTrack = &pDM_Odm->DM_CfoTrack;
+	struct dm_odm_t *dm_odm = (struct dm_odm_t *)dm_void;
+	struct cfo_tracking *cfo_track = &dm_odm->DM_CfoTrack;
 
-	if (pCfoTrack->bATCStatus == ATCStatus)
+	if (cfo_track->bATCStatus == ATCStatus)
 		return;
 
 	PHY_SetBBReg(
-		pDM_Odm->Adapter,
-		ODM_REG(BB_ATC, pDM_Odm),
-		ODM_BIT(BB_ATC, pDM_Odm),
+		dm_odm->Adapter,
+		ODM_REG(BB_ATC, dm_odm),
+		ODM_BIT(BB_ATC, dm_odm),
 		ATCStatus
 	);
-	pCfoTrack->bATCStatus = ATCStatus;
+	cfo_track->bATCStatus = ATCStatus;
 }
 
-static bool odm_GetATCStatus(void *pDM_VOID)
+static bool odm_GetATCStatus(void *dm_void)
 {
 	bool ATCStatus;
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *dm_odm = (struct dm_odm_t *)dm_void;
 
 	ATCStatus = (bool)PHY_QueryBBReg(
-		pDM_Odm->Adapter,
-		ODM_REG(BB_ATC, pDM_Odm),
-		ODM_BIT(BB_ATC, pDM_Odm)
+		dm_odm->Adapter,
+		ODM_REG(BB_ATC, dm_odm),
+		ODM_BIT(BB_ATC, dm_odm)
 	);
 	return ATCStatus;
 }
 
-void ODM_CfoTrackingReset(void *pDM_VOID)
+void ODM_CfoTrackingReset(void *dm_void)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
-	struct cfo_tracking *pCfoTrack = &pDM_Odm->DM_CfoTrack;
+	struct dm_odm_t *dm_odm = (struct dm_odm_t *)dm_void;
+	struct cfo_tracking *cfo_track = &dm_odm->DM_CfoTrack;
 
-	pCfoTrack->DefXCap = odm_GetDefaultCrytaltalCap(pDM_Odm);
-	pCfoTrack->bAdjust = true;
+	cfo_track->DefXCap = odm_GetDefaultCrytaltalCap(dm_odm);
+	cfo_track->bAdjust = true;
 
-	odm_SetCrystalCap(pDM_Odm, pCfoTrack->DefXCap);
-	odm_SetATCStatus(pDM_Odm, true);
+	odm_SetCrystalCap(dm_odm, cfo_track->DefXCap);
+	odm_SetATCStatus(dm_odm, true);
 }
 
-void ODM_CfoTrackingInit(void *pDM_VOID)
+void ODM_CfoTrackingInit(void *dm_void)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
-	struct cfo_tracking *pCfoTrack = &pDM_Odm->DM_CfoTrack;
+	struct dm_odm_t *dm_odm = (struct dm_odm_t *)dm_void;
+	struct cfo_tracking *cfo_track = &dm_odm->DM_CfoTrack;
 
-	pCfoTrack->DefXCap =
-		pCfoTrack->CrystalCap = odm_GetDefaultCrytaltalCap(pDM_Odm);
-	pCfoTrack->bATCStatus = odm_GetATCStatus(pDM_Odm);
-	pCfoTrack->bAdjust = true;
+	cfo_track->DefXCap =
+		cfo_track->CrystalCap = odm_GetDefaultCrytaltalCap(dm_odm);
+	cfo_track->bATCStatus = odm_GetATCStatus(dm_odm);
+	cfo_track->bAdjust = true;
 }
 
-void ODM_CfoTracking(void *pDM_VOID)
+void ODM_CfoTracking(void *dm_void)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
-	struct cfo_tracking *pCfoTrack = &pDM_Odm->DM_CfoTrack;
+	struct dm_odm_t *dm_odm = (struct dm_odm_t *)dm_void;
+	struct cfo_tracking *cfo_track = &dm_odm->DM_CfoTrack;
 	int CFO_kHz_A, CFO_ave = 0;
 	int CFO_ave_diff;
-	int CrystalCap = (int)pCfoTrack->CrystalCap;
+	int CrystalCap = (int)cfo_track->CrystalCap;
 	u8 Adjust_Xtal = 1;
 
 	/* 4 Support ability */
-	if (!(pDM_Odm->SupportAbility & ODM_BB_CFO_TRACKING)) {
+	if (!(dm_odm->SupportAbility & ODM_BB_CFO_TRACKING)) {
 		return;
 	}
 
-	if (!pDM_Odm->bLinked || !pDM_Odm->bOneEntryOnly) {
+	if (!dm_odm->bLinked || !dm_odm->bOneEntryOnly) {
 		/* 4 No link or more than one entry */
-		ODM_CfoTrackingReset(pDM_Odm);
+		ODM_CfoTrackingReset(dm_odm);
 	} else {
 		/* 3 1. CFO Tracking */
 		/* 4 1.1 No new packet */
-		if (pCfoTrack->packetCount == pCfoTrack->packetCount_pre) {
+		if (cfo_track->packetCount == cfo_track->packetCount_pre) {
 			return;
 		}
-		pCfoTrack->packetCount_pre = pCfoTrack->packetCount;
+		cfo_track->packetCount_pre = cfo_track->packetCount;
 
 		/* 4 1.2 Calculate CFO */
-		CFO_kHz_A =  (int)(pCfoTrack->CFO_tail[0] * 3125)  / 1280;
+		CFO_kHz_A =  (int)(cfo_track->CFO_tail[0] * 3125)  / 1280;
 
 		CFO_ave = CFO_kHz_A;
 
 		/* 4 1.3 Avoid abnormal large CFO */
 		CFO_ave_diff =
-			(pCfoTrack->CFO_ave_pre >= CFO_ave) ?
-			(pCfoTrack->CFO_ave_pre-CFO_ave) :
-			(CFO_ave-pCfoTrack->CFO_ave_pre);
+			(cfo_track->CFO_ave_pre >= CFO_ave) ?
+			(cfo_track->CFO_ave_pre-CFO_ave) :
+			(CFO_ave-cfo_track->CFO_ave_pre);
 
 		if (
 			CFO_ave_diff > 20 &&
-			pCfoTrack->largeCFOHit == 0 &&
-			!pCfoTrack->bAdjust
+			cfo_track->largeCFOHit == 0 &&
+			!cfo_track->bAdjust
 		) {
-			pCfoTrack->largeCFOHit = 1;
+			cfo_track->largeCFOHit = 1;
 			return;
 		} else
-			pCfoTrack->largeCFOHit = 0;
-		pCfoTrack->CFO_ave_pre = CFO_ave;
+			cfo_track->largeCFOHit = 0;
+		cfo_track->CFO_ave_pre = CFO_ave;
 
 		/* 4 1.4 Dynamic Xtal threshold */
-		if (pCfoTrack->bAdjust == false) {
+		if (cfo_track->bAdjust == false) {
 			if (CFO_ave > CFO_TH_XTAL_HIGH || CFO_ave < (-CFO_TH_XTAL_HIGH))
-				pCfoTrack->bAdjust = true;
+				cfo_track->bAdjust = true;
 		} else {
 			if (CFO_ave < CFO_TH_XTAL_LOW && CFO_ave > (-CFO_TH_XTAL_LOW))
-				pCfoTrack->bAdjust = false;
+				cfo_track->bAdjust = false;
 		}
 
 		/* 4 1.5 BT case: Disable CFO tracking */
-		if (pDM_Odm->bBtEnabled) {
-			pCfoTrack->bAdjust = false;
-			odm_SetCrystalCap(pDM_Odm, pCfoTrack->DefXCap);
+		if (dm_odm->bBtEnabled) {
+			cfo_track->bAdjust = false;
+			odm_SetCrystalCap(dm_odm, cfo_track->DefXCap);
 		}
 
 		/* 4 1.6 Big jump */
-		if (pCfoTrack->bAdjust) {
+		if (cfo_track->bAdjust) {
 			if (CFO_ave > CFO_TH_XTAL_LOW)
 				Adjust_Xtal = Adjust_Xtal+((CFO_ave-CFO_TH_XTAL_LOW)>>2);
 			else if (CFO_ave < (-CFO_TH_XTAL_LOW))
@@ -161,7 +161,7 @@ void ODM_CfoTracking(void *pDM_VOID)
 		}
 
 		/* 4 1.7 Adjust Crystal Cap. */
-		if (pCfoTrack->bAdjust) {
+		if (cfo_track->bAdjust) {
 			if (CFO_ave > CFO_TH_XTAL_LOW)
 				CrystalCap = CrystalCap + Adjust_Xtal;
 			else if (CFO_ave < (-CFO_TH_XTAL_LOW))
@@ -172,14 +172,14 @@ void ODM_CfoTracking(void *pDM_VOID)
 			else if (CrystalCap < 0)
 				CrystalCap = 0;
 
-			odm_SetCrystalCap(pDM_Odm, (u8)CrystalCap);
+			odm_SetCrystalCap(dm_odm, (u8)CrystalCap);
 		}
 
 		/* 3 2. Dynamic ATC switch */
 		if (CFO_ave < CFO_TH_ATC && CFO_ave > -CFO_TH_ATC) {
-			odm_SetATCStatus(pDM_Odm, false);
+			odm_SetATCStatus(dm_odm, false);
 		} else {
-			odm_SetATCStatus(pDM_Odm, true);
+			odm_SetATCStatus(dm_odm, true);
 		}
 	}
 }
-- 
2.34.1

