Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2742E11B5;
	Fri, 13 Jun 2025 16:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749832413; cv=none; b=ggI/W92Gpk1C3iAkjaLBoqoYVLBbIeKMN1Nd3AT8i152Gil0ew+lfjQ+Luet+JRgm3xDpkKtlwU1WPfAVycrA9ANR3UfrxQkzASu0etp4HF3VDtnPwcejykDZq79hn+BNvxC9L4HitnqmqM5+ndFBjdxkgbTe4MxM8I1kWWNfRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749832413; c=relaxed/simple;
	bh=1WcSibMacZOYwlTkoDbYGvtq44j+e8sb3UdJnXTKqC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pd00AvCBF7aNQnYsIpPi1yNmgza2xPrZip7btgHYuc0mjyfPGHejIoW5f7Z3sUQqIoqZ8yp981tf3xFUKAkGMRCVw//RB++HFcKkTVWozrYVU2VMDslDath7EwC8mjJnUC+x1JW72oN0HetwR9eK7pGdKRFvqWp+2ohWFAdPi50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUc0gRyK; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUc0gRyK"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-adb2bd27c7bso350816666b.2;
        Fri, 13 Jun 2025 09:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749832410; x=1750437210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Va7AE6ZRu0tUcIQ8yzYRsNan45fKyNNXoobCqFtK7Vc=;
        b=TUc0gRyKWj4D7pYXIG+9KszbZp1yMHnJlI21nQH2xlZu/Xdkoc+VcjNySy4aGEs6/n
         edG7WVcYNokdDgVlaTltsFaAIWOYqLKHmDBy61m+Gm7U9vbRJl3pvG8yS9JuLLIBmb1i
         J0Pk/zLRLknYc5V8nXwovJ7tSZvoGCMnSTsvZpSai5jc0dKeNnV0YF9Bb2F5yUpVM97Q
         zETwmPMJg76s0VE0DXY/Og2r3zSM980DUD9MWIumZHR/WDGJZt9wJJTkua/ITT0NeRKp
         q9OQwLZcEZ9ia3ZdnSVEI8U2mQDAtGEmkEuuikYgsNvmqjOnZ+ov8a2K5a1GOVaHPn9M
         sYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749832410; x=1750437210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Va7AE6ZRu0tUcIQ8yzYRsNan45fKyNNXoobCqFtK7Vc=;
        b=gRs7tM2S3Oa+Kc8Cx3IK9rZwv7pYqKl2pMtCr+R9ulW2TI10SZgyKn2IzUFUgMmns8
         0BMnkkPIZYqylqi0B5u3BFfEjYZb38x2Yez40vJcJz9aaxpldqq1HnayTHB425+ZQqjm
         oGr0NIfWmOtdZ7kwCfsxvvhx/3Oc13VcQVHeRyraMNvsAf0mpjTcVvwwpHwhqF6rGTk5
         4qi/mVqJZuovG+owKcnnJvISSDj093bgrkiUxHAAi3dE31XrUZD72K1EblBghSLTtE+E
         2cvyfq3Y/e5OpZ+iP9HGRKN+jm/ZxOqoS7OwXr3Igjuw+H3dahPdk/dshHg14WtzqC3m
         JCVw==
X-Forwarded-Encrypted: i=1; AJvYcCWELFW3CN3HWiXC1ULkcVJgVko7fuT8Lw7PUDu/arEsr3cSom8BaJnRKenooldBdUVPrOTdt0UYysM97rg1@vger.kernel.org, AJvYcCWH1E82KtgjRCdWetODpvlHfr0vx0UscSLboTVnV3rUYHoY5n5AHEjTQnTTsowKYFwYZUGluv16xT8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9zYy9hYTDfJe7FDtGXWIlvOpoi685Q2iR+/n2weanj8tGJkPS
	4XMkesAkvIrMTBIt4iqpLighlsFeQI232PmB0x8SBZKkUl2ct5xJjXIrNpthP3XCoaorJYs+evS
	GBl/Hv0kOGgvOYn5nLXCqyFO2rCMZlDI=
X-Gm-Gg: ASbGnct3z6KW4iNoBSahVOLNX/4gaOQzvRnBYr/341M8FL7shmUtO77FkgSVcmO7B0C
	xWugC/b/HW8A+egsRBy/iogYXyDPApzrozKRhxUZCYUAdrTVWv/n/fPtlHSBSzIzQveczJi/VRF
	NllfBZBafEQEysUTklr+HjX11MYyTtpuDC6mBzGWt1XXqPqJ12NxNw6jkFQrZLWQhH0Phod6JxD
	GJO
X-Google-Smtp-Source: AGHT+IG/OBkyK/agG2UVMmJWvTU1QMm4SmGMs9KD3Ezvf+J2tTxEtlceU4dEUBXWyJAHxcNkqh7edre0kjWHg3dWMyQ=
X-Received: by 2002:a17:906:fe0c:b0:ad8:93a3:299c with SMTP id
 a640c23a62f3a-adec5436bc6mr372908166b.10.1749832409926; Fri, 13 Jun 2025
 09:33:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612181330.31236-1-bijan311@gmail.com> <20250612181330.31236-2-bijan311@gmail.com>
 <5a50eeba-b26d-4913-8016-45278608a1ee@redhat.com>
In-Reply-To: <5a50eeba-b26d-4913-8016-45278608a1ee@redhat.com>
From: Bijan Tabatabai <bijan311@gmail.com>
Date: Fri, 13 Jun 2025 11:33:18 -0500
X-Gm-Features: AX0GCFuazzkdI3MgkIT3-iQtcMQlbIVIrSXGr9CiMXXa7M0L7hQSrqNXvr4KFyU
Message-ID: <CAMvvPS5U8exSvy0fknfhv8ym_dKgMVa7cfMOqn0fGyd+NSjSuQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] mm/mempolicy: Expose policy_nodemask() in include/linux/mempolicy.h
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sj@kernel.org, akpm@linux-foundation.org, 
	corbet@lwn.net, ziy@nvidia.com, matthew.brost@intel.com, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	gourry@gourry.net, ying.huang@linux.alibaba.com, apopple@nvidia.com, 
	bijantabatab@micron.com, venkataravis@micron.com, emirakhur@micron.com, 
	ajayjoshi@micron.com, vtavarespetr@micron.com, damon@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 8:45=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 12.06.25 20:13, Bijan Tabatabai wrote:
> > From: Bijan Tabatabai <bijantabatab@micron.com>
> >
> > This patch is to allow DAMON to call policy_nodemask() so it can
> > determine where to place a page for interleaving.
> >
> > Signed-off-by: Bijan Tabatabai <bijantabatab@micron.com>
> > ---
> >   include/linux/mempolicy.h | 9 +++++++++
> >   mm/mempolicy.c            | 4 +---
> >   2 files changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/linux/mempolicy.h b/include/linux/mempolicy.h
> > index 0fe96f3ab3ef..e96bf493ff7a 100644
> > --- a/include/linux/mempolicy.h
> > +++ b/include/linux/mempolicy.h
> > @@ -133,6 +133,8 @@ struct mempolicy *__get_vma_policy(struct vm_area_s=
truct *vma,
> >   struct mempolicy *get_vma_policy(struct vm_area_struct *vma,
> >               unsigned long addr, int order, pgoff_t *ilx);
> >   bool vma_policy_mof(struct vm_area_struct *vma);
> > +nodemask_t *policy_nodemask(gfp_t gfp, struct mempolicy *pol,
> > +             pgoff_t ilx, int *nid);
> >
> >   extern void numa_default_policy(void);
> >   extern void numa_policy_init(void);
> > @@ -232,6 +234,13 @@ static inline struct mempolicy *get_vma_policy(str=
uct vm_area_struct *vma,
> >       return NULL;
> >   }
> >
> > +static inline nodemask_t *policy_nodemask(gfp_t gfp, struct mempolicy =
*pol,
> > +                             pgoff_t ilx, int *nid)
> > +{
> > +     *nid =3D NUMA_NO_NODE;
> > +     return NULL;
> > +}
> > +
> >   static inline int
> >   vma_dup_policy(struct vm_area_struct *src, struct vm_area_struct *dst=
)
> >   {
> > diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> > index 3b1dfd08338b..54f539497e20 100644
> > --- a/mm/mempolicy.c
> > +++ b/mm/mempolicy.c
> > @@ -596,8 +596,6 @@ static const struct mempolicy_operations mpol_ops[M=
POL_MAX] =3D {
> >
> >   static bool migrate_folio_add(struct folio *folio, struct list_head *=
foliolist,
> >                               unsigned long flags);
> > -static nodemask_t *policy_nodemask(gfp_t gfp, struct mempolicy *pol,
> > -                             pgoff_t ilx, int *nid);
> >
> >   static bool strictly_unmovable(unsigned long flags)
> >   {
> > @@ -2195,7 +2193,7 @@ static unsigned int interleave_nid(struct mempoli=
cy *pol, pgoff_t ilx)
> >    * Return a nodemask representing a mempolicy for filtering nodes for
> >    * page allocation, together with preferred node id (or the input nod=
e id).
> >    */
> > -static nodemask_t *policy_nodemask(gfp_t gfp, struct mempolicy *pol,
> > +nodemask_t *policy_nodemask(gfp_t gfp, struct mempolicy *pol,
> >                                  pgoff_t ilx, int *nid)
> >   {
> >       nodemask_t *nodemask =3D NULL;
>
> You actually only care about the nid for your use case.
>
> Maybe we should add
>
> get_vma_policy_node() that internally does a get_vma_policy() to then
> give you only the node back.
>
> If get_vma_policy() is not the right thing (see my reply to patch #2),
> of course a get_task_policy_node() could be added.
>
> --
> Cheers,
>
> David / dhildenb

Hi David,

I did not use get_vma_policy or mpol_misplaced, which I believe is the
closest function that exists for what I want in this patch, because
those functions
seem to assume they are called inside of the task that the folio/vma
is mapped to.
More specifically, mpol_misplaced assumes it is being called within a
page fault.
This doesn't work for us, because we call it inside of a kdamond process.

I would be open to adding a new function that takes in a folio, vma,
address, and
task_struct and returns the nid the folio should be placed on. It could pos=
sibly
be implemented as a function internal to mpol_misplaced because the two wou=
ld
be very similar.

How would you propose we handle MPOL_BIND and MPOL_PREFFERED_MANY
in this function? mpol_misplaced chooses a nid based on the node and
cpu the fault
occurred on, which we wouldn't have in a kdamond context. The two options I=
 see
are either:
1. return the nid of the first node in the policy's nodemask
2. return NUMA_NO_NODE
I think I would lean towards the first.

Thanks,
Bijan
