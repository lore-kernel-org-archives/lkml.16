Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEDF22A805
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747661; cv=none; b=GHpmnE23rWkpIX1pAalGNKXfsFX3ZMxDzbbky2NfE8zehdWQnLEHBOuRVggcyETZuZfZTu7YkDyr6HbbGJAzeXO4bO+godoh2yyaQOJc1wAmedPzsGTXXtWD3nVtFckwTMI+Fxsczln3aBiw8U8twi1ziGN9WxZmDA+JC2XngSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747661; c=relaxed/simple;
	bh=3QJj2ATHGlTaz/6pj+vvdZyvAhks2vwRPV0D027mm9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=Zfhp/OhN9FCgO8HQoAlB2kESbup6uUO/LzdCOfqKODqnzftNqv2E6GJ2IPT581xzzZww4fjsJxd1/bkqo6R7EzPB43FEIcaYlYbwOWVOx7QGhf3rMrdwKI5VltVCLCgmx40HR1i6Gy+RWv9BF+pSRQhtlostfrgBxoO3deXmVmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XAU1pNK4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XAU1pNK4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738747659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=90rRcO0x8Pvov1XWHGz55JZuNeq5fISSOHzEENgRMag=;
	b=XAU1pNK4zy9U1Q3GVcFIShZPP9DSiZwY3zvKjoZvXBIALy59HouX6+DaqggKABdGCGHEdF
	kfnKd+G46x2Oeb0Sg4ClrVenmsVYkvHoY187x/wCrIG/Rqpn6dsr1D3wWCSxt6PRsnQzw0
	EtLmPkg0rIIvh9WOiUuwfbP69N1Bc9I=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-524-w343ZRs9MHuMWo5S_cZR1g-1; Wed,
 05 Feb 2025 04:27:35 -0500
X-MC-Unique: w343ZRs9MHuMWo5S_cZR1g-1
X-Mimecast-MFC-AGG-ID: w343ZRs9MHuMWo5S_cZR1g
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1A3301800879;
	Wed,  5 Feb 2025 09:27:34 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.72.112.190])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4501F300018D;
	Wed,  5 Feb 2025 09:27:29 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	ryncsn@gmail.com,
	chrisl@kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 01/12] mm/swap_state.c: fix the obsolete code comment
Date: Wed,  5 Feb 2025 17:27:10 +0800
Message-ID: <20250205092721.9395-2-bhe@redhat.com>
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

Since commit 85a1333417a7 ("mm/swap: use dedicated entry for swap in
folio"), there's a dedicated field in folio for swap entry. Let's
update the code comment above add_to_swap_cache() accordingly.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/swap_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/swap_state.c b/mm/swap_state.c
index ca42b2be64d9..59acb55174c8 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -85,7 +85,7 @@ void *get_shadow_from_swap_cache(swp_entry_t entry)
 
 /*
  * add_to_swap_cache resembles filemap_add_folio on swapper_space,
- * but sets SwapCache flag and private instead of mapping and index.
+ * but sets SwapCache flag and 'swap' instead of mapping and index.
  */
 int add_to_swap_cache(struct folio *folio, swp_entry_t entry,
 			gfp_t gfp, void **shadowp)
-- 
2.41.0

