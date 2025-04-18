Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078FD111AD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 00:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744935691; cv=none; b=I6/2Btc0B1RDqKDAfqXlbdrntT0ipOIGR/+rZUPqnSo9SJrRoc267Y4cZQ2I0473Q43Untm4VJyNMCD7iiZ7wk4yEYLlSPY10YC1+NG0WUz3N9KEKCaZ+P4cRgAWdxJxj1WG7XKb8zPbAiUdckxb1U/JG1s4qbxD+Xy9UkbvSwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744935691; c=relaxed/simple;
	bh=0sROsm3KVeR8i200Dj3W33GKwp/PGaioQ5a58mawwcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pAy3OKFx1XKkDvd2+UzQgZ86GSWDGWOKsFXwAGs5Cq2DRxzl9tTpbW1CY6InZEW/A57hjPh8edzakQ2tEGp1vUGuP6czjqIuGLvMMETk4notqbLBjTOY5Tfq1dRhQYYIxuflYzpdAxFHO60+4XfyjLxk+eF2PY9lesXE15+GRZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Cfl1PH6V; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Cfl1PH6V"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=BecQJkrNlQ3akqTLtmWZkyczre6xMs/aCGibLOPB01w=; b=Cfl1PH6VxrumXzxO
	FIJ7mklfUDbioGEtV/c74t5Kh0ODglK+4khCKmzxcSRuQgejcLuwvef8X8JbH+UOEbMr5ETgBxATX
	kXYwbx4QiNiFtIXbFa/TOAFxT7Z9EiYeYvaC8ru/4vyMPof/wHsB1+Ha8VXow+Fv27I6areuggdrw
	tsYYmnA6tTnPEJUHG0lfzaYf9QVIMumpQjqz5ampkkbcDVI/qJoY22Y4PV6G59sTY0Ha7jlufCRhw
	RI6zwZi6KqP2/Nt6LvRQmh4fcuz/Hkb/tQarPZvxdjdhAhzi7x5H9TaqPN5bm1XSCiTuTu79nJ98Q
	26rQzRn9klPVN058HQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u5ZTs-00CPl8-0H;
	Fri, 18 Apr 2025 00:21:20 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com,
	siqueira@igalia.com,
	christian.koenig@amd.com
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 3/4] drm/radeon: Remove unused radeon_fence_wait_any
Date: Fri, 18 Apr 2025 01:21:16 +0100
Message-ID: <20250418002117.130612-4-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418002117.130612-1-linux@treblig.org>
References: <20250418002117.130612-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

radeon_fence_wait_any() last use was removed in 2023's
commit 254986e324ad ("drm/radeon: Use the drm suballocation manager
implementation.")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/radeon/radeon.h       |  3 --
 drivers/gpu/drm/radeon/radeon_fence.c | 42 ---------------------------
 2 files changed, 45 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 58111fdf520d..53f6378b6db6 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -394,9 +394,6 @@ long radeon_fence_wait_timeout(struct radeon_fence *fence, bool interruptible, l
 int radeon_fence_wait(struct radeon_fence *fence, bool interruptible);
 int radeon_fence_wait_next(struct radeon_device *rdev, int ring);
 int radeon_fence_wait_empty(struct radeon_device *rdev, int ring);
-int radeon_fence_wait_any(struct radeon_device *rdev,
-			  struct radeon_fence **fences,
-			  bool intr);
 struct radeon_fence *radeon_fence_ref(struct radeon_fence *fence);
 void radeon_fence_unref(struct radeon_fence **fence);
 unsigned radeon_fence_count_emitted(struct radeon_device *rdev, int ring);
diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
index 8ff4f18b51a9..5b5b54e876d4 100644
--- a/drivers/gpu/drm/radeon/radeon_fence.c
+++ b/drivers/gpu/drm/radeon/radeon_fence.c
@@ -574,48 +574,6 @@ int radeon_fence_wait(struct radeon_fence *fence, bool intr)
 		return r;
 }
 
-/**
- * radeon_fence_wait_any - wait for a fence to signal on any ring
- *
- * @rdev: radeon device pointer
- * @fences: radeon fence object(s)
- * @intr: use interruptable sleep
- *
- * Wait for any requested fence to signal (all asics).  Fence
- * array is indexed by ring id.  @intr selects whether to use
- * interruptable (true) or non-interruptable (false) sleep when
- * waiting for the fences. Used by the suballocator.
- * Returns 0 if any fence has passed, error for all other cases.
- */
-int radeon_fence_wait_any(struct radeon_device *rdev,
-			  struct radeon_fence **fences,
-			  bool intr)
-{
-	uint64_t seq[RADEON_NUM_RINGS];
-	unsigned int i, num_rings = 0;
-	long r;
-
-	for (i = 0; i < RADEON_NUM_RINGS; ++i) {
-		seq[i] = 0;
-
-		if (!fences[i])
-			continue;
-
-		seq[i] = fences[i]->seq;
-		++num_rings;
-	}
-
-	/* nothing to wait for ? */
-	if (num_rings == 0)
-		return -ENOENT;
-
-	r = radeon_fence_wait_seq_timeout(rdev, seq, intr, MAX_SCHEDULE_TIMEOUT);
-	if (r < 0)
-		return r;
-
-	return 0;
-}
-
 /**
  * radeon_fence_wait_next - wait for the next fence to signal
  *
-- 
2.49.0

