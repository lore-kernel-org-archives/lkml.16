Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1C618A6C5
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 16:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771235; cv=none; b=Nu8BfUlNBbNjJjs8aIv1Ebm7IBPqDXrVwpcMsWC71rYoj2yDdyrwGvajw6zK1+bwdPpA0ijFvEweNma6HlRHLxSjuuR/6d/8fhHdODQ78W1IUq+GuJ81P6TXq2rc0ETuZUrunjTGszuiC7afZyI6y+8yenScr2YG4AYJheYiI7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771235; c=relaxed/simple;
	bh=zAamzhUEpJ0Ntfo7PXDoXhLHzC064WJshCcKxat5Ftc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TQ4WoUGBoXAnzCUww8pyVA19ozNKysg3szzCw8pGpw/v5uqTHsZI0hOEqi+LvfiTdL0d1M35hEaIZ8uYeGnfOCvKy4Fobg/PBKGbUzGx/wcKvL81Db7cUX7+uqzpGRPuK7DAFXfMOW72DNw5dEcW6QY8lLoAYUnuqXozfc/82zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ikajuO12; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ikajuO12"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2165448243fso45300335ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 08:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771233; x=1739376033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MMc9mwT9NVQ5mz2h0GYOBXRUS44hVyd7ty+rMv4eE4=;
        b=ikajuO12P5Q5rdcnACWaLfsmHUeZpNBkaiC8FBGZGYvn7ugLxgdRk0CdbATfY3uk8O
         AnavxPXXgGcCJNMk6b4oxDaPoJ5PKYJFiTG2UgFyK62Oe+B+9LU0shlzLqOxi+45XMfO
         rKHog/fafvVIXVTW1qwL5HF8Z10ACk3gExyzv1bYuD+kxTqo68BX11wgA0+m9kiF95AL
         qUynu/HvD3DLzDEjPnVqVvU8nrUzlZm4tMoUqYiom17lmahxIF2GYpK0UB/URURLylSg
         UKWqJ+7NtmaDTchxIoJSfzUO/53m5nwmPoGAw1ykgXKMH8bSyLp3nVtsGpAzk7ZiSXK/
         3TlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771233; x=1739376033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MMc9mwT9NVQ5mz2h0GYOBXRUS44hVyd7ty+rMv4eE4=;
        b=Wtg/lsbqaAkkI13jwtjp0FBgmTzxlVSo60SVQgJss0TYJaM0946FFA9oeNQYmW1IIh
         bNkxogy3ExJ+s9X6qorvynptgVBAp4hBb2RAZxn9klW2diMhZGSYK4XzvA3h9+mAPh8K
         GkGVCidpwHA/1VZlJjl5j/DJQSTbhLgMFsdKUioQVSGdK7GKDSsqdFgpypNBIHUD0LWJ
         kQmyEiaKLTcxEprZobukaGtOwBBoEKRKudfT2OKWsyn6P+sHvvBUJqye8eQ4VZ4+0M5i
         q/hskRCxEuyUWcMkpiKdWWq4xSlDzesWkRCG+XvAoUKyt14sLF+3RKyq0qfUccEEH+/U
         8w5w==
X-Forwarded-Encrypted: i=1; AJvYcCXblmfb81Af4xHZSUcQEwypTVeg4aLu7aE9PoqCAadsGkpDQZwlMHDgmuqam5PdTIHuC7VoVF8b4TdYAYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFmeKTcou4mx+9ucrTVRYXET8vpIeV3ARwjZlb8bcTBvrg+DLm
	VbjxlF2WfQF7TGq6ko4ePw6dvO7bCloN7Wrf0e08tbzpXfaRSp9B7xjfpW2LZ2I=
X-Gm-Gg: ASbGncurgLTNbNHb6OR3sgVdMsIqTCgYJWveJVcUyrSOQbV9XMohGEges1uLoH9FZ7A
	ND6tYzzkLHadBEJ4yq2Cap25DlS2fza3HwX8oXniglLmjDqKwsS1/15KkMtDTugtOy7hRKnqe//
	0hSYKB7CYOzvWkfkRYwF5qJeXF/lnN4Zfs7Uxxnbbx33T2zx5Vlji4wN3bPErfPZkmszBskncrw
	19GLKPGZ+ApzAAbhC+pu8rEpryd2wYCKTbr81pucZAkBCNoNBWYo2cP/RyuaDlvTxnvN5f6Xbxs
	0vvPlWOYjDNeLbN4FhD/H/CnEVSxVSW/gw0dkkyxjFsGZ1FtodZF9qY=
X-Google-Smtp-Source: AGHT+IFVUygBqhzTxplgfR5D4ALHtsI55bhay/IfP7Si4rFXdhEgGg1YfTQqUROzXYR+kUtbmKwJEQ==
X-Received: by 2002:a17:903:8c7:b0:21f:16b2:9339 with SMTP id d9443c01a7336-21f17e2a39amr53896345ad.27.1738771233066;
        Wed, 05 Feb 2025 08:00:33 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:32 -0800 (PST)
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
Subject: [PATCH v4 05/11] genirq: Introduce irq_can_move_in_process_context()
Date: Wed,  5 Feb 2025 21:29:41 +0530
Message-ID: <20250205155948.81385-6-apatel@ventanamicro.com>
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

The interrupt controller drivers which use GENERIC_PENDING_IRQ
can move interrupts in process context for downstrean devices
which support atomic MSI configuration.

Introduce irq_can_move_in_process_context() which allows interrupt
controller drivers to test whether a particular interrupt can be
moved process context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/irq.h    |  2 ++
 kernel/irq/migration.c | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 1884fa4ec9b5..5b67a47da144 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -617,6 +617,7 @@ extern int irq_affinity_online_cpu(unsigned int cpu);
 #endif
 
 #if defined(CONFIG_SMP) && defined(CONFIG_GENERIC_PENDING_IRQ)
+bool irq_can_move_in_process_context(struct irq_data *data);
 void __irq_move_irq(struct irq_data *data);
 static inline void irq_move_irq(struct irq_data *data)
 {
@@ -626,6 +627,7 @@ static inline void irq_move_irq(struct irq_data *data)
 void irq_move_masked_irq(struct irq_data *data);
 void irq_force_complete_move(struct irq_desc *desc);
 #else
+static inline bool irq_can_move_in_process_context(struct irq_data *data) { return true; }
 static inline void irq_move_irq(struct irq_data *data) { }
 static inline void irq_move_masked_irq(struct irq_data *data) { }
 static inline void irq_force_complete_move(struct irq_desc *desc) { }
diff --git a/kernel/irq/migration.c b/kernel/irq/migration.c
index 2920024475a3..428e42d3bc91 100644
--- a/kernel/irq/migration.c
+++ b/kernel/irq/migration.c
@@ -126,3 +126,14 @@ void __irq_move_irq(struct irq_data *idata)
 	if (!masked)
 		idata->chip->irq_unmask(idata);
 }
+
+bool irq_can_move_in_process_context(struct irq_data *data)
+{
+	/*
+	 * Get top level irq_data when CONFIG_IRQ_DOMAIN_HIERARCHY is enabled,
+	 * and it should be optimized away when CONFIG_IRQ_DOMAIN_HIERARCHY is
+	 * disabled. So we avoid an "#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY" here.
+	 */
+	data = irq_desc_get_irq_data(irq_data_to_desc(data));
+	return irq_can_move_pcntxt(data);
+}
-- 
2.43.0

