Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1548F1FDA8E
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746699629; cv=none; b=CDLNeLPSlzv2ZpTgfZpcbyzIV/kUhIP8ljdHzqwr+l6JqP3rFylA4cIGH1yT24uOYsAJIhXbD7Fjsetrd+1UG9ohO3BBY0ASoDRHEwKfVIkU+4kQFA7/Gq0inUmlSABy9Ihaik0YvtI5+GB9lCYAOt8lCdQfIV/haVWQtEOQPe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746699629; c=relaxed/simple;
	bh=EKC1MDZgWrXQlaptwmHFpj1K0dZR4L3pRVAVi3OGh3g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Uomzr8JAqFD5bRfxceg06bH9AJKYHN07W+lIOO5dCjdFIkeXMyEj/rGsd30pZ26GWkr/bY3CLu0AGYBpGyRh6ZkUgYocpkS4wQQsDe0HmBK5beD2YUcQ0zA4RJcW4FFPlN60C0SHqPb0dIicMIR3rC+lcpjhdgKAr0gqqXiWjEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZmZtDPx0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZmZtDPx0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CF15C4CEE9;
	Thu,  8 May 2025 10:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746699628;
	bh=EKC1MDZgWrXQlaptwmHFpj1K0dZR4L3pRVAVi3OGh3g=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ZmZtDPx0UYHhqyOZvTCFRafPrgyp3NpA/za8Qyht092GGbwuXvcdGdqTSa4aMDno+
	 MyOLuQWMpkvTIVdpLDsddNm2u4Bx3ZIF+eqV8ERFaS4FbPNbRMpxojd7usHcvNLVca
	 pMkxthIHhcmbfLCUjS3ROkBd08gd8bikTVkNgfRxPrzwEHCzDx3btVXwQ+7hpIWPZz
	 Bh1VIuY8Bvr37qupJOfHMVkrMIMgnJ00pCkIslQtyYQMxh2lGjLZZ2V0RChSJLzA1V
	 2w62dIOkqNoLmeXLxckuOBxCTCTATVTsUKRB3WGFH5nqAJK0vd91N0ommKPMmjtLoe
	 ZANEmp9/GYu2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D3CC3ABBE;
	Thu,  8 May 2025 10:20:28 +0000 (UTC)
From: Ignacio Moreno Gonzalez via B4 Relay <devnull+Ignacio.MorenoGonzalez.kuka.com@kernel.org>
Date: Thu, 08 May 2025 12:20:27 +0200
Subject: [PATCH] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
X-B4-Tracking: v=1; b=H4sIAGqFHGgC/x2NwQqFIBBFfyVm3YAZUb1febSwnHQWqai9F0T/n
 rU7Bw73npAoMiX4VCdE+nFi74o0dQWLVc4Qsi4OUshOdGLATelSETpvd0NBmQd9wD9n6/eM2QY
 k0ctmHvtWDxLKUoi08vG+fKfrugGPv6WIdQAAAA==
X-Change-ID: 20250508-madvise-nohugepage-noop-without-thp-e0721b973d82
To: Andrew Morton <akpm@linux-foundation.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: yang@os.amperecomputing.com, willy@infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, 
 Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746699627; l=1782;
 i=Ignacio.MorenoGonzalez@kuka.com; s=20220915; h=from:subject:message-id;
 bh=WkzJ0m077QxoI+DJujIZqVZ01oTbN6BGwiqxdFPO/Rw=;
 b=HOKlWk8Cdb9oLxFnVCfZg9m12ukVQDxIoiovVUj19FPzBgRmFxHHXyOSU5Q53OjwdQhCgF4zV
 awvIV6P9FYcCxg4MhvNDpGrgPL5lXCBVucnaF5yKAtHrhHwQSEiMk/F
X-Developer-Key: i=Ignacio.MorenoGonzalez@kuka.com; a=ed25519;
 pk=j7nClQnc5Q1IDuT4eS/rYkcLHXzxszu2jziMcJaFdBQ=
X-Endpoint-Received: by B4 Relay for
 Ignacio.MorenoGonzalez@kuka.com/20220915 with auth_id=391
X-Original-From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
Reply-To: Ignacio.MorenoGonzalez@kuka.com

From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>

VM_NOHUGEPAGE is a no-op if CONFIG_TRANSPARENT_HUGEPAGE is disabled. So
it makes no sense to return an error when calling madvise() with
MADV_NOHUGEPAGE in that case.

Suggested-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
---
https://lore.kernel.org/linux-mm/20250502-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com

Here it is presented as a separate thread to avoid mixing stable and
non-stable patches.

This change makes calling madvise(addr, size, MADV_NOHUGEPAGE) on !THP
kernels to return 0 instead of -EINVAL.
---
 include/linux/huge_mm.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index e893d546a49f464f7586db639fe216231f03651a..5fca742dc5ba784ffccea055b07247707d16cc67 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -509,6 +509,8 @@ bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
 
 #else /* CONFIG_TRANSPARENT_HUGEPAGE */
 
+#include <uapi/asm/mman.h>
+
 static inline bool folio_test_pmd_mappable(struct folio *folio)
 {
 	return false;
@@ -598,6 +600,9 @@ static inline bool unmap_huge_pmd_locked(struct vm_area_struct *vma,
 static inline int hugepage_madvise(struct vm_area_struct *vma,
 				   unsigned long *vm_flags, int advice)
 {
+	/* On a !THP kernel, MADV_NOHUGEPAGE is a no-op, but MADV_NOHUGEPAGE is not supported */
+	if (advice == MADV_NOHUGEPAGE)
+		return 0;
 	return -EINVAL;
 }
 

---
base-commit: fc96b232f8e7c0a6c282f47726b2ff6a5fb341d2
change-id: 20250508-madvise-nohugepage-noop-without-thp-e0721b973d82

Best regards,
-- 
Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>


