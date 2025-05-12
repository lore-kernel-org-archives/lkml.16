Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D50298CDF
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747082131; cv=none; b=eIMoJw9UJeKbTfKthChojObvJ53yrtnDPGMUmnhBV9RnWc5RJzaZiiCQlOL1ktEWrhvg20Zetv37yzp9EPwT4uctn46j4FMFMT+Qjhi7H5mI7Kn2RaDskOiukwjTumb12OCGIgeSdewpJaUl/5lgXU59T6dFfs8G0WyEyFZB3n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747082131; c=relaxed/simple;
	bh=vmLwhuTwTvt7eMs50a6cBYCilwolKWR9eHExvgLaBtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gVC1KZwENU4lBDfHo9sNa9+9qw3hWs8DUxHwrpnbnPbzRIuyKRbDHeY2wzv1YNYK5ZOuJiP+bS4ACgzc4Vyyxi7K9nx3svQ2OODQN56Cb8TkCCU2mTVhnWpkcDUVHc+5n1Mvw8MANO/YfX+9pi9MaqvS1a1e+TIXpF2xhLnOTyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=p2WGpxig; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="p2WGpxig"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=OL4xibm39jmfI8uxvEjCXO513VYShvHZZAZJDGQ0FxA=; b=p2WGpxigHBx3gau2Yiw/fhKIZ7
	syFZ3DMhwlt50o7TW2Gsq+dULtvOm+gdRv0yEH2et50uYrkPHvumZB+O7IGhwukZijURDlpLLXE/O
	8OkJjji2YSYY9B3fKZyYGisXBJ/G6kseBpE7Z5MceL3DMlxGdkrrXkPMExbN22vTFw+t7AtKiVWh+
	++KWftimb2oSknkJ4pSgJoSea2yofIts4XIQJT55WpIqfltcAOKJmg2JC/55Ovx/6Rxykm/G9A9gd
	yHm84PlZsFwufmB+tJTXrLNgAmdJRky3SO37ZdzbuTm9tHuClB3RI5XNYhpjsDNzbZJQFBPQ4H1Ke
	ac5hVHGA==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uEZma-007G93-A4; Mon, 12 May 2025 22:35:17 +0200
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
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	amd-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v3 3/3] drm/amdgpu: Make use of drm_wedge_app_info
Date: Mon, 12 May 2025 17:34:37 -0300
Message-ID: <20250512203437.989894-4-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512203437.989894-1-andrealmeid@igalia.com>
References: <20250512203437.989894-1-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To notify userspace about which app (if any) made the device get in a
wedge state, make use of drm_wedge_app_info parameter, filling it with
the app PID and name.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 19 +++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  6 +++++-
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index c8a51418d0e7..e6d8f6d0ec47 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -6215,8 +6215,23 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 
 	atomic_set(&adev->reset_domain->reset_res, r);
 
-	if (!r)
-		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
+	if (!r) {
+		struct drm_wedge_app_info aux, *info = NULL;
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
index a47b2eb301e5..98efa3318ddb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -89,6 +89,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 {
 	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
 	struct amdgpu_job *job = to_amdgpu_job(s_job);
+	struct drm_wedge_app_info aux, *info = NULL;
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

