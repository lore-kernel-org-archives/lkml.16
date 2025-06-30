Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0314D28C013
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751295741; cv=none; b=AoOzSjkg+K7qcjLPgF3wRywRy1kgyagyKQ92DxpNBZ1eWX1YpVFu8oPMNIxLchP3px+uzC18yJ41TD4+AJUZdudf+GbS6P341KvmdiUG6a+vr2f/dIAm0k6+J34J6oImpJcjSBulBEef99tsY7UoS8LGlu/KXxER6u/nohdKCrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751295741; c=relaxed/simple;
	bh=CoeKecybjrCzdcmHMtsPZATjj/29WnTxZO6CcBjFoSo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LkqHCC0C63Y1XLPj3PLCgjq5rc6WScSsErRGlvxae4GobxNl2q1Ma81mFDj2nQA1v/3miPAI45GrgpNFVUgAfd++7hcpsYKFZmVGnpMQWtn3xj5Tk5zxA/Zw3fPjJjE3rHXI7WBdbBh7iClWKaqKZ0pDtrj3/LsTFadJ8h0z1nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A0Epifz+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A0Epifz+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751295737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SqxjSFXYb2YZgyXnZn9uF3wsVkTKwLCeC7GkQeDHF7k=;
	b=A0Epifz++CHyT5lComtAacIxBXssu/cL+AalgtegaTSNjdvsZ65nbzXhidCzX90TfnVKhZ
	cf6k8yyxl1I1itGFZ3E8KjMT4yyAA238R9VMQ66O7kIMeFmxzRthvXlpqspUYhKKd0u4im
	2FxVdyhyslehYP81TDj/6ODNBaGRpW0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-336-lr-bNMVFMeCiUV4pVd9Xlw-1; Mon,
 30 Jun 2025 11:02:15 -0400
X-MC-Unique: lr-bNMVFMeCiUV4pVd9Xlw-1
X-Mimecast-MFC-AGG-ID: lr-bNMVFMeCiUV4pVd9Xlw_1751295731
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 89F001809C8C;
	Mon, 30 Jun 2025 15:02:11 +0000 (UTC)
Received: from desnesn-thinkpadp16vgen1.rmtbr.csb (unknown [10.96.134.103])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 72880180045C;
	Mon, 30 Jun 2025 15:02:09 +0000 (UTC)
From: Desnes Nunes <desnesn@redhat.com>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Desnes Nunes <desnesn@redhat.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: uvcvideo: fix build error in uvc_ctrl_cleanup_fh
Date: Mon, 30 Jun 2025 12:01:06 -0300
Message-ID: <20250630150107.23421-1-desnesn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

This fixes the following compilation failure: "error: ‘for’ loop
initial declarations are only allowed in C99 or C11 mode"

Cc: stable@vger.kernel.org
Fixes: 221cd51efe45 ("media: uvcvideo: Remove dangling pointers")
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

