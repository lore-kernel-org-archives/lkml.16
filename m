Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A1D2C374D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745422526; cv=none; b=JYG9Gs6XSYsd+1IVWp+LKU+joGdkG8NKRGU/V+JHMAQ1oeGPzDtXn0Xqg7dT7Ig7TN+1x1cZ4nodM3dQR4rnVGh2PYecQTr2gAtpg0hL/EbkL2Cx3QYx2fbrCW6PkQuZer/CWYfpFRcyMRJFg4/cnpxSNmGWKAgySiR4LHIyayk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745422526; c=relaxed/simple;
	bh=i8MtGRpXKkmHJ8RkFNjpUc1nm+6EtljWpCcqkyZibXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fc9L8prZ/miraHV9fX8qX/nQqWLc/mhzbkyOTBLDJtBeuzRapVtTEOkMgWuH6m65xB2cP4c9RXjHC9g4W8pwKxomEcWRPXeXAPETagY1jfgfy/AfUS6U+Iq7eIUgU2pAdwABe6HoPuq7pHAo4CXNVa7pWTDaaHYsCjUnasOdE/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UA2koL8p; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UA2koL8p"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-47666573242so537241cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745422524; x=1746027324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+jyAAC0t/JStHxcoSH+ZIpFBol3lCP0Cb116iznOcU=;
        b=UA2koL8pkvxBqV5v9sxef4+sVPTSfY8m+VnlpZnZCsRvNhhDW+s2FFM0Fo2/kpkfQi
         2Mt1sinfa/+Okmh8GQXXpPdKnE7VwAR/Sthwz3jHhjBs4PRweMbPaFi39rSiMgS/6OMK
         q3k8EiOerYyLMPlG9vQ/0pG7lczCyo0FYkoWyzUck6ShMvoUcbPS32iEv1rS4cV11B8d
         bwh3P52Vt2DlYmJtDqEzlSeY6wLJupp/M5iZaI4Ic2HZ//bLou06sLn6GMRPdn18wgGx
         Y6BP0gUA68bczKR6R6sr65Ok/N3IkN/+L+IWPjyZasW1ItDTG3fYf8tcBd3tUrtgRXG/
         AsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745422524; x=1746027324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+jyAAC0t/JStHxcoSH+ZIpFBol3lCP0Cb116iznOcU=;
        b=hr+HKTV7HGaI7SLwRuOXIhO5s6G0uYE09kJsSt6kRYLQ9sluuoKYlj5PvCkvdJoEu0
         B4+dL+5C7NiuNUEWYXEKjrenM4+PHoPqX3+oEQDs55UUy5FhCZj4szXlZoN8TdMuLVMf
         amFAU/9eSIneCBK9xsHLIIRxte0M21fKaSkjCheRygL7s4Ex0480dODJo2oa0BqFN1dG
         LYkpzE/j2UEfiQLlTEii3EKcdhcXA0/DKy68RnUqtvzbNvkkxRxDSpSeCST443xj+9hr
         ZYzcI99+IsZZxKFWXmiYJTZdiT+CD5J4JMIABj9yT/BJ+3bZZvLtP49XDVAKHNYpbb/o
         f++w==
X-Forwarded-Encrypted: i=1; AJvYcCWZ1YfaCgiQCbsxU3leReuynrDuCnhTACByayQ7O6hm41CBetZsZ1zTeXse3cj7Nt3BdvF8u1L/TMbv35g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx82GXCnMEJmMcJ34tCJHGBTFIXYRJbn5KMKLmGhtg3OFeY6PqU
	gwDer3gyxOYujIr3tPDdjzLXLiWJfhmrWxDX8G4UGXtoJT3R+z1o6lFS2AWD/xYtmK6Qaxjknbt
	U7kphSVZ8HFrf36bQxoIqgvrlkX/BD+X+6wwM
X-Gm-Gg: ASbGncuhf4R0GggfFOco/BZdH0jh5LsWAEMGhpqMyMgtf36CyiNo8n9ubY0vtvMrthJ
	6qmNlybpfcmqT+uhlv1mpBbClwh5XM/DzOJZ0sbe76Zcw/hQlkziHRhIKKnmS6tteJMV0TggT+C
	bwnQJ2LZ1aQwfxQJHdC8Bn
X-Google-Smtp-Source: AGHT+IExSWvIcGM87Yoi6Vq5pwwOc0D9jRXmsMz/YeACIxtJ+JJu8ohw9anNP3Y3bwIZtGW3Ieq9Vl5FqpnunleAUDE=
X-Received: by 2002:a05:622a:22a6:b0:477:8577:1532 with SMTP id
 d75a77b69052e-47d13ae4751mr4998901cf.28.1745422523428; Wed, 23 Apr 2025
 08:35:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416082405.20988-1-zhangtianyang@loongson.cn>
 <aAYXP4f417_bx6Is@harry> <CAJuCfpGEm04Eebt7FK=keu3ZF_34GTTmxMWVCiA1q3RQAVwAOA@mail.gmail.com>
 <f7f831bc-8887-4974-a869-f5f473d3040c@loongson.cn>
In-Reply-To: <f7f831bc-8887-4974-a869-f5f473d3040c@loongson.cn>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 23 Apr 2025 08:35:11 -0700
X-Gm-Features: ATxdqUF14ylfywPy9oQmaC1VNJDZ3efVx9inPJcex-IU_JLBZJBblY01bJwKl4E
Message-ID: <CAJuCfpHBB+0HG_2ZJ4h683TYJEz__c+L3Z6RZUbzX+7R1_VSNg@mail.gmail.com>
Subject: Re: [PATCH] mm/page_alloc.c: Avoid infinite retries caused by cpuset race
To: Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: Harry Yoo <harry.yoo@oracle.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>, 
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 7:39=E2=80=AFPM Tianyang Zhang
<zhangtianyang@loongson.cn> wrote:
>
> Hi, Suren
>
> =E5=9C=A8 2025/4/22 =E4=B8=8A=E5=8D=884:28, Suren Baghdasaryan =E5=86=99=
=E9=81=93:
> > On Mon, Apr 21, 2025 at 3:00=E2=80=AFAM Harry Yoo <harry.yoo@oracle.com=
> wrote:
> >> On Wed, Apr 16, 2025 at 04:24:05PM +0800, Tianyang Zhang wrote:
> >>> __alloc_pages_slowpath has no change detection for ac->nodemask
> >>> in the part of retry path, while cpuset can modify it in parallel.
> >>> For some processes that set mempolicy as MPOL_BIND, this results
> >>> ac->nodemask changes, and then the should_reclaim_retry will
> >>> judge based on the latest nodemask and jump to retry, while the
> >>> get_page_from_freelist only traverses the zonelist from
> >>> ac->preferred_zoneref, which selected by a expired nodemask
> >>> and may cause infinite retries in some cases
> >>>
> >>> cpu 64:
> >>> __alloc_pages_slowpath {
> >>>          /* ..... */
> >>> retry:
> >>>          /* ac->nodemask =3D 0x1, ac->preferred->zone->nid =3D 1 */
> >>>          if (alloc_flags & ALLOC_KSWAPD)
> >>>                  wake_all_kswapds(order, gfp_mask, ac);
> >>>          /* cpu 1:
> >>>          cpuset_write_resmask
> >>>              update_nodemask
> >>>                  update_nodemasks_hier
> >>>                      update_tasks_nodemask
> >>>                          mpol_rebind_task
> >>>                           mpol_rebind_policy
> >>>                            mpol_rebind_nodemask
> >>>                // mempolicy->nodes has been modified,
> >>>                // which ac->nodemask point to
> >>>
> >>>          */
> >>>          /* ac->nodemask =3D 0x3, ac->preferred->zone->nid =3D 1 */
> >>>          if (should_reclaim_retry(gfp_mask, order, ac, alloc_flags,
> >>>                                   did_some_progress > 0, &no_progress=
_loops))
> >>>                  goto retry;
> >>> }
> >>>
> >>> Simultaneously starting multiple cpuset01 from LTP can quickly
> >>> reproduce this issue on a multi node server when the maximum
> >>> memory pressure is reached and the swap is enabled
> >>>
> >>> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> >>> ---
> >> What commit does it fix and should it be backported to -stable?
> > I think it fixes 902b62810a57 ("mm, page_alloc: fix more premature OOM
> > due to race with cpuset update").
>
> I think this issue is unlikely to have been introduced by Patch
> 902b62810a57 ,
>
> as the infinite-reties section from
>
> https://elixir.bootlin.com/linux/v6.15-rc3/source/mm/page_alloc.c#L4568
> to
> https://elixir.bootlin.com/linux/v6.15-rc3/source/mm/page_alloc.c#L4628
>
> where the cpuset race condition occurs remains unmodified in the logic
> of Patch 902b62810a57.

Yeah, you are right. After looking into it some more, 902b62810a57 is
a wrong patch to blame for this infinite loop.

>
> >> There's a new 'MEMORY MANAGEMENT - PAGE ALLOCATOR' entry (only in
> >> Andrew's mm.git repository now).
> >>
> >> Let's Cc the page allocator folks here!
> >>
> >> --
> >> Cheers,
> >> Harry / Hyeonggon
> >>
> >>>   mm/page_alloc.c | 8 ++++++++
> >>>   1 file changed, 8 insertions(+)
> >>>
> >>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> >>> index fd6b865cb1ab..1e82f5214a42 100644
> >>> --- a/mm/page_alloc.c
> >>> +++ b/mm/page_alloc.c
> >>> @@ -4530,6 +4530,14 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigne=
d int order,
> >>>        }
> >>>
> >>>   retry:
> >>> +     /*
> >>> +      * Deal with possible cpuset update races or zonelist updates t=
o avoid
> >>> +      * infinite retries.
> >>> +      */
> >>> +     if (check_retry_cpuset(cpuset_mems_cookie, ac) ||
> >>> +         check_retry_zonelist(zonelist_iter_cookie))
> >>> +             goto restart;
> >>> +
> > We have this check later in this block:
> > https://elixir.bootlin.com/linux/v6.15-rc3/source/mm/page_alloc.c#L4652=
,
> > so IIUC you effectively are moving it to be called before
> > should_reclaim_retry(). If so, I think you should remove the old one
> > (the one I linked earlier) as it seems to be unnecessary duplication
> > at this point.
> In my understanding, the code in
>
> https://elixir.bootlin.com/linux/v6.15-rc3/source/mm/page_alloc.c#L4652
>
> was introduced to prevent unnecessary OOM (Out-of-Memory) conditions
> in__alloc_pages_may_oom.
>
> If old code is removed, the newly added code (on retry loop entry)
> cannot guarantee that the cpuset
>
> remains valid when the flow reaches in__alloc_pages_may_oom, especially
> if scheduling occurs during this section.

Well, rescheduling can happen even between
https://elixir.bootlin.com/linux/v6.15-rc3/source/mm/page_alloc.c#L4652
and https://elixir.bootlin.com/linux/v6.15-rc3/source/mm/page_alloc.c#L4657
but I see your point. Also should_reclaim_retry() does not include
zonelist change detection, so keeping the checks at
https://elixir.bootlin.com/linux/v6.15-rc3/source/mm/page_alloc.c#L4652
sounds like a good idea.

>
> Therefore, I think retaining the original code logic is necessary to
> ensure correctness under concurrency.
>
> >
> >
> >>>        /* Ensure kswapd doesn't accidentally go to sleep as long as w=
e loop */
> >>>        if (alloc_flags & ALLOC_KSWAPD)
> >>>                wake_all_kswapds(order, gfp_mask, ac);
> >>> --
> >>> 2.20.1
> >>>
> >>>
> Thanks
>
