Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB09823C51D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751459105; cv=none; b=keNtIyOFUY/HEqfU5sjhy+VqMr6W1YSpUbNXujCE9Ex+g6ar+CHlFIJrbOZnP64M22UNpA4c9rbqL99Ddxq8iHD2HGzEg41Kv63lU1J9LfqUmxowjfoipS+JR5JW6Wj3Gl845WrE93vhLJiKgjjaz4ObHwLfFDnV8LPIBAUj3Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751459105; c=relaxed/simple;
	bh=bYeNN8vsgLwUwh3/64Fr+1MpEfsYUrXCytYoEB996QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m1FDOSz340pZuhw+9QOia0JdyERgasoNRGv3AJW1n3vYI3krbEt+SYPMfnOqMyLEuPPKMX8qepZfNurgOOw0VkAHujRoYYfgO5+NReeoPuJ/pfrHTOhFW/otmYf+pmOixnpKITunONSBA+5AlHkn6sw5hhZHBVWuU1dPwor4Dd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=XLu9RRDj; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="XLu9RRDj"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-234c5b57557so42746125ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 05:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751459103; x=1752063903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d2/Oz6A0ZcrKaCz3NC9OtHbxQaQqo8pmpupCjGRpV8w=;
        b=XLu9RRDjURRUHaYASmcPPUUHFDA0sBNar/rLhu8CyeK9UAc47C0N7Jg9z5vn75nMRy
         ecPVPenX4/PtlosRxFYn0jSQWdnsay2n+kv7UW6ITKnCq0XSdu1t2e2NyOyjw1MuRadJ
         fnGxE/1BYLAyDOBARFaKQz6L32F8pTfwZkc4qectpxU2fTp5rF4Z+TgFxujM02oE9n56
         R3J0E15qtHdYX12GLFlp+zBA+aUwzseiZuwJadHFWEM8n4pPhavBVzFeR3slldo3mBbY
         upcOlbPsDNTMN/sCNOEgk6QNrrjyrnEB9lZE72LDQUb+W5r8waxYWk0bkVMSXzD8Ajwh
         jkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751459103; x=1752063903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2/Oz6A0ZcrKaCz3NC9OtHbxQaQqo8pmpupCjGRpV8w=;
        b=KrT7yWoxqdsg9qWh9DzxvCrSO6IRHoBVafYDHEJQemwYQu5NWB6X8bhpFnfcfF8rY1
         auULks0rRY56Du78aj66TJZs07YBJ0D38qkLSx3uAfZF/wLGnrW3opv+w6buqn1niAU5
         4zyC/C1UsR+Nu9JbeRQpDSL/74Fzi2LaShsqUrGIXwrPXvf2XKV7wGEIPmtVXnZLhNUo
         Os8NHC0vHEi8kI2fhu6gBniA93BsBuPkcyXL9VwwHAMVyfDsFjdta9VP8NGGJax0e3As
         51CH5DtjMuHGuAAS9hpVO/v+x0+Kpfs/R5+D1L/XL8zK+VFvaz9R5FbFUmubV+RH3RMA
         SXLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrisJ05EH7Ta21z9Gp/JydPVxqIhEXVNsDCyyIL+mYhQcjWcIzfXZFNPqz9p0iDKAnSMptBbWdb/oWfq4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Nu7AmEmZTRI5Y3SRn1L1sWPG4cRzffDDhFwOzUJyn4TY6Q4L
	gQ0AP2icqz5LvyCym2FOQYU0hGOWbsBGaWeIZhDjcddmicnHiSNOHCTKbEz+aywD8ks=
X-Gm-Gg: ASbGncsXicDZHRJBY9nI813VvAaRNUKnd8/EU2qNfYI3+YC3UMgd/Oufqw7UuuYM/mw
	AOWX2pIhl/dS3K23ifJquzYv/KR4jaHR0CeBc0Ut9LkOzRLurXG5ELPGQw3RrT0qPXOivqM0ng9
	3jaX0i11WLUqsSiMU7Gn1jbxtYRg6YQ3nsb13yqHJrzhCbYxQ4fW/7or7PnDP4ab1DleUy3TRuY
	Jb1+cQFhZ6UduqE+UYfW/wRIGWn8mOnoNsXQgaJw/DjeXwXSGhIpMJIqPj5cVSAtyJ1hCXVU+wr
	pBfWQH6Z7qonFcDaeyVoxRK6DBZltvpsmYU9evSRoCLtBblbOcpIMwhG9Dvho3omDwn9i2BZRvF
	d0+jpBpoV0n8wkClY8OA=
X-Google-Smtp-Source: AGHT+IFIlXXlzsuMFgHtCxyhdIuOG14wM/hhcIz6P+W+5GsHULhVeQI6sehkPkzz7x0xAIuoLbb44w==
X-Received: by 2002:a17:902:ccd0:b0:235:ed02:288b with SMTP id d9443c01a7336-23c6e552cacmr40153115ad.30.1751459103084;
        Wed, 02 Jul 2025 05:25:03 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e1b49sm131147265ad.22.2025.07.02.05.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 05:25:02 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3] irqchip/riscv-imsic: Add kernel parameter to disable IPIs
Date: Wed,  2 Jul 2025 17:54:34 +0530
Message-ID: <20250702122434.1514328-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When injecting IPIs to a set of harts, the IMSIC IPI support will do
a separate MMIO write to the SETIPNUM_LE register of each target hart.
This means on a platform where IMSIC is trap-n-emulated, there will be
N MMIO traps when injecting IPI to N target harts hence IMSIC IPIs will
be slow on such platform compared to the SBI IPI extension.

Unfortunately, there is no DT, ACPI, or any other way of discovering
whether the underlying IMSIC is trap-n-emulated. Using MMIO write to
the SETIPNUM_LE register for injecting IPI is purely a software choice
in the IMSIC driver hence add a kernel parameter to allow users disable
IMSIC IPIs on platforms with trap-n-emulated IMSIC.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
Changes since v2:
 - Skip enabling/disabling IMSIC_IPI_ID in imsic_ipi_starting_cpu()
   and imsic_ipi_dying_cpu() when imsic_noipi is set
 - Re-use the reserved IPI ID for devices when imsic_noipi is set
Changes since v1:
 - Added more details to patch description
---
 .../admin-guide/kernel-parameters.txt         |  7 +++++++
 drivers/irqchip/irq-riscv-imsic-early.c       | 20 ++++++++++++++++++-
 drivers/irqchip/irq-riscv-imsic-state.c       |  7 ++++---
 drivers/irqchip/irq-riscv-imsic-state.h       |  1 +
 4 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f1f2c0874da9..7f0e12d0d260 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2538,6 +2538,13 @@
 			requires the kernel to be built with
 			CONFIG_ARM64_PSEUDO_NMI.
 
+	irqchip.riscv_imsic_noipi
+			[RISC-V,EARLY]
+			Force the kernel to not use IMSIC software injected MSIs
+			as IPIs. Intended for system where IMSIC is trap-n-emulated,
+			and thus want to reduce MMIO traps when triggering IPIs
+			to multiple harts.
+
 	irqfixup	[HW]
 			When an interrupt is not handled search all handlers
 			for it. Intended to get systems with badly broken
diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 1dbc41d7fe80..7e71f41c0d46 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -9,6 +9,7 @@
 #include <linux/cpu.h>
 #include <linux/export.h>
 #include <linux/interrupt.h>
+#include <linux/init.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
@@ -22,6 +23,14 @@
 #include "irq-riscv-imsic-state.h"
 
 static int imsic_parent_irq;
+bool imsic_noipi;
+
+static int __init imsic_noipi_cfg(char *buf)
+{
+	imsic_noipi = true;
+	return 0;
+}
+early_param("irqchip.riscv_imsic_noipi", imsic_noipi_cfg);
 
 #ifdef CONFIG_SMP
 static void imsic_ipi_send(unsigned int cpu)
@@ -33,12 +42,18 @@ static void imsic_ipi_send(unsigned int cpu)
 
 static void imsic_ipi_starting_cpu(void)
 {
+	if (imsic_noipi)
+		return;
+
 	/* Enable IPIs for current CPU. */
 	__imsic_id_set_enable(IMSIC_IPI_ID);
 }
 
 static void imsic_ipi_dying_cpu(void)
 {
+	if (imsic_noipi)
+		return;
+
 	/* Disable IPIs for current CPU. */
 	__imsic_id_clear_enable(IMSIC_IPI_ID);
 }
@@ -47,6 +62,9 @@ static int __init imsic_ipi_domain_init(void)
 {
 	int virq;
 
+	if (imsic_noipi)
+		return 0;
+
 	/* Create IMSIC IPI multiplexing */
 	virq = ipi_mux_create(IMSIC_NR_IPI, imsic_ipi_send);
 	if (virq <= 0)
@@ -89,7 +107,7 @@ static void imsic_handle_irq(struct irq_desc *desc)
 	while ((local_id = csr_swap(CSR_TOPEI, 0))) {
 		local_id >>= TOPEI_ID_SHIFT;
 
-		if (local_id == IMSIC_IPI_ID) {
+		if (!imsic_noipi && local_id == IMSIC_IPI_ID) {
 			if (IS_ENABLED(CONFIG_SMP))
 				ipi_mux_process();
 			continue;
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 77670dd645ac..dc95ad856d80 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -134,7 +134,7 @@ static bool __imsic_local_sync(struct imsic_local_priv *lpriv)
 	lockdep_assert_held(&lpriv->lock);
 
 	for_each_set_bit(i, lpriv->dirty_bitmap, imsic->global.nr_ids + 1) {
-		if (!i || i == IMSIC_IPI_ID)
+		if (!i || (!imsic_noipi && i == IMSIC_IPI_ID))
 			goto skip;
 		vec = &lpriv->vectors[i];
 
@@ -419,7 +419,7 @@ void imsic_vector_debug_show(struct seq_file *m, struct imsic_vector *vec, int i
 	seq_printf(m, "%*starget_cpu      : %5u\n", ind, "", vec->cpu);
 	seq_printf(m, "%*starget_local_id : %5u\n", ind, "", vec->local_id);
 	seq_printf(m, "%*sis_reserved     : %5u\n", ind, "",
-		   (vec->local_id <= IMSIC_IPI_ID) ? 1 : 0);
+		   (!imsic_noipi && vec->local_id <= IMSIC_IPI_ID) ? 1 : 0);
 	seq_printf(m, "%*sis_enabled      : %5u\n", ind, "", is_enabled ? 1 : 0);
 	seq_printf(m, "%*sis_move_pending : %5u\n", ind, "", mvec ? 1 : 0);
 	if (mvec) {
@@ -583,7 +583,8 @@ static int __init imsic_matrix_init(void)
 	irq_matrix_assign_system(imsic->matrix, 0, false);
 
 	/* Reserve IPI ID because it is special and used internally */
-	irq_matrix_assign_system(imsic->matrix, IMSIC_IPI_ID, false);
+	if (!imsic_noipi)
+		irq_matrix_assign_system(imsic->matrix, IMSIC_IPI_ID, false);
 
 	return 0;
 }
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 3202ffa4e849..57f951952b0c 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -61,6 +61,7 @@ struct imsic_priv {
 	struct irq_domain			*base_domain;
 };
 
+extern bool imsic_noipi;
 extern struct imsic_priv *imsic;
 
 void __imsic_eix_update(unsigned long base_id, unsigned long num_id, bool pend, bool val);
-- 
2.43.0

