Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C721288512
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749647736; cv=none; b=oKfE+jbjCcH4UF6Foug6TuP/58+a4AHW51xF7CVjwOVeKpUioFqtZDeLId/rX6XQZYGXvsbF1eBM5wjmFe+wI09Q/y4KXtepaJ6zAibTYxRhMg1oGGjHjGoEX5vRGJ2rLjNq6BkpW1QzYc9zkoa09ccJuxuxsQ1wB241nbeL63I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749647736; c=relaxed/simple;
	bh=x4u3EZN+FRO07nkhS1GFPucsrVs1SEnvS+23bZ+Vu9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PWdnSoTkQvy+NNW2TKwEYEtiBwNwTH9YLznXZRSkZiB+Miruhh0d2MLaWPzBaYdQf3Avfxp+voOSZq3ochqtklhncl2QVpOJlNNlu2vbrH4DyyXQ9ZLxALb9CvYDEsmKtKKRJ3NMsrukaSaXpYe3lmQ7jud4xLUG0Y74PuZdxUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=r2v2gk1R; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="r2v2gk1R"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a6f0bcdf45so50369431cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749647733; x=1750252533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bx+QJSwdqHmxmjJfWKsN6eCcQk7vmKe/DJTvo5pGcrg=;
        b=r2v2gk1Rmz0C2ZXXU0jelvh1Tlpkg1VMPNfL7JVzjvsoSVf14TyJlVWQLArTqvK4iR
         GMT5aBGHtOSaaP/c2YddR2rUdhh2JycUoWbNUdPgPxvoB2DBJWoaJXjN5jwjyVE3fpGs
         72o2wjcN1+GCsiEGZTjrgb1GZCdwgnFpB/QCEHvCBFzWsNnPA52f8k+/kZfSKrLq7baJ
         77/JyLHNpwR8QVCeOebNv1CEUxyt/PuUrFjnZhXYxEGb1qoCNiQ1KzUdyS4lfZf3Zo1r
         LnvHOdckKUAyjgLblRps9aFDQDABlGlaBvi1bKWD5TdZYm5dMlgzLyi3P1/iKN9HbyA/
         c9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749647733; x=1750252533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bx+QJSwdqHmxmjJfWKsN6eCcQk7vmKe/DJTvo5pGcrg=;
        b=rrFS/1I+aJemU6dIPktf1qXdMNFRbmeJuWlR+blOp7m0NlvHFx9BvPTvS/cf8ineut
         h9x6iGlhDoV+ky5FQ1jaO5G8/3pDIRHKrvKU5WTgcY1LmxVd34YetyUz4DWp8phJFypE
         2+UEo531sM/Tp1ViLuyt/dGIL297KxAlJvAJ/7pqC4ivRAi7iWx90ECJg4/a4TihVaEN
         znmbgRTGUTcJ6d1dU2PtWdsAQAiiIdfSm87MvPCtk+gvGTx8REzZ5a9gBwmgZ7Nqx6LH
         xtf9+yCB8aplSEzIDD1mBSYREq+Nxcq1KtjzfDv6p+ZnQBzUmueADKqQbCPzg+pLh14V
         Bt+w==
X-Forwarded-Encrypted: i=1; AJvYcCWiv9q+zuVSX+SixrcxltKHdouqm+1cGtwyfjXoHbXkYSU0aeSGbcC4C8mkTLQpjdE/5TQadgXDxv6QOxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIp2OphW5kDYE5DSf2Nx0TeXJcBNHM5gZVX8bAbuxCzEQ7Des0
	P9kXdBzmDgRp90c8/yUlttEzQfDLAPYXfEywelxQ9oktVHd8KtagtmFupHcmIyNTS4nyD4bF0Y3
	7vt82Kq9BjuTAFilzzduXXsAJaRl/wpCYmd8z/OjfMw==
X-Gm-Gg: ASbGncvekbgk+aTNwBRuOIVYrNZ9Dp+tG15fq9kYb/vClpiVpgnRzVQ38tkaFeCPwLP
	NlKtvswl+vAz0bAu44lQTjlN1adKthZXMW2fbrdbEeO7yKrWarihCDdn3aHJdOMc2+YJfk9IgYN
	0VHpiSK3Tz7KKJkJbuqALDySqWLZ76dzNVag0Zwpxn
X-Google-Smtp-Source: AGHT+IHkj+/aNhbEvJ86/UIGCIx4gF59E2n+BXlPkeJ7OIUIHWfiwDNSQWWRAB99p0osoYKzpjGZCD42Uxr3WOr2ynM=
X-Received: by 2002:ac8:6904:0:b0:4a3:d015:38ae with SMTP id
 d75a77b69052e-4a714bc0ca3mr46790171cf.23.1749647733254; Wed, 11 Jun 2025
 06:15:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605171143.76963-1-pratyush@kernel.org> <aEKhF3HcrvG77Ogb@kernel.org>
 <mafs0jz5osutx.fsf@kernel.org> <aEc30BoLE9HRxiZm@kernel.org>
 <CA+CK2bAAbZjS2Og79xxLcDtNf-eM0up-8fwhd4fg_dp0j_TahA@mail.gmail.com>
 <aEfGTXrsEL5-DuF1@kernel.org> <CA+CK2bDXOWzrTsNtbCCK2rabNysf0JFQT5VfAjYrX5oSoiLmSQ@mail.gmail.com>
 <aEhgNU80Dr9iRwoD@kernel.org> <CA+CK2bD3n=JDuSsMGvsyMnVbPhGdhdf6zWFDa3KpzRGEXygdgQ@mail.gmail.com>
 <mafs0qzzqo2bg.fsf@kernel.org>
In-Reply-To: <mafs0qzzqo2bg.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 11 Jun 2025 09:14:55 -0400
X-Gm-Features: AX0GCFvQtpuz31GBIWBQSIsnOG-xC0O1tIo1gpevWjl4XB1iep4R0wvTpWnG7zw
Message-ID: <CA+CK2bBoMfJuUCV6sL80kwzYPnENnt7fDk2jRMPV0iPn1jCJdw@mail.gmail.com>
Subject: Re: [PATCH] kho: initialize tail pages for higher order folios properly
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>, 
	Changyuan Lyu <changyuanl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Michal Clapinski <mclapinski@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 9:06=E2=80=AFAM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> On Tue, Jun 10 2025, Pasha Tatashin wrote:
>
> >> > > I think it should be the other way around, KHO should depend on
> >> > > !DEFERRED_STRUCT_PAGE_INIT.
> >> >
> >> > Agreed, and this is what I first tried, but that does not work, ther=
e
> >> > is some circular dependency breaking the build. If you feel
> >> > adventurous you can try that :-)
> >>
> >> Hmm, weird, worked for me :/
>
> Worked for me as well.
>
> >
> > I am super confused, it did not work for me over weekend, and now it
> > is working. Even `make menuconfig` would not work. Anyways, I will put
> > it in the appropriate place.
> >
> >>
> >> > > > We will need to teah KHO to work with deferred struct page init.=
 I
> >> > > > suspect, we could init preserved struct pages and then skip over=
 them
> >> > > > during deferred init.
> >> > >
> >> > > We could, but with that would mean we'll run this before SMP and i=
t's not
> >> > > desirable. Also, init_deferred_page() for a random page requires
> >> >
> >> > We already run KHO init before smp_init:
> >> > start_kernel() -> mm_core_init() -> kho_memory_init() ->
> >> > kho_restore_folio() -> struct pages must be already initialized here=
!
> >> >
> >> > While deferred struct pages are initialized:
> >> > start_kernel() -> rest_init() -> kernel_init() ->
> >> > kernel_init_freeable() -> page_alloc_init_late() ->
> >> > deferred_init_memmap()
> >> >
> >> > If the number of preserved pages that is needed during early boot is
> >> > relatively small, that it should not be an issue to pre-initialize
> >> > struct pages for them before deferred struct pages are initialized. =
We
> >> > already pre-initialize some  "struct pages" that are needed during
> >> > early boot before the reset are initialized, see deferred_grow_zone(=
)
> >>
> >> deferred_grow_zone() takes a chunk in the beginning of uninitialized r=
ange,
> >> with kho we are talking about some random pages. If we preinit them ea=
rly,
> >> deferred_init_memmap() will overwrite them.
> >
> > Yes, this is why I am saying that we would need to skip the KHO
> > initialized "struct pages" somehow during deferred initialization. If
> > we create an ordered by PFN list of early-initialized KHO struct
> > pages, skipping during deferred initialization could be done
> > efficiently.
>
> Or keep things simple and don't use any KHO struct pages during early
> init. You can access the page itself, just don't use its struct page.
>
> Currently the only user of kho_restore_folio() during init is
> kho_memory_init(). The FDT is accessed by doing
> phys_to_virt(kho_in.fdt_phys) anyway, so there is really no need for
> restoring the folio so early. It can be done later, for example when LUO
> does the finish event, to clean up and free the folio.

Good suggestion, however, KHO does not have any sophisticated users
that we are going to be adding as part of the live update work in the
future: IR, KVM, early VCPU threads, and so on. So, while today, this
might work, in the future, I am not sure if we should expect struct
pages are not accessed until after deferred initialization or simply
fix it once and for all.

Pasha

>
> --
> Regards,
> Pratyush Yadav
