Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4498D1F0E50
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748163037; cv=none; b=M2CJeKZUA3sMro/2TVyAyqOktpTfjTomGftMDRdVLBSEhspL0CrveCTrvz5R6pJyCMeR/iALkQ/38buJ2IJSsGuaSlE9zmYT2NSuzoC2fYwqMcP8oMyl90sfNXCMdl74YVXFYwg8kM4t1aPDTMSwFY+keriwIUJfiYZANqHSTFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748163037; c=relaxed/simple;
	bh=oGSCzCROCq47IZD65VMMVOn6HMFmoELYuYWTwWyFJAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G0eZH+Prx5zGo6VTQG6wK0sKYqKstEtpFJaVUNfygLd0W0O6UYRg6bnQTuA4hGa5RL7/qW1+qdGnIH1syEuy3eWkIjZnR5g99BZ8pJKt1JKV8F5Oj5IvAPoOzOfryose33rLl/rMF20yZO2PJgrQira6UdxFJCCikjqTAMMC+T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=YTiViTxA; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="YTiViTxA"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-234477e3765so1683065ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 01:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748163033; x=1748767833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHC1UEZymw9wnnpkV/BuwvpiaSVPH0/q81+93KLNW1U=;
        b=YTiViTxAFXQBzfVLV9Y0CfEFSlyxP3YxRnSC5XnvrlZG0gvEFkzIE1miO5mGMrNEDL
         uCOE340WqBqCQDP+qMWSDAMizznyTh0+Ah44kcnR2S41iU86Oryo24xZ8erW+KNxJGlb
         nBWimM97UD9d2xfdtsP9UM7z3rIjOSa2dpRrpO21mVC4gzUfoSela8KpvYhPnQsvqCWP
         7lEdJq2DyByEEozaYkbyOIJ4u+v2Q+KksaQOxafoH9+GyvhND61QH1j/506Wh+z9nQJm
         f+KK+vebqGgRfu/l9JSETH4U9kHdP8k6NwsCxEX3X5DHLQ8RmaUhph6u8RyL3VDTrTNR
         TDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748163033; x=1748767833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHC1UEZymw9wnnpkV/BuwvpiaSVPH0/q81+93KLNW1U=;
        b=EkpfDTC331UJt8hAeiM7BRu/QRygsb+fI/J2KzLUxardEws6t0tiYmPa1jmlezJXH2
         abRUjQ0CndV76wONwv6S8BuVuFyonMDRKSUhAEfgvxYk7sWQontw9N+aLN08qRw24uUB
         8Cenlj4aLW7ZKaBybss7QOJhjB7TjW3Lz3GpPsfOaj/zGcqMe8VgLLaxZ3yR/UpT7K+u
         aoatq3I270uMGV0rKB7OLk9Tnu7t800lxFZ75yvubhgjGENy/sSbDjXQAINjp5Y8wcKe
         6WU/N3DfxeKm5EfWTnkzF/jBEsJ5gFmRK5UfwMpDsHOmJM1jUuypBUBVMvIbcvShNBVe
         jOTA==
X-Forwarded-Encrypted: i=1; AJvYcCVjh1pc4f3o7TMbIsWtBL1qj0VFpSL0bpj2ZFxUm6E69r5abvrRxKrtYILxzzgtXfa0M/lfWzjtZ0tZ8g4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywaz+biXXagMfhUNnIA5p7dreW49iCw9MAwklBNQLDADt1M3zZZ
	8JlignybDbgNsCH1hxMKBCJm6sXl8sQdaWpMY2l9KE/XCrzq/xG+ulNaXvfGQ/nCjnE=
X-Gm-Gg: ASbGnctSAysAcX+756xT0oyxllnML5S+EjZrwQ7Xx+F/WFE1EUJslKwU/eJhSqnfM2u
	ObDUns5TfaJONDtsHsaDiRE2mA09+oQDRWvG9HezK5ABkveH8vAvvd+m/oxskuns78kVWS+B0B4
	Qtg1L2JgjzgLj3w9oStcyjdFY0hd374rkNkZZj1Kx3+3Cm71fcQGaZuVajMuKbDm+/fy5OzDv+M
	ejPR7zys5Ebiz4XFVrElqN+dGd5jyi7cqthsN45tKOXHVcNGDTDf1UB1tDUMgux02tVB6lEx76F
	Q2IjdO1AcD9mhld+lvWxDog2/VqYng/MZZ211EwVaRWT8RmH8PUiB82LhcfmGNyAYhuzH31gTgq
	2BzEJSoS8
X-Google-Smtp-Source: AGHT+IEZvm0nbOinSt/PdP1ymjs9KkhXXFgMyCQpgodAAZI4iEJHOoECkEhtpUUCnZco52yWUXVFNQ==
X-Received: by 2002:a17:902:ce8b:b0:223:5c77:7ef1 with SMTP id d9443c01a7336-23414f7036dmr90752035ad.21.1748163033368;
        Sun, 25 May 2025 01:50:33 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:50:32 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 23/23] MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers
Date: Sun, 25 May 2025 14:17:10 +0530
Message-ID: <20250525084710.1665648-24-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Rahul and myself as maintainers for RISC-V RPMI and MPXY drivers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 MAINTAINERS | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d48dd6726fe6..f09b865a697e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20963,6 +20963,21 @@ F:	drivers/perf/riscv_pmu.c
 F:	drivers/perf/riscv_pmu_legacy.c
 F:	drivers/perf/riscv_pmu_sbi.c
 
+RISC-V RPMI AND MPXY DRIVERS
+M:	Rahul Pathak <rahul@summations.net>
+M:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+F:	Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
+F:	Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
+F:	Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
+F:	Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
+F:	drivers/clk/clk-rpmi.c
+F:	drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+F:	drivers/mailbox/riscv-sbi-mpxy-mbox.c
+F:	include/linux/mailbox/riscv-rpmi-message.h
+
 RISC-V SPACEMIT SoC Support
 M:	Yixun Lan <dlan@gentoo.org>
 L:	linux-riscv@lists.infradead.org
-- 
2.43.0

