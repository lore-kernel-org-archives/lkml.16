Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301D718B464
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 05:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743658151; cv=none; b=D2euNz4s3Nf9dIvARyX0ADbmOvJVm3WPD19qayJAaUwOq1W003XyeH4UY6NcYAx/d75ju/HkuO/5RXdXXuLjUTCH5P8fX/vpm6dfUNeB0nb3GKT6e2a+M2wq1Rlin3G7ekS6jLDVYjYrgdhwRx92zPBYXQuqIo9rUIqTMrp6LpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743658151; c=relaxed/simple;
	bh=D1TYYNwMGMW3cQvKYmEcax+Gzo3gffvUGzBkP7tjcU8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H8Aj7TWiNTBa7FunPaIiVQIh721gv0povW6ghJGHSzdaAO1co0WuPZBsUmC0pkulbwGxZzEGgIIPbHbeQZOKScurc0221mFvZVBKMjLpACc+TzTfkkKP+Yd+viqIrc6H7l5fCgMViaAb331KOecKo6ITH6b7h4BpVSqyLVNGZ+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A11FF106F;
	Wed,  2 Apr 2025 22:29:10 -0700 (PDT)
Received: from K4MQJ0H1H2.arm.com (unknown [10.163.46.203])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AF28C3F694;
	Wed,  2 Apr 2025 22:29:02 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: gshan@redhat.com,
	rppt@kernel.org,
	steven.price@arm.com,
	suzuki.poulose@arm.com,
	tianyaxiong@kylinos.cn,
	ardb@kernel.org,
	david@redhat.com,
	ryan.roberts@arm.com,
	urezki@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v2] arm64: pageattr: Explicitly bail out when changing permissions for vmalloc_huge mappings
Date: Thu,  3 Apr 2025 10:58:44 +0530
Message-Id: <20250403052844.61818-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arm64 uses apply_to_page_range to change permissions for kernel vmalloc mappings,
which does not support changing permissions for block mappings. This function
will change permissions until it encounters a block mapping, and will bail
out with a warning. Since there are no reports of this triggering, it
implies that there are currently no cases of code doing a vmalloc_huge()
followed by partial permission change. But this is a footgun waiting to
go off, so let's detect it early and avoid the possibility of permissions
in an intermediate state. So,  explicitly disallow changing permissions
for VM_ALLOW_HUGE_VMAP mappings.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Dev Jain <dev.jain@arm.com>
---
v1->v2:
 - Improve changelog, keep mention of page mappings in comment

 arch/arm64/mm/pageattr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 39fd1f7ff02a..04d4a8f676db 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -96,8 +96,8 @@ static int change_memory_common(unsigned long addr, int numpages,
 	 * we are operating on does not result in such splitting.
 	 *
 	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
-	 * Those are guaranteed to consist entirely of page mappings, and
-	 * splitting is never needed.
+	 * Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
+	 * mappings are updated and splitting is never needed.
 	 *
 	 * So check whether the [addr, addr + size) interval is entirely
 	 * covered by precisely one VM area that has the VM_ALLOC flag set.
@@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int numpages,
 	area = find_vm_area((void *)addr);
 	if (!area ||
 	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
-	    !(area->flags & VM_ALLOC))
+	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
 		return -EINVAL;
 
 	if (!numpages)
-- 
2.30.2

