Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104731A3A8A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743142880; cv=none; b=DMRLzomkk3Opxk+2WOff0O509b5USSBYiYNIl2CyNuuV29aNPJPayFCWwBBX1XFYxiiZht2d8vyrMnWta+Qm5XYXn6mjUmnbmlACeNDldjCX3roKvw9bpEPZzbzu+utBaIcI2GIyaUT8L4Jmm7lAIt0bxLeys1ehfz7jojbwGLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743142880; c=relaxed/simple;
	bh=2ISD9g48yKW6WFE/QlSWhFoDTdZcmqJexk0FhebrfvA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aegRN94CpfuSG4VVqlTRTzgUPEkUrnl8zGG6CGfkLoP5Q1QwEZJf66C2WXW0mkjy6IItwACQSUGPTs/K+/1+45sM16xB0PP/x1k+9AA/HOOR8htkn4Fe2QMFAY/D19D+vTBiwke46S5zY70sVjDZpZq/80oiiPmZfbD8EFvJB3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E63B71762;
	Thu, 27 Mar 2025 23:21:21 -0700 (PDT)
Received: from K4MQJ0H1H2.arm.com (unknown [10.163.46.134])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 80E8F3F58B;
	Thu, 27 Mar 2025 23:21:11 -0700 (PDT)
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
Subject: [PATCH] arm64: pageattr: Explicitly bail out when changing permissions for vmalloc_huge mappings
Date: Fri, 28 Mar 2025 11:51:03 +0530
Message-Id: <20250328062103.79462-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arm64 uses apply_to_page_range to change permissions for kernel VA mappings,
which does not support changing permissions for leaf mappings. This function
will change permissions until it encounters a leaf mapping, and will bail
out. To avoid this partial change, explicitly disallow changing permissions
for VM_ALLOW_HUGE_VMAP mappings.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/mm/pageattr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 39fd1f7ff02a..8337c88eec69 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -96,7 +96,7 @@ static int change_memory_common(unsigned long addr, int numpages,
 	 * we are operating on does not result in such splitting.
 	 *
 	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
-	 * Those are guaranteed to consist entirely of page mappings, and
+	 * Disallow VM_ALLOW_HUGE_VMAP vmalloc mappings so that
 	 * splitting is never needed.
 	 *
 	 * So check whether the [addr, addr + size) interval is entirely
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

