Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0291E51F0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 19:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743190723; cv=none; b=RWnM2r/quRFJa8r15fTtNTPFLqjkmTzW8FskX1puR7WPIVBJF0kIjanYmPICFzs1ZwmxLJsYlq/ZJsGaU4kmvDxrPpyZOCCn8IvikhwzRVAAiuCl9R3A3Gpz6Cl71urirt3DTH7lpsfEaz5IdvRd42lc5yaP9oEtM74QM2Ur8Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743190723; c=relaxed/simple;
	bh=4/rTMq/46RiBRdHLe/iPEiu7QFHdEoEIGbQiFE4kn/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=ESedt1JZZJ6/3pmRltg5frycdfITiuMQy8EgieBl6B3GX3/ZvCYmkUi1AYyywadsS9qicvBGc1jh4vFfJLaHIo2FtX+5JQO7c+CFMrffQ5NJiGYAqpCyzheb6HbNtMJtMbMB3q65foJp2PnRA0YuDFyeTKXQlVHIT5Yl9uC2wzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PAAVN7fe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PAAVN7fe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743190721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mTopFJvlk34hyUN56gjPiK5ncmjWmYtuhJkCrhP6gA8=;
	b=PAAVN7feWxbT7Xc2aZSUozCLyLxi+BVTGwCFTj5qY7sMEHT8eFmV7qtVf7QU+FqJOLgcYv
	bbhyhHLqNv9s5OgF8eRdBIefyKUAeS8n63VXull87UN5efEy3B0WU18itAYOgkjk6Ku7Q9
	NYN3hgHATZX+NisLoF+bfuC4F13VEGo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-20-S3yrDD4UONOd5OGQtyVauA-1; Fri,
 28 Mar 2025 15:38:39 -0400
X-MC-Unique: S3yrDD4UONOd5OGQtyVauA-1
X-Mimecast-MFC-AGG-ID: S3yrDD4UONOd5OGQtyVauA_1743190718
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AA96A1945103;
	Fri, 28 Mar 2025 19:38:38 +0000 (UTC)
Received: from jmeneghi-thinkpadp1gen3.rmtusnh.csb (unknown [10.17.17.223])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DF2391828A92;
	Fri, 28 Mar 2025 19:38:36 +0000 (UTC)
From: John Meneghini <jmeneghi@redhat.com>
To: kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me
Cc: loberman@redhat.com,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	emilne@redhat.com,
	jmeneghi@redhat.com,
	bgurney@redhat.com
Subject: [PATCH v3 3/5] nvme: add the NVME_ENABLE_MULTIPATH_PARAM config option
Date: Fri, 28 Mar 2025 15:38:24 -0400
Message-ID: <20250328193826.356257-4-jmeneghi@redhat.com>
In-Reply-To: <20250328193826.356257-1-jmeneghi@redhat.com>
References: <20250328193826.356257-1-jmeneghi@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

The CONFIG_NVME_ENABLE_MULTIPATH_PARAM option controls the
core_nvme.multipath parameter. When CONFIG_NVME_ENABLE_MULTIPATH_PARAM=n
the multipath parameter is removed from the kernel and nvme multipathing
is permanently enabled.  When CONFIG_NVME_ENABLE_MULTIPATH_PARAM=y the
nvme multipath parameter is added to the kernel and nvme multipath
support is controlled by the core_nvme.multipath parameter.

By default CONFIG_NVME_ENABLE_MULTIPATH_PARAM=y

Signed-off-by: John Meneghini <jmeneghi@redhat.com>
Tested-by: John Meneghini <jmeneghi@redhat.com>
Reviewed-by: Bryan Gurney <bgurney@redhat.com>
---
 drivers/nvme/host/Kconfig     | 11 +++++++++++
 drivers/nvme/host/multipath.c |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/nvme/host/Kconfig b/drivers/nvme/host/Kconfig
index d47dfa80fb95..8c04b6b93982 100644
--- a/drivers/nvme/host/Kconfig
+++ b/drivers/nvme/host/Kconfig
@@ -28,6 +28,17 @@ config NVME_MULTIPATH
 
 	  If unsure, say Y.
 
+config NVME_ENABLE_MULTIPATH_PARAM
+	bool "NVMe enable multipath param"
+	depends on NVME_CORE && NVME_MULTIPATH
+	default y
+	help
+	  This option enables the core_nvme.multipath parameter.
+	  If this option is disabled the core_nvme.multipath parameter
+	  is excluded from the kernel.
+
+	  If unsure, say Y.
+
 config NVME_VERBOSE_ERRORS
 	bool "NVMe verbose error reporting"
 	depends on NVME_CORE
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 6b12ca80aa27..83084093e8db 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -10,9 +10,11 @@
 #include "nvme.h"
 
 bool multipath = true;
+#ifdef CONFIG_NVME_ENABLE_MULTIPATH_PARAM
 module_param(multipath, bool, 0444);
 MODULE_PARM_DESC(multipath,
 	"turn on native support for multiple controllers per subsystem");
+#endif
 
 static const char *nvme_iopolicy_names[] = {
 	[NVME_IOPOLICY_NUMA]	= "numa",
-- 
2.48.1

