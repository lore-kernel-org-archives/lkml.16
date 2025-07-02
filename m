Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102B622FE18
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 05:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433370; cv=none; b=nVLgufFKVQWnwU7uzXkaESScsqtIju+XOb9EeMAWbpt7YCh0FP1sKwS+2Xpq6rqCcuI6BwMnws8aLyfVsYgFfQje1Z3orE+7fJ37GcnNs6yws/a9Eqox/zdiEwwdff6cggBmRQODq++d2iGSfbUG2cztq5/yiNLSEOPW+0wkXSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433370; c=relaxed/simple;
	bh=vaT9fKqdkrP7eBvkYV5AtQjKTPo8A3kQSz0hOZrkoeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dxz1KDbF/EOJU5yQQXW3ZxU55u+uejxNJ0q+8QO55BHjYUscuVrW81KvjE0vUP8FlJY0ul6zBmra5ydLbJxDJXIhrVaUlM3gmCyl86bzuvi69n8UyF4PkGVZG1inBWUr9uMJYG/aLUTNhjg1Wd0gVbQB57SlMUqbVYf+hEKcZ5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=oepCvIPh; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="oepCvIPh"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-237e6963f63so25526305ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 22:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433368; x=1752038168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBceoBehx8BvgZH4kIrIZIQMdJgc3OIIxRIhQIQqZsc=;
        b=oepCvIPh+8/OnytSok5GnubT1nWHOdXXZ7LOkAVvKZWR9yL4hSOvdJ0KMX0V5paano
         WmM6ogESHX/1Z5ijmUpb8jAU76UYrgb/cteTSW8r5oP5+dm371bQqhmZncFoYsScWmMq
         zUYX60Nx9Mmhm5gj+X+39xuPbugYZtNlxOytdAHEHoGxaizpLax0SeGr3BnNAvQHcDDa
         9iZ+B3CX33L3BV12tBq4ULdboxl9Fmg0WWq0+WSRZR7qEQ3bewrYogxHR6NhaFgPiXlU
         xT/aNhKy/MCB2BEMokVXagtHbZfUmmFFBdhDJfrTmYfELEPeVTYaeQIGSLgFCLej/dcW
         7BBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433368; x=1752038168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBceoBehx8BvgZH4kIrIZIQMdJgc3OIIxRIhQIQqZsc=;
        b=LhynJ7sSOiD5NrQG81fFgcaJ0fxmeURWCuvOUhPz9iFhHTzpEF4f1UChEMgpsi4PID
         HMrrYayNuKpX/LxAnPGTXqmishU/9IBfIvMK30hvvzutg3RkE+NlFWWmRQ51NO6Tap9M
         BQis2aseRz6R8oRtZGWvR3XSUbtGqkPvRdRy3YBm4j5+EzwhyfPMm2OE5f8jSWdAm2yM
         EE2CaSbFZt+K4LQQ7m5uw3uIUEeT0IsN4CtyodGoKOPlDZK0/Ug6yT4bCDEcEIlQy+bT
         /2R+Nt8kRCsqvDjCDmgB+OEK6XsQem9dMYUa8FlhdWZDSJaeNVY2HGXN7NWJu0cZQQOd
         dzEg==
X-Forwarded-Encrypted: i=1; AJvYcCXNUpz+UHYDh2bRCKvOqGszogpUvZuXulDBbyLB4+agzTHWVTeUoOHNiL6lBuO2aD62pl6PBoxaIHUB/Pw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGQKgX141pYYx0KtJFSj3kAMPTFlye/cnBpvb3KDcXiZhZgYIf
	gkv5iT5vej58eudpJpH9jcjLEZbxtewtN3U23OA//Rihq3lReQVFlf3ef0p+EMtiO070OZI9vAO
	YX7TP
X-Gm-Gg: ASbGncvYoM+csyPViyLLxT4h0DuW+shxixp9Z0D+3XuoLhWWlf6eSSbR1+Ff/CGXNu/
	y1LzsID64aBs1YsX/LKW/zWoDG5UQAP3JQAOAWToNnm2y44Uk+m+KLNm34wc1TH38o5RR86fqCd
	ZmZND3Pndc3+x4ZaD6a5/UP1dVzoV6kywU8v5TRxr6jcMyyz7iYeHbxfDE/xyUTfWUq6JbGHstJ
	fLi/gjVSZS6v6Ci2SOJjtf2tmZSNuv01VAaYyUjJHwuPFNhY8eXOKEyMOCzd2Pru9oqUbHxzREt
	jljzvl0YdXtpG2i0jNscoUkn90EZRWA/k9zcTH3V3JSC1lunrmnuyw+/q69v1S1yZ0idZEsfr6F
	4TdtvqWlFmDIu4y3F
X-Google-Smtp-Source: AGHT+IFKKOiOcB60DEsZKqmVfcXE0dhCOXPWFAp2kRuerlsj/aT4QarUNKrpH9hQuOyq/8oYcK2PvQ==
X-Received: by 2002:a17:903:3c4d:b0:237:d486:706a with SMTP id d9443c01a7336-23c6e584257mr21721685ad.48.1751433368200;
        Tue, 01 Jul 2025 22:16:08 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:16:07 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v7 16/24] ACPI: scan: Update honor list for RPMI System MSI
Date: Wed,  2 Jul 2025 10:43:37 +0530
Message-ID: <20250702051345.1460497-17-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
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

