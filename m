Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8501E1DE8
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747844990; cv=none; b=tU4Qh5sIz5V7uckVA6LUN/RAp+o+8wyH1p65s3CdmU5JZj7R4+hVKMUPoC3RUebklhn56knRN2jWLH0XUF9gV24mUqU15pMQHTng7HbMS4n5nrgLZIEyzvqpfycoEbkwX7JcZLPkp+o2q85m2EyEiHteg4PfmibQsPtiG416mN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747844990; c=relaxed/simple;
	bh=dW1a0qTCdTHOe2oOZRMlRZcey+zA1ucyIoehaoyOH6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XV17zBEyPO7sHwdJjEEy+rdqNK1lnWDwK6x1ejPADrd8Ae/N9Fp39zTZQk+a9ZZz+bOPlljUNziIxHIzux8RlywUp18Zrioz2DxUcNQApGGjJ6+TZZ/IVQ6ede9AoO8jWq9pX3wN/gNUINHllynUC9cVHHYiKO84E/thK6/3jLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GZMuUVTv; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GZMuUVTv"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-48b7747f881so1519891cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747844988; x=1748449788; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ve6f2xqXyf5eDt4m2bt8ps+wqbQbqE7Tet8kA7dLQFU=;
        b=GZMuUVTvCUSkdASFB1yxw+WPDia6xQBGwjzfrS8t7zmyfCadq6cEa7Z1opQc/4jAB0
         BVoxVFauoEttu+b71LZuNB/tzLFFEyQVMcDXvFCXeSiJyUu8UeUU+TETyMx/iI34H4+F
         vJZV8rzfrBQSA9xhB3arzZeo2yqAfkwrlEOEgop/TVXBYKl5ZFanXyIf+3n+lqtSmp8a
         YC+ZpBsygCQNxEZkT5K/qMArf+d+azk2ifs8JJMNPyin81vfJGjzy1y8wr9sW9zXUuGh
         Enzxf7FhTS8r4v9hudwXAGZeCMLm7NukAXN9afuh27Vge1xVBy5ieelQct2LGvFxPmyB
         wZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747844988; x=1748449788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ve6f2xqXyf5eDt4m2bt8ps+wqbQbqE7Tet8kA7dLQFU=;
        b=ZDwbn61aHOxbM/3ggEgMkDipFySlFhPXS2TbKJ29aFXNdeNP89M/7oZkXOBctW9Dvz
         NaMXkakHmORA9RSTgVUp+ZvAEMri6+9SXcBbtMDKOHY6WblFAKPJIwbUxNONDlPjOulV
         VtBNJnds8g65RQf2ZDiAA2BcBxCOObp35qGiE9Kxb+Xf+e9B/Skh7K+IF+NxuWz6Flso
         S1wCit1/7vqzJHWvvn+n/c1iynC3nA4tRxb046BujvX0sTIyWFYnnui8/TD/UD6J/kjY
         VGen8oVinrPMrfKAD8rhn5MLjaVttU/T+/ynVCZWYJ8+eXO5YGCnNQozAU7WWahwvLJN
         VV2w==
X-Forwarded-Encrypted: i=1; AJvYcCX8reVEIGULeQ5CYJBBK1HlsCiqbbQcUFKOTNViHNxWK8ooeFlVTBgjFmU3UpXlvpJkroczpXBejmWNkm0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGwjXx7PpTOFDa5RP3efhornIqW4gm3VAJ/biJRHW6wF/SBBGz
	C0mnBE/iXTfLP/3acisTt52l7qiaQvecXtMneo9V5vOkoE+LUOow4oirl/VCSLPOLTYhz1xip2e
	p1VXq1Kukxdf6dmAAafPEYeU1WZ9GHMQIyZkk/HVn
X-Gm-Gg: ASbGnct3XspBa3RBezmVnk3M+lxgwD0AQLsAzFpqp2MQ2RmC17mZzwRNESCyYwclsPU
	1bG+PGxw/NnaMPfi4f4hpky48IfN/OnX9yf73UBaZO8Vr+UgCBWJjgev/gQDDDWxBldsZFtvlHf
	A4B4H2o05N8QldveIexLtEVUU/FDcSR1slsedxwCd9TjUefDMMbOf0SFR65OXA3jeELIrjT1Lz8
	w==
X-Google-Smtp-Source: AGHT+IF4vRnCu/Qyj28nj92NPbeNkPOrDf8ATNK7jsHb4xuUnafzS15vPRBRNqqDt0Pzzkmkta6ELHPj9Y6uITNO0Mg=
X-Received: by 2002:ac8:5781:0:b0:47e:a6ff:a215 with SMTP id
 d75a77b69052e-495864e985amr17325441cf.0.1747844987652; Wed, 21 May 2025
 09:29:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521142521.3033264-1-usamaarif642@gmail.com>
 <CAJuCfpGtb9j1y93bksErU4NfjPX6tGrP6qvMrazx3+M7dJWtxQ@mail.gmail.com> <da5a2a97-060d-441d-b66d-9a0dd6bb7a7a@gmail.com>
In-Reply-To: <da5a2a97-060d-441d-b66d-9a0dd6bb7a7a@gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 21 May 2025 09:29:35 -0700
X-Gm-Features: AX0GCFtQw9kHtYz6P7hsT3tw49iK_kxliqp14a0yxHWiABTp1Lzo6YbKTrXLPj8
Message-ID: <CAJuCfpG1ffe6Q4QUMEV5gHVX3Wy8qmNiexufeO__Xx8CcayqHA@mail.gmail.com>
Subject: Re: [PATCH] mm: slub: do not warn when allocating slab obj extensions fails
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, hannes@cmpxchg.org, shakeel.butt@linux.dev, 
	vlad.wing@gmail.com, linux-mm@kvack.org, kent.overstreet@linux.dev, 
	cl@gentwo.org, rientjes@google.com, vbabka@suse.cz, roman.gushchin@linux.dev, 
	harry.yoo@oracle.com, linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 9:21=E2=80=AFAM Usama Arif <usamaarif642@gmail.com>=
 wrote:
>
>
>
> On 21/05/2025 17:02, Suren Baghdasaryan wrote:
> > On Wed, May 21, 2025 at 7:25=E2=80=AFAM Usama Arif <usamaarif642@gmail.=
com> wrote:
> >>
> >> In memory bound systems, a large number of warnings for failing this
> >> allocation repeatedly may mask any real issues in the system
> >> during memory pressure being reported in dmesg. Failing this
> >> allocation is not indicative of a bug, so remove the warning.
> >>
> >> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> >> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
> >> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f=
0a@gmail.com/
> >> ---
> >> v1 -> v2:
> >> - remove the warning completely. We will have a way in the
> >>   future to indicate that the mem alloc profile is inaccurate.
> >> ---
> >>  mm/slub.c | 4 +---
> >>  1 file changed, 1 insertion(+), 3 deletions(-)
> >>
> >> diff --git a/mm/slub.c b/mm/slub.c
> >> index dc9e729e1d26..06ab9a558b73 100644
> >> --- a/mm/slub.c
> >> +++ b/mm/slub.c
> >> @@ -2102,9 +2102,7 @@ prepare_slab_obj_exts_hook(struct kmem_cache *s,=
 gfp_t flags, void *p)
> >>
> >>         slab =3D virt_to_slab(p);
> >>         if (!slab_obj_exts(slab) &&
> >> -           WARN(alloc_slab_obj_exts(slab, s, flags, false),
> >> -                "%s, %s: Failed to create slab extension vector!\n",
> >> -                __func__, s->name))
> >> +           alloc_slab_obj_exts(slab, s, flags, false))
> >
> > I thought we agreed to having pr_warn_once() here. Did I miss something=
?
> >
>
> I had [1] yesterday but I saw Johannes's mail [2] in and Harry mentioned =
in [3] that
> failing to allocate the extension vector can happen during normal operati=
ons. So I
> thought maybe there are more votes for removing it.
>
> I am ok with either pr_warn_once or removing it completely.

I feel like we should have at least some indication that something
went wrong here.

>
> I guess the question is, is it considered OK to fail here?

Well, it's not ok but not catastrophic either, so warning seems
appropriate to me.

>
> [1] https://lore.kernel.org/all/64b19c8f-e02e-490b-b987-9a996f36be21@gmai=
l.com/
> [2] https://lore.kernel.org/all/20250520171814.GC773385@cmpxchg.org/
> [3] https://lore.kernel.org/all/20250520171814.GC773385@cmpxchg.org/
