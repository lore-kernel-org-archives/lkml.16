Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF9D1F12E8;
	Fri,  4 Apr 2025 13:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774810; cv=none; b=RjncH6tN2bNl7LG5B2D+3L6Kk9qtzGcjjxq8kLZcmRNvHSkxQyuKK5Qw3/pNqLA/h/c0KcMcbNZBrqNJmcNncLtCIx8IMVeH3x2jnVd5BGo2i32pg0gvAauKd1kqsh4BQBeeB9FydR/P8ro/z78uJwk2ahx2ZBrYg2YMZ44Vu6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774810; c=relaxed/simple;
	bh=2rzMRftKBbWXyLp7FGHjPk6gHfvfTiEV+d+apCFfS6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbwCpRVtixlCmVemCVJrikfYlN3V3LwkVvFbVyX6yz+cankLcoJBF4MZv0YppntUteKE1UeH0aWFVhrTrJLhIkYHBhm0jyMYPvgmrphykLtuzMi2x6l7T4RpaPuUYA+BpJG7jl9+STKyw9hKxRuv6CKatpZ9gxMK5GIIUCWBR0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u86qq+WW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u86qq+WW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67702C4CEE9;
	Fri,  4 Apr 2025 13:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743774810;
	bh=2rzMRftKBbWXyLp7FGHjPk6gHfvfTiEV+d+apCFfS6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u86qq+WWOgfr/y8T3yYEfFibNlmCislNnrANwDMm0Ddd3FrjSwk5X/9lyM2ctT40p
	 fbIqF2t2bIDazWL1aQ+8uKlFQwozKkEDLtbquMfiQEfWaMUxIkbLXNa3+U20SS79tc
	 zsXuF9LVeo4pVn1onYujBO70qGEQvFTfGdJyt62/ft4rTl1i7VRVZueQsD5E0NMq3R
	 4XlixfG7j2DkiY5hGeOJg9CqNrunFEW/Vhp7IbJcQUzXFhrmZ9yj191xLraeS8y+0B
	 A5ZL0U88jgVbAMqN4TBDpuesEaWt5Mz+qG36eitZepGX00BCXMDM83p/0iTferff24
	 ylNRrHAYePorg==
Date: Fri, 4 Apr 2025 16:53:13 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Pratyush Yadav <ptyadav@amazon.de>,
	Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org,
	graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org,
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com,
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com,
	dave.hansen@linux.intel.com, dwmw2@infradead.org,
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com,
	corbet@lwn.net, krzk@kernel.org, mark.rutland@arm.com,
	pbonzini@redhat.com, pasha.tatashin@soleen.com, hpa@zytor.com,
	peterz@infradead.org, robh+dt@kernel.org, robh@kernel.org,
	saravanak@google.com, skinsburskii@linux.microsoft.com,
	rostedt@goodmis.org, tglx@linutronix.de, thomas.lendacky@amd.com,
	usama.arif@bytedance.com, will@kernel.org,
	devicetree@vger.kernel.org, kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory
 preservation
Message-ID: <Z-_kSXrHWU5Bf3sV@kernel.org>
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-10-changyuanl@google.com>
 <mafs05xjmqsqc.fsf@amazon.de>
 <20250403114209.GE342109@nvidia.com>
 <Z-6UA3C1TPeH_kGL@kernel.org>
 <20250403142438.GF342109@nvidia.com>
 <Z--sUYCvP3Q8nT8e@kernel.org>
 <20250404124729.GH342109@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404124729.GH342109@nvidia.com>

On Fri, Apr 04, 2025 at 09:47:29AM -0300, Jason Gunthorpe wrote:
> On Fri, Apr 04, 2025 at 12:54:25PM +0300, Mike Rapoport wrote:
> > > IMHO it should not call kho_preserve_phys() at all.
> > 
> > Do you mean that for preserving large physical ranges we need something
> > entirely different?
> 
> If they don't use the buddy allocator, then yes?
> 
> > Then we don't need the bitmaps at this point, as we don't have any users
> > for kho_preserve_folio() and we should not worry ourself with orders and
> > restoration of high order folios until then ;-)
> 
> Arguably yes :\
> 
> Maybe change the reserved regions code to put the region list in a
> folio and preserve the folio instead of using FDT as a "demo" for the
> functionality.

Folios are not available when we restore reserved regions, this just won't
work.

> > The xarrays + bitmaps do have the limitation that we cannot store any
> > information about the folio except its order and if we are anyway need
> > something else to preserve physical ranges, I suggest starting with
> > preserving ranges and then adding optimizations for the folio case.
> 
> Why? What is the use case for physical ranges that isn't handled
> entirely by reserved_mem_add()?
> 
> We know what the future use case is for the folio preservation, all
> the drivers and the iommu are going to rely on this.

We don't know how much of the preservation will be based on folios.
Most drivers do not use folios and for preserving memfd* and hugetlb we'd
need to have some dance around that memory anyway.  So I think
kho_preserve_folio() would be a part of the fdbox or whatever that
functionality will be called.

> > Here's something that implements preservation of ranges (compile tested
> > only) and adding folios with their orders and maybe other information would
> > be quite easy.
> 
> But folios and their orders is the *whole point*, again I don't see
> any use case for preserving ranges, beyond it being a way to optimize
> the memblock reserve path. But that path should be fixed up to just
> use the bitmap directly..

Are they? 
The purpose of basic KHO is to make sure the memory we want to preserve is
not trampled over. Preserving folios with their orders means we need to
make sure memory range of the folio is preserved and we carry additional
information to actually recreate the folio object, in case it is needed and
in case it is possible. Hughetlb, for instance has its own way initializing
folios and just keeping the order won't be enough for that.

As for the optimizations of memblock reserve path, currently it what hurts
the most in my and Pratyush experiments. They are not very representative,
but still, preserving lots of pages/folios spread all over would have it's
toll on the mm initialization. And I don't think invasive changes to how
buddy and memory map initialization are the best way to move forward and
optimize that. Quite possibly we'd want to be able to minimize amount of
*ranges* that we preserve.

So from the three alternatives we have now (xarrays + bitmaps, tables +
bitmaps and maple tree for ranges) maple tree seems to be the simplest and
efficient enough to start with.
 
Preserving folio orders with it is really straighforward and until we see
some real data of how the entire KHO machinery is used, I'd prefer simple
over anything else.

> Jason

-- 
Sincerely yours,
Mike.
