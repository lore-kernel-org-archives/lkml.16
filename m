Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D1822CBD6
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747712; cv=none; b=UyHNqE63QGenu0IS+X8jVZcI0f5LroapDs+YJjto+alpNiniqSge0Ilo26aqWNJSgF8CTBHt7t/akZlgqKY5vAwONKRfkI22cKm/cb4SLzKE0kBdFrod9kcFLspFvwq6drHfP8/1YL1DvIrkxJQbCcXfLO/xUiNxBxRNtoaVQ5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747712; c=relaxed/simple;
	bh=hpqBJBwb47MHOoGFyd/KF46dfDxV+GtQ8s3DgjwCeNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=JWGVaYyVY6g2QdJUY59MNkuiGwh8bh4RTT/hIUCwMiVfI1NooXaWwKakOD2JlhXMWY2fjPgdKHy8SgzW62Jwpqhui9VLwsMYu9H4mGS8YdyMHnpsm+gQ7AwaVDGjp555nI5elOmWwi5R+KScA6bdxHjganO53DFRc7C7jkmxJjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZpnRlDte; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZpnRlDte"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738747710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eJxZpNwhXiHzAqXXfk54vRZnvA5qQBJ34Wvs1FodgiE=;
	b=ZpnRlDtevZOYaFZXU8Gaow153cA6gOIgtqM/HZCy4m1jsS7JjTWrRxLZ61pzmSiYZlBJbl
	DKsCGQ2//bFINl1rg+Qn+c5xwPTsB7fA+aGHp4m06Mijaw5hm5mS94saVWnScrqxOWDGmE
	OyoDfOCS+k2D3UeTTpxJ1Yw4kOj9R4s=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-34-gOIRUj3mNiWKdkWAHtpU_w-1; Wed,
 05 Feb 2025 04:28:26 -0500
X-MC-Unique: gOIRUj3mNiWKdkWAHtpU_w-1
X-Mimecast-MFC-AGG-ID: gOIRUj3mNiWKdkWAHtpU_w
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8B858195608B;
	Wed,  5 Feb 2025 09:28:25 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.72.112.190])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D381C300018D;
	Wed,  5 Feb 2025 09:28:21 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	ryncsn@gmail.com,
	chrisl@kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 12/12] mm/swapfile.c: open code cluster_alloc_swap()
Date: Wed,  5 Feb 2025 17:27:21 +0800
Message-ID: <20250205092721.9395-13-bhe@redhat.com>
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

It's only called in scan_swap_map_slots().

And also remove the stale code comment in scan_swap_map_slots()
because it's not fit for the current cluster allocation mechanism.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/swapfile.c | 38 ++++++++++----------------------------
 1 file changed, 10 insertions(+), 28 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 12bb7556c7f1..7448a387621d 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1158,39 +1158,13 @@ static void swap_range_free(struct swap_info_struct *si, unsigned long offset,
 	swap_usage_sub(si, nr_entries);
 }
 
-static int cluster_alloc_swap(struct swap_info_struct *si,
-			     unsigned char usage, int nr,
-			     swp_entry_t slots[], int order)
-{
-	int n_ret = 0;
-
-	while (n_ret < nr) {
-		unsigned long offset = cluster_alloc_swap_entry(si, order, usage);
-
-		if (!offset)
-			break;
-		slots[n_ret++] = swp_entry(si->type, offset);
-	}
-
-	return n_ret;
-}
-
 static int scan_swap_map_slots(struct swap_info_struct *si,
 			       unsigned char usage, int nr,
 			       swp_entry_t slots[], int order)
 {
 	unsigned int nr_pages = 1 << order;
+	int n_ret = 0;
 
-	/*
-	 * We try to cluster swap pages by allocating them sequentially
-	 * in swap.  Once we've allocated SWAPFILE_CLUSTER pages this
-	 * way, however, we resort to first-free allocation, starting
-	 * a new cluster.  This prevents us from scattering swap pages
-	 * all over the entire swap partition, so that we reduce
-	 * overall disk seek times between swap pages.  -- sct
-	 * But we do now try to find an empty cluster.  -Andrea
-	 * And we let swap pages go all over an SSD partition.  Hugh
-	 */
 	if (order > 0) {
 		/*
 		 * Should not even be attempting large allocations when huge
@@ -1210,7 +1184,15 @@ static int scan_swap_map_slots(struct swap_info_struct *si,
 			return 0;
 	}
 
-	return cluster_alloc_swap(si, usage, nr, slots, order);
+	while (n_ret < nr) {
+		unsigned long offset = cluster_alloc_swap_entry(si, order, usage);
+
+		if (!offset)
+			break;
+		slots[n_ret++] = swp_entry(si->type, offset);
+	}
+
+	return n_ret;
 }
 
 static bool get_swap_device_info(struct swap_info_struct *si)
-- 
2.41.0

