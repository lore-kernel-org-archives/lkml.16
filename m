Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BE92980CB
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747305225; cv=pass; b=fsrQ4Qzho8rdVBJa6qhKBqte5/U3z39afM2lJP67WA4mvVH8/PMgpFw6E7h8qrM9XoxSIxQi9UCVTuE1dROlu9azpSDLQkqv2DLawzH0Mz+X4xYtkGBCC8TbwCyCbqT36vT3mXz6bttQ8wzZA8WuNVzqk38KDj8lY8KZWYUkNtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747305225; c=relaxed/simple;
	bh=AuXV2jwOCHMscCJn2RyQB7FBqzDAhg9Fd3mBP4tnuzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eV7lzXcTDsUPtzdkzizgPcevGhiaK+SSoF7GxOJIQSclHrObbpBvgm17GYGq7DFNy6Be22aH3oi1y81/PLS4JRhAh3pIrUDq33PjTi+ZRq3m1E3QKaqjVB9rp4UPAqAJiQJDWoCShLKVXOAVo+IQSzsnoJHY2y0Uga+us8j84FE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ashley.smith@collabora.com header.b=kj00T6U1; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ashley.smith@collabora.com header.b="kj00T6U1"
ARC-Seal: i=1; a=rsa-sha256; t=1747305204; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eNaZ7RWGgKlEcIpnXfQASf7ZtEaVuagBnyKCwWMynDnDtXoIiiHPgtoG7fsVxByQGNVIih74aBxGXeKzcExCLCxm23nykdS/PjbC+eCeNlaIDyQzate45f0tDWB2tHsbwPuR/huY/G/l529z4j4OF46XvSmDzPtqzqrSWcRjTqI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747305204; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IzhJq/KI+z8Y+0dsDs/7LMPucBSPLRXhlb7t+uypEPE=; 
	b=PvqiFdV+SisuTA+4b7ioQHkOq/LlIQPMzdwhSgGkR5F2A9s1V9CPRSjCVUcN3tpZFG5hFnMw3iHOvudLxxNTvMZE+3UAwk3y3Ee6JX758N6zLnZCTYmt2G5+19IAuH0qRNEhaj+1uLpckZST+C4GtDKk5fCkDMQsBgJcVnDaYGU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ashley.smith@collabora.com;
	dmarc=pass header.from=<ashley.smith@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747305204;
	s=zohomail; d=collabora.com; i=ashley.smith@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=IzhJq/KI+z8Y+0dsDs/7LMPucBSPLRXhlb7t+uypEPE=;
	b=kj00T6U1H9gIyY2OZkB3vvNTxkKvzcLfF0gAvoZYQZ1cQgLevinPfwaQor8mYI5W
	sJLE3IaAR0+PQ4Kat7qCFFZe38YVwr4X9eaBZLiYuz0aVH/G/tOG/3/AUGTdmkwKatj
	WekdMzgtVxFv83nA/8wjLEltWgQoSYZaBI3crfOs=
Received: by mx.zohomail.com with SMTPS id 174730520201961.4224475817598;
	Thu, 15 May 2025 03:33:22 -0700 (PDT)
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
Subject: [PATCH] drm/panthor: Reset queue slots if termination fails
Date: Thu, 15 May 2025 11:33:05 +0100
Message-ID: <20250515103314.1682471-1-ashley.smith@collabora.com>
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
 drivers/gpu/drm/panthor/panthor_sched.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 43ee57728de5..1f4a5a103975 100644
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
+				for (i = 0; i queue_count; i++) {
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

