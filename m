Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBE427FB06
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 16:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=165.204.156.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751388632; cv=none; b=V2vbMduauHbJI+Fons7IN/TecGJcCUu2CU5iqw08QYsXgWF3YKRz68v+gzAJlXDs3u2f0NE/Dk2+YrffX3iRWJ46qCoisdWQWCrkbn1v8WSlPpVv3o6JF9Ns02DqjcUzw3Me/rDU48nUjnz6dERFApSwI1ElUh7RLBw37KQ4aMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751388632; c=relaxed/simple;
	bh=KYrvpls+KdqdYbOFV0t+YKA3ozzs1zB21+nmPpEooL4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FuoWrPQPCEJp5sPZ3hHBnUZgXSvwszfvFz/bHTSix0apwK4tMIGi3uzVFxfhTlBKk4owAq1G8rvzc1uIocOrXxYOr4i754BcW+hsDzPs0E7iste9Kd8KPG6puXvOqBOqlHFTwUL5HtvGpd481dPPsz5CNpKsemjIB1Cyz3D6UOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com; spf=none smtp.mailfrom=rtg-sunil-navi33.amd.com; arc=none smtp.client-ip=165.204.156.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=rtg-sunil-navi33.amd.com
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
	by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id 561GnsYa008180;
	Tue, 1 Jul 2025 22:19:54 +0530
Received: (from sunil@localhost)
	by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 561GnsDu008179;
	Tue, 1 Jul 2025 22:19:54 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
        tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org,
        linux-kernel@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v9 4/4] drm/amdgpu: add support of debugfs for mqd information
Date: Tue,  1 Jul 2025 22:19:48 +0530
Message-Id: <20250701164948.8105-5-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701164948.8105-1-sunil.khatri@amd.com>
References: <20250701164948.8105-1-sunil.khatri@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add debugfs support for mqd for each queue of the client.

The address exposed to debugfs could be used to dump
the mqd.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 52 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h |  1 +
 2 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 295e7186e156..115d53bc9a8d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -318,6 +318,9 @@ amdgpu_userq_destroy(struct drm_file *filp, int queue_id)
 		amdgpu_bo_unreserve(queue->db_obj.obj);
 	}
 	amdgpu_bo_unref(&queue->db_obj.obj);
+
+	debugfs_remove_recursive(queue->debugfs_queue);
+
 	r = amdgpu_userq_unmap_helper(uq_mgr, queue);
 	amdgpu_userq_cleanup(uq_mgr, queue, queue_id);
 	mutex_unlock(&uq_mgr->userq_mutex);
@@ -343,6 +346,46 @@ static int amdgpu_userq_priority_permit(struct drm_file *filp,
 	return -EACCES;
 }
 
+#if defined(CONFIG_DEBUG_FS)
+static int amdgpu_mqd_info_read(struct seq_file *m, void *unused)
+{
+	struct amdgpu_usermode_queue *queue = m->private;
+	struct amdgpu_bo *bo;
+	int r;
+
+	if (!queue || !queue->mqd.obj)
+		return -EINVAL;
+
+	bo = amdgpu_bo_ref(queue->mqd.obj);
+	r = amdgpu_bo_reserve(bo, true);
+	if (r) {
+		amdgpu_bo_unref(&bo);
+		return -EINVAL;
+	}
+
+	seq_printf(m, "queue_type %d\n", queue->queue_type);
+	seq_printf(m, "mqd_gpu_address: 0x%llx\n", amdgpu_bo_gpu_offset(queue->mqd.obj));
+
+	amdgpu_bo_unreserve(bo);
+	amdgpu_bo_unref(&bo);
+
+	return 0;
+}
+
+static int amdgpu_mqd_info_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, amdgpu_mqd_info_read, inode->i_private);
+}
+
+static const struct file_operations amdgpu_mqd_info_fops = {
+	.owner = THIS_MODULE,
+	.open = amdgpu_mqd_info_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+#endif
+
 static int
 amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 {
@@ -352,6 +395,7 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 	const struct amdgpu_userq_funcs *uq_funcs;
 	struct amdgpu_usermode_queue *queue;
 	struct amdgpu_db_info db_info;
+	char *queue_name;
 	bool skip_map_queue;
 	uint64_t index;
 	int qid, r = 0;
@@ -475,6 +519,14 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 		}
 	}
 
+	queue_name = kasprintf(GFP_KERNEL, "queue-%d", qid);
+	if (!queue_name)
+		return -ENOMEM;
+
+	/* Queue dentry per client to hold MQD information   */
+	queue->debugfs_queue = debugfs_create_dir(queue_name, filp->debugfs_client);
+	debugfs_create_file("mqd_info", 0444, queue->debugfs_queue, queue, &amdgpu_mqd_info_fops);
+	kfree(queue_name);
 
 	args->out.queue_id = qid;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
index ec040c2fd6c9..b1ca91b7cda4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
@@ -65,6 +65,7 @@ struct amdgpu_usermode_queue {
 	struct dma_fence	*last_fence;
 	u32			xcp_id;
 	int			priority;
+	struct dentry		*debugfs_queue;
 };
 
 struct amdgpu_userq_funcs {
-- 
2.34.1

