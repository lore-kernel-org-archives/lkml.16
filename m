Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CE92820DB
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 09:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748944262; cv=pass; b=XOS8mgSjoK8lWlsXwxTf9Bqcfn/HisUwNQlalRetMn8MNePKrAgL9BhKD5dz2IdwDHflS7EZHF2D76p8recB7jMveI321wWSPLTpNq0mmBHpXjaTy9a7yMn+dpS0+gAHI78e8tXZW5ZoobctsWqneBNfCpt+4W7+xkue7+0l8Js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748944262; c=relaxed/simple;
	bh=NcFfpAb9f3RCzKCfb1bAGUiXc9+r226diNRtU1U8Cr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wm0TArzWbeTQD+HeqkQOtMhbCovpww+v+JIugSRT3166s3W4YX8FaVsnXljJTMMVg+0hYP2b6Fl2QR7fHyREBldSl5H7K8U+a7vST14dzE/8ZndPhaE8vf++IHLQUTqGNk5dX603+vd9Sl4N1/c7ThBdHDkOWmP2vhC6o6+2Eg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ashley.smith@collabora.com header.b=aVcSgi+Q; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ashley.smith@collabora.com header.b="aVcSgi+Q"
ARC-Seal: i=1; a=rsa-sha256; t=1748944249; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DcwlziAs74z1jHob7MPp84ml9uSmoJiBbwm/fY6sMaPsKheMTKn6Q40yOWicZcu0A6XNkGCCe/Ne0XR6BUsF7XRqQQ7sUiV/96S1iBQ7gDlbUypeRC9lHJ2zG2xHDGfl7VITofug+kv7whIhJPm97wBfOpKaz+llo/XgwnUA+RU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1748944249; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fA75GZ8Du58l/Cfml68DsSM1nb55/pIKPein/E2W0nk=; 
	b=RQAJlJxwc9SCfrim3amOl2AivZgG2OsOklqdRkd+b6tA1KQNlg8qmR+Dbydi1F3549jkCYQx/eysK/z5EPCks/hxqGS/e/Nyxb0gp5IyvCslllaX522zY40f5oOI8PW0Y1rVM0wYFRg3Dh9O5eYzv5NPmLq7+EoLxf0GvJO/apY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ashley.smith@collabora.com;
	dmarc=pass header.from=<ashley.smith@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748944249;
	s=zohomail; d=collabora.com; i=ashley.smith@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fA75GZ8Du58l/Cfml68DsSM1nb55/pIKPein/E2W0nk=;
	b=aVcSgi+Q7eTeT+qrk7Gr28pXAJ1nQjVE9UFNak9CrHYq8xKkaz5pGW0mFSkMITKX
	MNJjU7UIWVtLP31pTsTiFl9Bvdv+7DDhJUDgWUgFWw589sGbcwtvJm9dzo++17ohZf5
	1dYVcq83rPsXrSmVm4m1lUwO9hCwTBryAAp5ymd8=
Received: by mx.zohomail.com with SMTPS id 1748944246587913.3359863134881;
	Tue, 3 Jun 2025 02:50:46 -0700 (PDT)
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
	dri-devel@lists.freedesktop.org (open list:ARM MALI PANTHOR DRM DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 1/2] drm/panthor: Reset queue slots if termination fails
Date: Tue,  3 Jun 2025 10:49:31 +0100
Message-ID: <20250603094952.4188093-2-ashley.smith@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250603094952.4188093-1-ashley.smith@collabora.com>
References: <20250603094952.4188093-1-ashley.smith@collabora.com>
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
Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
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
-- 
2.43.0

