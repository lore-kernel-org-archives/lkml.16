Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DBC61EA7C8
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748595880; cv=none; b=ptmSV55szqoFmnsDZRF5LjvrkW09xxEGSUa6/2T9QsNv9gZ6nBXUgmL7S7vEhgYjK7oUcDn+iNorGJ1amCp2oC8NWK0Xuh4uxOqU6H1fuiGqA/8TIr13zsa9KSI+tLLiFeuvqlCzzSOj+yq2EwdBNS6y74QGRgljxUgwaPmb6Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748595880; c=relaxed/simple;
	bh=yOFcaTxur21zbSiID2EWQvG4SWrWx29LLjAgy8jkHkU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sVL4vfgP3XJ6Gqtz8WVFi5lTUs5/L2wCmjljwi3Hyk52/g7s21jPdpsEVxxDfdbkdsV3MJXCtklDKJqMtlYjsAMcXOYBwJxWZi5IM42zkpzscDejmnLRnj9jZeqhf5zP6fZktLqrV2wf8tVnMrmNoXYbCB0x6477AR8z3VQrtGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27EB116F2;
	Fri, 30 May 2025 02:04:15 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (unknown [10.164.18.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5CF463F5A1;
	Fri, 30 May 2025 02:04:26 -0700 (PDT)
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
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH 0/3] Enable huge-vmalloc permission change
Date: Fri, 30 May 2025 14:34:04 +0530
Message-Id: <20250530090407.19237-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series paves the path to enable huge mappings in vmalloc space by
default on arm64. For this we must ensure that we can handle any permission
games on vmalloc space. Currently, __change_memory_common() uses
apply_to_page_range() which does not support changing permissions for
leaf mappings. We attempt to move away from this by using walk_page_range_novma(),
similar to what riscv does right now; however, it is the responsibility
of the caller to ensure that we do not pass a range, or split the range
covering a partial leaf mapping.

This series is tied with Yang Shi's attempt [1] at using huge mappings
in the linear mapping in case the system supports BBML2, in which case
we will be able to split the linear mapping if needed without break-before-make.
Thus, Yang's series, IIUC, will be one such user of my series; suppose we
are changing permissions on a range of the linear map backed by PMD-hugepages,
then the sequence of operations should look like the following:

split_range(start, (start + HPAGE_PMD_SIZE) & ~HPAGE_PMD_MASK);
split_range(end & ~HPAGE_PMD_MASK, end);
__change_memory_common(start, end);

However, this series can be used independently of Yang's; since currently
permission games are being played only on pte mappings (due to apply_to_page_range
not supporting otherwise), this series provides the mechanism for enabling
huge mappings for various kernel mappings like linear map and vmalloc.

[1] https://lore.kernel.org/all/20250304222018.615808-1-yang@os.amperecomputing.com/

Dev Jain (3):
  mm: Allow pagewalk without locks
  arm64: pageattr: Use walk_page_range_novma() to change memory
    permissions
  mm/pagewalk: Add pre/post_pte_table callback for lazy MMU on arm64

 arch/arm64/mm/pageattr.c | 81 +++++++++++++++++++++++++++++++++++++---
 include/linux/pagewalk.h |  4 ++
 mm/pagewalk.c            | 18 +++++++--
 3 files changed, 94 insertions(+), 9 deletions(-)

-- 
2.30.2

