Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2D41FDA8A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039381; cv=none; b=I9J0TOdzBgUoEw/8dOSojWs9mqg+VZHJyNZazpANogDdWzHUrrOsDmkkta8ruvrzimpUI+jvnC/L9lxOCg5F773NzNQ+NasVIuDSJ/puY7rKpsHTlDuROpG+NWgD1PsOQAREquup+gkR/GA36+ni4Rq+kVXWdXwUH7YlXpPx5oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039381; c=relaxed/simple;
	bh=c/cHw962Afn9EFlsW0TCSyauMJFYlWb4TIDzbQnTmWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uQJGVfwhitnAgBBbvdHyVXa+1aKaIwd5n27JAX4XhKhaTojCxutHFoPEsg9gJsyXwrx69jdknQe+FTFsrE/9OjmKxjkurBD2delruwOM6U7ro87140jwKHV0FJdj+A2I+oN1FjPvAKZVmel6EM8nTDXK4m12Hz0f7wmNhKpyQcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cwx8K2hA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cwx8K2hA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF1FC4CEE8;
	Mon,  7 Apr 2025 15:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744039381;
	bh=c/cHw962Afn9EFlsW0TCSyauMJFYlWb4TIDzbQnTmWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cwx8K2hAA/WItU/f3PVN0MjpeYPCVFg6ErCkXbtxM5JHrPuitd9N/LA34iAjk1ZV8
	 sd6BpD3IjjhRTW0TqkAYPFRZRKmoKKZ9zkVPosW+DMEQIoxLNK/lWnYPAj0ouNmBLs
	 cWC/AfZ84uFY07DGjuW+MqHAR6nDl7gA6kJS8PPJJDDgY0ErNKvKXPX4SuN5wX+yJx
	 w8bdd8Pwf03vO5RHZQSOhyNg3aFH4Fo0cL7Q5PT/NTXLGJFrf3AfjvdHRAiJO+Op8Q
	 WBvK4POj2ni4qmSdK5QUMyucSUsR6vkT1dljWIEomlXLvEPb0ZPEvD3qqq2Nqka3wa
	 bckAOm+EH+5Mg==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] drm/sched: Warn if pending list is not empty
Date: Mon,  7 Apr 2025 17:22:38 +0200
Message-ID: <20250407152239.34429-5-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407152239.34429-2-phasta@kernel.org>
References: <20250407152239.34429-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_sched_fini() can leak jobs under certain circumstances.

Warn if that happens.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 6b72278c4b72..ae3152beca14 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1465,6 +1465,10 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	sched->ready = false;
 	kfree(sched->sched_rq);
 	sched->sched_rq = NULL;
+
+	if (!list_empty(&sched->pending_list))
+		dev_err(sched->dev, "%s: Tearing down scheduler while jobs are pending!\n",
+			__func__);
 }
 EXPORT_SYMBOL(drm_sched_fini);
 
-- 
2.48.1

