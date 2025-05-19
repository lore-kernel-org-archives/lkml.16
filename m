Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C271D268FF2
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747640961; cv=none; b=koC/Zjl7bZWU1r8ba00OkFi+2EA0Nnum5XnsPPFXA/VlPoAkPTVKPRfYyIiOmYlEfKRd68ANZvt4dP6WQfzAfTai67BOdyUVlzeY8/lzA+9YpRQTl2jvz/6qH6qhHOrTYhQXxqu4Flu2wC/DwQXYQuop4FgHuyybTKNSATMyTmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747640961; c=relaxed/simple;
	bh=FPC3c1UtZeXKvhNu9xElMb/9OS9+eIdnWELS1tZE6Ww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cpboKvOdArL/+RbwRHNefL+c5mctTQEXG/u6AA2txlDkSoq2PKEjIFOnQsuEJzCrPhaFHIlFopzdqLmSVTZYEeN5G9CLitY8eb7N5jy7dSJeToWwStgaz+mP9GRLyu4ukMhE9VdKALKGtA7MOtYHxyj0s1LNtrXLobx9K2/M4IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08DE914BF;
	Mon, 19 May 2025 00:49:04 -0700 (PDT)
Received: from K4MQJ0H1H2.blr.arm.com (unknown [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5ADCB3F6A8;
	Mon, 19 May 2025 00:49:10 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org
Cc: ryan.roberts@arm.com,
	david@redhat.com,
	willy@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	jannh@google.com,
	anshuman.khandual@arm.com,
	peterx@redhat.com,
	joey.gouly@arm.com,
	ioworker0@gmail.com,
	baohua@kernel.org,
	kevin.brodsky@arm.com,
	quic_zhenhuah@quicinc.com,
	christophe.leroy@csgroup.eu,
	yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	hughd@google.com,
	yang@os.amperecomputing.com,
	ziy@nvidia.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v3 5/5] arm64: Add batched version of ptep_modify_prot_commit
Date: Mon, 19 May 2025 13:18:24 +0530
Message-Id: <20250519074824.42909-6-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250519074824.42909-1-dev.jain@arm.com>
References: <20250519074824.42909-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Override the generic definition to simply use set_ptes() to map the new
ptes into the pagetable.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 5 +++++
 arch/arm64/mm/mmu.c              | 9 ++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 8872ea5f0642..0b13ca38f80c 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1558,6 +1558,11 @@ extern pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
 				    unsigned long addr, pte_t *ptep,
 				    unsigned int nr);
 
+#define modify_prot_commit_ptes modify_prot_commit_ptes
+extern void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
+				    pte_t *ptep, pte_t old_pte, pte_t pte,
+				    unsigned int nr);
+
 #ifdef CONFIG_ARM64_CONTPTE
 
 /*
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index fe60be8774f4..5f04bcdcd946 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1543,10 +1543,17 @@ pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte
 	return modify_prot_start_ptes(vma, addr, ptep, 1);
 }
 
+void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
+			     pte_t *ptep, pte_t old_pte, pte_t pte,
+			     unsigned int nr)
+{
+	set_ptes(vma->vm_mm, addr, ptep, pte, nr);
+}
+
 void ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep,
 			     pte_t old_pte, pte_t pte)
 {
-	set_pte_at(vma->vm_mm, addr, ptep, pte);
+	modify_prot_commit_ptes(vma, addr, ptep, old_pte, pte, 1);
 }
 
 /*
-- 
2.30.2

