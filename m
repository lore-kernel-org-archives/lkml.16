Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA511211A3C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744684819; cv=none; b=di980dCDMLwWAZohu9sglLupEczKskTMyXKhPsxm4gjf9VBu5nFr4J9HvhsQat1phj6ZJ7XJGtGiEF7r7ycO5weMxVGm6Gd5cWcLaj6zp2b27GyW0NJHljzOVpZxw7bzlz5qRWfd+4vNbHPoeve7b1KWou3DZASygWOrXK5YWHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744684819; c=relaxed/simple;
	bh=QfShxFv9ltw6jMWiZ17nc3fNMjYd8cKjfMqKbqQfLUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=lV1MMFg9xGa8Z9q1OuXV8WII43C3DlrV90Y9JEIe+FZpeJNOaDLsYrsv+0GUqPqI1tfTW57spK+CFdM8nd2BdO5Fmb2pCotSGnX0b8xUs+MMdt3ecaJUUTmUAAvZOaF4JWyGr1whU3voIfS6bxKP7CRW3JF64DM4QxZ0qLBkUUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g2pAhOLz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g2pAhOLz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744684816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aHl/Z9s4nujmOJmJ3+sr23NFZCZ38U3X11XyM8VuKPk=;
	b=g2pAhOLzA1h6i64ebfLAUdZjScB3BmpYcvDMxk2h7ZH356BeCRBYqC17YFTvQnCuh+FFEk
	dbfq0Hp81t6df4yzMdpSHRoOWK4F6Iz6O9mrzoiTT9dLtVKT29NDLhCPpVtwmHTzaooD+Z
	xSPAfqS6jvBF9zAi8fTr2TjR1ozKBo8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-618-Y0MOwrwTNliPZTXflYU4iw-1; Mon,
 14 Apr 2025 22:40:12 -0400
X-MC-Unique: Y0MOwrwTNliPZTXflYU4iw-1
X-Mimecast-MFC-AGG-ID: Y0MOwrwTNliPZTXflYU4iw_1744684811
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4425419560BB;
	Tue, 15 Apr 2025 02:40:11 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.37])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4D45E180AF7C;
	Tue, 15 Apr 2025 02:40:07 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	urezki@gmail.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 3/5] mm/vmalloc.c: optimize code in decay_va_pool_node() a little bit
Date: Tue, 15 Apr 2025 10:39:50 +0800
Message-ID: <20250415023952.27850-4-bhe@redhat.com>
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
index 488d69b56765..bf735c890878 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2150,7 +2150,7 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
 	LIST_HEAD(decay_list);
 	struct rb_root decay_root = RB_ROOT;
 	struct vmap_area *va, *nva;
-	unsigned long n_decay;
+	unsigned long n_decay, len;
 	int i;
 
 	for (i = 0; i < MAX_VA_SIZE_PAGES; i++) {
@@ -2164,22 +2164,20 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
 		list_replace_init(&vn->pool[i].head, &tmp_list);
 		spin_unlock(&vn->pool_lock);
 
-		if (full_decay)
-			WRITE_ONCE(vn->pool[i].len, 0);
+		len = n_decay = vn->pool[i].len;
+		WRITE_ONCE(vn->pool[i].len, 0);
 
 		/* Decay a pool by ~25% out of left objects. */
-		n_decay = vn->pool[i].len >> 2;
+		if (!full_decay)
+			n_decay >>= 2;
+		len -= n_decay;
 
 		list_for_each_entry_safe(va, nva, &tmp_list, list) {
+			if (!n_decay)
+				break;
 			list_del_init(&va->list);
 			merge_or_add_vmap_area(va, &decay_root, &decay_list);
-
-			if (!full_decay) {
-				WRITE_ONCE(vn->pool[i].len, vn->pool[i].len - 1);
-
-				if (!--n_decay)
-					break;
-			}
+			n_decay--;
 		}
 
 		/*
@@ -2188,9 +2186,10 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
 		 * can populate the pool therefore a simple list replace
 		 * operation takes place here.
 		 */
-		if (!full_decay && !list_empty(&tmp_list)) {
+		if (!list_empty(&tmp_list)) {
 			spin_lock(&vn->pool_lock);
 			list_replace_init(&tmp_list, &vn->pool[i].head);
+			vn->pool[i].len = len;
 			spin_unlock(&vn->pool_lock);
 		}
 	}
-- 
2.41.0

