Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730122FCFC8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751647601; cv=none; b=DYiUeWqj2f1wmkYPD4V6jaShrGz63xJv3h02ZRRFllxy21JTLoCkCniICoESG1XcpJhMr2Hz3KxaItfQh29lp5ExFsodZExT0WqBG35DLrRJI9R9Q4LBYinBG2owLzx/bcou2AJPY02K8vjv3r5CbJa/D1rhpsYAmH4hIXy+D20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751647601; c=relaxed/simple;
	bh=1R19Idxj3kDius8mWLm6qMihg2h0FoKBMPBhn7+/M6A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=udp9kL6VayicadPGbhTncvEz/TSjToDGhOoPlu54Cr4JCrwtmYwDzRYssWQJ1VrIuwGRgZss+MMvU70lP33s76PD2ozdg5ITvOTc2zi4Edw0ttwKq1QU/1yJVG0s7BwVtcHL0Ue99e0RQ/tYXLgzfyalxqWA0SFzOzB4yWdfvU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iSKp99Rm; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iSKp99Rm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751647599; x=1783183599;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1R19Idxj3kDius8mWLm6qMihg2h0FoKBMPBhn7+/M6A=;
  b=iSKp99RmLkTk5WC0Zf3Usc+Vx5rCSJU+h4/YGtp5fWS0rEHIHW4295fv
   GlCRxiZtvi+EwP1C92thVpZvdX1k7GEbDihEoYb06vEbME54ctPyh6TF8
   wPl8T8QeaMvIT4tPxLa/IQyDJCHJpky00E+oI8pKjjqwHfiwulfHT02Uy
   c6vVLMgtMr9yPKHAqtSggXupsPtJHFg+eWz6WVI3ABZE5+ptmoqbqrrb7
   vGy/RvVhbowPlkoYMVONrPQrgEDu/B/ytH4ZgkZY8+uY9pTT/jQTYqn9t
   TDpoh4QYsc62D4IvWjzVBS1mLORORmoWSs2yZg5uRBXcD9RvrNG+jbvLx
   A==;
X-CSE-ConnectionGUID: 2X4xkB5UTuG2Oe7Ai/AynA==
X-CSE-MsgGUID: WpQe4FThSHirILkj+hKAQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="57755816"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="57755816"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 09:46:39 -0700
X-CSE-ConnectionGUID: WZhNj9sXQ1+b/4cggeazrA==
X-CSE-MsgGUID: OvAJUMiERPKM62N5gEJDqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="154424731"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 09:46:37 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com,
	alexander.usyskin@intel.com,
	gregkh@linuxfoundation.org,
	daniele.ceraolospurio@intel.com
Subject: [PATCH v7 08/10] drm/xe/xe_late_bind_fw: Introduce debug fs node to disable late binding
Date: Fri,  4 Jul 2025 22:20:36 +0530
Message-Id: <20250704165038.1464460-9-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704165038.1464460-1-badal.nilawar@intel.com>
References: <20250704165038.1464460-1-badal.nilawar@intel.com>
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
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
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
index 54ba0b57185b..3228864716b5 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -165,6 +165,9 @@ int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
 	if (!late_bind->component_added)
 		return -ENODEV;
 
+	if (late_bind->disable)
+		return 0;
+
 	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
 		lbfw = &late_bind->late_bind_fw[fw_id];
 		if (lbfw->payload) {
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index 3cc5fc0593b3..9399d425d80b 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -65,6 +65,8 @@ struct xe_late_bind {
 	struct workqueue_struct *wq;
 	/** @component_added: whether the component has been added */
 	bool component_added;
+	/** @disable: to block late binding reload during pm resume flow*/
+	bool disable;
 };
 
 #endif
-- 
2.34.1

