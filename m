Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E257922A7F6
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747683; cv=none; b=cy3iNMWgPfAOEsVtHJBNAZnVxrmDlRQzPdmVaN46nFWAJcB5rWKEwbKiWQi+u7vTIA985tuK8aayFo8fH9k+FHfWW5WcZ3hgkeG5EeQlbdKg398uTpbAA7x8NptjqMP61SkdKERwv/6LPAlJGGnpTBJP2gob6VoqcF0QQUhGbzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747683; c=relaxed/simple;
	bh=wNhf7XUUgQ3kmQA81fx0E5cWJPTz9i5xPoSFlHQOsaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=Wj1xZWKgz+sYGH5zdifaH1z2DdFtDw95zFV8/mLvC2QwSfmtsQdcJXkKGJhlU1Sxpq06Ukw4Ku9wGBg8BX3/qNAv6jN4nZZQIO+ww3nQ40ORb6DwNs9XX3B82Q5wwsoSBAxC2Q7AnissfmyeQReMxCE5iKdeCVISGOKO1h3dBM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OfDysnf9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OfDysnf9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738747680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R7Vvp9EGlv2TMusLr7Im3+AMRbyPEdy+5VUuaPm2KpI=;
	b=OfDysnf9aKMgygDqUQKnwiFtMSYDjA029mp8M8BjlAEelx3qbSNYV/ya6aeZXoI2laKrLR
	ZL3P0DfbZxxGjRSM4AR/Nh6TkBjwuMopZtpzS+7Qn7qEVKIbRyfCvhJAb87cZ43aKmQnxS
	e4l5JlzFvDXp5/Jp5z3UBi1qyXLvOFQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-343-SbABTzTlOh2KRzsfQVnkxA-1; Wed,
 05 Feb 2025 04:27:55 -0500
X-MC-Unique: SbABTzTlOh2KRzsfQVnkxA-1
X-Mimecast-MFC-AGG-ID: SbABTzTlOh2KRzsfQVnkxA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 153DD1955D86;
	Wed,  5 Feb 2025 09:27:53 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.72.112.190])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4E542300018D;
	Wed,  5 Feb 2025 09:27:48 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	ryncsn@gmail.com,
	chrisl@kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 05/12] mm/swap: rename swap_is_has_cache() to swap_only_has_cache()
Date: Wed,  5 Feb 2025 17:27:14 +0800
Message-ID: <20250205092721.9395-6-bhe@redhat.com>
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

There are two predicates in the name of swap_is_has_cache() which
is confusing. Renaming it to remove the confusion and can better
reflect its functionality.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/swapfile.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 61efde853eea..bf284ba16198 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -161,7 +161,7 @@ static long swap_usage_in_pages(struct swap_info_struct *si)
 /* Reclaim directly, bypass the slot cache and don't touch device lock */
 #define TTRS_DIRECT		0x8
 
-static bool swap_is_has_cache(struct swap_info_struct *si,
+static bool swap_only_has_cache(struct swap_info_struct *si,
 			      unsigned long offset, int nr_pages)
 {
 	unsigned char *map = si->swap_map + offset;
@@ -243,7 +243,7 @@ static int __try_to_reclaim_swap(struct swap_info_struct *si,
 	 * reference or pending writeback, and can't be allocated to others.
 	 */
 	ci = lock_cluster(si, offset);
-	need_reclaim = swap_is_has_cache(si, offset, nr_pages);
+	need_reclaim = swap_only_has_cache(si, offset, nr_pages);
 	unlock_cluster(ci);
 	if (!need_reclaim)
 		goto out_unlock;
@@ -1572,7 +1572,7 @@ void put_swap_folio(struct folio *folio, swp_entry_t entry)
 		return;
 
 	ci = lock_cluster(si, offset);
-	if (swap_is_has_cache(si, offset, size))
+	if (swap_only_has_cache(si, offset, size))
 		swap_entry_range_free(si, ci, entry, size);
 	else {
 		for (int i = 0; i < size; i++, entry.val++) {
-- 
2.41.0

