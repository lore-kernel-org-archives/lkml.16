Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06432E545
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 03:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750303119; cv=none; b=DZVEjGPoLMl9LIRUnN3sSlndA8/ToCg9UGW44haZhPSwt921qP0406w9u+DMtw+l/RApUa2jpYKOiUkDDrp4TehQ9HT80ibS9Lc9EUNRLkwBsmsQyxELrfCD07IU98sC+xagkjOnnkuShJePaKua4fy8qSxPNcc2vqGv08UDGTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750303119; c=relaxed/simple;
	bh=kZ7cHOnajterqVY/s4WF2QOzI3LuVWmPmyznXAf9t4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UH/sYQUeXcYOx03lRdjVZLORG5g1IZd+kFhaG6p4QqeNmlBZwKsMFkJp4tq87BZwRidJFYFUmHq2WEqVXKkQEex+hLFX5sBSpvYJG2Ef+LUHXYEE38zx/mMdByZMzDqsjfWzCT/u5djSi5Qa+aJMchA3g97QO9ayTIM/6vD1uLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=KBDfRifw; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="KBDfRifw"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553d771435fso277290e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750303115; x=1750907915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6NkPCHYEoZsUFSw6jIHPSK470nj4uo13JKCT/+imIM=;
        b=KBDfRifwW8mic1Q4GPRyZOYS/KRUfR/kKnQJhACuaHFCAldDiEw3QiIxFRToZEXpHA
         1ebEw4+OP+F+QQxGCbZMjBPJy1pw4vp5iCEuKGnY4TwiybCwTi0QYT7fkFH7Zx/5Nqdr
         n9dT00zbRqm5FLkhvElNX4WK3QAZwKMrJnqRD2QVEqS1BGH2lZvx2fAaMQDj1nX7pHhx
         GG6R3G9wyc6t81N4wzABqEZ+ML3xooHyk1yDKW2m9/6n/cWaIj48PhkCDzdajMl9wHnN
         dxJZKoL/JplB8geJ5S1dHK0Xaiisd1h9NqRTWbtGhOBWtbz0/kIQTIE45YLSh0MR1wq0
         lAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750303115; x=1750907915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6NkPCHYEoZsUFSw6jIHPSK470nj4uo13JKCT/+imIM=;
        b=PB7d2GQ9Z2csqzvKbltOG+fobZVbpdLfQCbnJ3DBWsAI52nU1jUguFbVnOhrTc3rTK
         2T3SBIxpYa0RzzfvGgg2MH3zNf7FBtlMfq6adbtMxN2MJdMPJOYzO+6h9p3VvjMBbuc3
         E0nER8CiPTT0UXRSK+8uOsFrAHKXxBUOLsFpWRgbfIBhn+xYHPBIHUkE76gu/kXfgtMe
         eB+n8jHV6dnsODijxOEHGtOs99CwDKwOxqgnhNAlTq301JS9btGMABOzSJoh7baZq9S1
         2ic397Oq1GtF80KT308+9STtMRwyWT3wChnc8T7RkpErQgtgqbY1LNIaITryPf7uzZGn
         JFVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZDk0H5/eAP84UoLCxrVPDMXEVZ+49rAH4RgBAodIg+p8qA387j5DxdbsHgUkkGn6oZp0FDrBXGrpOKPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzJY1FmhvaKyYW+jWem/KMn69hucd5gZxP3IZ/Thr6Bgsg4lzM
	2VoLzvmMDzrpAIfKv0XB/C4MFpOu77n5FJvYzo6zB78JFvKFDPjnlul5Ko7qXBDUyLOpimNAxGB
	vpAnE7MyZN75lMXuHKA6hqGDdf1IdCPdZxjy86SN2XA==
X-Gm-Gg: ASbGncsZL4jRm1O6FtzRBjyUQ/JHYkIDnpvlQ2seAJBz/XXVVfIa6WBH/o59ex0NrwH
	SMZbsxszQqBtgsLOULLJ9Ab2m8YtuzY8aYqzAOBwcYunddzI/Ips3jDBQMxANrn68rN+MtND+ei
	CKvNaH95eF6bzDWOoalFFNbunOugBoYMxPTG4nOkTvq7zSLbx99vm+ZlNFcg==
X-Google-Smtp-Source: AGHT+IHKjrphxhIm9vilp/aQmrbgmu6S+E/zwZTB7dNpu62I00LyyEn65mgpkmnCNH5/lpGLxjtGUxJxYD0Awk5yviI=
X-Received: by 2002:a05:6512:10d1:b0:550:e608:410b with SMTP id
 2adb3069b0e04-553b6f1a12cmr5542468e87.33.1750303114901; Wed, 18 Jun 2025
 20:18:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618070328.2192849-1-hezhongkun.hzk@bytedance.com>
 <20250618164334.54616cb2d70a1ee3c1f28a81@linux-foundation.org> <p6nr56qg7vx72qvaalrvntzstyrkt7z3fytfux5nd4wlvef462@znymqow5qjsr>
In-Reply-To: <p6nr56qg7vx72qvaalrvntzstyrkt7z3fytfux5nd4wlvef462@znymqow5qjsr>
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
Date: Thu, 19 Jun 2025 11:17:58 +0800
X-Gm-Features: Ac12FXz628ssSehvnNEODzLupA-PZ9JlsOYBcKOKn58kQjOASv9O20Rq0e79bOg
Message-ID: <CACSyD1P5ksZHHRZwCr48gDVv9Wt9hXfX9PcXqrd5MpDRJkdzHA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] mm: rename the oldflags and parameter in memalloc_flags_*()
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, mhocko@suse.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 8:07=E2=80=AFAM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Wed, Jun 18, 2025 at 04:43:34PM -0700, Andrew Morton wrote:
> > On Wed, 18 Jun 2025 15:03:28 +0800 Zhongkun He <hezhongkun.hzk@bytedanc=
e.com> wrote:
> >
> > > The variable name oldflags can indeed be misleading, because
> > > it does not store the complete original value of flags.
> > > Instead, it records which flags from the given set are not
> > > currently set. So rename it.
> > >
> >
> > Your email client is mangling the patches in strange ways.  Please send
> > yourself a patch, figure out why it didn't apply?
> >
> > > --- a/include/linux/sched/mm.h
> > > +++ b/include/linux/sched/mm.h
> > > @@ -322,21 +322,21 @@ static inline void might_alloc(gfp_t gfp_mask)
> > >  }
> > >
> > >  /**
> > > - * memalloc_flags_save - Add a PF_* flag to current->flags, save old=
 value
> > > + * memalloc_flags_save - Add a PF_* flag to current->flags, return s=
aved flags mask
> > >   *
> > >   * This allows PF_* flags to be conveniently added, irrespective of =
current
> > >   * value, and then the old version restored with memalloc_flags_rest=
ore().
> > >   */
> > > -static inline unsigned memalloc_flags_save(unsigned flags)
> > > +static inline unsigned int memalloc_flags_save(unsigned int flags_ma=
sk)
> > >  {
> > > -   unsigned oldflags =3D ~current->flags & flags;
> > > -   current->flags |=3D flags;
> > > -   return oldflags;
> > > +   unsigned int saved_flags_mask =3D ~current->flags & flags_mask;
> > > +
> > > +   current->flags |=3D flags_mask;
> > > +   return saved_flags_mask;
> > >  }
> > >
> > > -static inline void memalloc_flags_restore(unsigned flags)
> > > +static inline void memalloc_flags_restore(unsigned int flags_mask)
> > >  {
> > > -   current->flags &=3D ~flags;
> > > +   current->flags &=3D ~flags_mask;
> > >  }
> >
> > I guess so.  Maybe.  A bit.  Kent, what do you think?
>
> Eesh, seems like pointless verbosity to me. Maybe don't change it if it
> doesn't need to be changed?

Hi Kent, thanks for your feedback.
How about this version,  only change the 'old' to 'saved'.
The function does not return the old current->flags value. Instead,
it returns the subset of flags that were not previously set in current->fla=
gs,
so they can later be cleared by memalloc_flags_restore(). The name savedfla=
gs
makes this behavior clearer and avoids confusion.

 /**
- * memalloc_flags_save - Add a PF_* flag to current->flags, save old value
+ * memalloc_flags_save - Add a PF_* flag to current->flags, return saved f=
lags
  *
  * This allows PF_* flags to be conveniently added, irrespective of curren=
t
  * value, and then the old version restored with memalloc_flags_restore().
  */
 static inline unsigned memalloc_flags_save(unsigned flags)
 {
-       unsigned oldflags =3D ~current->flags & flags;
+       unsigned savedflags =3D ~current->flags & flags;
        current->flags |=3D flags;
-       return oldflags;
+       return savedflags;
 }

Thanks,
Zhongkun
