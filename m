Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E293267F61
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747902489; cv=none; b=ewU4C+VkQC3N17bkZl3v/oB7vHNAZf09nqBXggBCYCup+xssHvLQ/RNmI6SHqiAdUfUYZQiB1UBYnqaf42lQVOvnhi1pYJYohex0iiQ3l5Bd1APONICFiqAO4MJPLkD8gjcS3aNQCnxzKylc//C4Wuglk3OQzB3xhkW6xWOfQrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747902489; c=relaxed/simple;
	bh=kPkZtalTn6TC4lN3oTaHdbFRHY6GMTw8m4m6qeCssVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dsbs4jNi20AupKK2KV0fx6KHqaP78Y+mX3ivq66Jsg9dylSU5iJ9sPyrb10yXJ+SisZYnemuBmAZwRH9GA5mua9n4QB9XZpU5nepkPMxWnW6vLomxPr2tCQ3Qb+ByXQvU4Shooetc5xA4phJ2iibNi9Ijfz4werHzlyYDjR7teM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gs7uON+v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gs7uON+v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19ECC4CEEA;
	Thu, 22 May 2025 08:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747902489;
	bh=kPkZtalTn6TC4lN3oTaHdbFRHY6GMTw8m4m6qeCssVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gs7uON+vEZevuf6v5yijtPIS7j7PNy7jlcgbPd8KXZq0ze6r2+7ne7pDGCOZl2O0n
	 pJAZ16/qTBMbGYph06hWZAgz0daBvWqMrlwHxGJtMXJ1kA61nn44WDc4DBcCBliXYs
	 FFoA3fVr4iAAITcHTmXQ6gu7OAErMYg75lqvcKGckMEwXQWnF9H2M2PtEG9SN67gIB
	 5q7uZfrW4XWR01YfkHMKULygV8TLPGzo/IdtmE7rQVVEnrjUWyBEoKyJ73hxQUKC0f
	 Gsbo0mHcwhviSUDSFryfRkL5wRIUkPGlnCOS1YqFYGDlAtK6zS8A3YlHVsueE76NgP
	 egLFobbliUAeA==
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
Subject: [PATCH v3 3/5] drm/sched: Warn if pending list is not empty
Date: Thu, 22 May 2025 10:27:41 +0200
Message-ID: <20250522082742.148191-5-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522082742.148191-2-phasta@kernel.org>
References: <20250522082742.148191-2-phasta@kernel.org>
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
 drivers/gpu/drm/scheduler/sched_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 406572f5168e..48f07e6cfe2b 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1469,6 +1469,9 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	sched->ready = false;
 	kfree(sched->sched_rq);
 	sched->sched_rq = NULL;
+
+	if (!list_empty(&sched->pending_list))
+		dev_err(sched->dev, "Tearing down scheduler while jobs are pending!\n");
 }
 EXPORT_SYMBOL(drm_sched_fini);
 
-- 
2.49.0

