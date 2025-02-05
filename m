Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5BA22A7F6
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747678; cv=none; b=AbYnes3/dKIooWK3Ci3lk1SymRIuAv+3HuQ84mwhg95GihJgRf5FPr2boCuI29XpgfUJpg0scTPKv5y85JDrx8n+Gx6KAN6Yah4EsMPLcDFF+dYWRGdCFREZdiezb6xd7hiBdb4lNzRzmskvGnM98jmU/ZO1isUbvfuXGXGTZ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747678; c=relaxed/simple;
	bh=JKq/u3TB5ClLQq1auU3QmTor7N2cvlGqSJu5d/umTgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=FgI8kNUFAHS5/i90J5cFaLNgDdSod5irX1URqxUOHxQ/cEFeOEfuHrMJNTWIYJzDx3LoznquPQzTYlfSFzj9WO4h78dEaDLZjBMfbGkzFZx/plloXos6wAnzaHRT0CwzL+a5zaBkDoJhH5WJhA9Q3CpLy+IQCw1zJQSbl/fzybM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PW05TksU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PW05TksU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738747676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=baZcIm7AlnLIRm7Dd7CyR7YXStnIxeq19AKgfb6y8wo=;
	b=PW05TksUdSHuosAU43QAXSbEfQR9IZG+kxHEHOjJXQyQGwFnGhNj2UtmPwGx+LeiSMO+8e
	zZLH9ovqsNgeQX7bb1c/mBupJ4SQmZG6JAnRSq5t0FKIIbsylPH66D+qMY2ekYuXpUrZCb
	AqUwUsFIUcgmB6BsOApruINvcQ2Vw0U=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-548-WOpEV56FPm2xOHG6ElSdSA-1; Wed,
 05 Feb 2025 04:27:53 -0500
X-MC-Unique: WOpEV56FPm2xOHG6ElSdSA-1
X-Mimecast-MFC-AGG-ID: WOpEV56FPm2xOHG6ElSdSA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A0616195D6AC;
	Wed,  5 Feb 2025 09:27:48 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.72.112.190])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 94030300019E;
	Wed,  5 Feb 2025 09:27:44 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	ryncsn@gmail.com,
	chrisl@kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 04/12] mm/swap: skip scanning cluster range if it's empty cluster
Date: Wed,  5 Feb 2025 17:27:13 +0800
Message-ID: <20250205092721.9395-5-bhe@redhat.com>
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

Since ci->lock has been taken when isolating cluster from
si->free_clusters or taking si->percpu_cluster->next[order],
it's unnecessary to scan and check the cluster range availability
if i'ts empty cluster, and this can accelerate the huge page
swapping.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/swapfile.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 9c9a4ec6d4c6..61efde853eea 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -729,6 +729,9 @@ static bool cluster_scan_range(struct swap_info_struct *si,
 	unsigned long offset, end = start + nr_pages;
 	unsigned char *map = si->swap_map;
 
+	if (cluster_is_empty(ci))
+		return true;
+
 	for (offset = start; offset < end; offset++) {
 		switch (READ_ONCE(map[offset])) {
 		case 0:
-- 
2.41.0

