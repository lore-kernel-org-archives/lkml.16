Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821F2215180
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743083093; cv=none; b=Ic7qmu0JNMxVn6FwtXvd7VVJTehIzXLKiFBqb+nH23lmzuBda/ndmoYpzjBI8+nG9gxoNAHZ0nDmevGuT+2oKFvU6JRMYEaAzuVMCZ35hmEb1VidQIvU/An+LiK76z7ONClWRhsxM3Ev2Cel9XvfqKjyJ9amG4wf6A5Eb0mXVSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743083093; c=relaxed/simple;
	bh=+8qPATH2HU9gwTeERrkruIa/ZTb6ByUOe6zVYLhAwRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IP5wRTkR7/J1YTfzSYsMrLDLQvYuDmDoxsLkEAepqF/SiiAG2Fg/Ku3tnsfx+8ooq65D7o/YxIFatgZroRI4EDCH63iRwqL49yK3RfdBGMrlSaUMyoW0JLNbljOZx2sRnYvFUBlFGFCmJ6yRQmAkUHloHppAQbtq7sp2MX2HMJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pjFoo+a1; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pjFoo+a1"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4772f48f516so21249531cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 06:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743083090; x=1743687890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WBmIHYNxH2hNbnztSUM0YQzeS33DRZ8fFAtqoGQFWc=;
        b=pjFoo+a1vmvmeGoXbrD9ufhqtY/eIDG41U5P0E+mCI1eUvKf6qsSU0iyDvGYHpTMRZ
         w4H0cEE1SL4rDMYovt8no73Pq4xXrmWMd2fYTrE7a2Gkex5Ova7vTuJ7Q244kDpORuDx
         p5U7WEhagSA+ujUvAYq3BY6xkvTNe5jOAuuPVtMb0voJWtGcpTiHEH3nt33DwZeB1yJO
         jAG8gz8atvvcV6Q8t5YDsOk2IEKx46RzT6gjVijDKLcICp7kF17F/NhF2kXn/qACvVuo
         2k/6dGMOP2Z1pkAKZbV/+zCGV2MJAStfhy/Yb7Hbt/eY5SJ3bRYCxj91eiDNbNqZMjZj
         82kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743083090; x=1743687890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WBmIHYNxH2hNbnztSUM0YQzeS33DRZ8fFAtqoGQFWc=;
        b=plV/7FxlSRylD9ihZVPImfBERgCUYPKBzc+AmN6gjl60QvUzvTz6+3VBUlWo7q56rM
         dvu83wfKiah4fz+TmeNyZLnDdy4KnGvA4gHRxuF2gR4A04GuDm0PDOZRLxNwT0G/sRsO
         Llnyi6Tcal62N8L3vgT5vQgWvP/dV5TbPd8KkiC5tXJxfDxTxfQaV6mtZkFfDfo1VIJs
         JfcabHJkr3fr8aPHdacaYb4nL/mdfSX/vjSA4nWREenKaNJ2UIGOsTdYafPlXWT1HaXG
         geQiCy2gwojGKTNREV5zzyHYPHzMrCymkHtYojfAKGVYmTsxRQUIdv8aP7YWUPS8IG3j
         ViqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdj8p04y2afyVX3okd5FzQ+14xqzHy1fqhPqFKiBK9U7xB+s0o50zzCiAsSwKl5sifJGJ4wdPL6rSNF7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3V8Wocsb+W8Pbkcn3bV3Fj2HRSQ+vDJVr+IrLdgzgOnCvireW
	6LodnW/W3i4Y3RX6JzFpc8SJ225YSm/jLoXc8TNsf/rPNkH2vEXwzCj9rJ92tjug27LIjUFeCza
	+WT/hHBJeqbxUI61TWcfNWmQvrnf1FK3luwSj
X-Gm-Gg: ASbGncvFFvmXfpQwAtdnm186GG2flpinQekyZQkFiXCRqC7bRo3dpi0TFuKxekJF3dF
	c47aUlyKy1/4Ot3BkgohgrwoDZvc5qkSNXn7rk/cNg4QGfsolqmubhua2XyE0BLQo56QMcedXa3
	b82NVw2KN88OFlwND5BnCc271WsMc=
X-Google-Smtp-Source: AGHT+IEWhxaHLHGXV1mslhQ21zSlluJIiMobOHGWwfdwPV4FGN4ZX2GDfzSu9mFinq8HolGVw+mb5MiSpprY8RZqK4w=
X-Received: by 2002:a05:622a:4ac6:b0:471:b32e:c65d with SMTP id
 d75a77b69052e-4777f82ef6emr4678161cf.19.1743083090165; Thu, 27 Mar 2025
 06:44:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202503241406.5c9cb80a-lkp@intel.com> <87pli4z02w.ffs@tglx>
 <6sn76aya225pqikijue5uv5h3lyqk262hc6ru3vemn7xofdftd@sw7gith52xh7>
 <CANn89iKjCgmxtiLeVAiXODHbbR7=gYYi5cfAS1hS5qn+z=-o1Q@mail.gmail.com>
 <877c4azyez.ffs@tglx> <CANn89iKAkio9wm73RNi9+KngNaS+Au2oaf0Tz9xOd+QEhFSkyw@mail.gmail.com>
 <CANn89i+nAN+p-qRypKxB4ESohXkKVPmHuV_m86j3DPv6_+C=oQ@mail.gmail.com>
 <87v7ruycfz.ffs@tglx> <CANn89iJvxYsF0Y9jH+Oa2=akrydR8qbWAMbz_S6YZQMSe=2QWQ@mail.gmail.com>
 <87jz8ay5rh.ffs@tglx> <CANn89i+r-k-2UNtnyWC6PaJmO_R6Wc6UROgeoir5BmgVV8wDqQ@mail.gmail.com>
 <CAGudoHHVJWeRWPyArnYnJERPR2gyU0PzBTwx=wWKnCemry45Nw@mail.gmail.com>
In-Reply-To: <CAGudoHHVJWeRWPyArnYnJERPR2gyU0PzBTwx=wWKnCemry45Nw@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 27 Mar 2025 14:44:39 +0100
X-Gm-Features: AQ5f1Jqj0hl3MGq_fBgn4lV2nPWlCqeAKMvuOzfv5-Zz2OFt_YiqJpvkXJEMWQc
Message-ID: <CANn89iLGof+T6Ksp56vTXpwKdn60cJ7FWrm-Y-3TNmCNW+Hq_A@mail.gmail.com>
Subject: Re: [tip:timers/core] [posix] 1535cb8028: stress-ng.epoll.ops_per_sec
 36.2% regression
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Benjamin Segall <bsegall@google.com>, Frederic Weisbecker <frederic@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 2:43=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> w=
rote:
>
> On Thu, Mar 27, 2025 at 2:17=E2=80=AFPM Eric Dumazet <edumazet@google.com=
> wrote:
> >
> > On Thu, Mar 27, 2025 at 2:14=E2=80=AFPM Thomas Gleixner <tglx@linutroni=
x.de> wrote:
> > >
> > > On Thu, Mar 27 2025 at 12:37, Eric Dumazet wrote:
> > > > On Thu, Mar 27, 2025 at 11:50=E2=80=AFAM Thomas Gleixner <tglx@linu=
tronix.de> wrote:
> > > >> Cute. How much bloat does it cause?
> > > >
> > > > This would expand 'struct ucounts' by 192 bytes on x86, if the patc=
h
> > > > was actually working :)
> > > >
> > > > Note sure if it is feasible without something more intrusive like
> > >
> > > I'm not sure about the actual benefit. The problem is that parallel
> > > invocations which access the same ucount still will run into contenti=
on
> > > of the cache line they are modifying.
> > >
> > > For the signal case, all invocations increment rlimit[SIGPENDING], so
> > > putting that into a different cache line does not buy a lot.
> > >
> > > False sharing is when you have a lot of hot path readers on some othe=
r
> > > member of the data structure, which happens to share the cache line w=
ith
> > > the modified member. But that's not really the case here.
> >
> > We applications stressing all the counters at the same time (from
> > different threads)
> >
> > You seem to focus on posix timers only :)
>
> Well in that case:
> (gdb) ptype /o struct ucounts
> /* offset      |    size */  type =3D struct ucounts {
> /*      0      |      16 */    struct hlist_node {
> /*      0      |       8 */        struct hlist_node *next;
> /*      8      |       8 */        struct hlist_node **pprev;
>
>                                    /* total size (bytes):   16 */
>                                } node;
> /*     16      |       8 */    struct user_namespace *ns;
> /*     24      |       4 */    kuid_t uid;
> /*     28      |       4 */    atomic_t count;
> /*     32      |      96 */    atomic_long_t ucount[12];
> /*    128      |     256 */    struct {
> /*      0      |       8 */        atomic_long_t val;
>                                } rlimit[4];
>
>                                /* total size (bytes):  384 */
>                              }
>
> This comes from malloc. Given 384 bytes of size it is going to be
> backed by a 512-byte sized buffer -- that's a clear cut waste of 128
> bytes.
>
> It is plausible creating a 384-byte sized slab for kmalloc would help
> save memory overall (not just for this specific struct), but that
> would require extensive testing in real workloads. I think Google is
> in position to do it on their fleet and android? fwiw Solaris and
> FreeBSD do have slabs of this size and it does save memory over there.
> I understand it is a tradeoff, hence I'm not claiming this needs to be
> added. I do claim it does warrant evaluation, but I wont blame anyone
> for not wanting to do dig into it.
>
> The other option is to lean into it. In this case I point out the
> refcount shares the cacheline with some of the limits and that it
> could be moved to a dedicated line while still keeping the struct <
> 512 bytes, thus not spending more memory on allocation. the refcount
> changes less frequently than limits themselves so it's not a big deal,
> but it can be adjusted "for free" if you will.
>
> while here I would probably change the name of the field. A reference
> counter named "count" in a struct named "ucounts", followed by an
> "ucount" array is rather unpleasing. How about s/count/refcount?


How many 'struct ucounts' are in use in a typical host ?

Compared to other costs, this seems pure noise to me.
