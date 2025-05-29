Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD649246762
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748562898; cv=none; b=mX6wFsX1zK/8blS0qOmP16EC/lY7mul6zF5/2FMEwGD2sCj7U+7TS4eR+0YdV+zurpFVN+rFBgJ/a9eC5CtvAxe4gQg76TW4HakII5GSn5oVjh6E4yt81r7Va3mmFb9hbtr5wYgMnUSsyimS63cwO2Lml07t2HKdb17OKrxwDXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748562898; c=relaxed/simple;
	bh=mQ2X3C83MrQ+ifFd0cXmKRdvIysb8KwRrZHJnS3dFHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qdW+0KJPiCvVzhqivkPr3Z8+NyXALTxh/sz7XL3WaFok/1sm2xnesbagc1EohztRJrcWpgxYZty9nkD6vOt0fGUVlpn9oGt2uh+gwkp4Us4uAAeEbCsQNBAC2va2FJnBiqErznFHOhwEuMrvVEbrmjnSI6qrBS/nSUXBrjePmNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FACeITo7; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FACeITo7"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad8a8da2376so245851566b.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748562895; x=1749167695; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VCpgeKXbWpRtz3XeS2MBk7nO0oA3f7brSdzLdQTvzhc=;
        b=FACeITo74TuC6ghqI6jLj61IS8sJVnmEhnjJOF/OaNuScJrYY77jwNz54F9Q0j50/6
         NzhMPav9ThmtohVTHEEd+J+bxpD2YQPl2GnX3cs6DJ++Gy9nLCVJgD5juwYyCCbMXAMw
         55wYUFXI43eMBKZWHlW/bAszWebPf5AQFVyRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748562895; x=1749167695;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCpgeKXbWpRtz3XeS2MBk7nO0oA3f7brSdzLdQTvzhc=;
        b=k7Ok3MJypF3Y7WE0GWpp0A0z6BGDBbjsbbIqm+HGEwXtWqQf+GldPVZAJykilsQnZP
         YO+++hl/+FbXsB2vWCoQ0xFUgPVAIhamcc4VB2GSDTOZVCKJYJwZX7ARKUDdxEgxYqRr
         rF0r9w61enFkLdxJWHcT13T93Icdf9wd8bz4zfBVfDdjoZ++E9AnPrmaX5Ymt6WPn4Sw
         r4jQP8h2XggAcO7NwFMKFHDYp4qL6l5Uu7fYBQv1Qarb+L3H7Laf+4QkWlFOhmaMNrFf
         VctsofSU7lYle2GXc62bT7oi/1UDb6hm8zqZClSyLWWLNDaHElc0IpQA45NoFXcPqfni
         Q2+w==
X-Forwarded-Encrypted: i=1; AJvYcCU9tSJh9x4z5tOc8e/3vicZpnyXgnyDYSy8PkIbtQ58NOaVf3s2wQPwzEwhqQPfv3vuOSVJdIhTu+ZdR1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfrYGjjUb80b5wc7+pglqy9+8hSCOd8v8pVHgJ7JyVEV802a0C
	B6XHYyePFv7miL4MUzC0bDvyAJOhFMyw91o/aYn96uY5C5NAU0CXhqwZOX9j8bZe8J4YH0tuVNK
	ZUvInIXg=
X-Gm-Gg: ASbGncs5dNf5X/Y8W4+4oTtvgHQpLGgm4tHR1v1oVga1RHLWazeyqEhm9+sLg7IDdd0
	6tDbrb2xpEohZAB8cgjLl5n/ee2tnVGums8S2zDKWyd0kQFfTTGO9Bc6xy/HWfFWHAnYCf83eiS
	8i4vkMQoHbsxPuG094F5M+sBTtPe9NyPbDkaUL6nw0GfpbyhcSEVGd1nFEbW0ImxmGjlKi3788E
	KEd7EwYGgcgpUWzJ2amTqVqO2h+pwo/sgKOzs74vz9hTde6m1UCYNj87IqSDqX6R7MynpyL3Bg2
	Qo19d8nyArkGQBVTKdTsCrJ59X2y69GQ+rd9aRl2oPCz/rwG7iecV6ISKGIXE4T9o6jKPGzOrvg
	bSAY5mHHY5SA9+9GIXKOtB05tE1hdD/UI0k0I
X-Google-Smtp-Source: AGHT+IG7mi2o0QKHZVTBdmzUBdNolGEsb9R4eltFgE/55cVrWGGukVo3FIiAg95zXSNIUzG0zYokZA==
X-Received: by 2002:a17:907:7fa4:b0:ad8:a935:b8eb with SMTP id a640c23a62f3a-adb32245808mr117763566b.3.1748562894855;
        Thu, 29 May 2025 16:54:54 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82de76sm227002066b.65.2025.05.29.16.54.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 16:54:51 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6049431b409so2425097a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:54:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXqZ8m0bHhUOzrC+E5mSnkprEiv0Z/8S7tap5aYgJKdEMxZUBlTtt8Sxn4IgaSKyS6F/CQ7chbNMPzDh5M=@vger.kernel.org
X-Received: by 2002:a05:6402:35c6:b0:5f8:357e:bb1 with SMTP id
 4fb4d7f45d1cf-6056e1597eamr926476a12.22.1748562890813; Thu, 29 May 2025
 16:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428170040.423825-1-ebiggers@kernel.org> <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com> <20250529173702.GA3840196@google.com>
 <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com> <20250529211639.GD23614@sol>
In-Reply-To: <20250529211639.GD23614@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 29 May 2025 16:54:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh+H-9649NHK5cayNKn0pmReH41rvG6hWee+oposb3EUg@mail.gmail.com>
X-Gm-Features: AX0GCFuuQZJkBnHy-mtAufGSUKbxBrKrMtOhVAT8ZxGCHwWeq3lbFPW0g13cPtE
Message-ID: <CAHk-=wh+H-9649NHK5cayNKn0pmReH41rvG6hWee+oposb3EUg@mail.gmail.com>
Subject: Re: [PATCH v4 08/13] crypto: s390/sha256 - implement library instead
 of shash
To: Eric Biggers <ebiggers@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 May 2025 at 14:16, Eric Biggers <ebiggers@kernel.org> wrote:
>
> So using crc32c() + ext4 + x86 as an example (but SHA-256 would be very
> similar), the current behavior is that ext4.ko depends on the crc32c_arch()
> symbol.

Yes, I think that's a good example.

I think it's an example of something that "works", but it certainly is
a bit hacky.

Wouldn't it be nicer if just plain "crc32c()" did the right thing,
instead of users having to do strange hacks just to get the optimized
version that they are looking for?

> Does any of the infrastructure to handle "this symbol is in multiple modules and
> they must be loaded in this particular order" actually exist, though?

Hmm. I was sure we already did that for other things, but looking
around, I'm not finding any cases.

Or rather, I _am_ finding cases where we export the same symbol from
different code, but all the ones I found were being careful to not be
active at the same time.

I really thought we had cases where depending on which module you
loaded you got different implementations, but it looks like it either
was some historical thing that no longer exists - or that I need to go
take my meds.

> IMO this sounds questionable compared to just using static keys and/or branches,
> which we'd need anyway to support the non-modular case.

I really wish the non-modular case used static calls, not static keys
like it does now.

In fact, that should work even for modular users.

Of course, not all architectures actually do the optimized thing, and
the generic fallback uses indirect calls through a function pointer,
but hey, if an architecture didn't bother with the rewriting code that
is fixable - if the architecture maintainer cares.

(On some architectures, indirect calls are not noticeably slower than
direct calls - because you have to load the address from some global
pointer area anyway - so not having the rewriting can be a "we don't
need it" thing)

               Linus
