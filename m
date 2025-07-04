Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414DB27A103
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751612888; cv=none; b=PpmT/SlqnR+q26Mi1RltWRQeES+Sj+P4c8DL8dqhWOAy37svZyg6+fjdMX86Xi/povJ31BUVKzWAT4Xb97ZqM0jrP7YdNBuQOEWkJE4d7S3H3pWvx9l7KnPw9mRXwrmKt98QfuFhjJxcG2i2NiT6nzCHTWiUwgOnxfKzXer1zgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751612888; c=relaxed/simple;
	bh=bbsKQgQKotFffImznTiHFRZUkpn3l2AEmmz1a9sty/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ubgLMp4Nw7PpE0VzXTzIX4AW7qFqn7iQ9I8+9HHK6daO0mAdJGPO/QIjqhqUzU3fUUh/iQuzgSJd2S7D6PftrxbRyMmL0s7Hx+bsTDplHCYPTALrm14JCIk3gLy2LQ2bBFPSfdDp1q8tlPgPbkwhHtAEmdOmChQ6HZukllYhBPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=nPKIBTF0; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="nPKIBTF0"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3141b84bf65so710164a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 00:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612887; x=1752217687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFaQ5Zs1hbK8MQOtKnNrpZ/cBeXTMcFHCuSD6j9WtSo=;
        b=nPKIBTF0AK+/1HHoTW+QCGP18nXWXDLUIA9nglN/twuOKc5qKK6669ADY6e8XQfppB
         8oBEqnvbVxtwDWumfi3pJgwBPf7orNb8cKTyoUUQLsinu4DEACYhWsNei5SQEag97w+Y
         FPsM8toAFQPdVQnGO+/EptIvT+Qbu7Dwlzoujf00OyIxc+zFhlrzT+uX44XHSJjLMGu+
         wmrGk7YzjOng0HY+nY6+88eej74P3uB6aTMPZKPFnSCMBXBgYp4hoG3NIOKfIV0wemV4
         JCZtB4JvXHaTU6oHmrKg/9b5uy0bkn5QkySpFgv0nCdWi6iz6duF91Id+OID4XET5yt7
         7k3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612887; x=1752217687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFaQ5Zs1hbK8MQOtKnNrpZ/cBeXTMcFHCuSD6j9WtSo=;
        b=gO4Jp+2AASGGzxX7pVec+Tu9YXfPA5iUq5HdJR9rYqfu2cduoCsiRfDUxjtxna3CyG
         Dq2Y10XW4Is1ryn8BUHje6F+RTgnsHVVZEddnZjf3XFEHsvKkSfYlgK9dv0yjtIYnuOD
         5NnoAd8d/dBIuGC2/6Rrx7qj0n5T8wo5KsvVOKiOFELNRbdKUVv0EzDEXse4cw0JNZf6
         WJDuOnqbXBC4rCPlQCNxFLh7bVKEIMg5NhBXhDDnzK/26aRCu9umoRzCnOdofmVJ6s90
         NmCQEbmYOQ/QSdgXjqBPJY7Mu+Z5krHnR3++8ECSZnQaIl4EL64q7fSwjJE+PRkztPdM
         p+mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaT8s2Ps4r7BoGMoSnQ+1HjJ2xcW4yCwBhdyDpbTbCSj/WbfIvncezmU2F1E7ZDI45JzM9cNWpU0enGC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN+qFRkPDrc0V2GEP/5GagKAJAX9OcPCjWh4bMKJiNjE1q5m1/
	eIpCweCyaJ0+h8bYTtr5jCxCIQT0gwHTS8IYTcq+fL5t2RbXzVGHEZkwev1jnXvVJvc=
X-Gm-Gg: ASbGncvAv2pXoUG2DhDYZLXwl4mbdJc+7UOR8FV6T8QgxbB7uMOdn74oAeJlJllPnXJ
	oyVcT8iFPRNRk85li5vicKJtKW4smgsyZ59Otc9OVMxpuXp6XE8dVZYt1f//VJDAKF000NywxKB
	NUkwqaCkCyJESptLotjEh5k/EY8B5sP5VXFYGwvaAfWM3o9B15duMFxKhqdqFDFW6Hn5j9EpX/2
	7RJT0T3lm/ex2TlYTV9848Bt6wnqswdrRiYfpVSBXDy2pO0aKyQb+T7USm12eL7FR1hgIgTSDB2
	HLjfpr7lJVMpnosr3Y7itcyFIq/+WPCwmUhvWsB9h0cZxDAUCpRa9HPGjacEjKUHDCe8ILxH7Ak
	dUP6omedpc/JATytpQQxYWesw9wxDs8Raqyif
X-Google-Smtp-Source: AGHT+IF0zc2Duk30cC4boPPLQkPLExP0m0SOo91oiLUKWYjOgmAFhVPRmIXRhh+FnhO03cSYBVMJxg==
X-Received: by 2002:a17:90b:54d0:b0:313:d6ce:6c6e with SMTP id 98e67ed59e1d1-31aac449e2bmr2377250a91.8.1751612886401;
        Fri, 04 Jul 2025 00:08:06 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:08:05 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v8 20/24] irqchip/irq-riscv-imsic-early: Export imsic_acpi_get_fwnode()
Date: Fri,  4 Jul 2025 12:33:52 +0530
Message-ID: <20250704070356.1683992-21-apatel@ventanamicro.com>
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

ACPI based loadable drivers which need MSIs will also need
imsic_acpi_get_fwnode() to update the device MSI domain so
export this function.

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index d9ae87808651..1dbc41d7fe80 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -7,6 +7,7 @@
 #define pr_fmt(fmt) "riscv-imsic: " fmt
 #include <linux/acpi.h>
 #include <linux/cpu.h>
+#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
@@ -215,6 +216,7 @@ struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev)
 {
 	return imsic_acpi_fwnode;
 }
+EXPORT_SYMBOL_GPL(imsic_acpi_get_fwnode);
 
 static int __init imsic_early_acpi_init(union acpi_subtable_headers *header,
 					const unsigned long end)
-- 
2.43.0

