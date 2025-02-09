Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E18B18E25
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 04:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739074696; cv=none; b=AVj2nqZCTmn+wLQ9hoRkn6/zQu4AeH4VO7Wi5NqCslusRAGkYnOkJf3CnFLFHM/aUpsyBmY96AyLezWmiDXsGB+petz9sRQ3ClKycKQJ0d4NkVjqoLrJH0tlNoV6dP6q1UqlxP1P5KaGoXODRZaSTqMXNpqeDwsSLQ8oMFI6jxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739074696; c=relaxed/simple;
	bh=n4slH+wgDA6MSJsnkDzYIOL0zzUU8vlxw6wGI5nPdQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B7aqAk87qVAl0QWTDqC6MvFyYveHcIk9Pz2vPLDSFBrKJLr+uKeZZ9vaZjflZXlihRV/vhgOWSlc4fTiV6QzPv5q7JEg2DzmBTNxElnfoQqaDfgJoyopKUBuA6q8XIyRAgLMzdjmM5jpJ5vbbYuBy5H9twe6Kw3hOggd1Tv2NKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=nmps9gQI; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="nmps9gQI"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2fa5af6d743so698481a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 20:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074695; x=1739679495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=;
        b=nmps9gQIWNGYBJI5jrtalJfokIr+Qso5sQqHEuhLytkKOdZKCsEuUUoAYjhY62z2q7
         FBkCmulmeyCCZviBZIeb5rh6t2LdjEJGIXkY7toSrBE9pBZlz3G8pTJjwwNNEads2v+w
         8U0/RJOdVs70zu4j4aUJf+zzl0d7p4byE4PXLupM1Ij+QD2Xj3/dTHOPkql/Q8NR2sNv
         m6d3NVj0HnZs8H4yV1E18lt38enIhuzQQEunyxK9bly+oBNHIUWsmGP9Rvk15vkE9QxN
         iM2dAhoTR2fMgWp0xR8xznCHpfBLSE11VhYv+pNgR01eg0dLJamlVmpoEV+iV9hqhwmo
         aCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074695; x=1739679495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=;
        b=bbSW2Mc/fLNvTsNGEjb9geg6xgsrehjMV0P5oMQQfCHaRgXlDx4wyovP6q17mvs3gk
         cbufcna741ul4EcfdpR5yfYLfJXBIHQJnhz5P17TyeXSC698wgXPSj4Y/d+C3a/dx2ji
         p71lAv0010FfdiZKTeZl/EQP2GlTXaOSlufrNuGEWEhpBo6qdZ31g31HZZk8MAkGOndG
         0S38F7O6It7GDnKz3UnKOkS37tK5gjKFflm//DU++NlW4LuFOmY3zQzcTPyU3mpnEbXN
         iyG+dfPvpLpcHmf+jl4LWpBBD4pBS5PFC8F5p/Gf22CT3bB+9uHILBRDl++sJO0Et0OA
         4fgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtcJIJxSw0PHtHP0v1pSscKDjREDtFa6xkQZh0Ar+dYD8SZYdy+8Q/nnNpuRGGAqOAZM4BbzHXW/+ezu0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxch27zddCoWQJ97UMCTvfLkEZCyam5jE20ZfYojfWU6Qj8Qlua
	pOQQ+fNWKhe6TrO0JK1UBZSCwSk1TCcvIqyjAkLNNRbhLefoTDovlbIA478J+Eg=
X-Gm-Gg: ASbGncvaUenXQAMVmUmHVpK4ZVZetckErgBnnefiyiO22VkLOApmNxG/j+aQjBuJPq8
	AxLYgpXs+APqgWniGqQODL0FyncrbfVvWbvlLzy9GHjPWqMcUJtXUL7Y2wWZoC74A8xZrK821X0
	ne7A0Gw//zMLsyfwlQUio7MaGMiayChJZ14V2SNOu4o326j0oB+4W4FR4mDAGnaQ/4mp2NB6yGE
	K47JtMazX3T7r2bpVyXQHi22HkI/3FakJgIrSTKJ3hmajqrdpJDdNBojAIaQUHMDWNTd5xW604o
	vdDBtQSdwIGbfLD+Cl4tooxX7s+x/sTw43QeZV4UGrTY8bT+ZZgPPa8=
X-Google-Smtp-Source: AGHT+IHL0ZAy+b2/HWpMWPKyLFtjwNwqGOrHhxJ1k6glfU7lfaN1/yKHZr4v/qmnwtb+wj+/nQhb2w==
X-Received: by 2002:a05:6a00:2289:b0:725:460e:6bc0 with SMTP id d2e1a72fcca58-7305d2ac0admr15896176b3a.0.1739074694598;
        Sat, 08 Feb 2025 20:18:14 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:18:14 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: hpa@zytor.com,
	Marc Zyngier <maz@kernel.org>,
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
Subject: [PATCH v5 07/11] RISC-V: Select GENERIC_PENDING_IRQ
Date: Sun,  9 Feb 2025 09:46:51 +0530
Message-ID: <20250209041655.331470-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209041655.331470-1-apatel@ventanamicro.com>
References: <20250209041655.331470-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable GENERIC_PENDING_IRQ for RISC-V so that RISC-V irqchips can
support delayed irq mirgration in the interrupt context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..a32f39748775 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -111,6 +111,7 @@ config RISCV
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
+	select GENERIC_PENDING_IRQ if SMP
 	select GENERIC_PCI_IOMAP
 	select GENERIC_PTDUMP if MMU
 	select GENERIC_SCHED_CLOCK
-- 
2.43.0

