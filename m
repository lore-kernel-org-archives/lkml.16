Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ECF1E49F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 22:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745015845; cv=none; b=GdKJZMcBWk5EmtImyjdvYm3hC85TG16lBnRDZNSaezviQ1wQSWGcqRF3BW+JIBZ9JMR2f0wfNsptiLp9Zc74j8qkRNpe/PUGfqZDEBhlPOVUMnjJZUZOpF60w8x1iwUvRvblN6BxYoNf2kplAzrFw4URdRVjIezRfOceYDb6bCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745015845; c=relaxed/simple;
	bh=UBlASDVwjb3xq+74DdLIUbYJqk15ElEF6MeTXvgIAtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=ZcT44JlmURp1OzeekQWdkb5c8DXiKsT4bKo3QT29m5qJfSU6RXgQvpl/1Soro7osCSMRui0D2EmKw32W9JomTZLelRIjvT20GkjzABZw9zZjY5sss0WsNJ22nBZfeEwbGU7yogbhcOwMicri012dnJJO2tvnT4RVIuy0+1IyUFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JwFa5vH2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JwFa5vH2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745015842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5CqaNyVqh6Pco3lRKN4a8MRDCkCUASVHhS+U1Kf4kAE=;
	b=JwFa5vH2SuJAAACjT4KwdEO9imnqdonJUTIFS1j+RRIQOsQHnGLBWPxbMh57h9otDiSDrn
	G0kGGr+30X5VVSM9BIHCt4+iZJxMmFXWAqoYHYHnRu+vvuCLfBa/Ncxwy1b3fJzRFRbMd5
	DTSko060e73Am+NaYfiZpPQ7V5tgMBA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-447-SpM8dBtoNYK9z96TxEmhJw-1; Fri,
 18 Apr 2025 18:37:17 -0400
X-MC-Unique: SpM8dBtoNYK9z96TxEmhJw-1
X-Mimecast-MFC-AGG-ID: SpM8dBtoNYK9z96TxEmhJw_1745015835
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 998D31800263;
	Fri, 18 Apr 2025 22:37:15 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.18])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EF78A1801770;
	Fri, 18 Apr 2025 22:37:11 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	urezki@gmail.com,
	shivankg@amd.com,
	vishal.moola@gmail.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v2 3/5] mm/vmalloc.c: optimize code in decay_va_pool_node() a little bit
Date: Sat, 19 Apr 2025 06:36:51 +0800
Message-ID: <20250418223653.243436-4-bhe@redhat.com>
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

When purge lazily freed vmap areas, VA stored in vn->pool[] will also be
taken away into free vmap tree partially or completely accordingly, that
is done in decay_va_pool_node(). When doing that, for each pool of node,
the whole list is detached from the pool for handling. At this time,
that pool is empty. It's not necessary to update the pool size each time
when one VA is removed and addded into free vmap tree.

Here change code to update the pool size when attaching the pool back.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/vmalloc.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 76ab4d3ce616..cd654cc35d2b 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2133,7 +2133,7 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
 	LIST_HEAD(decay_list);
 	struct rb_root decay_root = RB_ROOT;
 	struct vmap_area *va, *nva;
-	unsigned long n_decay;
+	unsigned long n_decay, pool_len;
 	int i;
 
 	for (i = 0; i < MAX_VA_SIZE_PAGES; i++) {
@@ -2147,22 +2147,20 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
 		list_replace_init(&vn->pool[i].head, &tmp_list);
 		spin_unlock(&vn->pool_lock);
 
-		if (full_decay)
-			WRITE_ONCE(vn->pool[i].len, 0);
+		pool_len = n_decay = vn->pool[i].len;
+		WRITE_ONCE(vn->pool[i].len, 0);
 
 		/* Decay a pool by ~25% out of left objects. */
-		n_decay = vn->pool[i].len >> 2;
+		if (!full_decay)
+			n_decay >>= 2;
+		pool_len -= n_decay;
 
 		list_for_each_entry_safe(va, nva, &tmp_list, list) {
+			if (!n_decay--)
+				break;
+
 			list_del_init(&va->list);
 			merge_or_add_vmap_area(va, &decay_root, &decay_list);
-
-			if (!full_decay) {
-				WRITE_ONCE(vn->pool[i].len, vn->pool[i].len - 1);
-
-				if (!--n_decay)
-					break;
-			}
 		}
 
 		/*
@@ -2171,9 +2169,10 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
 		 * can populate the pool therefore a simple list replace
 		 * operation takes place here.
 		 */
-		if (!full_decay && !list_empty(&tmp_list)) {
+		if (!list_empty(&tmp_list)) {
 			spin_lock(&vn->pool_lock);
 			list_replace_init(&tmp_list, &vn->pool[i].head);
+			WRITE_ONCE(vn->pool[i].len, pool_len);
 			spin_unlock(&vn->pool_lock);
 		}
 	}
-- 
2.41.0

