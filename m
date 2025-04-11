Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842AF1519A1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 19:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744400542; cv=none; b=OaqCtREzs40saYZd5yv9wEN292W84UGOzHWgvujIhGNKH/3bl8bF501CkMQz48oZpnP6nLBie9XkP7aCX3KSaQgWeIdNuBFbEO7epPokEJ8uBWh9pJ7MQFiARUODCwHMlaNHpQkF8tnXB4vgzcYjJukG4gTBE0p4nhRJKk1TOeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744400542; c=relaxed/simple;
	bh=Zm4eBLztnRMQWuE+Eq4LeGF+5ABhujo26jiHcJq6DAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hQiWyFH2OYQaKbvhz8GQg9bdBzsvJUrzTVw4iLO+W7gQl6GOjhRi6fvzWU7xH38TfW/0ArIH5sFssOwp7RtTK/dUbbKpYKdPOFwtXCtyiMOGOoPfeNkoo+kn8QhwZstLJ6xRJcbfgSdsWFCh/J9e9TzLAKrczQtr6hosDCds6VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MSSm5xy/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MSSm5xy/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744400539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c7x66GKHy0/KWv9FzU6CXwzT7v4B6HZmPgZ9jBsGca0=;
	b=MSSm5xy/GuTkbI3VMEUEk356ZH0wEIRG79clbjC+v9FoKOcM497P3BOAvRP0EyVybED7QY
	rliG6c20fvtyqaHDQcwGsHW3ztyEM8zFj0/AK7hx7VGWTJKP+c/ymXUPMPIKof29KhRUM7
	PBRjjjF2zb+R+hSqemD6CDPnwyyNhus=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-7-3ekrurHQPoCY3yNdQ9eizw-1; Fri,
 11 Apr 2025 15:42:18 -0400
X-MC-Unique: 3ekrurHQPoCY3yNdQ9eizw-1
X-Mimecast-MFC-AGG-ID: 3ekrurHQPoCY3yNdQ9eizw_1744400536
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8020B1954B33;
	Fri, 11 Apr 2025 19:42:16 +0000 (UTC)
Received: from f39.redhat.com (unknown [10.22.65.78])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 582FD3001D15;
	Fri, 11 Apr 2025 19:42:14 +0000 (UTC)
From: Eder Zulian <ezulian@redhat.com>
To: Basavaraj.Natikar@amd.com,
	vkoul@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jsnitsel@redhat.com,
	ddutile@redhat.com,
	Eder Zulian <ezulian@redhat.com>
Subject: [PATCH RFC 1/1] dmaengine: ptdma: use SLAB_TYPESAFE_BY_RCU for the DMA descriptor slab
Date: Fri, 11 Apr 2025 21:41:48 +0200
Message-ID: <20250411194148.247361-2-ezulian@redhat.com>
In-Reply-To: <20250411194148.247361-1-ezulian@redhat.com>
References: <20250411194148.247361-1-ezulian@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

The SLAB_TYPESAFE_BY_RCU flag prevents a change of type for objects
allocated from the slab cache (although the memory may be reallocated to
a completetly different object of the same type.) Moreover, when the
last reference to an object is dropped the finalization code must not
run until all __rcu pointers referencing the object have been updated,
and then a grace period has passed.

Signed-off-by: Eder Zulian <ezulian@redhat.com>
---
 drivers/dma/amd/ptdma/ptdma-dmaengine.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/amd/ptdma/ptdma-dmaengine.c b/drivers/dma/amd/ptdma/ptdma-dmaengine.c
index 715ac3ae067b..b70dd1b0b9fb 100644
--- a/drivers/dma/amd/ptdma/ptdma-dmaengine.c
+++ b/drivers/dma/amd/ptdma/ptdma-dmaengine.c
@@ -597,7 +597,8 @@ int pt_dmaengine_register(struct pt_device *pt)
 
 	pt->dma_desc_cache = kmem_cache_create(desc_cache_name,
 					       sizeof(struct pt_dma_desc), 0,
-					       SLAB_HWCACHE_ALIGN, NULL);
+					       SLAB_HWCACHE_ALIGN |
+					       SLAB_TYPESAFE_BY_RCU, NULL);
 	if (!pt->dma_desc_cache) {
 		ret = -ENOMEM;
 		goto err_cache;
-- 
2.49.0

