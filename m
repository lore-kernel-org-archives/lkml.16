Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8759239E7A
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 08:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746694394; cv=none; b=uMTSFF39yVtExBmG+sVhzvjBBWAuh9d5+5PB4dCdMGjITMqvd0JuRn29k9HH4DwG/oKphGLVs+KH8M+i/LytYEsWAC7eM/apjNwLWoo91dPC3P4TMODWeBql7brxV0dTErX+QNQlvFr90pk34NTZbNYkSFbVGBTylxmuzj4E8uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746694394; c=relaxed/simple;
	bh=6gyI/W0MslTW+djiko89d4ipLYeSmrx1kpehxFoOwT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kIli8eJe2bwOgVNcH4c2gd6OfJfalApnuuDmf1DOmBomhb5eQh83s6IT7n1nICxCMSnxYlaYfI06tEpROX6oKhcJhksjucqQfaKg2ySniRLWyHbE7kF5p0PvYxsc27dXs35xwroni/JT5b1c3J04+r40uxvkdUadiCYqNZ/FH1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IZNjBkw3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IZNjBkw3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746694391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XjnlXfHduLY+rrmKH9+0EuauvU+FcYu+CLRTJgWmNn0=;
	b=IZNjBkw3wXPpFEZzxgs8BBwvdFgY60RtJ/GkjJBDFmDu03vinj2z/HlVow70nUT0BeM8Ff
	9qHeJV1PQFyjuItbcV7hlesRweAu8B9zTyJqPu+eqfLWvySJOzircoAiuzzYPIYMKMbLOB
	qlRLUuqTzbcyze+dzuiFqzEDgbnb74g=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-494-kdACPehFNBSx2-OB9Bo3hQ-1; Thu,
 08 May 2025 04:53:08 -0400
X-MC-Unique: kdACPehFNBSx2-OB9Bo3hQ-1
X-Mimecast-MFC-AGG-ID: kdACPehFNBSx2-OB9Bo3hQ_1746694386
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3168C1956086;
	Thu,  8 May 2025 08:53:06 +0000 (UTC)
Received: from gshan-thinkpadx1nanogen2.rmtau.csb (unknown [10.64.136.14])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8C5DC19560B4;
	Thu,  8 May 2025 08:52:59 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	anshuman.khandual@arm.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	gshan@redhat.com,
	peterx@redhat.com,
	joey.gouly@arm.com,
	yangyicong@hisilicon.com,
	shan.gavin@gmail.com
Subject: [PATCH v2] arm64: mm: Drop redundant check in pmd_trans_huge()
Date: Thu,  8 May 2025 18:52:51 +1000
Message-ID: <20250508085251.204282-1-gshan@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

pmd_val(pmd) is redundant because a positive pmd_present(pmd) ensures
a positive pmd_val(pmd) according to their definitions like below.

  #define pmd_val(x)       ((x).pmd)
  #define pmd_present(pmd) pte_present(pmd_pte(pmd))
  #define pte_present(pte) (pte_valid(pte) || pte_present_invalid(pte))
  #define pte_valid(pte)   (!!(pte_val(pte) & PTE_VALID))
  #define pte_present_invalid(pte) \
          ((pte_val(pte) & (PTE_VALID | PTE_PRESENT_INVALID)) == PTE_PRESENT_INVALID)

pte_present() can't be positive unless either of the flag PTE_VALID or
PTE_PRESENT_INVALID is set. In this case, pmd_val(pmd) should be positive
either.

So lets drop the redundant check pmd_val(pmd) and no functional changes
intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
v1: https://lore.kernel.org/linux-arm-kernel/4e5941f8-7e61-4a63-a669-bee1601093a6@arm.com/T/#u
v2: Improved commit log per Anshuman
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

