Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC641990D8
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751301910; cv=none; b=ZHAFVfLpDA2JZEu5/7w+ohIF4c98Ud/KIT0xaHkAWBnJiAUAYLWvuctx/85wRJd7oW+vNpCJgTxM0adEox8UBT2hl/VxFrnP6QSGmrFMe+mfHgu0kzcxzqMxPp6lBwBfh3wwR2/5Nda+lst/Ms+sITMoUd7KPasezw/rmZ2AzCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751301910; c=relaxed/simple;
	bh=iimtPmkJqIHY8+CdbyQ4Ml4IiC7bXO6UI6DKoOfU2ek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D4yl5dYJbRNBc7eVfcD3ZvVJr+TX0jOwZ7IMBZQaRjli88S2mzN5C98iPGH17WpKx7k9vHTRhtvR61TrdV5ulDtEffHS/DJYALI8Bh0Ra1078kTa9ebXhtFDPq8+1WqSa/9mELLZjYkbqsThicsuVqd5MOSHHWu5XLCav8VdN6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIMOWIph; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIMOWIph"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so39232395e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751301907; x=1751906707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F28rxWH3aEX1Ni166QzFcf8v6CigBxTZA5+HuNofQDQ=;
        b=DIMOWIphlDH5kELQr76EnVBOEfFBOS5l576eIqaK2/hXF3BRocSNASRNHt/jgfyFXY
         0vbTLOKxCUILMy4k1Cw5FD+TaviIxXcTbIYNW5hShctukUBdcevUA8qxD6dtvMa9cINM
         fNBEshSvhNP4VBKtFO0UNg8wZDwKTJeXYgVBysL8pKfhs7EQ+2FBr3Fdb18p/UZioGAx
         RAxkFCnM/vKaSasrnBrooRx9xgIe6jwyjLmS5axk9Wvu5euYCKE8/6k+Ma9ps7NYVJWF
         8smucVsBH11wC+R+AAqjGlypmFiATKNy92DkCk7Qh4+R8OkyuUkRtnECuGjb0PoVWp6T
         6zxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751301907; x=1751906707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F28rxWH3aEX1Ni166QzFcf8v6CigBxTZA5+HuNofQDQ=;
        b=l3EM5K3k3mCNImnouCjRz/GkHdcR2gvahywUkGTgWM44s4oIpxr2qfzIiG32vl2ii3
         Fnh8kpEgi8ZQ5D3h22PGoJ+9GI/4b1X9MWhHq85Ixq1Fg0l+5BZ7PYZgZFt0Jr+2sYGs
         t4vWJgjuqJyNN3WfFfqjOzGKK9WgEMjLi01wpJ0uIn1tDHG8sYHQpWND0jR6Asvq7wZN
         U6qyfrbg4KYrSRmUxnpS+2OUzBW4xUdJEzmkXRQbmhqR4SrwLVqeinWozPmHiVkMKBiz
         j+qJ3Vo822IFzMaTsSvuNavy3bcEju0hDEAcXQ/jBfa9QOUk+wKAhJF3Sw1oMIx8j6H/
         BVEg==
X-Forwarded-Encrypted: i=1; AJvYcCVtHJdbKqZxUlF6YrF16nz/QVfaEO7OsAngA9xNsg9+ZRGxI44TUAQv7iP7knH8Sp4O9it8XqNfJeZRcdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLD1aSd/gIwChpTk5RZongS8vxOibuQaJyWkaZNwkQ/Gikj+cf
	2MHh2Bw+BTEOczPgk8CMaY4TOROwyCOphs88X/UE0UOgAL2EHnPI4/dc
X-Gm-Gg: ASbGncsV56160uf589YrNQEb6xzlAqS8U5l7k7D4okfnA4EArueiQjeqrX8v46n4/yp
	z+wcGxxMMFZgWm5s+pg2A4ZXG+dSL1wTOnqiOxh/5nXr0nrRvuPKNO0CV0Jj7Gg4irROYQlNEmK
	lv9WVPvZJVUU+frtExx7oiEamR3yKLnEIqlNPLKRxVCshTGNtTKuan07fpXyVB/SIRoH3gILYEW
	lrv8MTBCkpr5+5MobxMEUrDFWdwjyaTD2UoZkMY93BFGyH59P2yG48wqW65MaDO63kjXu7xMr8r
	NVs64pg/bLqTr1dhTuZm3WS5bd5vlwpqcDw375iTMxr2yeoLKmI39ZQpO+SY9ES1ottuezA0mi7
	3WBOWn7Xazp3Gf35dO1s1eyY9rckBe+vPVXZJi2LW9ZcmtCk/Q2QFPJaWGDllC8sNnEy8O7O031
	3v2SdiYkAehJp5kOvq7wzVRjDRJacG78c=
X-Google-Smtp-Source: AGHT+IGtyZLJV5JuzoD1aAP4pupePO809LEum7y1pGUADJm5kY6rXHP/OKEUPGNjWu1MRkJBKyKxYA==
X-Received: by 2002:a05:6000:4b1a:b0:3a4:f6d6:2d68 with SMTP id ffacd0b85a97d-3a9186574femr13158325f8f.56.1751301906524;
        Mon, 30 Jun 2025 09:45:06 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a892e52ad2sm10731959f8f.48.2025.06.30.09.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:45:05 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] reset: brcmstb: Enable reset drivers for ARCH_BCM2835
Date: Mon, 30 Jun 2025 17:45:00 +0100
Message-ID: <20250630164503.399835-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BRCMSTB and BRCMSTB_RESCAL reset drivers are also
used in the BCM2712, AKA the RPi5. The RPi platforms
have typically used the ARCH_BCM2835, and the PCIe
support for this SoC can use this config which depends
on these drivers so enable building them when just that
arch option is enabled to ensure the platform works as
expected.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/reset/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d85be5899da6a..43151d12f88c3 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -51,7 +51,7 @@ config RESET_BERLIN
 
 config RESET_BRCMSTB
 	tristate "Broadcom STB reset controller"
-	depends on ARCH_BRCMSTB || COMPILE_TEST
+	depends on ARCH_BRCMSTB || ARCH_BCM2835 || COMPILE_TEST
 	default ARCH_BRCMSTB
 	help
 	  This enables the reset controller driver for Broadcom STB SoCs using
@@ -60,11 +60,11 @@ config RESET_BRCMSTB
 config RESET_BRCMSTB_RESCAL
 	tristate "Broadcom STB RESCAL reset controller"
 	depends on HAS_IOMEM
-	depends on ARCH_BRCMSTB || COMPILE_TEST
+	depends on ARCH_BRCMSTB || ARCH_BCM2835 || COMPILE_TEST
 	default ARCH_BRCMSTB
 	help
 	  This enables the RESCAL reset controller for SATA, PCIe0, or PCIe1 on
-	  BCM7216.
+	  BCM7216 or the BCM2712.
 
 config RESET_EYEQ
 	bool "Mobileye EyeQ reset controller"
-- 
2.50.0

