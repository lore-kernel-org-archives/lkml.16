Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBE8227581
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 19:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750448233; cv=none; b=sAPBhRIFsC9Av01AUQDMaYsAg5B4MzTba0DyamyRFPFmtMVAlELhRJI066wHgdrsP0XYSOovQNw3BjU3rPxwXh4fNYZo6BfzKoG27hpHNzlc52HFrUhXuS8IAQm10sJsFb4IQDiBlePeyzpiINDksyR6YnN3WKYlHM3Ats24N0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750448233; c=relaxed/simple;
	bh=9R7ipJwaMIuj97EvtD7yFk4UxPwMOYnYfHVZDYGvX84=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VY6St2NZQ7NSgPRN94kV7jUC3+FM+ZVi3z/a6CbmLTy+vMxhILKRwOpEv3WxIWbj7QoYw7lBtqZC0oM58ptaKuqO3C97UF76a4/Cis+AH5rrh3vVxcz/l7vE9WQ9TAlfzMRK5q9tvKprUlOQHmRkWxaZmqDvXksAkxnlKJztRCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=YOszxjxD; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=K0uqUK03; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="YOszxjxD";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="K0uqUK03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1750448158; x=1751052958;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=b8CT8mbuTOKO0Kzg8JaHJOQz1iHihRyBqAol0oYOrRM=;
	b=YOszxjxDZr2E1NxcFZ1FNxZRfjdQIBvU3kMhOrypP0OJ6WTevF9ssQvWRj7uLWsYZTUxXFjR2tYTm
	 yTm8cVyARtpnQauNrbv0oR9US2jnrdjzRsWQGwjs7AP/G6wxRe9fwtPZXARzkM8H7fwylV04SHnHml
	 n8PYK3nrrosXirrK3gZWrXAxg9c5r9I5Ba8mcvxeOw/sLjQpQN213V7xq5hpyBm4ETWq0AM0VL0DDs
	 xXpXBSisXc82SVfPIytSnmmmi83I9xATlLLrep4rAipZQKTmKPualYdXQQMBk62IZhe3N33gng1Bmr
	 AalsoonjRsdEiJC5RTew1H0uygAr2RQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1750448158; x=1751052958;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=b8CT8mbuTOKO0Kzg8JaHJOQz1iHihRyBqAol0oYOrRM=;
	b=K0uqUK035fszbNLXnH1A3MUuL4Jb2PxtTuT4o7IKP30UcKXbwvNNrvmnx8b3hIe7C/0K6NSXdvg95
	 k03DUIGCQ==
X-HalOne-ID: c98e7cd9-4e0d-11f0-a78d-85eb291bc831
Received: from slottsdator.home (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id c98e7cd9-4e0d-11f0-a78d-85eb291bc831;
	Fri, 20 Jun 2025 19:35:57 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>,
	Igor Belousov <igor.b@beldev.am>
Subject: [PATCH] mm/zswap: export zswap API to modules
Date: Fri, 20 Jun 2025 21:35:52 +0200
Message-Id: <20250620193552.2772125-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no reason to not let modules use zswap capabilies to
densely store unused pages in RAM. This will allow to remove some
homebrew solutions for e.g. GPU drivers in favor of plainly using
zswap pool.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
Signed-off-by: Igor Belousov <igor.b@beldev.am>
---
 mm/zswap.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/zswap.c b/mm/zswap.c
index 3c0fd8a13718..718d341f7482 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -502,6 +502,7 @@ unsigned long zswap_total_pages(void)
 
 	return total;
 }
+EXPORT_SYMBOL(zswap_total_pages);
 
 static bool zswap_check_limits(void)
 {
@@ -756,6 +757,7 @@ void zswap_folio_swapin(struct folio *folio)
 		atomic_long_inc(&lruvec->zswap_lruvec_state.nr_disk_swapins);
 	}
 }
+EXPORT_SYMBOL(zswap_folio_swapin);
 
 /*
  * This function should be called when a memcg is being offlined.
@@ -1638,6 +1640,7 @@ bool zswap_store(struct folio *folio)
 
 	return ret;
 }
+EXPORT_SYMBOL(zswap_store);
 
 /**
  * zswap_load() - load a folio from zswap
@@ -1718,6 +1721,7 @@ int zswap_load(struct folio *folio)
 	folio_unlock(folio);
 	return 0;
 }
+EXPORT_SYMBOL(zswap_load);
 
 void zswap_invalidate(swp_entry_t swp)
 {
@@ -1752,6 +1756,7 @@ int zswap_swapon(int type, unsigned long nr_pages)
 	zswap_trees[type] = trees;
 	return 0;
 }
+EXPORT_SYMBOL(zswap_swapon);
 
 void zswap_swapoff(int type)
 {
@@ -1769,6 +1774,7 @@ void zswap_swapoff(int type)
 	nr_zswap_trees[type] = 0;
 	zswap_trees[type] = NULL;
 }
+EXPORT_SYMBOL(zswap_swapoff);
 
 /*********************************
 * debugfs functions
-- 
2.39.2

