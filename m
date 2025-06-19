Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2591DE885
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 04:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750307845; cv=none; b=Gvx4LBxuuSGpQdTnVyY4KOBzmbYLEclDFYE93JS2AuQTIM7woDd4KEmxXIyTY0m432cWhauU6Fg/2Mph+7cRw8RFyLpUYjYEENVJ1+V5+YPZKrVzNZ5a4i3nrPzEXtG4Yk9Z1mGOAXWilWnP+JIFqf+vLKI3pAIogdfkaZnTKU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750307845; c=relaxed/simple;
	bh=YQvK47PIvDpWPnyLg6vbeMVhuZkCi6gG4uWHcWvJiJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g8cw3ppcqSTsAOR7Fn9zZXX4At7nyCx4A1HSkxHhHPCJfhtaYNT1kAC0qOhNX835PqGfP7QWkoLB3KvqIM/CcjaNhkRbQU0ObqqDno8J9RWMxg/l1cfuqAQfQYmhP338t1dJ++aA8ye+fSSEYuCFFimdx7xLmPwQutD8z6tjT7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=KYmTcQ08; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="KYmTcQ08"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32b78b5aa39so3672231fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750307841; x=1750912641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQIxwaFwlmZUeVwGDLanhQhj9z8HCaoir3lX4GTDpfc=;
        b=KYmTcQ08bcR5Kty3Xf1uCid4i62cHwsgKrpgBVdz0NrHY0YMAtkHZh+XoOCbcyJY9A
         9PCQDMVdQL5Be2RXT2CL4h9j8GJ0HHB3r6wf3Qfyl+2vFpTea8llVL7BKHcodC3ExR3T
         M1UhFG8VFj0R25b6BymRIVve6AqyX+0ZgvMe4m95Pfhyz80YnBBBtAZ8WqvcXnP7vKLr
         /4PuLE33r0iOl8PFfJogD4AKR1xJVmukXDpwFCix4XJ2wPxUoNNgGCMxgTZhpBmytm52
         3O4vDpQSApIdcF8R6Fn4UZTD7lytNT/IOSPKiqj4ev+3Ky3of0GaFW4VTmGlftdoRtOn
         oh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750307841; x=1750912641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQIxwaFwlmZUeVwGDLanhQhj9z8HCaoir3lX4GTDpfc=;
        b=FbhW95f2IUMwi2sEt+vaLKjB5Aq5mdFgfzI2P8lzWdZX9Ys1vNccxLuopTdk2cauOH
         ouxrJkx9c1qAZtON1vPDtEcZpDFNP1Lh1+0CNvYq4FYSC+gwpnCf7zD2ZE8HdbrFTiiJ
         Xe0dOG+9sjxWAfgF84guWLnzXNRDQSH5zma8NbU5Uq3y4pSqubgc4TJ6gb4lecfzm74c
         2U59OJT3ieIguTLkeza4/dmVu0wmtOwLzOHZDixMifO3+XPA5DZ+Wim0tztD7FpACxXk
         4BK1ZUAEdX6jf0qS8AXkOsp0wfbdram4W4/SkCOiMw1YoWbcgl68vJsvSHwARSO523Rv
         6RlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmGj8LiAUN9fkmEZfRD6J+0hK51D/VET52SutA9AMxFqKln3pXd7zFvpMm5agCNy3nz6PO9CwScLLWVNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeGp6r2EfxeG6V8MCZgkJo4OV+ie63xM0HCndfCZpfFLSyTQsN
	8hZBlMimeuwN1dQLN68YRRf8nlFi6plPLhhtCpR7fukGkquTwoW9qJKg3SbPNgdqXPrEgkErb1o
	i4OLZuNHYvZWfXnOEwLfy/YchKD5nzlBDZCAKMFwCrw==
X-Gm-Gg: ASbGncsaBV+U1sdxL4v4D5EsXuS1dQASZYwB5tGg/IDsSpd1KU0OEELiH+ocYhHlGf4
	PyA0H/vKpSyWX6c64VOZQWrNFg6T/MS+92gTvBAIfWp9YgqM7LTjO25DGjRu49Dm6xW8YWvaoER
	XMR5URqZRDICsNkbxNW1aFlUUUQZiE/st7ApWsWbzvklhbGtqTWHzsbRp2vA==
X-Google-Smtp-Source: AGHT+IF5dQ8UFI8ymtvUN4g32DBa6Wt8mh5aBTjercUAPoQh32HF5tvDZfp++BPTZpKTkQRV27gDFPSDlQMmde52G/M=
X-Received: by 2002:a05:651c:60d:b0:32a:7e4c:e915 with SMTP id
 38308e7fff4ca-32b4a5d9b14mr46629491fa.29.1750307841263; Wed, 18 Jun 2025
 21:37:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618070328.2192849-1-hezhongkun.hzk@bytedance.com>
 <20250618164334.54616cb2d70a1ee3c1f28a81@linux-foundation.org>
 <p6nr56qg7vx72qvaalrvntzstyrkt7z3fytfux5nd4wlvef462@znymqow5qjsr>
 <CACSyD1P5ksZHHRZwCr48gDVv9Wt9hXfX9PcXqrd5MpDRJkdzHA@mail.gmail.com> <ig5wtmtownn5sebhqeugleb7ns5nf6wgmrbbzgev7henhujhsm@chsmrubxszrq>
In-Reply-To: <ig5wtmtownn5sebhqeugleb7ns5nf6wgmrbbzgev7henhujhsm@chsmrubxszrq>
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
Date: Thu, 19 Jun 2025 12:36:44 +0800
X-Gm-Features: Ac12FXxuA0Xkm_Lr_Wh9-xqOTQiONZI2ypIGNKehmeDz7Kt5NuFVKShq5Tc9AW0
Message-ID: <CACSyD1OcKg7nc54OXe1F+4oPort7jtG5wu1J75z7_CZNTkrRDw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] mm: rename the oldflags and parameter in memalloc_flags_*()
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, mhocko@suse.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 12:17=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Thu, Jun 19, 2025 at 11:17:58AM +0800, Zhongkun He wrote:
> > On Thu, Jun 19, 2025 at 8:07=E2=80=AFAM Kent Overstreet
> > <kent.overstreet@linux.dev> wrote:
> > >
> > > On Wed, Jun 18, 2025 at 04:43:34PM -0700, Andrew Morton wrote:
> > > > On Wed, 18 Jun 2025 15:03:28 +0800 Zhongkun He <hezhongkun.hzk@byte=
dance.com> wrote:
> > > >
> > > > > The variable name oldflags can indeed be misleading, because
> > > > > it does not store the complete original value of flags.
> > > > > Instead, it records which flags from the given set are not
> > > > > currently set. So rename it.
> > > > >
> > > >
> > > > Your email client is mangling the patches in strange ways.  Please =
send
> > > > yourself a patch, figure out why it didn't apply?
> > > >
> > > > > --- a/include/linux/sched/mm.h
> > > > > +++ b/include/linux/sched/mm.h
> > > > > @@ -322,21 +322,21 @@ static inline void might_alloc(gfp_t gfp_ma=
sk)
> > > > >  }
> > > > >
> > > > >  /**
> > > > > - * memalloc_flags_save - Add a PF_* flag to current->flags, save=
 old value
> > > > > + * memalloc_flags_save - Add a PF_* flag to current->flags, retu=
rn saved flags mask
> > > > >   *
> > > > >   * This allows PF_* flags to be conveniently added, irrespective=
 of current
> > > > >   * value, and then the old version restored with memalloc_flags_=
restore().
> > > > >   */
> > > > > -static inline unsigned memalloc_flags_save(unsigned flags)
> > > > > +static inline unsigned int memalloc_flags_save(unsigned int flag=
s_mask)
> > > > >  {
> > > > > -   unsigned oldflags =3D ~current->flags & flags;
> > > > > -   current->flags |=3D flags;
> > > > > -   return oldflags;
> > > > > +   unsigned int saved_flags_mask =3D ~current->flags & flags_mas=
k;
> > > > > +
> > > > > +   current->flags |=3D flags_mask;
> > > > > +   return saved_flags_mask;
> > > > >  }
> > > > >
> > > > > -static inline void memalloc_flags_restore(unsigned flags)
> > > > > +static inline void memalloc_flags_restore(unsigned int flags_mas=
k)
> > > > >  {
> > > > > -   current->flags &=3D ~flags;
> > > > > +   current->flags &=3D ~flags_mask;
> > > > >  }
> > > >
> > > > I guess so.  Maybe.  A bit.  Kent, what do you think?
> > >
> > > Eesh, seems like pointless verbosity to me. Maybe don't change it if =
it
> > > doesn't need to be changed?
> >
> > Hi Kent, thanks for your feedback.
> > How about this version,  only change the 'old' to 'saved'.
> > The function does not return the old current->flags value. Instead,
> > it returns the subset of flags that were not previously set in current-=
>flags,
> > so they can later be cleared by memalloc_flags_restore(). The name save=
dflags
> > makes this behavior clearer and avoids confusion.
>
> Why change it at all? The returned flags parameter is opaque state that
> should only be used by memalloc_flags_restore(), it's not something the
> caller should be looking at.
>

Hi Kent

You're right that the returned flags are opaque and only meant for
memalloc_flags_restore(),
not for inspection by the caller.

My motivation for renaming was that the term oldflags might suggest it
contains the original
current->flags value, which could be misleading when reading the code.
Since it actually
represents a subset of flags to be cleared later, savedflags seems clearer.

That said, if the current naming is considered fine given its opaque
nature, I'm happy to
drop the rename.

Thanks,
Zhongkun.

> >
> >  /**
> > - * memalloc_flags_save - Add a PF_* flag to current->flags, save old v=
alue
> > + * memalloc_flags_save - Add a PF_* flag to current->flags, return sav=
ed flags
> >   *
> >   * This allows PF_* flags to be conveniently added, irrespective of cu=
rrent
> >   * value, and then the old version restored with memalloc_flags_restor=
e().
> >   */
> >  static inline unsigned memalloc_flags_save(unsigned flags)
> >  {
> > -       unsigned oldflags =3D ~current->flags & flags;
> > +       unsigned savedflags =3D ~current->flags & flags;
> >         current->flags |=3D flags;
> > -       return oldflags;
> > +       return savedflags;
> >  }
> >
> > Thanks,
> > Zhongkun
