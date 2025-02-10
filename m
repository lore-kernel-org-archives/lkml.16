Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CD41DF992
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187073; cv=none; b=lVTHdeGIVxGnuimY4u9p2/PGh5VTXQ5VYpfcDEmmv7qRhUXCKRDXhAwjJnTpv3xtzUkOeokckSiDVdH9VZ564tCOgN36VxsKlG32mdac/omPAwqxagcbZ9GbOAxou29CisqVXzcW6BXrNyjJt6CaU9/uO2cIQDoptc50NSprfas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187073; c=relaxed/simple;
	bh=fJkE5kTcRPfN5o51id50ad/pZh0hCeZeirsq8h3lxhk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KJvu2Ui1dglYHpVpSB5YH1Z4XqzK5HrdSikyW+j4FMwKgQh0DYdcmS1Zd4zv3cMcny8SA9mHW4kXmkEsSDb2sKPA5HOSkuOjdocpTP2e1V2c5AZNKQPevHRD8goFpddCxJFz330fBaJWQCh5C+D/s2eZfvLHsWbDlUwd53iDon0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c9Ja7ZSP; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c9Ja7ZSP"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38dd935a267so1120333f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 03:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739187069; x=1739791869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lzHw714PzF5qAtLwyye/sMwRzBfQHNnYhqs6NaSr+rg=;
        b=c9Ja7ZSPhaIEIOE51GpEwNa6a3QUll5a0nxyQ/2smRL2bCr12kXvZ1m3AAm55ph7Fx
         bNiKGF90vamzZo71j9DADF2UPZ7FMvZ81RmtFTR69zgNpFrbHQE0KikDjI7XKYPFYelW
         S9PfLlaudOTTbrcWngUEOZxjOm3TgdM3bAxVjPlP9f5HLMIu1rxAyYTrDRU8OOLBxFJz
         c/B/jTLfPLScpBnfkBAJfPZWO9KWzHCt1eWU7JTvknjEWet5eS4H6rjDAnIEiCcAioIZ
         mzwNvDMKsiRolnqUz0lrIp8krwEfVQCQ8OhecYjF2GtkS30omRUbA5HavnGq1Uvua4gM
         u0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739187069; x=1739791869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzHw714PzF5qAtLwyye/sMwRzBfQHNnYhqs6NaSr+rg=;
        b=V/O3xf4HtifITz7X1XeqBLYMIx3Wmoi8+UXb0umwYEHDaGOb8vc0KRGo6RaZqTe2Yr
         EkyhmCXphVexyg9W/DYguGPnONuac0nq4IoFgBTFPKKK0ML9e1CoP+5ybk19glkGf9th
         jq6EDqlqTg0Niboed6a1XUZ6dUt7oT+WSIrLLL1BjH7JcwF8+Ece32puFqGlFAU6uSk4
         tTQZe58mR5tDxQ2Z562UIom1rjudtzRZwhUJa26VkrytYg/LtGeCQBJoyPTjmScbUkR4
         LAuu8pDVMbsqDSxHaaPQFUyrLsTo7hqVhRjdGbuw72ILhe17PEWxwsmALd6Q99zZeCRk
         g7ng==
X-Forwarded-Encrypted: i=1; AJvYcCWKKqS3XwZABZqEUmTqcN0KnwEa+dOtrWAJaK3er5k7p6dpMPlvg7y/mMKol0XN2dC7G47j4U3pZRLE9o4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyygLeDTAuF5lft+HANGqYytF+2Ei7TnCLfhiISNOzZaUEre6oE
	GM7p8wyAIWI8Lnsl+CRUR1rR0wjNLFycH/KW1yYoQgy7wB59hR6xEacg8A/1JBU=
X-Gm-Gg: ASbGnctbob16nuEsHuFvi+nmEfp4GOiW7TvgKiZHVK4Suc/hjfbVYJ2LfjauelnODTd
	tPCxaifBvUiElP7JxrlncQr+0UbNjn8tFlz4auBdKJrrI68hYjPpsKd6LRhw06efZAS+6yL8Vu8
	noKTAiVLyIEosIJjRS1n+jr/PRmav/aRlpkDdtrNJYYs6/oOKGadLyTbxtNPHm+kloel537iHiE
	cwbOR8P+C1PW8QzLgP542VIhsemKdgc+/cSN2MDFhKdVZLr845tfyjAUJwksIzuY+4qkJ5pDgrC
	p9VORpRlNWqV0m6e
X-Google-Smtp-Source: AGHT+IHKcL4ZL3Lp7yWuGRAHIS1vVg/lf60vesFvPUVhRkXB5Nb1+tzm4zRQXrtnLLUgCVs9ciXSrA==
X-Received: by 2002:a05:6000:1a8a:b0:38d:dfdc:52b6 with SMTP id ffacd0b85a97d-38ddfdc5416mr2178948f8f.37.1739187069584;
        Mon, 10 Feb 2025 03:31:09 -0800 (PST)
Received: from pop-os.. ([209.198.129.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc672b55bsm10302764f8f.79.2025.02.10.03.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:31:09 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm: coresight: Finish removal of Coresight support in arch/arm/kernel
Date: Mon, 10 Feb 2025 11:29:26 +0000
Message-Id: <20250210112927.623872-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 184901a06a36 ("ARM: removing support for etb/etm in
"arch/arm/kernel/"") removed asm/hardware/coresight.h which is included
by this file. Therefore this is dead code so delete it.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm/include/asm/cti.h | 160 -------------------------------------
 1 file changed, 160 deletions(-)
 delete mode 100644 arch/arm/include/asm/cti.h

diff --git a/arch/arm/include/asm/cti.h b/arch/arm/include/asm/cti.h
deleted file mode 100644
index f8500e5d6ea8..000000000000
--- a/arch/arm/include/asm/cti.h
+++ /dev/null
@@ -1,160 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASMARM_CTI_H
-#define __ASMARM_CTI_H
-
-#include	<asm/io.h>
-#include	<asm/hardware/coresight.h>
-
-/* The registers' definition is from section 3.2 of
- * Embedded Cross Trigger Revision: r0p0
- */
-#define		CTICONTROL		0x000
-#define		CTISTATUS		0x004
-#define		CTILOCK			0x008
-#define		CTIPROTECTION		0x00C
-#define		CTIINTACK		0x010
-#define		CTIAPPSET		0x014
-#define		CTIAPPCLEAR		0x018
-#define		CTIAPPPULSE		0x01c
-#define		CTIINEN			0x020
-#define		CTIOUTEN		0x0A0
-#define		CTITRIGINSTATUS		0x130
-#define		CTITRIGOUTSTATUS	0x134
-#define		CTICHINSTATUS		0x138
-#define		CTICHOUTSTATUS		0x13c
-#define		CTIPERIPHID0		0xFE0
-#define		CTIPERIPHID1		0xFE4
-#define		CTIPERIPHID2		0xFE8
-#define		CTIPERIPHID3		0xFEC
-#define		CTIPCELLID0		0xFF0
-#define		CTIPCELLID1		0xFF4
-#define		CTIPCELLID2		0xFF8
-#define		CTIPCELLID3		0xFFC
-
-/* The below are from section 3.6.4 of
- * CoreSight v1.0 Architecture Specification
- */
-#define		LOCKACCESS		0xFB0
-#define		LOCKSTATUS		0xFB4
-
-/**
- * struct cti - cross trigger interface struct
- * @base: mapped virtual address for the cti base
- * @irq: irq number for the cti
- * @trig_out_for_irq: triger out number which will cause
- *	the @irq happen
- *
- * cti struct used to operate cti registers.
- */
-struct cti {
-	void __iomem *base;
-	int irq;
-	int trig_out_for_irq;
-};
-
-/**
- * cti_init - initialize the cti instance
- * @cti: cti instance
- * @base: mapped virtual address for the cti base
- * @irq: irq number for the cti
- * @trig_out: triger out number which will cause
- *	the @irq happen
- *
- * called by machine code to pass the board dependent
- * @base, @irq and @trig_out to cti.
- */
-static inline void cti_init(struct cti *cti,
-	void __iomem *base, int irq, int trig_out)
-{
-	cti->base = base;
-	cti->irq  = irq;
-	cti->trig_out_for_irq = trig_out;
-}
-
-/**
- * cti_map_trigger - use the @chan to map @trig_in to @trig_out
- * @cti: cti instance
- * @trig_in: trigger in number
- * @trig_out: trigger out number
- * @channel: channel number
- *
- * This function maps one trigger in of @trig_in to one trigger
- * out of @trig_out using the channel @chan.
- */
-static inline void cti_map_trigger(struct cti *cti,
-	int trig_in, int trig_out, int chan)
-{
-	void __iomem *base = cti->base;
-	unsigned long val;
-
-	val = __raw_readl(base + CTIINEN + trig_in * 4);
-	val |= BIT(chan);
-	__raw_writel(val, base + CTIINEN + trig_in * 4);
-
-	val = __raw_readl(base + CTIOUTEN + trig_out * 4);
-	val |= BIT(chan);
-	__raw_writel(val, base + CTIOUTEN + trig_out * 4);
-}
-
-/**
- * cti_enable - enable the cti module
- * @cti: cti instance
- *
- * enable the cti module
- */
-static inline void cti_enable(struct cti *cti)
-{
-	__raw_writel(0x1, cti->base + CTICONTROL);
-}
-
-/**
- * cti_disable - disable the cti module
- * @cti: cti instance
- *
- * enable the cti module
- */
-static inline void cti_disable(struct cti *cti)
-{
-	__raw_writel(0, cti->base + CTICONTROL);
-}
-
-/**
- * cti_irq_ack - clear the cti irq
- * @cti: cti instance
- *
- * clear the cti irq
- */
-static inline void cti_irq_ack(struct cti *cti)
-{
-	void __iomem *base = cti->base;
-	unsigned long val;
-
-	val = __raw_readl(base + CTIINTACK);
-	val |= BIT(cti->trig_out_for_irq);
-	__raw_writel(val, base + CTIINTACK);
-}
-
-/**
- * cti_unlock - unlock cti module
- * @cti: cti instance
- *
- * unlock the cti module, or else any writes to the cti
- * module is not allowed.
- */
-static inline void cti_unlock(struct cti *cti)
-{
-	__raw_writel(CS_LAR_KEY, cti->base + LOCKACCESS);
-}
-
-/**
- * cti_lock - lock cti module
- * @cti: cti instance
- *
- * lock the cti module, so any writes to the cti
- * module will be not allowed.
- */
-static inline void cti_lock(struct cti *cti)
-{
-	__raw_writel(~CS_LAR_KEY, cti->base + LOCKACCESS);
-}
-#endif
-- 
2.34.1

