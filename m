Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985092DE1F7
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750164627; cv=none; b=mLn56ht+6nYN2kIWoADlwn1nlf/UmstIxZqaf+t7n8ycrNtNfIvtgtFojNmo+khpgZ3jHGSfNQgcJEYqC/W2xLcWiqa++zcBK7khNn+5Xnx+cu4q88XqscdfKSQG/5xVSS3bLwU8OD+B0WRDn6rpTe9uZ0fyeN6NfqaiMhvp/3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750164627; c=relaxed/simple;
	bh=SOIaepdpXz3UcMi6KhwDvhR3KJhTOWvH/emZbM9rZ7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=js2FvV1SwpnwEru1Do6gtzEm9CBaj2u5t8yj0E1S+xi4M8SZ6+8oiPSlr7GeyaFK21cx5p/oIcKVZ1+hvsqXo2LlHrfzx0HvwugRGkGWpHcfEwCs5Cwc3k1xoudlreA4aptopK4TMucAmJBFl/+vFlKM/NJfZMhAO9pjZ/m/8w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=hMTNzwAq; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="hMTNzwAq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=cqvcCLuXGWcxG6oSMTaVulETfZYDdZYBrWK87jUAr00=; b=hMTNzwAqeJzZCpuTIJ3I54+FPb
	IIUHTq8PswZ8T1oAOi77OXc9u9ZOSza4ImeE+QmB4PGkW2j3VNWf9akbTb980uUgp0Zjuxwxdnwv9
	R5TQ3gwJx5rC8Z9TYLV9RKNin51kN8ti23cXzOrg/VWssxj7KKU1hKInDTpixFacQ5grfBHeoZhPr
	yFo5VhujOn6Hrdh+N2J0FlIJOFo8y7aQMP86G6i/7Dl3ATmQ9jRvIMIvnroRkrix7wu8bC1vyruy8
	PBVfaC3gyVZoKARxKCxchCy8k1uQrDc1cq2Ii0lzbGfcaEMU3l19kHx4SVSOxPt3o0BxU4aGzIDc5
	bMVpIoLA==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uRVlQ-004ans-LH; Tue, 17 Jun 2025 14:50:09 +0200
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
Subject: [PATCH v9 2/6] drm: amdgpu: Create amdgpu_vm_print_task_info()
Date: Tue, 17 Jun 2025 09:49:45 -0300
Message-ID: <20250617124949.2151549-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617124949.2151549-1-andrealmeid@igalia.com>
References: <20250617124949.2151549-1-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To avoid repetitive code in amdgpu, create a function that prints the
content of struct amdgpu_task_info.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v8: drop the inline
v7: new patch
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 4 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 9 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  | 3 +++
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c  | 5 +----
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c  | 5 +----
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c  | 5 +----
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c   | 4 +---
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c   | 5 +----
 8 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 75262ce8db27..3d887428ca2b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -124,9 +124,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 
 	ti = amdgpu_vm_get_task_info_pasid(ring->adev, job->pasid);
 	if (ti) {
-		dev_err(adev->dev,
-			"Process information: process %s pid %d thread %s pid %d\n",
-			ti->process_name, ti->tgid, ti->task_name, ti->pid);
+		amdgpu_vm_print_task_info(adev, ti);
 		amdgpu_vm_put_task_info(ti);
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index de914a39e3f6..3bf63eee2d4e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -3157,3 +3157,12 @@ bool amdgpu_vm_is_bo_always_valid(struct amdgpu_vm *vm, struct amdgpu_bo *bo)
 {
 	return bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv;
 }
+
+void amdgpu_vm_print_task_info(struct amdgpu_device *adev,
+			       struct amdgpu_task_info *task_info)
+{
+	dev_err(adev->dev,
+		" Process %s pid %d thread %s pid %d\n",
+		task_info->process_name, task_info->tgid,
+		task_info->task_name, task_info->pid);
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index f3ad687125ad..9ec5d94200aa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -668,4 +668,7 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_device *adev,
 				 struct amdgpu_vm *vm,
 				 struct dma_fence **fence);
 
+void amdgpu_vm_print_task_info(struct amdgpu_device *adev,
+			       struct amdgpu_task_info *task_info);
+
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index a3e2787501f1..7923f491cf73 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -164,10 +164,7 @@ static int gmc_v10_0_process_interrupt(struct amdgpu_device *adev,
 		entry->src_id, entry->ring_id, entry->vmid, entry->pasid);
 	task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
 	if (task_info) {
-		dev_err(adev->dev,
-			" in process %s pid %d thread %s pid %d\n",
-			task_info->process_name, task_info->tgid,
-			task_info->task_name, task_info->pid);
+		amdgpu_vm_print_task_info(adev, task_info);
 		amdgpu_vm_put_task_info(task_info);
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
index 72211409227b..f15d691e9a20 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
@@ -134,10 +134,7 @@ static int gmc_v11_0_process_interrupt(struct amdgpu_device *adev,
 			entry->src_id, entry->ring_id, entry->vmid, entry->pasid);
 		task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
 		if (task_info) {
-			dev_err(adev->dev,
-				" in process %s pid %d thread %s pid %d)\n",
-				task_info->process_name, task_info->tgid,
-				task_info->task_name, task_info->pid);
+			amdgpu_vm_print_task_info(adev, task_info);
 			amdgpu_vm_put_task_info(task_info);
 		}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
index b645d3e6a6c8..de763105fdfd 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
@@ -127,10 +127,7 @@ static int gmc_v12_0_process_interrupt(struct amdgpu_device *adev,
 			entry->src_id, entry->ring_id, entry->vmid, entry->pasid);
 		task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
 		if (task_info) {
-			dev_err(adev->dev,
-				" in process %s pid %d thread %s pid %d)\n",
-				task_info->process_name, task_info->tgid,
-				task_info->task_name, task_info->pid);
+			amdgpu_vm_print_task_info(adev, task_info);
 			amdgpu_vm_put_task_info(task_info);
 		}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index 99ca08e9bdb5..b45fa0cea9d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -1458,9 +1458,7 @@ static int gmc_v8_0_process_interrupt(struct amdgpu_device *adev,
 
 		task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
 		if (task_info) {
-			dev_err(adev->dev, " for process %s pid %d thread %s pid %d\n",
-				task_info->process_name, task_info->tgid,
-				task_info->task_name, task_info->pid);
+			amdgpu_vm_print_task_info(adev, task_info);
 			amdgpu_vm_put_task_info(task_info);
 		}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 282197f4ffb1..78f65aea03f8 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -641,10 +641,7 @@ static int gmc_v9_0_process_interrupt(struct amdgpu_device *adev,
 
 	task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
 	if (task_info) {
-		dev_err(adev->dev,
-			" for process %s pid %d thread %s pid %d)\n",
-			task_info->process_name, task_info->tgid,
-			task_info->task_name, task_info->pid);
+		amdgpu_vm_print_task_info(adev, task_info);
 		amdgpu_vm_put_task_info(task_info);
 	}
 
-- 
2.49.0

