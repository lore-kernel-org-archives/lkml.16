Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ABE27BF95
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747758808; cv=none; b=OteO4qrvSYJVmUhKLNqxcmnRo1GWAUdQqgqkd0+UJNmXRt0K7gH/7usjTAQH50zNuA1InhXxKV+eGJM/cwMToJD7lUbt2y/Gal/dwQpqDWtxqddNCx90Z6+AbJHTrx9SX8n+544v7RMpLh1l8H2F08xVH6VAISROi+Bwtnn4WRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747758808; c=relaxed/simple;
	bh=Vtcw7mINIlvUr04SjFTIlN54iDrSaPcKmCM119sSc1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DI+zxp6Y8VAC6Zj5MWDVwT0kvEnNqLv2iqv8CMSeIdVnpkb66KsIOgUBnC3bpryHjuzZ7zx+oxFnbx72o1mgw5apVSJbdBUZLt8CXh1B70mPeF80VyFZSZnJqr9Zxj1GI3PZqCya14jEG0y+U48wNzW28otA10A8+viXRNvXqw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=jnRibK+o; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="jnRibK+o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2n0ULhZnCu8C1LAodYKH8luvq5s03x0GpqQhjbAmhMQ=; b=jnRibK+ozj05E1whLwd1XH+6x8
	QcWjxGNcXIYTn4QkTCwLxQJpmeDns+adJ7VOeYzev6fW78y/mqBjs3d12uksw9HXoA8WBJfMxeJMi
	Cf7GYJWHfTzdWm/bUSlySXrGVk7TfcFvHWGt33TGQOGXr8NOldEx/51nnxELojyRypmT4hiYccfjz
	HBvHGFrEGEqbfAOJEUwoY5HsOMGs5Y5X5oCBBeTJJwkqKLda7wC/jQaEFuH264uJkuJIv0E53rfqN
	Cw+eadxtgqkXEltGRxR7JdMzDl7DcGMoOkRkxLO4OwGHPljFWdUCFr9ynwG0oAL7Nun14m2NhxBh7
	12N7GREQ==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uHPu1-00AnEg-AK; Tue, 20 May 2025 18:33:17 +0200
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
Subject: [PATCH v5 3/3] drm/amdgpu: Make use of drm_wedge_task_info
Date: Tue, 20 May 2025 13:32:43 -0300
Message-ID: <20250520163243.328746-4-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520163243.328746-1-andrealmeid@igalia.com>
References: <20250520163243.328746-1-andrealmeid@igalia.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 19 +++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  6 +++++-
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index d27091d5929c..c29c924aa506 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -6362,8 +6362,23 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 
 	atomic_set(&adev->reset_domain->reset_res, r);
 
-	if (!r)
-		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
+	if (!r) {
+		struct drm_wedge_task_info aux, *info = NULL;
+
+		if (job) {
+			struct amdgpu_task_info *ti;
+
+			ti = amdgpu_vm_get_task_info_pasid(adev, job->pasid);
+			if (ti) {
+				aux.pid = ti->pid;
+				aux.comm = ti->process_name;
+				info = &aux;
+				amdgpu_vm_put_task_info(ti);
+			}
+		}
+
+		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, info);
+	}
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index a47b2eb301e5..5cb17e62df57 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -89,6 +89,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 {
 	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
 	struct amdgpu_job *job = to_amdgpu_job(s_job);
+	struct drm_wedge_task_info aux, *info = NULL;
 	struct amdgpu_task_info *ti;
 	struct amdgpu_device *adev = ring->adev;
 	int idx;
@@ -127,6 +128,9 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 		dev_err(adev->dev,
 			"Process information: process %s pid %d thread %s pid %d\n",
 			ti->process_name, ti->tgid, ti->task_name, ti->pid);
+		aux.pid = ti->pid;
+		aux.comm = ti->process_name;
+		info = &aux;
 		amdgpu_vm_put_task_info(ti);
 	}
 
@@ -166,7 +170,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 			if (amdgpu_ring_sched_ready(ring))
 				drm_sched_start(&ring->sched, 0);
 			dev_err(adev->dev, "Ring %s reset succeeded\n", ring->sched.name);
-			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
+			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, info);
 			goto exit;
 		}
 		dev_err(adev->dev, "Ring %s reset failure\n", ring->sched.name);
-- 
2.49.0

