Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0FD2517B1
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744899962; cv=none; b=U9mx6e+4FIbrmTbEImutPcaa9bwoRxXJdwdkV2rclnRqZfCgn1/lqG/hNQ0Zd5k6BFmxkc2Fb3rIAg1TdO5heb92dxUhFmxhMwFHYQWBbRZq06Xw5urjG7eNuLmdQpLyRssRYiJAiQSehB3wPzqkdB0A5M+nZhMAr+mnA/AJU0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744899962; c=relaxed/simple;
	bh=9+7vjTgR6tOQBxCEXpe9sEq8U3zVklK5iZhpXv4zvQk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Ob1cmyNrGaCo6q0RmkTCOiXZe7DbNDzQVU5Rfloy4IsmT58aL9tpqOjxa0sKItEewowOAPv450mwShQKYwZBV/JYm4mx/8VX8EpZj4MKUhPxJxyjcZGc0aNN9kCs7ivSOIK90+qCXd+hOUq3R0SB4lt1ohRueEKJe0pkaF3woaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mclapinski.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rbXeIrKS; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mclapinski.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rbXeIrKS"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-5f435440b1cso749167a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744899957; x=1745504757; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H+sdaqbuJVHJwWuSmsh/GQYswrYAxKRQh26GCaZXhok=;
        b=rbXeIrKSY/Ff+9Ci02eGxUEnuvDiVWbTrzlPtJ9Pibc/3urGW8uWcQ9DFqpFnD9/k0
         +s9LUWApF5c8TtkzISC+EmQw6vKw1vWtFVfwD0eDMpRnRUddMSkgL8wowvN6e+7fVO8i
         YqVWbY65WeI9v6TgKmdufr8BJfruTVE/aVgoVocIZlgRNNIE6e3CVFDB9JlB0o0XjH4s
         /01QS+fi4Hm3aB2EYPfF3RcTcDOHAg38bmxMaq6IlRBASDOaPDqYLNXUR4irevNDhXnP
         oE4g/GwZZ7SJjmsODFnaSKLOBpVt0StNL3/GWKmNolm8qukI6cN5ROgsNQ3qLwrQVF9t
         77lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899957; x=1745504757;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H+sdaqbuJVHJwWuSmsh/GQYswrYAxKRQh26GCaZXhok=;
        b=wQneKiyYCD4eqv6rSvF1+9w60YhlPu8Vkdud1tTxlDwELWDoAcET1mzQFjtBRkDFMJ
         RZw8JL2Kp10n4DOmsUw7Zmp39Nvd/1UQsOW6P5DHgZ5b88asPUbjySXN5yfxDDBwVIQG
         6y843ZaxSsY4QZax2yor3J0R5NJkBk9wN0Moo3t94fyD38/D6hc6/FHD68eThm7/6P6O
         0YlowXlmPb9AsRwdHjIxm6p19Rbx1SMPCkledpp2nCbSfKYlL2HoeXLiDM/N0tBbKlHZ
         jv7KUCEHb5xZ4m98Xjp3PvTsJpApTh+zDvBPXOm0t9RZEvQfsA1m60eiJwS36sforrmH
         igGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfeh1mOK3RBM0wLk0v59qs9HI55aTmbQ4o+1j2makFcWPJlr2ICG2GzOL5RcIRhk0JA3YisomhiG+VdDo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd64oidE8K9lpE8Vaz/xTjmh/rfIEznL1+3GsnIkroNrxmfkub
	I8s7bs8UsjtdmeE1e4z1DK+GITBFK8NFmkmBHk3+CIxjOA2SoIY4MDF84bDHJjWFWvNJtzQvj2S
	4NLJJIj1JLTVndiItIg==
X-Google-Smtp-Source: AGHT+IGBqy5TobEpyVuaQspyqyuO7ng/tNpB3r9xw3JUF5HoHKa35Wf85wBwTqhq1424irAfhUpw80t6e7qsEfOU
X-Received: from edyv23.prod.google.com ([2002:a05:6402:1857:b0:5ec:9a93:5aac])
 (user=mclapinski job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:354e:b0:5f3:816b:c0cc with SMTP id 4fb4d7f45d1cf-5f4b7204c76mr5985652a12.10.1744899957654;
 Thu, 17 Apr 2025 07:25:57 -0700 (PDT)
Date: Thu, 17 Apr 2025 16:25:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
Message-ID: <20250417142525.78088-1-mclapinski@google.com>
Subject: [PATCH v2 1/1] libnvdimm/e820: Add a new parameter to configure many
 regions per e820 entry
From: Michal Clapinski <mclapinski@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, Dan Williams <dan.j.williams@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>
Cc: nvdimm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Michal Clapinski <mclapinski@google.com>
Content-Type: text/plain; charset="UTF-8"

Currently, the user has to specify each memory region to be used with
nvdimm via the memmap parameter. Due to the character limit of the
command line, this makes it impossible to have a lot of pmem devices.
This new parameter solves this issue by allowing users to divide
one e820 entry into many nvdimm regions.

This change is needed for the hypervisor live update. VMs' memory will
be backed by those emulated pmem devices. To support various VM shapes
I want to create devdax devices at 1GB granularity similar to hugetlb.

It's also possible to expand this parameter in the future,
e.g. to specify the type of the device (fsdax/devdax).

Signed-off-by: Michal Clapinski <mclapinski@google.com>
---
v2: Fixed a crash when pmem parameter is omitted.
---
 .../admin-guide/kernel-parameters.txt         |   7 +
 drivers/nvdimm/e820.c                         | 149 +++++++++++++++++-
 2 files changed, 153 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fb8752b42ec85..63af03eb850ed 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3849,6 +3849,13 @@
 
 	n2=		[NET] SDL Inc. RISCom/N2 synchronous serial card
 
+	nd_e820.pmem=ss[KMG],nn[KMG]
+			Divide one e820 entry specified by memmap=x!ss
+			(that is starting at ss) into pmem devices of size nn.
+			There can be only one pmem parameter per one e820
+			entry. The size of the e820 entry has to be divisible
+			by the device size.
+
 	netdev=		[NET] Network devices parameters
 			Format: <irq>,<io>,<mem_start>,<mem_end>,<name>
 			Note that mem_start is often overloaded to mean
diff --git a/drivers/nvdimm/e820.c b/drivers/nvdimm/e820.c
index 41c67dfa80158..b5559e2e6fc9f 100644
--- a/drivers/nvdimm/e820.c
+++ b/drivers/nvdimm/e820.c
@@ -8,6 +8,87 @@
 #include <linux/libnvdimm.h>
 #include <linux/module.h>
 #include <linux/numa.h>
+#include <linux/moduleparam.h>
+#include <linux/xarray.h>
+
+#define MAX_PMEM_ARGUMENTS 32
+
+static char *pmem[MAX_PMEM_ARGUMENTS];
+static int pmem_count;
+
+static int pmem_param_set(const char *arg, const struct kernel_param *kp)
+{
+	int rc;
+	struct kernel_param kp_new;
+
+	kp_new.name = kp->name;
+	kp_new.arg = &pmem[pmem_count];
+	rc = param_set_charp(arg, &kp_new);
+	if (rc)
+		return rc;
+	++pmem_count;
+	return 0;
+}
+
+static void pmem_param_free(void *arg)
+{
+	int i;
+
+	for (i = 0; i < pmem_count; ++i)
+		param_free_charp(&pmem[i]);
+
+	pmem_count = 0;
+}
+
+static const struct kernel_param_ops pmem_param_ops = {
+	.set =		pmem_param_set,
+	.free =		pmem_param_free,
+};
+module_param_cb(pmem, &pmem_param_ops, NULL, 0);
+
+struct pmem_entry {
+	unsigned long region_size;
+};
+
+static int parse_one_pmem_arg(struct xarray *xarray, char *p)
+{
+	int rc = -EINVAL;
+	char *oldp;
+	unsigned long start;
+	struct pmem_entry *entry = kmalloc(sizeof(*entry), GFP_KERNEL);
+
+	if (!entry)
+		return -ENOMEM;
+
+	oldp = p;
+	start = memparse(p, &p);
+	if (p == oldp || *p != ',') {
+		pr_err("Can't parse pmem start: %s\n", oldp);
+		goto err;
+	}
+	++p;
+
+	oldp = p;
+	entry->region_size = memparse(p, &p);
+	if (p == oldp || (*p != ',' && *p != '\0')) {
+		pr_err("Can't parse pmem region size: %s\n", oldp);
+		goto err;
+	}
+
+	if (*p != '\0')
+		pr_warn("Unexpected parameters in pmem arg: %s\n", p);
+
+	rc = xa_err(xa_store(xarray, start, entry, GFP_KERNEL));
+	if (rc) {
+		pr_err("Failed to store 0x%lx in xarray, error %d\n", start, rc);
+		goto err;
+	}
+	return 0;
+
+err:
+	kfree(entry);
+	return rc;
+}
 
 static void e820_pmem_remove(struct platform_device *pdev)
 {
@@ -16,10 +97,9 @@ static void e820_pmem_remove(struct platform_device *pdev)
 	nvdimm_bus_unregister(nvdimm_bus);
 }
 
-static int e820_register_one(struct resource *res, void *data)
+static int register_one_pmem(struct resource *res, struct nvdimm_bus *nvdimm_bus)
 {
 	struct nd_region_desc ndr_desc;
-	struct nvdimm_bus *nvdimm_bus = data;
 	int nid = phys_to_target_node(res->start);
 
 	memset(&ndr_desc, 0, sizeof(ndr_desc));
@@ -32,12 +112,64 @@ static int e820_register_one(struct resource *res, void *data)
 	return 0;
 }
 
+struct walk_data {
+	struct xarray *pmem_xarray;
+	struct nvdimm_bus *nvdimm_bus;
+};
+
+static int e820_handle_one_entry(struct resource *res, void *data)
+{
+	struct walk_data *walk_data = data;
+	struct resource res_local;
+	struct pmem_entry *entry;
+	unsigned long entry_size = resource_size(res);
+	int rc;
+
+	entry = xa_load(walk_data->pmem_xarray, res->start);
+
+	if (!entry)
+		return register_one_pmem(res, walk_data->nvdimm_bus);
+
+	if (entry_size % entry->region_size != 0) {
+		pr_err("Entry size %lu is not divisible by region size %lu\n",
+		       entry_size, entry->region_size);
+		return -EINVAL;
+	}
+
+	res_local.start = res->start;
+	res_local.end = res->start + entry->region_size - 1;
+	while (res_local.end <= res->end) {
+		rc = register_one_pmem(&res_local, walk_data->nvdimm_bus);
+		if (rc)
+			return rc;
+
+		res_local.start += entry->region_size;
+		res_local.end += entry->region_size;
+	}
+
+	return 0;
+}
+
+static void free_pmem_xarray(struct xarray *pmem_xarray)
+{
+	unsigned long start;
+	struct pmem_entry *entry;
+
+	xa_for_each(pmem_xarray, start, entry) {
+		kfree(entry);
+	}
+	xa_destroy(pmem_xarray);
+}
+
 static int e820_pmem_probe(struct platform_device *pdev)
 {
 	static struct nvdimm_bus_descriptor nd_desc;
 	struct device *dev = &pdev->dev;
 	struct nvdimm_bus *nvdimm_bus;
+	struct xarray pmem_xarray;
+	struct walk_data walk_data = {.pmem_xarray = &pmem_xarray};
 	int rc = -ENXIO;
+	int i;
 
 	nd_desc.provider_name = "e820";
 	nd_desc.module = THIS_MODULE;
@@ -46,8 +178,19 @@ static int e820_pmem_probe(struct platform_device *pdev)
 		goto err;
 	platform_set_drvdata(pdev, nvdimm_bus);
 
+	xa_init(&pmem_xarray);
+	for (i = 0; i < pmem_count; i++) {
+		rc = parse_one_pmem_arg(&pmem_xarray, pmem[i]);
+		if (rc != 0 && rc != -EINVAL) {
+			free_pmem_xarray(&pmem_xarray);
+			goto err;
+		}
+	}
+
+	walk_data.nvdimm_bus = nvdimm_bus;
 	rc = walk_iomem_res_desc(IORES_DESC_PERSISTENT_MEMORY_LEGACY,
-			IORESOURCE_MEM, 0, -1, nvdimm_bus, e820_register_one);
+		IORESOURCE_MEM, 0, -1, &walk_data, e820_handle_one_entry);
+	free_pmem_xarray(&pmem_xarray);
 	if (rc)
 		goto err;
 	return 0;
-- 
2.49.0.777.g153de2bbd5-goog

