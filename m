Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C8825524C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 17:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751564920; cv=none; b=Gf72NJpTSSNeMXv0l9Veq39SGTS5+Y0wfb8hwU4Ts33HDpmDTTyfqQT+4mFWhZOUgjfhPiDZJd9C37ZGE4DA0ppxnviwuEwk/yxkz7NGW5bcaUsISqV7JyiJi+0i+Eu0h+YYV0MCE5NksU+CGvEJXPf9sFLyVenbpbi1YKHojQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751564920; c=relaxed/simple;
	bh=JkBwRtm5noTWKFgY9qCFMaDWn6VtteefAZGCIVvvmJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLpSymMYP3RSVuwpNfNdJY0MgGs5zy6p8c+8bBe6DqpVKWGx815Vc+JAJEOXzpW0TXS3TYHQvessMdwqCZPkhnnDfay5RWhBdh5SD1CQCOfygOuAwaCB1MAYupoS2/3KKDtjRSgymGeRryL1degX+3HPCEyVeJjYTg/PL7HfYQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sLkpcLaA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sLkpcLaA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABBF4C4CEED;
	Thu,  3 Jul 2025 17:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751564919;
	bh=JkBwRtm5noTWKFgY9qCFMaDWn6VtteefAZGCIVvvmJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sLkpcLaA46r+A0bNmHQIJTX9W4LlLmMvVDUYG0hfyaNiZxcbC3A6sItOJyoMPZXNP
	 J4j4D1lGD126CZmRZvn3dj0oT9gRxiUyEmfzpCA4JQM4secstpb9EZiu6/6oe6MiAa
	 3TxxrdXiPAgSsld3cvHV8+mDDVC7qHbMEZoWK7qi7xOgY1KMFQN8XAseBpuO8NCddj
	 iTN9eTEHP3YsIEk3m6qVemRkFPGDCiVftgHfPQ2y8tJVqjJN2Gs15PFuObVNLjRD4r
	 Rxc8lgdwXg24mUboC3R4H4q9OvrlecLuBYVXbPfgqe4Cs8uKM83WQ/LVexpbagLgWG
	 RN8cinogO9Jhg==
Date: Thu, 3 Jul 2025 20:48:29 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Peter Xu <peterx@redhat.com>
Cc: Nikita Kalyazin <kalyazin@amazon.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
	Muchun Song <muchun.song@linux.dev>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <aGbCbW7hUf3a2do2@kernel.org>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-2-peterx@redhat.com>
 <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local>
 <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
 <982f4f94-f0bf-45dd-9003-081b76e57027@lucifer.local>
 <cda7c46b-c474-48f4-b703-e2f988470f3b@amazon.com>
 <aGVu1Isy-R9RszxW@kernel.org>
 <aGWMsfbayEco0j4R@x1.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGWMsfbayEco0j4R@x1.local>

On Wed, Jul 02, 2025 at 03:46:57PM -0400, Peter Xu wrote:
> On Wed, Jul 02, 2025 at 08:39:32PM +0300, Mike Rapoport wrote:
> 
> [...]
> 
> > > The main target of this change is the implementation of UFFD for
> > > KVM/guest_memfd (examples: [1], [2]) to avoid bringing KVM-specific code
> > > into the mm codebase.  We usually mean KVM by the "drivers" in this context,
> > > and it is already somewhat "knowledgeable" of the mm.  I don't think there
> > > are existing use cases for other drivers to implement this at the moment.
> > > 
> > > Although I can't see new exports in this series, there is now a way to limit
> > > exports to particular modules [3].  Would it help if we only do it for KVM
> > > initially (if/when actually needed)?
> > 
> > There were talks about pulling out guest_memfd core into mm, but I don't
> > remember patches about it. If parts of guest_memfd were already in mm/ that
> > would make easier to export uffd ops to it.
> 
> Do we have a link to such discussion?  I'm also curious whether that idea
> was acknowledged by KVM maintainers.

AFAIR it was discussed at one of David's guest_memfd calls
 
> Having an abstraction layer for userfaultfd memtypes within mm always makes
> some sense on its own to me, so as to remove separate random checks over
> either shmem or hugetlb.  E.g. after the series applied, we can drop the
> shmem header in userfaultfd code, which should also be a step forward.
> 
> Thanks,
> 
> >  
> > > [1]
> > > https://lore.kernel.org/all/114133f5-0282-463d-9d65-3143aa658806@amazon.com/
> > > [2]
> > > https://lore.kernel.org/all/7666ee96-6f09-4dc1-8cb2-002a2d2a29cf@amazon.com/
> > > [3] https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?h=kbuild&id=707f853d7fa3ce323a6875487890c213e34d81a0
> 
> -- 
> Peter Xu
> 

-- 
Sincerely yours,
Mike.
