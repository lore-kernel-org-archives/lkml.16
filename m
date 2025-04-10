Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E00E26A0DC;
	Thu, 10 Apr 2025 09:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277483; cv=none; b=kpcJmQ/qg8VM5+tnghIcTTYnoHzjAcRGVNc5EpuLRWB4H5E9K06g68dP649XYEbLZzXrvDpKgh1gtvBNUBX9Vi5KLP27uc9L8nCh3NJol+wVDvjxY45uJ2QPG5huIeDIZwHH2oDbQ3mf4r89B+pDs+ixMMG+i5uHgFZDii2HAiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277483; c=relaxed/simple;
	bh=NUQSl8+KNt2Gck3bg5zy+/lvTkACE7uM59VfdQMYJzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+izQEV29kQrPmy6IrAe/wEwNdFM76QCcDotPbvx1bj6ts0B/I85+r8n6rVwrbKCQyoskmCp/XVjhB4oVf21MIGh0hK/iwYq0pxmnTkFZZPguANwx5t+8ycqkUN2Mrz4ueqcJBu1euljHTa5xIQhhfYRE7HbeJck++gFk8YYnx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VjL9FtRZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VjL9FtRZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F6AC4CEDD;
	Thu, 10 Apr 2025 09:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744277481;
	bh=NUQSl8+KNt2Gck3bg5zy+/lvTkACE7uM59VfdQMYJzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VjL9FtRZYiAIUa//U1cc/2gKUgnwvHeK4bT+9LIGC9mtHU1f4UcjRF0h8D7rOx7pz
	 iR5HtXzcxamzNeae3/JNe/gPTy7boaa5FX9rOMKNiug9wVM0NIp6ZsP3YrBz8ld8hC
	 emGVRKGBrQZolj9q3AkTLhoPDH3Cmug/BsiPEJafWnEdVDPuWXvw4oPf7MVZ883aIT
	 SJ+/eOuPhOaJ8rHhdMAey+nmq2fZo514q3YXzOeVeKf81mzqfrbZtp/H00V0m26P/k
	 8ejdZ+VOEcTpTcNVTPAcNqpNmuKDVGm/wMQYhjBLxEDHI30rSti3DVMXfe8kASLaYC
	 blPbZfprIw1cQ==
Date: Thu, 10 Apr 2025 11:31:19 +0200
From: Daniel Gomez <da.gomez@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, 
	willy@infradead.org, linux-mm@kvack.org, Bagas Sanjaya <bagasdotme@gmail.com>, 
	David Hildenbrand <david@redhat.com>, gost.dev@samsung.com, linux-doc@vger.kernel.org, 
	Pankaj Raghav <p.raghav@samsung.com>
Subject: Re: [PATCH v3] docs: update THP admin guide about non-tmpfs
 filesystem support
Message-ID: <bozpegwoihmwakmmtkk2lhkwycv3yv4ovpfthguhcr4vbjgzpm@bjv7aioyg6ql>
References: <20250404140657.29285-1-kernel@pankajraghav.com>
 <Z-_7fzU02OU1hVOT@bombadil.infradead.org>
 <qy52tvn6atrlt5rhgzbtueyqbs56ik3rfg2b7yopynhhoipvtj@qph743k6m7kg>
 <Z_Aexql5FDVLtuQp@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_Aexql5FDVLtuQp@bombadil.infradead.org>

On Fri, Apr 04, 2025 at 11:02:46AM +0100, Luis Chamberlain wrote:
> On Fri, Apr 04, 2025 at 06:31:16PM +0200, Pankaj Raghav (Samsung) wrote:
> > On Fri, Apr 04, 2025 at 08:32:15AM -0700, Luis Chamberlain wrote:
> > > On Fri, Apr 04, 2025 at 04:06:57PM +0200, Pankaj Raghav (Samsung) wrote:
> > > > From: Pankaj Raghav <p.raghav@samsung.com>
> > > > 
> > > > THP support for non-tmpfs filesystem has been around for some time now.
> > > > Update the admin guide to reflect it.
> > > > 
> > > > While we are at it, move FilePmdMapped to previous paragraph for clarity,
> > > > and clarify ShmemPmdMapped & ShmemHugePage.
> > > > 
> > > > Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> > > > Acked-by: David Hildenbrand <david@redhat.com>
> > > > ---
> > > > 
> > > > Changes since v2:
> > > > - Address comment from Bagas Sanjaya
> > > > - Squash commits and Ack from David
> > > > 
> > > >  Documentation/admin-guide/mm/transhuge.rst | 22 +++++++++++++++-------
> > > >  1 file changed, 15 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
> > > > index dff8d5985f0f..f8aae64e38d0 100644
> > > > --- a/Documentation/admin-guide/mm/transhuge.rst
> > > > +++ b/Documentation/admin-guide/mm/transhuge.rst
> > > > @@ -12,8 +12,8 @@ using huge pages for the backing of virtual memory with huge pages
> > > >  that supports the automatic promotion and demotion of page sizes and
> > > >  without the shortcomings of hugetlbfs.
> > > >  
> > > > -Currently THP only works for anonymous memory mappings and tmpfs/shmem.
> > > > -But in the future it can expand to other filesystems.
> > > > +Currently, THP only works for anonymous memory mappings, tmpfs/shmem and
> > > > +filesystems that support large folios.
> > > 
> > > That seems to allude that THP can be supported on filesystems
> > > that suppor large folios. I don't think we want to call that THP
> > 
> > But we do allocate a THP in the page cache if we support large folios.
> > 
> > See [1] where THP was supported through page cache. From what I
> > understand, THP support was added first to the page cache and then large
> > folios (orders in between) support came later.
> 
> I see, yes Do we want to clarify this further?

According to this thread [1], large folios currently depends on
CONFIG_TRANSPARENT_HUGEPAGE, but that will be removed eventually.

https://lore.kernel.org/all/ZPINmXyTgy2wqLqr@casper.infradead.org/

I agree this needs to be clarified. THP for anonymous memory and tmpfs/shmem is
not the same for filesystems that support large folios.
