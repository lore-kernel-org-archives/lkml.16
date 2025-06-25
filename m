Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF1F2ECEA3
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750870623; cv=none; b=M7dEx6QAsqnjRQVGSTBDdjXA2zeCMhrsrMOPYN7TJXYHtD2BtV0gp8LUqlRuFzvKVMlNsJ0XBZ/ploruYR7QIWZyyfLgiYYphBNAJQI18ei4J/oR8ZyDmOI3wq1KRSUTygJoGewsmT871KpDRD+A6pwzIOAePlZkZ4dHnr+gSKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750870623; c=relaxed/simple;
	bh=9+b4uaQGDlFPrBTtx9EMuF/EDYS/T1DcqTeYAOsTim8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s/PoHUDTLkDO4M212PJpqqu5KIbBbISXMkn5T934VUcM7exOcZ4NPzmm6pFdl7LBmW6AUuwk+w0D7QCZDEp1QWKw4ghDpSwiG5c6I6IaQlBUhfbek9QC0LivW96L7wG9G6Jnx887g2zZ52lrqviP4Az9GhDD7V0DCI5Wh/rpKZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VqiPu2N3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqiPu2N3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750870622; x=1782406622;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9+b4uaQGDlFPrBTtx9EMuF/EDYS/T1DcqTeYAOsTim8=;
  b=VqiPu2N3IedG+/y6cn+QNnqciQuUv7L21O381KHe3T6rJnVLxdZQUj/2
   tt+27UzI1nZ8ZBfEvZTNKuZUiDoymbxoZboh0eVoGdsCPCLkEW0CrCcv0
   alskhg9JhA4/3kauwc8Uki3AzlLMdQ3/IgVPT2Km3M1jNYKIOC4nD/Shq
   s4ryj9cAU13cVMoeSBGe0sMCpNjwsfbXj4F/zjUv4zvyTL/ifU+6LJjsU
   zQ/g2rd9Kh1/elcFnY5ak8uRv5jAMNasyI10vlINl1+vuuUpeNjWaVRZy
   CVASD3LDLFIeLuKjRx3pkEYK9gyf1Lmw6BvEQikJAF4BfEwXvN+c89fSx
   w==;
X-CSE-ConnectionGUID: 2osXp3lwRTG2TvB7HXjnmw==
X-CSE-MsgGUID: QYOoWjxZTiG3Ukhy7rvIhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53214461"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="53214461"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:57:02 -0700
X-CSE-ConnectionGUID: Rw0h/HxYQNWN2N/OscurxQ==
X-CSE-MsgGUID: qGI1XWVBT6OAGIZHJNVw2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="151696722"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:56:59 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com,
	alexander.usyskin@intel.com,
	gregkh@linuxfoundation.org,
	daniele.ceraolospurio@intel.com
Subject: [PATCH v4 08/10] drm/xe/xe_late_bind_fw: Introduce debug fs node to disable late binding
Date: Wed, 25 Jun 2025 22:30:13 +0530
Message-Id: <20250625170015.33912-9-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625170015.33912-1-badal.nilawar@intel.com>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a debug filesystem node to disable late binding fw reload
during the system or runtime resume. This is intended for situations
where the late binding fw needs to be loaded from user mode,
perticularly for validation purpose.
Note that xe kmd doesn't participate in late binding flow from user
space. Binary loaded from the userspace will be lost upon entering to
D3 cold hence user space app need to handle this situation.

v2:
  - s/(uval == 1) ? true : false/!!uval/ (Daniele)
v3:
  - Refine the commit message (Daniele)

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c            | 41 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw.c       |  3 ++
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  2 ++
 3 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d83cd6ed3fa8..d1f6f556efa2 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -226,6 +226,44 @@ static const struct file_operations atomic_svm_timeslice_ms_fops = {
 	.write = atomic_svm_timeslice_ms_set,
 };
 
+static ssize_t disable_late_binding_show(struct file *f, char __user *ubuf,
+					 size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	struct xe_late_bind *late_bind = &xe->late_bind;
+	char buf[32];
+	int len;
+
+	len = scnprintf(buf, sizeof(buf), "%d\n", late_bind->disable);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t disable_late_binding_set(struct file *f, const char __user *ubuf,
+					size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	struct xe_late_bind *late_bind = &xe->late_bind;
+	u32 uval;
+	ssize_t ret;
+
+	ret = kstrtouint_from_user(ubuf, size, sizeof(uval), &uval);
+	if (ret)
+		return ret;
+
+	if (uval > 1)
+		return -EINVAL;
+
+	late_bind->disable = !!uval;
+	return size;
+}
+
+static const struct file_operations disable_late_binding_fops = {
+	.owner = THIS_MODULE,
+	.read = disable_late_binding_show,
+	.write = disable_late_binding_set,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -249,6 +287,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("atomic_svm_timeslice_ms", 0600, root, xe,
 			    &atomic_svm_timeslice_ms_fops);
 
+	debugfs_create_file("disable_late_binding", 0600, root, xe,
+			    &disable_late_binding_fops);
+
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 737780336000..777f66692d7f 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -161,6 +161,9 @@ int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
 	if (!late_bind->component_added)
 		return -ENODEV;
 
+	if (late_bind->disable)
+		return 0;
+
 	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
 		lbfw = &late_bind->late_bind_fw[fw_id];
 		if (lbfw->valid)
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index f119a75f4c9c..16f2bd6bbdf1 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -71,6 +71,8 @@ struct xe_late_bind {
 	struct workqueue_struct *wq;
 	/** @late_bind.component_added: whether the component has been added */
 	bool component_added;
+	/** @late_bind.disable to block late binding reload during pm resume flow*/
+	bool disable;
 };
 
 #endif
-- 
2.34.1

