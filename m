Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B7D1F5859;
	Fri,  4 Apr 2025 18:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743789769; cv=none; b=Hk9vLN3DW6Hh5hDdYbILoEDy86e4wSPl56dZBOflX25imaUtmjHAlyvjpSNnyk3qOS4XtLyEEvZx9uiPRPewwO7LcHIuY0uUEMsxpF2zOEC9e6Nq1K4ETR4IC/AGuornUXvVy3fOiO1y/BBsslwlljCcQh5fhd6ugpxT/WAc8Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743789769; c=relaxed/simple;
	bh=sIFl/zVo7sWkaJsvC/EhT4RsCFGEr7FaDQFYhwOuRP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YW+waiWy7j8t15eoLNBsgFL4QzFIiNbukncDLRmUXSCyII7Vj9fJVBQngdkcOyCIVSKCKvPYse35/YEbCp+3x9+hLYbqblL0awE7CUm4VQFKcXlXA/C7yJ0TCKC0VA7GrKlLy1PKwUFitpdhdzO2mAaO6R13nA12d1D70/3ow0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJ3ume4b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJ3ume4b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E7CC4CEDD;
	Fri,  4 Apr 2025 18:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743789768;
	bh=sIFl/zVo7sWkaJsvC/EhT4RsCFGEr7FaDQFYhwOuRP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oJ3ume4b0BCSXvxNTZ+zTgH+wga0Rklsamxns/5CUHFZEGqO+gQ1Nr55A90L8Rmpb
	 sN35fYoh5HnL3urNM+wqgOd/x0Sf/ZhY7b+cHyDMRxHdYKmNTP0GS3UHnaZHI/O2NR
	 qBVg5F1USRrvBzh+/6r2Tlk1I7vJI41rkeNTLJ5819saPdBZ/0R4xoWUBLRfjx7zgd
	 Y1/1tfc50NfttM58cJz/3p8bzqv4yv/Cf8mmUbm7tCmdw4uV7IY0d2y1uBb1hhR5Dx
	 7DUXrVOdXzg3ik3+Ag/l4c2mZMoFBH58X81xidyqF9y4Fj8lnCswE1mOyonNpSvkqB
	 dp3aUCCNjmQQw==
Date: Fri, 4 Apr 2025 11:02:46 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	willy@infradead.org, linux-mm@kvack.org,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	David Hildenbrand <david@redhat.com>, da.gomez@kernel.org,
	gost.dev@samsung.com, linux-doc@vger.kernel.org,
	Pankaj Raghav <p.raghav@samsung.com>
Subject: Re: [PATCH v3] docs: update THP admin guide about non-tmpfs
 filesystem support
Message-ID: <Z_Aexql5FDVLtuQp@bombadil.infradead.org>
References: <20250404140657.29285-1-kernel@pankajraghav.com>
 <Z-_7fzU02OU1hVOT@bombadil.infradead.org>
 <qy52tvn6atrlt5rhgzbtueyqbs56ik3rfg2b7yopynhhoipvtj@qph743k6m7kg>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qy52tvn6atrlt5rhgzbtueyqbs56ik3rfg2b7yopynhhoipvtj@qph743k6m7kg>

On Fri, Apr 04, 2025 at 06:31:16PM +0200, Pankaj Raghav (Samsung) wrote:
> On Fri, Apr 04, 2025 at 08:32:15AM -0700, Luis Chamberlain wrote:
> > On Fri, Apr 04, 2025 at 04:06:57PM +0200, Pankaj Raghav (Samsung) wrote:
> > > From: Pankaj Raghav <p.raghav@samsung.com>
> > > 
> > > THP support for non-tmpfs filesystem has been around for some time now.
> > > Update the admin guide to reflect it.
> > > 
> > > While we are at it, move FilePmdMapped to previous paragraph for clarity,
> > > and clarify ShmemPmdMapped & ShmemHugePage.
> > > 
> > > Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> > > Acked-by: David Hildenbrand <david@redhat.com>
> > > ---
> > > 
> > > Changes since v2:
> > > - Address comment from Bagas Sanjaya
> > > - Squash commits and Ack from David
> > > 
> > >  Documentation/admin-guide/mm/transhuge.rst | 22 +++++++++++++++-------
> > >  1 file changed, 15 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
> > > index dff8d5985f0f..f8aae64e38d0 100644
> > > --- a/Documentation/admin-guide/mm/transhuge.rst
> > > +++ b/Documentation/admin-guide/mm/transhuge.rst
> > > @@ -12,8 +12,8 @@ using huge pages for the backing of virtual memory with huge pages
> > >  that supports the automatic promotion and demotion of page sizes and
> > >  without the shortcomings of hugetlbfs.
> > >  
> > > -Currently THP only works for anonymous memory mappings and tmpfs/shmem.
> > > -But in the future it can expand to other filesystems.
> > > +Currently, THP only works for anonymous memory mappings, tmpfs/shmem and
> > > +filesystems that support large folios.
> > 
> > That seems to allude that THP can be supported on filesystems
> > that suppor large folios. I don't think we want to call that THP
> 
> But we do allocate a THP in the page cache if we support large folios.
> 
> See [1] where THP was supported through page cache. From what I
> understand, THP support was added first to the page cache and then large
> folios (orders in between) support came later.

I see, yes Do we want to clarify this further?

> For example, you can mount XFS and do a simple dd as follows:
> 
> $ dd if=/dev/random of=/mnt/hello bs=1G count=2
> 
> And if you monitor `FileHugePages` after dd is done, it would have filled
> up if THP is enabled.
> 
> > and that can confuse folks. Leaving "currently" also seems to
> > indicate that there is more work to be done for THP for filesystems
> > but that's not true as well. So how about something like:
> 
> There is more work to be done in the filesystems right? Adding large
> folio support is the prerequisite here to get the THP support.

This would be good to clarify as well.

  Luis
