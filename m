Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB33324F18
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=165.204.156.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615838; cv=none; b=HCj1NX0Wg3Ttr619xiq6Zr3kfCpcnAmVnyWZTcegwoZX5wH2L9gjisbX4/D6CISJKSrXLDyual9Rg0fz8Xtyhd5melgevgbGudpHbtEpLDL1knAWvopy/SdZJ1HYLVVpLu3PcGFcu60n+Bgyo2U1HARb76EityyMQzs2GzHxyNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615838; c=relaxed/simple;
	bh=VPRABODIW9kGTNO0gB56nBa4hzsKqXgOVMp3RqJEZxs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M177Wglzrjg+sAYhX3BRiFnLtM8a136GOa/PT8aBLKyRNcgZ/Qif0Px5Kf3GPuys3b3Gd+n+MxFlZgQognMSw6HAVndWQheITqM876KEfXNDbv03Ht/6F79OhAg6EVRMSbDL0i+fLY9LRnQ2dIgIQf3JwUu8D8tBQMpLhEjIj1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com; spf=none smtp.mailfrom=rtg-sunil-navi33.amd.com; arc=none smtp.client-ip=165.204.156.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=rtg-sunil-navi33.amd.com
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
	by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id 5647uV861550169;
	Fri, 4 Jul 2025 13:26:31 +0530
Received: (from sunil@localhost)
	by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 5647uV9v1550168;
	Fri, 4 Jul 2025 13:26:31 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
        tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org,
        linux-kernel@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v10 3/4] drm/amdgpu: add debugfs support for VM pagetable per client
Date: Fri,  4 Jul 2025 13:25:47 +0530
Message-Id: <20250704075548.1549849-4-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704075548.1549849-1-sunil.khatri@amd.com>
References: <20250704075548.1549849-1-sunil.khatri@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a debugfs file under the client directory which shares
the root page table base address of the VM.

This address could be used to dump the pagetable for debug
memory issues.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 52 +++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     |  2 +
 3 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index dac4b926e7be..e49890a23ef6 100644
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
index d2ce7d86dbc8..d555853c5717 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -1395,6 +1395,8 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 	if (r)
 		goto error_pasid;
 
+	amdgpu_debugfs_vm_init(file_priv);
+
 	r = amdgpu_vm_init(adev, &fpriv->vm, fpriv->xcp_id);
 	if (r)
 		goto error_pasid;
-- 
2.34.1

