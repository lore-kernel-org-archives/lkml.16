Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F9A26ACD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744191650; cv=none; b=Q7QxqcK9dz/m2Ri9JXpKYKK0blM7DtJpz0kae2IJNe8MnYDZDtBuU5meD6AhoZf381JKGhG4RIFEr/zMOsIg9JJ3RKkQH75AxYbhQHmLU7iS0rs6LIbSuP1NfdHL9EpACuQYR6qhm5RMXR7KAXsrMFEY5MXlHaOX2REYoNunrGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744191650; c=relaxed/simple;
	bh=PTVJmVQqpnj8Bm9p3g0pk9IQuoaZ0/Y11py3fIv/s3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L/F+E0+nln6+wpWwv3Dh2UkW0a6vJz8p4fK29RZOq7vBQ18grIOEVuvbTTQjFUAFgG42dq8BvlMRzhm+izTOVKUbKibgYrBlwDY4NvgIwMgRM0wb8Q3ABu0LgWixF7yBg5d6BgPN+XL93GOuSUx5Zb/olj+n1wkl0OPecWV21DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QmXvvuXx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QmXvvuXx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744191649; x=1775727649;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PTVJmVQqpnj8Bm9p3g0pk9IQuoaZ0/Y11py3fIv/s3M=;
  b=QmXvvuXxnhwlKUQidY96SxHMa3qtnGRx5BU/Tlz0PKT9znXqiW4hx2sV
   ofFdKx8BUfOMM39DOiSeqT8wiTUZxNbSYhXjykyjVJTeYXt1ep6SPeXnx
   fOTgqhSJFJtNt0iXWSnm9mItGQAVB3yK4OZ/DVQGoOShQHEe0fUZ6ulUk
   WNHm3mSpoqpCVIInOKVxzZ3m5k9StcNoH90cCk1UWTzqCPp1B1E7O+uvx
   1Mbm3BxD8EElt/Wwg6Q1mf5AbyvHHt6imqkmG0ZXguLtD4jmjK7IWtZmo
   w/PEuv4ikS4ch1AKBauy10+xcFoHDPnubTsKmWzxWQ14r9REZJHVo5y/6
   g==;
X-CSE-ConnectionGUID: UQ3M4HkvTwS6jSomAHFz6g==
X-CSE-MsgGUID: THDXm8MIRg6O3XUJd1xsSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45748554"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45748554"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 02:40:48 -0700
X-CSE-ConnectionGUID: k5+7JSNwTkuDwtGY5PRzcw==
X-CSE-MsgGUID: N33Oa6r3RXm8FUWGlTJBqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="128878002"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 09 Apr 2025 02:40:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 34305473; Wed, 09 Apr 2025 12:40:45 +0300 (EEST)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Daniel Axtens <dja@axtens.net>
Subject: [PATCH] mm: fix apply_to_existing_page_range()
Date: Wed,  9 Apr 2025 12:40:43 +0300
Message-ID: <20250409094043.1629234-1-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the case of apply_to_existing_page_range(), apply_to_pte_range() is
reached with 'create' set to false. When !create, the loop over the PTE
page table is broken.

apply_to_pte_range() will only move to the next PTE entry if 'create' is
true or if the current entry is not pte_none().

This means that the user of apply_to_existing_page_range() will not have
'fn' called for any entries after the first pte_none() in the PTE page
table.

Fix the loop logic in apply_to_pte_range().

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Fixes: be1db4753ee6 ("mm/memory.c: add apply_to_existing_page_range() helper")
Cc: Daniel Axtens <dja@axtens.net>
---
 mm/memory.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index fb7b8dc75167..2094564f4dfb 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2907,11 +2907,11 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 	if (fn) {
 		do {
 			if (create || !pte_none(ptep_get(pte))) {
-				err = fn(pte++, addr, data);
+				err = fn(pte, addr, data);
 				if (err)
 					break;
 			}
-		} while (addr += PAGE_SIZE, addr != end);
+		} while (pte++, addr += PAGE_SIZE, addr != end);
 	}
 	*mask |= PGTBL_PTE_MODIFIED;
 
-- 
2.47.2

