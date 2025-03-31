Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCE42147F6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743437822; cv=none; b=frNm54X6d5i/gMWHbyNu41h3G9P7QSQ2Ioh5pt/baBJ3EHxBEB9aXDXpjDNFCtc+Y1MSvR56a4N+alxGw9raEjJFw8p+MC9G9Mgb3TGpnGNl8goM0M0g0OK5jVh7doeAx5bmkpfrpY/kQlCK80CSOKVIKJrI7VfY94B09uo8pMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743437822; c=relaxed/simple;
	bh=MRdcYUkF4Pe4Wr0aSbQoo3p6MhneDKW8+5FisJSdyXo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OwKpZZASOytw2EoflIcBhBd9aPonV6o0FPheX6H82RRyTPytpF9+NFRSZ0a8RL9it03H2rIhlbVksxKL/R2dyPWhRS/aNEAwxIf4WdJTTxFROeI4hzo6mURQjoPfQmIUz9NH5ZLcYcJd+MfSY76/Q0vSlhzUyOQZwi7B7xUoMVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NoYmZDMO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NoYmZDMO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743437819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qNIFuWAVVY5MdpvZ+wT0vBuHY2Nn/EWRcs2vVYB5g6k=;
	b=NoYmZDMOFbrg7icDWJY1GTizM6zOas7fUoulb299pKwTB1tDiT9Fn6mdRopgnXvTmzLmrW
	47HL1GEIAXGl9wT2K7SZwxh44kjqCwHtRYH7vDbiyweoTJFOmMNSCi/MZ3c6YzQTdt6xjr
	cniSvfE0gQT9l1PvI9+Be6AR+Cb1Xw4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-643-WUxdeIj8Pi69WALUlgP4Pg-1; Mon,
 31 Mar 2025 12:16:56 -0400
X-MC-Unique: WUxdeIj8Pi69WALUlgP4Pg-1
X-Mimecast-MFC-AGG-ID: WUxdeIj8Pi69WALUlgP4Pg_1743437814
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 51BFD180AB16;
	Mon, 31 Mar 2025 16:16:54 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 102A419560AD;
	Mon, 31 Mar 2025 16:16:51 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Subject: [PATCH v4 0/4] drm/panel: Panel Refcounting infrastructure
Date: Mon, 31 Mar 2025 11:15:24 -0400
Message-Id: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIyx6mcC/3XNSwrCMBCA4atI1kbymFHqynuIizwmNqBpSWtRp
 Hc3FoSKdvnPMN88WUc5Usf2qyfLNMQuNqkErFfM1SadiUdfmimhUGgF3AJvTaILzxRcc0t9TGc
 OwljcGqMh7Fg5bcsy3if2eCpdx65v8mP6Msj39APif3CQXHAgZQN6WTn0h0y+Nv3GNVf2Fgc1V
 3YLiiqKxYDOIMpQ4Y+iZ4oWC4ouiiDhgWALkuyXMo7jCwLvwWVFAQAA
X-Change-ID: 20250324-b4-panel-refcounting-40ab56aa34f7
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743434129; l=2504;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=MRdcYUkF4Pe4Wr0aSbQoo3p6MhneDKW8+5FisJSdyXo=;
 b=pUAnnm/mVOXK5jpk0gamctKrxamaXOg3KZpcdfYaGn9OWz3cfTNND+8HRYUKKjkMTAc9PaTwQ
 LUmfh+Sk5GJCeaoQS7r/jqFc3d8BEEKtjJdz26WV4b82wu5NEaL/Q3o
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

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
Changes in v4:
- Move refcounting documentation from Patch 1 to Patch 2 
- Link to v3: https://lore.kernel.org/r/20250330-b4-panel-refcounting-v3-0-0e0d4e4641eb@redhat.com

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
 include/drm/drm_panel.h              | 41 ++++++++++++++++
 3 files changed, 135 insertions(+), 7 deletions(-)
---
base-commit: 372a9ca3c1f2ea10dd05a5d5008d055bc9536ced
change-id: 20250324-b4-panel-refcounting-40ab56aa34f7

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>

