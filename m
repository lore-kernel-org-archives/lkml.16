Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E789253F1B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 22:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745015849; cv=none; b=Hv1ro3+zGpxbxFckoKA0Uj3uNaHQShdAcacRPVrp6h32/uXzM03jzKQ3BXNTRZFdFpd4P136ECbNCsgwam237vt/f2JpxvI2Ew0iJo0p+289c8az9hCcoU3AMA0QF18H5lY88rhPPIPSjoU7E1fKFj1XFsAhgHtLZn7TcDsjiQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745015849; c=relaxed/simple;
	bh=8BwZsnVdR8miAoiDxdE54co2xvNhNwAiNXUjNPp92dA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=AlRtNXszHbjUlBMt0GOESG+VEreEj4aa1QexO441XYvL6VvrBUJIjBIFJsavNghAeyUPoniXEy6k43GsuVJ5y5vK627I/ouhC/dE0TlwCsnQ5VwmkO0c4wYYszXW/BpInyqqT2xigqflJSIRg2nS97hW8IAn6uFFqFR52CcTN/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kq2ZHjCy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kq2ZHjCy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745015846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZGf05WSXfY+l3YCUw1WKme5A0IS/vcfpVKsXA2Mq+zc=;
	b=Kq2ZHjCyUKSsTbbEzDVpYyTZfTQlbMLMEM66IzDDHsihxjE4NNtlV+/lZMMIyX25V4CuKH
	ONfU3zFdnTXiC9ztIidfVI4VlmRf3zOM7o9pIpHgvrNS8CWGugqzV68KnMpAJ7jiUEMQNj
	EvWyvH/eO5C86sLYDByFoAdvtPWuQXY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-437-Hyg7DzC2MiKoUIJ60zMYKQ-1; Fri,
 18 Apr 2025 18:37:23 -0400
X-MC-Unique: Hyg7DzC2MiKoUIJ60zMYKQ-1
X-Mimecast-MFC-AGG-ID: Hyg7DzC2MiKoUIJ60zMYKQ_1745015842
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EA72D1956086;
	Fri, 18 Apr 2025 22:37:21 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.18])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CE2E81801770;
	Fri, 18 Apr 2025 22:37:16 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	urezki@gmail.com,
	shivankg@amd.com,
	vishal.moola@gmail.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v2 4/5] mm/vmalloc: optimize function vm_unmap_aliases()
Date: Sat, 19 Apr 2025 06:36:52 +0800
Message-ID: <20250418223653.243436-5-bhe@redhat.com>
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

Remove unneeded local variables and replace them with values.

Signed-off-by: Baoquan He <bhe@redhat.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
---
 mm/vmalloc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index cd654cc35d2b..39e043ba969b 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2915,10 +2915,7 @@ static void _vm_unmap_aliases(unsigned long start, unsigned long end, int flush)
  */
 void vm_unmap_aliases(void)
 {
-	unsigned long start = ULONG_MAX, end = 0;
-	int flush = 0;
-
-	_vm_unmap_aliases(start, end, flush);
+	_vm_unmap_aliases(ULONG_MAX, 0, 0);
 }
 EXPORT_SYMBOL_GPL(vm_unmap_aliases);
 
-- 
2.41.0

