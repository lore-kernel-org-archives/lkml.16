Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D00225D7
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 05:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.133.245.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748066193; cv=none; b=nTYYw0xA37/vtAFK6WAhnwiWPHnHI/0egiaeDmCZ8Orqd1ZCtg0hN9wFx91PnPs/QLzih4xPluvsjo90anNFTRr8hvlZqP0Exu4DR2TEGwJGbiaLCpQR1TvJYFyNqFUAnpb1EoCXuCGkPUHLKGhcSXSlqiDhLPXeWoAfjzFP4z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748066193; c=relaxed/simple;
	bh=TIAcbocg9y14Fob0XJ0paDnaJ106oWT1NBjEKKkFB2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NiUBerIupk7N0Op7ZHzY09yMJx976QMPEFRkhzOmHO/h36b4cNZngVUxvMrpRMCQDyysx4rIaAC5L54T5uJdnk53DtC7o0YixgJFNQB6BSsPWhgGjRUNZmp2kTlI2YLC2220fvOu9Va/UZ3dpSCvmmXJFu5Mk063oi6qy601R1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nppct.ru; spf=pass smtp.mailfrom=nppct.ru; dkim=pass (1024-bit key) header.d=nppct.ru header.i=@nppct.ru header.b=GNxyWPDD; arc=none smtp.client-ip=195.133.245.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nppct.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nppct.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nppct.ru header.i=@nppct.ru header.b="GNxyWPDD"
Received: from mail.nppct.ru (localhost [127.0.0.1])
	by mail.nppct.ru (Postfix) with ESMTP id 371471C118E
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 08:56:17 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:to:from:from; s=dkim; t=1748066170; x=
	1748930171; bh=TIAcbocg9y14Fob0XJ0paDnaJ106oWT1NBjEKKkFB2Q=; b=G
	NxyWPDDEJ9glBzHe/UlkvPvHWN35lVNi+zkiykniX9h3ooE2r0fNLjjK28FU3OGf
	udzpqOWT+AJkeBFxL1LZb73JSvnALcJCLuJMuJFNfFbf+/limspo3luQ9gA+dbU/
	8E6wxr8MAXXUT3KQdu3DO0ORGWHPEXXBh9pgdFXfvY=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
	by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id eymnnHZZlXSa for <linux-kernel@vger.kernel.org>;
	Sat, 24 May 2025 08:56:10 +0300 (MSK)
Received: from localhost.localdomain (unknown [87.249.24.51])
	by mail.nppct.ru (Postfix) with ESMTPSA id 0F5151C114E;
	Sat, 24 May 2025 08:55:56 +0300 (MSK)
From: Alexey Nepomnyashih <sdl@nppct.ru>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Alexey Nepomnyashih <sdl@nppct.ru>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Vitaly Prosyak <vitaly.prosyak@amd.com>,
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
	Jiadong Zhu <Jiadong.Zhu@amd.com>,
	Yang Wang <kevinyang.wang@amd.com>,
	Prike Liang <Prike.Liang@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH] drm/amdgpu: fix NULL dereference in gfx_v9_0_kcq() and kiq_init_queue()
Date: Sat, 24 May 2025 05:55:43 +0000
Message-ID: <20250524055546.1001268-1-sdl@nppct.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A potential NULL pointer dereference may occur when accessing 
tmp_mqd->cp_hqd_pq_control without verifying that tmp_mqd is non-NULL.
This may happen if mqd_backup[mqd_idx] is unexpectedly NULL.

Although a NULL check for mqd_backup[mqd_idx] existed previously, it was
moved to a position after the dereference in a recent commit, which
renders it ineffective.

Add an explicit NULL check for tmp_mqd before dereferencing its members.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Cc: stable@vger.kernel.org # v5.13+
Fixes: a330b52a9e59 ("drm/amdgpu: Init the cp MQD if it's not be initialized before")
Signed-off-by: Alexey Nepomnyashih <sdl@nppct.ru>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index d7db4cb907ae..134cab16a00d 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -3817,10 +3817,9 @@ static int gfx_v9_0_kiq_init_queue(struct amdgpu_ring *ring)
 	 * check mqd->cp_hqd_pq_control since this value should not be 0
 	 */
 	tmp_mqd = (struct v9_mqd *)adev->gfx.kiq[0].mqd_backup;
-	if (amdgpu_in_reset(adev) && tmp_mqd->cp_hqd_pq_control){
+	if (amdgpu_in_reset(adev) && tmp_mqd && tmp_mqd->cp_hqd_pq_control) {
 		/* for GPU_RESET case , reset MQD to a clean status */
-		if (adev->gfx.kiq[0].mqd_backup)
-			memcpy(mqd, adev->gfx.kiq[0].mqd_backup, sizeof(struct v9_mqd_allocation));
+		memcpy(mqd, adev->gfx.kiq[0].mqd_backup, sizeof(struct v9_mqd_allocation));
 
 		/* reset ring buffer */
 		ring->wptr = 0;
@@ -3863,7 +3862,7 @@ static int gfx_v9_0_kcq_init_queue(struct amdgpu_ring *ring, bool restore)
 	 */
 	tmp_mqd = (struct v9_mqd *)adev->gfx.mec.mqd_backup[mqd_idx];
 
-	if (!restore && (!tmp_mqd->cp_hqd_pq_control ||
+	if (!restore && tmp_mqd && (!tmp_mqd->cp_hqd_pq_control ||
 	    (!amdgpu_in_reset(adev) && !adev->in_suspend))) {
 		memset((void *)mqd, 0, sizeof(struct v9_mqd_allocation));
 		((struct v9_mqd_allocation *)mqd)->dynamic_cu_mask = 0xFFFFFFFF;
@@ -3874,8 +3873,7 @@ static int gfx_v9_0_kcq_init_queue(struct amdgpu_ring *ring, bool restore)
 		soc15_grbm_select(adev, 0, 0, 0, 0, 0);
 		mutex_unlock(&adev->srbm_mutex);
 
-		if (adev->gfx.mec.mqd_backup[mqd_idx])
-			memcpy(adev->gfx.mec.mqd_backup[mqd_idx], mqd, sizeof(struct v9_mqd_allocation));
+		memcpy(adev->gfx.mec.mqd_backup[mqd_idx], mqd, sizeof(struct v9_mqd_allocation));
 	} else {
 		/* restore MQD to a clean status */
 		if (adev->gfx.mec.mqd_backup[mqd_idx])
-- 
2.43.0

