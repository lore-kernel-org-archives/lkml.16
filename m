Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3B625B2FA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=165.204.156.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751352002; cv=none; b=mgbcJdqEq37pseEIR/muqg+0eBB9BRzn70VLIB9+BrSfttIizkyEfVoFbIsAZUjzFOM/UEbNIPgcm9ChXb1pYG+xbpziPVhV4uPOndn1kuHbNyy7ss6/nEPDuGH8Zpm4gUFuie+ASC70X/pXC8Pe0n573T/qf2RcDydfpr1dFMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751352002; c=relaxed/simple;
	bh=uruHLmBt6+JvLgk8Pu9ULlppJQ3Swr+N+70PO99RdPM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AinV9FQyQoFpaz/IihRe4FcqhywFUaVNjXvVWwJQ/YuWOcoJDBSQAGJL4zyVZECDiQvvnmVUNSosS2nHvrSCZQZDz18SAie8PT7c8SKAn/oqeN2mHF2vM8OHXY0f2L2jy/fkabFjo5iB6RFCBZB25W8F56yyoKH8HAx1D1zdoeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com; spf=none smtp.mailfrom=rtg-sunil-navi33.amd.com; arc=none smtp.client-ip=165.204.156.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=rtg-sunil-navi33.amd.com
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
	by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id 5616X94t3210763;
	Tue, 1 Jul 2025 12:03:09 +0530
Received: (from sunil@localhost)
	by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 5616X9wk3210761;
	Tue, 1 Jul 2025 12:03:09 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
        tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org,
        linux-kernel@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
        Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v8 3/4] drm/amdgpu: add debugfs support for VM pagetable per client
Date: Tue,  1 Jul 2025 12:03:02 +0530
Message-Id: <20250701063303.3210665-3-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701063303.3210665-1-sunil.khatri@amd.com>
References: <20250701063303.3210665-1-sunil.khatri@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a debugfs file under the client directory which shares
the root page table base address of the VM.

This address could be used to dump the pagetable for debug
memory issues.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 52 +++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  4 +-
 5 files changed, 60 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index f81608330a3d..6762dd11f00c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -2131,6 +2131,55 @@ int amdgpu_debugfs_init(struct amdgpu_device *adev)
 	return 0;
 }
 
+static int amdgpu_pt_info_read(struct seq_file *m, void *unused)
+{
+	struct drm_file *file;
+	struct amdgpu_fpriv *fpriv;
+	struct amdgpu_bo *root_bo;
+	int r;
+
+	file = m->private;
+	if (!file)
+		return -EINVAL;
+
+	fpriv = file->driver_priv;
+	if (!fpriv && !fpriv->vm.root.bo)
+		return -ENODEV;
+
+	root_bo = amdgpu_bo_ref(fpriv->vm.root.bo);
+	r = amdgpu_bo_reserve(root_bo, true);
+	if (r) {
+		amdgpu_bo_unref(&root_bo);
+		return -EINVAL;
+	}
+
+	seq_printf(m, "gpu_address: 0x%llx\n", amdgpu_bo_gpu_offset(fpriv->vm.root.bo));
+
+	amdgpu_bo_unreserve(root_bo);
+	amdgpu_bo_unref(&root_bo);
+
+	return 0;
+}
+
+static int amdgpu_pt_info_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, amdgpu_pt_info_read, inode->i_private);
+}
+
+static const struct file_operations amdgpu_pt_info_fops = {
+	.owner = THIS_MODULE,
+	.open = amdgpu_pt_info_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+void amdgpu_debugfs_vm_init(struct drm_file *file)
+{
+	debugfs_create_file("vm_pagetable_info", 0444, file->debugfs_client, file,
+			    &amdgpu_pt_info_fops);
+}
+
 #else
 int amdgpu_debugfs_init(struct amdgpu_device *adev)
 {
@@ -2140,4 +2189,7 @@ int amdgpu_debugfs_regs_init(struct amdgpu_device *adev)
 {
 	return 0;
 }
+void amdgpu_debugfs_vm_init(struct drm_file *file)
+{
+}
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h
index 0425432d8659..e7b3c38e5186 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h
@@ -33,4 +33,5 @@ void amdgpu_debugfs_fence_init(struct amdgpu_device *adev);
 void amdgpu_debugfs_firmware_init(struct amdgpu_device *adev);
 void amdgpu_debugfs_gem_init(struct amdgpu_device *adev);
 void amdgpu_debugfs_mes_event_log_init(struct amdgpu_device *adev);
+void amdgpu_debugfs_vm_init(struct drm_file *file);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 195ed81d39ff..27aa1b551dbf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -1395,7 +1395,7 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 	if (r)
 		goto error_pasid;
 
-	r = amdgpu_vm_init(adev, &fpriv->vm, fpriv->xcp_id);
+	r = amdgpu_vm_init(adev, &fpriv->vm, fpriv->xcp_id, file_priv);
 	if (r)
 		goto error_pasid;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index f042372d9f2e..7e31fb5f6f33 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2527,6 +2527,7 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
  * @adev: amdgpu_device pointer
  * @vm: requested vm
  * @xcp_id: GPU partition selection id
+ * @file: drm_file
  *
  * Init @vm fields.
  *
@@ -2534,7 +2535,7 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
  * 0 for success, error for failure.
  */
 int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
-		   int32_t xcp_id)
+		   int32_t xcp_id, struct drm_file *file)
 {
 	struct amdgpu_bo *root_bo;
 	struct amdgpu_bo_vm *root;
@@ -2610,6 +2611,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	if (r)
 		dev_dbg(adev->dev, "Failed to create task info for VM\n");
 
+	amdgpu_debugfs_vm_init(file);
 	amdgpu_bo_unreserve(vm->root.bo);
 	amdgpu_bo_unref(&root_bo);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index f3ad687125ad..555afaf867c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -487,7 +487,9 @@ int amdgpu_vm_set_pasid(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 			u32 pasid);
 
 long amdgpu_vm_wait_idle(struct amdgpu_vm *vm, long timeout);
-int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm, int32_t xcp_id);
+int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm, int32_t xcp_id,
+		   struct drm_file *file);
+
 int amdgpu_vm_make_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm);
 void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm);
 int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec,
-- 
2.34.1

