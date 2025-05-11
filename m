Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CFE2571B5
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 13:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970944; cv=none; b=BebsGJzzPpjRx1d38p9Xpo9iYq3pp2JOacbD0VbZyDF3lj7CO0tCy3rIUG6Glaoc7ivJjQGOaVk7+g69XNG8W3chXdPdqlXgdNp8kNvQrw4ilcVtlHhGGH2Mrfw16VKuSMXueFCbJDSQTWNSj2lX7FGLSDgt3uXldTR+/02NTUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970944; c=relaxed/simple;
	bh=BiKDpKKLxE/k6ZY8kMmrwXJi+9HFJObjqUV7Aozt30A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PSypdoN6tCgIHWi+ToUTPJeQvmjKruNj9cjczZDxBacyopNLM+5SA/DSRaVcD+56+VmIW4UhfyFxhHA3/4InEWn/MAP++xiw/remN34UulrRgOOfwxkHAwUvDSXruVWzXZOCjdRyf7kKaIZRAxnc6Nv3ZcBxX22e+7cczSz0MJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=n//j3aCT; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="n//j3aCT"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22e5df32197so36248715ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 06:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970941; x=1747575741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXNxvUrDvrPEDXD7o9bAHtY/zIDAmgnS5reR+x10ajU=;
        b=n//j3aCTQDze7HJVK70lCkZrpzub6/BV/wJKMGlDAP+k0V1EMy6J+3/N6ovCwvDuH5
         xiaDFRR+vuAA1mEpegbeIj2i4ZmnWT2pexMhHDponVKCKFa2NV4RpWCEPu6xcruciCaU
         xz4RA1mSto7Q02vDxLuwdVqVyMHtSaBz5Rgej6zaSYEn3FyjHxQjAl+s5fESRkTwreD1
         9XXdTRrUC7qOKDEYjNei8WA1/NN7PoX/koHxpPpphDySymYJDHeDhvcLRA7w4e1VszRa
         q6lufTE8V9SsMmHSgxpgY+7LZcTMNtca5UPtWhg0iNwN5f7qEy46PWjrKiLGJO2zu30l
         u+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970941; x=1747575741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXNxvUrDvrPEDXD7o9bAHtY/zIDAmgnS5reR+x10ajU=;
        b=kxdAR6hfv95ReOQyrhEycoOmEUqdbSHqCFsjzU48UPnMfFw3sK5zXHuaRe5aBFhGuO
         V6YZuqa21PaeqgWI6Blbx9ND7WAHicdAoeV9NAIIURNPq8UpFxFCfYvK52V7gnnT62xk
         To3MR3sptCfqY2iuw8xR6+RH43ii4XmCpqtZqrNVk1roX3ppRRY9+QJr0OmQCedtKIWp
         pNIu2Sg+hy9YQJ5uQatbyCssJM3fKGxQ55SO3ny/00zyKr+Scko8lzViIvHSERlfFby2
         o2qEMUMGmJvTs7LY7AeYeEKCwe+nk9Ql5EXSW3pA4lgDdFZsObF6EzoflmXEJprrbjwW
         8wpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs3YMRUdFS02iBvo+SUInXngQS/OMd+xp6qChKIY9lY/Aku87YHxYESP/xi6jgdVqM85zWa5lTbdoaq/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVj2t/VXShCCJmFYYdifsvZvqE86oFDpxigYgPCQJ84FuiTU2U
	H73ox1o1R/axj8qNe+Kucw+nm/tHulS688Dpwp6Ftgq4MCWvC+sNNARjNKgwPVQ=
X-Gm-Gg: ASbGncsuoUUuBIARnWZFqI+32gESRPJywo1ILVH4FwC5oLPiHyr4i5Pmk48FfiRydDU
	/DEBeFAD5xUafLTy9BFIRq5J0twMK1Q3nT+SdrbLxbzejODPWf+ENGzkXdiqKY+UijuYXJ0BpAO
	JXlgf0/Qrzmh44grXhJa+waewG/zUqQXVlYGwtUTpalfe5y9nBcoEap8ladAXEhPWVpFok1R3kO
	yHuWi2jgEGoxM65SwThhP7ZvkeIR5DkW49hiR9Vuy23qbQtvAorsRnmtIS2rrgBIsAJ4UbZFAZr
	G4QyBUpRdDEKvpq1imzUs6CipbBE4wwzXNCWRsuY3jvgCfsuQRFIXNQO4OG7QdWV2MYpNJVpNqo
	Lw/D6gmQ1S1tGrQ==
X-Google-Smtp-Source: AGHT+IExo0JFN6HOT+mbUBxTAOi/++2rhBZ3oW7UFgUXMGLrtCOMV0AdwEfD4kuAZAW5D079x04psw==
X-Received: by 2002:a17:903:228f:b0:223:4d5e:789d with SMTP id d9443c01a7336-22fc8b415e8mr147781135ad.19.1746970941076;
        Sun, 11 May 2025 06:42:21 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:42:20 -0700 (PDT)
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
Subject: [PATCH v3 16/23] ACPI: scan: Update honor list for RPMI System MSI
Date: Sun, 11 May 2025 19:09:32 +0530
Message-ID: <20250511133939.801777-17-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
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

