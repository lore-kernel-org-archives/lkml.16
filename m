Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F771A00E7
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822257; cv=none; b=m1DvWwBN+2yP5gdKgF6qgZWoions2H05cWjk/LzaY0tHlpQ0NnlN2s8cs1afAb8u2I4l5maa+CR7dldoeSZRTGtGXKBW6RjOncI7R9XpXxos8b4iz+d7x9z9b807CbfQzg4dJQC+FHDyAruOAcfB/6HSF8p88NAc0qVMt8Ky6gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822257; c=relaxed/simple;
	bh=k2bCB2RhNxgQyhR/9M/ePVPKiQkg1dxqcww0EiPUw1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oHlflzsD1fzDw33rYBkz/LOCUNHpXqQyGreSDVoVLLOHOTk7J5yNV3K6CGEvnNyc0neV3x9wuVwS7CUeZ8QCeFr2vuV9sS7lFOFM48k95/AQrWlPzT4bYitITtQT+MnF2kPmggjVKegWqwsENP1U5bc7Ea8NhjPR2U3LK2Sf9bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 462562B;
	Fri, 13 Jun 2025 06:43:54 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 07BAB3F59E;
	Fri, 13 Jun 2025 06:44:08 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com,
	steven.price@arm.com,
	gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	yang@os.amperecomputing.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v3 2/2] arm64: pageattr: Enable huge-vmalloc permission change
Date: Fri, 13 Jun 2025 19:13:52 +0530
Message-Id: <20250613134352.65994-3-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250613134352.65994-1-dev.jain@arm.com>
References: <20250613134352.65994-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit fcf8dda8cc48 ("arm64: pageattr: Explicitly bail out when changing
permissions for vmalloc_huge mappings") disallowed changing permissions
for vmalloc-huge mappings. The motivation of this was to enforce an API
requirement and explicitly tell the caller that it is unsafe to change
permissions for block mappings since splitting may be required, which
cannot be handled safely on an arm64 system in absence of BBML2.

This patch effectively partially reverts this commit, since patch 1
will now enable permission changes on kernel block mappings, thus,
through change_memory_common(), enable permission changes for vmalloc-huge
mappings. Any caller "misusing" the API, in the sense, calling it for
a partial block mapping, will receive an error code of -EINVAL via
the pagewalk callbacks, thus reverting to the behaviour of the API
itself returning -EINVAL, through apply_to_page_range returning -EINVAL
in case of block mappings, the difference now being, the -EINVAL is
restricted to playing permission games on partial block mappings
courtesy of patch 1.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/mm/pageattr.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index cfc5279f27a2..66676f7f432a 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -195,8 +195,6 @@ static int change_memory_common(unsigned long addr, int numpages,
 	 * we are operating on does not result in such splitting.
 	 *
 	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
-	 * Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
-	 * mappings are updated and splitting is never needed.
 	 *
 	 * So check whether the [addr, addr + size) interval is entirely
 	 * covered by precisely one VM area that has the VM_ALLOC flag set.
@@ -204,7 +202,7 @@ static int change_memory_common(unsigned long addr, int numpages,
 	area = find_vm_area((void *)addr);
 	if (!area ||
 	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
-	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
+	    !(area->flags & VM_ALLOC))
 		return -EINVAL;
 
 	if (!numpages)
-- 
2.30.2

