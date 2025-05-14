Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D581FE47C
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 05:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747202278; cv=none; b=kpIR1cu6NNYP9YZBAeGkOkcmnvhZUvDLC91WrpVeBVzVtle9vUUV9cQQQFV7PlfCpwcQ5abACZTU0qQ9TMtYb1y2eYOiWw4JUdsPDyF6bsfjokPrQ3NhVyTfd7Ky/jQA2UxZdgMH6KPBh01c8k3PftR/1FxBLHFi1Tn0BLAaA/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747202278; c=relaxed/simple;
	bh=Tr1XOcL/8BhgssUXkqbsbVw45YsiIW9Uliv4Chah6tw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z8frBXBprK6mfJo7hUm/XPdGx2IhAdW8Aq/CT7D6TB3zksb25XHqyHi0B3YKa3j4HHs3uO0Uv2H2PZ2UkOprLE/QlC9IwHOaBo4VF7j+4dlFctgmnNqMpRS5+F5W8au6jDT7ZLe+L1NCMor4MDGj9n8IFdlxmDZ/YfI6FiuZhGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Y93/QNry; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Y93/QNry"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22e331215dbso3759625ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 22:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747202275; x=1747807075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbiDocnvP7/vIiwuy9W9uCrvaQAnUMotSiyx0gsvykM=;
        b=Y93/QNryKzPjggxdmU6PaxS+hRZn0l4pqNnQmI5nZQaSeu+phPrdCcCbiq62rdxFpP
         9MCj7k/pF8uiFMoztkefg/bn7SpASoS6vPZ9sK2FnGKyLsaqZXT9mKmDy8zcl7bEIDPc
         +hkBk3BSunjNy2xmQtOpEZSQLq2IO6Odj+ykWHuYDLDHnKzoh8NxZVIrw1kCTCYwOA0M
         TH7yUNOSmG2UC6P3hOOrAkAzVRDlrcrojC2c26THdFG3OPaAxkNUV0PaudyMT12XmSs2
         lI0to+K7CtC7aa64EG5NaXAhtsYi2fIGDxWKeDu/9q7zpA/8AbayESFob8NoyqLWIhg2
         9PwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747202275; x=1747807075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbiDocnvP7/vIiwuy9W9uCrvaQAnUMotSiyx0gsvykM=;
        b=RDvJC51xIdwXlvlaiGvyc4BzAcPXg14OHxvZ0uxEy0cmB6bK4Z2aTYymMnzY4dFTeo
         bK6IoK9GbIYug4CHGU9FN5Vd4bbEwS4Jw5N8gol+yEf6yZn1BRUfOz3mkcQAb8tYPPd9
         Ze3howUfuCKewDsdSmLT3EF7ai7JeihjagoxETgwmmB6MAhp8ekOUt7BERrgYWElk1vZ
         F1UEyzp02qcWgG5KgOoGaheNp1QrNb6dtNFwvXT+RsdKXE254q78lkfeZabVo6HVmi/B
         74vPTtDbMcxMbgOhERxKb9MjH/r7xe9vrqwrZWqkCH866503Io38mAQ4CvODEj46zZRb
         CAVQ==
X-Gm-Message-State: AOJu0YzzFnaOOJ/8p7r2iET+v/QLKX3T7pg1Fa0fgHapuMup8tkzriec
	Bc0B+r62BB8NSugjJtxz61M4mASDc3BRaU4CSigkuCHU/tAvt5oWnSWirSWkWrW9Jc2W7qsll1Z
	MIjU=
X-Gm-Gg: ASbGnctAR99bOZ8Wt78i7jO3PX3jnJQVMEwI1jmoWXapULuXXS63vHXRT4I46KsnIZt
	2xV+r8W+OeufnyTu1QuUi8pGBXmyiADj+wezIW8Bazcy1hedEBHh9FniTrekRwEiFmiL/E3lAyL
	l/C0jJEq/7XlVfd5hr5wdwNoNFk7X2Aid8MhD0ZKajigrI3VFHX/Utu+vRB7QjZYgSN86Kuo5Gi
	MIa1E/xBXmu/FOZNKIJf33lUAClpWp/l5dc5+E2wcBDVBYdHpjsZUpO7wgJlJEXIPZPW28MwmJI
	IgKEukXkegDfBtxvd50GjOHUaIc/IAMnPU196T0bO0RP5JyKXEKpAEoMetoVNQ==
X-Google-Smtp-Source: AGHT+IGgGwlhXhb97hz7G/rQ5hnEoBLy0AHEplWytso8kcAajszMRL1hQAHqjtumZAwOWQTJC9TsUw==
X-Received: by 2002:a17:903:32d1:b0:223:807f:7f92 with SMTP id d9443c01a7336-2317cb4f087mr83654885ad.20.1747202275325;
        Tue, 13 May 2025 22:57:55 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.196.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271c2dsm91721615ad.135.2025.05.13.22.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 22:57:54 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev,
	acpica-devel@lists.linux.dev
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 4/4] iommu/riscv: Add ACPI support
Date: Wed, 14 May 2025 11:27:23 +0530
Message-ID: <20250514055723.1328557-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514055723.1328557-1-sunilvl@ventanamicro.com>
References: <20250514055723.1328557-1-sunilvl@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RISC-V IO Mapping Table (RIMT) provides the information about the IOMMU
to the OS in ACPI. Add support for ACPI in RISC-V IOMMU drivers by using
RIMT data.

The changes at high level are,

a) Register the IOMMU with RIMT data structures.
b) Enable probing of platform IOMMU in ACPI way using the ACPIID defined
   for the RISC-V IOMMU in the BRS spec [1]. Configure the MSI domain if
   the platform IOMMU uses MSIs.

[1] - https://github.com/riscv-non-isa/riscv-brs/blob/main/acpi-id.adoc

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/iommu/riscv/iommu-platform.c | 17 ++++++++++++++++-
 drivers/iommu/riscv/iommu.c          | 10 ++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
index 725e919b97ef..83a28c83f991 100644
--- a/drivers/iommu/riscv/iommu-platform.c
+++ b/drivers/iommu/riscv/iommu-platform.c
@@ -10,6 +10,8 @@
  *	Tomasz Jeznach <tjeznach@rivosinc.com>
  */
 
+#include <linux/acpi.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/kernel.h>
 #include <linux/msi.h>
 #include <linux/of_irq.h>
@@ -46,6 +48,7 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
 	enum riscv_iommu_igs_settings igs;
 	struct device *dev = &pdev->dev;
 	struct riscv_iommu_device *iommu = NULL;
+	struct irq_domain *msi_domain;
 	struct resource *res = NULL;
 	int vec, ret;
 
@@ -76,8 +79,13 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
 	switch (igs) {
 	case RISCV_IOMMU_CAPABILITIES_IGS_BOTH:
 	case RISCV_IOMMU_CAPABILITIES_IGS_MSI:
-		if (is_of_node(dev->fwnode))
+		if (is_of_node(dev_fwnode(dev))) {
 			of_msi_configure(dev, to_of_node(dev->fwnode));
+		} else {
+			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
+							      DOMAIN_BUS_PLATFORM_MSI);
+			dev_set_msi_domain(dev, msi_domain);
+		}
 
 		if (!dev_get_msi_domain(dev)) {
 			dev_warn(dev, "failed to find an MSI domain\n");
@@ -150,6 +158,12 @@ static const struct of_device_id riscv_iommu_of_match[] = {
 	{},
 };
 
+static const struct acpi_device_id riscv_iommu_acpi_match[] = {
+	{ "RSCV0004", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, riscv_iommu_acpi_match);
+
 static struct platform_driver riscv_iommu_platform_driver = {
 	.probe = riscv_iommu_platform_probe,
 	.remove = riscv_iommu_platform_remove,
@@ -158,6 +172,7 @@ static struct platform_driver riscv_iommu_platform_driver = {
 		.name = "riscv,iommu",
 		.of_match_table = riscv_iommu_of_match,
 		.suppress_bind_attrs = true,
+		.acpi_match_table = riscv_iommu_acpi_match,
 	},
 };
 
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 8f049d4a0e2c..e51af4ba54a8 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -12,6 +12,8 @@
 
 #define pr_fmt(fmt) "riscv-iommu: " fmt
 
+#include <linux/acpi.h>
+#include <linux/acpi_rimt.h>
 #include <linux/compiler.h>
 #include <linux/crash_dump.h>
 #include <linux/init.h>
@@ -1650,6 +1652,14 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 		goto err_iodir_off;
 	}
 
+	if (!acpi_disabled) {
+		rc = rimt_iommu_register(iommu->dev);
+		if (rc) {
+			dev_err_probe(iommu->dev, rc, "cannot register iommu with RIMT\n");
+			goto err_remove_sysfs;
+		}
+	}
+
 	rc = iommu_device_register(&iommu->iommu, &riscv_iommu_ops, iommu->dev);
 	if (rc) {
 		dev_err_probe(iommu->dev, rc, "cannot register iommu interface\n");
-- 
2.43.0

