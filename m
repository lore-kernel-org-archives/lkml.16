Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C199E70807
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272061; cv=none; b=X+3EE4NM4nIb52xEkWKMudnm14M4pt+jv/cFRnEbYnGbAGAEGpqIZOFqqGhEpgRHZPYUQboHF19gzHYRPRAwXwnord/puzfTXU+ILEkk64SNoODpBzvsU/5MRsmOOm0SJ3KzUYv7Oi3ktrI5OHOeKa7+BnaM9iM94JSVrHOcNF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272061; c=relaxed/simple;
	bh=QM5Ui+e6vZOdwBDXDDMsFZhSJ6e/5gdEbBR8H0l5FTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZSKZsXPlwhbL3mGowt6z9JuqL7a5heM4fKkjMEt7p1E+UcJ1WNNx5dM6PGITdt2DgeYA3W4MWoetIrnjAYfPj7EPRIzUjint1h6jjrIT3oPSR2lnnpFWQC2W1NLmz8grgrAk/ul2paDEHLYYZ+yAZlIEtBULzALDkNF8uIU9gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=if2oEZf2; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="if2oEZf2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5lTIZx2giH9+IIX2EMYVwbqs4LOO3N9nqN2+4AlX0iw=; b=if2oEZf2636toDXYEwSad3zoKi
	KLSDpiPLBoz6BRv0wdbH8sMbvd5RbP1tBB7nGuyo33F0PYG3Bwlsdl2CllNX3Dsp1U704jPzXFVT6
	3KG7IZgrJmgb94wy6bIdUy2GkNldLQvmRX32K7jRJaGgDzx339B+04xPjKHOtUFM3q7lyI3NVZbNM
	uEZUpUTrkxXhtCji5FA+T5Ov44Rkj5YMLUoc8mFdPyG72K69Ro7uRrlBieDDJt7cn5cePmupjcN6c
	BTHB4DoiQ4KWShUC5GtOUVCTtMzaUDJB198m+U71l4g9cLEhsUMCg+/jaMNW27QGoG8vpyf7xhme9
	qlBxOnGQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tho6r-000000010no-47SF;
	Tue, 11 Feb 2025 11:07:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8ED043004AF; Tue, 11 Feb 2025 12:07:21 +0100 (CET)
Date: Tue, 11 Feb 2025 12:07:21 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: Rik van Riel <riel@surriel.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, bp@alien8.de,
	dave.hansen@linux.intel.com, zhengqi.arch@bytedance.com,
	nadav.amit@gmail.com, thomas.lendacky@amd.com, kernel-team@meta.com,
	linux-mm@kvack.org, akpm@linux-foundation.org, jannh@google.com,
	mhklinux@outlook.com, andrew.cooper3@citrix.com,
	Manali Shukla <Manali.Shukla@amd.com>
Subject: Re: [PATCH v9 01/12] x86/mm: make MMU_GATHER_RCU_TABLE_FREE
 unconditional
Message-ID: <20250211110721.GF29593@noisy.programming.kicks-ass.net>
References: <20250206044346.3810242-1-riel@surriel.com>
 <20250206044346.3810242-2-riel@surriel.com>
 <CA+i-1C2QgSTq4gbGZqjyzGcuscsFZvymHvXnfJYuT-CNjPPuMQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+i-1C2QgSTq4gbGZqjyzGcuscsFZvymHvXnfJYuT-CNjPPuMQ@mail.gmail.com>

On Fri, Feb 07, 2025 at 03:28:31PM +0100, Brendan Jackman wrote:
> Hi Rik,
> 
> On Thu, 6 Feb 2025 at 05:45, Rik van Riel <riel@surriel.com> wrote:
> > This is done because some paravirt TLB flush implementations
> > handle the TLB flush in the hypervisor, and will do the flush
> > even when the target CPU has interrupts disabled.
> >
> > Always handle page table freeing with MMU_GATHER_RCU_TABLE_FREE.
> > Using RCU synchronization between page table freeing and get_user_pages_fast()
> > allows bare metal to also do TLB flushing while interrupts are disabled.
> >
> > Various places in the mm do still block IRQs or disable preemption
> > as an implicit way to block RCU frees.
> >
> > That makes it safe to use INVLPGB on AMD CPUs.
> 
> It would be nice to update the CONFIG_MMU_GATHER_RCU_TABLE_FREE
> comment in mm/mmu_gather.c to mention INVLPG alongside "Architectures
> that do not have this (PPC)" 

Why? This is just one more architecture that does broadcast.

- and while that's being updated it would
> also be useful to note down the paravirt thing you explained above,
> IMO it's pretty helpful to have more examples of the concrete usecases
> for this logic.

Look at kvm_flush_tlb_multi() if you're interested. The notable detail
is that is avoids flushing TLB for vCPUs that are preempted, and instead
lets the vCPU resume code do the invalidate.
