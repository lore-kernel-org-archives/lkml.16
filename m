Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6993182BD;
	Sun,  6 Apr 2025 16:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743957287; cv=none; b=IEyPLIDiLPeEWxxn7SsltMhF5Rwc/5i5dzUNrtdkdt0ZvoPaeZzK1cN9xVJ3pIfRY7Bx0pg+Tjtzn2QGmsARtcueuCsOTJQuRV5cs/9WNmVe+r/2J6PAulNpZL4LdMutOCt/GbovunKvCQWqu20ns/5sA0KroQ9ekMyp3P9tfZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743957287; c=relaxed/simple;
	bh=VXmaK1KEQ4OdnNW6qkbtDrEkJuNzVNaxsi9xvoHemA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9bA+JeNV3woQCzU4c6KPaAPteQ8MCmDc+FP8goamYe37309Q046LxeRMkTmvBIEUllAo67lO7eupoiaVePNNQXxOJSJKK0eW+KGLwrFP3hnrk6L+BNAxCNGyKY8zr3dAguq/Tljx1IpXYNNWttPGdEQ39RSg8fEIHdce6u1I2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sHYEa8E+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sHYEa8E+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE96C4CEE3;
	Sun,  6 Apr 2025 16:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743957286;
	bh=VXmaK1KEQ4OdnNW6qkbtDrEkJuNzVNaxsi9xvoHemA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sHYEa8E+WecBvlODItuw2b7YX/6tTcKkPkVY5c8hgfkEY8qrvZS4g0a3Ps36mtTc7
	 C1ll8nDNb2+K9tEtN6sZSs+7NVh3o6k6Kg/4wianbIJby8nQu2r7eDW3P4ypSyCXGB
	 +PTm6pWbv464BBckQVvKgFmhVS12NRwvpw2dOxLPxKRX/NeHfTRBeqj47VFsu/qaTq
	 kDdF/2+c/Pr6gHEjMytyRvKIWHvox2DCJh1vPUVQTXmvT+5ihdqD2WA5RflpUqRy7u
	 XiEBaOkZARTvBBRMrCpj6S6HvzxefWgH6WKx/07uPfbphejPBi1964kPEwB7U3GezU
	 UycEnTm5Y3e0A==
Date: Sun, 6 Apr 2025 19:34:30 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <ptyadav@amazon.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Changyuan Lyu <changyuanl@google.com>,
	linux-kernel@vger.kernel.org, graf@amazon.com,
	akpm@linux-foundation.org, luto@kernel.org,
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
Message-ID: <Z_KtFnmExftpotmR@kernel.org>
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-10-changyuanl@google.com>
 <mafs05xjmqsqc.fsf@amazon.de>
 <20250403114209.GE342109@nvidia.com>
 <Z-6UA3C1TPeH_kGL@kernel.org>
 <20250403142438.GF342109@nvidia.com>
 <Z--sUYCvP3Q8nT8e@kernel.org>
 <20250404124729.GH342109@nvidia.com>
 <Z-_kSXrHWU5Bf3sV@kernel.org>
 <mafs0cydrq4wv.fsf@amazon.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mafs0cydrq4wv.fsf@amazon.de>

On Fri, Apr 04, 2025 at 04:15:28PM +0000, Pratyush Yadav wrote:
> Hi Mike,
> 
> On Fri, Apr 04 2025, Mike Rapoport wrote:
> 
> [...]
> > As for the optimizations of memblock reserve path, currently it what hurts
> > the most in my and Pratyush experiments. They are not very representative,
> > but still, preserving lots of pages/folios spread all over would have it's
> > toll on the mm initialization. And I don't think invasive changes to how
> > buddy and memory map initialization are the best way to move forward and
> > optimize that. Quite possibly we'd want to be able to minimize amount of
> > *ranges* that we preserve.
> >
> > So from the three alternatives we have now (xarrays + bitmaps, tables +
> > bitmaps and maple tree for ranges) maple tree seems to be the simplest and
> > efficient enough to start with.
> 
> But you'd need to somehow serialize the maple tree ranges into some
> format. So you would either end up going back to the kho_mem ranges we
> had, or have to invent something more complex. The sample code you wrote
> is pretty much going back to having kho_mem ranges.

It's a bit better and it's not a part of FDT which Jason was so much
against :)
 
> And if you say that we should minimize the amount of ranges, the table +
> bitmaps is still a fairly good data structure. You can very well have a
> higher order table where your entire range is a handful of bits. This
> lets you track a small number of ranges fairly efficiently -- both in
> terms of memory and in terms of CPU. I think the only place where it
> doesn't work as well as a maple tree is if you want to merge or split a
> lot ranges quickly. But if you say that you only want to have a handful
> of ranges, does that really matter?

Until we all agree that we are bypassing memblock_reserve() and
reimplementing memory map and free lists initialization for KHO we must
minimize the amount of memblock_reserve() calls. And maple tree allows
easily merge ranges where appropriate resulting in much smaller amount of
ranges that kho_mem had.
 
> Also, I think the allocation pattern depends on which use case you have
> in mind. For hypervisor live update, you might very well only have a
> handful of ranges. The use case I have in mind is for taking a userspace
> process, quickly checkpointing it by dumping its memory contents to a
> memfd, and restoring it after KHO. For that, the ability to do random
> sparse allocations quickly helps a lot.
> 
> So IMO the table works well for both sparse and dense allocations. So
> why have a data structure that only solves one problem when we can have
> one that solves both? And honestly, I don't think the table is that much
> more complex either -- both in terms of understanding the idea and in
> terms of code -- the whole thing is like 200 lines.

It's more than 200 line longer than maple tree if we count the lines.
My point is both table and xarrays are trying to optimize for an unknown
goal. kho_mem with all it's drawbacks was an obvious baseline. Maple tree
improves that baseline and it is more straightforward than the
alternatives.
 
> Also, I think changes to buddy initialization _is_ the way to optimize
> boot times. Having maple tree ranges and moving them around into
> memblock ranges does not really scale very well for anything other than
> a handful of ranges, and we shouldn't limit ourselves to that without
> good reason.

As I said, this means an alternative implementation of the memory map and
free lists, which has been and remains quite fragile.
So we'd better start with something that does not require that in the
roadmap.
 
> -- 
> Regards,
> Pratyush Yadav

-- 
Sincerely yours,
Mike.
