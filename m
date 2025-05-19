Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355351DE2DC
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747666359; cv=pass; b=hDTWiYRqCILl20fuH94ZCZziexAkTLIXP7Qt0JWXK/4QML145PjcepjY0gRj1sHncbGBnWP0ChzLJ0TftcMWKwIQTLEBoLxVx2wsylwfkUjeiRS/cDYL+xI+x254p6OSb2npA94T3mIuGJUNGA0p+mh8CJtdX8OHvnryWshnIdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747666359; c=relaxed/simple;
	bh=Ik7VDvLBKoD5JEdUdJzIuSULsG08WlBUgK/O/rCdskU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RK2epcEOFsdQSFNYryqtxJ2Ibl4EJw5y2pDljWgandeZVEqO9qmF0t9XPIjO32XuWfE7q4B6B3XyiNpNAM4tqora4DNnYExpoS9rbO49fOAuQyZSSi0AneE9N53oSx4QInORNx9PCvpo/hqiVhmPKEDi8a8lo92dZyCJI0Zbo/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ashley.smith@collabora.com header.b=JZd41u2L; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ashley.smith@collabora.com header.b="JZd41u2L"
ARC-Seal: i=1; a=rsa-sha256; t=1747666336; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Fi/wHX6Mb+Vs4JdFrPS7+6D+0FMm2y+r2qm1dfGgYSMqQwBu+RN37lSvfJY1+q6wdBtaFSfRdqbOEbhdtVELtL2c9g/ecifc3Txsxshd/tRZQ2yfz6KhQL3Xve9Y8HDTFKnJ5G79RNgsfsgKRhRTTQwJQGrvNOlqii4X7tg8/NA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747666336; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BG/5r3CmIwHg1FslOmxmLHkPkGI/Ods4ezB25RAuImM=; 
	b=MmlNY13Mo+HIjSTCXJwt01AvjEarLPGD20vdY5OZ/dgO18KxMvUu6xSYVqKkThMbGL9sIqVjt5eCQARtRAv5I9371pyqV3DHynyPhklT4sSDQ2ZNx3nHtzHCALXqlBFIP+1Ei5PT+WQ3Th4RUHtzM+ghlEEZeNqZL4V7nN9vEEM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ashley.smith@collabora.com;
	dmarc=pass header.from=<ashley.smith@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747666336;
	s=zohomail; d=collabora.com; i=ashley.smith@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=BG/5r3CmIwHg1FslOmxmLHkPkGI/Ods4ezB25RAuImM=;
	b=JZd41u2Ljeue6nY4DOLxkKmalGbKuC4szNzifCs2qGEXS0ZJP66dPnWeJ17ENHqf
	oM9yvC9ogCYdm0rra2IOCeb6hl6KpjfHoCKgtRJb+rd4McxzFngIaYTGMyzO1psEXvP
	gaq44J3JOppTE1IxTYKyHqz/NV7fnkBFrNxDYrsk=
Received: by mx.zohomail.com with SMTPS id 1747666334331245.9607774211055;
	Mon, 19 May 2025 07:52:14 -0700 (PDT)
From: Ashley Smith <ashley.smith@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
	Ashley Smith <ashley.smith@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/panthor: Reset queue slots if termination fails
Date: Mon, 19 May 2025 15:50:19 +0100
Message-ID: <20250519145150.2265020-1-ashley.smith@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This fixes a bug where if we timeout after a suspend and the termination
fails, due to waiting on a fence that will never be signalled for
example, we do not resume the group correctly. The fix forces a reset
for groups that are not terminated correctly.

Signed-off-by: Ashley Smith <ashley.smith@collabora.com>
---
Changes in v2:
 - Fixed syntax error
---
 drivers/gpu/drm/panthor/panthor_sched.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 43ee57728de5..65d8ae3dcac1 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2727,8 +2727,17 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
 			 * automatically terminate all active groups, so let's
 			 * force the state to halted here.
 			 */
-			if (csg_slot->group->state != PANTHOR_CS_GROUP_TERMINATED)
+			if (csg_slot->group->state != PANTHOR_CS_GROUP_TERMINATED) {
 				csg_slot->group->state = PANTHOR_CS_GROUP_TERMINATED;
+
+				/* Reset the queue slots manually if the termination
+				 * request failed.
+				 */
+				for (i = 0; i < group->queue_count; i++) {
+					if (group->queues[i])
+						cs_slot_reset_locked(ptdev, csg_id, i);
+				}
+			}
 			slot_mask &= ~BIT(csg_id);
 		}
 	}

base-commit: 9934ab18051118385c7ea44d8e14175edbe6dc9c
-- 
2.43.0

