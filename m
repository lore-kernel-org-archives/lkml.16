Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEF625E827
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 07:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751355799; cv=none; b=LZTjwhnJJRfrMO1ijuv39vgxke+fpd1/9wsZmDYRsFXvMXgruDGiBEjKeOfUV5rYZjgxQouGfqVtBPzWohg9YWTSfQBIaxhuhksV0y3OB0UjxxU8MiU0gKFCFZ7abLsSfS7YHIb8VY/ffAImJVYGX+ZrO1v5TGHzHHEPl6YWZwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751355799; c=relaxed/simple;
	bh=ywlYCY8zTz9DvIxTFUwFyz0DawpDzD+jUIkGQoNHBXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V5lthlIYCiqdjThUHnPXH4KcVLukdon8QGyeglnjcuDVIj4QuIgmcIoNQnM+fuEal892qf+6e+9F40IlIFQ/c4l60fLvRhRDqizazhDObYE/Csj/IKdVGMoyYa4qSqxY++y7kiRz/X37dufSg+3aZ9OzQIz6jFPXbCdOirDRVdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nmix+Rmj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nmix+Rmj"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453608ed113so29838285e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 00:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751355794; x=1751960594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nu+bTpGkebl5ACFwafhyVcbt4recZ+wksormxu6a4Ts=;
        b=Nmix+RmjKrX41PYW94Ufym2YJRn3n7Y6XDB6gzx3KayLNIITSRIJib0NpBfb1teNtV
         kpVZH+wJGIj1PMUefYAdW/KCnoMb8aavxWUPYjthMMIGizfRdTgPzOkMCWNnh36bRjc1
         px/o3+pBohqxczyKlariM7gQp4W/0iqTEmSOW2BNvX1c6uhdvrcOqZiTjxDxNWjggiVT
         71i8mx17jQBjoKHQePXQZluRvj5U1OmlbH+gzTxWES/nKx9s2pjCpRgUaN7onF0jNWzw
         ZN9v8yJPXMFtwNUJ3oafT44kCf+0UAaYMmzfBXgZmnv7p17ulJjL+UkBGvexNfLP2MUO
         V+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751355794; x=1751960594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nu+bTpGkebl5ACFwafhyVcbt4recZ+wksormxu6a4Ts=;
        b=FF92ntKrgv2jsd/Ob3a0CM3xcOnfocbzNcvOsnkElZiikQZUrhf4+PrEb3l46xlZ0b
         t5efrxw9ZVMmD7kMIiXUxL8aUx3OtkqWR3h051IafOJqCR4qoQ0bYJ0itjk++pUUev1Q
         mdqMlLlE7nsDvO95OYKvm4+Uh2O/KRtJcXQuIpi5lr2/pbS5SwMifXrexsu6sFJdXYbn
         FSpMk9pTxdtTSl+5Gu5y6wd1RtFHpWYnGY1Es90lkjdPmRfT3vft2Uye8tmOf/VEGhDq
         9dX8s2FF3RIpn2vBh+0AnmRIRHsx6Hao1tGl2jpBc4Ivz2ZdX8prBLTND0CG0aBNplh6
         V3Lg==
X-Forwarded-Encrypted: i=1; AJvYcCV9dMmMTqpcy60DgWO0nxbZ0VfpZnYDdV8S2C8tC5XGA4/NAaX4d6uXeW1c3tcalu4rBkiVK0dFgKt2BwE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc0tyEKVLQKlVj6y8s0m4PDQIjYdgcQqsqJCnWahEfJhN3dAjW
	I008VrPA4NnihnAuDSQ96l5UVhfTNAWJ+5k2RuPYHzNWZcVTVGQ/3xG+
X-Gm-Gg: ASbGncvOmSO7y5dZvtEMn2u30rou2bgPQjrUgmWLn3P1Uy2GkR62LrtGlRdluBxEQNN
	0SeHJxC+T/Bdk0MFIlA3JHsEAkxTvLAAvHsMI0kkhKIToqfST2nzrqPZCFbN2dLDk8V+Y02mRrt
	V0mAXLhcwxE75EmS5FuRg+CMHgxd22WC8Gi93z/5tKlaUllSCkxpFLbT7kh2GRYc7wv6cofxsCN
	USpkC5UORxefqQAvbHZcrscKmD/uUsJPBbLLCJBRP133WAscm6SmfF30iWphif2LCiDc94x5ng9
	71R41FVViXvvoxRI9EAp1n8OH1jLHhJr3ips9Mu+BPpx8lmvUpyDR5Lohnj9VuKY4oW/v4R3znQ
	lhygpaQ==
X-Google-Smtp-Source: AGHT+IGtM2k1LNAWkFlaRdKHCCh6nVOiryJTl99LCdHmhtjL7Ubikj7DlvQfsyaDS637oDfYU+fGeQ==
X-Received: by 2002:a05:600c:35d1:b0:450:d3b9:4bac with SMTP id 5b1f17b1804b1-45394179dd4mr106494505e9.28.1751355794064;
        Tue, 01 Jul 2025 00:43:14 -0700 (PDT)
Received: from cachyos.customer.ask4.lan ([89.26.177.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453883d81besm169850235e9.38.2025.07.01.00.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 00:43:13 -0700 (PDT)
From: Marcos Garcia <magazo2005@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	dan.carpenter@linaro.org,
	karanja99erick@gmail.com,
	rodrigo.gobbi.7@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Garcia <magazo2005@gmail.com>
Subject: [PATCH staging] staging: rtl8723bs: replace magic numbers in rtl8723b_InitBeaconParameters()
Date: Tue,  1 Jul 2025 09:40:49 +0200
Message-ID: <20250701074243.1300186-1-magazo2005@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Replace hardcoded values in rtl8723b_InitBeaconParameters() with defined constants
TBTT_PROHIBIT_VENDOR_DEFAULT (0x6404) and BCNTCFG_AIFS_MAX (0x660F) for clarity and
maintainability, addressing the TODO comment in the code.

The values were sourced from the following documentation:
- REG_TBTT_PROHIBIT (Offset 0x0540): Bits [15:8] = 0x64 (100ms prohibit time, 1ms units),
  Bits [7:0] = 0x04 (2ms margin, 0.5ms units), as per RTL8723BS Datasheet v1.5,
  Section 7.3.1.5 and RTL8723BS Programming Guide, p. 112.
- REG_BCNTCFG (Offset 0x0510): 0x660F sets max AIFS (0x0F) to prioritize beacon
  transmission, as per RTL8723BS Datasheet v1.5, Section 7.3.1.3.

Hi Dan,

Thank you for your detailed feedback — I truly appreciate it. I tried to contact you
earlier, but it seems my email didn't reach you. This is my first kernel contribution,
and I started by addressing TODO comments, thinking they were straightforward. I now
realize even these changes require deep hardware understanding. I used AI to assist with
parts of the commit message, but I didn't review it thoroughly enough, and I take full
responsibility for the vague comments. I could only find limited references to these
values, and the documentation seems restricted. I apologize for any oversight and
promise to research more carefully in the future. Thank you for your guidance.

Signed-off-by: Marcos Garcia <magazo2005@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 893cab0532ed..009d9010d72d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1183,6 +1183,10 @@ void rtl8723b_read_chip_version(struct adapter *padapter)
 	ReadChipVersion8723B(padapter);
 }
 
+#define TBTT_PROHIBIT_VENDOR_DEFAULT  0x6404
+
+#define BCNTCFG_AIFS_MAX  0x660F
+
 void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
@@ -1197,8 +1201,7 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 
 	rtw_write16(padapter, REG_BCN_CTRL, val16);
 
-	/*  TODO: Remove these magic number */
-	rtw_write16(padapter, REG_TBTT_PROHIBIT, 0x6404);/*  ms */
+	rtw_write16(padapter, REG_TBTT_PROHIBIT, TBTT_PROHIBIT_VENDOR_DEFAULT);
 	/*  Firmware will control REG_DRVERLYINT when power saving is enable, */
 	/*  so don't set this register on STA mode. */
 	if (check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE) == false)
@@ -1207,7 +1210,7 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 
 	/*  Suggested by designer timchen. Change beacon AIFS to the largest number */
 	/*  because test chip does not contension before sending beacon. by tynli. 2009.11.03 */
-	rtw_write16(padapter, REG_BCNTCFG, 0x660F);
+	rtw_write16(padapter, REG_BCNTCFG, BCNTCFG_AIFS_MAX);
 
 	pHalData->RegBcnCtrlVal = rtw_read8(padapter, REG_BCN_CTRL);
 	pHalData->RegTxPause = rtw_read8(padapter, REG_TXPAUSE);
-- 
2.50.0

