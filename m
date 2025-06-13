Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095351E5206
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749832581; cv=none; b=V6jWKXj3WYA8UuGnVndvHTZSsYoWkjINvJm2Ha6vvk+SXD3AFkapO9V9SwWvfwcLSrcI1VRoWo1PpBPNtfPCj3/9y55FHmQoqyLiF2u9yKwY0xXIWUzpiGYCKPprCOo2Ima7FgmADm+XDOiD9q84ZOdA76Hp9ssnIcWAmksjYUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749832581; c=relaxed/simple;
	bh=6IDK3mFK3aUcD6DqmEoL/rBAW6jbXc5FxEXCTke0bD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sQIT1qw5lV6viHxNFEWChMvpskA3pZZJc2mjZwkj10AR3uvyBaK0MUSwAv7lF7nqq5cq2Uagw+mFzzln799YXVGfQ+E8hrtZsQuq+ckaY12LT52EKdE0Vc2xq+A9ljzyNIEn5X416jTAO9MJRs3sx1Yr65B29Qa38GAQ4e6ROWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PI5Rveho; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PI5Rveho"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-adb47e0644dso401290866b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749832578; x=1750437378; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=76g08zX1QgiOXgDWQ+4Q63FmolLqjqLzmJdnqen2jZI=;
        b=PI5RvehogUMvTtnZ9NT+nSQkeUjvDQn3WINLD3naZhlnHdHoiwzfw4PB8oyeNV7oDE
         VrHfQJGMeqLG/pNd3WOoWMrlR6AladBALeW/89jAhhvNPpu5dfKbt2xlyQEemCm0h6s4
         FDkroMjWJCWEClLaDHi+R/BMqAC4Nlc/tEs3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749832578; x=1750437378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76g08zX1QgiOXgDWQ+4Q63FmolLqjqLzmJdnqen2jZI=;
        b=j3VpCIxMtL2R7E9VtPnWTgdYYuz//tqitDHa7dkr19MICdw86PREbHY5UHaiFH50Wx
         6UiMsNDLDsFzpJf74vA7KzjpEBv49ob+rt1ygjT9Yn0eq6ddWJCPVELEFI7cdWqXVWN6
         nd9ciHT0bNyQjyKWnxE0rIFsnaVTbrBNKI36Wy+Btzvoyq8L6rdiaSt5xkndkPJPaWG0
         cis/EU6aheB2u7Gtw3GI/rLSPmZfJAopNKaEToIXcDNneZfg/HF3r7o2KWU/vxk+WUyn
         NeAyJAb/Ei/2IoDFnm9JkY3mHZl25Xv3PhTGHp9DWlWLvbXweYAvaRp6rx1zIybjWEte
         chHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJJJ45j9UQ9RejeMaXNT7yTmBk28sNnd5ARXV+5f6pcihKTjl4d0rSgfgxBAS3HHZNimKAYWF+GWnnlGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGg9gG0LQeg8RhvI3VFthuf5tqxezlq6sqNpuWTbC1S6RyitYp
	324XI1n9LzxmwL+5kSx7B03NxwqJ7kViZhSkFxbPvQ+D0LmmOAYYtS4I7LtjzigwBLs3GvAGcKs
	rlAxUbq13Eg==
X-Gm-Gg: ASbGnct0TfpN5/aXNsqnD1s4lFNVc/ChGrhh1qMpk90P9E882IAJZ8lQEEdcCzmEad2
	bzAE++T3Y+hWSTqAMiDJNNkD+YfKsLgyVkhaCjE2B/DnhjvUXAeIuzYPV++RSWBxVgbmlOs1M9V
	R4ByZYzSha7/Vqxz2i8g6D043mZ2r2TnoIVXQAawoHDe/7Z7GgTkMADaWnkU6oViIz4092J1w+5
	2TJekhkywUoGffyMODAxZ4qh8T6bzUzOW/co50LHKLh6pdkK+Yp/ha7l46Lr+vp+/mHDFS/ZxhJ
	Ugonb9er8O0b9J986MLYNbgkDKoZpLSUjEqW1XT8lh2wiG1jkgaKh3GPGXARSnLtV+Zl25W10rk
	jwGnUdBhBcOArlS08sM4z7Cu/6y+pyfRPUngCiPaBvsE7PdE=
X-Google-Smtp-Source: AGHT+IHe58E0f98I716Nsk4qI2jJPVYh5sqhOd5fc0ps0G3fZ4Y1x1tT0zvgdBGHrVbruzFhEZMYrQ==
X-Received: by 2002:a17:907:3e91:b0:ad8:93f6:6637 with SMTP id a640c23a62f3a-adf4f35150emr138635866b.21.1749832578194;
        Fri, 13 Jun 2025 09:36:18 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec892b90csm152783666b.142.2025.06.13.09.36.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 09:36:16 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-607873cc6c4so4726789a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:36:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+gJdiXStdFNJ8kFNym0yknIhZNCcBGkclwkoHBM1K6oRWFzjNc8NblDcp7ziKsKgRQjL7gw2FUBweAeQ=@vger.kernel.org
X-Received: by 2002:a05:6402:35cd:b0:602:427c:452b with SMTP id
 4fb4d7f45d1cf-608ce49d897mr365341a12.3.1749832576184; Fri, 13 Jun 2025
 09:36:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611020923.1482701-8-ebiggers@kernel.org> <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol> <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol> <20250613053624.GA163131@sol>
 <aEu5cyDOMcKteW_b@gondor.apana.org.au> <20250613055439.GB163131@sol>
 <CAMj1kXEDCRfCgvtuhRc+a=m1kVt-zkcCqi_=_WOFTmt4Hz2gGg@mail.gmail.com> <aEvjrhkLnB_GEKnV@gondor.apana.org.au>
In-Reply-To: <aEvjrhkLnB_GEKnV@gondor.apana.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 13 Jun 2025 09:35:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiewoOfhK=NVQT2uf+29Kngv9F9J6ObJRFUKi6n-=B06g@mail.gmail.com>
X-Gm-Features: AX0GCFu7lGsyyFJqLRh6z7a562txhJJOyTpVqIIzlie72BRGPF0wH2A3ccvLGV0
Message-ID: <CAHk-=wiewoOfhK=NVQT2uf+29Kngv9F9J6ObJRFUKi6n-=B06g@mail.gmail.com>
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Ard Biesheuvel <ardb@kernel.org>, Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org, 
	Jason@zx2c4.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Jun 2025 at 01:39, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> First of all the export format is being made consistent so that
> any hardware hash can switch over to a software fallback after
> it has started, e.g., in the event of a memory allocation failure.

Can we please instead aim to *simplify* the crypto thing?

Just say that hw accelerators that have this kind of issue shouldn't
be used. At all. And certainly not be catered to by generic code.

The whole hw acceleration is very dubious to begin with unless it's
directly tied to the source (or destination) of the data in the first
place, so that there isn't extra data movement.

And if there are any software fallbacks, that "dubious to begin with"
pretty much becomes "entirely pointless".

If the point is that there are existing stupid hw drivers that already
do that fallback internally, then please just *keep* that kind of
idiocy and workarounds in the drivers.

It's actually *better* to have a broken garbage hardware driver - that
you can easily just disable on its own - than having a broken garbage
generic crypto layer that people just don't want to use at all because
it's such a ess.

This whole "make the mess that is the crypto layer EVEN MORE OF A
MESS" model of development is completely broken in my opinion.

There's a reason people prefer to have just the sw library without any
of the indirection or complexity of the crypto layer.

           Linus
