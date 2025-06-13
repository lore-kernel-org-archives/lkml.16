Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2248423C4F8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 18:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749840265; cv=none; b=ZPYkgD12xoNjlkWHR69AcMazqA3l6R6lfuKOqEqQHa9yWqzEd65+CzY2GCycf3gO4JkB42aOa75po/AloYPLcLFUeMmmWISFu8/8n8v8tIrcwFpxwSUpMx3QCat/d3JcRa12MaaHfcNiObr37Zj70gOVo8N4taf60TC8SgU2ZCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749840265; c=relaxed/simple;
	bh=7Kn1u/gVa9sDdXQEiFPRNu3yl2AWY2F/Esch2C3NQcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oIjZeW796DQfD3dSMZeLbNk67aRA5hB0L92D58F5JHHrjdIgDasPWMNLc9YB/TNrkCW/E99TnqpQgIbRqkfNQm5NKbd61iNfV/5cH4t8/hBaV/b4r2zN3b7ZIRlYxuoGpXQBGsIRRF8QlzJ3yoQ+fxoVFVrB2DPKpWwTU9o60rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=YwZELRoP; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="YwZELRoP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=oOcwqzD6tOcdnoanCuqsRDl10qjCYbFL/juK82IuqGw=; b=YwZELRoPPHj0BmrWPXnXXoJqXT
	LdWcGIjzyCGQAbnYS1p/TIAS574XtWilBE9G3QpNhQgAVw7+KNUbPH72QyHb+lZ/GHwsarzpoyEUu
	3tzJvDfLOsOQ71RJhk9aEROkBdDryDZzjuQP1ofoAvLbIm1yTu1G4ke4ubq+T23Km+MJPsEuPjX10
	RiRiW0L8aqIGPNNVDbUvDcqOSV9Sri9dFwcWpmvDFF+V3rNqUIZvzQGCfTIumGXgPXBQlIpJU54TD
	qtSxSaye5bVRxOBL4iwwO7p1fGb5jykvryPMZxTRE7WBUc68G/vs66SdAeBkbq1RKAyhRf2MaWSb0
	TTzB/bDg==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uQ9Nv-003AD0-I2; Fri, 13 Jun 2025 20:44:15 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: "Alex Deucher" <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	siqueira@igalia.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	"Raag Jadav" <raag.jadav@intel.com>,
	rodrigo.vivi@intel.com,
	jani.nikula@linux.intel.com,
	Xaver Hugl <xaver.hugl@gmail.com>,
	Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	amd-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v7 5/5] drm/amdgpu: Make use of drm_wedge_task_info
Date: Fri, 13 Jun 2025 15:43:48 -0300
Message-ID: <20250613184348.1761020-6-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613184348.1761020-1-andrealmeid@igalia.com>
References: <20250613184348.1761020-1-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To notify userspace about which task (if any) made the device get in a
wedge state, make use of drm_wedge_task_info parameter, filling it with
the task PID and name.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v7:
 - Remove struct cast, now we can use `info = &ti->task`
 - Fix struct lifetime, move amdgpu_vm_put_task_info() after
   drm_dev_wedged_event() call
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 17 +++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  8 ++++++--
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 8a0f36f33f13..67cff53678e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -6363,8 +6363,21 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 
 	atomic_set(&adev->reset_domain->reset_res, r);
 
-	if (!r)
-		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
+	if (!r) {
+		struct drm_wedge_task_info *info = NULL;
+		struct amdgpu_task_info *ti = NULL;
+
+		if (job) {
+			ti = amdgpu_vm_get_task_info_pasid(adev, job->pasid);
+			if (ti)
+				info = &ti->task;
+		}
+
+		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, info);
+
+		if (ti)
+			amdgpu_vm_put_task_info(ti);
+	}
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 0c1381b527fe..f061f691f556 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -89,6 +89,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 {
 	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
 	struct amdgpu_job *job = to_amdgpu_job(s_job);
+	struct drm_wedge_task_info *info = NULL;
 	struct amdgpu_task_info *ti;
 	struct amdgpu_device *adev = ring->adev;
 	int idx;
@@ -125,7 +126,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 	ti = amdgpu_vm_get_task_info_pasid(ring->adev, job->pasid);
 	if (ti) {
 		amdgpu_vm_print_task_info(adev, ti);
-		amdgpu_vm_put_task_info(ti);
+		info = &ti->task;
 	}
 
 	/* attempt a per ring reset */
@@ -164,13 +165,16 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 			if (amdgpu_ring_sched_ready(ring))
 				drm_sched_start(&ring->sched, 0);
 			dev_err(adev->dev, "Ring %s reset succeeded\n", ring->sched.name);
-			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
+			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, info);
 			goto exit;
 		}
 		dev_err(adev->dev, "Ring %s reset failure\n", ring->sched.name);
 	}
 	dma_fence_set_error(&s_job->s_fence->finished, -ETIME);
 
+	if (ti)
+		amdgpu_vm_put_task_info(ti);
+
 	if (amdgpu_device_should_recover_gpu(ring->adev)) {
 		struct amdgpu_reset_context reset_context;
 		memset(&reset_context, 0, sizeof(reset_context));
-- 
2.49.0

