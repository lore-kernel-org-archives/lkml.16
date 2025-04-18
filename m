Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E521E49F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 22:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745015834; cv=none; b=B6WM24bEEmX0GgOR4WUDQdWQRO46f6R45VkNsd3j09RY+b8ojWdkZra0lSSg+Cf1SqVQRiCjcepSXhZaEaEymDPqFv0ATmTRIZkSKWNtBjf8yxyB+pnNZ/IiIdpuMV/0kyg94k1u5R+Y+xxHOu+0CFGyCwwJ7MWBfKW6o6uaS/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745015834; c=relaxed/simple;
	bh=g4ihXMSwKPIoA2h8mD/JezA0Y0czIKb723cLWShfivc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=UGybXbw2tHRfYjXzhXASZpuehSHSCYKudB9moDRz/XbGCvYpV9zkvcJpN7TBiKml7x6Mv9YjWCxUQqn+z6e1RTFFCrqsnMWSSnmn6Qa28JPoUm6SejRiAy9rgm74tcExMBFuVBRpDPN1vbE8Hrp7QJ+nJuBe1WD3A6o2wwdMpow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qztl/Yas; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qztl/Yas"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745015830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GQmQfMpW8va+UTCEXGmkf3H4xjY6QXJiuqlXROT9njk=;
	b=Qztl/Yasa1y9xE9NzieJ4zjh43mbEysv3ZPJGEW83wnPz7V6kdWchYcCgaKFV/QhO8hMxg
	pcVAm0JXoRSa/BTvh1oafg6Rw5Hf7iU+0YdPJWCK6qYMsbhtTv3JiVO7d7jFyQPqQpq7YM
	dHyHQ0NKQravWFOHqPNu8a4V32/TNx8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-607-SYG6l-PeNDafTOuSFqMW9Q-1; Fri,
 18 Apr 2025 18:37:06 -0400
X-MC-Unique: SYG6l-PeNDafTOuSFqMW9Q-1
X-Mimecast-MFC-AGG-ID: SYG6l-PeNDafTOuSFqMW9Q_1745015825
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 86CB1195608E;
	Fri, 18 Apr 2025 22:37:05 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.18])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EE42F1801770;
	Fri, 18 Apr 2025 22:37:01 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	urezki@gmail.com,
	shivankg@amd.com,
	vishal.moola@gmail.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v2 1/5] mm/vmalloc.c: change purge_ndoes as local static variable
Date: Sat, 19 Apr 2025 06:36:49 +0800
Message-ID: <20250418223653.243436-2-bhe@redhat.com>
In-Reply-To: <20250418223653.243436-1-bhe@redhat.com>
References: <20250418223653.243436-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Static variable 'purge_ndoes' is defined in global scope, while it's
only used in function __purge_vmap_area_lazy(). It mainly serves to
avoid memory allocation repeatedly, especially when NR_CPUS is big.

While a local static variable can also satisfy the demand, and can
improve code readibility. Hence move its definition into
__purge_vmap_area_lazy().

Signed-off-by: Baoquan He <bhe@redhat.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
---
 mm/vmalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 3ed720a787ec..38d8d8d60985 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2111,7 +2111,6 @@ static DEFINE_MUTEX(vmap_purge_lock);
 
 /* for per-CPU blocks */
 static void purge_fragmented_blocks_allcpus(void);
-static cpumask_t purge_nodes;
 
 static void
 reclaim_list_global(struct list_head *head)
@@ -2244,6 +2243,7 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end,
 {
 	unsigned long nr_purged_areas = 0;
 	unsigned int nr_purge_helpers;
+	static cpumask_t purge_nodes;
 	unsigned int nr_purge_nodes;
 	struct vmap_node *vn;
 	int i;
-- 
2.41.0

