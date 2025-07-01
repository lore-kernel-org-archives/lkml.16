Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC52C27EFF1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 17:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751390852; cv=none; b=kQGZIfFVqEH/f/ZtVDem1xlgjzqpib4jErXeUe5utvGeA1gIIKwsXwTlR+9aiyHr53nbHDcsdDjENHeeO2kiCDzGXyVpEH8OWvToXol6++FL/kc3kgzUEiXJVnp7dcnSBFlU5V2G08tNrEdnu2KfRFej8iUJ64uk0iYd3YJFxjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751390852; c=relaxed/simple;
	bh=hCQyShvOpRw5lxwsZbE3F4nxUON5xrMzrTJ6bOYAHTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WbC9vTJOOlYQPIu2R0uDfLJ1TaE2AghtFKY58EyGyNA9Ie10acXungcfYN+ikVG8/O6BIv0sZqviKjOUUcPQPOwel2hRcsFRQUOYAOj7PixnldWCGU683Jq3rnvx3qefqvJOSPEewo6ou+0vdA9pqyBk625lOWxwateDA7YQkXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cNwRxRpR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cNwRxRpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751390849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lLcLNVGFCtTCwwH5Vuz0JRd2+UgjBFKMxo5m9TEWhz8=;
	b=cNwRxRpRrjWI53GWWcq4JicIxgK9pNIF74ZuG3Gc6UikW7UNCf5uWKpLppRRYVWpCss5f7
	YV5Kau3ebLuz0mBGsaaBmFf0yENSnp8LPY7flbyGTkzmZq6Z7TWonZ0ZXRimA0jLEX8hap
	JyOTlXbv7vx3ZgybF+fQRVcsNCdPu/o=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-117-2WSNerf1NXKFNMHmuIUwzA-1; Tue,
 01 Jul 2025 13:27:24 -0400
X-MC-Unique: 2WSNerf1NXKFNMHmuIUwzA-1
X-Mimecast-MFC-AGG-ID: 2WSNerf1NXKFNMHmuIUwzA_1751390843
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DEB8B192E8DB;
	Tue,  1 Jul 2025 17:27:02 +0000 (UTC)
Received: from desnesn-thinkpadp16vgen1.rmtbr.csb (unknown [10.96.134.31])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C67F31956066;
	Tue,  1 Jul 2025 17:27:00 +0000 (UTC)
From: Desnes Nunes <desnesn@redhat.com>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Desnes Nunes <desnesn@redhat.com>,
	stable@kernel.org
Subject: [PATCH v2] media: uvcvideo: avoid variable shadowing in uvc_ctrl_cleanup_fh
Date: Tue,  1 Jul 2025 14:25:56 -0300
Message-ID: <20250701172556.117872-1-desnesn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

This avoids a variable loop shadowing occurring between the local loop
iterating through the uvc_entity's controls and the global one going
through the pending async controls of the file handle

Cc: stable@kernel.org
Fixes: 10acb9101355 ("media: uvcvideo: Increase/decrease the PM counter per IOCTL")
Signed-off-by: Desnes Nunes <desnesn@redhat.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 44b6513c5264..532615d8484b 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -3260,7 +3260,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
 void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
 {
 	struct uvc_entity *entity;
-	int i;
+	unsigned int i;
 
 	guard(mutex)(&handle->chain->ctrl_mutex);
 
@@ -3268,7 +3268,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
 		return;
 
 	list_for_each_entry(entity, &handle->chain->dev->entities, list) {
-		for (unsigned int i = 0; i < entity->ncontrols; ++i) {
+		for (i = 0; i < entity->ncontrols; ++i) {
 			if (entity->controls[i].handle != handle)
 				continue;
 			uvc_ctrl_set_handle(handle, &entity->controls[i], NULL);
-- 
2.49.0

