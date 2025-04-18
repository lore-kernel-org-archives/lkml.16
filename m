Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD68F43AA9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 23:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745017755; cv=none; b=a0v7GoQuDlf7CEWcf5S67dVBOKGdzmj+iItTY0KjEya2wiX+wHnFRfLiJaT/ZhrHCDonGWVsHOlmoxJDx7zZDaPnnbuZebD9VWn1u1n5neFbVtwv/30e6erSGO8UEjkZxq71+zK41K0QXmv07LUyx4VuiDlZUHJIqhHZstaK240=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745017755; c=relaxed/simple;
	bh=6sjGEpMC3+Vi2nJ9w2xABl0dJ3A2VOqdDD70WwDA0Mo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OWs94UDUYwau/DPCsmpNCkLgLlqX5ITttpT2LPt2t972eaaDUiJS3idiJpDA5Of2mJRpI6waBptraN3M/7F9AtqFG7FzFOUnbdRG+mkT2dH5ryogy4MPWd8p23v/qtY6vg+wFje0ibaygsvrwtnt3J4SJLbZaplTX/RQcQ3rWho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TSkeg0SI; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TSkeg0SI"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47681dba807so389421cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745017753; x=1745622553; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s39eUTjyd3OZR5Xwz5lmeWkLFagdixJuj4CkpgONkWg=;
        b=TSkeg0SIBP+LHE8THRgiDBj6T4n1l1vUQ3l+ApnhbyKHb7h15nSqqPtFF2wX2dO+CQ
         zupYFnggS1zQNacJhyzl3+qOgE6BEW2lA3L8V4zi0G0Il37L3QuCNAmlMe6M4zlM2jmh
         akbgKDVzt0hhKj5/x0a93faIwhwMscKUuK5fWxPOr4GZFkCpa9KCF6tqYOOCCOdK+XHF
         TEzqefP2ZwBA5veNV/4MtoT6OBgVasdz8seL3XcV10BGjnJZy41ryaHQc9njtlGa+u81
         yGO8X2kXwzky+HHswNY1BghymqwPAlcUBubLmKzjUrI3OSSxWiLlyPxCLaRzUkf8vuq9
         j6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745017753; x=1745622553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s39eUTjyd3OZR5Xwz5lmeWkLFagdixJuj4CkpgONkWg=;
        b=G+oOXUkn2WAcnYla4ROz+e+eu6u2TqYfMTTLrVCKVs4t9rxBw2nkxzv37WQf9Op+iS
         Mf5LvOrRehw7iqMtCDh0ssspolg4dJ8VfMHDhdxSIA2PLTxp8pOws9LZU0XL1rFOdz/o
         2ddhZXNM+onuTnBq/rzEwxIjrRyi1MVLwIv1IC6JqQTsJ3hjque/wYKTS8qqho0oi8Uu
         H/Ae70rgIfYn9/1oExvBY3BXmjp3WDjTRAtUr8R/jBAdQ0rf0sQRAS9lFQ1dcxPKFpNn
         4apY71a17xgo6pWPVabjCO5So6aZS4qR5u/BgWiiMuO/htYCFLMhTvf7cp6R6EHhaRFo
         tXAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7rkIurY0j9Bt00FBcvRnixqukCfU1lwWRUiXgY0L4fWDc3YplB0o9U2YO+hSoP0A1sItWSJY/qlH0iVs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8XBMdGUz3uVdGeisL6bIoxc+xjEG2TGw4P2wDDLcm0ETq1+NY
	TqE0/EqW5oVFEffkAMK1tXXo9dLH5XeafetmIhRsCXAzdEDqriKSyx5PPGqmQinVLf5QL/vHNK4
	MtTHITdBvb06kFu+wlMcDEuJqfEzi8cD805eY
X-Gm-Gg: ASbGncvhmy6cJwuMa8DnMufXKH7c4fEP0xeL+tA83jvDrCe9meGxQWD52OSStcj5odh
	KNSTvY6qd9Q58NWoQnvX5OwFL7tgYdT++sKxPliJ3FeOgUIZVvQniYTGzpjrS7HjoE7qqGUQL4n
	nlYptlvCGp2vF8U1EvBZQW
X-Google-Smtp-Source: AGHT+IEwMga8FnkxB6yfcE8BciKaxf7/qerZfPfl7ngUjVohy16KmSUkQ7nlIxUja5zEZNnESvnkGCQ+eQKprNEktto=
X-Received: by 2002:ac8:5a50:0:b0:466:8887:6751 with SMTP id
 d75a77b69052e-47aecc8977cmr4542711cf.23.1745017752400; Fri, 18 Apr 2025
 16:09:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418061459.3898802-1-quic_zhenhuah@quicinc.com> <aAJtFwAH_ayIJ-SR@harry>
In-Reply-To: <aAJtFwAH_ayIJ-SR@harry>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 18 Apr 2025 16:09:00 -0700
X-Gm-Features: ATxdqUEr3YR8PqDwKFqGurPv7IWt7A_WSl6I0wLQhMQqPsA8HQZunIohgtEhWhg
Message-ID: <CAJuCfpFEoGaczKvL-fpd=tzaHvPa5xU6gMWTzp6=OPxYcxBVsA@mail.gmail.com>
Subject: Re: [PATCH] mm, slab: clean up slab->obj_exts always
To: Harry Yoo <harry.yoo@oracle.com>
Cc: Zhenhua Huang <quic_zhenhuah@quicinc.com>, cl@linux.com, rientjes@google.com, 
	vbabka@suse.cz, roman.gushchin@linux.dev, pasha.tatashin@soleen.com, 
	akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	quic_tingweiz@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 8:17=E2=80=AFAM Harry Yoo <harry.yoo@oracle.com> wr=
ote:
>
> On Fri, Apr 18, 2025 at 02:14:59PM +0800, Zhenhua Huang wrote:
> > When memory allocation profiling is disabled at runtime or due to an
> > error, shutdown_mem_profiling() is called: slab->obj_exts which
> > previously allocated remains.
> > It won't be cleared by unaccount_slab() because of
> > mem_alloc_profiling_enabled() not true. It's incorrect, slab->obj_exts
> > should always be cleaned up in unaccount_slab() to avoid following erro=
r:
> >
> > [...]BUG: Bad page state in process...
> > ..
> > [...]page dumped because: page still charged to cgroup
> >
> > Fixes: 21c690a349baa ("mm: introduce slabobj_ext to support slab object=
 extensions")
> > Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>

Thanks for reporting and fixing the issue!

> > ---
>
> Acked-by: Harry Yoo <harry.yoo@oracle.com>
>
> I reproduced the issue locally and confirmed that this patch fixes
> the issue.
>
> Tested-by: Harry Yoo <harry.yoo@oracle.com>
>
> By the way, I think this should probably be backported to -stable?
>
> --
> Cheers,
> Harry / Hyeonggon
>
> >  mm/slub.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/slub.c b/mm/slub.c
> > index dac149df1be1..b42ce3a88806 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -2023,7 +2023,7 @@ int alloc_slab_obj_exts(struct slab *slab, struct=
 kmem_cache *s,
> >       return 0;
> >  }
> >
> > -/* Should be called only if mem_alloc_profiling_enabled() */
> > +/* Should be called if slab_obj_exts(slab) */
> >  static noinline void free_slab_obj_exts(struct slab *slab)
> >  {
> >       struct slabobj_ext *obj_exts;
> > @@ -2592,7 +2592,11 @@ static __always_inline void account_slab(struct =
slab *slab, int order,
> >  static __always_inline void unaccount_slab(struct slab *slab, int orde=
r,
> >                                          struct kmem_cache *s)
> >  {
> > -     if (memcg_kmem_online() || need_slab_obj_ext())
> > +     /*
> > +      * The slab object extensions should now be freed regardless of
> > +      * whether mem_alloc_profiling_enabled() or not now.

This comment does not explain why. I amended it in my suggestion below.

> > +      */
> > +     if (memcg_kmem_online() || slab_obj_exts(slab))
> >               free_slab_obj_exts(slab);

free_slab_obj_exts() will be checking again that for
slab_obj_exts(slab) !=3D NULL. Since this change effectively removes the
static key check (mem_alloc_profiling_enabled() call inside
need_slab_obj_ext()), I think we can simply make free_slab_obj_exts()
inline function and remove the above condition completely. IOW:

static inline void free_slab_obj_exts(struct slab *slab)
{
        struct slabobj_ext *obj_exts;

        obj_exts =3D slab_obj_exts(slab);
        if (!obj_exts)
                return;
        ...
        slab->obj_exts =3D 0;
}

static __always_inline void unaccount_slab(...)
{
     /*
      * The slab object extensions should be freed regardless of
      * whether mem_alloc_profiling_enabled() or not because profiling
      * might have been disabled after slab->obj_exts got allocated.
      */
      free_slab_obj_exts(slab);
      ...
}

> >
> >       mod_node_page_state(slab_pgdat(slab), cache_vmstat_idx(s),
> > --
> > 2.25.1
> >
> >
