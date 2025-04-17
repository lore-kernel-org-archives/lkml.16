Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0219E2594BD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744915105; cv=none; b=JJW86dPkvtts6qyZI0Tr6FowtB34bfFR7HSNpwrWZRWtHmkRR1TaqMwYAoSvPLS9wzwl4pEWFFWYPuECVfmF/zBKP14rLW9fwQ9HKglIV9fNhB5T7eNdffr5atlfGvSDcUCcucPPMETvXXzsTzRWNrcBtl3uFUJwrb+lzNPvPeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744915105; c=relaxed/simple;
	bh=3P/lKRUjkBu/fy5Z7T2mEOXxxqgm4H6nkQ5J//FtU0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h/tRSZPy/vQGDNBgOCFAHUGclNyQ+rFNFdJ1B5AUIKlSi0jdU5vf5hb3gDJYjcxLIGb69roPl8CQ6LU/TXkOO+DY40B+CBVxYmUgYBt4tYSbwdCoadWe1Y3KSiQBwyOrA4U8CyL7zTT28d1PjyVpkA1UhTeOwt2skWx87eTtT+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xdTAhRvu; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xdTAhRvu"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-47666573242so64821cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744915103; x=1745519903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bza0S7y0BSrOZcrZPdnoUbcyu9+YRt1jcvBqpA00DmQ=;
        b=xdTAhRvuFB1x9ep7dOcWDUCLsheoreFNmC5nHH4LYZo50wOZjn5S++/2pjJBQD4yY4
         lvAsdxRjjWVAyDFGBVrwQIazk574lvjpBzb1r+pi89mgSpUwL5fknM3swgC82VbWnfEv
         6rV9fzl5dQHO84DSFHs2xxpNxAPhPtHFuo/mklRovTWmhOo8tNOeB/cEf6bhu1yspJrB
         mjwlWH275PF18vEfB3ECPaGayZO0vviHXCEEh+nLLsakDFfsXi2EMSClu3i8frS0MBcd
         Ixyr8NyzN0BdCchShp33hsBuXe4zQswJZZs9/8BFnL8rYu2fIQV13+cFU4Qn3+Wf+bCM
         ABvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744915103; x=1745519903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bza0S7y0BSrOZcrZPdnoUbcyu9+YRt1jcvBqpA00DmQ=;
        b=WkvMytJc4TvMhvkpbGa+Oe6e7fcjU00b7JjTmoozINuAMkO8czmuoMenid/xBhqMF9
         rCusNMmWGd1ihys5ANLmLKs6XmkgyRzk0SMoRegqYa92dUI5bRQIcKyI5ceHC2CaC5za
         4x1zpTg/3UUI2ELRKOSFTglg5Ek1/xZ6t4iH75+KBP/ZKvBgf43JamDORTVhMmGKZTyK
         Qf0FvTblf0LQ224YU3BdFexbmnUN8M705yLfxGkYbD5ICyyi0merquTu1PYvvBjMtVLb
         c/21Ek7TAclKJPKNI7W4EGE9EWz7Jr5UJF2Qm3iaCojZxjS1U75Tyz6a9oGa5Oqd2WOe
         2yAw==
X-Forwarded-Encrypted: i=1; AJvYcCWeXGVnqHmrI7Ju6Ic/5HHe0QhBoB8wMllpqzkt/xIGt5/auBYDmHf6Wn0AuuewTw3+/iqDigzx7NAdloM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpVkM2LGY4is3G1cK/2S7ynYpQ3AsIvA6QeriF0z1LkAjpwaAS
	2PWmuZuju6aWev0G3utt65e2nFB5WsMqNRCufXIcpYNKrCgGzetvQtm10Rb9pWmQBx7+lbXyM3N
	eM++W9uHYcXNz/m30BbIyPdDAOK5qRFGz/F8+
X-Gm-Gg: ASbGncs5B+5mHBJ+Diow7lalTTgGeS6x2osVXWttUE4oq+DEwX4/NEpCBxt57fqrUmF
	4C1qtjnZIEoLgXZL6YwX/kDSXafvY/Vyp5WC/b2HG89BP21+IG3+uOfwhJRUElqw/7HY01Q3gHa
	NtUv/uiK/It+U543GzDI1ZeKIbeYaq69hwxQToHS5pytr5m6rW6jcy
X-Google-Smtp-Source: AGHT+IHPnBHaTnH4LH3+4icCSqdkLnMYV5wERvYGA8h5jD/C6G9mBEm5V+Q6IeuGnI7YYsrtpxa55AmNXnsj9m62eso=
X-Received: by 2002:a05:622a:1486:b0:467:8416:d99e with SMTP id
 d75a77b69052e-47aeb502cb2mr304241cf.21.1744915102519; Thu, 17 Apr 2025
 11:38:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416180653.3438158-1-usamaarif642@gmail.com>
 <CAJuCfpEKrX+1_SJ5fOyT6JLDSNcDxjcfBMj9_siVZt-rX5WQ=w@mail.gmail.com>
 <72pac6pkjebt6xo7engiuuu7r3zr7fu6fh6bj77f22m7gslxgr@3gjawofplas2>
 <CAJuCfpHcUfXb8RaGCExLc5U2HK3xcA0CjY1diM=S6DDqNFFykg@mail.gmail.com>
 <ogiahgnqihzg6nfew6oifgzjvetiwo25utp6jwskrhw4axdevp@rwqbgeraivym>
 <CAJuCfpE3JgJVB3+-ZZPU3kFDjPSJyo4WFtwmtMUnXJ6q0E09dA@mail.gmail.com>
 <25ac1d9c-c7e4-4dcf-b297-254fa51c6f2a@gmail.com> <33632210-6de3-445b-8f9c-d0fbcf3deab2@gmail.com>
In-Reply-To: <33632210-6de3-445b-8f9c-d0fbcf3deab2@gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 17 Apr 2025 11:38:11 -0700
X-Gm-Features: ATxdqUFS3lRu_At297sjMidDhBkDhQYSgQMk39ymxl8qM8ITyYvaVFMBMGhJouA
Message-ID: <CAJuCfpHyWqgq112rkuaV8Rpmi1yFdoYycbj5ZGL97+ROD6K4Gw@mail.gmail.com>
Subject: Re: [PATCH] alloc_tag: introduce Kconfig option for default
 compressed profiling
To: Usama Arif <usamaarif642@gmail.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-mm@kvack.org, hannes@cmpxchg.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 11:35=E2=80=AFAM Usama Arif <usamaarif642@gmail.com=
> wrote:
>
>
>
> On 17/04/2025 18:50, Usama Arif wrote:
> >
> >
> > On 17/04/2025 17:00, Suren Baghdasaryan wrote:
> >> On Thu, Apr 17, 2025 at 8:47=E2=80=AFAM Shakeel Butt <shakeel.butt@lin=
ux.dev> wrote:
> >>>
> >>> On Wed, Apr 16, 2025 at 05:11:11PM -0700, Suren Baghdasaryan wrote:
> >>>> On Wed, Apr 16, 2025 at 2:41=E2=80=AFPM Shakeel Butt <shakeel.butt@l=
inux.dev> wrote:
> >>>>>
> >>>>> On Wed, Apr 16, 2025 at 02:08:31PM -0700, Suren Baghdasaryan wrote:
> >>>>>> On Wed, Apr 16, 2025 at 11:06=E2=80=AFAM Usama Arif <usamaarif642@=
gmail.com> wrote:
> >>>>>>>
> >>>>>>> With this Kconfig option enabled, the kernel stores allocation ta=
g references
> >>>>>>> in the page flags by default.
> >>>>>>>
> >>>>>>> There are 2 reasons to introduce this:
> >>>>>>> - As mentioned in [1], compressed tags dont have system memory ov=
erhead
> >>>>>>> and much lower performance overhead. It would be preferrable to h=
ave this as
> >>>>>>> the default option, and to be able to switch it at compile time. =
Another
> >>>>>>> option is to just declare the static key as true by default?
> >>>>>>> - As compressed option is the best one, it doesn't make sense to =
have to
> >>>>>>> change both defconfig and command line options to enable memory
> >>>>>>> allocation profiling. Changing commandline across a large number =
of services
> >>>>>>> can result in signifcant work, which shouldn't be needed if the k=
ernel
> >>>>>>> defconfig needs to be changed anyways.
> >>>>>>
> >>>>>> The reason tag compression is not the default option is because it
> >>>>>> works only if there are enough free bits in the page flags to stor=
e a
> >>>>>> tag index. If you configure it to use page flags and your build do=
es
> >>>>>> not have enough free bits, the profiling will be disabled (see
> >>>>>> alloc_tag_sec_init()).
> >>>>>
> >>>>> Is it possible to fail the build in that case i.e. check the page f=
lags
> >>>>> availability at build time?
> >>>>
> >>>> The difficulty is finding out the number of allocation tags in the
> >>>> kernel before it gets built. Maybe there is a way to add an addition=
al
> >>>> post-build stage to run that check.
> >>>
> >>> Yeah that would be good to have.
> >>>
> >>>> But even then making this option
> >>>> default and causing build failures does not seem like a good idea to
> >>>> me but maybe I'm being too cautious?
> >>>
> >>> Oh my question was orthogonal to the patch. Basically some users may
> >>> want build time guarantee for this and they can enable such
> >>> build-failing opt-in config/check.
> >>
> >> Yes, that would require the post-build step to check the number of
> >> tags vs the number of available page flag bits. I'll add it to my TODO
> >> list but it won't be at the top, sorry :) Volunteers to help with that
> >> would be highly appreciated.
> >
> > Hi Suren,
> >
> > A question orthogonal to the patch, the defconfig entry is defined as b=
elow:
> >
> > config MEM_ALLOC_PROFILING
> >       bool "Enable memory allocation profiling"
> >       default n
> >       depends on MMU
> >       depends on PROC_FS
> >       depends on !DEBUG_FORCE_WEAK_PER_CPU
> >       select CODE_TAGGING
> >       select PAGE_EXTENSION
> >       select SLAB_OBJ_EXT
> >
> > i.e. we select PAGE_EXTENSION even if we use compressed profiling and u=
se page flags
> > instead of page extension. Which means the 0.2% (8 bytes per struct pag=
e) memory overhead
> > will still exist even when we dont need it?
> >
> > Should we have some defconfig option (happy with any other way) that on=
ly allows compressed
> > profiling (otherwise nothing), so that we don't have the dependency on =
page extension
> > and thus not have the overhead if we only plan to use compressed profil=
ing?
> >
> > Thanks
>
>
> Johannes pointed out the .need function of page_alloc_tagging_ops, i.e. n=
eed_page_alloc_tagging,
> so page extensions wouldn't be enabled and hopefully there is no memory o=
verhead when
> mem_profiling_compressed is true. Let me know if my understanding is wron=
g.
> And sorry for the noise!

Sorry for the delay. Meetings...
Yep, Johannes is right, need_page_alloc_tagging() should disable that overh=
ead.
