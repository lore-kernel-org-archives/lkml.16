Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F24717D2
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 03:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746676343; cv=none; b=AOh3C8PkPlGeKz8BYAcxgfqmJ04QYUC3Gp2tif0Vrk0VyhFPJwUB280WW1hLbU3sfHAXh5hmVLHa1PA3OmyGjqZ8ZBsnAgZd34zY0ipMzAr++etxmR/vWsNDKRHzVzT/vcxLx3XOIhBHifaC8MJdqL22H/25RED6xyt7XdZEqxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746676343; c=relaxed/simple;
	bh=QQrD9WoTuStE5SI4dsDxQm1cAYrTiS8V/dJ/6LSkKvk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a+cJDjCvLU0odS17bVJC6Z3oyofrzWsFy36ig1KVG0EwsuaXzhSpfTevNeEMcFiL5G+oakWt3B/igCEKiAyDWN9fhutJR6XPdWhjmfEVLqMSya+1RfD7OgJ0qHSrP+K9ngjzuXCwouMa7jFDSoAyqZrX/pxnOZDoA01Ou7+Wc68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JAZQBFPQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JAZQBFPQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746676340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oW1Uefy+f4dgCipPdsbyESQqmd5EwkMRGfQFSNX/cxs=;
	b=JAZQBFPQGJhvC8FibGFaOBJebS7BuCS+BaRohhy1O2xEIh4zlNJ9XuecBCvN7GNd672uwd
	YEQLYKVG14Zyss+oMhnMjWB+jw4OFWdwT2ggwA/vw4XaZB3RkkZmiBlghQUDf8n9ODs9dr
	cN6H7w3ZhvAVdcmOU+WDxTNHJh6Pvr4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-161-0n-XLoZXNXCH5N2aVHTTAQ-1; Wed,
 07 May 2025 23:52:16 -0400
X-MC-Unique: 0n-XLoZXNXCH5N2aVHTTAQ-1
X-Mimecast-MFC-AGG-ID: 0n-XLoZXNXCH5N2aVHTTAQ_1746676335
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C77EB180036F;
	Thu,  8 May 2025 03:52:14 +0000 (UTC)
Received: from gshan-thinkpadx1nanogen2.rmtau.csb (unknown [10.64.136.14])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 24E77180049D;
	Thu,  8 May 2025 03:52:08 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	anshuman.khandual@arm.com,
	ryan.roberts@arm.com,
	gshan@redhat.com,
	peterx@redhat.com,
	joey.gouly@arm.com,
	yangyicong@hisilicon.com,
	shan.gavin@gmail.com
Subject: [PATCH] arm64: mm: Drop duplicate check in pmd_trans_huge()
Date: Thu,  8 May 2025 13:51:42 +1000
Message-ID: <20250508035142.189726-1-gshan@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

pmd_val(pmd) is inclusive to pmd_present(pmd) since the PMD entry
value isn't zero when pmd_present() returns true. Just drop the
duplicate check done by pmd_val(pmd).

No functional changes intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
Found this by code inspection
---
 arch/arm64/include/asm/pgtable.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index d3b538be1500..2599b9b8666f 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -739,8 +739,7 @@ static inline int pmd_trans_huge(pmd_t pmd)
 	 * If pmd is present-invalid, pmd_table() won't detect it
 	 * as a table, so force the valid bit for the comparison.
 	 */
-	return pmd_val(pmd) && pmd_present(pmd) &&
-	       !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
+	return pmd_present(pmd) && !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
-- 
2.49.0

