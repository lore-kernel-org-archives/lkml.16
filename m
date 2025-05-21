Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E162222C5
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841627; cv=none; b=Whs5aMcLwGgmoMQJhg5iqs2p1mt/bT33pQs17LCWrDojdNIuVDeJ1zQKNc1tFzLTPcOoVUPJ4DW2Z7haGiOidre6eF0w39jLTsFhwWTXHwBzx0mw6VIrKiZDYvQT+zuwnJGzh0lkZpo7l7JagridyXpPEXgVlpB9g6a+4IBEXkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841627; c=relaxed/simple;
	bh=IcR1y8BJg9PZ+YdhdICoZFVeHPZHoLitHk/7FbetAkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=azdN7tLzaA0Z70J1MhyyWPfr8CiT/CN0GcSljWRI3QUdBDFmZ/59OIThG77qcue2BVuqZeXVRartFvjX2FyHUME6Nn0eNvOTr9rjLrC0ZWH9ftExSnc8DvpNTsioDwYEsNwUUSkRaEfcOgpyPAASx5ahWaXbC8XjFrA3RV6KGTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=VNQxbjKk; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="VNQxbjKk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=MpyTcW4uu8ckELfNErBwJSwWM3fj2weQmxq4xQVTVCo=; b=VNQxbjKkk9zPpazFilOXXb8Gc1
	84CLtXrBKpgMCH7OrBmhyogFb6HdnxsSJbZJ7eIBCg7hP0d3gEV6dL3M5v+D9lKK9bvlmoQa3m9M5
	gx4EK/lQR3CARdBzXIGk/A00P3TNIn1jO0OW/5znNpM+1yAdGBVdUcDEo/YKMcV5a0w3paUAHdG3h
	5hffHOumVpIiXNN+3bWUvynDHuaPrMBI6YsdmIeerW9xAZAaKLYlnkp9MenZtlSowMzTIjH8BJSyf
	UFLHv08tR6MAuzRXIshBySiU+d5eFAqj5Ih8nUlxbQKjfUYEUc6XjU9kwJ6+EBnPcEMXxomy6GRZF
	dc1e/8Jg==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uHlRm-00BGxd-CD; Wed, 21 May 2025 17:33:34 +0200
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
Subject: [PATCH v6 1/3] drm: Create a task info option for wedge events
Date: Wed, 21 May 2025 12:33:21 -0300
Message-ID: <20250521153323.935974-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521153323.935974-1-andrealmeid@igalia.com>
References: <20250521153323.935974-1-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a device get wedged, it might be caused by a guilty application.
For userspace, knowing which task was the cause can be useful for some
situations, like for implementing a policy, logs or for giving a chance
for the compositor to let the user know what task caused the problem.
This is an optional argument, when the task info is not available, the
PID and TASK string won't appear in the event string.

Sometimes just the PID isn't enough giving that the task might be already
dead by the time userspace will try to check what was this PID's name,
so to make the life easier also notify what's the task's name in the user
event.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (for i915 and xe)
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v6:
 - s/app/task in a comment
 - add PID >= 0 check
v5:
 - s/app/task for struct and commit message as well
 - move defines to drm_drv.c
 - validates if comm is not NULL and it's not empty
v4: s/APP/TASK
v3: Make comm_string and pid_string empty when there's no app info
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  2 +-
 drivers/gpu/drm/drm_drv.c                  | 19 +++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_reset.c      |  3 ++-
 drivers/gpu/drm/xe/xe_device.c             |  3 ++-
 include/drm/drm_device.h                   |  8 ++++++++
 include/drm/drm_drv.h                      |  3 ++-
 7 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 4d1b54f58495..d27091d5929c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -6363,7 +6363,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 	atomic_set(&adev->reset_domain->reset_res, r);
 
 	if (!r)
-		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
+		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index acb21fc8b3ce..a47b2eb301e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -166,7 +166,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 			if (amdgpu_ring_sched_ready(ring))
 				drm_sched_start(&ring->sched, 0);
 			dev_err(adev->dev, "Ring %s reset succeeded\n", ring->sched.name);
-			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
+			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
 			goto exit;
 		}
 		dev_err(adev->dev, "Ring %s reset failure\n", ring->sched.name);
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 3dc7acd56b1d..db0cfa367b4e 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -538,10 +538,14 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
 	}
 }
 
+#define WEDGE_STR_LEN 32
+#define PID_LEN 15
+
 /**
  * drm_dev_wedged_event - generate a device wedged uevent
  * @dev: DRM device
  * @method: method(s) to be used for recovery
+ * @info: optional information about the guilty task
  *
  * This generates a device wedged uevent for the DRM device specified by @dev.
  * Recovery @method\(s) of choice will be sent in the uevent environment as
@@ -554,13 +558,13 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
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
+	char event_string[WEDGE_STR_LEN], pid_string[PID_LEN] = "", comm_string[TASK_COMM_LEN] = "";
+	char *envp[] = { event_string, NULL, NULL, NULL };
 
 	len = scnprintf(event_string, sizeof(event_string), "%s", "WEDGED=");
 
@@ -582,6 +586,13 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
 	drm_info(dev, "device wedged, %s\n", method == DRM_WEDGE_RECOVERY_NONE ?
 		 "but recovered through reset" : "needs recovery");
 
+	if (info && ((info->comm && info->comm[0] != '\0')) && (info->pid >= 0)) {
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
index e2f894f1b90a..91931301355e 100644
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
+	char *comm;
+};
+
 /**
  * enum switch_power_state - power state of drm device
  */
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index a43d707b5f36..ac45ed855321 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -482,7 +482,8 @@ void drm_put_dev(struct drm_device *dev);
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

