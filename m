Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18273233714
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 18:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749840255; cv=none; b=usaeyndfF9sSM5a2Z9+57ti5sIwxOrcQUwy5CyP/+Zmb9Rg1UH6IJLhQAm5sBEEu93l+NNdKb1HBPo19PPP4buHCizt/yufBf2h1z4wM1AYyr0ey0Kmp0t1r19MVgu8ZUANF6iU/MFnnOnt0KYZ+K+NJ4vA40sfNBJbDdahTdfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749840255; c=relaxed/simple;
	bh=3S7UbO25clCwMGaJTfac9ZFHxBuYr0XY+7mKomESpto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i/zhBpfMAODLakkgzHheBXzEhg75KHL/w6gxPgYVhPGFbxl7+BpdHaBGdyGl9KTMbhJ00mcVfWWq53z36Mx5SGNSxGXAnVPq5DT4NgL4cL1TQcyYarTL6VKL0c8CySxxTUKm3NxsxqPu1uv8IGZ0sX0792iWQxGWrNxyPc88rr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=hUhdm8sz; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="hUhdm8sz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=W/FTyF7NDnaWY2yudF+a663WW7/aKtuqO0NLRA6gThY=; b=hUhdm8sz/6Mv/Cve3Uxlo+MSr0
	JgeBwDkDQaoWlSJqlMNd/U5QVKdjx3AuHvSNoNHAAjiA9CxWYrupn5Mz6eczD6xDIFLRNyr90COu1
	bFbOkFE2Kyycr+aChvG2n3ZtEVU8lkg/a9B9QG8ViVcoHHVn2oMVXVLKd8UlILtRZuZjPWRuYF1fI
	1OmvtNa05FK1qBsvwCrgH4AhMa0kLpJqulIe53pKM4CWCy9IF5NFY30RyPNk2sEp/JuaFqtc74tzy
	mEqFyNFDFwsHQmY0T6N/Os48E4NjJYDQC+hyD5JMLCNvqsSlTTxWoKF83mNOPaccCOhKaN7gjfHm6
	XWTZaiSQ==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uQ9Nj-003AD0-NN; Fri, 13 Jun 2025 20:44:04 +0200
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
Subject: [PATCH v7 2/5] drm: Create a task info option for wedge events
Date: Fri, 13 Jun 2025 15:43:45 -0300
Message-ID: <20250613184348.1761020-3-andrealmeid@igalia.com>
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

When a device get wedged, it might be caused by a guilty application.
For userspace, knowing which task was involved can be useful for some
situations, like for implementing a policy, logs or for giving a chance
for the compositor to let the user know what task was involved in the
problem.  This is an optional argument, when the task info is not
available, the PID and TASK string won't appear in the event string.

Sometimes just the PID isn't enough giving that the task might be already
dead by the time userspace will try to check what was this PID's name,
so to make the life easier also notify what's the task's name in the user
event.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (for i915 and xe)
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v7:
 - Change `char *comm` to `char comm[TASK_COMM_LEN]`
v6:
 - s/cause/involved
 - drop string initialization
v5:
 - s/app/task for struct and commit message as well
 - move defines to drm_drv.c
 - validates if comm is not NULL and it's not empty
v4: s/APP/TASK
v3: Make comm_string and pid_string empty when there's no app info
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  2 +-
 drivers/gpu/drm/drm_drv.c                  | 20 ++++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_reset.c      |  3 ++-
 drivers/gpu/drm/xe/xe_device.c             |  3 ++-
 include/drm/drm_device.h                   |  8 ++++++++
 include/drm/drm_drv.h                      |  3 ++-
 7 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index e1bab6a96cb6..8a0f36f33f13 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -6364,7 +6364,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 	atomic_set(&adev->reset_domain->reset_res, r);
 
 	if (!r)
-		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
+		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 3d887428ca2b..0c1381b527fe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -164,7 +164,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 			if (amdgpu_ring_sched_ready(ring))
 				drm_sched_start(&ring->sched, 0);
 			dev_err(adev->dev, "Ring %s reset succeeded\n", ring->sched.name);
-			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
+			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
 			goto exit;
 		}
 		dev_err(adev->dev, "Ring %s reset failure\n", ring->sched.name);
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 56dd61f8e05a..eba99a081ec1 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -538,10 +538,15 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
 	}
 }
 
+#define WEDGE_STR_LEN 32
+#define PID_STR_LEN 15
+#define COMM_STR_LEN (TASK_COMM_LEN + 5)
+
 /**
  * drm_dev_wedged_event - generate a device wedged uevent
  * @dev: DRM device
  * @method: method(s) to be used for recovery
+ * @info: optional information about the guilty task
  *
  * This generates a device wedged uevent for the DRM device specified by @dev.
  * Recovery @method\(s) of choice will be sent in the uevent environment as
@@ -554,13 +559,13 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
  *
  * Returns: 0 on success, negative error code otherwise.
  */
-int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
+int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
+			 struct drm_wedge_task_info *info)
 {
 	const char *recovery = NULL;
 	unsigned int len, opt;
-	/* Event string length up to 28+ characters with available methods */
-	char event_string[32];
-	char *envp[] = { event_string, NULL };
+	char event_string[WEDGE_STR_LEN], pid_string[PID_STR_LEN], comm_string[COMM_STR_LEN];
+	char *envp[] = { event_string, NULL, NULL, NULL };
 
 	len = scnprintf(event_string, sizeof(event_string), "%s", "WEDGED=");
 
@@ -582,6 +587,13 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
 	drm_info(dev, "device wedged, %s\n", method == DRM_WEDGE_RECOVERY_NONE ?
 		 "but recovered through reset" : "needs recovery");
 
+	if (info && (info->comm[0] != '\0') && (info->pid >= 0)) {
+		snprintf(pid_string, sizeof(pid_string), "PID=%u", info->pid);
+		snprintf(comm_string, sizeof(comm_string), "TASK=%s", info->comm);
+		envp[1] = pid_string;
+		envp[2] = comm_string;
+	}
+
 	return kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
 }
 EXPORT_SYMBOL(drm_dev_wedged_event);
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index dbdcfe130ad4..ba1d8fdc3c7b 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1448,7 +1448,8 @@ static void intel_gt_reset_global(struct intel_gt *gt,
 		kobject_uevent_env(kobj, KOBJ_CHANGE, reset_done_event);
 	else
 		drm_dev_wedged_event(&gt->i915->drm,
-				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
+				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET,
+				     NULL);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c02c4c4e9412..f329613e061f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1168,7 +1168,8 @@ void xe_device_declare_wedged(struct xe_device *xe)
 
 		/* Notify userspace of wedged device */
 		drm_dev_wedged_event(&xe->drm,
-				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
+				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET,
+				     NULL);
 	}
 
 	for_each_gt(gt, xe, id)
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index e2f894f1b90a..729e1c6da138 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -30,6 +30,14 @@ struct pci_controller;
 #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
 #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
 
+/**
+ * struct drm_wedge_task_info - information about the guilty task of a wedge dev
+ */
+struct drm_wedge_task_info {
+	pid_t pid;
+	char comm[TASK_COMM_LEN];
+};
+
 /**
  * enum switch_power_state - power state of drm device
  */
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 63b51942d606..3f76a32d6b84 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -487,7 +487,8 @@ void drm_put_dev(struct drm_device *dev);
 bool drm_dev_enter(struct drm_device *dev, int *idx);
 void drm_dev_exit(int idx);
 void drm_dev_unplug(struct drm_device *dev);
-int drm_dev_wedged_event(struct drm_device *dev, unsigned long method);
+int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
+			 struct drm_wedge_task_info *info);
 
 /**
  * drm_dev_is_unplugged - is a DRM device unplugged
-- 
2.49.0

