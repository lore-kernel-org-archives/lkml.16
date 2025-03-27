Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B2620E039
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070417; cv=none; b=p1M20W3c+wStwUHP1cCjKZ0yuu+TVX0Rz5APsQ8c80rqPyUEByyVnUEjq3puZjO7Fzx1Dc9n6WNLnVDg0AyeVolnqjUBhYyP6gk+8cfvfCcPsvr8Vz8vo0/u5CX/cKySeCX9rkXhEmxA9r1jtUDCp2laae5P77eRyMJjrV5HsSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070417; c=relaxed/simple;
	bh=H6nLXwiIEvSFqpSB3wQ8ExOnH42MrNk+uWhZm9orWyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p5D+1k0OrZlKKxT55pqXpktTgc4z4nAsaAyzhfHq41eYe8/GIWH/uN0qLtQ3yKHOMtAYz+OKH1VAYNDOIreFOS/HZDQnyzw8wHPYpl/Ft0D+5ZQG89o4bkc1yDgKBggi9Qla2vfI7V3t6B+dmce3AM2aSok2DBKygsnspRcjSXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P0j22AjY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P0j22AjY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743070414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z1V7Tj5XppP4TZCf7Oi5My5u1vfz1nFkHzifF2QtL7E=;
	b=P0j22AjYBULR7U/KhymCqZTJHJFZ7/uyBlP1fCwGyHHX5bAKBQKM6ixsfHRylqd2FnPnDi
	oqba/LV0AVV0l1WajopAEpEuRVseFmSC+3q7x9MJRZJ0hi4oqDlK/W8+T6NDNVTzfqPw8a
	LYss/9pz78Ep+QV1aDrbsFsVlhizQeM=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-UWzUlS9HNv6Ijb3fRkty2w-1; Thu, 27 Mar 2025 06:13:33 -0400
X-MC-Unique: UWzUlS9HNv6Ijb3fRkty2w-1
X-Mimecast-MFC-AGG-ID: UWzUlS9HNv6Ijb3fRkty2w_1743070412
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff799be8f5so1402623a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070412; x=1743675212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1V7Tj5XppP4TZCf7Oi5My5u1vfz1nFkHzifF2QtL7E=;
        b=pR8Y0TzSqOTDks9tDN5Pdw8sEilTtP6fGH7f0LtBpasbZAWt9/krZTgnpdPxoLUXMD
         B9rIanf0P62GhNFWhSOkP+kX4SozP6zXPnjFEAP7ZwCX/jfGd2Z2tHv9wXBi6YrYmzbI
         opzL5GTkJuOQeX2/5EhZEPtsVC9bNa1jHf9SYCtYX4hdYsZ9mBMi2WCPH1FoSCm26TBh
         OHQJue5sRlPpNikywZ983sSbq/HNuavejH6TNtUzZNEwjg9Wtf+y6rBsq8HecWu+sYkf
         nLqFbWuducJWQm8XpneZbRtUrsxt316uXafkpN5EIRxOBst0Fl2lwz69Py50NMcOUJ7w
         x5EA==
X-Forwarded-Encrypted: i=1; AJvYcCUsL66f2//mzU0FHMAjoFuMgVqdSCFviGI2v1vwm0P3bDVv4ntFbdcw5Eu01b/WcKUxmVGR3uroKl+o6Mg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdVrEPagXPHSVNFUbfizpYQNFmZUPgzTkL4j502LiEiig75CaN
	2DbB4QzKs2rHY0/KJopCsRu9FQsUuW0cSnRyewUvbcHHXToHu+R2KfFTuUUoVXe3zTm+EOMUaiO
	LHxu809DubLMarehqHUW+LL1JEqv6SWnkRW0gYVYCBOEcmUd9U+xNj/vcCFdjMwlRmAKjZyJ3H4
	F6qM5RJU6VvbyQCZVrt+5fggYvfRXz7ZfngmavTX0ysLAb
X-Gm-Gg: ASbGncugcCyeJx83oqI/ZftZcKs+aeiq64YnQYBg20AuaQZvNYJEmjwWg+UoSkBxtlT
	/vczpe/ciLGW+qrkMemR6emng6bT1n/2uoiZU9ej4sOmayx32BZOaqBLyo3Rq9KneKgy+RbU=
X-Received: by 2002:a17:90b:1b47:b0:2ff:6e72:b8e9 with SMTP id 98e67ed59e1d1-303a906c30emr4333004a91.25.1743070411733;
        Thu, 27 Mar 2025 03:13:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo6BSnN/7DnWwsrPKsPzsp5vwYeekx/yw1uXydp3cTFY2lLZ6RC9pAe31IwHQYeL/C+jGIXOHxziJ1HikRcBo=
X-Received: by 2002:a17:90b:1b47:b0:2ff:6e72:b8e9 with SMTP id
 98e67ed59e1d1-303a906c30emr4332968a91.25.1743070411193; Thu, 27 Mar 2025
 03:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324103048.3d8230f9@canb.auug.org.au> <20250327101610.45f13473@canb.auug.org.au>
 <e9c50bf0-e85f-4c71-b46b-b9b919955045@oss.qualcomm.com>
In-Reply-To: <e9c50bf0-e85f-4c71-b46b-b9b919955045@oss.qualcomm.com>
From: Alessandro Carminati <acarmina@redhat.com>
Date: Thu, 27 Mar 2025 11:13:19 +0100
X-Gm-Features: AQ5f1JpEcUZC0l9g0TEutF6ljQnWodfEfcECrFj9kOh5Fz3DBBEkrKeTMe2-9MY
Message-ID: <CAGegRW7ONApvTPMSvYfpvH5=r06pPNpUAo7zBLfAhr-qcycFMw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the kbuild tree
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Oliver Glitta <glittao@gmail.com>, 
	Guenter Roeck <linux@roeck-us.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Mar 27, 2025 at 1:20=E2=80=AFAM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> On 3/26/2025 4:16 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > On Mon, 24 Mar 2025 10:30:48 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
> >>
> >> After merging the kbuild tree, today's linux-next build (powerpc
> >> ppc64_defconfig) failed like this:
> >>
> >> ERROR: modpost: missing MODULE_DESCRIPTION() in lib/kunit/backtrace-su=
ppression-test.o
> >> ERROR: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
> >
> > This is now lib/tests/slub_kuni.c
> >
> >> Caused by commits
> >>
> >>   19f3496e6241 ("kunit: add test cases for backtrace warning suppressi=
on")
> >>
> >> from the mm-nonmm-unstable branch of the mm tree and
> >>
> >>   1f9f78b1b376 ("mm/slub, kunit: add a KUnit test for SLUB debugging f=
unctionality")
> >>
> >> from Linus' tree (in v5.14rc1) interacting with commit
> >>
> >>   6c6c1fc09de3 ("modpost: require a MODULE_DESCRIPTION()")
> >>
> >> from the kbuild tree.
> >>
> >> I have temporarily reverted the latter commit until the former are
> >> fixed up.
> >
> > I am still reverting that commit.
> >
>
> Guenter & Oliver, can you add MODULE_DESCRIPTION() macros to your respect=
ive modules?
Yes, sure.
I'll do it asap.
>
> Context:
> https://lore.kernel.org/all/20250311-moddesc-error-v1-1-79adedf48d0e@oss.=
qualcomm.com/
>


--=20
---
172

