Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070114C6C
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 20:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747169172; cv=none; b=s/Ve4zS53lYRu8TBJDDMwq6DvNdlLDNSkpDGcM8okYdolS49CyFQhfS9NANeilIoiziB6gU/CWlUhsVxl3UoFL9zm7nYE3HO1wywXky354wmOj2R+VhG4NXdjsg45UsgdKGSUauiLwJbwMGOplNUrDyPYCPpcKtX5srFGK57chk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747169172; c=relaxed/simple;
	bh=ZrGG0MGjPQ9M+KHJmiU49QaFHPMxAGixxDOvTmXKeQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6HA85dqcsnrsxh56XwhRoIeObBH65+2xlIds2v6UJSdpkcN0y50NBItyXnrPhvxxD39Yj2FYWm2odJLHmcvFJfyj7Xw7BmkQeBBmQKu+QYp7hIODBCLL5CFE7AEVc++UKBKkvo7Shb8wjRYoWh94iHN14EGoRMbIbrWoBhl92k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nmR4Y/kf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nmR4Y/kf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A873AC4CEE4;
	Tue, 13 May 2025 20:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747169170;
	bh=ZrGG0MGjPQ9M+KHJmiU49QaFHPMxAGixxDOvTmXKeQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nmR4Y/kfmtn0Wmed73+zC6gl9p+RgdyAlq7iOw/eanf+Cq4YGxcOntSUAUlrVrkD5
	 /JTdTmJBH8ducDgUDNbg0eR0HP1wSy/cdADfacMkChwWXjmgBDWrcYjgVHWwdhh2Uo
	 xkF6a3gTPxK9Jbio4tKD5k/Sfryr+KE+SAWvRneJ+AgOTTlCUA8r/MMuRFacp3R8TE
	 ZxyFwU/yZDiTSDkyqGSli2izvVpe8HjQlQbTRfoAFvSHjMaNKJ0oqpVgTkpNvPl15p
	 A5FNDAsUrZ9cHAPB5JTK7YZe6vHkD4j/ikMO4P2DXzyeOW5TfaDOUQfJMw5nxsOklg
	 iXmEkqWlbBbQA==
Date: Tue, 13 May 2025 21:46:04 +0100
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com
Subject: Re: [PATCH] arm64/mm: Disable barrier batching in interrupt contexts
Message-ID: <20250513204603.GA9866@willie-the-truck>
References: <20250512102242.4156463-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512102242.4156463-1-ryan.roberts@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, May 12, 2025 at 11:22:40AM +0100, Ryan Roberts wrote:
> Commit 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel
> mappings") enabled arm64 kernels to track "lazy mmu mode" using TIF
> flags in order to defer barriers until exiting the mode. At the same
> time, it added warnings to check that pte manipulations were never
> performed in interrupt context, because the tracking implementation
> could not deal with nesting.
> 
> But it turns out that some debug features (e.g. KFENCE, DEBUG_PAGEALLOC)
> do manipulate ptes in softirq context, which triggered the warnings.

Hmm. Do we also have to worry about the case where a softirq is triggered
off the back of a hardirq *and* that hardirq is taken while we're in the
middle of e.g. queue_pte_barriers()? In that case, I think we can end
up in strange situations, such as having LAZY_MMU_PENDING set when
LAZY_MMU is clear, although it looks like things still work even in that
case.

Will
