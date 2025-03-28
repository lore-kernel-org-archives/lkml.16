Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161C41E51EA
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 19:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743190723; cv=none; b=AFv9xd9DnqABaFpfEfhD5kxXUJjOPRyFrh2nRY44NbWWnb7AfBY5OndXgmQhZus8TM0KMJW823ckVp5e4Zj9yjLC2CQp4sLA4I3chPiYn6imH3acbY1rLgg1XYAMb831A2kkOfQqwOnt2BDyBHoSxfgahhawh1PY+MKm/7tVcms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743190723; c=relaxed/simple;
	bh=OhhVGWpcSFG4gipijq1AzZCC0xlnH6g6N0gsuYd0QGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=QgeOWoJ1cb+D+LanBeIDb9ZDulnYg+428oNOOSIi32j9lAbWUwWghXWbNuBkTYW+gv8J/+XIbHMIIFqIoEiVOcYyjAlgDrMDtpYEi8iwmhmhq1t4KYJkXjSwc3JjgibV2mcsTnwS23gwhOtgCeRVCwyuYctYy7F1/9qGgoLcUxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VPxa0TlJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VPxa0TlJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743190720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=625UNCZM4QGRK3cVKqtvQTiUqdD7+p90TqpeI7OzcGs=;
	b=VPxa0TlJafzuAFohe2BlFemZ9MGZqZcMiCiUj7fs3WohNwXxujs7PzY8R0DyWAtpCmClEw
	uk2wJ/ABIY8byVhJAD+fimPhBP8ulQJVRbB/tY6IEMIrs5yLC916ckbu0o08D0pg6rGg6v
	yVxDwWuFrax3CBi8dYB4nvpgNpb7JbQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-f6kqXyQSP8K0U4574qwa6w-1; Fri,
 28 Mar 2025 15:38:37 -0400
X-MC-Unique: f6kqXyQSP8K0U4574qwa6w-1
X-Mimecast-MFC-AGG-ID: f6kqXyQSP8K0U4574qwa6w_1743190716
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 983F0180AF52;
	Fri, 28 Mar 2025 19:38:36 +0000 (UTC)
Received: from jmeneghi-thinkpadp1gen3.rmtusnh.csb (unknown [10.17.17.223])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C06781828A92;
	Fri, 28 Mar 2025 19:38:34 +0000 (UTC)
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
Subject: [PATCH v3 2/5] nvme: change the NVME_MULTIPATH config option description
Date: Fri, 28 Mar 2025 15:38:23 -0400
Message-ID: <20250328193826.356257-3-jmeneghi@redhat.com>
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

Fix up the NVME_MULTIPATH config description so that
it accurately describes what it does.

Signed-off-by: John Meneghini <jmeneghi@redhat.com>
Tested-by: John Meneghini <jmeneghi@redhat.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/Kconfig | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/nvme/host/Kconfig b/drivers/nvme/host/Kconfig
index 10e453b2436e..d47dfa80fb95 100644
--- a/drivers/nvme/host/Kconfig
+++ b/drivers/nvme/host/Kconfig
@@ -18,10 +18,15 @@ config NVME_MULTIPATH
 	bool "NVMe multipath support"
 	depends on NVME_CORE
 	help
-	   This option enables support for multipath access to NVMe
-	   subsystems.  If this option is enabled only a single
-	   /dev/nvmeXnY device will show up for each NVMe namespace,
-	   even if it is accessible through multiple controllers.
+	  This option controls support for multipath access to NVMe
+	  subsystems. If this option is enabled support for NVMe multipath
+	  access is included in the kernel. If this option is disabled support
+	  for NVMe multipath access is excluded from the kernel. When this
+	  option is disabled each controller/namespace receives its
+	  own /dev/nvmeXnY device entry and NVMe multipath access is
+	  not supported.
+
+	  If unsure, say Y.
 
 config NVME_VERBOSE_ERRORS
 	bool "NVMe verbose error reporting"
-- 
2.48.1

