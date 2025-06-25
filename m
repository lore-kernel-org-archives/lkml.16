Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE94015A86B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750831104; cv=none; b=OjG9U8cr1r8DGAH8gXJWt4mTsvKrWNzehd6qebHOLwOm6BlW84s7+JU1QjnMzlgyjiZnLUfXHNgUPoMGf8DmJnpDPl4faCp+YvIzz4U+OBLo9YORiX0crDxz82IABI3Wvcxc2z1u8cZsc7rMAz+1E+EI6Nd6PXx8okeboiYRM0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750831104; c=relaxed/simple;
	bh=dR/yVb8mTKGFPybcX74TjTQAJnnoN5vVU6+SuKY1VSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BnXJkC0EnqnUcaVxCP4E26mIRe4S8tAmAZw9OQ12qsFFY+Tot24AUKtagvIFji6nfDT+c1B34LFjeeFL+LahFSBv8DWI1bPQq1ZZSsi4Mvv9P1rfioNyFN3qhzl8Ml21SEL5Ulh1eqNvBA7PqW58/5LKJ1I6L7ToyLt6LN4eZEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 083321063;
	Tue, 24 Jun 2025 22:58:04 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 54A243F63F;
	Tue, 24 Jun 2025 22:58:18 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@redhat.com
Cc: ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	baohua@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v2 0/3] Optimizations for khugepaged
Date: Wed, 25 Jun 2025 11:28:03 +0530
Message-Id: <20250625055806.82645-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series uses PTE batching to optimize two functions, and
also addresses a race condition.

---
@David I did not make the clear_full_ptes clean up since that will require
some more work than I originally thought :)

v1->v2:
 - Use for loop instead of do-while loop (Lorenzo)
 - Remove folio_test_large check since the subpage-check condition
   will imply that (Baolin)
 - Combine patch 1 and 2 into this series, add new patch 3

Dev Jain (3):
  khugepaged: Optimize __collapse_huge_page_copy_succeeded() by PTE
    batching
  khugepaged: Optimize collapse_pte_mapped_thp() for large folios by PTE
    batching
  khugepaged: Reduce race probability between migration and khugepaged

 mm/khugepaged.c | 77 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 57 insertions(+), 20 deletions(-)

-- 
2.30.2

