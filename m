Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C034A27933A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751612843; cv=none; b=iNQOOMNRrEcOhvZHgNNejtWSw7BawpnECSAgXzAgaP5ppHwhIqPWiL41YykJ2KdyjvKyBMFbTb4k/lDhGi8H95QOlIM0Gqq7Qf4Zk/gVw4DlVzTxolExpSQ48BGLHTRhdEqrybELDY7bGLkn+3bVG6F89py/fjsZRA6s1Y4woS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751612843; c=relaxed/simple;
	bh=kOJ0GefeAd9UEbFEyV014zsaaRwCNdDHSJBAudKVMFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bKQrmBXE+FnE6sKzPkny3FXM7DjXCt+pb4xRU3OEp/PODzYKW5uIyBU2QC4NnRsqtOw27TIkuzIE3SenIjwWM/Wcjy5pYEFq2H9EgsA4z5xLyYIRi/2lGdlEqYGSCQNlQQlHcLeXSLJSvDZ91nMw98+8QRJQv4qgZGWjlxsfU3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Umh9KFfY; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Umh9KFfY"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3135f3511bcso725316a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 00:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612841; x=1752217641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQx4DIh4Piuq7HhjaN41eXcQRyGY2O2ucSjN2pwnllI=;
        b=Umh9KFfYnNsJyzELZ24DHzss3F7/qLLiZUELYJVHgzLonLaH3xl04FQ43oTy7NjUiE
         P/BkrTLzWf4Vd6Xz5kSgJIrByDLd3f1V9vCb68nk//4wP0OBx73/9m5tisKEKRWqSD7s
         i9aKnCL33bD60rKu2AeQ8l67e+758M3jXJwP9YisMazYAJhX+744fBkZshwxViX6LmZy
         LeVJIHh8iFGYsOVoHjZGBGRdJW6C/3tr7FtPT9+xVciQAndU61DWCkgmkSFvC5uuqR1s
         +7xQP8yY1LdEUxsUshLbibqKrfFI3lNY5/yU3uGCnoixMOe+rh0Q1DnyaWK49fybSsrA
         vMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612841; x=1752217641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQx4DIh4Piuq7HhjaN41eXcQRyGY2O2ucSjN2pwnllI=;
        b=ikbIRavbgMFC9OEnBR4ahk0uJQNjkQ1uWRQCjfrNMEUKSVniRq11Z2ocJZkqWeqe76
         57aSxia2vmFHy63gLS6vNhZAYkC7to00sgh+7vVvdjgua7/SfipjXbCdwDwE+2kIferD
         qvdsxfa2TPWAdRhfRdw3ND2MtAKrVSTz7tBQst5YMwviGkovZm+JER9tiTiSzQe1j3c8
         xZzGKbOSNiQnxZDQNqWvdKYT70o9JaorImLHPClOzc94+82AiNbxB39iMom2NaqjYU2I
         piPHHrVicDoUfmNJom8r8zSnZJPWc14jNwJ0pEc5PQzZnq5zB6gSTJ4/bdR9J2LWTEpS
         fKQw==
X-Forwarded-Encrypted: i=1; AJvYcCWEQCBCM4trJiXaCchrOgWnnEXnJ3qQGHcmW4P7h2nX51vlfimtvRqGTraP26+uHHlU1uC4RWPZvxcxwBE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhu8g21plzBf6yyM6/YsHqgBca4YzAG1C0Tw0SLpH+7DTfPFsU
	wUekoxBqhhjK8F0vZJl1GFoN9b1VwcgWdRbdEVmnOGF5bTj97Wv1JPRuQumZ2c+h+v8=
X-Gm-Gg: ASbGncuobzUbiMBEkiULql6q6Nke4Fyr0P/YEE0IM0pg3JUwAd6P3E88PV8qbwuk1bj
	//o0dnYJcpAVB+pYLAlNz660MCqQ14R3YY0NQAn9yvLzzH2q/Q9YdT5hf2ZUUn5ePZ179FBLQDS
	PQ/ooGzu4wGFPMa9aBZQn5xhs0o+remaBGsApI7b4KnVWDrifBqQlPo7jXD40mjoZ3skl7w/gsz
	W5l0PERmYZegqYApQNDNuq2kQwZP/Et8CtdsM1iy3lKe9qPGliM8utnuG9QHDTVyuT5lihTbw62
	jwnD0nT4TUF8sD6M7QjZH2B8j4s2hrSoPi1VnTcGjpGNNcQ9El71BV2jjItJXVnetXsuzXX26ax
	Psrh1lE3IXvjnlD3rUruMsULqDQ==
X-Google-Smtp-Source: AGHT+IE8RuxxpKedqzy+uzoXVkR8qJBvZDITw6LQzH2d5wo1aXkwsTRyqrE+z4geahCSOD3aMg/Q4Q==
X-Received: by 2002:a17:90b:2245:b0:312:959:dc4d with SMTP id 98e67ed59e1d1-31aac43290dmr2637314a91.7.1751612840937;
        Fri, 04 Jul 2025 00:07:20 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:07:20 -0700 (PDT)
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
	Alexandre Ghiti <alex@ghiti.fr>,
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
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Atish Patra <atishp@rivosinc.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v8 16/24] ACPI: scan: Update honor list for RPMI System MSI
Date: Fri,  4 Jul 2025 12:33:48 +0530
Message-ID: <20250704070356.1683992-17-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunil V L <sunilvl@ventanamicro.com>

The RPMI System MSI interrupt controller (just like PLIC and APLIC)
needs to probed prior to devices like GED which use interrupts provided
by it. Also, it has dependency on the SBI MPXY mailbox device.

Add HIDs of RPMI System MSI and SBI MPXY mailbox devices to the honor
list so that those dependencies are handled.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/acpi/scan.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index fb1fe9f3b1a3..54181b03b345 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -858,6 +858,8 @@ static const char * const acpi_honor_dep_ids[] = {
 	"INTC10CF", /* IVSC (MTL) driver must be loaded to allow i2c access to camera sensors */
 	"RSCV0001", /* RISC-V PLIC */
 	"RSCV0002", /* RISC-V APLIC */
+	"RSCV0005", /* RISC-V SBI MPXY MBOX */
+	"RSCV0006", /* RISC-V RPMI SYSMSI */
 	"PNP0C0F",  /* PCI Link Device */
 	NULL
 };
-- 
2.43.0

