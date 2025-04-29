Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293A5276026;
	Tue, 29 Apr 2025 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745914004; cv=none; b=VTUHdUftaBZ3quiUW1qAIGqqEU0CYMv24Xdy/fftKWao4Qrn1QExWIsVQ1tfXEMuaAM/XLiwDh0kOIjMCTpxaWxAt3uOwLZiCjBDfFfWELAKcuDF+O9PRtbH9LXhdUhY7dGLWDFsTMhzJHgWML/ayKfwI+Slj9Jfp/7dhucDF/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745914004; c=relaxed/simple;
	bh=T+OFZKl+3KvYwlqOnSAJknFTlFAGkXBm4R7faZdxC7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lN7jNQBcC2vaYcrmqfIxfU4vtDphl3qCOaASSQC2F+B+cthqIHlIfIczqhq4/lcr06/J3wnpd2B0yqK4QDLdRdjZ91vEKuo9aj2atRi8O+COa38ZJgXs390l+3YmQDmaH835+ZFHlIljJpEcmQrz3L0gXih3cj4nG+LgPXu92sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4MP1qWh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4MP1qWh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D988C4CEE3;
	Tue, 29 Apr 2025 08:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745914003;
	bh=T+OFZKl+3KvYwlqOnSAJknFTlFAGkXBm4R7faZdxC7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g4MP1qWhXsNl/uB3rPYca9oL1jVE0ekWEV6gfciWYbB1+dqLQ9mMLhKCeQ4kEML3r
	 bJyb0LeyWTmqcsUmRVfFDi6VMDW5WBeVc88je0PluGWeRS97AYRHNXEXRaWe2ZBNUR
	 h2P24d0Nb3ya3adWViA9y0dL9GADK0WkUOludE9eaO59e5mCjZo+20Kkb33rkTCZ3T
	 joUB021ZBtmCwCwJ8IZUTlrvA217Wsdkv6riqQodhqkESfxv93/qyLqVSaXCE995Qd
	 adxuArH/4q+RMu7lWE/6XP1SpcSbdgr9HJnDqYvJZCKjQED2Lf6yl72MdWWvLKHiTL
	 2/8qg6TYlg6Ig==
Date: Tue, 29 Apr 2025 11:06:29 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de,
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de,
	catalin.marinas@arm.com, corbet@lwn.net,
	dave.hansen@linux.intel.com, devicetree@vger.kernel.org,
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com,
	hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org,
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org,
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com,
	pbonzini@redhat.com, peterz@infradead.org, ptyadav@amazon.de,
	robh@kernel.org, rostedt@goodmis.org, saravanak@google.com,
	skinsburskii@linux.microsoft.com, tglx@linutronix.de,
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
Subject: Re: [PATCH v6 11/14] x86: add KHO support
Message-ID: <aBCIhQjKKyaAuvC9@kernel.org>
References: <20250411053745.1817356-1-changyuanl@google.com>
 <20250411053745.1817356-12-changyuanl@google.com>
 <35c58191-f774-40cf-8d66-d1e2aaf11a62@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35c58191-f774-40cf-8d66-d1e2aaf11a62@intel.com>

On Mon, Apr 28, 2025 at 03:05:55PM -0700, Dave Hansen wrote:
> On 4/10/25 22:37, Changyuan Lyu wrote:
> > From: Alexander Graf <graf@amazon.com>
> > 
> > +/*
> > + * If KHO is active, only process its scratch areas to ensure we are not
> > + * stepping onto preserved memory.
> > + */
> 
> Same thing on the imperative voice here.
> 
> I'm also not fully understanding the comment. Do these "scratch" regions
> basically represent all the memory that's not being handed over? It's
> not obvious.

Scratch memory represents areas created at the boot of the first kernel and
it's known that scratch areas won't contain any memory that's being handed
over.
 
> > diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
> > index 57120f0749cc3..c314212a5ecd5 100644
> > --- a/arch/x86/kernel/e820.c
> > +++ b/arch/x86/kernel/e820.c
> > @@ -1300,6 +1300,24 @@ void __init e820__memblock_setup(void)
> >  		memblock_add(entry->addr, entry->size);
> >  	}
> >  
> > +	/*
> > +	 * At this point with KHO we only allocate from scratch memory.
> > +	 * At the same time, we configure memblock to only allow
> > +	 * allocations from memory below ISA_END_ADDRESS which is not
> > +	 * a natural scratch region, because Linux ignores memory below
> > +	 * ISA_END_ADDRESS at runtime. Beside very few (if any) early
> > +	 * allocations, we must allocate real-mode trapoline below
> 
> 						trampoline ^
> 
> > +	 * ISA_END_ADDRESS.
> > +	 *
> > +	 * To make sure that we can actually perform allocations during
> > +	 * this phase, let's mark memory below ISA_END_ADDRESS as scratch
> > +	 * so we can allocate from there in a scratch-only world.
> > +	 *
> > +	 * After real mode trampoline is allocated, we clear scratch
> > +	 * marking from the memory below ISA_END_ADDRESS
> > +	 */
> > +	memblock_mark_kho_scratch(0, ISA_END_ADDRESS);
> 
> This isn't making a whole ton of sense to me.
> 
> Is this *only* to facilitate possible users that need <ISA_END_ADDRESS
> allocations? If so, please say that.
> 
> I _think_ this is trying to say that KHO kernels are special and are
> trying to only allocate from scratch areas. But <ISA_END_ADDRESS
> allocations are both necessary and not marked by KHO _as_ a scratch area
> which causes a problem.

Yes :)

-- 
Sincerely yours,
Mike.
