Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA868F9CB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 03:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743391549; cv=none; b=U1rH2znDlHJeWoSZN7trlngoTRaQAjRKcmowB2I+ZT6WI2kIZIh83dY1kM6QMj1Np0akFuFqZI0vdqUMHAa1UZSRvggvJrIKZv4HlkTEIo99Uft52muxYH2IgQ8w28Bfc8sQNx2yC9Ix3V2wZto7293ykTIIyBSB9xdObwH5ylk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743391549; c=relaxed/simple;
	bh=/AWc+ap+/VlwCnxyDD+hThYJBzd/9ydDfXQ7wQ294vA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IO1uHnyJgxJH9Fmf5lfSXxemd24FB2Ci0ltX+bb4lG2D/UeTxbF8ES6Y4I8IOQ9ExeHBN54aR6Vec8WjGZyL6cEhLb9VPx+CFy/ukn/kzX++01CcvnTsG4KRcw+c0oXxKxCYfjpaFOuSVfvSJtisrUfGb7ZY/uA3pooPYD6iBEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Db4egIFk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Db4egIFk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743391546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9H7GiXM1SYgn+J7AZH1DVhthFc+DqcJXbubfnJ6db+o=;
	b=Db4egIFkfZTLqb7+m2uZCuso0FkEBgc9bP98y01xkt/YquaJ3y69xR1/e8wTHBczVVZZ49
	0KHqsDO1mDP4OvtDi3c3G4neV4pXocnVwI0MsAJGlQUSO//uaOBk/obzEFkhJMXrwa/QII
	XmhymPrB/P1H3yG10faDXSv2QDGVCwM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-6-Z3zqrOq2O_mLCzAbl7tmug-1; Sun,
 30 Mar 2025 23:25:43 -0400
X-MC-Unique: Z3zqrOq2O_mLCzAbl7tmug-1
X-Mimecast-MFC-AGG-ID: Z3zqrOq2O_mLCzAbl7tmug_1743391541
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4C6E11801A06;
	Mon, 31 Mar 2025 03:25:41 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 525DF1801752;
	Mon, 31 Mar 2025 03:25:38 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Subject: [PATCH v3 0/4] drm/panel: Panel Refcounting infrastructure
Date: Sun, 30 Mar 2025 22:24:11 -0400
Message-Id: <20250330-b4-panel-refcounting-v3-0-0e0d4e4641eb@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMv86WcC/3XNSwrCMBCA4auUrI2kacZSV95DXOQxaQOalKQGp
 fTupgVBQZf/DPPNTBJGh4kcq5lEzC654Es0u4roQfoeqTOlCWccWMMFVYKO0uOVRrQ63P3kfE8
 FkwoOUjbCtqScjmXpHht7vpQeXJpCfG5fcr1O3yD8BnNNGRXIlQVTdxrMKaIZ5LTX4UZWMfNPp
 f2j8KIosKAlQG07+FKWZXkBaMAmOP8AAAA=
X-Change-ID: 20250324-b4-panel-refcounting-40ab56aa34f7
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743387855; l=2326;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=/AWc+ap+/VlwCnxyDD+hThYJBzd/9ydDfXQ7wQ294vA=;
 b=g8ObQcleCQMWGAeFaD7vB8+1P3Z5Dfgqb4o1QVwuj1SaFZu7OkBrwcASeYZAKUmGlYpx2ZWcn
 Mj+3IStQxYUD4N+QnaLI+2F2rIDQ7ejdgPVj6pPUsqErKK6gNqFmIVF
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

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
Changes in v3:
- Move the include from patch 1 to patch 2 where it is actually used
- Move the refcounting documentation out from the returns section to the
  actual helper socumentation.
- Code style changes. Move the version changes after the s-o-b.
- Link to v2: https://lore.kernel.org/r/20250327-b4-panel-refcounting-v2-0-b5f5ca551f95@redhat.com

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
 include/drm/drm_panel.h              | 39 +++++++++++++++
 3 files changed, 133 insertions(+), 7 deletions(-)
---
base-commit: 372a9ca3c1f2ea10dd05a5d5008d055bc9536ced
change-id: 20250324-b4-panel-refcounting-40ab56aa34f7

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>

