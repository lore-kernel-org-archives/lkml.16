Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1866228C5DC
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749555858; cv=none; b=t2ugEZ58kGO071TKzksdUa0Rah1NloxrLc9izsq2AGlSfKD/94uVKUtZoxZyfHDTZPKZHdaM20mpIuFzOZvBBlzsiUArfQGCwZIe9UVtufcLb4X7x7bS1lbCcxZXfkTORFL7/fNFS+sjG0tfplFoAEbQ/k50VznvjaU3Gv1ssSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749555858; c=relaxed/simple;
	bh=wy6/q0Tdi+7wBJK94TSt9YhD7RL+lAy5DAWths2Pm9E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IIe/4WroJ1QQI18EFfRM9DNoPBk1smAnlY6X6lKGU63Ejva7i7Kr+0LmXieNJDC6ooV6uN3PhryPtjcdw0fEfdS0c3rXIyX9IOdntaxHuA+7L6mxTqeBqW1zDxAxjnTQXIKkniPMdyBqS64T9GxxZMeLhWdf/ragS0jCq16FOfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A987C169C;
	Tue, 10 Jun 2025 04:43:55 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B5713F59E;
	Tue, 10 Jun 2025 04:44:08 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Enable permission change on arm64 kernel block mappings
Date: Tue, 10 Jun 2025 17:13:59 +0530
Message-Id: <20250610114401.7097-1-dev.jain@arm.com>
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
changing permissions for leaf mappings. We attempt to move away from this
by using walk_page_range_novma(), similar to what riscv does right now;
however, it is the responsibility of the caller to ensure that we do not
pass a range, or split the range covering a partial leaf mapping.

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
  mm: Allow lockless kernel pagetable walking
  arm64: pageattr: Use walk_page_range_novma() to change memory
    permissions

 arch/arm64/mm/pageattr.c | 158 +++++++++++++++++++++++++++++++--------
 include/linux/pagewalk.h |   7 ++
 mm/pagewalk.c            |  23 ++++--
 3 files changed, 151 insertions(+), 37 deletions(-)

-- 
2.30.2

