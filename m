Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68351202F8F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 02:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750301482; cv=none; b=EGtonzwW2jonAoN+xFdEASww1bp9Cicg+ZG8wRixTRUYDw2sFi3uyWcrsqAsuMmma80CTTgIILetPyCTsMT9RvRZrszAB53u9R2ZqFeJtkULWlD1fFxlchAFMdrPhMs6q6HjZILgf8TxI/NLUbOZpcYfOZV9/9jRhpRxDblvyBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750301482; c=relaxed/simple;
	bh=HbN80cKSREly48fyCSCNtkxxk8SzTvmsyfWXK2obkhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TT6NJroUawBTWSib8Lk1Vj4EsaP1A8BaYEmn5yrd+zh0gPJIr2b2t2CWbsXNC5Hklq8/CsDsA/eLRGBiDkEfS/ipOXM3imaygtuBr1jn/MzJ67kjjUmYY1CSjGf6+MA5MthlO7P1HKvFAf6zGG74cSvTDt7zOjLYs4LYXEo4aXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WU8XBaM1; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WU8XBaM1"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32918fe5334so2642271fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750301476; x=1750906276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoj04BxcSgUHo0cLCTX5FEhqXJOUHHj4lUxFfx8StKk=;
        b=WU8XBaM12AwIcgqFtLRl9vhcnbQP6ePRK4kwlbammPLi4TAESMTjOwDGRSE7Dz444i
         KM3ZTTRHbuoHKTwCfjiwB+S8d8WvpjxQKt8MSxIcqaARYgYjC8j1jD7xPI9waA8BZBvH
         6KQ+ZHDfaG/IYY1kz8dksXhZzjLjCD3OrJXUpQeIzeJZAyZBMzkv6SvJM16Dx9+PlRON
         WhQYoRqALnrhyyUa1CHqE6gce+wfZLBHw7VgEIhFeNIHWETb6lk/OieKxggrc6Oite7W
         g0xRpMurmctoaHwG+nKxxoaaof2CVRBfgNTsRSO7hb/gaF6R/e70dM4Yk9hMtLPEhWhh
         3gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750301476; x=1750906276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zoj04BxcSgUHo0cLCTX5FEhqXJOUHHj4lUxFfx8StKk=;
        b=ssp6olS3zBre4kj1U3Pwf9qXVqF+mLn3kgH+dkrnpJGePec2dk7HlizeZSa9rQ+u1v
         adiQEhdbh3trf1InTSKCjfKCc1kUtucE8gvSHkfBwpA7Vc8uzNs+UBGgUKllqXhS//Gq
         ZlaXu9Fx7dIF0byitxpWFi6noG8jUPdFYVHLy1azQaqNqI7/lrq2cKRYNr9xGV+UudB8
         enb3blmxfXymugNk0MKxAs2+Zx0a9OgiZR8+H8l6KZBFgDlmKiDhcSwJVYOraaVcYdEV
         p903PFDgsdVc58b8fLoSOXc+CV/hLj18mAQSAWc1PV74W2B9Y36bOXnbu5oVC6uDifbR
         CmcA==
X-Forwarded-Encrypted: i=1; AJvYcCXLVNTWWtQgVVQcdjzkN2Venn3qTQpZ1ZnliiPVGqLX3L/jP643vlZApFyUM8BYvk1uwW9bsls17M+t4oI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3QOrxjWKIDJpgjrGUEowA4YaTb+JswCrMJEOI48HEn+6TU7j9
	KmsGln02Z63l78Nhln+dg2DMTNl/q6BlqioA1mo2hLe0T6w9dhg4TQT3Rg5A0L7YKnhX7U/3+Q2
	0JXuBTLtEi59vVIDmX78B/GUFBiv7rQEXYaxXDQdtRA==
X-Gm-Gg: ASbGncstrNI3dT4ekvEvEYkdeCZEqOEJLIspKGLeh6l2hIKtlFLeq6awyOOaE4LzgTA
	3mBD+4bTbm5WBwzcoNf9Z2zdRK+rVEkaa+BLCVN9FE4TUd5RcCIwbuYZQX3OGAjvI4JafrrwGZ1
	MEBj41YcudgjpFG4JSlq+brF8+uZg9gqg4iwaRC1Ho2oEz3sVBEcnWIoxLpXvstWZL/63X
X-Google-Smtp-Source: AGHT+IFOUkX1y1u7svsw7umztUFkTR7YYsTmcIii9tVEuqmjF5Wrio6cWk8NxPkN4RjFr+vxgJMGVzrOH2QKeH+KSOs=
X-Received: by 2002:a2e:ae18:0:20b0:32b:7ddd:278d with SMTP id
 38308e7fff4ca-32b7ddd28ddmr10008701fa.3.1750301476457; Wed, 18 Jun 2025
 19:51:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618070328.2192849-1-hezhongkun.hzk@bytedance.com> <20250618164334.54616cb2d70a1ee3c1f28a81@linux-foundation.org>
In-Reply-To: <20250618164334.54616cb2d70a1ee3c1f28a81@linux-foundation.org>
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
Date: Thu, 19 Jun 2025 10:50:39 +0800
X-Gm-Features: Ac12FXxRaTVqIQbFKrHZT4tz0w7uMsleAym2ofIe8msdET6hsMg9nOlLueUNXrk
Message-ID: <CACSyD1NZPY3wS4WnuP-UpH3vuLWLS=eXxQLtqcO+1g7VNmBx1g@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] mm: rename the oldflags and parameter in memalloc_flags_*()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 7:43=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Wed, 18 Jun 2025 15:03:28 +0800 Zhongkun He <hezhongkun.hzk@bytedance.=
com> wrote:
>
> > The variable name oldflags can indeed be misleading, because
> > it does not store the complete original value of flags.
> > Instead, it records which flags from the given set are not
> > currently set. So rename it.
> >
>
> Your email client is mangling the patches in strange ways.  Please send
> yourself a patch, figure out why it didn't apply?

Thank you for pointing that out. I=E2=80=99ll check the email formatting on=
 my side.
Sorry for the trouble caused.

>
> > --- a/include/linux/sched/mm.h
> > +++ b/include/linux/sched/mm.h
> > @@ -322,21 +322,21 @@ static inline void might_alloc(gfp_t gfp_mask)
> >  }
> >
> >  /**
> > - * memalloc_flags_save - Add a PF_* flag to current->flags, save old v=
alue
> > + * memalloc_flags_save - Add a PF_* flag to current->flags, return sav=
ed flags mask
> >   *
> >   * This allows PF_* flags to be conveniently added, irrespective of cu=
rrent
> >   * value, and then the old version restored with memalloc_flags_restor=
e().
> >   */
> > -static inline unsigned memalloc_flags_save(unsigned flags)
> > +static inline unsigned int memalloc_flags_save(unsigned int flags_mask=
)
> >  {
> > -     unsigned oldflags =3D ~current->flags & flags;
> > -     current->flags |=3D flags;
> > -     return oldflags;
> > +     unsigned int saved_flags_mask =3D ~current->flags & flags_mask;
> > +
> > +     current->flags |=3D flags_mask;
> > +     return saved_flags_mask;
> >  }
> >
> > -static inline void memalloc_flags_restore(unsigned flags)
> > +static inline void memalloc_flags_restore(unsigned int flags_mask)
> >  {
> > -     current->flags &=3D ~flags;
> > +     current->flags &=3D ~flags_mask;
> >  }
>
> I guess so.  Maybe.  A bit.  Kent, what do you think?
