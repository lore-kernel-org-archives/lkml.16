Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0359C19539F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 16:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771242; cv=none; b=mqoXNLukqCXxNdUVr76P9oUjQSvN+YrotZYvV5LJg49+eJlrEf0QPyjjfU4127xeTUmovcS/kPqQRsI5fGShc/Ydyskb7nsQG5Ty4zyENhOdq12lZeueicvNhscTkjCf56PsVWR1uN+qCqH6l2kXLz4IVKGUnbwbq8R6YXuUriw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771242; c=relaxed/simple;
	bh=rPuSUodznHcDcnkXovmaVlnFXIC34eH0em4djJco3jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PkHqUr+B77IrPpgtytvtXd8QNRLzGVEHxjJY3yKASBtf3LQu/LA+C7Bn6gS2EunuX5X2p1qEL4PusuWqqyFqpFuDdm3epX6+D1a70n+lCpHVChPkU3Fi8pKCvutexz/Ijn5S4msvZgqkazxSJDoRo18L05EVdCgvM1l09Sn7HY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=fIAp238L; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="fIAp238L"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2163dc5155fso124422425ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 08:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771239; x=1739376039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+su7Pdf8Wu86Zcml4faTN2UwZ+oipeVYumq+PsYwErw=;
        b=fIAp238Liy4FZOUsDTIlQF2moOHWLHjpuC0cU9AzRkvCHHL8EIaEY4nZ8up6468Jgv
         ET7RD7tOhDMTyjYeyFxM0PSDE6kstg54G0LMCGJzGjJaq4kvuEPRFAcF91cI7pVoqs50
         MtDy1bvRfjcrcnOZvpPdeg4c/cr6RiozSRjwFTfm5iHzAe8Lx9ccmZjs+OhCnjSBl9C8
         5UyOrjEjVsxVyTIzeVCh4Zf/cVY04r8IsY13R8CAfDswRZAlKLoM8w5GWiomx8KB6SEl
         bJ+ARp5Yskaos6tEDBhQDUKYccA9jbzACvqnRbCUZx9IVKBqN14QxXo5jPzqnYag30u+
         bK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771239; x=1739376039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+su7Pdf8Wu86Zcml4faTN2UwZ+oipeVYumq+PsYwErw=;
        b=rGNsWJkFfUe9/PEUkD55yomxE1MadiUuYMme+jX5/0LiVxi3zj81h/nhC1aRcG1jsa
         w3gK6L9w5WXZXNAb99/lkVQqwNEEmHX1OfbZs5saZusQTzi4PeW3qhapTQ6Jgr8W1sTF
         MuBTTsQXsoJiglollL2i/TBNJ/mcTQVale3/6iygwHpGuPGDmat2jlMkkTZsZBtCuU4Y
         DnHavC/xS/qlHOT1KVGnHInfdUAaBLDUA4qMGz+35IZ2aTOl9PUu5jCHHxtX1YTBDuXk
         tKBMAc0JggEZ5wJzxL/0oFqJC1AuUeAEbRwOg5gRmpWLa2mNhdhgmlnpkvErY+ghE3QY
         lx8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUR7Gy0wH+LA0dgyrN7PUvq1q35Ngh6o+/NBJEfxT5vD/mOQmhryF9fDs++ADUjHIe9z3zze94Rk8Ug15Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw45DY5F9/YH76lSln4leYt3EBmdLb1dmuolGhaTZINRyztvrh+
	fCF8/AKU2hmn9rTU5wUffziiGRc2TNX1D5NBfACJoPjLO3CfI2iGAdgKYOigBn8=
X-Gm-Gg: ASbGnctMtbZGoYhOPbLbKMlLM2jRTXmEh3RNh6mQAwGd7x/5niA+1XDteK3OgvBplSo
	pru7Yba6r3miFgzUbxtu1Kx2tXCDaJM1SSmQcpcu+no/rXlQaTYs1yLYPp45YDUdvfyJGFHaHcX
	3lTudyfjtcDBsRkT7ebN+C9qX3mws/JsTHUjG/HqY+BD5wcv/w7YMyF8nfN405hdLccwXF0Ailb
	lQevI8isxLgFwW+ZXcGYhEfZhbMurG9ANDh7DHdMkeO5t+xONY11D92cyXe6DTgrzDK0xIPFemC
	nWei0AnO+gcbjrZDk3CmTHIXUvxpZ11t+rGeRdqTEK5Az5gVYZMh+EQ=
X-Google-Smtp-Source: AGHT+IEJIosY/OKbXQSnforNF3833piSl8A3TJUvYoiwSYBBjf98+ctLM/SnWJ1Zo9+v0gmQgw/WRw==
X-Received: by 2002:a17:902:cf12:b0:215:8847:435c with SMTP id d9443c01a7336-21f17df09demr64343705ad.12.1738771239274;
        Wed, 05 Feb 2025 08:00:39 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:38 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 06/11] genirq: Remove unused GENERIC_PENDING_IRQ_CHIPFLAGS kconfig option
Date: Wed,  5 Feb 2025 21:29:42 +0530
Message-ID: <20250205155948.81385-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205155948.81385-1-apatel@ventanamicro.com>
References: <20250205155948.81385-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GENERIC_PENDING_IRQ_CHIPFLAGS kconfig option is no used anywhere
hence remove it.

Fixes: f94a18249b7f ("genirq: Remove IRQ_MOVE_PCNTXT and related code")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 kernel/irq/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 5432418c0fea..875f25ed6f71 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -31,10 +31,6 @@ config GENERIC_IRQ_EFFECTIVE_AFF_MASK
 config GENERIC_PENDING_IRQ
 	bool
 
-# Deduce delayed migration from top-level interrupt chip flags
-config GENERIC_PENDING_IRQ_CHIPFLAGS
-	bool
-
 # Support for generic irq migrating off cpu before the cpu is offline.
 config GENERIC_IRQ_MIGRATION
 	bool
-- 
2.43.0

