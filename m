Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38529204F9B
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235634; cv=none; b=s8GvtH9ClGutMr5VZkHBQ7CuMl8kXB0pEpDGhtmUUPcE+KxStF33bewpgELE6rkCDhit7nAZehufJ/q0KqalyERfkvdjsXbaAPXNITj/2yMs9Fr94v98fRzbtPvjhcm1O2b43NmrJndSg+5kVdclR/NVlIaP5JB9vN1OqQVhFfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235634; c=relaxed/simple;
	bh=O1lz6Q1yfa8CYrEI5GX8mlyJMW/kVMWyCbTcUdCC5eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/teTNc3Av1mB79D6SqIh/b2Ja4OKqB4IVxFDqzb8YdNMKOjtnIbgRU/kE+s/5WwAwsb0Y9/QtQWGUuCI0RAKygtWEatnFYiFJRjkUa0qGFaO5IKmuHuXHsCC+Zdiq48gQwVZ9vEfzMrXsluZ+u8CCg7/EmoRrNXd5hzmgtmWNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DW+Lzp9H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DW+Lzp9H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0152AC4CEE3;
	Wed, 14 May 2025 15:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235632;
	bh=O1lz6Q1yfa8CYrEI5GX8mlyJMW/kVMWyCbTcUdCC5eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DW+Lzp9HdPWLoHdkJz7iOn+k+Z1Cetdo1F/t4kgwns9ANb8hZ2oHNjsL6dcpj0nb2
	 TKKuLdr/tyJ4ukjNShLQQ2ZaWdvXybQKk5k0WolzqgvDjiVb+SWQIt4aSKSeo3/S/1
	 crz3L+LskPut0T8BbdoJMAQ689QSTlbYc2AIf+rIR/dEcFcFEHAhKrWKzIKi6JJpMQ
	 OjJNXHtw6YTAZyMJX5OnWmekoc4Oy63ZSvAljoqu9p3m0ZXFtRVmRBPob4IJobVyNv
	 abktZzol5yoSlbzDhCxx4gC/a9SgkkWq9caWAbRKmbe3DlQK3PbRPqFky6OBSYk1Wo
	 +ZdxE+6/cLK7g==
Date: Wed, 14 May 2025 16:13:46 +0100
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
Message-ID: <20250514151345.GA10762@willie-the-truck>
References: <20250512102242.4156463-1-ryan.roberts@arm.com>
 <20250513204603.GA9866@willie-the-truck>
 <8d4e66ef-a292-45ff-9c4a-0248aff44fd3@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d4e66ef-a292-45ff-9c4a-0248aff44fd3@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, May 14, 2025 at 10:29:17AM +0100, Ryan Roberts wrote:
> On 13/05/2025 21:46, Will Deacon wrote:
> > On Mon, May 12, 2025 at 11:22:40AM +0100, Ryan Roberts wrote:
> >> Commit 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel
> >> mappings") enabled arm64 kernels to track "lazy mmu mode" using TIF
> >> flags in order to defer barriers until exiting the mode. At the same
> >> time, it added warnings to check that pte manipulations were never
> >> performed in interrupt context, because the tracking implementation
> >> could not deal with nesting.
> >>
> >> But it turns out that some debug features (e.g. KFENCE, DEBUG_PAGEALLOC)
> >> do manipulate ptes in softirq context, which triggered the warnings.
> > 
> > Hmm. Do we also have to worry about the case where a softirq is triggered
> > off the back of a hardirq *and* that hardirq is taken while we're in the
> > middle of e.g. queue_pte_barriers()? In that case, I think we can end
> > up in strange situations, such as having LAZY_MMU_PENDING set when
> > LAZY_MMU is clear, although it looks like things still work even in that
> > case.
> 
> I don't see any problem here. This change ensures that we always behave the
> "old" way in interrupt context. So the interrupt context will never even look at
> those TIF flags, so it doesn't matter that the task context is midway through
> changing the flags when the interrupt comes in.
> 
> (although somehow I feel like I should be bracing for a zinger :)

Ha, for some reason, I was looking at the code _without_ your fix
applied. Although it's quite hard to think about, I couldn't spot any
other issues with nesting beyond the one you call out at the end of the
commit message. Your patch makes all of this a lot simpler, though, so
I'll pick it up (along with the other one).

Thanks,

Will
