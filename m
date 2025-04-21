Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0E61F0E37
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 20:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745267322; cv=none; b=umyXvhkejnLplrjkU/M6SrTNbKIUQJUNiUwvKMJD+7HXFtrSX5BBeRC0lfhbq+mc3g7q5UqWW/G0SgqSe/oOlzpLJXMEXSuCDIYe1yE/J0u9WvytxU2xXWSMqbVA4VEW4cpAZiFgn8T63L6lJpb2/FVby0at07wlXT7S3yHL5xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745267322; c=relaxed/simple;
	bh=PLTr1Ulpsr9k+KHFPxW2Lu0AMysDGEixWNOVjNAyozg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/A5enoGNR8pqdfIId/4TG3y6HB00jwUMWIr4EJRqgvKSfGTYuzGBre61596bDn2Lx2UN9EjZhGCTQeY5z+qzS6HRa+2nzLOmG3nXeexcDC6OzkK6LU51oTOmqleWGjzQuXOCyl+AunPWWsLrViA6U5q/RNJTcEOpl/dO//N4UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X+fCYdEA; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X+fCYdEA"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4769e30af66so1377271cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 13:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745267319; x=1745872119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAh5KnPVbnTCxFdYE9r8rfJKB6a6HWJ1fuiZEddcuQU=;
        b=X+fCYdEAHsmiWvKXTyetk8LKhZQYvF7grh7AyqguAQzWarKP7Xq7V9u3jRPP8OCB7P
         Yjf459TsZ906h1qFB9w6Jf1QmNQV/Vividzp1ZxCatXMmbfN3DErpxOU/Xv5VoTQ/59h
         a7oz0FKEmJimHCFfxF8kz4LJG2Ud5IfitQj9Ks0pf7L0XilVZhNrH/1mlZGfzJY2vnTc
         u0NX6fW0g6GrwjV5dbkmdA9HNMOg+qu8JBBKveBwXVH9d7ANwl3ADYQM2qUMIqyVi5UH
         afBIGeGg1LYTjPwS3PU5Fcg8KdH1d6GWkWyvVM0PT28C5yYE7glOl6sh57kDNcrTnfpd
         RXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745267319; x=1745872119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAh5KnPVbnTCxFdYE9r8rfJKB6a6HWJ1fuiZEddcuQU=;
        b=nMl9jQv8/RM8WHWYxs6cLWN1fyOB5cJP+u4W2t6zhURKLOJcwNnakdRtJfhMElJYQs
         qV3iPOm5VthdNe551+GGsKNzQdPshQMJNSsf5A6CX06Qlw7H/DrmI8/fTYsGYOxj+GDS
         2YCeATMKAmmZ+NKy/ghqqTqKyZMkPqaBObQlav7IC2FQpC9VNMuQ/Nl4ZwZ7kMbuQlah
         SWQAlERorPBiKir6iwkjQtP6/8+F+lV47iLt4F2dNhefjtkeylUfJTNKbd8dZtm7GLEn
         3I3UIyelpvaflQr22+bDGdVPgizG3CgzVVtVNh5wuzduIVCjqCIQ9mNu1U0ASxPTPl3z
         HzZg==
X-Forwarded-Encrypted: i=1; AJvYcCW4TKYV0KmO7lW0U39hNUFADi4PtmsN0FJFYjhppG9DVS6ZSjwHdmkdEtFvmYBQppUwDzniMDKwrjcuKJU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNBOtlstthn4R00/2FMTbgfCbTxPe0ySEnEMSE64MRAGBWb88e
	TXcLpVLhvTYrZ12WW3FRLbQkFhfC/jEKq8gpceuqvfi0mGBkHyPpOqM8GPkmrnL/B4GOwQKVNQH
	Izh2on03js414DhIURwPulFniCXDDApU2QzL8
X-Gm-Gg: ASbGnctDUmX8faV+a6Z4hJHQTDdoibhUbtRxTWRvU+RF+9yc14CNLB3mksUForn39gp
	xxKZU39/mpgNobX7qcvqYf+kPnKtl3cvBBNZOUdOeN5F0OULEbhpFjr2J43O2U5zoquhx/Gv6t0
	SMnWhMZLUrr+k2mybOLWYT
X-Google-Smtp-Source: AGHT+IGKnE2CIBvT+fJdgDDbnrOGCsN9elt+h8uaJ3CxRx8HwLHVmG+as9HEI4lJpad7auuLPovlZ4a8MNRr3oL9OoY=
X-Received: by 2002:ac8:1304:0:b0:47b:4be:8572 with SMTP id
 d75a77b69052e-47b04be86dbmr5883011cf.18.1745267319186; Mon, 21 Apr 2025
 13:28:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416082405.20988-1-zhangtianyang@loongson.cn> <aAYXP4f417_bx6Is@harry>
In-Reply-To: <aAYXP4f417_bx6Is@harry>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 21 Apr 2025 13:28:28 -0700
X-Gm-Features: ATxdqUFZ0mfZx8F5w1Q3I-1gslA_ZYU57nOssRIGO90YafrqVQ_j_evO36xBIiI
Message-ID: <CAJuCfpGEm04Eebt7FK=keu3ZF_34GTTmxMWVCiA1q3RQAVwAOA@mail.gmail.com>
Subject: Re: [PATCH] mm/page_alloc.c: Avoid infinite retries caused by cpuset race
To: Harry Yoo <harry.yoo@oracle.com>
Cc: Tianyang Zhang <zhangtianyang@loongson.cn>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Vlastimil Babka <vbabka@suse.cz>, Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 3:00=E2=80=AFAM Harry Yoo <harry.yoo@oracle.com> wr=
ote:
>
> On Wed, Apr 16, 2025 at 04:24:05PM +0800, Tianyang Zhang wrote:
> > __alloc_pages_slowpath has no change detection for ac->nodemask
> > in the part of retry path, while cpuset can modify it in parallel.
> > For some processes that set mempolicy as MPOL_BIND, this results
> > ac->nodemask changes, and then the should_reclaim_retry will
> > judge based on the latest nodemask and jump to retry, while the
> > get_page_from_freelist only traverses the zonelist from
> > ac->preferred_zoneref, which selected by a expired nodemask
> > and may cause infinite retries in some cases
> >
> > cpu 64:
> > __alloc_pages_slowpath {
> >         /* ..... */
> > retry:
> >         /* ac->nodemask =3D 0x1, ac->preferred->zone->nid =3D 1 */
> >         if (alloc_flags & ALLOC_KSWAPD)
> >                 wake_all_kswapds(order, gfp_mask, ac);
> >         /* cpu 1:
> >         cpuset_write_resmask
> >             update_nodemask
> >                 update_nodemasks_hier
> >                     update_tasks_nodemask
> >                         mpol_rebind_task
> >                          mpol_rebind_policy
> >                           mpol_rebind_nodemask
> >               // mempolicy->nodes has been modified,
> >               // which ac->nodemask point to
> >
> >         */
> >         /* ac->nodemask =3D 0x3, ac->preferred->zone->nid =3D 1 */
> >         if (should_reclaim_retry(gfp_mask, order, ac, alloc_flags,
> >                                  did_some_progress > 0, &no_progress_lo=
ops))
> >                 goto retry;
> > }
> >
> > Simultaneously starting multiple cpuset01 from LTP can quickly
> > reproduce this issue on a multi node server when the maximum
> > memory pressure is reached and the swap is enabled
> >
> > Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> > ---
>
> What commit does it fix and should it be backported to -stable?

I think it fixes 902b62810a57 ("mm, page_alloc: fix more premature OOM
due to race with cpuset update").

>
> There's a new 'MEMORY MANAGEMENT - PAGE ALLOCATOR' entry (only in
> Andrew's mm.git repository now).
>
> Let's Cc the page allocator folks here!
>
> --
> Cheers,
> Harry / Hyeonggon
>
> >  mm/page_alloc.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > index fd6b865cb1ab..1e82f5214a42 100644
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
> > @@ -4530,6 +4530,14 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned =
int order,
> >       }
> >
> >  retry:
> > +     /*
> > +      * Deal with possible cpuset update races or zonelist updates to =
avoid
> > +      * infinite retries.
> > +      */
> > +     if (check_retry_cpuset(cpuset_mems_cookie, ac) ||
> > +         check_retry_zonelist(zonelist_iter_cookie))
> > +             goto restart;
> > +

We have this check later in this block:
https://elixir.bootlin.com/linux/v6.15-rc3/source/mm/page_alloc.c#L4652,
so IIUC you effectively are moving it to be called before
should_reclaim_retry(). If so, I think you should remove the old one
(the one I linked earlier) as it seems to be unnecessary duplication
at this point.


> >       /* Ensure kswapd doesn't accidentally go to sleep as long as we l=
oop */
> >       if (alloc_flags & ALLOC_KSWAPD)
> >               wake_all_kswapds(order, gfp_mask, ac);
> > --
> > 2.20.1
> >
> >
