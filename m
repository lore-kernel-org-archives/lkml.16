Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B241A76D0
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746539075; cv=none; b=K0JlZ9W8IrrX1TTuqw53egN8GN2Pn1fAZiMSirAy837no2C3MlqHydQwYPFDHt2JR0wz95NXsMtZ/MYjUCR41uh97RVcSJvW4neJOqI1+ty4X5UisKLyAnehX36cz1x9vlve627xQ2jOVJxICsOmKsR2WKF5wnvm3neYHZONYIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746539075; c=relaxed/simple;
	bh=DRC3Zo87TXDBJOVIVAvor3EDAyxDRAGUFqYaexF9kzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JvtEohFBnCGrjaTQ4ZOsFLd2E2jNcEauVkwE4xzmmW5delbmE1cpQc962noJmwJI8bkymfErwU2mnZWLMzO02KW+wNmsejbMbVereWT0GNvlAVAmI0x0obCX4ra/2cT7XCpWt/lReEWTrRw2WIr8ideYIW5Qy4EGvfYycBnKsHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUjCQXcu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUjCQXcu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26186C4CEEE;
	Tue,  6 May 2025 13:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746539075;
	bh=DRC3Zo87TXDBJOVIVAvor3EDAyxDRAGUFqYaexF9kzo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JUjCQXcu2ZaYFEyRY35cZ0MLRW13tZnuZgmIm40SrxJkygGdPaeWOYbLa/I6GFqp7
	 li+7sIjFIYlxoB2HSYS9XW3HTbZ5LJQTuSIEEpa6F3xRf12CKzUbis1z5dgAI2CvXb
	 N7Agff+VENIv6pu+K1EvgwIThevxkXXUoV/9t5vVKcXzgpwtkVD4m8jBCUCt2AaSFx
	 R9g3Hs3zlHrr2taoOtQ+NTiZ93AatLOIZ6bQTSEGht/ZeAd0a5Jtvh+YzquL3JMCzs
	 p+FJ3PSTWp9OT4rACqIzP30O3sddifFnIb88MvkrRORPgiPjA9ffO5DOzAHPSs6fYq
	 rH/jDhqUXj+cw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17672C3ABC3;
	Tue,  6 May 2025 13:44:35 +0000 (UTC)
From: Ignacio Moreno Gonzalez via B4 Relay <devnull+Ignacio.MorenoGonzalez.kuka.com@kernel.org>
Date: Tue, 06 May 2025 15:44:33 +0200
Subject: [PATCH v2 2/2] mm: madvise: no-op for MADV_NOHUGEPAGE if THP is
 disabled
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v2-2-f11f0c794872@kuka.com>
References: <20250506-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v2-0-f11f0c794872@kuka.com>
In-Reply-To: <20250506-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v2-0-f11f0c794872@kuka.com>
To: lorenzo.stoakes@oracle.com
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, 
 yang@os.amperecomputing.com, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, 
 Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>, 
 Matthew Wilcox <willy@infradead.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746539072; l=1361;
 i=Ignacio.MorenoGonzalez@kuka.com; s=20220915; h=from:subject:message-id;
 bh=mZUe80SjjB0V+4EVN/Y+dsF/fiezXfRRXC2NP5J4EHM=;
 b=jxT00NHjKAHXYvlci1kq/Iwg3Nujh6KnKh0VA1tFn9F+W21DkyxkRefWe7O0qebY6rwyQ0h6L
 FbxTdmx1iQBC9pqJTsMVAUZvGQdsPZvrTI/h6+7B/GrzTFUVZwsbaWg
X-Developer-Key: i=Ignacio.MorenoGonzalez@kuka.com; a=ed25519;
 pk=j7nClQnc5Q1IDuT4eS/rYkcLHXzxszu2jziMcJaFdBQ=
X-Endpoint-Received: by B4 Relay for
 Ignacio.MorenoGonzalez@kuka.com/20220915 with auth_id=391
X-Original-From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
Reply-To: Ignacio.MorenoGonzalez@kuka.com

From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>

VM_NOHUGEPAGE is a no-op in a kernel without THP. So it makes no sense
to return an error when calling madvise() with MADV_NOHUGEPAGE.

Suggested-by: Matthew Wilcox <willy@infradead.org>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Yang Shi <yang@os.amperecomputing.com>
Signed-off-by: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
---
 include/linux/huge_mm.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index e893d546a49f464f7586db639fe216231f03651a..cdb991f9be918182f94003394cf793654a080224 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -7,6 +7,10 @@
 #include <linux/fs.h> /* only for vma_is_dax() */
 #include <linux/kobject.h>
 
+#ifndef CONFIG_TRANSPARENT_HUGEPAGE
+#include <uapi/asm-generic/mman-common.h>
+#endif
+
 vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf);
 int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		  pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
@@ -598,6 +602,8 @@ static inline bool unmap_huge_pmd_locked(struct vm_area_struct *vma,
 static inline int hugepage_madvise(struct vm_area_struct *vma,
 				   unsigned long *vm_flags, int advice)
 {
+	if (advice == MADV_NOHUGEPAGE)
+		return 0;
 	return -EINVAL;
 }
 

-- 
2.39.5


