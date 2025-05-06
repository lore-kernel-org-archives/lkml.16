Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAEAA32
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538355; cv=none; b=kIKJx6zEcY4nwPQebJebIt13zHGoi2ZfiQz3qid97wBiQp/pydJIvz/1z4JL518tsbckZGfXenLzORPsO9GDSp7XS+qgxtsDFIzcpJuM3Ve4CgzEcVmk7I6jne05Ya4n3s0xJFewEghjn94S0Praqrc/VM3H+2Nhz1os+98rJOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538355; c=relaxed/simple;
	bh=1+x5nkikxhScLR91mwa64P+TwLT7XM19RWxKcJ+v6I0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=soHHq4+dYJPqxswAS270sVIV+4XvBBzmRKDU6FVoqObKF6mxNDKz1ZSlQ2bWG+Z154yf5IfAGZz5Id9bMdteb/gPZDyOAjftciu2HA9UYl+Qv0tIIFXrt7tEY7rNM2EtUqagKYhJsGnS+Uw+l9eyzXrbf8lPbRA7fpCRaSgJZSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GcVAhLWi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GcVAhLWi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746538352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hGhJOo7q7LPBM1NEYOXtUmOoUQlgNh5Bl4fqyPv9uDw=;
	b=GcVAhLWiJv3BSZ0/64+aqmrbJv2fvW8xbp/Ic/7S3l3glY21KpW7OzLqJeHfysEmMC7KIF
	aoWwW4YlRdroAIiLCZqeGPL47C9G/tsICMw6/3CM3/jjZOuYz+erGSsasK8rPR7IwDtawT
	uI399Ze1iFXjx18sczMzNY1RFu4Ktqs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-Se-yBtjTMzqScIsB_nifFg-1; Tue,
 06 May 2025 09:32:29 -0400
X-MC-Unique: Se-yBtjTMzqScIsB_nifFg-1
X-Mimecast-MFC-AGG-ID: Se-yBtjTMzqScIsB_nifFg_1746538347
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 60F391800985;
	Tue,  6 May 2025 13:32:27 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.226.157])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A1C4B1800352;
	Tue,  6 May 2025 13:32:23 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH] MAINTAINERS: Add entries for drm_panic, drm_panic_qr_code and drm_log
Date: Tue,  6 May 2025 15:29:43 +0200
Message-ID: <20250506133143.156447-1-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Add myself and Javier as maintainer for drm_panic, drm_panic_qr_code
and drm_log.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 MAINTAINERS | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 38df6b159a3b..df3abdcf1767 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8177,6 +8177,34 @@ F:	drivers/gpu/drm/drm_panel.c
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
+DRM LOG
+M:	Jocelyn Falempe <jfalempe@redhat.com>
+M:	Javier Martinez Canillas <javierm@redhat.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/clients/drm_log.c
+
 DRM PRIVACY-SCREEN CLASS
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	dri-devel@lists.freedesktop.org

base-commit: 258aebf100540d36aba910f545d4d5ddf4ecaf0b
-- 
2.49.0

