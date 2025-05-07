Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72740221288
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604548; cv=none; b=qyDzRttdsQbEi9GxwTWxZX3a+ZP7f4Q2dtF4KoLpzprbPrStQtCerYMJZ92OLkO4bbsI1TBvr0D1SC17PsBh4bO3n/w3/ejHrf7vekuYp7AmIEZhh8JDtN8d4TxpLYSz/6UYAmzbfJ5i+BVnGvmQAgrxuxuXKdRO7DwrZMCkzrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604548; c=relaxed/simple;
	bh=nUCozoVC1hnj5B0vNnvL5jlbAz4pGVeFMzC5DNJMI9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L4E7u6yl+JeWNM3vsg2xWpl8iM/x5KNJl/EAZCHS1LsxsZkAvR8285+B8HpcjyEFLDoBCDJLxVq2+dQIqMHhxjEU7RYbNugnNByN0W/JDP+Sat/bDEy6dq6EWUU9OVN3u5ltHWod8DY602F6ZBuxtKQyT/HZ5MLGtIOqbG2bqUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hhhWy9pX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hhhWy9pX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746604545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JQX/5m+jQ3v0Hngdb0F2esP3jDYn3gk1n+QUBzrPG4A=;
	b=hhhWy9pXmeOopmi3LGm+mx3o2QZ+Mh6/EklPwsX5cIJbB+pQ+SOXEQiBXdhti/QkPsdaXR
	mfIBIJ4535ChCgRxLbGZhrWmTGn15OkPj2tVbrVviZVS/6j5EJnFGQ0j2h7g8q/hNlYYWZ
	XqYMXPsL2kckGS2ufLLruacSWV10qW8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-283-TxKFw1hAPPmQqrYRWraNSg-1; Wed,
 07 May 2025 03:55:42 -0400
X-MC-Unique: TxKFw1hAPPmQqrYRWraNSg-1
X-Mimecast-MFC-AGG-ID: TxKFw1hAPPmQqrYRWraNSg_1746604540
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 043D51800370;
	Wed,  7 May 2025 07:55:40 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.226.157])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A04531953B82;
	Wed,  7 May 2025 07:55:35 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	jani.nikula@linux.intel.com,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v2] MAINTAINERS: Add entries for drm_panic, drm_panic_qr_code and drm_log
Date: Wed,  7 May 2025 09:51:47 +0200
Message-ID: <20250507075529.263355-1-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Add myself and Javier as maintainer for drm_panic, drm_panic_qr_code
and drm_log.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
---

v2:
 * move DRM LOG to keep the entries sorted (Jani Nikula)
 
 MAINTAINERS | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 38df6b159a3b..1ecb04e0ddfd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8166,6 +8166,14 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/scheduler/
 F:	include/drm/gpu_scheduler.h
 
+DRM LOG
+M:	Jocelyn Falempe <jfalempe@redhat.com>
+M:	Javier Martinez Canillas <javierm@redhat.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/clients/drm_log.c
+
 DRM PANEL DRIVERS
 M:	Neil Armstrong <neil.armstrong@linaro.org>
 R:	Jessica Zhang <quic_jesszhan@quicinc.com>
@@ -8177,6 +8185,26 @@ F:	drivers/gpu/drm/drm_panel.c
 F:	drivers/gpu/drm/panel/
 F:	include/drm/drm_panel.h
 
+DRM PANIC
+M:	Jocelyn Falempe <jfalempe@redhat.com>
+M:	Javier Martinez Canillas <javierm@redhat.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/drm_draw.c
+F:	drivers/gpu/drm/drm_draw_internal.h
+F:	drivers/gpu/drm/drm_panic*.c
+F:	include/drm/drm_panic*
+
+DRM PANIC QR CODE
+M:	Jocelyn Falempe <jfalempe@redhat.com>
+M:	Javier Martinez Canillas <javierm@redhat.com>
+L:	dri-devel@lists.freedesktop.org
+L:	rust-for-linux@vger.kernel.org
+S:	Supported
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/drm_panic_qr.rs
+
 DRM PRIVACY-SCREEN CLASS
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	dri-devel@lists.freedesktop.org

base-commit: 258aebf100540d36aba910f545d4d5ddf4ecaf0b
-- 
2.49.0

