Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AC82DECB2
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814921; cv=none; b=fyNMoGy2ApUvpGYqP3XAnnkgpR+sAeyrKjvDjxj2ewZt9d/JnXlgnSV0EQy2vE3oia2E4GHb2SsO+k72MsuTBrxrhfF4zkyEKChDc/UPAoYmh7NgkoWaEMJ+d7CfcsSYg1Xd6SC0A4P5Gv7qLSRwczOGwGZsCxiTEtCcEG7GoRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814921; c=relaxed/simple;
	bh=Jkh4xI1xZFk9y2KS3JrFZenLMgrJyYczEnPNCHPbPOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t1E48z6O5yjNXZ06W5E9iWNOdKpu+c6ivX8S81Npr7sOuSR+WKmP6JRtJ1T1nzyIYSKl8NPr1ldV17inUEcIa0it76Tfcd7XEBNiaA4xjuTZKYBy7U+1dL44MBfD4m4013nQ6vkTfrFF8uufFOzfslsfM9OMe98+hCSR/Frc+lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=qHGBdf+Y; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="qHGBdf+Y"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6fabb948e5aso22538346d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 04:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1749814918; x=1750419718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gog1CrvxeaBvJs1XxgKi+JJwPn/cN8uX820mkK4YWuU=;
        b=qHGBdf+YjtcW4VY5lZTmf053Vg490Q4jam7CAqIXI8Ly4eTAIxvAiU2lz3NmHvEPBK
         PHlo6RcyJIRFBYVBa1kYLG6z9NjqOdC/coMqD1/VgzkkNp/KFqBIJQV4wGWCu0DeBuYE
         EzyUyepGwVe1TmA4XYFbsEcfjwxmKj8EXHyaroZ3XUIslxIX6I/QP/F276iOpl9T7gP7
         WBRoGLkhNcOPIcZ7HuNqRRzrpWzmZVFn96Ej/uHYOXFIH39jmJt6p19YEX9xULozQQjW
         sFkDMdXUNogsPypUwxUuTWDIt/0tTtj5thFVWSnh9awILgD/7QbnGrRy8tUNHx7KygMz
         vAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814918; x=1750419718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gog1CrvxeaBvJs1XxgKi+JJwPn/cN8uX820mkK4YWuU=;
        b=aE73lK0SlKYZO67Q2jDCogpgek7JjOuHqtdbZ5WLpvIyaMhGYYnbwq2bb9uxU2lgUu
         UufqYW4uTz0EIp1ut1qKtWi0BglRKfTVcGmamilRbe9F6pEkBdcoyJOJ7+cD1XAXKm+Z
         st38ZIqYG47GLj35keyxVIIuvJS3/ZEM6vqtbC4gy4hC3dWCOfznnlVtfR7pdexLeIvU
         FMVDc7SeDarZogg4N7r5cpV7I/EkUZWkBblOioibovrZqtkhVXXG3mcJA5wGf0yrxzZm
         +iW+ZJu9wGdaIHkTpMoWPmKW+H8aEPscLd/ItD3aOWm+xtg7XqYPZ2dU5D7cVJerdkWH
         fshQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeEbjkBpA5jUUvt3Nz85P00G+KBKOGNOEVym1vkv2TEAQnWWEN2v/EfoAeRE9qWEoh1yqDPDlPBjRqjM0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/DVxK1HY9VZL7soxhMjeWti32U14RLiXQ3RoV0SvgNe4CVqsD
	KQN1J80hf4VsyIGGo4MkexVnbKMrc0pe9o30ctJjTpDj+Adsj+vNJF5o1x5cucyt4TY=
X-Gm-Gg: ASbGnctsjOggIO9tRsKT8gJ+Q2+oydRBE3Rqw0hhn0XUAM3O3yvuGqai44FTEkMRKa2
	U9mk7LT7+Kik0uGmuf1WIBJpA0tzC5h+gjuVkI6ETGKntGVm1gJaw1ff3+PRv6Ps3X4kVkjsedm
	YQr+0xVeskDPtlCq6wVOEgvJr5beXGG18p3X3msgj6ut1Zl11f/j/f0T+ClHyh6TyOYIuHboEgC
	0pKR/lj+jhfN3fxNJfInpr3k1hDkqYDeZdWiA4K6/0JTIWnZYeK6eobl/kbHujcURzRnfkrcFC/
	Pzm+a7Q09ACPSfnkOhXEQdrSkgAsUMHacNCCLO5N46m539ISXK4oPqxDxGlSxzDbXW9G+0OKh8w
	dX4Qe7DWR71kntOHuOZGyFg==
X-Google-Smtp-Source: AGHT+IHFfRslU2JdUQwTEst4+2qv7pFwoUnipsx+0jTm3bc3ZWeEjmqIo+cvUGJbAhVMc0O3WiescQ==
X-Received: by 2002:ad4:4eaa:0:b0:6fa:cb05:b455 with SMTP id 6a1803df08f44-6fb3e5fda72mr39185896d6.35.1749814918080;
        Fri, 13 Jun 2025 04:41:58 -0700 (PDT)
Received: from fedora.. (cpe-109-60-82-18.zg3.cable.xnet.hr. [109.60.82.18])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6fb35b3058fsm20558206d6.37.2025.06.13.04.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:41:57 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	ore@pengutronix.de,
	luka.perkov@sartura.hr,
	arnd@arndb.de,
	daniel.machon@microchip.com
Cc: Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v7 1/6] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Fri, 13 Jun 2025 13:39:36 +0200
Message-ID: <20250613114148.1943267-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613114148.1943267-1-robert.marko@sartura.hr>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the Microchip LAN969x ARMv8-based SoC switch family.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Daniel Machon <daniel.machon@microchip.com>
---
 arch/arm64/Kconfig.platforms | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a541bb029aa4..834910f11864 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -133,6 +133,20 @@ config ARCH_SPARX5
 	  security through TCAM-based frame processing using versatile
 	  content aware processor (VCAP).
 
+config ARCH_LAN969X
+	bool "Microchip LAN969X SoC family"
+	select PINCTRL
+	select DW_APB_TIMER_OF
+	help
+	  This enables support for the Microchip LAN969X ARMv8-based
+	  SoC family of TSN-capable gigabit switches.
+
+	  The LAN969X Ethernet switch family provides a rich set of
+	  switching features such as advanced TCAM-based VLAN and QoS
+	  processing enabling delivery of differentiated services, and
+	  security through TCAM-based frame processing using versatile
+	  content aware processor (VCAP).
+
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
 	select PM_GENERIC_DOMAINS if PM
-- 
2.49.0

