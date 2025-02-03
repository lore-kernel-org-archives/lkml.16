Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D90205E06
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738596679; cv=none; b=VEP+H8UBKaQydWxliNdZiZTECmDt0x7dTFr0dwXbNocSYZtTtnS9ZNkDqKbepNVlZ/svjDVuI/KYSuhhWwgY46aGfN6cBgXftGhVW2ppht4lpDlQFqh9+YHZdg3QH2jZ/i/pVMuJu0J7fzmJvJw814oUIXih5GuW50AGECJNPjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738596679; c=relaxed/simple;
	bh=3eugK1vqrccz38OY5GN0YkQW2c0WOhGqGyxEzYxxH68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DWytJhcViXIta6AcBvIlvhkxvpKSUAzEVf15+k3uggJkFLtoiDxEJyjOVM3yiRLhIPvYS4QnLL38gL03SE05hVWvYMpF6DLPVqhm3xYyLEdgaZe7Nc3XEPbNwVuMS30HCdEAL34FgKKKo/0d78dpVAFNsgCrknI9/h2ik82rEEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pUw4g7/3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUw4g7/3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CB3EC4CEE0;
	Mon,  3 Feb 2025 15:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738596678;
	bh=3eugK1vqrccz38OY5GN0YkQW2c0WOhGqGyxEzYxxH68=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=pUw4g7/32e4byQkzsZ9ZfFol47D7JPJkLDC8UFDs84A6ptKIjXKMLzIJtDee1T5zx
	 6GBU01T4ofBfIXTng4ptU+s/Vt34BKLPm3dLs2gg5OOzX3pAk0JPQdQcNYawOfc9QT
	 Ey2UErxz3rCHgdS1wQU8RmHljtQ0B8aha1sow5d1xhNMPAhbvtvazOUnKkLCNHpoKS
	 b1kqlcrxAcgKWP9ov5HgznS5eTMlKS7mr92x2MAaVXPc81plqrHAMdPibd2dz4GQ4Y
	 dH2T283jNnKI72TM94SDRwrL3K/c5ouR7ouhHIBUQVWgj3n4TDieO0X3KdD0tCt8DB
	 g1LhFF9NGODVg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3B7C02192;
	Mon,  3 Feb 2025 15:31:18 +0000 (UTC)
From: Brendan King via B4 Relay <devnull+Brendan.King.imgtec.com@kernel.org>
Date: Mon, 03 Feb 2025 15:31:03 +0000
Subject: [PATCH] drm/imagination: only init job done fences once
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-init-done-fences-once-v1-1-a2d62406564b@imgtec.com>
X-B4-Tracking: v=1; b=H4sIADbhoGcC/x2MMQqAMAwAv1IyG2jVgvgVcZA01SyptCJC8e8Wl
 4Mb7ioUzsIFZlMh8y1FkjZxnQE6Nt0ZJTSH3vbeusGhqFwYkjJGVuKCqRHJe/LBxjFMBK09M0d
 5/u+yvu8H/PicQGcAAAA=
X-Change-ID: 20250131-init-done-fences-once-c55c5d0f4d8c
To: Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Brendan King <brendan.king@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738596677; l=1196;
 i=Brendan.King@imgtec.com; s=20250203; h=from:subject:message-id;
 bh=UjK3FC3XXdkxQeYEYfFWpaTm/iFaz77TzbxNoVMDyf0=;
 b=My4AKSVKqtml8fmbWNeG7+uNB1hJeePCt8h5m8p1YMXMVMWi4Ca2kDGbYQYyuowV8VWFHz3o5
 BX+BCQa2pX4AlrXF5avolyMkWWzU/cSzJUtfcAn4aJKKwRMqhOmj+Iz
X-Developer-Key: i=Brendan.King@imgtec.com; a=ed25519;
 pk=i3JvC3unEBLW+4r5s/aEWQZFsRCWaCBrWdFbMXIXCqg=
X-Endpoint-Received: by B4 Relay for Brendan.King@imgtec.com/20250203 with
 auth_id=335
X-Original-From: Brendan King <Brendan.King@imgtec.com>
Reply-To: Brendan.King@imgtec.com

From: Brendan King <Brendan.King@imgtec.com>

Ensure job done fences are only initialised once.

This fixes a memory manager not clean warning from drm_mm_takedown
on module unload.

Signed-off-by: Brendan King <brendan.king@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_queue.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
index c4f08432882b12f5cdfeb7fc991fd941f0946676..9a67e646f1eae709859f664c796e1940f0b45300 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.c
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -304,8 +304,9 @@ pvr_queue_cccb_fence_init(struct dma_fence *fence, struct pvr_queue *queue)
 static void
 pvr_queue_job_fence_init(struct dma_fence *fence, struct pvr_queue *queue)
 {
-	pvr_queue_fence_init(fence, queue, &pvr_queue_job_fence_ops,
-			     &queue->job_fence_ctx);
+	if (!fence->ops)
+		pvr_queue_fence_init(fence, queue, &pvr_queue_job_fence_ops,
+				     &queue->job_fence_ctx);
 }
 
 /**

---
base-commit: 3ab334814dc7dff39075e055e12847d51878916e
change-id: 20250131-init-done-fences-once-c55c5d0f4d8c

Best regards,
-- 
Brendan King <Brendan.King@imgtec.com>


