Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8FE1DE4E6
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 19:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747164820; cv=none; b=c+sglYbRAqbNu9SqzVXv29dpfuSXAX/wtW3PcBfkPR11sha/keGnLOYOUlf9IghoxkZ7GYE3FLZhzLwSuMMNQsYCSt29WRg0yabR4hirDV/ic8ufdusYrOUIV1BU/iIz8ujGObX/MQ64xUacU/vMUEOK4F9zl5AZPLGmx91CP5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747164820; c=relaxed/simple;
	bh=T11N/wQlymnO2W4bPCJh2pSsCLeGiefnsgxNy5Qe4BQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dGSVI/knugLSJJNQpK3qxORKZSrW1wNRIYJy6vlel5zS4D8RQ+lWYi2bEYcKyyslY0Ir9nw66G/Ln1SSq/LA9z9f8RCxdrviZvX+fr/welXu34lQCCr090/mtXtBE2HcAEbtUlla06DgYWHcVEMZbOXYQSiBaGA4D991rBvG6zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QovVyWH+; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QovVyWH+"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-47666573242so80571cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 12:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747164818; x=1747769618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QdidXaz0eUcUxYbDPRAABDwmZ5AyXqLsvFT/Qi83Kk=;
        b=QovVyWH+obkGdYCs3uHdOkSxfJeBHuOaQGYPj34LMuPWxfa5rlsoLdOfbsuR8PLCFX
         Jb0MCAFKQz/NtDSyvbV7hD9mqS0s4eWBpHPhrubWbjJC033p55KixP9TlsXfw1sHNFop
         /fOtwsJDpXRy84+eKHvjw1K5rVrwwmkhY9RJSXNpY6NPMMkYsPY63kbwX0pnqNrSfIPU
         XG3jb+VyIby4BCVDCcQW6pQF06pGZaThnEH9vw/KhWErm+Gv4nKDE+j/NDYW2REXQ1ZQ
         MaqDi264XT+FK4ZszWiOwSwmrHmiGOjuNFYDoHTsPjdV9YSI4r4o45fBBu16esJzB7d4
         Ed6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747164818; x=1747769618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QdidXaz0eUcUxYbDPRAABDwmZ5AyXqLsvFT/Qi83Kk=;
        b=inQbXrZ32fzMAnCbLn/UNiHB9Glkj0aI1i6LyobbRBKi2g9bvWCRWlyc9RZhdtWRmc
         BCW2W5vOln92PbParpUvQdEkcO4fEZfHNx37VXuw1FvA+l8/IzsH5N3E8sO8QexfuItw
         fywaVUZ15erzIR9TgZ3bi2ynCyhzCTTVlQBEOcl7ujQ8rAAIkCx+fkECNL6maW/W9CwR
         JbcGlyagfHAgUWeqXwZFrQHYWl+Rzncj2/BI5Dnb95MCWbyVBImWHgaMQd08cMFIap6o
         7J+Qdpj5pALOLG+7UquKUF7ZWElM3V+KOmCQU2l/uGzovvZCVjHlbw158SKcMWe89Mk2
         GQwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+S++tREeeRQQgeDLkxG7gQXv/6WOmpMOomJRXAe19rVK/FuigufsfwhwFCpYzp0X6dtzlWWPXrafekdA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwrFwQP6lyvpKe4G/M+KikIGBY3gTgszb/4K5h1b/UahZlbnIy
	tpAkwwsxQu+p9ocOYnI2Uq2M44o3WJgPxrndgW+hAi6IRN2+8GlH18k9G1WiVS5z4L3rp6vfKli
	i9ECBFiS0HOGKCVaf1RpmUfKTlVL73N2lqPB4wxcp
X-Gm-Gg: ASbGnct8nZmYAAbcZ2o+aCfMVShLfdF3fDod4uP9M90P7pJI/Ace+zl7AUmr1EON4d1
	ZN4CR0vjCnFOk6cSNFb1/zfURYdmkD6BaxxSJsQYgCQNuxZgayS1VVGWDEmbXU9frxMDnm3KQwk
	QLLJbbdVZhM4II/Mvz9n0bsTALN5beW9pdRG1JZj8KVx72oCpa7mVCyIwMQJ2A
X-Google-Smtp-Source: AGHT+IFGz32who9VOthrMLGakslBSZMdw/k5TozY8FHAvDqS+Qg1nC5ez27mfHiXse3/bUjtLtkB6H55qqn8aB0etkk=
X-Received: by 2002:a05:622a:1ba5:b0:47d:4e8a:97f0 with SMTP id
 d75a77b69052e-4949623e119mr520891cf.29.1747164817525; Tue, 13 May 2025
 12:33:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416082405.20988-1-zhangtianyang@loongson.cn>
 <aAYXP4f417_bx6Is@harry> <025e3f51-2ab5-bc58-5475-b57103169a82@loongson.cn>
 <20250422171116.f3928045a13205dc1b9a46ea@linux-foundation.org>
 <CAJuCfpHbXmjAr2Rt0Mo_i32hpGOyXnVtXUd4qFjXriH9eYFDkQ@mail.gmail.com>
 <20250510200740.b7de2408e40be7ad5392fed9@linux-foundation.org>
 <CAJuCfpFdC6hgFSPy3M2sagkFobWeCuxLdcWiyV5pnzB55dgjZg@mail.gmail.com> <20250513121609.a9741e49a0e865f25f966de1@linux-foundation.org>
In-Reply-To: <20250513121609.a9741e49a0e865f25f966de1@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 13 May 2025 12:33:26 -0700
X-Gm-Features: AX0GCFtrr8CkO6VIsSjbyYRy48JGkLyIgCcXLWXsfvm3u06pI0N7qjxpPclNc1M
Message-ID: <CAJuCfpEJBQkbwBPBf63jcZVLTPvBed_Gapb36TfUs8uKt4pgow@mail.gmail.com>
Subject: Re: [PATCH] mm/page_alloc.c: Avoid infinite retries caused by cpuset race
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Tianyang Zhang <zhangtianyang@loongson.cn>, Harry Yoo <harry.yoo@oracle.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>, 
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 12:16=E2=80=AFPM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Tue, 13 May 2025 09:26:53 -0700 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > > > > This has been in mm-hotfixes-unstable for six days.  Hopefully we=
'll
> > > > > see some review activity soon (please).
> > > >
> > > > I reviewed and provided my feedback but saw neither a reply nor a
> > > > respin with proposed changes.
> > >
> > > OK, thanks.  Do you have time to put together a modified version of t=
his?
> >
> > I think the code is fine as is. Would be good to add Fixes: tag but it
> > will require some investigation to find the appropriate patch to
> > reference here.
>
> Below is what is in mm-hotfixes.  It doesn't actually have any
> acked-by's or reviewed-by's.
>
> So... final call for review, please.

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

>
>
> From: Tianyang Zhang <zhangtianyang@loongson.cn>
> Subject: mm/page_alloc.c: avoid infinite retries caused by cpuset race
> Date: Wed, 16 Apr 2025 16:24:05 +0800
>
> __alloc_pages_slowpath has no change detection for ac->nodemask in the
> part of retry path, while cpuset can modify it in parallel.  For some
> processes that set mempolicy as MPOL_BIND, this results ac->nodemask
> changes, and then the should_reclaim_retry will judge based on the latest
> nodemask and jump to retry, while the get_page_from_freelist only
> traverses the zonelist from ac->preferred_zoneref, which selected by a
> expired nodemask and may cause infinite retries in some cases
>
> cpu 64:
> __alloc_pages_slowpath {
>         /* ..... */
> retry:
>         /* ac->nodemask =3D 0x1, ac->preferred->zone->nid =3D 1 */
>         if (alloc_flags & ALLOC_KSWAPD)
>                 wake_all_kswapds(order, gfp_mask, ac);
>         /* cpu 1:
>         cpuset_write_resmask
>             update_nodemask
>                 update_nodemasks_hier
>                     update_tasks_nodemask
>                         mpol_rebind_task
>                          mpol_rebind_policy
>                           mpol_rebind_nodemask
>                 // mempolicy->nodes has been modified,
>                 // which ac->nodemask point to
>
>         */
>         /* ac->nodemask =3D 0x3, ac->preferred->zone->nid =3D 1 */
>         if (should_reclaim_retry(gfp_mask, order, ac, alloc_flags,
>                                  did_some_progress > 0, &no_progress_loop=
s))
>                 goto retry;
> }
>
> Simultaneously starting multiple cpuset01 from LTP can quickly reproduce
> this issue on a multi node server when the maximum memory pressure is
> reached and the swap is enabled
>
> Link: https://lkml.kernel.org/r/20250416082405.20988-1-zhangtianyang@loon=
gson.cn
> Fixes: 902b62810a57 ("mm, page_alloc: fix more premature OOM due to race =
with cpuset update").
> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Brendan Jackman <jackmanb@google.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
>
>  mm/page_alloc.c |    8 ++++++++
>  1 file changed, 8 insertions(+)
>
> --- a/mm/page_alloc.c~mm-page_allocc-avoid-infinite-retries-caused-by-cpu=
set-race
> +++ a/mm/page_alloc.c
> @@ -4562,6 +4562,14 @@ restart:
>         }
>
>  retry:
> +       /*
> +        * Deal with possible cpuset update races or zonelist updates to =
avoid
> +        * infinite retries.
> +        */
> +       if (check_retry_cpuset(cpuset_mems_cookie, ac) ||
> +           check_retry_zonelist(zonelist_iter_cookie))
> +               goto restart;
> +
>         /* Ensure kswapd doesn't accidentally go to sleep as long as we l=
oop */
>         if (alloc_flags & ALLOC_KSWAPD)
>                 wake_all_kswapds(order, gfp_mask, ac);
> _
>
