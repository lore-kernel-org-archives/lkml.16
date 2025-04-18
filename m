Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82D32AE8C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 00:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744935703; cv=none; b=m59yoavRELpI+itBsnkHycF82rPGT3mITku4jWF0VQ15kLHbZc6yhi5y7JIxwgXVTdcRFCri6nUMc/OoKhG8j27gRIKyG2X+f9HFhMBVI7LE4C7hPUpXFNQ1SszKJsEor8FDF4a1R6a+X1OpBlBL+opYLmh2oDhBAZpl5GEWnBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744935703; c=relaxed/simple;
	bh=C2kRiwkEeu4BLqFa68kaIY/QetWcXO/Y3PcQtWojE3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MsISuQGCMH/C1AdNcVLYmIqdWP7E0kEd6B7fWtTt8sP89CWtYNmyIsuve6MI1ceXOULi/7zxSafwvE5Wpujz6v3djfk8S8mSGn4uUhmRAD5wqv+XY/Bk/fOc1/8h+uW7b2+gfkc6dOKyJbbbjV0YhQDHjL6IPcvcB2H8a6PnE7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Dy8FXPLU; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Dy8FXPLU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=c0zCwIR2YZCux8Gj1g6mDQzfRIobFooUknXOTVAhgoI=; b=Dy8FXPLUVmqWDYyu
	/cQtnjJXJ0JfNFYUIqbMvJGtkIZf9JCUh2s5z5qTlZWiDq0OBp65djrJVqxKercS1E0iJP7j1CnK/
	YBfXi8/Kp2GYw57z1KnJL5csSHnFt8hHiZmqDX0ESiqLfdSv39Tk1uxPW+aanNEtfrQUXFuotFvL5
	xV5h4Q4N9ijypOpChsF/dfMo9O9k2dTE12XIlT6as7X+Fwj75lzeUE+aWLDgVtb3QJ8cyM39Rn5AP
	DlbVIWEz/8dGpF3jyy6h1HHHD8u/iOy/AyU/mMgm4KNpyCQBd5f+k1jatBilhUOiQQpOjo8B2iOq7
	EnOiiQxqKnFHwAA5fg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u5ZTr-00CPl8-1r;
	Fri, 18 Apr 2025 00:21:19 +0000
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
Subject: [PATCH 2/4] drm/radeon: Remove unused radeon_doorbell_free
Date: Fri, 18 Apr 2025 01:21:15 +0100
Message-ID: <20250418002117.130612-3-linux@treblig.org>
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

radeon_doorbell_free() was added in 2013 by
commit 75efdee11b5d ("drm/radeon: implement simple doorbell page
allocator")
but never used.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/radeon/radeon.h        |  1 -
 drivers/gpu/drm/radeon/radeon_device.c | 14 --------------
 2 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 8605c074d9f7..58111fdf520d 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -686,7 +686,6 @@ struct radeon_doorbell {
 };
 
 int radeon_doorbell_get(struct radeon_device *rdev, u32 *page);
-void radeon_doorbell_free(struct radeon_device *rdev, u32 doorbell);
 
 /*
  * IRQS.
diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index bbd39348a7ab..4127ffb4bb6f 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -392,20 +392,6 @@ int radeon_doorbell_get(struct radeon_device *rdev, u32 *doorbell)
 	}
 }
 
-/**
- * radeon_doorbell_free - Free a doorbell entry
- *
- * @rdev: radeon_device pointer
- * @doorbell: doorbell index
- *
- * Free a doorbell allocated for use by the driver (all asics)
- */
-void radeon_doorbell_free(struct radeon_device *rdev, u32 doorbell)
-{
-	if (doorbell < rdev->doorbell.num_doorbells)
-		__clear_bit(doorbell, rdev->doorbell.used);
-}
-
 /*
  * radeon_wb_*()
  * Writeback is the method by which the GPU updates special pages
-- 
2.49.0

