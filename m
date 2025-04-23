Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97E01A3165
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415513; cv=none; b=NJ+bTXJboQa367V5XW0aAf9Y96nfT0OkqOC56mmanwZG794Jlb6r/tmrOevFwRFkONKa0Vyg6kfCYqdmGqdqPzFa2Y5SczlsWHXjwgfuAuZcDxm4SEGlPMMytaOjVpfuWuR2VZTvTcu6k2QEVjO55w79Om1n37xWI/igw8/olUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415513; c=relaxed/simple;
	bh=/ny8+C0v+NSGF96Dv23SSTp1anixdtvMj/J2vLjN9vk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M2XpCDk4ursI0Up0TiaHj2Kj1EaWqIssDMF4BA+GQhFj2nwxKWyFHWrG6mrqwUPBXtTW+WDZP4VuPJU3HouyPZfeaRhPQ4DylqJsY6lLKdy8ZM6QKqYiWXBgKrDAou0LTWbaFyeukGQ3kj/d0XNQhlpC84yPE8at5JvvRpDxwCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CGlnf3Kl; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CGlnf3Kl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=1R2wcJ8WNozyVRB5Zez0LopaRMyXxGSmC5SqBu1VNhc=; b=CGlnf3KlkTK55NNfKmHL9MINWg
	+8gBwwSBH8guIB5zf/6WnJ0xNk0PpV8AuYk6sWWCeuM5UOHzvEkf4+3PdGLNoF+qdj/MD4En6fCHH
	wLnFpZtfBTTIZmrwVgZNhtNOnhino6tLdsvwH/cr6s2eHgiqY68/xqu2MZer9FESkr7VbTi9/kk5M
	UqDG0CHFGaQkYQvHy1cUON8QERKW4HHD6f7mhnergDvcrwOPehlYSvRXotGZagqsaf0rHr1rVqnr1
	NDy5QciXcB17D3HTG/e4u60Fa+eEtDCl8qCaogiQt+kS2Llcn4al/QnOM+c0j98lmcEPgopQiIqYy
	w/sFi4xg==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aIx-000000097Jc-1AzY;
	Wed, 23 Apr 2025 13:38:23 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7aIx-00000003JOZ-04bE;
	Wed, 23 Apr 2025 14:38:23 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Sauerwein, David" <dssauerw@amazon.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@redhat.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Ruihan Li <lrh2000@pku.edu.cn>
Subject: [PATCH v4 0/7] mm: Introduce for_each_valid_pfn()
Date: Wed, 23 Apr 2025 14:33:36 +0100
Message-ID: <20250423133821.789413-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


There are cases where a naïve loop over a PFN range, calling pfn_valid() on
each one, is horribly inefficient. Ruihan Li reported the case where
memmap_init() iterates all the way from zero to a potentially large value
of ARCH_PFN_OFFSET, and we at Amazon found the reserve_bootmem_region()
one as it affects hypervisor live update. Others are more cosmetic.

By introducing a for_each_valid_pfn() helper it can optimise away a lot
of pointless calls to pfn_valid(), skipping immediately to the next
valid PFN and also skipping *all* checks within a valid (sub)region
according to the granularity of the memory model in use.

https://git.infradead.org/users/dwmw2/linux.git/shortlog/refs/heads/for_each_valid_pfn

v4:
 • Collect Reviewed/Acked/Tested-by tags
 • Fix rebase mistake reverting FLATMEM cleanups

v3: https://lore.kernel.org/all/20250423081828.608422-1-dwmw2@infradead.org/
 • Fold the 'optimised' SPARSEMEM implementation into the original patch
 • Drop the use of (-1) as end marker, and use end_pfn instead.
 • Drop unused first_valid_pfn() helper for FLATMEM implementation
 • Add use case in memmap_init() from discussion at 
   https://lore.kernel.org/linux-mm/20250419122801.1752234-1-lrh2000@pku.edu.cn/

v2 [RFC]: https://lore.kernel.org/linux-mm/20250404155959.3442111-1-dwmw2@infradead.org/
 • Revised implementations with feedback from Mike
 • Add a few more use cases

v1 [RFC]: https://lore.kernel.org/linux-mm/20250402201841.3245371-1-dwmw2@infradead.org/
 • First proof of concept

David Woodhouse (7):
      mm: Introduce for_each_valid_pfn() and use it from reserve_bootmem_region()
      mm: Implement for_each_valid_pfn() for CONFIG_FLATMEM
      mm: Implement for_each_valid_pfn() for CONFIG_SPARSEMEM
      mm, PM: Use for_each_valid_pfn() in kernel/power/snapshot.c
      mm, x86: Use for_each_valid_pfn() from __ioremap_check_ram()
      mm: Use for_each_valid_pfn() in memory_hotplug
      mm/mm_init: Use for_each_valid_pfn() in init_unavailable_range()

 arch/x86/mm/ioremap.c              |  7 ++-
 include/asm-generic/memory_model.h | 10 ++++-
 include/linux/mmzone.h             | 88 ++++++++++++++++++++++++++++++++++++++
 kernel/power/snapshot.c            | 42 +++++++++---------
 mm/memory_hotplug.c                |  8 +---
 mm/mm_init.c                       | 29 +++++--------
 6 files changed, 133 insertions(+), 51 deletions(-)

