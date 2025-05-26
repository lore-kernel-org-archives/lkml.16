Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC171C5F35
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748242523; cv=none; b=cSwReBJm4mljDTXD5r00cUKmDjZgOs7hFVRXyALSLTN8wqfxiYkpYMOFs3AMntlfxzs5JSu38LEh3ge8deixZrsxO/SsPrNUOXSrnTza+XY3nfH2pFGbOjeYuampNt668k5aMpRlH9Hk5Ea5ut05avz9wOcoUSSHSsS1iONHznI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748242523; c=relaxed/simple;
	bh=11uRemiH4yPMy8oCJMxXpaySk1ix9Nd4b3Ls/kbEcvs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GWioRoHnm4BCNAIfGF/eTo3s03B6zLWn2GKbhOcuuHKA9uCGy1Z3zTY897YdG/7FrZYUPur1uUKnhuMHutrIITpmsJrDXnV8q7c7R6BU8Pw2ZII+T3oyQFdm4BwlnQCh3JxsmG1zD5p29yTaisk2z3Rj+CNAJTJmj/3M+CTVnzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.10.34])
	by gateway (Coremail) with SMTP id _____8Axx2lVEDRo+JX8AA--.45027S3;
	Mon, 26 May 2025 14:55:17 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.10.34])
	by front1 (Coremail) with SMTP id qMiowMCx7MRREDRolR3yAA--.32845S2;
	Mon, 26 May 2025 14:55:16 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	zhanghongchen@loongson.cn,
	wangming01@loongson.cn,
	peterx@redhat.com
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhangtianyang <zhangtianyang@loongson.cn>
Subject: [PATCH] Loongarch:Fixed up panic cause by a NULL-pmd
Date: Mon, 26 May 2025 14:55:12 +0800
Message-Id: <20250526065512.13215-1-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCx7MRREDRolR3yAA--.32845S2
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ww1fur4ktryUCFyftry8tFc_yoW8Wr1kpr
	y7C3Z5Gr40yryDJa17AFWkZFn7XasFkF4kW3Z2ya4DZwnxtw1jqFy8JwnI9F48ArWrJ3y0
	9F45Ka9YqF1UJagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8r9N3UUUUU==

From: zhangtianyang <zhangtianyang@loongson.cn>

Fixes: bd51834d1cf6 ("LoongArch: Return NULL from huge_pte_offset() for invalid PMD")
ERROR INFO:

CPU 25 Unable to handle kernel paging request at virtual address 0x0
         ...
 Call Trace:
 [<900000000023c30c>] huge_pte_offset+0x3c/0x58
 [<900000000057fd4c>] hugetlb_follow_page_mask+0x74/0x438
 [<900000000051fee8>] __get_user_pages+0xe0/0x4c8
 [<9000000000522414>] faultin_page_range+0x84/0x380
 [<9000000000564e8c>] madvise_vma_behavior+0x534/0xa48
 [<900000000056689c>] do_madvise+0x1bc/0x3e8
 [<9000000000566df4>] sys_madvise+0x24/0x38
 [<90000000015b9e88>] do_syscall+0x78/0x98
 [<9000000000221f18>] handle_syscall+0xb8/0x158

In some cases, pmd may be NULL and rely on NULL as the return value
for processing, so it is necessary to determine this situation here
Signed-off-by: zhangtianyang <zhangtianyang@loongson.cn>
---
 arch/loongarch/mm/hugetlbpage.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/mm/hugetlbpage.c b/arch/loongarch/mm/hugetlbpage.c
index cea84d7f2b91..02dad4624fe3 100644
--- a/arch/loongarch/mm/hugetlbpage.c
+++ b/arch/loongarch/mm/hugetlbpage.c
@@ -47,7 +47,8 @@ pte_t *huge_pte_offset(struct mm_struct *mm, unsigned long addr,
 				pmd = pmd_offset(pud, addr);
 		}
 	}
-	return pmd_none(pmdp_get(pmd)) ? NULL : (pte_t *) pmd;
+
+	return (!pmd || pmd_none(pmdp_get(pmd))) ? NULL : (pte_t *) pmd;
 }
 
 uint64_t pmd_to_entrylo(unsigned long pmd_val)
-- 
2.20.1

