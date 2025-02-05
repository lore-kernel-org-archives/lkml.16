Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34D322B8B1
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747689; cv=none; b=c2MpXKh1Vv9dvUn1PVh/SoZZVQhDtQuBPPs3juYwGuSfFQPjn1Qgjeny/83MKsbfxASkC0bBEnhipEr49BN5++Ak1E3SX0RLrYXXBUghTX695tSSzb36mtA9RPMijpOp4HtyoyT7Xqvs0RRI0hqJMyBXUxOwTh9GI5HvQX9cXpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747689; c=relaxed/simple;
	bh=t1Ijx+z7mRobmwC7nM30+fpI4l4f4a8oBa+BWgm53Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=W7e3ZLgpfcZOEY+OhPfR0n1qKUSsFfzO3pfFIsGFGdxFKhwFlpu6/PIGPcDxGJE9JRCrHUsxoT1Z0PcG1XmDb4QDg7w427MvPbPGwqMF7pcQKhMhKrQ4BAVfzkChEbrMBWMqt8Eq1RCBU9mn2eUNVBHw9i34iSV/INClAmh4fZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Brfr4VAg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Brfr4VAg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738747686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LKc3fZumFCD/91JO2q/vgJ8rLFG0/4maedUYtaTx5XI=;
	b=Brfr4VAgaalv/1jPsVYluE059fWnHJsZzo7jelDs24h9GgIBzS5INrYbaXyON6eWM7HZze
	2vEmwjWg94QHd8qClAiphf34Omx6RL7a4jUc5DXMeTjdW18kJRj/AhM+oMu8LlDU9QpukO
	rPUxcRwpoVw1A54W+xHkfRL0h8Jp+eE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-111-EEDgiAEAOjaQS-4j2v0Clg-1; Wed,
 05 Feb 2025 04:28:03 -0500
X-MC-Unique: EEDgiAEAOjaQS-4j2v0Clg-1
X-Mimecast-MFC-AGG-ID: EEDgiAEAOjaQS-4j2v0Clg
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5172E1955D83;
	Wed,  5 Feb 2025 09:28:02 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.72.112.190])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9B0A2300018D;
	Wed,  5 Feb 2025 09:27:58 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	ryncsn@gmail.com,
	chrisl@kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 07/12] mm/swapfile.c: optimize code in setup_clusters()
Date: Wed,  5 Feb 2025 17:27:16 +0800
Message-ID: <20250205092721.9395-8-bhe@redhat.com>
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

In the last 'for' loop inside setup_clusters(), using two local variable
'k' and 'j' are obvisouly redundant. Using 'j' is enough and simpler.

And also move macro SWAP_CLUSTER_COLS close to its only user
setup_clusters().

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/swapfile.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 9ee2238042a5..78b7329ad2c7 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3123,13 +3123,6 @@ static unsigned long read_swap_header(struct swap_info_struct *si,
 	return maxpages;
 }
 
-#define SWAP_CLUSTER_INFO_COLS						\
-	DIV_ROUND_UP(L1_CACHE_BYTES, sizeof(struct swap_cluster_info))
-#define SWAP_CLUSTER_SPACE_COLS						\
-	DIV_ROUND_UP(SWAP_ADDRESS_SPACE_PAGES, SWAPFILE_CLUSTER)
-#define SWAP_CLUSTER_COLS						\
-	max_t(unsigned int, SWAP_CLUSTER_INFO_COLS, SWAP_CLUSTER_SPACE_COLS)
-
 static int setup_swap_map_and_extents(struct swap_info_struct *si,
 					union swap_header *swap_header,
 					unsigned char *swap_map,
@@ -3169,13 +3162,20 @@ static int setup_swap_map_and_extents(struct swap_info_struct *si,
 	return nr_extents;
 }
 
+#define SWAP_CLUSTER_INFO_COLS						\
+	DIV_ROUND_UP(L1_CACHE_BYTES, sizeof(struct swap_cluster_info))
+#define SWAP_CLUSTER_SPACE_COLS						\
+	DIV_ROUND_UP(SWAP_ADDRESS_SPACE_PAGES, SWAPFILE_CLUSTER)
+#define SWAP_CLUSTER_COLS						\
+	max_t(unsigned int, SWAP_CLUSTER_INFO_COLS, SWAP_CLUSTER_SPACE_COLS)
+
 static struct swap_cluster_info *setup_clusters(struct swap_info_struct *si,
 						union swap_header *swap_header,
 						unsigned long maxpages)
 {
 	unsigned long nr_clusters = DIV_ROUND_UP(maxpages, SWAPFILE_CLUSTER);
 	struct swap_cluster_info *cluster_info;
-	unsigned long i, j, k, idx;
+	unsigned long i, j, idx;
 	int cpu, err = -ENOMEM;
 
 	cluster_info = kvcalloc(nr_clusters, sizeof(*cluster_info), GFP_KERNEL);
@@ -3236,8 +3236,7 @@ static struct swap_cluster_info *setup_clusters(struct swap_info_struct *si,
 	 * Reduce false cache line sharing between cluster_info and
 	 * sharing same address space.
 	 */
-	for (k = 0; k < SWAP_CLUSTER_COLS; k++) {
-		j = k % SWAP_CLUSTER_COLS;
+	for (j = 0; j < SWAP_CLUSTER_COLS; j++) {
 		for (i = 0; i < DIV_ROUND_UP(nr_clusters, SWAP_CLUSTER_COLS); i++) {
 			struct swap_cluster_info *ci;
 			idx = i * SWAP_CLUSTER_COLS + j;
-- 
2.41.0

