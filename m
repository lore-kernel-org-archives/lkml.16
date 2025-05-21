Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21D4221FDD
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841784; cv=none; b=AwJ+3XUHw419YOqjORwIIBkSWD52iYOG4Yt1QOfIKEuS+9+Fl52QO1IFdjgqftdDWKzfPZzUciSf/72TmH+EBaoIyncaKh2Skr+a7koECQQO3w8kEeUjc2FADvCeKTqPHN9RBDiUGOgq7fSlq7sqijvrFAJqeR32/rujGuEYRwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841784; c=relaxed/simple;
	bh=a4TO+sh7sgx1Rud1APajtsJjXwfKZgcAOLcv91dEAWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JdQwmap7nnq2WF0IieqfC3db7zOrzs4scA2VKKoms/6U588Lxv6myQDZa1iAytKUvdVzi0TDVf2yemt7hlm/feL1reXr+lYAEFzG2Wa1ycqQLYA2gQh0U3CLdMKAgpCAO/YHIfo8Ow7ONteGIOJCH8QTA34nOJ4/6Xjl3dmvXJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F99ZgcoJ; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F99ZgcoJ"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d96836c1c2so984965ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747841782; x=1748446582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Az3/bLvwhgAccccliRUeu6lJ2uvLaYoVC/qOEZV47ms=;
        b=F99ZgcoJQj5M+CFdGSAXyFuIOjnCeglvXgtykK73hp1sRhMLj9QucCi8gnZuLA+xa/
         oZfIQJeaX+suMDi2PoE/SjW0esRV+OJFW/KehENBmV1/6vmgtmaVsXXU+b0qYpSKIup4
         pBRv34GI1SaFOlCR/m/XA9RfI0yDYiQtjAhnVT8WpWjqfxpUGlF6tVshGxsZ5tKMT9Mn
         6eB1zbUtR7vfiVEVtSgKFYrNSZsVa1VxK4zzTHGaHSBPV/TqLgxwIxtQOis/38ZJXq/a
         GmRBRtaNj36JZ1NY+1mk7VMLy/N5aPAl+hmZCnMEu2hmc2ZYfqAbTijxa56Yco0v8SXS
         /JOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747841782; x=1748446582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Az3/bLvwhgAccccliRUeu6lJ2uvLaYoVC/qOEZV47ms=;
        b=nCuqENUF3+znPrma/wjSXrdqSItvC5tH4TEPn22Mn8M8+/gXkd+iH91C4/muS99BNS
         MIY03kMThhciLdOOhgmwuPTdqAKB0JOs1nJDT2xEKMsrrm5kCE/pnxDGb5uhkaED3AM3
         9vAe099oftiDQYTPAmiCWT0ZZdm64sXanUwAGd8Szk0ETJc1VNwBM95BBiUXpvS1U/+t
         szywQLAg0aGRm441xAlKFKBuMWXywBxqy1EaGQiquyVltPFiLaUcGEsonj8c8gixI7j+
         qvmaK6Z8MBB1I+0+xIeh5AsCWZEFga4/lfVyW5/keY0m//HNI5vQRv1cCavEPIwQhnBz
         lcBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo+wllYqCpeJ03IlHcQfuaigfw+m9pENtipQ1QwO2LkjlvLhNB0FTiK21/E44ssprNEoNPvRfxZ1sxRIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmjCPVnpqODFfdQYmPLRlZhkd837w1cxr7HVhWYUuu2z9lSQdK
	AFsvYp1iFjV6tNuV3Pr5KD8qx7AZiOvR6G//em4QLAXgt6oOncbyn+oU/aFYw/zAkpadqF0MHD+
	/W9zD/v5rHIF1RawRhTGUDLMcLW56KDzagsZDGHDZ
X-Gm-Gg: ASbGncsXSVrLw4JHgJgrlbzr+u8qPUIGJO5JP2Cr1mfF/zOiqj21JXwhyS4DZ1oO4Rr
	dob0CY7wekbNdStuLv+vHUINc1XyB1RcorIZCrRnHWQt2qGn0yaH+ihllqWqGoOd7mGWmRL5TMm
	G735lk0hLR9PCkizbNmQvfDKb3ZXpf7seeNUWHwbT6WGd13+Ar81qaJD+9Vw2aZ66VijQkZn81Q
	5w9weUg2+A=
X-Google-Smtp-Source: AGHT+IExe/qiDd82F0VPU9OyslSsa74vsznODI2XirW1CU3HzJLOhKrOAhY6hnuLK9U9rc6IjPD+SqI8/2nJKLwhXpk=
X-Received: by 2002:a05:6e02:1c29:b0:3dc:8116:44a8 with SMTP id
 e9e14a558f8ab-3dc81164585mr4888995ab.26.1747841781531; Wed, 21 May 2025
 08:36:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116230955.867152-1-rkanwal@rivosinc.com> <20250116230955.867152-2-rkanwal@rivosinc.com>
 <CAP-5=fU9ovvb-JopPqQfNaj6xtL=u_WZO-b56RdhBmUw4mY0ZA@mail.gmail.com>
 <CAECbVCvX8St8sXh9pTnyO_94-cJT_DB4MyggtS_-PXqWNtXDXw@mail.gmail.com> <CAECbVCui6ZgHBXBr3LdVGd16ERe0GgAnA1zy_zOQZVTU3bPoWw@mail.gmail.com>
In-Reply-To: <CAECbVCui6ZgHBXBr3LdVGd16ERe0GgAnA1zy_zOQZVTU3bPoWw@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 21 May 2025 08:36:09 -0700
X-Gm-Features: AX0GCFutvbsbaRRv95Ix63BFV2gQsIqNkZTt3-Zp5Jf6rbiC2pQQste-OqEaHZw
Message-ID: <CAP-5=fUy0QfmazuNq1yJzAxsuM7wD3zD=KAVMGHuw0wXvez1ww@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] perf: Increase the maximum number of samples to 256.
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: ak@linux.intel.com, "Liang, Kan" <kan.liang@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, adrian.hunter@intel.com, 
	alexander.shishkin@linux.intel.com, ajones@ventanamicro.com, 
	anup@brainfault.org, acme@kernel.org, atishp@rivosinc.com, 
	beeman@rivosinc.com, brauner@kernel.org, conor@kernel.org, heiko@sntech.de, 
	mingo@redhat.com, james.clark@arm.com, renyu.zj@linux.alibaba.com, 
	jolsa@kernel.org, jisheng.teoh@starfivetech.com, palmer@dabbelt.com, 
	will@kernel.org, kaiwenxue1@gmail.com, vincent.chen@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 3:47=E2=80=AFAM Rajnesh Kanwal <rkanwal@rivosinc.co=
m> wrote:
>
> On Thu, Apr 17, 2025 at 1:51=E2=80=AFPM Rajnesh Kanwal <rkanwal@rivosinc.=
com> wrote:
> >
> > + Adding Andi Kleen.
> >
> > On Thu, Feb 20, 2025 at 6:51=E2=80=AFPM Ian Rogers <irogers@google.com>=
 wrote:
> > >
> > > On Thu, Jan 16, 2025 at 3:10=E2=80=AFPM Rajnesh Kanwal <rkanwal@rivos=
inc.com> wrote:
> > > >
> > > > RISCV CTR extension support a maximum depth of 256 last branch reco=
rds.
> > > > The 127 entries limit results in corrupting CTR entries for RISC-V =
if
> > > > configured to be 256 entries. This will not impact any other archit=
ectures
> > > > as it is just increasing maximum limit of possible entries.
> > >
> > > I wonder if rather than a constant this code should just use the auto
> > > resizing hashmap code?
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/tools/perf/util/hashmap.h
> > >
> > > I assume the value of 127 comes from perf_event.h's PERF_MAX_STACK_DE=
PTH:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/include/uapi/linux/perf_event.h#n1252
> > >
> > > Perhaps these constants shouldn't exist. The perf-record man page men=
tions:
> > > sysctl.kernel.perf_event_max_stack
> > > which I believe gets a value from
> > > /proc/sys/kernel/perf_event_max_stack, so maybe these should be
> > > runtime determined constants rather than compile time.
>
> While working on this, I came across the following two patches. It
> looks like what
> you have suggested, it was tried before but later on Arnaldo reverted the=
 change
> from report and script cmds due to reasons mentioned in the second patch.
>
> https://lore.kernel.org/lkml/1461767472-8827-31-git-send-email-acme@kerne=
l.org/
> https://lore.kernel.org/lkml/1463696493-27528-8-git-send-email-acme@kerne=
l.org/

Thanks Rajnash, agreed on what you found. I wonder to resolve the
issue we could add a header feature:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/header.h?h=3Dperf-tools-next#n21
for max stack depth.

Thanks,
Ian

> Regards
> Rajnesh
>
>
> > >
> >
> > Thanks Ian for your feedback. I am not sure if it's feasible to use aut=
o
> > resizing hashmap here. On each sample of 256 entries we will be doing
> > 6 callocs and transferring a whole lot of entries in hashmap_grow. We
> > can't reuse old hashmap as well. On each sample we bear the same cost
> >
> > But I do agree this should be more dynamic but the maximum number
> > of entries remove_loops can process is limited by the type of chash arr=
ay
> > here. I can change it and related logic to use uint16_t or higher but w=
e
> > will still have a cap on the number of entries.
> >
> > PERF_MAX_BRANCH_DEPTH seems to be denoting what remove_loops
> > can process. This is being used by thread__resolve_callchain_sample to
> > check if the sample is processable before calling remove_loops. I think
> > this can't be changed to use perf_event_max_stack. But I can rename
> > this macro to avoid confusion.
> >
> > I didn't notice PERF_MAX_STACK_DEPTH. This seems to be defined in
> > multiple places and touches bpf as well. I agree that we should avoid
> > using this macro and use runtime determined value instead. Tbh I don't
> > have super in-depth perf understanding. I will give this a try and send=
 a
> > patch in the next update. It would be helpful if you can review it.
> >
> > Thanks
> > -Rajnesh
> >
> > > Thanks,
> > > Ian
> > >
> > > > Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
> > > > ---
> > > >  tools/perf/util/machine.c | 21 ++++++++++++++-------
> > > >  1 file changed, 14 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
> > > > index 27d5345d2b30..f2eb3c20274e 100644
> > > > --- a/tools/perf/util/machine.c
> > > > +++ b/tools/perf/util/machine.c
> > > > @@ -2174,25 +2174,32 @@ static void save_iterations(struct iteratio=
ns *iter,
> > > >                 iter->cycles +=3D be[i].flags.cycles;
> > > >  }
> > > >
> > > > -#define CHASHSZ 127
> > > > -#define CHASHBITS 7
> > > > -#define NO_ENTRY 0xff
> > > > +#define CHASHBITS 8
> > > > +#define NO_ENTRY 0xffU
> > > >
> > > > -#define PERF_MAX_BRANCH_DEPTH 127
> > > > +#define PERF_MAX_BRANCH_DEPTH 256
> > > >
> > > >  /* Remove loops. */
> > > > +/* Note: Last entry (i=3D=3Dff) will never be checked against NO_E=
NTRY
> > > > + * so it's safe to have an unsigned char array to process 256 entr=
ies
> > > > + * without causing clash between last entry and NO_ENTRY value.
> > > > + */
> > > >  static int remove_loops(struct branch_entry *l, int nr,
> > > >                         struct iterations *iter)
> > > >  {
> > > >         int i, j, off;
> > > > -       unsigned char chash[CHASHSZ];
> > > > +       unsigned char chash[PERF_MAX_BRANCH_DEPTH];
> > > >
> > > >         memset(chash, NO_ENTRY, sizeof(chash));
> > > >
> > > > -       BUG_ON(PERF_MAX_BRANCH_DEPTH > 255);
> > > > +       BUG_ON(PERF_MAX_BRANCH_DEPTH > 256);
> > > >
> > > >         for (i =3D 0; i < nr; i++) {
> > > > -               int h =3D hash_64(l[i].from, CHASHBITS) % CHASHSZ;
> > > > +               /* Remainder division by PERF_MAX_BRANCH_DEPTH is n=
ot
> > > > +                * needed as hash_64 will anyway limit the hash
> > > > +                * to CHASHBITS
> > > > +                */
> > > > +               int h =3D hash_64(l[i].from, CHASHBITS);
> > > >
> > > >                 /* no collision handling for now */
> > > >                 if (chash[h] =3D=3D NO_ENTRY) {
> > > > --
> > > > 2.34.1
> > > >
