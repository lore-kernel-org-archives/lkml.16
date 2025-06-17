Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DD0C2D1
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750137567; cv=none; b=aosQFQcS+H94oV/Lo5Afm3vBoH/NbDJZ7C4LuQjz02Ry1IkB0Y71TrUDePD4Hx2Z0l7wXrVUhDYVMUVQQl0mtKLLwm1MBem6PiOGYwhJIbHSyFkzT/NprU1vM55Gojx/hHVPnfmC3z/33q1bCHgOTYQSEdDsk/k2TOszN7969f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750137567; c=relaxed/simple;
	bh=OrC9yUAGt+RbONHcifYiLwUWC8kZXYSG3gS8INUMJrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eGXlxEJERXWQjbg2ra1ud+ybRi3DIE26mP2XiwlH/PKduAOTWf4+i1LPiNyjtLA7zw2hxk54cVJ+KcU9QfPNw7/X3+evQ+PAAOZYY6w1JaU8f+zl3NZ1ECtBkOtPLzZDpKE7LmbqYSQUf7ByKTrLdhnbt9Lp50tDGCSkfHwzuyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1RRekIl; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1RRekIl"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4e80ff08dd6so1504984137.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 22:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750137564; x=1750742364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwJutXyA1IzhcB8viebfRV1V9CeLMwQ1Jbtbo6wl7g8=;
        b=J1RRekIlj/xt3PD8fO8VEFzWd1LLtNmuzta7IT61eAJkEXlDKtu6w63v1i+CNy/3xF
         TV59PGg93SW/7snBeV2Lp8GFKIwJEVsVhj6lbvLFzSjTPlPOQ0RWBKa2TNR/ue+wlMjr
         o3BpZqw7iWTKZVs15W27sZ5KFN4Rep5ZOUHKk0PX0mIAHh8EHkiZmmoPI/QkDtyTFLOQ
         bkqEYo8/1ovuEVLTZpNCi4PDaJZWWbA2VEAxfsK5UbBhHph6IfJ+HXlwmrkQFq/pGYa+
         V6Bn+qjMWxUdSrZCToUmvgYS7MxOllSwQa6KAufRDICqvL0QB4V4N6X0jjikNTsk9NnO
         cAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750137564; x=1750742364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwJutXyA1IzhcB8viebfRV1V9CeLMwQ1Jbtbo6wl7g8=;
        b=eN4Mrj1pPN7nlOm3hE4ytkBeEucsvr51F3VKJlanMBWIoAkoFRkCNBF7O/K2bCDrOq
         LzuxChLreSSy1ysDfx6GzpeEJ0dqffJWcK4XDEptjy4CiqLydB27hKNWO43YE/tvtwpa
         T9fG8Zp4sRkN+poRnb9LMlEEqVLxk1EFsBMrMgSTKo6/SHIbKVrHiTvls/jBGMkLYLG0
         QCP/9AcrTBRZBshUdhEEV/dhvZnQc35MUIcfRp7xjWxQUWsy7t/uGg+2H0yDY1vLMnDm
         PBDUy83lNB5T/f28XtBi/644hPNQhUuiXG93tuYadhTyyU9wjQQ/h10KsMGUIphovgSA
         MeSA==
X-Forwarded-Encrypted: i=1; AJvYcCXOnPwTVAoDPPgy7Kd2sWV4duEnDMP4zAH2gnoMc884FSDLcuBa4Hoty7s0MiwKEq/qCKdVkAbOekG23Gw=@vger.kernel.org
X-Gm-Message-State: AOJu0YycVrAMgzwe08gKFcIjbYRD3VYaEZquFEoH97o5QsD8387K3NhY
	TTm+2qDwqyH+XfKipRk9uEERj2ApnE76VEi/gYPz1Fp74oskLXRAVOVsYc4zrcX6rQ6t2mbW6x/
	R4GCvKxaR2y73NXbnn0fRZZEdVxNxRSA=
X-Gm-Gg: ASbGncvZPz/Dx/Y6CY3ib254VG7P5JDfvrIyCRSPzNR02YmxtXS/w4G3xHFipzQxzUf
	IeNNZ7+s2OX/elqkM1gPA+sG19f1OJyq1hqoBQDB89PJrJGV3WNdP8yajZwHsFzlY9WOnuqQKTh
	PkbZhZjY1OcNdeRv/elgL2JAIVTtzEtTpiU2IgXttVhGpcUmwSPc0mXQ==
X-Google-Smtp-Source: AGHT+IHd+OOi28jgYXkdq6e9qbPeO05G0G5k9w2PooPI4AgItyNpsnCIbmrfsFHre7soWL3bZbpDdCpfuDkNiZtjJAA=
X-Received: by 2002:a05:6102:3e0f:b0:4e5:5c14:5937 with SMTP id
 ada2fe7eead31-4e7f5cfa307mr9264663137.1.1750137564459; Mon, 16 Jun 2025
 22:19:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617020544.57305-1-lance.yang@linux.dev> <CAGsJ_4ySwMuKGYxywY+RH_FkNvjsThhvFQr+d1++KykOqjxarg@mail.gmail.com>
 <6fe09fdd-ff38-42cc-b101-520204213f82@linux.dev>
In-Reply-To: <6fe09fdd-ff38-42cc-b101-520204213f82@linux.dev>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 17 Jun 2025 17:19:13 +1200
X-Gm-Features: AX0GCFs25ANrF8M1ewV9-5KcAYw5Fvm8VuiV6iGyycAMHer3b0LUSGEUf3M947E
Message-ID: <CAGsJ_4zsP6i9+eq66981opoFGcA5SYjMxz5GumWc5DGJW4gjPQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm/madvise: initialize prev pointer in madvise_walk_vmas
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@redhat.com, Liam.Howlett@oracle.com, 
	vbabka@suse.cz, jannh@google.com, lorenzo.stoakes@oracle.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Lance Yang <ioworker0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 4:57=E2=80=AFPM Lance Yang <lance.yang@linux.dev> w=
rote:
>
>
>
> On 2025/6/17 10:24, Barry Song wrote:
> > On Tue, Jun 17, 2025 at 2:05=E2=80=AFPM Lance Yang <ioworker0@gmail.com=
> wrote:
> >>
> >> From: Lance Yang <lance.yang@linux.dev>
> >>
> >> The prev pointer was uninitialized, which could lead to undefined beha=
vior
> >> where its address is taken and passed to the visit() callback without =
being
> >> assigned a value.
> >>
> >> Initializing it to NULL makes the code safer and prevents potential bu=
gs
> >> if a future callback function attempts to read from it.
> >
> > Is there any read-before-write case here? I haven't found one.
>
>
> It appears that the following is a call chain showing the read-before-wri=
te
> of prev:
>
> -> madvise_vma_anon_name(..., struct vm_area_struct **prev, ...)
>          Receives the address of madvise_walk_vmas's prev.
>          Passes this pointer directly to madvise_update_vma.
>          Note that prev is not updated before visit() is called
>          if !(start > vma->vm_start) in the slow path.
>
>          -> madvise_update_vma(..., struct vm_area_struct **prev, ...)
>                  It calls the next function with *prev.
>
>                  -> vma_modify_flags_name(..., *prev, ...)
>                          Stores the value of madvise_walk_vmas's prev in
> vmg.prev
>                          using the VMG_VMA_STATE macro.
>
>                          -> vma_modify(struct vma_merge_struct *vmg)
>                                  Receives the vmg struct.
>                                  Passes vmg to vma_merge_existing_range.
>
>                                  -> vma_merge_existing_range(struct
> vma_merge_struct *vmg)
>                                          Retrieves the value: struct
> vm_area_struct *prev =3D vmg->prev;
>                                          The value is now used in a
> conditional check:
>                                          VM_WARN_ON_VMG(prev && start <=
=3D
> prev->vm_start, vmg)
>                                          If prev was uninitialized, this
> would cause a crash.

Thanks!

Do you have a reproducer? I'd like to try.

>
> Thanks,
> Lance
>
> >
> > It also looks like we're assuming that *prev =3D=3D NULL implies
> > a specific condition:
> >
> > *prev =3D NULL;   /* tell sys_madvise we drop mmap_lock */
> >
> > *prev =3D NULL; /* mmap_lock has been dropped, prev is stale */
> >
> >>
> >> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> >> ---
> >>   mm/madvise.c | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/mm/madvise.c b/mm/madvise.c
> >> index 267d8e4adf31..c87325000303 100644
> >> --- a/mm/madvise.c
> >> +++ b/mm/madvise.c
> >> @@ -1536,10 +1536,10 @@ int madvise_walk_vmas(struct mm_struct *mm, un=
signed long start,
> >>                                     struct vm_area_struct **prev, unsi=
gned long start,
> >>                                     unsigned long end, void *arg))
> >>   {
> >> +       struct vm_area_struct *prev =3D NULL;
> >>          struct vm_area_struct *vma;
> >> -       struct vm_area_struct *prev;
> >> -       unsigned long tmp;
> >>          int unmapped_error =3D 0;
> >> +       unsigned long tmp;
> >>          int error;
> >>
> >>          /*
> >> --
> >> 2.49.0
> >>
> >

Thanks
Barry
