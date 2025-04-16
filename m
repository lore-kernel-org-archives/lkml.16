Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2A3221DA5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 21:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744840514; cv=none; b=Zx+dFBZcOl5UstGMljBun2h58nuiU1zvlxxY36JnB5Vq61HxZddLYPgCXpi727ZsVWX/xNEs4Qmd7nw5eOgYKmiREnu34apCcpBWDfAemg+A1d/iFtcJl3wwo5QuholhhX8ZPZypIKw5r1kBwHobkSilTXB+eAuG8PDNYCwXQLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744840514; c=relaxed/simple;
	bh=gVER7zFphER4OkVnBS5MekREoV4CJLEbjizJ+lC7dlY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GnO7qU3V3Gcls7iuPi5E8jsCk9vTjVm3aU6VUZPQILTuWK9MCWlfShg1ENslyc3jk6vmsF02fOUGDim426WrfEmlSi4WtLoMtnVchgxKO7n2e8cWcXMnUESOp+Ii93u+j1ao+Ctt8j9moczWnjlMkHbrJGMCxZT0BvK4gCDDa8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUnyu0ft; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUnyu0ft"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86b9d9b02cbso65804241.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744840509; x=1745445309; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gPIruv8+DPJVykMvHBCcurRjzdOaLaF+ig/nmZ+rgk=;
        b=SUnyu0ftFUHeTlSnSQC1ESFhWULM8Ylh66dQhnsmP/zmUUoFG2t65PnF0PxL2Ftx7s
         JqbZPayaQwvzdPZ08Z8vWNTVgHF3Ub4AwexLc+9ulSQj7NSYgVeNXTOzLNDiykDYiS8Z
         f/EqFYEm38tGIZXSSE2g0xbu72BRdZQImCVWnmC0cGtgenxni2YYdMY+wnQlF8ngY6PI
         Ujrn0ApcyoTYA+BmgzMXHePqZMfbWcWMfjbD0YpEo//M8Vuq/nfGL+oWETS3jcBCiaFq
         CsAqgbb9zTZAgPnOfhRMB8+zkep/C8iZGeX5tFW5N7Jc+9LyCTwTpvhZtYgSprpuSCM7
         2tTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744840509; x=1745445309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gPIruv8+DPJVykMvHBCcurRjzdOaLaF+ig/nmZ+rgk=;
        b=CBz2zNUQNog/fcPDIx6daPBn9dcee1IuE9ziwcOnIlJONE0tCpvDfg6hcWA4tcFEac
         XB/8yUm/Ywfnh6bkcT37EBB2w4qIc8quawtnR4nxxKjZqhQ2Q53+sgOOhNMq0GouvoAm
         E/kBD9efo6hwVxFUH6icz+pJc11sFUSrJc6pD/KAPxooKsqZVTGyPHSt0Rkh2g6ruLbw
         c7Xnv2P2s1/9zcfqquOOgx1nA7B4/I7hp30R/OQiMje2wS2vBfHXnN9jAOevWvIkJ8b+
         QfYymSkwr69K9CW2P23E/WNOk93GEMNzPX+h3tTb+ZGTs1vF9z6pDywVb804IochdBTY
         GY0A==
X-Forwarded-Encrypted: i=1; AJvYcCUVD1duHjADz8jP8lH+roeai04EuXb7pn+w07wygk5uqEtxwxsck5DwMPnTXg+ZKmgQ0OZPWLW8zUNIiII=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2RUMHEvp7vAbplO7O/iOM0+u8voFLsnMTX1ntBCHzjkn2Y3oG
	sHuCKzLtGnLfCTqbzFzgpoCDDY81j+MVveByc5nWOjj6S8/FDFTzQ+FZdOd9UhDvTGIGwpsO5Vm
	Y/UHi0mPNjJhWRcL7GF4/VriovsQ=
X-Gm-Gg: ASbGnctwjE/72rGYDlSjt3Fh6iYCoRGdWkP9YYvkuuCIu5dpRL2PVY/fGpeq3MvxO10
	TmeLXH67gt3NI9VWZy756dRs5abn3CojTcs9i6aKDO4ftsKXnXiHa/5ezfmryENWODvb5P4MzYU
	bnAs0dW7BSYRuHqnegl42IRNcjDN5RH3FE
X-Google-Smtp-Source: AGHT+IHkhF3xA4kAK/73tbGfvqZ44vjh+5kEBCPCGUNimklPYdFojptj/e2Keh6E46G5fdSlA7LLY3y9cJGfpCumpq8=
X-Received: by 2002:a05:6102:5616:b0:4cb:5e41:5bf3 with SMTP id
 ada2fe7eead31-4cb5e415c8fmr2014388137.20.1744840508906; Wed, 16 Apr 2025
 14:55:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412085852.48524-1-21cnbao@gmail.com> <34c54df6-9a7c-475d-9b91-0f8acb118231@redhat.com>
 <CAGsJ_4yUUK8LoejaUrXWscpPSQevq8jB4eFwpd6+Gw3T5JxdNg@mail.gmail.com>
 <6259cc1d-93a8-4293-9009-a6119166f023@redhat.com> <CAGsJ_4wnqyaZntmtOvtTZRq2XuKsKRTokwf1GeX91FpfqW_nzw@mail.gmail.com>
 <d5cd2055-62ea-4534-b5e2-c6a5bfa9b1c4@redhat.com> <20250416141531.GD741145@cmpxchg.org>
 <239cfe47-9826-402b-8008-de707faa160e@redhat.com> <20250416181835.GA779666@cmpxchg.org>
In-Reply-To: <20250416181835.GA779666@cmpxchg.org>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 17 Apr 2025 05:54:57 +0800
X-Gm-Features: ATxdqUFYN_CYfqcQtP8IpKf_FzoMqyFGwslI7cr67PZkLqgnF4wMCUnOUFTB2Xc
Message-ID: <CAGsJ_4zt2Yuornri1bO=3o7myey1Q2dmvtjn2baD0ahxOyoNjw@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: don't promote exclusive file folios of dying processes
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Matthew Wilcox <willy@infradead.org>, 
	Oscar Salvador <osalvador@suse.de>, Ryan Roberts <ryan.roberts@arm.com>, Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 2:18=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.org=
> wrote:
>
> On Wed, Apr 16, 2025 at 05:59:12PM +0200, David Hildenbrand wrote:
> > On 16.04.25 16:15, Johannes Weiner wrote:
> > > On Wed, Apr 16, 2025 at 11:40:31AM +0200, David Hildenbrand wrote:
> > >> On 16.04.25 11:38, Barry Song wrote:
> > >>> On Wed, Apr 16, 2025 at 5:32=E2=80=AFPM David Hildenbrand <david@re=
dhat.com> wrote:
> > >>>>
> > >>>> On 16.04.25 11:24, Barry Song wrote:
> > >>>>> On Wed, Apr 16, 2025 at 4:32=E2=80=AFPM David Hildenbrand <david@=
redhat.com> wrote:
> > >>>>>>
> > >>>>>> On 12.04.25 10:58, Barry Song wrote:
> > >>>>>>> From: Barry Song <v-songbaohua@oppo.com>
> > >>>>>>>
> > >>>>>>> Promoting exclusive file folios of a dying process is unnecessa=
ry and
> > >>>>>>> harmful. For example, while Firefox is killed and LibreOffice i=
s
> > >>>>>>> launched, activating Firefox's young file-backed folios makes i=
t
> > >>>>>>> harder to reclaim memory that LibreOffice doesn't use at all.
> > >>>>>>
> > >>>>>> Do we know when it is reasonable to promote any folios of a dyin=
g process?
> > >>>>>>
> > >>>>>
> > >>>>> I don't know. It seems not reasonable at all. if one service cras=
hes due to
> > >>>>> SW bug, systemd will restart it immediately. this might be the ca=
se promoting
> > >>>>> folios might be good. but it is really a bug of the service, not =
a normal case.
> > >>>>>
> > >>>>>> Assume you restart Firefox, would it really matter to promote th=
em when
> > >>>>>> unmapping? New Firefox would fault-in / touch the ones it really=
 needs
> > >>>>>> immediately afterwards?
> > >>>>>
> > >>>>> Usually users kill firefox to start other applications (users int=
end
> > >>>>> to free memory
> > >>>>> for new applications). For Android, an app might be killed becaus=
e it has been
> > >>>>> staying in the background inactively for a while.
> > >>>>
> > >>>>> On the other hand, even if users restart firefox immediately, the=
ir folios are
> > >>>>> probably still in LRU to hit.
> > >>>>
> > >>>> Right, that's what I'm thinking.
> > >>>>
> > >>>> So I wonder if we could just say "the whole process is going down;=
 even
> > >>>> if we had some recency information, that could only affect some ot=
her
> > >>>> process, where we would have to guess if it really matters".
> > >>>>
> > >>>> If the data is important, one would assume that another process wo=
uld
> > >>>> soon access it either way, and as you say, likely it will still be=
 on
> > >>>> the LRU to hit.
> > >>>
> > >>> I'll include this additional information in the v2 version of the p=
atch since
> > >>> you think it would be helpful.
> > >>>
> > >>> Regarding the exclusive flag - I'm wondering whether we actually ne=
ed to
> > >>> distinguish between exclusive and shared folios in this case. The c=
urrent
> > >>> patch uses the exclusive flag mainly to reduce controversy, but eve=
n for
> > >>> shared folios: does the recency from a dying process matter? The
> > >>> recency information only reflects the dying process's usage pattern=
, which
> > >>> will soon be irrelevant.
> > >>
> > >> Exactly my thoughts. So if we can simplify -- ignore it completely -=
-
> > >> that would certainly be nice.
> > >
> > > This doesn't sound right to me.
> > >
> > > Remembering the accesses of an exiting task is very much the point of
> > > this. Consider executables and shared libraries repeatedly referenced
> > > by short-lived jobs, like shell scripts, compiles etc.
> >
> > For these always-mmaped / never read/write files I tend to agree.
> >
> > But, is it really a good indication whether a folio is exclusive to thi=
s
> > process or not?
> >
> > I mean, if a bash scripts executes the same executable repeatedly, but
> > never multiple copies at the same time, we would also not tracking the
> > access with this patch.
> >
> > Similarly with an app that mmaps() a large data set (DB, VM, ML, ..)
> > exclusively. Re-starting the app would not track recency with this patc=
h.
> >
> > But I guess there is no right or wrong ...
>
> Right, I'm more broadly objecting to the patch and its premise, but
> thought the exclusive filtering would at least mitigate its downsides
> somewhat. You raise good points that it's not as clear cut.
>
> IMO this is too subtle and unpredictable for everybody else. The
> kernel can't see the future, but access locality and recent use is a
> proven predictor. We generally don't discard access information,
> unless the user asks us to, and that's what the madvise calls are for.

David pointed out some exceptions - the recency of dying processes might
still be useful to new processes, particularly in cases like:

  while true; do app; done

Here, 'app' is repeatedly restarted but always maintains a single running
instance. I agree this seems correct.

However, we can also find many cases where a dying process means its folios
instantly become cold. For example:
- If someone enjoys watching his/her TV (not shared with family) and then
  passes away, the TV's folios become instantly cold.
- Even if the TV is shared with family but only that person actively used
  it, the folios still become cold.  If other users access this TV
too, shouldn't
  their PTEs reflect that it's still young?

I agree that "access locality and recent use" is generally a good heuristic=
,
but it must have some correlation (strong or weak) with the process lifecyc=
le.
Implementing 'madv_cold' on a dying process seems impractical as dying
means 'cold' for many cases. Also, It is really not doable to execute
madv_cold on a dying process.

Thanks
Barry
