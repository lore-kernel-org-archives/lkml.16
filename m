Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46803210F59
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 05:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745904283; cv=none; b=uvFNcIaK3swzCLXJ7Ewe39VnlYti2kfsoDrRJoakcIU11RfVoi6hCTCaJtIvOZnK5Amxr1p428sKYEeyCF5PORYH22oP949z2KB9TdeJoJpsuBEz1Rw/AIQaTgmwqDtsqhcC9J37RyAX9KDL1la8UoYmXRnzHgfUCKHIG1O+aDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745904283; c=relaxed/simple;
	bh=FPC3c1UtZeXKvhNu9xElMb/9OS9+eIdnWELS1tZE6Ww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bEasQCUs9VKKaW/FyPcWHkRkL82jjTgzKqHQpSRcq8rDl//Auh0l/JWyCA4o50+sqVuWeep+tAGV35YW/RFwlHaX0fFN24rHxox5kk1wI7VckI5jdHNpP/jU1lO+vev0yi0gsW9d6uanP9zBsf/vhmjHK2UmZZOuEnENN8TMGrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8AEE1515;
	Mon, 28 Apr 2025 22:24:34 -0700 (PDT)
Received: from K4MQJ0H1H2.arm.com (unknown [10.163.78.253])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7C8C03F5A1;
	Mon, 28 Apr 2025 22:24:32 -0700 (PDT)
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
	namit@vmware.com,
	hughd@google.com,
	yang@os.amperecomputing.com,
	ziy@nvidia.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v2 5/7] arm64: Add batched version of ptep_modify_prot_commit
Date: Tue, 29 Apr 2025 10:53:34 +0530
Message-Id: <20250429052336.18912-6-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250429052336.18912-1-dev.jain@arm.com>
References: <20250429052336.18912-1-dev.jain@arm.com>
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

