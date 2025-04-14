Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA78E267386
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624200; cv=none; b=D2sybcCMx+oxVhgS1Gp9mGAZRY1qkyK9uwvdhvvAtaysRJ/1WRoDb+t9Bxa1ssB9KxAJRP9cJjZ7zSA+OuUY7QmjfLskGZWkqOZnsppvFRuDbrpBHZMH3QEvqtH7zl+/ptx9XlH9/zjpIapamPkiISiNq/X9HWCxdDtUd59R5nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624200; c=relaxed/simple;
	bh=9ukI5iPUv8J84CoV1OEbUeSFBHIZ7pB9cPVw1XNT34Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KyxznSpxJ8+88uDE9yYQrlOs5tKR8IvEYraKYSkzQ3SqdPA+TB2JFxyihlyrIWXDR1JI3WIy/MNt4slsIqVFDLf6LdEjSyyZDcqfrtzD7r/78dXdJbYiiBhC2MenUWBM4zKLCXghXCqdqZSjfH242d7xPkoWahdbmSf+Ydd8zQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kpaugnsG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kpaugnsG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744624199; x=1776160199;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9ukI5iPUv8J84CoV1OEbUeSFBHIZ7pB9cPVw1XNT34Y=;
  b=kpaugnsGC6wyHIo5EIPX3iyr5vMMmp3vJiDzJ8mSNk37yxUyly15bLXo
   adl3k5+SJHs36yUQgkP+O8OAH4pKbXT/SjAc2O+3DnJ7i6pM7+YYzHSd4
   tCVfM5QofbmDoJi2U9SmjF0EBecGXeXY8ZAM/VOboaxyISVdk8GN0UQSQ
   oCGfKZ8pA8iEV6pkgnXMi7Cadeqd/jEvBtT7EnnQNOZ4nxWGDSjHSuqrk
   eQR/vo170XnlaAliWRB3XSSHzeV+cyHlTzvYv/MvnJppsL7nxPoXzozMP
   Vve/AF1N9MQSQe/XH0M3AGmilVdCJLjz6+rfxe42IMyCviMfXHoai8xw6
   w==;
X-CSE-ConnectionGUID: pIT1yr8oRuuFwt/xc1Ohuw==
X-CSE-MsgGUID: l1MCvREuR4yJ8RreA0IKfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45222750"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="45222750"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 02:49:45 -0700
X-CSE-ConnectionGUID: oxngW+g7SgKU5O2eFAjHPw==
X-CSE-MsgGUID: B/x0YIgKTz2xGpBpNIyWiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="152954945"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 02:49:38 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Karthik Poosa <karthik.poosa@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	Oren Weil <oren.jer.weil@intel.com>,
	linux-mtd@lists.infradead.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Tomas Winkler <tomasw@gmail.com>,
	Vitaly Lubart <lubvital@gmail.com>
Subject: [PATCH v8 05/12] mtd: intel-dg: register with mtd
Date: Mon, 14 Apr 2025 12:37:56 +0300
Message-ID: <20250414093803.2133463-6-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414093803.2133463-1-alexander.usyskin@intel.com>
References: <20250414093803.2133463-1-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register the on-die nvm device with the mtd subsystem.
Refcount nvm object on _get and _put mtd callbacks.
For erase operation address and size should be 4K aligned.
For write operation address and size has to be 4bytes aligned.

CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
Co-developed-by: Tomas Winkler <tomasw@gmail.com>
Signed-off-by: Tomas Winkler <tomasw@gmail.com>
Co-developed-by: Vitaly Lubart <lubvital@gmail.com>
Signed-off-by: Vitaly Lubart <lubvital@gmail.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/mtd/devices/mtd_intel_dg.c | 230 ++++++++++++++++++++++++++++-
 1 file changed, 226 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
index 6f67cf966d05..4023f2ebc344 100644
--- a/drivers/mtd/devices/mtd_intel_dg.c
+++ b/drivers/mtd/devices/mtd_intel_dg.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/intel_dg_nvm_aux.h>
@@ -12,6 +13,8 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
 #include <linux/string.h>
 #include <linux/slab.h>
 #include <linux/sizes.h>
@@ -19,6 +22,8 @@
 
 struct intel_dg_nvm {
 	struct kref refcnt;
+	struct mtd_info mtd;
+	struct mutex lock; /* region access lock */
 	void __iomem *base;
 	size_t size;
 	unsigned int nregions;
@@ -177,7 +182,6 @@ static int idg_nvm_is_valid(struct intel_dg_nvm *nvm)
 	return 0;
 }
 
-__maybe_unused
 static unsigned int idg_nvm_get_region(const struct intel_dg_nvm *nvm, loff_t from)
 {
 	unsigned int i;
@@ -209,7 +213,6 @@ static ssize_t idg_nvm_rewrite_partial(struct intel_dg_nvm *nvm, loff_t to,
 	return len;
 }
 
-__maybe_unused
 static ssize_t idg_write(struct intel_dg_nvm *nvm, u8 region,
 			 loff_t to, size_t len, const unsigned char *buf)
 {
@@ -266,7 +269,6 @@ static ssize_t idg_write(struct intel_dg_nvm *nvm, u8 region,
 	return len;
 }
 
-__maybe_unused
 static ssize_t idg_read(struct intel_dg_nvm *nvm, u8 region,
 			loff_t from, size_t len, unsigned char *buf)
 {
@@ -325,7 +327,6 @@ static ssize_t idg_read(struct intel_dg_nvm *nvm, u8 region,
 	return len;
 }
 
-__maybe_unused
 static ssize_t
 idg_erase(struct intel_dg_nvm *nvm, u8 region, loff_t from, u64 len, u64 *fail_addr)
 {
@@ -414,6 +415,147 @@ static int intel_dg_nvm_init(struct intel_dg_nvm *nvm, struct device *device)
 	return n;
 }
 
+static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
+{
+	struct intel_dg_nvm *nvm = mtd->priv;
+	unsigned int idx;
+	u8 region;
+	u64 addr;
+	ssize_t bytes;
+	loff_t from;
+	size_t len;
+	size_t total_len;
+
+	if (WARN_ON(!nvm))
+		return -EINVAL;
+
+	if (!IS_ALIGNED(info->addr, SZ_4K) || !IS_ALIGNED(info->len, SZ_4K)) {
+		dev_err(&mtd->dev, "unaligned erase %llx %llx\n",
+			info->addr, info->len);
+		info->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
+		return -EINVAL;
+	}
+
+	total_len = info->len;
+	addr = info->addr;
+
+	guard(mutex)(&nvm->lock);
+
+	while (total_len > 0) {
+		if (!IS_ALIGNED(addr, SZ_4K) || !IS_ALIGNED(total_len, SZ_4K)) {
+			dev_err(&mtd->dev, "unaligned erase %llx %zx\n", addr, total_len);
+			info->fail_addr = addr;
+			return -ERANGE;
+		}
+
+		idx = idg_nvm_get_region(nvm, addr);
+		if (idx >= nvm->nregions) {
+			dev_err(&mtd->dev, "out of range");
+			info->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
+			return -ERANGE;
+		}
+
+		from = addr - nvm->regions[idx].offset;
+		region = nvm->regions[idx].id;
+		len = total_len;
+		if (len > nvm->regions[idx].size - from)
+			len = nvm->regions[idx].size - from;
+
+		dev_dbg(&mtd->dev, "erasing region[%d] %s from %llx len %zx\n",
+			region, nvm->regions[idx].name, from, len);
+
+		bytes = idg_erase(nvm, region, from, len, &info->fail_addr);
+		if (bytes < 0) {
+			dev_dbg(&mtd->dev, "erase failed with %zd\n", bytes);
+			info->fail_addr += nvm->regions[idx].offset;
+			return bytes;
+		}
+
+		addr += len;
+		total_len -= len;
+	}
+
+	return 0;
+}
+
+static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
+			     size_t *retlen, u_char *buf)
+{
+	struct intel_dg_nvm *nvm = mtd->priv;
+	ssize_t ret;
+	unsigned int idx;
+	u8 region;
+
+	if (WARN_ON(!nvm))
+		return -EINVAL;
+
+	idx = idg_nvm_get_region(nvm, from);
+
+	dev_dbg(&mtd->dev, "reading region[%d] %s from %lld len %zd\n",
+		nvm->regions[idx].id, nvm->regions[idx].name, from, len);
+
+	if (idx >= nvm->nregions) {
+		dev_err(&mtd->dev, "out of range");
+		return -ERANGE;
+	}
+
+	from -= nvm->regions[idx].offset;
+	region = nvm->regions[idx].id;
+	if (len > nvm->regions[idx].size - from)
+		len = nvm->regions[idx].size - from;
+
+	guard(mutex)(&nvm->lock);
+
+	ret = idg_read(nvm, region, from, len, buf);
+	if (ret < 0) {
+		dev_dbg(&mtd->dev, "read failed with %zd\n", ret);
+		return ret;
+	}
+
+	*retlen = ret;
+
+	return 0;
+}
+
+static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
+			      size_t *retlen, const u_char *buf)
+{
+	struct intel_dg_nvm *nvm = mtd->priv;
+	ssize_t ret;
+	unsigned int idx;
+	u8 region;
+
+	if (WARN_ON(!nvm))
+		return -EINVAL;
+
+	idx = idg_nvm_get_region(nvm, to);
+
+	dev_dbg(&mtd->dev, "writing region[%d] %s to %lld len %zd\n",
+		nvm->regions[idx].id, nvm->regions[idx].name, to, len);
+
+	if (idx >= nvm->nregions) {
+		dev_err(&mtd->dev, "out of range");
+		return -ERANGE;
+	}
+
+	to -= nvm->regions[idx].offset;
+	region = nvm->regions[idx].id;
+	if (len > nvm->regions[idx].size - to)
+		len = nvm->regions[idx].size - to;
+
+	guard(mutex)(&nvm->lock);
+
+	ret = idg_write(nvm, region, to, len, buf);
+	if (ret < 0) {
+		dev_dbg(&mtd->dev, "write failed with %zd\n", ret);
+		return ret;
+	}
+
+	*retlen = ret;
+
+	return 0;
+}
+
 static void intel_dg_nvm_release(struct kref *kref)
 {
 	struct intel_dg_nvm *nvm = container_of(kref, struct intel_dg_nvm, refcnt);
@@ -422,9 +564,80 @@ static void intel_dg_nvm_release(struct kref *kref)
 	pr_debug("freeing intel_dg nvm\n");
 	for (i = 0; i < nvm->nregions; i++)
 		kfree(nvm->regions[i].name);
+	mutex_destroy(&nvm->lock);
 	kfree(nvm);
 }
 
+static int intel_dg_mtd_get_device(struct mtd_info *mtd)
+{
+	struct mtd_info *master = mtd_get_master(mtd);
+	struct intel_dg_nvm *nvm = master->priv;
+
+	if (WARN_ON(!nvm))
+		return -EINVAL;
+	pr_debug("get mtd %s %d\n", mtd->name, kref_read(&nvm->refcnt));
+	kref_get(&nvm->refcnt);
+
+	return 0;
+}
+
+static void intel_dg_mtd_put_device(struct mtd_info *mtd)
+{
+	struct mtd_info *master = mtd_get_master(mtd);
+	struct intel_dg_nvm *nvm = master->priv;
+
+	if (WARN_ON(!nvm))
+		return;
+	pr_debug("put mtd %s %d\n", mtd->name, kref_read(&nvm->refcnt));
+	kref_put(&nvm->refcnt, intel_dg_nvm_release);
+}
+
+static int intel_dg_nvm_init_mtd(struct intel_dg_nvm *nvm, struct device *device,
+				 unsigned int nparts, bool writable_override)
+{
+	unsigned int i;
+	unsigned int n;
+	struct mtd_partition *parts = NULL;
+	int ret;
+
+	dev_dbg(device, "registering with mtd\n");
+
+	nvm->mtd.owner = THIS_MODULE;
+	nvm->mtd.dev.parent = device;
+	nvm->mtd.flags = MTD_CAP_NORFLASH | MTD_WRITEABLE;
+	nvm->mtd.type = MTD_DATAFLASH;
+	nvm->mtd.priv = nvm;
+	nvm->mtd._write = intel_dg_mtd_write;
+	nvm->mtd._read = intel_dg_mtd_read;
+	nvm->mtd._erase = intel_dg_mtd_erase;
+	nvm->mtd._get_device = intel_dg_mtd_get_device;
+	nvm->mtd._put_device = intel_dg_mtd_put_device;
+	nvm->mtd.writesize = SZ_1; /* 1 byte granularity */
+	nvm->mtd.erasesize = SZ_4K; /* 4K bytes granularity */
+	nvm->mtd.size = nvm->size;
+
+	parts = kcalloc(nvm->nregions, sizeof(*parts), GFP_KERNEL);
+	if (!parts)
+		return -ENOMEM;
+
+	for (i = 0, n = 0; i < nvm->nregions && n < nparts; i++) {
+		if (!nvm->regions[i].is_readable)
+			continue;
+		parts[n].name = nvm->regions[i].name;
+		parts[n].offset  = nvm->regions[i].offset;
+		parts[n].size = nvm->regions[i].size;
+		if (!nvm->regions[i].is_writable && !writable_override)
+			parts[n].mask_flags = MTD_WRITEABLE;
+		n++;
+	}
+
+	ret = mtd_device_register(&nvm->mtd, parts, n);
+
+	kfree(parts);
+
+	return ret;
+}
+
 static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 			      const struct auxiliary_device_id *aux_dev_id)
 {
@@ -454,6 +667,7 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 		return -ENOMEM;
 
 	kref_init(&nvm->refcnt);
+	mutex_init(&nvm->lock);
 
 	nvm->nregions = nregions;
 	for (n = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
@@ -483,6 +697,12 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 		goto err;
 	}
 
+	ret = intel_dg_nvm_init_mtd(nvm, device, ret, invm->writable_override);
+	if (ret) {
+		dev_err(device, "failed init mtd %d\n", ret);
+		goto err;
+	}
+
 	dev_set_drvdata(&aux_dev->dev, nvm);
 
 	return 0;
@@ -499,6 +719,8 @@ static void intel_dg_mtd_remove(struct auxiliary_device *aux_dev)
 	if (!nvm)
 		return;
 
+	mtd_device_unregister(&nvm->mtd);
+
 	dev_set_drvdata(&aux_dev->dev, NULL);
 
 	kref_put(&nvm->refcnt, intel_dg_nvm_release);
-- 
2.43.0

