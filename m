Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21CF268FE7;
	Wed,  9 Apr 2025 16:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744215586; cv=none; b=dnuCQ5xxKnoq7kMeNQQynTngdASWmfHfPkoW1jMLSHf30TP7tKO8Pvv+F7Y5xX4e+TXRlj9dQQRPdNTgDiBjxmuQc6XDinjjDo/hOhRLJu5gVmc12g67JpuM9K4C6QHM4YrNqyGBye3h7nDwPRMpM5zWQD2ABRWOtyckzzQoPq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744215586; c=relaxed/simple;
	bh=O547vvi8wN4fNcefZC+j8pm7sBawXkTtl7ULJh5r69Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4GxxW1+Eex79vFzKxkIGD3W5HXQnKiIhh0F70Tq/JXetQN/eVSgUCNaSPwaizwWwWCc3lRFTTHCLglFBXoAwYYsPzKoEBYCnBOzMrrDSYXvi/bhnMcPb2mTJ4kfrh1y90wZOOE7a1+Bz/mnoq1P7AU3i2YJ7aglN1uH1KaGkgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VztxvMqX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VztxvMqX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6114CC4CEE7;
	Wed,  9 Apr 2025 16:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744215586;
	bh=O547vvi8wN4fNcefZC+j8pm7sBawXkTtl7ULJh5r69Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VztxvMqXxrpm841YCPlRs5HxRWtyQCzteRRbsExjaVh5HQZx45QxpYyiLBSJuv3X2
	 MN7vgPzgclauypOQrUuLMro0cb2A0r82+RdvOdFbdWLfEEJnlIKYXhzyYcrWqjWDQY
	 Q2bNXiFlR1BufsnZpfyjBbXsf215Q3IWHCFYnUYB2UaCy9B+xsxoGFnRP/J8guSrrR
	 tE+UzMvqzhuoQsiyE/Fb8/shQw2OD0K6GR+ygi9Kvnxt8ywUgCPvZUdDJ+rdXobs4P
	 AmIZmTueujQ0kDezDalKcjSW/fDLL+xKB1kEOBg1cCPtZwRGJQ0wI8e45idxGkET1w
	 JGcNybozD2e9A==
Date: Wed, 9 Apr 2025 19:19:30 +0300
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
Message-ID: <Z_aeEn7hKqGOG3Cf@kernel.org>
References: <Z-_kSXrHWU5Bf3sV@kernel.org>
 <20250404143031.GB1336818@nvidia.com>
 <Z_KnovvW7F2ZyzhX@kernel.org>
 <20250407141626.GB1557073@nvidia.com>
 <Z_P92UCbNCV0TbiA@kernel.org>
 <20250407170305.GI1557073@nvidia.com>
 <Z_Y4k4rDO-BbMjqs@kernel.org>
 <20250409125630.GI1778492@nvidia.com>
 <Z_Z8-BLWMkiWpaDY@kernel.org>
 <20250409153714.GK1778492@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409153714.GK1778492@nvidia.com>

On Wed, Apr 09, 2025 at 12:37:14PM -0300, Jason Gunthorpe wrote:
> On Wed, Apr 09, 2025 at 04:58:16PM +0300, Mike Rapoport wrote:
> > >
> > > I think we still don't really know what will be needed, so I'd stick
> > > with folio only as that allows building the memfd and a potential slab
> > > preservation system.
> > 
> > void * seems to me much more reasonable than folio one as the starting
> > point because it allows preserving folios with the right order but it's not
> > limited to it. 
> 
> It would just call kho_preserve_folio() under the covers though.

How that will work for memblock and 1G pages?
 
> > I don't mind having kho_preserve_folio() from day 1 and even stretching the
> > use case we have right now to use it to preserve FDT memory.
> > 
> > But kho_preserve_folio() does not make sense for reserve_mem and it won't
> > make sense for vmalloc.
> 
> It does for vmalloc too, just stop thinking about it as a
> folio-for-pagecache and instead as an arbitary order handle to buddy
> allocator memory that will someday be changed to a memdesc :|

But we have memdesc today, it's struct page. It will be shrinked and maybe
renamed, it will contain a pointer rather than data, but that's what basic
memdesc is.
And when the data structure that memdesc points to will be allocated
separately folios won't make sense for order-0 allocations.
 
> > The weird games slab does with casting back and forth to folio also seem to
> > me like transitional and there won't be that folios in slab later.
> 
> Yes transitional, but we are at the transitional point and KHO should
> fit in.
> 
> The lowest allocator primitive returns folios, which can represent any
> order, and the caller casts to their own memdesc.

The lowest allocation primitive returns pages. 

struct folio *__folio_alloc_noprof(gfp_t gfp, unsigned int order, int preferred_nid,
		nodemask_t *nodemask)
{
	struct page *page = __alloc_pages_noprof(gfp | __GFP_COMP, order,
					preferred_nid, nodemask);
	return page_rmappable_folio(page);
}
EXPORT_SYMBOL(__folio_alloc_noprof);

And page_rmappable_folio() clues about folio-for-pagecache very clearly.

And I don't think folio will be a lowest primitive buddy returns anytime
soon if ever.
 
> Jason
> 

-- 
Sincerely yours,
Mike.
