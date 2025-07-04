Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF81D1CF96
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 03:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751598414; cv=none; b=KhQd77ZPCn7C1Fjvj/B6qxh8n8QB54bq44fr8TvptztaZr3HHgrH/M04s6haFBxZPaRLM4HWaJD7m5+jjkrWPn9m1H35qCEv2gMoD3RBqN4n1nC1m6KPmNdoQkmCUCoYOpe1nRkoWdWV2q7wlEBTeDw7WxHWfjDhzM5Vg8J61l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751598414; c=relaxed/simple;
	bh=ri56/lzFq99U0yNgquVJaPa4mYUG+uUQIS/NpjF8oCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RL3aDwpyAey+tqS/yvDNwoc/XG0Yq615rC+NIDKvBDBHXyQpUe9Hi+xMgAU5zg+spqG6rZU/be0GW5l6d+7f6Vfah8B2P0ha0BxVslNDge8JTRjNliN1vbVdp8MPJPINU0eJODVb+BBuZjoi/o5LoPiGtwRJ+P02Vwlf0K4h5oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Uq/e4eJI; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Uq/e4eJI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=lrLB2w6XrBgAxl5WGmLus+DTYqxCa+sn6BI6H1HllKo=; b=Uq/e4eJI2lwXVCTC52RtDGs9hK
	UcMgFPHuTq+Io5OQWpkta3DpG2kw6OyaST+NrYx5jz0Vt4WG3o7f47NzZz8Lk7erPchG+K34t17s3
	GYAUgNVInwxuMABkq7fP8uMbNB0wUsiCZtvdfoA44Coa6nAscNdhfXilKrkL/QEfdQ8pdcx71A9cx
	7s9i1yw12bzNsdTiUz/4usb4dMF1X6oShVZLnfisevlWYTH00HLjJw0IHyGIKZHQmOjXcVlQnVZIH
	J5O/e17kZA5TqqTrmk96dJClgOEXCDjbIYFiTH9wJK5bWWGpWgHxcKtphaQU2InbS6vmZPFTpXjXN
	1uz72BYw==;
Received: from [179.100.5.63] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uXWl5-00CBhm-JO; Fri, 04 Jul 2025 05:06:39 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: "Alex Deucher" <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	amd-gfx@lists.freedesktop.org,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Dave Airlie <airlied@gmail.com>
Subject: [PATCH] drm/amdgpu: Fix lifetime of struct amdgpu_task_info after ring reset
Date: Fri,  4 Jul 2025 00:06:29 -0300
Message-ID: <20250704030629.1064397-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a ring reset happens, amdgpu calls drm_dev_wedged_event() using
struct amdgpu_task_info *ti as one of the arguments. After using *ti, a
call to amdgpu_vm_put_task_info(ti) is required to correctly track its
lifetime.

However, it's called from a place that the ring reset path never reaches
due to a goto after drm_dev_wedged_event() is called. Move
amdgpu_vm_put_task_info() bellow the exit label to make sure that it's
called regardless of the code path.

amdgpu_vm_put_task_info() can only accept a valid address or NULL as
argument, so initialise *ti to make sure we can call this function if
*ti isn't used.

Fixes: a72002cb181f ("drm/amdgpu: Make use of drm_wedge_task_info")
Reported-by: Dave Airlie <airlied@gmail.com>
Closes: https://lore.kernel.org/dri-devel/CAPM=9tz0rQP8VZWKWyuF8kUMqRScxqoa6aVdwWw9=5yYxyYQ2Q@mail.gmail.com/
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 1e24590ae144..e69366401f6b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -90,7 +90,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
 	struct amdgpu_job *job = to_amdgpu_job(s_job);
 	struct drm_wedge_task_info *info = NULL;
-	struct amdgpu_task_info *ti;
+	struct amdgpu_task_info *ti = NULL;
 	struct amdgpu_device *adev = ring->adev;
 	int idx;
 	int r;
@@ -172,8 +172,6 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 	}
 	dma_fence_set_error(&s_job->s_fence->finished, -ETIME);
 
-	amdgpu_vm_put_task_info(ti);
-
 	if (amdgpu_device_should_recover_gpu(ring->adev)) {
 		struct amdgpu_reset_context reset_context;
 		memset(&reset_context, 0, sizeof(reset_context));
@@ -199,6 +197,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 	}
 
 exit:
+	amdgpu_vm_put_task_info(ti);
 	drm_dev_exit(idx);
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
-- 
2.49.0

