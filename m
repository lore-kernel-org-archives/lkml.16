Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1CD2D7ADA;
	Tue, 29 Apr 2025 23:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970812; cv=none; b=rcQ4ecHMYbANqwKrlV5sss/c8D7EPP4PodXm603mDieqMwiyKJR7nAgqIHJ4tI3IO7jOLHdzow6g60phgRDltaL7ouIdtlI+JLK96luQztDEWf5+12/8tRjC5C8QcIgOtNuYmFCH21k8iOiOSDfjwykiO2bKB5QctYlbSJrGku4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970812; c=relaxed/simple;
	bh=YUhTQARJ11cpRDJKxgRDRbaAPBGqqmiR1L5lx8uvsoA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hy8na2wu6VqWErU8uMmb4+nxgvZmC4VFyZ91DZSu5RQcuEIy80JL7VU8A0BuodtE7M4/BzfAoti0cEnhr2f/6Sm+kfXohZb9rIaC7+KzdWRHWnLJPC7BZJ03S4uOsZFRK8kcHxLm2Lnr4CL6kKMraCaBuOPGvlJPzhPcBO2EaA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vmoj4Q7j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vmoj4Q7j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB36C4CEE3;
	Tue, 29 Apr 2025 23:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745970812;
	bh=YUhTQARJ11cpRDJKxgRDRbaAPBGqqmiR1L5lx8uvsoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vmoj4Q7jZkwn/NFUWSKzcu0ozWgH6qgqXca9iUrSRKR5ZiWq28sy7ZRk3v25tojSE
	 7MYLB8iSwa2qM6JQz0GWbXDXlE/r+T3kKJZTzRXlGoLPf2sgObSfJl8t1ed6Pxu55a
	 4RtikCPjDyXsWP7DfzGx/6BJdtOntsYruLeHy2Qt/q1eKXfY/MgnyqE3G5Cl71l+hp
	 1D0HvZdDK21LxJLwD6QYBOGZ+4uFQYmgoMw7a1pex1IKSCXyx5aQ7us6cxDbILkwsO
	 E5waXsO9+NVsA3Y0o68loEu9pg3Be7R6Vzlvb+I+lBHDFEd/xpbH0OQaeXtnETOZ86
	 0A+zOg9ioyFfQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Kuehling <felix.kuehling@amd.com>,
	Hao Zhou <hao.zhou@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Sasha Levin <sashal@kernel.org>,
	airlied@gmail.com,
	simona@ffwll.ch,
	Yunxiang.Li@amd.com,
	matthew.auld@intel.com,
	tvrtko.ursulin@igalia.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 07/10] drm/amdgpu: Allow P2P access through XGMI
Date: Tue, 29 Apr 2025 19:53:12 -0400
Message-Id: <20250429235316.538129-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429235316.538129-1-sashal@kernel.org>
References: <20250429235316.538129-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.135
Content-Transfer-Encoding: 8bit

From: Felix Kuehling <felix.kuehling@amd.com>

[ Upstream commit a92741e72f91b904c1d8c3d409ed8dbe9c1f2b26 ]

If peer memory is accessible through XGMI, allow leaving it in VRAM
rather than forcing its migration to GTT on DMABuf attachment.

Signed-off-by: Felix Kuehling <felix.kuehling@amd.com>
Tested-by: Hao (Claire) Zhou <hao.zhou@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit 372c8d72c3680fdea3fbb2d6b089f76b4a6d596a)
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 30 ++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index ab06cb4d7b358..4dcc7de961d08 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -42,6 +42,29 @@
 #include <linux/pci-p2pdma.h>
 #include <linux/pm_runtime.h>
 
+static const struct dma_buf_attach_ops amdgpu_dma_buf_attach_ops;
+
+/**
+ * dma_buf_attach_adev - Helper to get adev of an attachment
+ *
+ * @attach: attachment
+ *
+ * Returns:
+ * A struct amdgpu_device * if the attaching device is an amdgpu device or
+ * partition, NULL otherwise.
+ */
+static struct amdgpu_device *dma_buf_attach_adev(struct dma_buf_attachment *attach)
+{
+	if (attach->importer_ops == &amdgpu_dma_buf_attach_ops) {
+		struct drm_gem_object *obj = attach->importer_priv;
+		struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
+
+		return amdgpu_ttm_adev(bo->tbo.bdev);
+	}
+
+	return NULL;
+}
+
 /**
  * amdgpu_dma_buf_attach - &dma_buf_ops.attach implementation
  *
@@ -53,12 +76,14 @@
 static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
 				 struct dma_buf_attachment *attach)
 {
+	struct amdgpu_device *attach_adev = dma_buf_attach_adev(attach);
 	struct drm_gem_object *obj = dmabuf->priv;
 	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	int r;
 
-	if (pci_p2pdma_distance(adev->pdev, attach->dev, false) < 0)
+	if (!amdgpu_dmabuf_is_xgmi_accessible(attach_adev, bo) &&
+	    pci_p2pdma_distance(adev->pdev, attach->dev, false) < 0)
 		attach->peer2peer = false;
 
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
@@ -479,6 +504,9 @@ bool amdgpu_dmabuf_is_xgmi_accessible(struct amdgpu_device *adev,
 	struct drm_gem_object *obj = &bo->tbo.base;
 	struct drm_gem_object *gobj;
 
+	if (!adev)
+		return false;
+
 	if (obj->import_attach) {
 		struct dma_buf *dma_buf = obj->import_attach->dmabuf;
 
-- 
2.39.5

