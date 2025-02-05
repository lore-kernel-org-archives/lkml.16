Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629D822B8BF
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747695; cv=none; b=kNoKhABVFI6fZQlA7dJ8HHQE08K+AFkp0odd1XaVEOJ3qfWy1tRDi84l7u0o4jl/8q9yeJFo+9UCLaY2pgeV432d49vP3yDla6V4L1ROpL+NPelbgkWUOGwrduKUCokbGU0IG0j7I6KvLi5s9/cfqMS/kgzDZVYVR07g3wdsGow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747695; c=relaxed/simple;
	bh=AN2UcnAy08VF3/WUmP5xZ8yMQfcDHf4MeyLqXvvStyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=L8S5ZSBkqg9RH0pG5Rlm/Ma2XznljrIDrZm3B6VDUhuTEGrK+EjChiIjG+RqhtCt4V6Zw/Skvd3ffAio3SnEUtss9bxKBA3b7ojtMKb9F8ZvCk7mXt9Lb/O6AfBjKky3GEqTvdcMwZdnsyR0orS4Zhc/S4NeNYl7V1Td/qTUSC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cSgaJ0sB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cSgaJ0sB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738747692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LKdSXZcqnstZAkYV6ff74HG8BN8BooEUO78YRxCe8Tc=;
	b=cSgaJ0sB7sdPe7nF9c6xMBpKptimws7D61S1UTElQft/oYZB8toMAQIQlZ0ugArOOHJz01
	islKEdNvW39Dq2+AO+QlqrBdpJHMtMayBAAqsvD4gpCkbngsT1WlWKEq8T6U8G7NyV4fyp
	S6XgOpGcX0t6jvTUChNX5Xk2qxQTc3U=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-179-cXFiB-0CPGi7ksJUR4_nxw-1; Wed,
 05 Feb 2025 04:28:08 -0500
X-MC-Unique: cXFiB-0CPGi7ksJUR4_nxw-1
X-Mimecast-MFC-AGG-ID: cXFiB-0CPGi7ksJUR4_nxw
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1900819560B2;
	Wed,  5 Feb 2025 09:28:07 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.72.112.190])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 394AE300018D;
	Wed,  5 Feb 2025 09:28:02 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	ryncsn@gmail.com,
	chrisl@kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 08/12] mm/swap_state.c: remove the meaningless code comment
Date: Wed,  5 Feb 2025 17:27:17 +0800
Message-ID: <20250205092721.9395-9-bhe@redhat.com>
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

Since commit 8d93b41c09d1 ("mm: Convert add_to_swap_cache to XArray"),
there's no returned _EEXIT, so the code comment doesn't make sense any
more.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/swap_state.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/mm/swap_state.c b/mm/swap_state.c
index d7cbf5bb2450..b393cefb3be0 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -203,10 +203,6 @@ bool add_to_swap(struct folio *folio)
 	err = add_to_swap_cache(folio, entry,
 			__GFP_HIGH|__GFP_NOMEMALLOC|__GFP_NOWARN, NULL);
 	if (err)
-		/*
-		 * add_to_swap_cache() doesn't return -EEXIST, so we can safely
-		 * clear SWAP_HAS_CACHE flag.
-		 */
 		goto fail;
 	/*
 	 * Normally the folio will be dirtied in unmap because its
-- 
2.41.0

