Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F092E975D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 15:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750953169; cv=none; b=QOBG5OybEa5IyUPsX7PvCnjbSLk0GpZ0x+6dgAN6GXRL1AxVgsO5B2yFHTC6LnjxfBoH4V/RxD4CEFQKHtZrdYnd0qCORaUUgvWQu9LuiRuXlcDG5hp/pnxMP6I+l8veosBKjzQMolpsG5nrrBwPryC7mEegWYNZSACCquX2G98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750953169; c=relaxed/simple;
	bh=gNM3wQaBBbnyIngzlgJtIUvAVt+q6LxQbXR0uN0ZQV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ATs0NiAyh6268AbUpaMSYojXW+vpqZyFdPZuc1Uq5Pk+EEJW2c8kKDXpA7PlbVXftr9FSKjlbCpvZ5xhcBlh4+j6e228yRS4G7oCQtvHlRst4phrfBLlq2p5NMGH6pWFPBOXUZu0LlCKO43estUDJr4BXigy8v3l5egmSUGTWjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S26VlKwP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S26VlKwP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4538bc1cffdso6575535e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750953166; x=1751557966; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h4rSgnjxP4Jl4YQedEUkUMwPTvSymxpcZHbvWUX0jis=;
        b=S26VlKwP4ut5JH2OLj0MGnMGagPEWvx8IUf3M8WELJzX+44e0JyToWdKEDFLgm0V8i
         41OZySS52sW0awCgEYHrbuARC/LU0khPlgOF2PSCIYOANHDdE5oHjq4mysScD0fJqCaZ
         yrLZRWkprA39q3gAaVbmS+35cvWc2gqGdxvmhAISkpQF0Nqe2HN+iPra3BcgBkVdjzNb
         LD7P75Mc+kssjxbUL8QECmACt0lmXBY3uEAOUCQddv/x/hqhmUCRqUW9ZAaltJqo1E2g
         4rF72L54xATkyX9galvQ6Nj+oef+UBHhQT+zY8jA7GUoGAio3RhJCyklQcqmy6FuYRaE
         XGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750953166; x=1751557966;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4rSgnjxP4Jl4YQedEUkUMwPTvSymxpcZHbvWUX0jis=;
        b=hjYxhQHxCmt4EmSlvMevdR2YvFifyvckN5qIxjkh1xGbmkswGSed1qLX5LYQSxTsB+
         pe9alTFN03y2MXNr6q8wXLAQf761FRdVrtEiM8vPd2Fnjx/VRPcy6VS4e/xQzGwYssLN
         MpxSuhjMSBLgtwsxEvIwcGX3YmpnZbUFeMqRQ0Ysz70co6NRmC9L47bFH98N+MSoLHwF
         sZtkjLP5e51uOx+6YJ6tZTFb20HA2Ugs0/eHK2MhPfWY2ihmA8HEh6mMbTiqbnhcq/7L
         nqGxiLhDTGGDTUqK27BjB8u706dutmC82H+T1bvdxMEcZM3uhNxWk7J3N5V4vshTv/07
         Pz6g==
X-Forwarded-Encrypted: i=1; AJvYcCXj0E7Wc+4Hx3LP5Mp8mcbXNmWFTJH4MYH19K17J2hmd8lWV5ipLtKLEF7YM/WfknGACJyd9QVeDxp5+Ic=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaCNWLmoLHOuRQ0uarlHKF0nGD2f/YlWjyAUWa3wa6Q8NNpSzs
	OH04Vsm3bIZcZUwxFb6PvCJFW8gHALxP9YoO9msj3N9ObfIq0Y44Lc6J
X-Gm-Gg: ASbGncuEhDoSfCog/s5r0QdXR7BZrvw5u2cvvg9a6MJ6uKlBqXe8M4LF8Q+Qornucpi
	8rMaGMP8VHYVLrW7kCWYjXfkMKO4UghwsHMNhjoZG9SBIohdBS0K6ngtOYMRCmb26pi1/7FE4+x
	gOszPsiRCVuqZ4zoPV919XYnNHy7qATv8+18IEm2hsow6TDwAze2jVn6aMKhiQ7sLBjocTyxFYy
	5dFYYT403W24YhU9hYGCWTGUrn4BrePtRavUtm4Gcmgm6SSxfi4ZgbQSZVjdJzVZW91wNT3JWV7
	I7ucE3Zuhq1Q072I4W+rkYqpnzngs6Aheaw+M7X1zDQ0D/blv7k8NgqUq/VWf3b5LJKJUT3N8rv
	velk108n9tp8g/uk=
X-Google-Smtp-Source: AGHT+IGLokT5hrdJinbTDygdkXq8yB9JdsTfPO7+U2W6y/CtQlSeZCVBi7dKVX1Pux15zvWBbBQHgw==
X-Received: by 2002:a05:600c:c0c9:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-4538267ab48mr67938645e9.10.1750953165678;
        Thu, 26 Jun 2025 08:52:45 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-453823ad247sm56241735e9.26.2025.06.26.08.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:52:45 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 26 Jun 2025 17:52:39 +0200
Subject: [PATCH] mtd: nand: qpic-common: remove a bunch of unused defines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-qpic_common-unused-defines-v1-1-e31c9e2074c8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMZsXWgC/x3MQQrCMBBG4auUWTvQBhLQq4hIzfyts+ikZmgRS
 u9ucPnx4B3kqAqnW3dQxa6uxRqGS0f5PdoMVmmm0IfYp5D4s2p+5rIsxXizzSEsmNTgPKSAeB1
 fkCjUBmtt4fuf3x/n+QNujyDHbAAAAA==
X-Change-ID: 20250626-qpic_common-unused-defines-162e59abed5d
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

A bunch of definitions in the 'nand-qpic-common.h' header became
unused after the conversion of the 'qcom_nandc' and 'spi-qpic-snand'
drivers to use the FIELD_PREP() macro, so remove those.

No functional changes.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 include/linux/mtd/nand-qpic-common.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
index e8462deda6dbf61f99bbcb39e7cb12cdf66898fd..aa9c5195dc5dde943f4ab23be32d7f900cf959c0 100644
--- a/include/linux/mtd/nand-qpic-common.h
+++ b/include/linux/mtd/nand-qpic-common.h
@@ -71,14 +71,10 @@
 
 /* NAND_DEVn_CFG0 bits */
 #define	DISABLE_STATUS_AFTER_WRITE	BIT(4)
-#define	CW_PER_PAGE			6
 #define	CW_PER_PAGE_MASK		GENMASK(8, 6)
-#define	UD_SIZE_BYTES			9
 #define	UD_SIZE_BYTES_MASK		GENMASK(18, 9)
 #define	ECC_PARITY_SIZE_BYTES_RS	GENMASK(22, 19)
-#define	SPARE_SIZE_BYTES		23
 #define	SPARE_SIZE_BYTES_MASK		GENMASK(26, 23)
-#define	NUM_ADDR_CYCLES			27
 #define	NUM_ADDR_CYCLES_MASK		GENMASK(29, 27)
 #define	STATUS_BFR_READ			BIT(30)
 #define	SET_RD_MODE_AFTER_STATUS	BIT(31)
@@ -86,24 +82,18 @@
 /* NAND_DEVn_CFG0 bits */
 #define	DEV0_CFG1_ECC_DISABLE		BIT(0)
 #define	WIDE_FLASH			BIT(1)
-#define	NAND_RECOVERY_CYCLES		2
 #define	NAND_RECOVERY_CYCLES_MASK	GENMASK(4, 2)
 #define	CS_ACTIVE_BSY			BIT(5)
-#define	BAD_BLOCK_BYTE_NUM		6
 #define	BAD_BLOCK_BYTE_NUM_MASK		GENMASK(15, 6)
 #define	BAD_BLOCK_IN_SPARE_AREA		BIT(16)
-#define	WR_RD_BSY_GAP			17
 #define	WR_RD_BSY_GAP_MASK		GENMASK(22, 17)
 #define	ENABLE_BCH_ECC			BIT(27)
 
 /* NAND_DEV0_ECC_CFG bits */
 #define	ECC_CFG_ECC_DISABLE		BIT(0)
 #define	ECC_SW_RESET			BIT(1)
-#define	ECC_MODE			4
 #define	ECC_MODE_MASK			GENMASK(5, 4)
-#define	ECC_PARITY_SIZE_BYTES_BCH	8
 #define	ECC_PARITY_SIZE_BYTES_BCH_MASK	GENMASK(12, 8)
-#define	ECC_NUM_DATA_BYTES		16
 #define	ECC_NUM_DATA_BYTES_MASK		GENMASK(25, 16)
 #define	ECC_FORCE_CLK_OPEN		BIT(30)
 
@@ -118,7 +108,6 @@
 #define	SEQ_READ_START_VLD		BIT(4)
 
 /* NAND_EBI2_ECC_BUF_CFG bits */
-#define	NUM_STEPS			0
 #define	NUM_STEPS_MASK			GENMASK(9, 0)
 
 /* NAND_ERASED_CW_DETECT_CFG bits */
@@ -139,11 +128,8 @@
 #define	ERASED_CW			(CODEWORD_ALL_ERASED | CODEWORD_ERASED)
 
 /* NAND_READ_LOCATION_n bits */
-#define READ_LOCATION_OFFSET		0
 #define READ_LOCATION_OFFSET_MASK	GENMASK(9, 0)
-#define READ_LOCATION_SIZE		16
 #define READ_LOCATION_SIZE_MASK		GENMASK(25, 16)
-#define READ_LOCATION_LAST		31
 #define READ_LOCATION_LAST_MASK		BIT(31)
 
 /* Version Mask */

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250626-qpic_common-unused-defines-162e59abed5d

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

