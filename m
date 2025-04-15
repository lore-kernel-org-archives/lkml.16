Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F3B4A1A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744684811; cv=none; b=Fnwi9WvoB0LUEUdihrA+NwAxGt7J6zEQ31CCE7PFcpdwADq92eDnZ0nbBuBtAokLKFx2r1xueTF15V2xXFYmOetGc9qQ72nCM1wda/vwJiszVXUYpADyS+lbO8BkYrLf4oaeL6f71ZazKNsEtKucjscjlQwtpwSWh5yYEcLP37I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744684811; c=relaxed/simple;
	bh=eOfjC0BHia++C3VKqQifXQ3HjFpe1y5DuEP753mXmxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=He1IkV5soOx4cP2rFtOiiMD+ze9Yizqpcik2zX9qoUtGKyJ4nO2rms3W5j/OGtmKYynFw5bk6q+pcV8y9BJv68VeB4Pf1qdEJK1gURr8Ses6s9UAAz3HSGC7SXc85/1L2icj54NPyzmW0Vf8P8fyXZ3AlZJdPO8stqQnDuMIuas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EMV2dRhj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EMV2dRhj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744684808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=abWHD7HGRJypdiZsKpqwwuf0n8E4BGzV2LjQF8XVdqk=;
	b=EMV2dRhjUXMF6L98crcFnOP0L2G1zTq2z5F0Cg1PfvNrfIscFZTYbL25vwomkhws2N0e/J
	oiddVPCqFKA0Isy4pGmYmugHNTxjefRYwEZqhq4lznkHtq5Y48MVyKXwOsQcyrmXTUykaq
	aMzVEw0y0X5h/0kUwGHf12WX5ipsQ0s=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-390-O-XFv-pgMZmdIzugaGbJaA-1; Mon,
 14 Apr 2025 22:40:04 -0400
X-MC-Unique: O-XFv-pgMZmdIzugaGbJaA-1
X-Mimecast-MFC-AGG-ID: O-XFv-pgMZmdIzugaGbJaA_1744684803
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5691219560B0;
	Tue, 15 Apr 2025 02:40:03 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.37])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 85319180B487;
	Tue, 15 Apr 2025 02:40:00 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	urezki@gmail.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 1/5] mm/vmalloc.c: change purge_ndoes as local static variable
Date: Tue, 15 Apr 2025 10:39:48 +0800
Message-ID: <20250415023952.27850-2-bhe@redhat.com>
In-Reply-To: <20250415023952.27850-1-bhe@redhat.com>
References: <20250415023952.27850-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Static variable 'purge_ndoes' is defined in global scope, while it's
only used in function __purge_vmap_area_lazy(). It mainly serves to
avoid memory allocation repeatedly, especially when NR_CPUS is big.

While a local static variable can also satisfy the demand, and can
improve code readibility. Hence move its definition into
__purge_vmap_area_lazy().

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/vmalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 6ee7fc2ec986..aca1905d3397 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2128,7 +2128,6 @@ static DEFINE_MUTEX(vmap_purge_lock);
 
 /* for per-CPU blocks */
 static void purge_fragmented_blocks_allcpus(void);
-static cpumask_t purge_nodes;
 
 static void
 reclaim_list_global(struct list_head *head)
@@ -2261,6 +2260,7 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end,
 {
 	unsigned long nr_purged_areas = 0;
 	unsigned int nr_purge_helpers;
+	static cpumask_t purge_nodes;
 	unsigned int nr_purge_nodes;
 	struct vmap_node *vn;
 	int i;
-- 
2.41.0

