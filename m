Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D7D1E2616
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 19:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743190728; cv=none; b=qRLij33gt24T97Obzbtx70EasGKTr8WBlHCI1+2bA03EPz/nyEIRj5JuJ+6RbtOJc80BllCLUhXcCIDrJwLGgVlW4FRT8TglPooiplHqDwZ3UZOB8zGUPd4TmbtMmtczREt2OPLaYwQIaLhZFBNgh1yoWuPNsHYA2bLOPanYpbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743190728; c=relaxed/simple;
	bh=advCYPhphPcvvwMPQE3cvi+6C0U5Q0W+rUNLSBuue7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=GPd07VUD62P/dgQqe87jrMSwj++L6cvm05hVNaiQOHs4K+HOWSfZkPgzpz5zxsLV78nvflfTJ5Zk92W+HnlgJlK7guELW0eITgtRX4cjLrpUqyGForRckxjc9bIZt1Q7ADsnTUT+z1r/d56I3Za9U1ht0njTV2RmyL1tlmgralw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dItCEMub; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dItCEMub"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743190725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ordwZdOD6eoKaKm56NyG4R5Cz/wGSJSQBSEaXU1EgwE=;
	b=dItCEMubTQvRuR8GzqYP7xCyZwCwaufRrmT1ZW6/sKi0+H1ltbFe8KAgX5cxoZ20P+LEoy
	we/5RewyZG48ZzQz8q4NuZMAnHBPApXN5auY/prhDbobbc+IdF9agADqTt47ZYJmm5eepl
	CWEOmQUlGSpaO7uuY7A2r5VFZOwQd0E=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-635-KzEFURfYPiK_LTWWhYBp9A-1; Fri,
 28 Mar 2025 15:38:42 -0400
X-MC-Unique: KzEFURfYPiK_LTWWhYBp9A-1
X-Mimecast-MFC-AGG-ID: KzEFURfYPiK_LTWWhYBp9A_1743190721
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E0FCD180025F;
	Fri, 28 Mar 2025 19:38:40 +0000 (UTC)
Received: from jmeneghi-thinkpadp1gen3.rmtusnh.csb (unknown [10.17.17.223])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EF3F11828A92;
	Fri, 28 Mar 2025 19:38:38 +0000 (UTC)
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
Subject: [PATCH v3 4/5] nvme: add NVME_ENABLE_MULTIPATH_PARAM for loongarch
Date: Fri, 28 Mar 2025 15:38:25 -0400
Message-ID: <20250328193826.356257-5-jmeneghi@redhat.com>
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

The add the new CONFIG_NVME_ENABLE_MULTIPATH_PARAM to ensure there is no
change in behavior when CONFIG_NVME_MULTIPATH is true with loongson3
configs.

Signed-off-by: John Meneghini <jmeneghi@redhat.com>
---
 arch/loongarch/configs/loongson3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index 73c77500ac46..1ba9ef835fd4 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -449,6 +449,7 @@ CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_RBD=m
 CONFIG_BLK_DEV_NVME=y
 CONFIG_NVME_MULTIPATH=y
+CONFIG_NVME_ENABLE_MULTIPATH_PARAM=y
 CONFIG_NVME_RDMA=m
 CONFIG_NVME_FC=m
 CONFIG_NVME_TCP=m
-- 
2.48.1

