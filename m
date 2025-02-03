Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5748B1FCD03
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572726; cv=none; b=cZxNMcjwHLOXXnRjmeQbkzgqGEdzpU2nkoXfbwxW5nvC4sb3yzbCHrkrsrPz9DMxD1FQ4L4WUtIu95ignV6jojmf/NUomdd/AHCsnlDF5Av1oRVvFh55veKrPuyTlYGV8+BmnWd4a63edl1XqgRAjZGcBNSqbybugmaMCdVAdP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572726; c=relaxed/simple;
	bh=DJLPtY9fSqVBTgjSnM4FsYGiupFf6DQ6YZNtl53ByuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X1sFEglQC34VMxqqrauFZ6YohtUSpEzRJh/w4MHdUcOIgGU+yhczekbBRhPucJOLi97Knb6M1cn4NTWd+4DsEY7NJnE9Lmmkw1zlwJG9FX7mqO/VxPxwQVjiIHa95QSeyzBidei+3chv3eDLS42MtF6RVxG9AzzmkzHrBJ8uR+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=QHD2r9Kh; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="QHD2r9Kh"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4678afeb133so44182881cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 00:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572724; x=1739177524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqHKfwEB4phXeApzs0j4obzgLpliUPZiImb73QFVqNg=;
        b=QHD2r9KhgzYkpj+Ek3lp23DEggbnvfBWsrkIBgs+4F2MatGM69ZlCUJ2TI/ZHwO5kc
         tPrY1WKHAj+EGj/eyZDOptlXagzEgbfjJ8coXuMHPKHyATSgRPXR6foaYSsNWjbiD/Sd
         V2CHLFjMEFbuPjMFjCZjx+u3GRA19FrPwQtg/F8Mw2AHTrWCzBm9KSY/MnujKEk672x3
         ieL3VFHElVkAPQjzLSQbizfVLhlXzkJll4c25fHPMjbIdDf46BufXOyhzahSkjk5Oo/j
         T2e4c+1PZuCmQVhAEWQeKBT3PUIR2KXHxaZGiq0R+iNANuFOQln6ITAdkkZcRisqfj6X
         Hd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572724; x=1739177524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqHKfwEB4phXeApzs0j4obzgLpliUPZiImb73QFVqNg=;
        b=ciI40lAOOzsC71SK5GbtWIg0jOeMVXXUds60bU+zdtfVF6if/DSUy1+UGSQREDtXyH
         k9FPx/MRzNzlWhrTfWb6laQsj9kNlSx+Vdl+Q3pgncntAVlFW8fm0FeL+huH8EFfmw74
         zRkmEp4xVc9kmM9BgC8RN+S/u4u9K8uPbdhaElpFf7o6xChHzHBiJG2zUvIQeSQkSlM8
         KziJpbGc6fQxQ0pYymaArNpAoPTl01x/sAUSNQOPdfz7KuM4jy+AFDEeSC185YYWzD4u
         N7xkCZBMdre5qhEBN9n2Uk0tlWTo6YEK+t9scIx5S2JK72i0wCQm+vidGg8aeBfcWqfp
         PYEw==
X-Forwarded-Encrypted: i=1; AJvYcCWUeEGLCLscxkCsbwETCnkMRWjKnIup7/wmTznnc8PNmNJOaF+9mOfnAJZgtBx7tv4m2WT6L7SkuyJQviQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3IXwjHtoZudLRQvqcbCVJ2VJBnm9LEb+c/oD/3VkSAqAXFuhQ
	J+zpDIPb09wcwK435Sgq22WWWrO7c7lLu4Foq3k/7jQVVt0R0HWBkFGAV1AEWLY=
X-Gm-Gg: ASbGncvl6DW7RgYvOn45kaY9DK31x+vc/Xf2KN1SpUlYrMI7g9wKMvlZTbgfP3hIzTn
	l3GwVTSNRM1+DVRzN87OQzo5C9+K7NzFJypmUm5azf39F1wdo4F92qL+oIMnWmYq4RcSjVi5dTx
	5VZer+uDLjvZ7e/c6CTG11nOSm6z6kxhDUM73QIjPfrvSS3lpQb4AbIWOt+PmJtXNHJE6dZYUTt
	/qhbH9uBbYxuyqUzkJag5uGJVRCDRh9htBT69jkUfHVJ2Cwf86MBpGOiycrObXO6BHcFVKPJO/8
	FjXfaXq42Ab8yjuuQVOblKrVMQGfdlwUD0D8WSyLurjO//zlH8uKPrk=
X-Google-Smtp-Source: AGHT+IGWVNCE2D8XvH1GGSIfS5LXa9bxJFfSjFmLfIb7zNeOXcqdzBvLSHp2sbBS6h1VqkAcm9r5rQ==
X-Received: by 2002:a05:622a:304:b0:461:7558:892f with SMTP id d75a77b69052e-46fea0ab7d0mr150479241cf.15.1738572724220;
        Mon, 03 Feb 2025 00:52:04 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:52:03 -0800 (PST)
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
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [RFC PATCH v2 13/17] ACPI: scan: Update honor list for RPMI System MSI
Date: Mon,  3 Feb 2025 14:19:02 +0530
Message-ID: <20250203084906.681418-14-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203084906.681418-1-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
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
index 9f4efa8f75a6..e490b4160612 100644
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

