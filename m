Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3267158A09
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841233; cv=none; b=hxsQ+GiWNSpnKL3unTzUqnhsd4DKJocNgJTaqC4scAO7HPWPoXpHYfaRy1bPnea3KYwX/InAd1mtbp9KN/7P80U1WayxQ5ldFA0eEoWuqBMwtLjHVePfHvwCqanUpCrBXF9jDkBo8fFBvX31D55aCspzntA256ESyPaJDnOUJUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841233; c=relaxed/simple;
	bh=OREQHZGYo3NvKNR+PKTA7t1MGjIJnrFFdGtkjwEU9qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCmLzpfsqp71Sud9Cu/QIM8WaD/85XyBo2YCYIknb+uNgqm0Ih3/kfM0nFix715Kb/J38VfY+J2BtUvelROwDOyzzXemL8RIoBJxIb2J9+gJTFJADYIX5rTfMsZRt9jG+gB67Q/psml4Zd/gfrpZMlRy4ogK6s21CHlv5RYzzkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7XUweCK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7XUweCK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB653C4CEE4;
	Wed, 21 May 2025 15:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747841233;
	bh=OREQHZGYo3NvKNR+PKTA7t1MGjIJnrFFdGtkjwEU9qU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k7XUweCKpFKWJICYq76TfDISsYXAaRG/WO7DIzj+Cd0xOXyA60iZLJ0nhdVjPAlly
	 DHAxo+naXWo5rjJKLYvRjYRNIuFlNWx6Np0Bjk/QmmBGn3fIBYGOGaN2nqb6J9rEFS
	 j1ig1OlpBj19WT6pGkVxfX/ulXl1n+DGlfkYUIyv29inAlFODqP4QixgOauwg2sgR2
	 2zDkroPW/xH/d0oH02ugkePbiLo3nZ2vd2AkDkHSA18F21NR00eHQhzq1DBhwbH+3W
	 m81rhzkUK57nHLPAUmDn53ZolxhVNtIxFC9E+Nl234NAw8PG3veRASeFl77u4YBOJK
	 tkUG3kF0BMtKg==
Date: Wed, 21 May 2025 18:27:03 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Oscar Salvador <osalvador@suse.de>
Cc: Changyuan Lyu <changyuanl@google.com>, akpm@linux-foundation.org,
	bhe@redhat.com, chrisl@kernel.org, graf@amazon.com,
	jasonmiu@google.com, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	pasha.tatashin@soleen.com
Subject: Re: [PATCH 1/2] memblock: show a warning if allocation in KHO
 scratch fails
Message-ID: <aC3wx5erybg00SaQ@kernel.org>
References: <aCoFphqeZAMkhq51@kernel.org>
 <20250521070310.2478491-1-changyuanl@google.com>
 <aC2EE1pg9ktQdstI@kernel.org>
 <aC2TdzP1AwYrQdcW@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aC2TdzP1AwYrQdcW@localhost.localdomain>

On Wed, May 21, 2025 at 10:48:55AM +0200, Oscar Salvador wrote:
> On Wed, May 21, 2025 at 10:43:15AM +0300, Mike Rapoport wrote:
> > I think we should just make sparse_init_nid() panic or at least change 
> > "sparse_init_nid: node[0] memory map backing failed. Some memory will not be available."
> > to something more visible and clear. 
> 
> Panicking the system seems a bit too harsh.
> Those sections will not be initialized, and sure you will lose some memory,
> but still.
> 
> I think that making sure that subsection_map_init() does not access
> non-initialized values is enough.

It's not only subsection_map_init(), next failing one is
memmap_init_range() and maybe there's more, but we can audit and fix them.
I believe all those accesses are at init time because after system is
booted we are careful to avoid accessing absent sections.

> Because wrt. error message, I am not sure it can get more clear that we
> failed we allocate memory to back the section and so that section will
> not be activated :-)

Add a dump_stack()? ;-)

> -- 
> Oscar Salvador
> SUSE Labs
> 

-- 
Sincerely yours,
Mike.
