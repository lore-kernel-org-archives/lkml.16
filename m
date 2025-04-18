Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9142C1E49F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 22:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745015839; cv=none; b=Vy3GBKF41RQM5yLT4v+Giff5AWF71+ifpBogq6NXGy8c3LmT+EQWLeWLQcyx/K1XPn4TajLLYM9uT++0npMSPYp9a6oUZG9Bve5QR4zkSVjigLjIl2UucVcrnUqSBQPTH4i0ucnecTjo/xV8K4Sjn7eCDCa/S+GnwmY7L98Vnf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745015839; c=relaxed/simple;
	bh=0MLlnATxWP7SCldyFiN08C9b0XlyLKECYXtv48FQJd0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=ftnOZ/3oEg1KD9S9wqTNo6tplHHIqPnsMdFuOCYRAEfeCHfn00n0c6Qp0Tgvx5i9A26Eq68PVk52zpWzXTdoToGFmwRY7ic73z2DEUxm5niE4GqVMyFJxFnIZoO0bNs5zab3qeM5CNzDqtZl6RKV9sfc35oe3f00Zp0WGMUVXgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EgNGzMWp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EgNGzMWp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745015831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sDZHjlZI9MgazOQ8q7tQM1TDSr4RQFST8lgwGFeEG18=;
	b=EgNGzMWp184y9yJRgwvH6jckf6LZ5b5ZDloJWfDnXRUO/SpN/j6Q5DjBxdmv2V8tFZyrav
	+S/zZMN7agPNb1nztDCxk9w9ylHNu2vaf7yweaweIjXDP6LX2OCi1dSDve3RyzWq779QNa
	FWDFB4pxRZMM+ItUYf9I6bZGMQvWl6g=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-360-EtRH0W7XPjKjGIKaPwZaZA-1; Fri,
 18 Apr 2025 18:37:04 -0400
X-MC-Unique: EtRH0W7XPjKjGIKaPwZaZA-1
X-Mimecast-MFC-AGG-ID: EtRH0W7XPjKjGIKaPwZaZA_1745015821
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 609E31800877;
	Fri, 18 Apr 2025 22:37:01 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.18])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A335F180177F;
	Fri, 18 Apr 2025 22:36:56 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	urezki@gmail.com,
	shivankg@amd.com,
	vishal.moola@gmail.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v2 0/5] mm/vmalloc.c: code cleanup and improvements
Date: Sat, 19 Apr 2025 06:36:48 +0800
Message-ID: <20250418223653.243436-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

These were made from code inspection in mm/vmalloc.c.

v1->v2:
=======
- In patch 3:
  - made change to improve code according to Uladzislau's suggestion;
  - use WRITE_ONCE() to assign the value to vn->pool[i].len finally,
    according to Shivank's suggestion.
In patch 5:
  - add back the WARN_ON_ONCE() on returned value from va_clip()
    invocation, and also add back the code comment. These are pointed
    out by Uladzislau. 

- Add reviewers' tag from Uladzislau, Shivank and Vishal. And I only add
  Shivank's tag in patch 1, 2, 4 according to his comment because patch 3
  and 5 are changed in v2.

Baoquan He (5):
  mm/vmalloc.c: change purge_ndoes as local static variable
  mm/vmalloc.c: find the vmap of vmap_nodes in reverse order
  mm/vmalloc.c: optimize code in decay_va_pool_node() a little bit
  mm/vmalloc: optimize function vm_unmap_aliases()
  mm/vmalloc.c: return explicit error value in alloc_vmap_area()

 mm/vmalloc.c | 61 ++++++++++++++++++++++++----------------------------
 1 file changed, 28 insertions(+), 33 deletions(-)

-- 
2.41.0

