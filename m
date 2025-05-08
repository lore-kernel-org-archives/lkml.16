Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F2A27CB00
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 16:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746720699; cv=none; b=Q51sjNaaFjoqKflyQHkxQS1kz4b5UdRkKVpthoL8Of4Tb0tuja4SwSx7omoCpYLZccYCw9s6tjfgm71WtuJ9TdtOphAfmI8yUNMWgHSaI45KUQcaRC6jh9Hplv95hiTPVVkmdeMbJhatlCrKWgQNb1KZudD+Co9Fd2a7aocs2mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746720699; c=relaxed/simple;
	bh=Gdcy2RIRLBvTZyDVSZYPKM975FTshW+gQMvh2Cdsqgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3VKYNKj462ZT6rMbK86UY3I8WOJaSPVDuwVtvOMjUaPj2zHwa8p4/uEZhgoc+ttQY16ffQB+3aMV5nejGB0VmLRldhi1o+5nDg62ePongZA+FYkYEeImRXWvmYoCqrpWsNebhyGzCmo80D3Z4MU/aud6/SaYBXtVbmP8cuoL4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ojV+JLh1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojV+JLh1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F303C4CEE7;
	Thu,  8 May 2025 16:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746720698;
	bh=Gdcy2RIRLBvTZyDVSZYPKM975FTshW+gQMvh2Cdsqgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ojV+JLh16PNIOLHsuDvq4yO1MksY/qdSBMe6cj7JjCuW4XPy4k4+hLz6TwOAAe9tq
	 sv0vurZrdViUlprnNayJnLHHRYcSfrX1W+NE5gSclFD3Nt0c4fGsXEws0U4Q4v8m3D
	 KlxovhyW4uX+D3zZoA9ONPc1AM8PzBi867wyv9rq3lytJc9u+yCTVBntkA9ZQisG2i
	 eY66vBkxKL3LJS2FOVgpPg8D8BnTp7cx2TE4kgyEECcKNYYQu0Vtp0r5mVwduDEBPA
	 XpWhLk19YDfqGvxEEkUvSiIjuNLJoRHLfNwMbuoMEBRLcRA/ZKn3s06V12gB8639Kb
	 Xsk9nhkGVgECg==
Date: Thu, 8 May 2025 09:11:35 -0700
From: Kees Cook <kees@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Christian Brauner <christian@brauner.io>
Subject: Re: [RFC PATCH] MAINTAINERS: add kernel/fork.c to relevant sections
Message-ID: <202505080911.FB6E102@keescook>
References: <20250508152825.151889-1-lorenzo.stoakes@oracle.com>
 <f0bdf898-42bd-48ae-89a2-8f93b49d071f@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0bdf898-42bd-48ae-89a2-8f93b49d071f@lucifer.local>

On Thu, May 08, 2025 at 04:33:33PM +0100, Lorenzo Stoakes wrote:
> +cc Christian
> 
> And Murphy's law dictates that I forget to add the pidfd bit. Fix-patch
> included...
> 
> Adding pidfd as there's a fair chunk of pidfd code that lives in
> kernel/fork.c. Obviously let me know Christian if you feel this makes
> sense.
> 
> Thanks! And apologies for noise...
> 
> On Thu, May 08, 2025 at 04:28:25PM +0100, Lorenzo Stoakes wrote:
> > Currently kernel/fork.c both contains absolutely key logic relating to a
> > number of kernel subsystems and also has absolutely no assignment in
> > MAINTAINERS.
> >
> > Correct this by placing this file in relevant sections - mm core, exec,
> > scheduler and pidfd so people know who to contact when making changes here.
> >
> > scripts/get_maintainers.pl can perfectly well handle a file being in
> > multiple sections, so this functions correctly.
> >
> > Intent is that we keep putting changes to kernel/fork.c through Andrew's
> > tree.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >  MAINTAINERS | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ccc45b0ba843..55332d5bc499 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8830,6 +8830,7 @@ F:	include/linux/elf.h
> >  F:	include/uapi/linux/auxvec.h
> >  F:	include/uapi/linux/binfmts.h
> >  F:	include/uapi/linux/elf.h
> > +F:	kernel/fork.c
> >  F:	mm/vma_exec.c
> >  F:	tools/testing/selftests/exec/
> >  N:	asm/elf.h
> > @@ -15525,6 +15526,7 @@ F:	include/linux/mm.h
> >  F:	include/linux/mm_*.h
> >  F:	include/linux/mmdebug.h
> >  F:	include/linux/pagewalk.h
> > +F:	kernel/fork.c
> >  F:	mm/Kconfig
> >  F:	mm/debug.c
> >  F:	mm/init-mm.c
> > @@ -21742,6 +21744,7 @@ F:	include/linux/preempt.h
> >  F:	include/linux/sched.h
> >  F:	include/linux/wait.h
> >  F:	include/uapi/linux/sched.h
> > +F:	kernel/fork.c
> >  F:	kernel/sched/
> >
> >  SCHEDULER - SCHED_EXT
> > --
> > 2.49.0
> >
> 
> ----8<----
> From 6ab14cfd38a34fc097207dd6b898004a87b9cfa2 Mon Sep 17 00:00:00 2001
> From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Date: Thu, 8 May 2025 16:30:58 +0100
> Subject: [PATCH] add missing pidfd entry
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Yes, please. :) Thanks!

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
