Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F675C603
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743087356; cv=none; b=WY9Lp+/cE58rnC4/qTp1h4yIvCNbDKwNhBPHXstgibZJ/GA6hKiI2ilyLih9tO3AHUIDVBK8uKufJhJV0jtU1sercd7ez6wd1JZnxL3es0Cs5H/luZn8kjS7pqQd7buJqHyXxouZvUTvM/0Pzs7HVUP3UVOyogr5Qip5v7+XCuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743087356; c=relaxed/simple;
	bh=4QW60f7SKHAtmysfncmp9Yyyq1t/uqG2vo/Wn+5ufts=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o5p0XO5AoPA499XQRXrS1ghY7OwdnROrzbqjNzeL4aDcaKsHoFrBThzhTy96dYoTPC3W3C3/mxfl23XQYmpj/JlakHt2SXswOGuKcJH6WV+f4a4ZUsb2pzeDW0C4T1HVkFZLIefCsGJ+LUliXvsbt5xKU3f5h/rhLhQCs6c1mlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L89/TmR9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L89/TmR9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743087354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9cldgrHzimvpEp8JPbUtN1PvofjSbT+Eqi1xbCg5Ct8=;
	b=L89/TmR9nQa8yO5LvLCBOv5TE2YBQFUkuzpZ3ia5prKDc8yxY5fk1w2nC2Vkbg/8ZNPqgx
	gr/yurlpTzJtdsVOdwzoyD94dr/haCV3ViTRcADXt7TFv6+HGxArQoeG0RpYUbdcVMP1hy
	ooolHmIXYQ8ppC9NW1+cVZ0j2gPauYc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-577-yMyfHEvmOkGg6aHrSCRomQ-1; Thu,
 27 Mar 2025 10:55:49 -0400
X-MC-Unique: yMyfHEvmOkGg6aHrSCRomQ-1
X-Mimecast-MFC-AGG-ID: yMyfHEvmOkGg6aHrSCRomQ_1743087347
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DB9321800A37;
	Thu, 27 Mar 2025 14:55:46 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 74E69180B489;
	Thu, 27 Mar 2025 14:55:44 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Subject: [PATCH v2 0/4] drm/panel: Panel Refcounting infrastructure
Date: Thu, 27 Mar 2025 10:55:38 -0400
Message-Id: <20250327-b4-panel-refcounting-v2-0-b5f5ca551f95@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOpm5WcC/22NwQ6CMBBEf4Xs2TWltBo98R+GQ2kX2ERb0mKjI
 fy7lcSbxzeTebNCosiU4FqtEClz4uALyEMFdjJ+JGRXGKSQWjRSYa9wNp7uGGmw4ekX9iMqYXp
 9MqZRwxnKdC4lv3btrSs8cVpCfO8vuf6mP6H+L8w1ClQk+0G7+mK1ayO5ySxHGx7Qbdv2Abw0r
 IS5AAAA
X-Change-ID: 20250324-b4-panel-refcounting-40ab56aa34f7
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743087343; l=1967;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=4QW60f7SKHAtmysfncmp9Yyyq1t/uqG2vo/Wn+5ufts=;
 b=7JD7rZNIXA8Zr3tJszJCa3yRFXZoFZuvPff42v8dNnObu9lcLmGGYb27qyO4znPzxZYw/pyRn
 NmCcjP2DsFJDmnLeAUAR2Bewo1h8X3D4HOnAkRYzOLO7uNlDEpYY2bc
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

This series adds the infrastructure needed for the refcounting
allocations for panels similar to Luca's efforts with bridges.
Underlying intention and idea is the same - avoid use-after-free
situations in panels. Get reference to panel when in use and put
the reference back (down) when not in use.
Once this gets approved, rest of the drivers will have to be
mass converted to use this API.  All the callers of of_drm_find_panel()
will have to be converted too.

Tried to split the patches as suggested in the RFC series[1].
Also fixed the connector used during panel_init to be the one
passed by driver.

Patch 4 was not suggested or part of my initial work. Added it
after looking at the comments Luca's v8 of the bridge series
received.[2]

[1] -> https://patchwork.freedesktop.org/series/146236/
[2] -> https://patchwork.freedesktop.org/series/146306/#rev2

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
Changes in v2:
- Change drm_panel_put() to return void.
- Export drm_panel_get()/put()
- Code cleanups: add missing return documentation, improve documentation
  in commit logs. 
- Link to v1: https://lore.kernel.org/r/20250325-b4-panel-refcounting-v1-0-4e2bf5d19c5d@redhat.com

---
Anusha Srivatsa (4):
      drm/panel: Add new helpers for refcounted panel allocatons
      drm/panel: Add refcount support
      drm/panel: deprecate old-style panel allocation
      drm/panel/panel-simple: Use the new allocation in place of devm_kzalloc()

 drivers/gpu/drm/drm_panel.c          | 92 +++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/panel/panel-simple.c |  9 ++--
 include/drm/drm_panel.h              | 37 +++++++++++++++
 3 files changed, 131 insertions(+), 7 deletions(-)
---
base-commit: c8ba07caaecc622a9922cda49f24790821af8a71
change-id: 20250324-b4-panel-refcounting-40ab56aa34f7

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>

