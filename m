Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497471E2616
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 19:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743190723; cv=none; b=ljNCmDSrP8PxDqnVc+rC9+zCCdXE+Wh9+Bn5AJ8HIiGIeMnKs3HILSLCfowhLYU+25KSxxzafa63twqultlDTL3N5hWmK8syarf/2Ax3gzIMPWWESpil68J+cFbH2ZfOneIZEaN1vizqsV2JYsRX0on2E/PYM1TQwZM3aGSL8QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743190723; c=relaxed/simple;
	bh=lllit0NMMQY/u2TIPZPEii8FutUN6LEKYoD6+HLrsgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=sID1vzJlkGdRwEaJXkYjpzOVgz/K676TSKXkA7kD0SNjw2uzIB6ID7v6hatf+zbW6NRb6Wwhn44ZT8Gnd/XPSfMRuwqOac/JNU59LwsKDA2EH5M08D2TaRvuSP5O/l5dij1LA9nBWPG/ZVJ9LIacYOvmpUKKQd8Cl+K0BXhsVDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hLi39gfI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hLi39gfI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743190719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3dHTI/nP8LMuZ8lpB+l5y9cpis9uyfq0/6jTpKt1DVU=;
	b=hLi39gfIOeVtxs7UA0SCmr7kV1HdsvXjXHfBBQfQe+Hk6FdL78Qo8N+GOsvNuU4JP885qw
	KMpF9ZbsyWF+oGXFBRdeyqIx4QtXa9xH46UB7H/XjX/vPOQACV4VoHDvgK1RHi/2kjAdhJ
	FSN88jSUTWIUiDZusclXY6fAuI6CU9k=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-494-HLhNiB8GM0SPuww9IMEElA-1; Fri,
 28 Mar 2025 15:38:36 -0400
X-MC-Unique: HLhNiB8GM0SPuww9IMEElA-1
X-Mimecast-MFC-AGG-ID: HLhNiB8GM0SPuww9IMEElA_1743190714
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 78D8E196D2D0;
	Fri, 28 Mar 2025 19:38:34 +0000 (UTC)
Received: from jmeneghi-thinkpadp1gen3.rmtusnh.csb (unknown [10.17.17.223])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 84FCF1828AAA;
	Fri, 28 Mar 2025 19:38:32 +0000 (UTC)
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
Subject: [PATCH v3 1/5] nvme: update the multipath warning in nvme_init_ns_head
Date: Fri, 28 Mar 2025 15:38:22 -0400
Message-ID: <20250328193826.356257-2-jmeneghi@redhat.com>
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

The new NVME_MULTIPATH_PARAM config option requires updates
to the warning message in nvme_init_ns_head().

Signed-off-by: John Meneghini <jmeneghi@redhat.com>
Tested-by: John Meneghini <jmeneghi@redhat.com>
---
 drivers/nvme/host/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 870314c52107..b2bd8e1673ac 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -3824,7 +3824,7 @@ static int nvme_init_ns_head(struct nvme_ns *ns, struct nvme_ns_info *info)
 				"Found shared namespace %d, but multipathing not supported.\n",
 				info->nsid);
 			dev_warn_once(ctrl->device,
-				"Support for shared namespaces without CONFIG_NVME_MULTIPATH is deprecated and will be removed in Linux 6.0.\n");
+				"Shared namespace support requires core_nvme.multipath=Y.\n");
 		}
 	}
 
-- 
2.48.1

