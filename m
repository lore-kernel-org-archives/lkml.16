Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BC228DEE3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744714311; cv=none; b=iXkrDsag6lNXBsof5tP+v050ZiJVayNCwXtnp2lxSwnLn4bSGkm91/jRvGVHVY+0Vwf+6ARdGwM+lY30u8CsVgtScjQeuiOhMSv7FJGbfPrV6FnKifo6sVwr/FWrSe3SejqAjWTJTaJ6207AIqp6YwZk57f/Yxs+VExTYswVqVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744714311; c=relaxed/simple;
	bh=nBPInHujJaAmoAgQdA6t4re27rN52EjJ1ShBQRbBXUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u562IWUZdQvu2WI5+2foKD5hKj5q4Br+fHLAdK+H8AsNnkmVAJ1uYq5bQoP1Hth38Kud3m+zPiPgQYSBFAsdpEZPydTbGkC561bK1fywMsMlPB8fcSMljJY/gF0nbexx8bDMwP4NNnxfxJPTYcdVIJDW77rAtrZFObtYh2XiWmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C28DC4CEE7;
	Tue, 15 Apr 2025 10:51:48 +0000 (UTC)
Date: Tue, 15 Apr 2025 11:51:45 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>,
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/11] arm64/mm: Batch barriers when updating kernel
 mappings
Message-ID: <Z_46QUFXVI69zRZR@arm.com>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-12-ryan.roberts@arm.com>
 <Z_1IC-_Fp-yGLRSc@arm.com>
 <aabc9fb1-4e74-409a-b25b-8e844e65c502@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aabc9fb1-4e74-409a-b25b-8e844e65c502@arm.com>

On Mon, Apr 14, 2025 at 07:28:46PM +0100, Ryan Roberts wrote:
> On 14/04/2025 18:38, Catalin Marinas wrote:
> > On Tue, Mar 04, 2025 at 03:04:41PM +0000, Ryan Roberts wrote:
> >> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> >> index 1898c3069c43..149df945c1ab 100644
> >> --- a/arch/arm64/include/asm/pgtable.h
> >> +++ b/arch/arm64/include/asm/pgtable.h
> >> @@ -40,6 +40,55 @@
> >>  #include <linux/sched.h>
> >>  #include <linux/page_table_check.h>
> >>  
> >> +static inline void emit_pte_barriers(void)
> >> +{
> >> +	/*
> >> +	 * These barriers are emitted under certain conditions after a pte entry
> >> +	 * was modified (see e.g. __set_pte_complete()). The dsb makes the store
> >> +	 * visible to the table walker. The isb ensures that any previous
> >> +	 * speculative "invalid translation" marker that is in the CPU's
> >> +	 * pipeline gets cleared, so that any access to that address after
> >> +	 * setting the pte to valid won't cause a spurious fault. If the thread
> >> +	 * gets preempted after storing to the pgtable but before emitting these
> >> +	 * barriers, __switch_to() emits a dsb which ensure the walker gets to
> >> +	 * see the store. There is no guarrantee of an isb being issued though.
> >> +	 * This is safe because it will still get issued (albeit on a
> >> +	 * potentially different CPU) when the thread starts running again,
> >> +	 * before any access to the address.
> >> +	 */
> >> +	dsb(ishst);
> >> +	isb();
> >> +}
> >> +
> >> +static inline void queue_pte_barriers(void)
> >> +{
> >> +	if (test_thread_flag(TIF_LAZY_MMU))
> >> +		set_thread_flag(TIF_LAZY_MMU_PENDING);
> > 
> > As we can have lots of calls here, it might be slightly cheaper to test
> > TIF_LAZY_MMU_PENDING and avoid setting it unnecessarily.
> 
> Yes, good point.
> 
> > I haven't checked - does the compiler generate multiple mrs from sp_el0
> > for subsequent test_thread_flag()?
> 
> It emits a single mrs but it loads from the pointer twice.

It's not that bad if only do the set_thread_flag() once.

> I think v3 is the version we want?
> 
> 
> void TEST_queue_pte_barriers_v1(void)
> {
> 	if (test_thread_flag(TIF_LAZY_MMU))
> 		set_thread_flag(TIF_LAZY_MMU_PENDING);
> 	else
> 		emit_pte_barriers();
> }
> 
> void TEST_queue_pte_barriers_v2(void)
> {
> 	if (test_thread_flag(TIF_LAZY_MMU) &&
> 	    !test_thread_flag(TIF_LAZY_MMU_PENDING))
> 		set_thread_flag(TIF_LAZY_MMU_PENDING);
> 	else
> 		emit_pte_barriers();
> }
> 
> void TEST_queue_pte_barriers_v3(void)
> {
> 	unsigned long flags = read_thread_flags();
> 
> 	if ((flags & (_TIF_LAZY_MMU | _TIF_LAZY_MMU_PENDING)) == _TIF_LAZY_MMU)
> 		set_thread_flag(TIF_LAZY_MMU_PENDING);
> 	else
> 		emit_pte_barriers();
> }

Doesn't v3 emit barriers once _TIF_LAZY_MMU_PENDING has been set? We
need something like:

	if (flags & _TIF_LAZY_MMU) {
		if (!(flags & _TIF_LAZY_MMU_PENDING))
			set_thread_flag(TIF_LAZY_MMU_PENDING);
	} else {
		emit_pte_barriers();
	}

-- 
Catalin
