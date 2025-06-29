Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C6813BAE3
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751187554; cv=none; b=BIoRXvbn6xBBzE7/qmTnBr9nDxGMOp1nb1L7weuueofygGAwr3iLLxHG7qvv73ANXW9EHVevUuhkljxTMtZskQrgYnwBCbirOvjRmWfd5Y2R8EnONdW0/9/kL1Dp4jWfEekQtSj+RZtwE4T/JBkdv6AIRHkoDPzOSDTkKBFxvM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751187554; c=relaxed/simple;
	bh=2eYiVKln48kRhT50NpUvXobTX6IcKbD3C0QWhmyAYwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozWIGd+9DSXrnewfV2rd4QpfRw96wy9VBdN3xmyX4xUX72jvZAYrNLqysi8JR03gnczCM/Ccz8IXpMU3v6RV+FrDs94Esh39pAJCwv8HXc/fjc9UVIOUrVWsXs9JR7ba1CbaLnMUbABVnwy9xYnTr6XtK8k7rd3pfNJ2QIwFIqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfaUtDhy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfaUtDhy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADCDFC4CEEB;
	Sun, 29 Jun 2025 08:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751187553;
	bh=2eYiVKln48kRhT50NpUvXobTX6IcKbD3C0QWhmyAYwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cfaUtDhyvfvnp50pRz46yIi3ba4BZSPc6hmAyDdXemF9gc0bPQtaX/v6kuA83H2E5
	 CUTuAyxx27Y81bqttTz8OV3v6wQj/1vD9r4l4O271BGY3Az/xVEJgiM9MqvnSbo+Jc
	 GqC22HJbJRu3grjxznxafCImBVekBNJdadaInTSfoBNsImnXivPq0uTergxHwk4GA0
	 C7E72su7krOeO8VZNG4cgpe+ajCtXrllB3qV6d+PGmbkbQywWT2CJbcTjGTHput30M
	 V0vudPZoV6rxMvUDaOmbBP0W6oAzbgT9iWBYzUt5ZZnGP44wBbiuHLT9Mr61rruE24
	 V/UxY30SfbQAw==
Date: Sun, 29 Jun 2025 11:59:04 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Pedro Falcato <pfalcato@suse.de>, Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>
Subject: Re: [PATCH v1 1/4] mm: convert FPB_IGNORE_* into FPB_HONOR_*
Message-ID: <aGEAWMKsK2VtdbI8@kernel.org>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-2-david@redhat.com>
 <6e3df002-fd04-4acf-a670-d36d5478921a@lucifer.local>
 <fd825d4f-76b5-40ee-bad5-634b4d80506c@redhat.com>
 <9427d552-b94d-4b27-a4e3-ed958c153b48@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9427d552-b94d-4b27-a4e3-ed958c153b48@lucifer.local>

On Fri, Jun 27, 2025 at 05:33:06PM +0100, Lorenzo Stoakes wrote:
> On Fri, Jun 27, 2025 at 06:30:13PM +0200, David Hildenbrand wrote:
> > On 27.06.25 18:28, Lorenzo Stoakes wrote:
> > > On Fri, Jun 27, 2025 at 01:55:07PM +0200, David Hildenbrand wrote:
> > > > Honoring these PTE bits is the exception, so let's invert the meaning.
> > > >
> > > > With this change, most callers don't have to pass any flags.
> > > >
> > > > No functional change intended.
> > > >
> > > > Signed-off-by: David Hildenbrand <david@redhat.com>
> > >
> > > This is a nice change, it removes a lot of code I really didn't enjoy
> > > looking at for introducing these flags all over the place.
> > >
> > > But a nit on the naming below, I'm not a fan of 'honor' here :)
> > >
> > > > ---
> > > >   mm/internal.h  | 16 ++++++++--------
> > > >   mm/madvise.c   |  3 +--
> > > >   mm/memory.c    | 11 +++++------
> > > >   mm/mempolicy.c |  4 +---
> > > >   mm/mlock.c     |  3 +--
> > > >   mm/mremap.c    |  3 +--
> > > >   mm/rmap.c      |  3 +--
> > > >   7 files changed, 18 insertions(+), 25 deletions(-)
> > > >
> > > > diff --git a/mm/internal.h b/mm/internal.h
> > > > index e84217e27778d..9690c75063881 100644
> > > > --- a/mm/internal.h
> > > > +++ b/mm/internal.h
> > > > @@ -202,17 +202,17 @@ static inline void vma_close(struct vm_area_struct *vma)
> > > >   /* Flags for folio_pte_batch(). */
> > > >   typedef int __bitwise fpb_t;
> > > >
> > > > -/* Compare PTEs after pte_mkclean(), ignoring the dirty bit. */
> > > > -#define FPB_IGNORE_DIRTY		((__force fpb_t)BIT(0))
> > > > +/* Compare PTEs honoring the dirty bit. */
> > > > +#define FPB_HONOR_DIRTY		((__force fpb_t)BIT(0))
> > >
> > > Hm not to be petty but... :)
> > >
> > > I'm not sure I find 'honor' very clear here. Ignore is very clear, 'honor' (God
> > > the British English in me wants to say honour here but stipp :P) doesn't
> > > necessarily tell you what is going to happen.
> > >
> > > Perhaps PROPAGATE? or OBEY?
> >
> > RESPECT? :)

DONT_IGNORE ;-)

> 🎵 R-E-S-P-E-C-T find out what it means to me... ;) 🎵
> 
> This works too :>)

-- 
Sincerely yours,
Mike.
