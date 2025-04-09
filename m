Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76832158218;
	Wed,  9 Apr 2025 13:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744207112; cv=none; b=ptnsTnJ//3ryXm/DlF0pgU4Zmn7cTYhp0u17Gy7I2rOruzSkPFxHMH1lxwWMeAMQmbhdL67F4mZXySNpwuverrCXDz/h9qd6qpmAjf6sTUWWJjHGiPWQrjJITDZ9N8CukscVd2VZBsX9V9B5MB4mx3yLHlR+FXYt2uXlzvHVBYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744207112; c=relaxed/simple;
	bh=gIkLtXkAowaebWcKuGF3J/51U/7JSeR5c3yViLJLL4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AK0Cthb54ln4LncjTjCTczExiqoDQnjEFxV2sDkxK7Co3/17l+FlIJAA4UCyXAxbQ3WCiQ/cZfgByzDtdqjUuh1BhDutO90UYQeMf6z1JIipN9ApSXZuSPaMPN5BH44fMsDF0My1GQPe2xB5kshOJNugy8I0Z5bRpQ/LbCKkKDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1VeRjHX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1VeRjHX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B3DC4CEE3;
	Wed,  9 Apr 2025 13:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744207112;
	bh=gIkLtXkAowaebWcKuGF3J/51U/7JSeR5c3yViLJLL4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T1VeRjHXhAndr2FEdfdTBw7zDINMDJBNTNJsqgRB/P4dNoIRMJkjhIpi+Ndt+VKbl
	 5knulbs8t68ZJQHEp3hJv5wnnKxfXT2xpJgI4Y01LoSQ6J0O9ODJHFL+a6ZB2fD/7Y
	 XyYJQLnlRpI4+S5i695i7kjZgppq3h65TarholFW8Mm48fbw7ydwLNF5J0ihqwKrUw
	 MzbENnQOyp5QuEtSgrfp/kQGFSwq7IGGzquR7XDOt5FCpPnHUlRpXON38mlmlRyT5X
	 UlXxUCxhI1fUM5v/ElnapHBZclh8oC1FD4nKTc/xqaush+YDOdYrH0o/nPxRtcfmEZ
	 kywhG25Ha9vWQ==
Date: Wed, 9 Apr 2025 16:58:16 +0300
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
Message-ID: <Z_Z8-BLWMkiWpaDY@kernel.org>
References: <Z--sUYCvP3Q8nT8e@kernel.org>
 <20250404124729.GH342109@nvidia.com>
 <Z-_kSXrHWU5Bf3sV@kernel.org>
 <20250404143031.GB1336818@nvidia.com>
 <Z_KnovvW7F2ZyzhX@kernel.org>
 <20250407141626.GB1557073@nvidia.com>
 <Z_P92UCbNCV0TbiA@kernel.org>
 <20250407170305.GI1557073@nvidia.com>
 <Z_Y4k4rDO-BbMjqs@kernel.org>
 <20250409125630.GI1778492@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409125630.GI1778492@nvidia.com>

On Wed, Apr 09, 2025 at 09:56:30AM -0300, Jason Gunthorpe wrote:
> On Wed, Apr 09, 2025 at 12:06:27PM +0300, Mike Rapoport wrote:
> 
> > Now we've settled with terminology, and given that currently memdesc ==
> > struct page, I think we need kho_preserve_folio(struct *folio) for actual
> > struct folios and, apparently other high order allocations, and
> > kho_preserve_pages(struct page *, int nr) for memblock, vmalloc and
> > alloc_pages_exact.
> 
> I'm not sure that is consistent with what Matthew is trying to build,
> I think we are trying to remove 'struct page' usage, especially for
> compound pages. Right now, though it is confusing, folio is the right
> word to encompass both page cache memory and random memdescs from
> other subsystems.

A disagree about random memdescs, just take a look at struct folio.
 
> Maybe next year we will get a memdesc API that will clarify this
> substantially.
> 
> > On the restore path kho_restore_folio() will recreate multi-order thingy by
> > doing parts of what prep_new_page() does. And kho_restore_pages() will
> > recreate order-0 pages as if they were allocated from buddy.
> 
> I don't see we need two functions, folio should handle 0 order pages
> just fine, and callers should generally be either not using struct
> page at all or using their own memdesc/folio.

struct folio is 4 struct pages. I don't see it suitable for order-0 pages
at all. 
 
> If we need a second function it would be a void * function that is for
> things that need memory but have no interest in the memdesc. Arguably
> this should be slab preservation. There is a corner case of preserving
> slab allocations >= PAGE_SIZE that is much simpler than general slab
> preservation, maybe that would be interesting..
> 
> I think we still don't really know what will be needed, so I'd stick
> with folio only as that allows building the memfd and a potential slab
> preservation system.

void * seems to me much more reasonable than folio one as the starting
point because it allows preserving folios with the right order but it's not
limited to it. 

I don't mind having kho_preserve_folio() from day 1 and even stretching the
use case we have right now to use it to preserve FDT memory.

But kho_preserve_folio() does not make sense for reserve_mem and it won't
make sense for vmalloc.

The weird games slab does with casting back and forth to folio also seem to
me like transitional and there won't be that folios in slab later.
 
> Then we can see where we get to with further patches doing
> serialization of actual things.
> 
> Jason

-- 
Sincerely yours,
Mike.
