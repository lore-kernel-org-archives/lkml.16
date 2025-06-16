Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BCC28A1EA
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750097752; cv=none; b=ALhWqotHMDPJ22iNtxWC0d7HKPw8X9XoerlbBaRbRLaE+afJGZ6dZucWP74ABJ25ChTKu4OBq9a0pHBTk+joyiezG/ZhO+D+Og1e77tnBDDbtp3d5uitf9mw0l6I5Iv1sTrNM4SRWq5pTWbN9fxoMx1uuXTlbOli1A+U4gWXQJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750097752; c=relaxed/simple;
	bh=MBXvbiv09WFTedILbln+GxGD4d0ugksV6zXN5X3pQqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HtOoo5l6QZT0EZ7YvcU/5nxpjbEb8uyV5Tq6llOkgHk8Q+MX8hHfiJem12/JbS/ICMX+cqR8Tbhr95hl4UlaxG+nN9ewKDk7b38q7FkEbQDoDh/LHlZXRVR5nqSnZ6LBJjMaT7QkhCh4S4LhdOjaOshhLXw0tBAfS7H2FMIl8og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=S6vJATHD; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="S6vJATHD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=HoiH7l3fENLBTE2ibK2tEdCTvd0Zntd1kdiJj4+rKlE=; b=S6vJATHDbgMv1X0XOriLBSRSPr
	1c+rADVNGTiXsY7wmFw8PvxO87yFr5t/U/aye+LWMIzMBIrEAsDzB5iCrkEpA+DunEZFW2L4WPbX8
	GXFxUFyLOfockJgonTV2GxnCwo0sADSI+s7vJnyU9sXk/EizLoObNB0juT4nADlpEhElf9tF7AqPV
	hezfQdsdS463Sydd0eipLI+UHqUwC8j7k8kAZ3EtpJWkyocuGwULDAxAaR3SRCXHL5TZlymJi1Bw4
	F2v48woVuzz97qroNmp+LaAKu2jNMnezO/KkIds51IjHwxgDH78ka8oKEr4NT/Iq+McZ2sD/Jdgi+
	ecEoyphg==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uREMt-004Eh6-Rx; Mon, 16 Jun 2025 20:15:40 +0200
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
Subject: [PATCH v8 6/6] drm/amdgpu: Make use of drm_wedge_task_info
Date: Mon, 16 Jun 2025 15:14:38 -0300
Message-ID: <20250616181438.2124656-7-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616181438.2124656-1-andrealmeid@igalia.com>
References: <20250616181438.2124656-1-andrealmeid@igalia.com>
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
v8:
 - Drop check before calling amdgpu_vm_put_task_info()
 - Drop local variable `info`
v7:
 - Remove struct cast, now we can use `info = &ti->task`
 - Fix struct lifetime, move amdgpu_vm_put_task_info() after
   drm_dev_wedged_event() call
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 13 +++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  7 +++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 8a0f36f33f13..a59f194e3360 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -6363,8 +6363,17 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 
 	atomic_set(&adev->reset_domain->reset_res, r);
 
-	if (!r)
-		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
+	if (!r) {
+		struct amdgpu_task_info *ti = NULL;
+
+		if (job)
+			ti = amdgpu_vm_get_task_info_pasid(adev, job->pasid);
+
+		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE,
+				     ti ? &ti->task : NULL);
+
+		amdgpu_vm_put_task_info(ti);
+	}
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 0c1381b527fe..1e24590ae144 100644
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
@@ -164,13 +165,15 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
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
 
+	amdgpu_vm_put_task_info(ti);
+
 	if (amdgpu_device_should_recover_gpu(ring->adev)) {
 		struct amdgpu_reset_context reset_context;
 		memset(&reset_context, 0, sizeof(reset_context));
-- 
2.49.0

