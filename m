Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E358E84E1C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743165800; cv=none; b=V0j9QSPITwyTH5dYs4/lfs28INAA/aEXeCpXcXGtabM3SbSc1X3zPSGIZ9imquh3HIWg7aLQR/KoM0TjSZJJN84cBeFTSuR0QV3vGKgnG0rZrXNMZtptT+f5S0OMqd6JK8yjQt0dgZX5Z5ovg0xoz+btE5GEvHN39GzubtkTM/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743165800; c=relaxed/simple;
	bh=JDj6XTVsA/RRaUEWvgXmJHjhoE5P7hwvD7zT0vB7Wgk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EHYI1xEaA2jNkWJ6oLqdJkE/oK+Sw7gBQ4B1QbiadbTs09XvDfKXhDM/zvKkapnqylhNyW30xbcv/zHM5uY2ekn/JcTqGktZrNHw6gINebL7D+Hjg5SMHHkPZwur8W6QfdaKWDGzCNo6VQncgtmN9uMuOeBtHVE+wS7+H4WLUQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XevR6BsX; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XevR6BsX"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-391342fc1f6so1770698f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 05:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743165796; x=1743770596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEKcpnCjLBm8PP3x2TSj65QxcW4sZ3L7FQVPgUn7oKk=;
        b=XevR6BsXZwEZqOxt5qZAffa89cMIY/hK8Pm14kEmrQJYA89KibZ2AeByT5Dt/FEY+V
         +pxcevBR5bk07iEo5NAarzXLZWVdz+ZO3yGz7TwgPb6MytoUJLPJvLgf2q9AHl9NZdki
         Xdz4pW1P3r5TTCPkY20zUyZxY888QehFrycF/fm2b7DrQ+IQopZApaYbIP5O/d3EgpYw
         CxWRDabXV3JlMb0UxqieJ5IqMWJRDmKYv+VMDFPssp8xYo6kcE1KLmfRH1LjGWh4zJJU
         0j0mHVxdMMEg4QC897w0lrHFZTouTnyaNMneo3ZVjEvECkH7iLg9moPYKV6khdgIzXLY
         efnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743165796; x=1743770596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEKcpnCjLBm8PP3x2TSj65QxcW4sZ3L7FQVPgUn7oKk=;
        b=oPv3fa907Soj8b8tv8KyoAp3Rilx5LjVdCIJb/gGvrShrA5A+Uul77UZH7ZU2EHIXr
         6/N4INrIUyEiAgvJqrzsIbnnMRxkYUttSu0PgrFiMQP/hEcxF0Gn8Z3XI03LfrvYa7mu
         uaqSuM1iV4kX7EbBqar7O9FUoSE/XoyB4TFFyuTAIKD8nL5f2DUjfvJNPrfAz8QJDVsa
         Nazyrptc1pYYSwi/AhYPJJFPEVxIGKfcCw4EOwmNrxboOkQL+iCFDS4RLHdFk3S71XQF
         vcAvrHSUsuuDG+Fs0KANGfu9YHtAqY23Rfnd5EgAC4tAFUfJNCi9Tcyh5X8j3zXcq73m
         FJxw==
X-Forwarded-Encrypted: i=1; AJvYcCUnMG5JIcc+mdQIzR3aSdNtMmME28Esj/LOa653t3X2W4/YL6pnSCKnegIQ6v61PCibncPn8ndj24pXeKM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9uif4DSdndYh/M9sKzu7UkeFKYzGOqKdnBTeGJ8+EvmuN6yYE
	r8wjdz7AgH4/Ep5Ln6NoXaKPkdj6MsXMTGHpLdhCEyjaOPx6rD8tudgxOoOw
X-Gm-Gg: ASbGncupkGfwSOVoZ8gRLviivRBCWh6WpXjFnXfO0la46JaBU83QDq68hBa3KOIZUy+
	JzESIqhb6oyfpjVpDu1KZgt2tP7jSW1G4ufR6tfbc/0LQmd65iMQW7suL1NnMcx5Mv/sz1Jbj5j
	ofj1mHZz8FO/1FSzxG7tOSGltvdubWH3cHcOHybisbsQogVIcXHc0fp6iTbPRZ7wGwPCjxb8uEo
	BFc5rkfubvN4nB0hgtyDxShHvytVxgVXc6ke+7eZbnPYrjq1oQi2uElxnJNNmDM6t9YdzVtG2Wl
	Vv//mSN8nWyEdHKp4pTb8o3x30wbNiXz0RfS8i6o4xK75eEM
X-Google-Smtp-Source: AGHT+IEmXWt1ufUGYKnc9GQoIBXCZtqvdp6S/pswtHvOpjgYC2zzdAx3GLRDSPmiugSCsxHWnhVj0w==
X-Received: by 2002:a05:6000:1a8a:b0:391:122c:8b2 with SMTP id ffacd0b85a97d-39ad17492damr7502490f8f.31.1743165795892;
        Fri, 28 Mar 2025 05:43:15 -0700 (PDT)
Received: from HP-650 ([105.112.193.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82e834a5sm72094165e9.13.2025.03.28.05.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 05:43:15 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	julia.lawall@inria.fr,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH 2/5] staging: rtl8723bs: align function return type and name on the same line
Date: Fri, 28 Mar 2025 13:39:39 +0100
Message-Id: <9e6cf0506ec7e80bf25dbb27b03473081f4e1c3a.1743163801.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743163800.git.abrahamadekunle50@gmail.com>
References: <cover.1743163800.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function defintions' return types and names are split across multiple lines
which is inconsistent with Linux kernel coding style guidelines

Align them to follow the Linux kernel coding style for better readability
and consistency.

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 75 +++++-----------------
 1 file changed, 16 insertions(+), 59 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 7a74b011dedc..62a2919086f3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -29,8 +29,7 @@ u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
 #define REG_EFUSE_CTRL		0x0030
 #define EFUSE_CTRL			REG_EFUSE_CTRL		/*  E-Fuse Control. */
 
-static bool
-Efuse_Read1ByteFromFakeContent(u16 Offset, u8 *Value)
+static bool Efuse_Read1ByteFromFakeContent(u16 Offset, u8 *Value)
 {
 	if (Offset >= EFUSE_MAX_HW_SIZE)
 		return false;
@@ -41,8 +40,7 @@ Efuse_Read1ByteFromFakeContent(u16 Offset, u8 *Value)
 	return true;
 }
 
-static bool
-Efuse_Write1ByteToFakeContent(u16 Offset, u8 Value)
+static bool Efuse_Write1ByteToFakeContent(u16 Offset, u8 Value)
 {
 	if (Offset >= EFUSE_MAX_HW_SIZE)
 		return false;
@@ -71,18 +69,13 @@ Efuse_Write1ByteToFakeContent(u16 Offset, u8 Value)
  * 11/17/2008	MHC		Create Version 0.
  *
  *---------------------------------------------------------------------------*/
-void
-Efuse_PowerSwitch(
-struct adapter *padapter,
-u8 bWrite,
-u8 PwrState)
+void Efuse_PowerSwitch(struct adapter *padapter, u8 bWrite, u8 PwrState)
 {
 	Hal_EfusePowerSwitch(padapter, bWrite, PwrState);
 }
 
 /*  11/16/2008 MH Add description. Get current efuse area enabled word!!. */
-u8
-Efuse_CalculateWordCnts(u8 word_en)
+u8 Efuse_CalculateWordCnts(u8 word_en)
 {
 	u8 word_cnts = 0;
 	if (!(word_en & BIT(0)))
@@ -114,36 +107,17 @@ Efuse_CalculateWordCnts(u8 word_en)
 /*					write addr must be after sec5. */
 /*  */
 
-void
-efuse_ReadEFuse(
-	struct adapter *Adapter,
-	u8 efuseType,
-	u16		_offset,
-	u16		_size_byte,
-	u8 *pbuf,
-bool	bPseudoTest
-	);
-void
-efuse_ReadEFuse(
-	struct adapter *Adapter,
-	u8 efuseType,
-	u16		_offset,
-	u16		_size_byte,
-	u8 *pbuf,
-bool	bPseudoTest
-	)
+void efuse_ReadEFuse(struct adapter *Adapter, u8 efuseType, u16 _offset, u16 _size_byte,
+		     u8 *pbuf,
+		     bool bPseudoTest);
+void efuse_ReadEFuse(struct adapter *Adapter, u8 efuseType, u16 _offset, u16 _size_byte, u8 *pbuf,
+		     bool bPseudoTest)
 {
 	Hal_ReadEFuse(Adapter, efuseType, _offset, _size_byte, pbuf, bPseudoTest);
 }
 
-void
-EFUSE_GetEfuseDefinition(
-	struct adapter *padapter,
-	u8 efuseType,
-	u8 type,
-	void	*pOut,
-	bool		bPseudoTest
-	)
+void EFUSE_GetEfuseDefinition(struct adapter *padapter, u8 efuseType, u8 type, void *pOut,
+			      bool bPseudoTest)
 {
 	Hal_GetEfuseDefinition(padapter, efuseType, type, pOut, bPseudoTest);
 }
@@ -164,10 +138,7 @@ EFUSE_GetEfuseDefinition(
  * 09/23/2008	MHC		Copy from WMAC.
  *
  *---------------------------------------------------------------------------*/
-u8
-EFUSE_Read1Byte(
-struct adapter *Adapter,
-u16		Address)
+u8 EFUSE_Read1Byte(struct adapter *Adapter, u16 Address)
 {
 	u8 Bytetemp = {0x00};
 	u8 temp = {0x00};
@@ -205,12 +176,7 @@ u16		Address)
 } /* EFUSE_Read1Byte */
 
 /*  11/16/2008 MH Read one byte from real Efuse. */
-u8
-efuse_OneByteRead(
-struct adapter *padapter,
-u16	addr,
-u8	*data,
-bool		bPseudoTest)
+u8 efuse_OneByteRead(struct adapter *padapter, u16 addr, u8 *data, bool bPseudoTest)
 {
 	u32 tmpidx = 0;
 	u8 bResult;
@@ -286,12 +252,8 @@ u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool bPseudoT
 	return bResult;
 }
 
-u8
-Efuse_WordEnableDataWrite(struct adapter *padapter,
-						u16		efuse_addr,
-						u8 word_en,
-						u8 *data,
-						bool		bPseudoTest)
+u8 Efuse_WordEnableDataWrite(struct adapter *padapter, u16 efuse_addr, u8 word_en, u8 *data,
+			     bool bPseudoTest)
 {
 	return padapter->HalFunc.Efuse_WordEnableDataWrite(padapter, efuse_addr,
 							   word_en, data,
@@ -314,12 +276,7 @@ Efuse_WordEnableDataWrite(struct adapter *padapter,
  * 11/11/2008	MHC		Create Version 0.
  *
  *---------------------------------------------------------------------------*/
-void
-Efuse_ReadAllMap(
-	struct adapter *padapter,
-	u8 efuseType,
-	u8 *Efuse,
-	bool		bPseudoTest);
+void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse, bool bPseudoTest);
 void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse, bool bPseudoTest)
 {
 	u16 mapLen = 0;
-- 
2.34.1

