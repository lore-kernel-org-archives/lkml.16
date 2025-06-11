Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9D0281357
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646851; cv=none; b=u1E3G+i0u/uCfEtvlyvFnHEIWiDOqygEtFcGK8zRf8v2NpMPkSp8khD/v6obQZ0bYiF3yrI6DugbYvZCQvjgBU4oWgGo+FQhKXalGfT1KH8ntVsr/vEtW3iWo7tkFj3FJvd5Ez601R0r0FBQIRLmyT5f0zBRa+h7SgbAVT5MZ1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646851; c=relaxed/simple;
	bh=BsrvoibobNdRj5bx2FV7FFPriwpl6oIPTWKF+TJb8js=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IUMcaaFjtX8Mmrr+iKAAtufvFhyLibefHuPM8zkKd7BWdnoatjc9Uepdy+sA8pNq46n3HJVQ/k5oGB42EbFZaFac3VDAkKnsLffeCCw6b6+kaLHSRKKGK9pTxSr9/qkOXAIy/+HVVFY1NC5UhzoRiHY7jcAapzx6FNks4rJHirE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=eS4L6Oud; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="eS4L6Oud"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234d3261631so46468805ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749646849; x=1750251649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3Hj23NsfOD62jCqYZdTyo05Iy3n4LV0OoIjBt95NQs=;
        b=eS4L6Oud2XZqymAcK9cWsBA58MUdJwHnOAKjUBMAHBedEb/rJsHMyAqwAfCZYxGCbw
         ohON8Qudxhb4TmZVqYjp6hjl7GBOvILNAq1kOgSpMPlubG9zbr466afYz0IVzV6vb3Ge
         Nc5deyJkuuARgIuoOlErfV9TSAxQ/sBfLJHVcF3G9GmaP+egEhtPEe3BDj6MaejoCTbI
         DU26bIZ05CwEU6XjocTZgjGP8by9JeSWbOHsgMA9j3WbXPKoqi5WGWhtxoP+tjhDOk5u
         cX31cpD3oHAbSqq2aR7gCB4Vk7G2YEJ6w1LtmC/Kxf10QFv2a5QvF/l/6HsNKxrCyB8+
         kgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646849; x=1750251649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3Hj23NsfOD62jCqYZdTyo05Iy3n4LV0OoIjBt95NQs=;
        b=QNy203NEYHJN55fZbw4I6d2RnSVRiL3ad6Fo7tF46b5vGrCyzMRyRGR77a0FaNs2R8
         3LolNvFYgNUZMMQG/R6ucc+j2eVDF4MjrdZuaulGmfXAZzGfnRz6L6FdbUVnmtKMiH+0
         Rlsg4XsgyBVO2UBMn0+AYFpYy6j5RSoug10x7LV2bsI63W3B3AMf9duaRKRTdmVEVS92
         LTkge57yevGQpqxN0BWZXcBfj0ey7uR8QvM/V585lIBtMzg2ZhH6SF9WA6b2qiROn4tV
         bJYMfXdtiF5LawByEA1MIolxPLA6+kKvDExx92TKEuNVuDgXpABl1r6737SRuwoiv87h
         ZFQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgpB072PkqSgKJyaNVKlMDT2+nIgrtfOoD6EXoFK8yp9FtNTyUD8ycVqbQaKuZGOvVYNJJE5z397iBtk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgsA7mtuYjbY5JeRsxlsLcm3KlKtc2dou5DTAS2MpDQnxBG8zf
	ov8ZsDrap0txZg1OUoS04oLk9Hmz4dSjV2dd1dEZTH/U37BNhx93mk46MFSG4KO+lbs=
X-Gm-Gg: ASbGncvcwXToPgmWZ4So5TClwAbtxDe/qpZPUrsEZhCahQ49E+LK6beEKzodr8ZmDMy
	0g20qxSUf3S6fBx309rc7wOBnMJBeLUCldSoEJbgXIBcxRN+jYST1QmZPqU/9MdNNs+WZfKNijD
	2H30qPTrJvQo4FiraZe0ABwOFvF4tronxz/u3zaMPFxxFe4soatitIns+1BobdzC/rgqNd2+mo0
	m9cwUL/CWiPSrp9P/ZZR6kAxbj9AMQPrGko7koijWLTiejXKc7FaA09rWcauFbohSDy7b7MpRcF
	rQrEzbk6j1KhbJBNoUj7qtGnDB6eu0g9xi0IeTGobU8+wpIjZ4H+Oguy/eNca0xegSG3VhldIIW
	09Q0E85PKmeHOA0s8atsa2w==
X-Google-Smtp-Source: AGHT+IHVBo9LkzNee2JKYrKdwtZHZLkreGBOXP7vX/U81FjBHvUbwcdU17sovy3MyAgANjjIbprzmQ==
X-Received: by 2002:a17:902:fc85:b0:234:d1f2:da31 with SMTP id d9443c01a7336-2364260d38amr40073705ad.2.1749646848615;
        Wed, 11 Jun 2025 06:00:48 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:31a4:6520:3d67:ceb1:7c60:9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030925e3sm86984115ad.53.2025.06.11.06.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:00:48 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	emil.renner.berthing@canonical.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	joel@jms.id.au,
	duje.mihanovic@skole.hr
Cc: guodong@riscstar.com,
	elder@riscstar.com,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 7/8] dma: Kconfig: MMP_PDMA: Add support for ARCH_SPACEMIT
Date: Wed, 11 Jun 2025 20:57:22 +0800
Message-ID: <20250611125723.181711-8-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611125723.181711-1-guodong@riscstar.com>
References: <20250611125723.181711-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the MMP_PDMA driver to support the SpacemiT architecture
by adding ARCH_SPACEMIT as a dependency in Kconfig.

This allows the driver to be built for SpacemiT-based platforms
alongside existing ARCH_MMP and ARCH_PXA architectures.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index db87dd2a07f7..fff70f66c773 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -451,7 +451,7 @@ config MILBEAUT_XDMAC
 
 config MMP_PDMA
 	tristate "MMP PDMA support"
-	depends on ARCH_MMP || ARCH_PXA || COMPILE_TEST
+	depends on ARCH_MMP || ARCH_PXA || ARCH_SPACEMIT || COMPILE_TEST
 	select DMA_ENGINE
 	help
 	  Support the MMP PDMA engine for PXA and MMP platform.
-- 
2.43.0

