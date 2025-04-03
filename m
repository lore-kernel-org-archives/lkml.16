Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6F22E62CC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715339; cv=none; b=D/KE35s0heZ7Fp8O80Ummmp5sRgXgMvIDYRj6eNJw8jK8eZTd5T/R78BJXyETmheqU5IVGWDFSgn+nM116AJ6u5oWjoR5KqczzKUFrrZSWFAEKNeWYVi3jtbvsoMhrg4om9AJoBUscXj63h3CAuRceZdV+6O5GqpVcbtWnoUCzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715339; c=relaxed/simple;
	bh=nxbBRT12ubPCcHcWn8jhwg78oXqHGUafBZsXBBfh6kg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TWvIyHxcs/skh9KXVUY1mfU8DM3eahp1og47Lzo5M5bR08aLlomKvgmPl0TjqKKkceSg7HTQr+Cp2bOOfEPT0UWYFFWFaU1xLHwXo6vi4+y/TvenTJA+D83C8ZXunqd6kGlfImnwPbio0aHXWswGxADVlUJ3cfe7RfyTVTu0Q5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dPs3A9jG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dPs3A9jG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743715336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GacLvy8XG7EQzge/BxtwwoZsqHixK0lg5XLF2bgVpLo=;
	b=dPs3A9jGNHs/3RVlhPmiPfaEW1WzsKC2l28GwvoBl+FdHqIOb51Ib2nnR6XXi2nrYJInhV
	jPfBNxh8fk2AuPFyXQsPBbPDmxVWrYwqQG1a+HZB7gwMGDYTxslnsiqq5Rm1dHMK+eYoh3
	8N88Eaw2VrHpJG+5eerHbf+wjoHi/Xs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-184-NXTo1sdFMM22tnS8OcH8qQ-1; Thu,
 03 Apr 2025 17:22:13 -0400
X-MC-Unique: NXTo1sdFMM22tnS8OcH8qQ-1
X-Mimecast-MFC-AGG-ID: NXTo1sdFMM22tnS8OcH8qQ_1743715330
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 98AB3195608B;
	Thu,  3 Apr 2025 21:22:08 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 55A67180B488;
	Thu,  3 Apr 2025 21:22:02 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Subject: [PATCH 00/46] drm/panel: Use refcounted allocation in place of
 devm_kzalloc() - Part3
Date: Thu, 03 Apr 2025 16:20:31 -0400
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-0-965b15ad5b8e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJDt7mcC/x2N0QqDMAxFf0XyvEIXneB+ZYzS2jgDs0oiIoj/b
 vDpcDhw7wFKwqTwrg4Q2lh5LibPRwX9GMuPHGdzQI8v33h0qXFZprDEQv8wRdWQhTeS0M/FsFq
 RtXZd8m0aulwnRLCxRWjg/T76fM/zAtFTY7F4AAAA
X-Change-ID: 20250402-b4-drm_panel_mass_driver_convert_part3-9b06bf9d3b22
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Chiras <robert.chiras@nxp.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Artur Weber <aweber.kernel@gmail.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=7866;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=nxbBRT12ubPCcHcWn8jhwg78oXqHGUafBZsXBBfh6kg=;
 b=QieW5IYj2Obi8ErfKmWqkEEJb/5FXPpSoa2rcn1CTryL957tTqhd0EEaWKbEHxf52GrJOFA1Y
 G8gFhpEn3TvDElQYd6czlZVSXTHrpy2wQ1Ho4h0uMzkgCtYLGOS8jhx
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Start converting drivers to use the API - devm_drm_panel_alloc().

Final set of drivers.

Part 1 of the conversion : https://patchwork.freedesktop.org/series/147082/
Part 2 of the conversion : https://patchwork.freedesktop.org/series/147157/

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
Anusha Srivatsa (46):
      panel/orisetech-otm8009a: Use refcounted allocation in place of devm_kzalloc()
      panel/raydium-rm67191: Use refcounted allocation in place of devm_kzalloc()
      panel/raydium-rm67200: Use refcounted allocation in place of devm_kzalloc()
      panel/raydium-rm68200: Use refcounted allocation in place of devm_kzalloc()
      panel/raydium-rm692e5: Use refcounted allocation in place of devm_kzalloc()
      panel/raydium-rm69380: Use refcounted allocation in place of devm_kzalloc()
      panel/ronbo-rb070d30: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-ams581vf01: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-ams639rq08: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-atna33xc20: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-db7430: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-ld9040: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-s6d16d0: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-s6d27a1: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-s6d7aa0: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-s6e3fa7: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-s6e3ha2: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-s6e3ha8: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-s6e63j0x03: Use refcounted allocation in place of devm_kzalloc()
      panel/s6e88a0-ams427ap24: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-s6e8aa0: Use refcounted allocation in place of devm_kzalloc()
      panel/samsung-sofef00: Use refcounted allocation in place of devm_kzalloc()
      panel/seiko-43wvf1g: Use refcounted allocation in place of devm_kzalloc()
      panel/sharp-ls037v7dw01: Use refcounted allocation in place of devm_kzalloc()
      panel/sharp-ls060t1sx01: Use refcounted allocation in place of devm_kzalloc()
      panel/sitronix-st7701: Use refcounted allocation in place of devm_kzalloc()
      panel/sitronix-st7703: Use refcounted allocation in place of devm_kzalloc()
      panel/sitronix-st7789v: Use refcounted allocation in place of devm_kzalloc()
      panel/sony-acx565akm: Use refcounted allocation in place of devm_kzalloc()
      panel/sony-td4353-jdi: Use refcounted allocation in place of devm_kzalloc()
      panel/truly-nt35521: Use refcounted allocation in place of devm_kzalloc()
      panel/panel-summit: Use refcounted allocation in place of devm_kzalloc()
      panel/synaptics-r63353: allocation in place of devm_kzalloc()
      panel/tpo-td028ttec1: Use refcounted allocation in place of devm_kzalloc()
      panel/tpo-td043mtea1: Use refcounted allocation in place of devm_kzalloc()
      panel/tpo-tpg110: Use refcounted allocation in place of devm_kzalloc()
      panel/visionox-r66451: Use refcounted allocation in place of devm_kzalloc()
      panel/visionox-rm69299: Use refcounted allocation in place of devm_kzalloc()
      panel/visionox-rm692e5.c: Use refcounted allocation in place of devm_kzalloc()
      panel/visionox-vtdr6130: Use refcounted allocation in place of devm_kzalloc()
      panel/widechips-ws2401: Use refcounted allocation in place of devm_kzalloc()
      panel/xinpeng-xpp055c272: Use refcounted allocation in place of devm_kzalloc()
      panel/s6e88a0-ams452ef01: Use refcounted allocation in place of devm_kzalloc()
      panel/nec-nl8048hl11: Use refcounted allocation in place of devm_kzalloc()
      panel/panel-lvds: Use refcounted allocation in place of devm_kzalloc()
      panel/lg-lb035q02: Use refcounted allocation in place of devm_kzalloc()

 drivers/gpu/drm/panel/panel-lg-lb035q02.c                | 10 ++++------
 drivers/gpu/drm/panel/panel-lvds.c                       | 12 +++++-------
 drivers/gpu/drm/panel/panel-nec-nl8048hl11.c             | 10 ++++------
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c         | 11 +++++------
 drivers/gpu/drm/panel/panel-raydium-rm67191.c            | 10 +++++-----
 drivers/gpu/drm/panel/panel-raydium-rm67200.c            | 11 +++++------
 drivers/gpu/drm/panel/panel-raydium-rm68200.c            | 11 +++++------
 drivers/gpu/drm/panel/panel-raydium-rm692e5.c            | 10 +++++-----
 drivers/gpu/drm/panel/panel-raydium-rm69380.c            | 10 +++++-----
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c             | 11 +++++------
 drivers/gpu/drm/panel/panel-samsung-ams581vf01.c         | 10 +++++-----
 drivers/gpu/drm/panel/panel-samsung-ams639rq08.c         | 10 +++++-----
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c         | 11 ++++++-----
 drivers/gpu/drm/panel/panel-samsung-db7430.c             | 11 +++++------
 drivers/gpu/drm/panel/panel-samsung-ld9040.c             | 11 +++++------
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c            | 11 +++++------
 drivers/gpu/drm/panel/panel-samsung-s6d27a1.c            | 11 +++++------
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c            | 10 +++++-----
 drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c            | 10 +++++-----
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c            | 10 +++++-----
 drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c            | 10 +++++-----
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c         | 10 +++++-----
 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c | 10 +++++-----
 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c | 11 +++++------
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c            | 10 +++++-----
 drivers/gpu/drm/panel/panel-samsung-sofef00.c            | 11 +++++------
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c              | 11 +++++------
 drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c          | 10 ++++------
 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c          | 11 +++++------
 drivers/gpu/drm/panel/panel-sitronix-st7701.c            |  8 ++++----
 drivers/gpu/drm/panel/panel-sitronix-st7703.c            | 11 +++++------
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c           | 10 ++++------
 drivers/gpu/drm/panel/panel-sony-acx565akm.c             | 10 ++++------
 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c            | 11 +++++------
 drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c   | 11 +++++------
 drivers/gpu/drm/panel/panel-summit.c                     | 10 +++++-----
 drivers/gpu/drm/panel/panel-synaptics-r63353.c           | 11 +++++------
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c             | 11 +++++------
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c             | 10 ++++------
 drivers/gpu/drm/panel/panel-tpo-tpg110.c                 | 11 +++++------
 drivers/gpu/drm/panel/panel-visionox-r66451.c            |  9 +++++----
 drivers/gpu/drm/panel/panel-visionox-rm69299.c           | 10 +++++-----
 drivers/gpu/drm/panel/panel-visionox-rm692e5.c           | 10 +++++-----
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c          | 11 +++++------
 drivers/gpu/drm/panel/panel-widechips-ws2401.c           | 11 +++++------
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c         | 10 ++++------
 46 files changed, 223 insertions(+), 257 deletions(-)
---
base-commit: de04bb0089a96cc00d13b12cbf66a088befe3057
change-id: 20250402-b4-drm_panel_mass_driver_convert_part3-9b06bf9d3b22

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>

