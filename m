Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4681922A7E2
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747670; cv=none; b=SwMHNCvqsS3TST5c0pTd0LM5tHwcFPdsg+i+TjEohNaWYOY5IEkrcTb1Jw0oNd6+OYFwV8QlnRlsrDL2iZt3UlVi3v6cuANuKhVdfiFcb2rV8u8mc+anhcpyGheRvQ9FMEPF8HnHSCQLRE/NFo1DQMGkSQmLM44z8paBumhVG9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747670; c=relaxed/simple;
	bh=rH9uqqW7zoZZHLlRdOhy7KJzkID/K/4qLZMQozalwPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=uqGnzKsPpP7DLX8QA0mp2HXe0NU3ARSYrCIcdif1+++7kI1m+Saby4o5PTjyWpd+PI7vwq48nhWnRM+qvqBlc7hvti+yd0nASittR1WkDtys1bx6gLfq9OgXBv9Wprjv8fBRN7pxGNw/tNAudkztkzhrrQFL9oMZ2N/MUyvrD94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=edx0bBOS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="edx0bBOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738747668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FIOS+/tyiatrDoGbeFH0VR1TEwzBCwvdDVquOSZT3r0=;
	b=edx0bBOSawWwYb8EW3pgqRjK2bf46ES9G6fxIPjRr5IynWbTcF8qrKiBrwRGfWzMbfyq4U
	z3qxPg2xjYMgD2rL8vQ3WRtFssubDFIjLxXNHlNpiFNaW5WuC/UXTlHtfsd2f5Ba6mUZsW
	4D3sjBVOy8ewfzVchrCsW8ci5kjsP4k=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-626-BmsBWnX8OmGC-bxlcS6guQ-1; Wed,
 05 Feb 2025 04:27:46 -0500
X-MC-Unique: BmsBWnX8OmGC-bxlcS6guQ-1
X-Mimecast-MFC-AGG-ID: BmsBWnX8OmGC-bxlcS6guQ
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A05631801A3D;
	Wed,  5 Feb 2025 09:27:43 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.72.112.190])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C4E203000199;
	Wed,  5 Feb 2025 09:27:39 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	ryncsn@gmail.com,
	chrisl@kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 03/12] mm/swap: remove SWAP_FLAG_PRIO_SHIFT
Date: Wed,  5 Feb 2025 17:27:12 +0800
Message-ID: <20250205092721.9395-4-bhe@redhat.com>
In-Reply-To: <20250205092721.9395-1-bhe@redhat.com>
References: <20250205092721.9395-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

It doesn't make sense to have a zero value of shift. Remove it to
avoid confusion.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 include/linux/swap.h | 1 -
 mm/swapfile.c        | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index b13b72645db3..20bfedc8c4f2 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -24,7 +24,6 @@ struct pagevec;
 
 #define SWAP_FLAG_PREFER	0x8000	/* set if swap priority specified */
 #define SWAP_FLAG_PRIO_MASK	0x7fff
-#define SWAP_FLAG_PRIO_SHIFT	0
 #define SWAP_FLAG_DISCARD	0x10000 /* enable discard for swap */
 #define SWAP_FLAG_DISCARD_ONCE	0x20000 /* discard swap area at swapon-time */
 #define SWAP_FLAG_DISCARD_PAGES 0x40000 /* discard page-clusters after use */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index ba19430dd4ea..9c9a4ec6d4c6 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3449,8 +3449,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	mutex_lock(&swapon_mutex);
 	prio = -1;
 	if (swap_flags & SWAP_FLAG_PREFER)
-		prio =
-		  (swap_flags & SWAP_FLAG_PRIO_MASK) >> SWAP_FLAG_PRIO_SHIFT;
+		prio = swap_flags & SWAP_FLAG_PRIO_MASK;
 	enable_swap_info(si, prio, swap_map, cluster_info, zeromap);
 
 	pr_info("Adding %uk swap on %s.  Priority:%d extents:%d across:%lluk %s%s%s%s\n",
-- 
2.41.0

