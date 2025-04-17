Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A37320F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 02:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744857814; cv=none; b=e2+Uq4GKhxY5itqroSUQfKk1dsZOfuCGVjQlH3L03n5GY8YYx73w23Hey8Om5cp4U250w5MXIuAkybj4MfVW6tGgWVE9+Ki1+S3r9uVR2Ze0/u0mP/PBj7D6mSJLPooFwyDk4uVmeDh4I3ftUTbj7EK/9+K68wuYM/XyaU+Y0Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744857814; c=relaxed/simple;
	bh=Ei3R5xrKd9GZkyaNL0k185+WrRBNfaGzOK8MX9DZxdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P+2HWCAObtROxUz2AyJjEenhNEkQfc5o8YQx63GgWw/KX7k1SDCtjpoUZo4TXFwsJ47ryvrlevp089qBU1VoXMMtXa5/8QlrXDlxKnZHqTRZZdDO0ihY+6XAfm1bUmNvlAIyOPyCkSZ6G+i/GiFjdDL7mgJTbp8Pnu8s8Y1JnyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VhMPw/80; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VhMPw/80"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-523f670ca99so129313e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 19:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744857811; x=1745462611; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Od8k6LZA8WtpjFMRC9gzixGp04UToT1Q0Y0i08AB8fY=;
        b=VhMPw/80xcRZWzeMcYB+cOZuHn8e81ySravgUEgDkvKCTZEEH7rTxmpgk/LiM7Gh2L
         vzPbS4GDFrjMVKaSKEoTAgKR6HX28w6qxGZjWROb1ejEOzG5HekHruPY3459a67ufh/b
         a5rgchuTNzo/sRYaZc+5s3Ft50HJx31F+OapdbO1RXUVDAZK0IKrFrJOLtfTdVZU7kZx
         1m8V2Gn4u33DwK7bnA3zMGKaCm7qVq1NNLNH8GJhzbaImH4f7PfCWWbuwHAW2NHeOL9M
         5DW+3tUOQXUWjmgoe3JR6tFSQ9UtiI8FuQOsCWTOF0ktklLT4Z2GGafsSsE7rxR2uWo/
         j+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744857811; x=1745462611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Od8k6LZA8WtpjFMRC9gzixGp04UToT1Q0Y0i08AB8fY=;
        b=Ldd3gEU+oGOQvvXcI7F//JOkFlz66vjHijrnNltCBrF2eZl1f0RHAszs9eTXkvvVJi
         Y8BrXrixZ/5+A/doi3FRurwRjvGJ3RyVp47vAXpp2flCHyd3X3KGVjGX7Rszsf0dzU5T
         jG0XKMaELuwvoxw5YdByeA5nvSVvMqpw/L0J+WJUta7DvCBE4cfVciaJgKsqzHNmfyAs
         Zdyz2NqDaQKuf0UpUDS9TrpeOMkjyK3Rc3ilM7Z+lciFeaGoblhxde47gjuSHWTeFKlL
         Yt7EoqolIHedjeAL9ETW4mN9EBFrJCNgzCzgIGPZC0aOQdhzaXiRg+BPotbBuype2mlO
         FM4w==
X-Forwarded-Encrypted: i=1; AJvYcCUt50znx8Ou/7nMLi4CdiQfQwsL6I8Stb6unsqXc2CAYQpkV2bPNzAXgVVOz8xku5VFqLIh32fCDhI3uAY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxeyjd40BqB098JMJplS4hxDPSSXWf/eWbTWG2DjZLBX/gewkvk
	81xZFlvs9b5zakSrfiJzkCUogy42lMK2wmCGIIlgKG+lJ6Izsams+r7wTlxiXUv9ggQyT9ExmDR
	Xfgh5Wd5YEegFg35fQwqYW8iF9D0=
X-Gm-Gg: ASbGncudsvbbeWRER6n8IJywPa4+Da6Aeozbv1PdFC+Xm2b4L1ISNzOhpi6hEIYkRP0
	/bOrkSLb99hXncqcqt4i3y+CbFybo6ubcXNY2tJMx8EGc4oSZYUttUTvB6H2GB8bPQOy1y971lU
	6z3W2MKicNOIocVZP7wigHcOc=
X-Google-Smtp-Source: AGHT+IEHwZwvERM6glWbYYwwzYCetfMHvG7kmqhssfc8GIXRgzL7p4OSea/eLcMf7tOLmQquK2cEHkkUW6DbI/qKOVg=
X-Received: by 2002:a05:6122:2b47:b0:529:1a6a:cd48 with SMTP id
 71dfb90a1353d-5291a6b07bemr170223e0c.6.1744857811522; Wed, 16 Apr 2025
 19:43:31 -0700 (PDT)
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
 <CAGsJ_4zt2Yuornri1bO=3o7myey1Q2dmvtjn2baD0ahxOyoNjw@mail.gmail.com> <20250416235849.GA780688@cmpxchg.org>
In-Reply-To: <20250416235849.GA780688@cmpxchg.org>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 17 Apr 2025 10:43:20 +0800
X-Gm-Features: ATxdqUEl8W05zT5OxxPD2alBle_1_ftAsTtwTrAsPphv_p55QZdh8rSZJeOtuLE
Message-ID: <CAGsJ_4wfWLbDC5SruF5TtH-VXE08OWxan12qNYSV3vGzBfe5Bg@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: don't promote exclusive file folios of dying processes
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Matthew Wilcox <willy@infradead.org>, 
	Oscar Salvador <osalvador@suse.de>, Ryan Roberts <ryan.roberts@arm.com>, Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 7:58=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.org=
> wrote:
>
> On Thu, Apr 17, 2025 at 05:54:57AM +0800, Barry Song wrote:
> > On Thu, Apr 17, 2025 at 2:18=E2=80=AFAM Johannes Weiner <hannes@cmpxchg=
.org> wrote:
> > > Right, I'm more broadly objecting to the patch and its premise, but
> > > thought the exclusive filtering would at least mitigate its downsides
> > > somewhat. You raise good points that it's not as clear cut.
> > >
> > > IMO this is too subtle and unpredictable for everybody else. The
> > > kernel can't see the future, but access locality and recent use is a
> > > proven predictor. We generally don't discard access information,
> > > unless the user asks us to, and that's what the madvise calls are for=
.
> >
> > David pointed out some exceptions - the recency of dying processes migh=
t
> > still be useful to new processes, particularly in cases like:
> >
> >   while true; do app; done
> >
> > Here, 'app' is repeatedly restarted but always maintains a single runni=
ng
> > instance. I agree this seems correct.
> >
> > However, we can also find many cases where a dying process means its fo=
lios
> > instantly become cold. For example:
>
> Of course, there are many of them. Just like any access could be the
> last one to that page for the next hour. But you don't know which ones
> they are. Just like you don't know if I'm shutting down firefox
> because that's enough internet for one day, or if I'm just restarting
> it to clear out the 107 tabs I've lost track off.

Typically, we focus on scenarios where multiple applications switch
seamlessly=E2=80=94for instance, on a phone, when transitioning between
different apps. The smoothness of these transitions matters most,
Immediately restarting a just-terminated app isn't problematic since
its memory footprint often persists before being reclaimed.

>
> > I agree that "access locality and recent use" is generally a good heuri=
stic,
> > but it must have some correlation (strong or weak) with the process lif=
ecycle.
>
> I don't agree. It's a cache shared between past, present and future
> processes. The lifecycle of an individual processes is not saying much.
>
> Unless you know something about userspace, and the exact data at hand,
> that the kernel doesn't, which is why the Android usecase of MADV_COLD
> or PAGEOUT for background apps makes sense to me, but generally tying
> it to a process death does not.

I agree that MADV_COLD or PAGEOUT makes sense for background apps,
but I still believe process death is somewhat underestimated by you :-) In
Android, process death is actually a strong signal that an app is inactive =
and
consuming much memory=E2=80=94leading to its termination by either userspac=
e or
the kernel's OOM mechanism.

We actually took a more aggressive approach by implementing a hook to demot=
e
exclusive folios of dying apps, which yielded good results=E2=80=94reducing=
 kswapd
overhead, refaults, and thrashing. Of course, it is even much more controve=
rsial
than this patch.

While I acknowledge that counter-examples to my described pattern can alway=
s
be found, our observations clearly show that process death is a big event -=
 far
from being just a trivial unmap operation.

Anyway, not trying to push the patch as obviously it seems quite hard :-)

Thanks
Barry
