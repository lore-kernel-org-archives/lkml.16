Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61ABE1946A0
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750210951; cv=none; b=WWJ/QnI1vqld/tito35LB/D1VQrJjAO1A4UihX1XaEN3yi15Dcacs+bBTdBvnPFwKmXoPPq3FJydznrverz8ijnwWpHogyGvByXJTUXwmYivOFNTnaIoSkePBjEYGOMDq6sVWJWG2ku35JFCk/SJ/fJ/6KxnODk/nSTvHBsFi4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750210951; c=relaxed/simple;
	bh=/X3qnG89234nHayoEZuUoAvqhTyOwJjAY3T0EusUN0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kdc8zPKztZCK6fVe2YWUrd1gGVs/eZgfePO6DIF9hw0/XaXIy6Gme0OA+DIb6VhNViklNb9O6ett+1KO6cSP0FjmJztTZ30dvkSbOxFFisMD338Sy0tmAyMWZyaiZrlNYWTqornO+qyp6On49w6lx//rnDZZU+1KDqQL9AUSYE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7626f4dc4be511f0b29709d653e92f7d-20250618
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:5a4eb028-ca1d-486a-868c-0e7b966aa42d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:037b4d222d62ec063d42457b7b860325,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7626f4dc4be511f0b29709d653e92f7d-20250618
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <jiangyunshui@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 478954252; Wed, 18 Jun 2025 09:42:15 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id CB251E00891C;
	Wed, 18 Jun 2025 09:42:14 +0800 (CST)
X-ns-mid: postfix-68521976-658634177
Received: from kylin-pc.. (unknown [172.25.130.133])
	by mail.kylinos.cn (NSMail) with ESMTPA id 497DFE008900;
	Wed, 18 Jun 2025 09:42:13 +0800 (CST)
From: Yunshui Jiang <jiangyunshui@kylinos.cn>
To: linux-kernel@vger.kernel.org,
	linux-mm@vack.org
Cc: akpm@linux-foundation.org,
	david@redhat.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	jiangyunshui <jiangyunshui@kylinos.cn>
Subject: [PATCH] mm: Inline vma_needs_copy
Date: Wed, 18 Jun 2025 09:42:09 +0800
Message-ID: <20250618014209.1195734-1-jiangyunshui@kylinos.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: jiangyunshui <jiangyunshui@kylinos.cn>

Since commit bcd51a3c679d ("hugetlb: lazy page table copies
in fork()"), the logic about judging whether to copy
page table inside func copy_page_range has been extracted
into a separate func vma_needs_copy. While this change
improves code readability, it also incurs more function call
overhead, especially where fork() were frequently called.

Inline func vma_needs_copy to optimize the copy_page_range
performance. Given that func vma_needs_copy is only called
by copy_page_range, inlining it would not cause unacceptable
code bloat.

Testing was done with the byte-unixbench spawn benchmark
(which frequently calls fork). I measured 1.7% improvement
on x86 and 1.8% improvement on arm64.

Signed-off-by: jiangyunshui <jiangyunshui@kylinos.cn>
---
 mm/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index 8eba595056fe..d15b07f96ab1 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1337,7 +1337,7 @@ copy_p4d_range(struct vm_area_struct *dst_vma, stru=
ct vm_area_struct *src_vma,
  * false when we can speed up fork() by allowing lazy page faults later =
until
  * when the child accesses the memory range.
  */
-static bool
+static __always_inline bool
 vma_needs_copy(struct vm_area_struct *dst_vma, struct vm_area_struct *sr=
c_vma)
 {
 	/*
--=20
2.47.1

