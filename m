Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB60A1DE3A7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743408848; cv=none; b=ad/jjGBFRQ431D+zSmOgCYJLWoQsHeayv9EZUfXBD3pdEOvVsgJiz7mtv2HJTC6rtFGEYg90t5KrazTgZbnYVyIuHa0luYCr+89CJfqUWP1NO4ihMOFfRSjFtmOl2wbQ8n5NwamcCjxllcQTr4EgtHlZjiYyBBGYFbQ4hQi6E8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743408848; c=relaxed/simple;
	bh=rOJme/OQhDMLRrQUMibTj5b1tkGHYT9StiBjDjLtnS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=XdXAkBqU+Lh0g0Pq1F0qMu7pnNxeNdRDzcUtTEEdjwQE1m4yJj2jrIglyNKea2qgGULS2cVhyLW2LdwFLkIiLFU6DVNkEZ5LNKPtI/yKFmRPtbVj3B2VTm9reUp+3t4frk9/kpNCMX2w8fw4NEppGZJ3Avp0TRcTezvT2tROLTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WW+vZ+eB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WW+vZ+eB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743408845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lU8XHCD/pp6vsb0Fo6FpwHmvpoSyWoqbMK/saKstTlg=;
	b=WW+vZ+eB2BHxptcmnFDfonOxjAnOdaZJw43LrRMA9LOvfU//auiGunhGm7WHSAxAAkcLiT
	KLYRlj6LtR1+uQSIIrcXG79KC0yPoqBCXb6UEKdZ6z0yVvp1yHMuDY+L/8+8Erl7oYKgQN
	ZoqJaNjgsCDOKK1dv5KWrPYS2Bl6lvA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-624-w3DzhzJnOJmOe7Q5-csrBw-1; Mon,
 31 Mar 2025 04:14:02 -0400
X-MC-Unique: w3DzhzJnOJmOe7Q5-csrBw-1
X-Mimecast-MFC-AGG-ID: w3DzhzJnOJmOe7Q5-csrBw_1743408840
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CD80D180AB16;
	Mon, 31 Mar 2025 08:14:00 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.9])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4F53D1955BEF;
	Mon, 31 Mar 2025 08:13:56 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	yanjun.zhu@linux.dev,
	Baoquan He <bhe@redhat.com>,
	x86@kernel.org
Subject: [PATCH v2 6/7] x86/mm: remove p4d_leaf definition
Date: Mon, 31 Mar 2025 16:13:26 +0800
Message-ID: <20250331081327.256412-7-bhe@redhat.com>
In-Reply-To: <20250331081327.256412-1-bhe@redhat.com>
References: <20250331081327.256412-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

There's no p4d huge page support yet, let's use the generic definition.

And also update the BUILD_BUG_ON() in pti_user_pagetable_walk_pmd()
because p4d_leaf() returns boolean value.

Signed-off-by: Baoquan He <bhe@redhat.com>
Cc: x86@kernel.org
---
 arch/x86/include/asm/pgtable.h | 7 -------
 arch/x86/mm/pti.c              | 2 +-
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 5f4fcc0eea17..5ddba366d3b4 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -292,13 +292,6 @@ static inline unsigned long pgd_pfn(pgd_t pgd)
 	return (pgd_val(pgd) & PTE_PFN_MASK) >> PAGE_SHIFT;
 }
 
-#define p4d_leaf p4d_leaf
-static inline bool p4d_leaf(p4d_t p4d)
-{
-	/* No 512 GiB pages yet */
-	return 0;
-}
-
 #define pte_page(pte)	pfn_to_page(pte_pfn(pte))
 
 #define pmd_leaf pmd_leaf
diff --git a/arch/x86/mm/pti.c b/arch/x86/mm/pti.c
index c2e1de40136f..190299834011 100644
--- a/arch/x86/mm/pti.c
+++ b/arch/x86/mm/pti.c
@@ -206,7 +206,7 @@ static pmd_t *pti_user_pagetable_walk_pmd(unsigned long address)
 	if (!p4d)
 		return NULL;
 
-	BUILD_BUG_ON(p4d_leaf(*p4d) != 0);
+	BUILD_BUG_ON(p4d_leaf(*p4d));
 	if (p4d_none(*p4d)) {
 		unsigned long new_pud_page = __get_free_page(gfp);
 		if (WARN_ON_ONCE(!new_pud_page))
-- 
2.41.0

