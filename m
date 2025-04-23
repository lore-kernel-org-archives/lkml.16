Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E161827702A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396323; cv=none; b=jObWkQqJkSamJFeNG9cCmpR1IfKesr7A1mo0lRZ6io81Yy1OntlIzBr4+xZQjuonc0SYQ3LfiDQlBmDj6CrGMXzKjyv5pHe3sYZJd/KP1w0PmlBBtM/4uRgR47qj3ET6bddauvoalF7+53ALjBdR10ZSXoWr5cIPY/4N79a8trY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396323; c=relaxed/simple;
	bh=U9mRBjRlMsmwetZJnFMC4bJfcW5W7Bc1L+01t2yIO28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uJXM+0OO9Q63a5HPzfaOJE8ZddOqgYKy03XH1wnMudpzOvOaFrMXz7/UBtX7y+3N+ED9JwrL0nbxI6GHBj2nhmlp0Vn75o0pAKTTjZW0C/iqZsfyrNud0e4z/uEdj7/XU/4lGyFMyG8zfhdWjpqArRGW54SsqFLDCITcP0Si/Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=X4/WiZIV; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="X4/WiZIV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=rlxnpPA0BRJTqTZOB/PexdCma5i3A5+cr7q4oQzGnJY=; b=X4/WiZIVa8VJZ4s6lzTQ5R6C87
	mMWBom0H0ojD5GxrzdbQIYbyEeWIA65+od2I+w8xI3eGSZAGsMGBolPKiRkF1kxcn8/N0qkDi4rEM
	MmHZcRA67HLbq3D9tTPblVXTNdJytDkmWZsgIp6kHJiTsH6CgrnGM099lb572unq5ApDU+m375Bkv
	mWuL6x/V1SMedTAXLRGyItGv7BOfuAdXsZAPpcfPJ2hfkFN2+WEWedKJ94XPsaEzAfofbRZhzv3cS
	116ymjKX6YKwzi/+NkKJfbC/gL5finbqWNPiPP5sYti5/2gTrNMnZ4BXkwWEzDbpVAzvH96POKlzu
	Jv1LdqrQ==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VJQ-000000081P5-0Epc;
	Wed, 23 Apr 2025 08:18:32 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7VJO-00000002YNk-0Rej;
	Wed, 23 Apr 2025 09:18:30 +0100
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
	kvmarm@lists.cs.columbia.edu,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Ruihan Li <lrh2000@pku.edu.cn>
Subject: [PATCH v3 0/7] mm: Introduce for_each_valid_pfn()
Date: Wed, 23 Apr 2025 08:52:42 +0100
Message-ID: <20250423081828.608422-1-dwmw2@infradead.org>
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

v3: 
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
 include/asm-generic/memory_model.h | 26 ++++++++++-
 include/linux/mmzone.h             | 88 ++++++++++++++++++++++++++++++++++++++
 kernel/power/snapshot.c            | 42 +++++++++---------
 mm/memory_hotplug.c                |  8 +---
 mm/mm_init.c                       | 29 +++++--------
 6 files changed, 149 insertions(+), 51 deletions(-)

