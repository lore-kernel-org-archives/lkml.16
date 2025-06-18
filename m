Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06E12FC013
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750273016; cv=none; b=LYbOXyuMJTqAtLW6Tw3RNEgu//1I6wvLHWB6qnYsk+trlbNW0gLRuWuh/ScuN0nDEiZhkBgV2dLWgbuc7+5ylWNXCbuHkDJWJRWDC8HP81j/W72CUBAxpi4oEQ5+uIq23CWd1Cx3iRPN9Vt49fi2obpA069pLyyDW7DDOR1TynI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750273016; c=relaxed/simple;
	bh=XMM1yKoIiyyN1UDllJwOGlHcwGO+CC28Rl+/jttM528=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fYFCcEcu5VIuZAB4UpYOU24gFT1REKWRgSOtyj+zKFnwpI/VtKWpV+VRWrJ56eXdyxMoO65Ei4M18860lcTEuaeriJCuBFIW4Get8gLV4c1AF4Bq/WCGGFJZYMy992zk4trBzQsZP+Vz/xIxPK4S4t93R5oA8GRb/w+lN1z4PEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFFDcIUu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFFDcIUu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750273014; x=1781809014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XMM1yKoIiyyN1UDllJwOGlHcwGO+CC28Rl+/jttM528=;
  b=ZFFDcIUugPUq5jatK38Ss38vbaAOAXtj5R4OL/O4qSh8PuoIP2D6MlSu
   rMhDz2nFDHwWq5XxzEVNlEEtSM61vphDe2lMWN4XSktdd3iKqGsYdBRtn
   Or4WAySVhOEG4Br9KxEn1kDQ5wmShPt/Tb2RejAEmyjLhe/AuIxQHSh8a
   E4FfJ3ytpxEbyxDK0U7dnXaVDnZTNNx4p6ovjerXMj57T8r7VyERfJTqB
   3165zU7u5Ovc7i8btd4kQ6gyHZboaBGLovyRDO1ON8zS8FJeUARcV2KMH
   hw/CC56MKaqdpjRg0h8OyAjmR107XA8Lkm3Y84jWA2Y6rbE3vWWe91Em1
   w==;
X-CSE-ConnectionGUID: e8y2+Jk2QGmbYezWrQO24A==
X-CSE-MsgGUID: l4IHdKosRmGSvgXBhirLNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52210220"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="52210220"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:56:54 -0700
X-CSE-ConnectionGUID: P2E8190STyeeS/0HQ4vdYg==
X-CSE-MsgGUID: 0cVIvXc6RpqWTHIaHYisBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="153952004"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:56:51 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com,
	alexander.usyskin@intel.com,
	gregkh@linuxfoundation.org,
	daniele.ceraolospurio@intel.com,
	jgg@nvidia.com
Subject: [PATCH v3 08/10] drm/xe/xe_late_bind_fw: Introduce debug fs node to disable late binding
Date: Thu, 19 Jun 2025 00:30:05 +0530
Message-Id: <20250618190007.2932322-9-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618190007.2932322-1-badal.nilawar@intel.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a debug filesystem node to disable late binding fw reload
during the system or runtime resume. This is intended for situations
where the late binding fw needs to be loaded from user mode.

v2:
  -s/(uval == 1) ? true : false/!!uval/ (Daniele)

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c            | 41 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw.c       |  3 ++
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  3 ++
 3 files changed, 47 insertions(+)

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
index c0be9611c73b..001e526e569a 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -129,6 +129,9 @@ int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
 	if (!late_bind->component_added)
 		return -EINVAL;
 
+	if (late_bind->disable)
+		return 0;
+
 	for (fw_id = 0; fw_id < MAX_FW_ID; fw_id++) {
 		lbfw = &late_bind->late_bind_fw[fw_id];
 		if (lbfw->valid)
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index d256f53d59e6..f79f0c0b2c4a 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -71,6 +71,9 @@ struct xe_late_bind {
 	struct xe_late_bind_fw late_bind_fw[MAX_FW_ID];
 	/** @late_bind.wq: workqueue to submit request to download late bind blob */
 	struct workqueue_struct *wq;
+
+	/** @late_bind.disable to block late binding reload during pm resume flow*/
+	bool disable;
 };
 
 #endif
-- 
2.34.1

