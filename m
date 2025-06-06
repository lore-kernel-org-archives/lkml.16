Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DC928850C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 11:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749210629; cv=none; b=ML5wLa1NLn34/zc69HWXMKmoPSsZEJxrjHTSo6YoFsRXoYAjD0rc5BLPg2GLdQ2mX5YonJXHg3YsqkENdvyZSgiQ01L0ZRUL6FDMNRpSBSa5NhXYT72dhc3uBY7z7XsrmLzOTvvcUi0bT5yz1uPqZhuaB0UEAxhmV87OTWzil4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749210629; c=relaxed/simple;
	bh=SyMEBMqoEegjVXM0Ur3SwKjQpuKBaC3i+d9aIcIqW2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WpuW7AbLNx+xPRJ7oqzlVqrlMWtFkzGHuDN55jUAq3Nu9/l8guZ/w2syORa4JhX/p/BBc09OE6oR0VGP9fITVoRg3d/z9vuDcSeMlQ7c3KSWpdBfkXG5uyuCn8DJUbpofJmRq3NtFCWOCoMY2BlfjGDbfI3Zn52LK98aSKwqv4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wh3iZs6x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wh3iZs6x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749210627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vp49S0VL4Jqz0gpimx8bGKhznGhVA0Kv/wGqwICbM2I=;
	b=Wh3iZs6xnTB+r5aDObmceeYQ7N8tHF4yIziILNcnn+GG1eQGfdGuw0aG84MnO+arh/0SuC
	289Keg0O7XqBEGRLA0kUoCD2CXMOMfOXlf/146qqXVvg4MsgAUUeN5cGDpcRC7/hUTZ07K
	DIpLklmaeVA5wZEzALA9ntdfFC2PGDY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-458-uKZZJwjONfurVKoo1DdWMw-1; Fri,
 06 Jun 2025 07:50:24 -0400
X-MC-Unique: uKZZJwjONfurVKoo1DdWMw-1
X-Mimecast-MFC-AGG-ID: uKZZJwjONfurVKoo1DdWMw_1749210623
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 80F1019560B4;
	Fri,  6 Jun 2025 11:50:23 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.33.72])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 981FA19560B2;
	Fri,  6 Jun 2025 11:50:18 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: jasowang@redhat.com
Cc: Yongji Xie <xieyongji@bytedance.com>,
	Cindy Lu <lulu@redhat.com>,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Maxime Coquelin <mcoqueli@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	virtualization@lists.linux.dev,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [RFC 1/6] vduse: add v1 API definition
Date: Fri,  6 Jun 2025 13:50:07 +0200
Message-ID: <20250606115012.1331551-2-eperezma@redhat.com>
In-Reply-To: <20250606115012.1331551-1-eperezma@redhat.com>
References: <20250606115012.1331551-1-eperezma@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

This allows to define all functions checking the API version set by the
userland device.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/uapi/linux/vduse.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/uapi/linux/vduse.h b/include/uapi/linux/vduse.h
index 68a627d04afa..9a56d0416bfe 100644
--- a/include/uapi/linux/vduse.h
+++ b/include/uapi/linux/vduse.h
@@ -10,6 +10,10 @@
 
 #define VDUSE_API_VERSION	0
 
+/* VQ groups and ASID support */
+
+#define VDUSE_API_VERSION_1	1
+
 /*
  * Get the version of VDUSE API that kernel supported (VDUSE_API_VERSION).
  * This is used for future extension.
-- 
2.49.0

