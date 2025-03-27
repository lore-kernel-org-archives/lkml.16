Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACC41482E7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743083335; cv=none; b=OQquShX8LeZqte8GNXJHqRX5+1FBIu53eRwuhK/rFXPUQK61OFN1A78zi1YlNxjaP9YngFbFM3UgQsFLZbdvBDYUoH8vJZ3UT9W8H2SdKJQju4Bvl94Bcg34M/kuziHxN5TuuR1aNls/kU4oT4jUpWMIY8NEtJ+HD0dMomGoW4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743083335; c=relaxed/simple;
	bh=BqIn0wrCuMc2UTLXaPpGz2GzyQ5thvKd6jrL79PHxhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UvyZcnqkGYMMPobYqjyJy2Hh1PSHY07jF1a1angET4fakU9jsikOM2mIDSB2uBPxcVeaL1zqBCqHRFOHLJqtfR8R+J4SXYnG7BuqzHXZkTsfpPLfoVmO0WwGVikYBPkWLwcNK5ZrNOk8yv5rs6WFgE0+EFZiluEzpkoM4YBD25k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCjxdSSk; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCjxdSSk"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso1585100a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 06:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743083331; x=1743688131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cShwsASNWb4Jp35AHxvP4AtgmKCcX2D/cSekQMeipE=;
        b=iCjxdSSktNi92j53Ac6qIfvL7jclxo14Vo3V4dcz5dkpNtk1JoBY6s5xG5w+I3Q2Jw
         HF3YESee+o4RHonkMbeHk+qCnnKkEVu1DxmsGft2R0BWlAMElXlWaoayIQrvogKylbdy
         GB9N78hS+jSGnCJZIgYsezQ40ZAT5/E6Vv1PfrqL9E7t7LStJM4FuTorxSGUf/U6bcic
         sgUFf4xAL27ZlGYoHimLodc68QKwEqsFjbdnGP/RJuc77agLqX0lZ2Wm8u6kGc81kzf1
         RzyuhCeJhbCWr1k2+3Cba5KLdcW7FJrm7Opdcr+jRLjVEes4GMS7BFcHj7gItj5mx1nk
         aW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743083331; x=1743688131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cShwsASNWb4Jp35AHxvP4AtgmKCcX2D/cSekQMeipE=;
        b=ED4nniqFU9ofnFAB4ax6n88gq/5dZ2L9PdJ5jLjDb9uZxljaoX3Y/POWbBjQ2O0K4k
         ZjgLfnnl4SIiMsm9mza9c3jk978fcs5OHjhv9ovnofS6fl2B5+3LvUVQWJA6H0Rfk8tT
         Wz9W0MwJlMYTLcN7FXOwYD0BF1X+Ay9GN9FvSoKfmULheO4FJN3gHaj5IPZBXHscgRHj
         9WxGcg4Kp9cIR7fwiEWVZQLfyYUwiAlG0Cq4GzFR0oKKymmnGln2QqY8DSZ7Ap6hL632
         XWt6daxBFX+CBRHiIU1WMiHwQS1X8NT+oEgH3Hsuk6jqbwALiCgTv86Ns0QEERHOshpW
         R56w==
X-Forwarded-Encrypted: i=1; AJvYcCWFmbTvK0fBpplrnR2uVFyRiWWkeJKk7RVvPd2cNQXGnWNEGN/Bb8B+o7LE03WnUuqgVjLZAtMRdYPFIDU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3JhzOO9f5tbfaYXb4IpOEVC0DNZPTcob/sEhW4GYEfNuq1+T+
	7gQjIpfabs0sGY+rlV6L033f0uE4FDHyhp+bVTqUKvv832JGLXIgBgZ5bnv0nXxpqD23PeLgCu5
	SmbNGifv41wutPigb95WdRnfHcIk=
X-Gm-Gg: ASbGncs/HAdzB+IgDUpU2Ixs6HboDLQ7u1xd989vCP1eXZFJv0YKfDdfRSzmWXsZXgt
	lxVhDAssayDiDk2S4oGODhtgQJbSrbulHkal/09k5YrfiojuAw2/0MkNre6bHF4n7EYrnnG4VAJ
	11FmJOG3mmMwCiULlga8i+UJFq
X-Google-Smtp-Source: AGHT+IG8tThHD6jWDTQjmnm+9IMPz27ZM/JzO/RcyOsJuWqSoOf5JkHpUl0R3AKSFEsEeRwFhBe+mP74VNwy9s7sHk4=
X-Received: by 2002:a05:6402:5187:b0:5ec:922f:7a02 with SMTP id
 4fb4d7f45d1cf-5ed8e496a71mr3793788a12.10.1743083331045; Thu, 27 Mar 2025
 06:48:51 -0700 (PDT)
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
 <CAGudoHHVJWeRWPyArnYnJERPR2gyU0PzBTwx=wWKnCemry45Nw@mail.gmail.com> <CANn89iLGof+T6Ksp56vTXpwKdn60cJ7FWrm-Y-3TNmCNW+Hq_A@mail.gmail.com>
In-Reply-To: <CANn89iLGof+T6Ksp56vTXpwKdn60cJ7FWrm-Y-3TNmCNW+Hq_A@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 27 Mar 2025 14:48:37 +0100
X-Gm-Features: AQ5f1JpKomRkGYmjsgSFzFHODlirXHVWlwC4ZRc4JNJcxh6kNbtiGglHymgUuI8
Message-ID: <CAGudoHE_K4iBHSNjKEPuQxJJ-cNx_8f74dou7qdEb58Pc4eKBQ@mail.gmail.com>
Subject: Re: [tip:timers/core] [posix] 1535cb8028: stress-ng.epoll.ops_per_sec
 36.2% regression
To: Eric Dumazet <edumazet@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Benjamin Segall <bsegall@google.com>, Frederic Weisbecker <frederic@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 2:44=E2=80=AFPM Eric Dumazet <edumazet@google.com> =
wrote:
>
> On Thu, Mar 27, 2025 at 2:43=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com>=
 wrote:
> >
> > On Thu, Mar 27, 2025 at 2:17=E2=80=AFPM Eric Dumazet <edumazet@google.c=
om> wrote:
> > >
> > > On Thu, Mar 27, 2025 at 2:14=E2=80=AFPM Thomas Gleixner <tglx@linutro=
nix.de> wrote:
> > > >
> > > > On Thu, Mar 27 2025 at 12:37, Eric Dumazet wrote:
> > > > > On Thu, Mar 27, 2025 at 11:50=E2=80=AFAM Thomas Gleixner <tglx@li=
nutronix.de> wrote:
> > > > >> Cute. How much bloat does it cause?
> > > > >
> > > > > This would expand 'struct ucounts' by 192 bytes on x86, if the pa=
tch
> > > > > was actually working :)
> > > > >
> > > > > Note sure if it is feasible without something more intrusive like
> > > >
> > > > I'm not sure about the actual benefit. The problem is that parallel
> > > > invocations which access the same ucount still will run into conten=
tion
> > > > of the cache line they are modifying.
> > > >
> > > > For the signal case, all invocations increment rlimit[SIGPENDING], =
so
> > > > putting that into a different cache line does not buy a lot.
> > > >
> > > > False sharing is when you have a lot of hot path readers on some ot=
her
> > > > member of the data structure, which happens to share the cache line=
 with
> > > > the modified member. But that's not really the case here.
> > >
> > > We applications stressing all the counters at the same time (from
> > > different threads)
> > >
> > > You seem to focus on posix timers only :)
> >
> > Well in that case:
> > (gdb) ptype /o struct ucounts
> > /* offset      |    size */  type =3D struct ucounts {
> > /*      0      |      16 */    struct hlist_node {
> > /*      0      |       8 */        struct hlist_node *next;
> > /*      8      |       8 */        struct hlist_node **pprev;
> >
> >                                    /* total size (bytes):   16 */
> >                                } node;
> > /*     16      |       8 */    struct user_namespace *ns;
> > /*     24      |       4 */    kuid_t uid;
> > /*     28      |       4 */    atomic_t count;
> > /*     32      |      96 */    atomic_long_t ucount[12];
> > /*    128      |     256 */    struct {
> > /*      0      |       8 */        atomic_long_t val;
> >                                } rlimit[4];
> >
> >                                /* total size (bytes):  384 */
> >                              }
> >
> > This comes from malloc. Given 384 bytes of size it is going to be
> > backed by a 512-byte sized buffer -- that's a clear cut waste of 128
> > bytes.
> >
> > It is plausible creating a 384-byte sized slab for kmalloc would help
> > save memory overall (not just for this specific struct), but that
> > would require extensive testing in real workloads. I think Google is
> > in position to do it on their fleet and android? fwiw Solaris and
> > FreeBSD do have slabs of this size and it does save memory over there.
> > I understand it is a tradeoff, hence I'm not claiming this needs to be
> > added. I do claim it does warrant evaluation, but I wont blame anyone
> > for not wanting to do dig into it.
> >
> > The other option is to lean into it. In this case I point out the
> > refcount shares the cacheline with some of the limits and that it
> > could be moved to a dedicated line while still keeping the struct <
> > 512 bytes, thus not spending more memory on allocation. the refcount
> > changes less frequently than limits themselves so it's not a big deal,
> > but it can be adjusted "for free" if you will.
> >
> > while here I would probably change the name of the field. A reference
> > counter named "count" in a struct named "ucounts", followed by an
> > "ucount" array is rather unpleasing. How about s/count/refcount?
>
>
> How many 'struct ucounts' are in use in a typical host ?
>
> Compared to other costs, this seems pure noise to me.

I did not claim this is going to increase memory usage in a significant man=
ner.

I claim regardless of this change a 384-byte slab for kmalloc may be
saving memory and this bit may be enough of an excuse to evaluate it,
should someone be interested.

Apart from that I claim that if the 512-byte is going to be used to
back the 384 bytes used by the struct, the patch can trivially move
the refcount to a dedicated cacheline to avoid some of the bouncing
and still fit in the 512-byte allocation. I see no reason to not do
it.

--=20
Mateusz Guzik <mjguzik gmail.com>
