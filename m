Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D491C5D62
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822244; cv=none; b=Qi4BJlVocZvzF5RvejlDnXW3sJ4SZsYUo19MFdC6UFWMrRoLWAP5t44GbOs43Jwng6HJtZzm03azySOMY/x0pgVKLpfSkAmBc0HMRaRRhb4rdeTlH3sSr4p6r3fTn+caI6LATTVim0Hv+fpC8+2XY/RHFblsYdP6MaAcxo7m2Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822244; c=relaxed/simple;
	bh=7MSAvGRzUlN7RR6bZKcYszvVyTrxOmKJmopD4hHQ4Pk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=errfyyUZkfOAvNVWxKK8JEcD6XvkJlteE8P0QXp0XftEMTw0tUrx/nAHm9wqH/NYyKhWxbyk5iXEER6ctYinP2uL0QYp8uyL9Ztuqg1lYs6ENsa3Tdow+FvQPBE2vjF8V4lwHHrOcBCSdgL+C17hY+RB03sB2mFNUUpHTOCrfPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D264F2B;
	Fri, 13 Jun 2025 06:43:41 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 89B9A3F59E;
	Fri, 13 Jun 2025 06:43:56 -0700 (PDT)
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
Subject: [PATCH v3 0/2] Enable permission change on arm64 kernel block mappings
Date: Fri, 13 Jun 2025 19:13:50 +0530
Message-Id: <20250613134352.65994-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series paves the path to enable huge mappings in vmalloc space and
linear map space by default on arm64. For this we must ensure that we can
handle any permission games on the kernel (init_mm) pagetable. Currently,
__change_memory_common() uses apply_to_page_range() which does not support
changing permissions for block mappings. We attempt to move away from this
by using the pagewalk API, similar to what riscv does right now; however,
it is the responsibility of the caller to ensure that we do not pass a
range overlapping a partial block mapping; in such a case, the system must
be able to support splitting the range (which can be done on BBM2 systems).

This series is tied with Yang Shi's attempt [1] at using huge mappings
in the linear mapping in case the system supports BBML2, in which case
we will be able to split the linear mapping if needed without break-before-make.
Thus, Yang's series, IIUC, will be one such user of my series; suppose we
are changing permissions on a range of the linear map backed by PMD-hugepages,
then the sequence of operations should look like the following:

split_range(start)
split_range(end);
___change_memory_common(start, end);

However, this series can be used independently of Yang's; since currently
permission games are being played only on pte mappings (due to apply_to_page_range
not supporting otherwise), this series provides the mechanism for enabling
huge mappings for various kernel mappings like linear map and vmalloc.

[1] https://lore.kernel.org/all/20250304222018.615808-1-yang@os.amperecomputing.com/

v2->v3:
 - Drop adding PGWALK_NOLOCK, instead have a new lockless helper
 - Merge patch 1 and 2 from v2
 - Add a patch *actually* enabling vmalloc-huge permission change

v1->v2:
 - Squash patch 2 and 3
 - Add comment describing the responsibility of the caller to ensure no
   partial overlap with block mapping
 - Add comments and return -EINVAL at relevant places to document the usage
   of PGWALK_NOLOCK (Lorenzo)
 - Nest walk_kernel_page_table_range() with lazy_mmu calls, instead of
   doing so only per PTE level, fix bug in the PTE callback, introduce
   callbacks for all pagetable levels, use ptdesc_t instead of unsigned
   long, introduce ___change_memory_common and use them for direct map
   permission change functions (Ryan)

v1:
https://lore.kernel.org/all/20250530090407.19237-1-dev.jain@arm.com/

Dev Jain (2):
  arm64: pageattr: Use pagewalk API to change memory permissions
  arm64: pageattr: Enable huge-vmalloc permission change

 arch/arm64/mm/pageattr.c | 161 ++++++++++++++++++++++++++++++---------
 include/linux/pagewalk.h |   3 +
 mm/pagewalk.c            |  26 +++++++
 3 files changed, 155 insertions(+), 35 deletions(-)

-- 
2.30.2

