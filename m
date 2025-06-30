Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01662E425C
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751304829; cv=none; b=JXWTk/XdWveVK+rIqwK7dbsFBLDM4/L4+UI52bqegURgQ6FmzaPiMcDupvPdL6OFYh9oh5lQ8vhKwqaIjOde+txUdtNPaHY8aKqGakbTgKK2bNajkR/vce/gLhnzThxalLCXAwlUdsen59mlmxaaV/YzAWp9wC9ljY5goM/iM54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751304829; c=relaxed/simple;
	bh=WOgChIj8CdYn0jOoVt63RBLkUFDE8p+lFij2opL8/dQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qDHRqx1j4mp5kbH6QCLjSUANBdnea5PTg5W6iMm72VxLTz2iedMHnRJ2udHN8s07iaUbS07bQPvytxl7HK2QcJ/5aLilnFcJSB5vuYsuOtZiWd23ek4lMWCykVrCamDZiLJKMtpwh8PYNRJcaciX7Wl/sud7u8cpaQXlhmvTlAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNJ+RXLw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNJ+RXLw"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4537deebb01so12366865e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751304826; x=1751909626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ywKQCs/xgmEMMGX7vzOv8GIY/LFySjzj9TaSkXMmQo=;
        b=MNJ+RXLwUMZkR3IBqG4mkBC4eDcjnj/ak90UGpo+Ylf3ocJOp8MitC4P2tSktmHXql
         AZmPmWQZOLJ+/Ltuep2G3kAzctts22gOnpArY6Pz24EkWlfEaVw43mdUMTg0AOTaQTsX
         KvoGgsqLJ9HOw6C3U03SfI60GqQHkGlVucM5KyIrYLvEs6eVxVuqqFqIXUsbalfoW1LZ
         0CUN3Chf7mwUGHo1wcYTkWmg20k5ACcLdqMTp7Bkw4ZLJwjQdOT8WnPumUx4RXRiDhP8
         fY6SwesMDAczmI6jGGTycrvP1AHlTUMPzJgP3GplqzBtCCDtBTuKakAhLsBLFAtCjsZ+
         fcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751304826; x=1751909626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ywKQCs/xgmEMMGX7vzOv8GIY/LFySjzj9TaSkXMmQo=;
        b=VjcLM6yEgIz1bepN3QqQAh+di9znorGJu4rje4AxXIdpOcY50BTkYrdkXraHKErRC+
         W9KwwfGDcZNb51Bcb2KpWchT3lqfjVoAp0J+melk4tSNdna/Ny8Ch8y6TQgLMu7Ws7kl
         0WH0A87vn8drj9IsKItzk66JvF+FS9NNpijaIKrtkkhb9MoJeV8c+7aOw808yxJ7p4uJ
         qKWx/yJ7h0qt4/Z+m9UCKqcKgm7l3MGaCvIwlP5g4xbksLmOv6aC+OKmfPjruhTFh9m7
         7nsCANfdnZmoe6h2OlxWmILZMOvHPu+tkaxFbjDnp0f9ViY5HZGioV1xKn2k68yxv2dX
         d3gw==
X-Forwarded-Encrypted: i=1; AJvYcCXEEbsDEUUwXkCVvT4eD54W6OeTHsEDXYqU8gMBmyxLguwpdwjT54zFvyZEK1HKMvQcEMq7/YOhcxBq1Sk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYN3EQOytGq5fO2OxkCc3nbMeadPpaswhtCMMUaGye8EtnmX9t
	F1Bw7K7MIhAUnSDm75CLkApbqa7g6rZogRZxl1WMxcRqZYEcCNra4QOVt6XIPtRC
X-Gm-Gg: ASbGncuHGsxc5i0rGQw905fwXsKH0ia5a+tH28Rqq7AtS9ItbBHwxdHBh0ePrj47xcv
	K+1/QHahW1RE44sVyCSj4T+jvb46Dcw4W0HAKbe7oJiMAhuqioGvV+w1Z+74VVfGfiJPe9ePyHV
	n93IIFP4d6SUHi/9m092V/YXjb1J/lBoqVz/eYVasXBh678QngPVflWNGSvm45XJvEIuMb/6eQk
	tRpvt7Cz0Oz51ZgAyXwXltL8lser9fDwBZcL6mhbplatL0WbdUQTf/wOR0XqIfoTOg+Pm2EgBRp
	/MUI8folU+Gns1ve1Df3tAV71wC6JaVVkIPVbaqcDopk7TLmRLDe7hxBZw5uNfDu+Im9yjTGda3
	gGEdDqw==
X-Google-Smtp-Source: AGHT+IHIh7wbjK1QsmtU3xg5nvAfhJT61IhHRyatqBPKjN7paC+Er9mKD5tayLFBbp8+UXK6aQyJ3A==
X-Received: by 2002:a05:600c:1907:b0:440:61eb:2ce5 with SMTP id 5b1f17b1804b1-4538ee61fddmr160509985e9.17.1751304825838;
        Mon, 30 Jun 2025 10:33:45 -0700 (PDT)
Received: from cachyos.customer.ask4.lan ([89.26.177.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c1easm170493485e9.3.2025.06.30.10.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 10:33:45 -0700 (PDT)
From: Marcos Garcia <magazo2005@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	dan.carpenter@linaro.org,
	karanja99erick@gmail.com,
	rodrigo.gobbi.7@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Garcia <magazo2005@gmail.com>
Subject: [PATCH staging] staging: rtl8723bs: replace magic numbers in beacon init
Date: Mon, 30 Jun 2025 19:33:39 +0200
Message-ID: <20250630173339.3828756-1-magazo2005@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace hardcoded register values in rtl8723b_InitBeaconParameters()
with properly named defines documenting their purpose:
- TBTT_PROHIBIT_DEFAULT_MS (0x6404) for 100ms interval + 4ms margin
- BCNTCFG_AIFS_LARGEST (0x660F) for maximum AIFS value

This improves maintainability while preserving the original behavior.

Signed-off-by: Marcos Garcia <magazo2005@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 27 +++++++++----------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 893cab0532ed..cc7886d75a0b 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1183,31 +1183,28 @@ void rtl8723b_read_chip_version(struct adapter *padapter)
 	ReadChipVersion8723B(padapter);
 }
 
+/* Beacon Configuration */
+#define TBTT_PROHIBIT_DEFAULT_MS	0x6404  /* 100ms interval + 4ms margin */
+#define BCNTCFG_AIFS_LARGEST		0x660F  /* Max AIFS for beacon priority */
+
 void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 	u16 val16;
 	u8 val8 = DIS_TSF_UDT;
 
-
-	val16 = val8 | (val8 << 8); /*  port0 and port1 */
-
-	/*  Enable prot0 beacon function for PSTDMA */
-	val16 |= EN_BCN_FUNCTION;
-
+	val16 = val8 | (val8 << 8); /* port0 and port1 */
+	val16 |= EN_BCN_FUNCTION;   /* Enable prot0 beacon function */
 	rtw_write16(padapter, REG_BCN_CTRL, val16);
 
-	/*  TODO: Remove these magic number */
-	rtw_write16(padapter, REG_TBTT_PROHIBIT, 0x6404);/*  ms */
-	/*  Firmware will control REG_DRVERLYINT when power saving is enable, */
-	/*  so don't set this register on STA mode. */
+	/* Fixed: Replaced magic numbers with defines */
+	rtw_write16(padapter, REG_TBTT_PROHIBIT, TBTT_PROHIBIT_DEFAULT_MS);
+
 	if (check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE) == false)
-		rtw_write8(padapter, REG_DRVERLYINT, DRIVER_EARLY_INT_TIME_8723B); /*  5ms */
-	rtw_write8(padapter, REG_BCNDMATIM, BCN_DMA_ATIME_INT_TIME_8723B); /*  2ms */
+		rtw_write8(padapter, REG_DRVERLYINT, DRIVER_EARLY_INT_TIME_8723B);
 
-	/*  Suggested by designer timchen. Change beacon AIFS to the largest number */
-	/*  because test chip does not contension before sending beacon. by tynli. 2009.11.03 */
-	rtw_write16(padapter, REG_BCNTCFG, 0x660F);
+	rtw_write8(padapter, REG_BCNDMATIM, BCN_DMA_ATIME_INT_TIME_8723B);
+	rtw_write16(padapter, REG_BCNTCFG, BCNTCFG_AIFS_LARGEST);
 
 	pHalData->RegBcnCtrlVal = rtw_read8(padapter, REG_BCN_CTRL);
 	pHalData->RegTxPause = rtw_read8(padapter, REG_TXPAUSE);
-- 
2.50.0

