Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E874329290B
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 20:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748549693; cv=none; b=cb5wZB8vProCqrchzYcsUJOkPkiS2rfrgtWRm90Kg2y9yNk7qr4jFkJRIWoXJ21GtOfoLLvjTQVA1rGZGI2IxrkEkI9OGNt/DElDduGHFJivArH4eh4Y+V6yRSy/MHmvZqsPmwzFk547Ce9ljv1tFqzM/E14+h6zfPXyHfaep4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748549693; c=relaxed/simple;
	bh=pEGh+FyMPK3zT/zV3uCRaiREChKfcHdnfIXKiv+KGVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rkxCRXaV6yda4lcE1xtdqee7sfHsnDEUHlqiZnPbl4UAB6Es83aEBaxIkSlmd+XXSpmShYywEvr4+X44krocGfHbbdTEfto8mEJEexj/nQhCvg/mHoSMko7D4h/JDytP2geO2F5oVbHq8b9zcmMos4ZyxMxGzUWspl4qNGMl978=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CUZW/Lz1; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CUZW/Lz1"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-602039559d8so2399361a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 13:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748549689; x=1749154489; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HVSRhT5MS1pvdu2dqLDEs9T4cWr5CB+FRQ66tAe+RVE=;
        b=CUZW/Lz1rXNvL4/xDxoZhgf2TwOSc+gxLjvGZnb8SeB+HMXYaTJ4d67Lm4pEgp6I8z
         7uwhw/oxWedN3vTyBNo6HTPcLu1QPnqChVtgvXy5KDWfJy0ejD2iCLb3MNO8SX1SNNZv
         d2wNH+w49xoICvrrcmWZE6wfrPSKqYpF+M2iE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748549689; x=1749154489;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVSRhT5MS1pvdu2dqLDEs9T4cWr5CB+FRQ66tAe+RVE=;
        b=pRus112vc8AJgmglSrd8UiRs81gaxga8opLKzB8Mn3dGG1M0JcYgGNJoYfCQtiQwao
         Dy/j8wgsKXNz7vfoOdabIDmxWWslMh3a42Jr3GUNH3mwsjHl5lu4pkRV7i5GgRCC2kcp
         qZmO1tWowEWm8DJJhlabIZeo5I29mmA4llYgYHc/t//ieAk23MBTg/yBBwmLxRlvts85
         rgfemJQWSxFTZDV4M73o4EPcIzSsNZ5B6OtYvoRbUe8Vm7iIeZb9I2j6O2yg12rMjVT6
         l9rs692EologzMQtmJCFBJfdx8fGgNHaGW1g4guJKG09n7g+YHHtZE3dZjdLL55QlMnP
         0UNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV371leVdT2m5q5GUNBmk5yg8+giROttYbN5sxGiLq78JigPlhoC2wzNX0ex4SBe3wB+VBhV8EJ32SXTfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsdL37kgc4lZIY9Pn/ZuysgHLi5BrneCC20SEbDAN/T3vDnNbl
	yCjUkjDABAsaMEYHEZazLRZYgXHGZufNyiaZkkDHqNZUcyo5mGxWN+GffMGpQzgzp5SHAchg0OK
	UKEZJG5E=
X-Gm-Gg: ASbGncv/5+95diyoNyrErbAdbdQ7CpOG0Le83R91UXZ+YZ0x1j7i7aj1wG8zg4wZDcH
	qT3NjTVgevbVGWfYGtXMLjrTH8ZNcYTNkwSb1ADBx+68nvvyKYwk+YOFQnfN/w0t+nymPm23f01
	/Dtx9N0mh6va+pKaXEcsT/x1Xra2mQpvntRBpMjK+tmqoKSVpXnQf+9torHFMNfbO32YQrOALiQ
	mrn7GuoE8H6EOuQFxHYEqkmy6sQi2k7usM3prmN3Aon2nnO5S1LA3pULgbn9GveGo+5FBXdChfz
	xf+MfvBkQtDc6yiT3+0KdD6Ey3xAyvybdGv7OZchzqVg0XZNDnMbkMyN4asirrBi9/joge2HbES
	nUuHQxhP16OlIQ6xvWea44QvaCQ==
X-Google-Smtp-Source: AGHT+IE3apUh3sHdimF4D9rQ/e3PpOGYSxuNO+Mo9edrE7BkGt2Tn6carCTOAGnjmrWlKeT6Xx1MpQ==
X-Received: by 2002:a17:907:7fac:b0:adb:2ef9:db38 with SMTP id a640c23a62f3a-adb3228d363mr72977566b.36.1748549688867;
        Thu, 29 May 2025 13:14:48 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad3d7ebsm196597066b.159.2025.05.29.13.14.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 13:14:48 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60462e180e2so2549830a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 13:14:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXxxbXqRBydiAH7qVqTcZnu9MYyApgNqyzMpBAzby8GSqXT2zalPsKQwt9Lw49mYhrvAp6skTFftSSAaus=@vger.kernel.org
X-Received: by 2002:a05:6402:2346:b0:602:1d01:2883 with SMTP id
 4fb4d7f45d1cf-6056db10b4emr581444a12.1.1748549687775; Thu, 29 May 2025
 13:14:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428170040.423825-1-ebiggers@kernel.org> <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com> <20250529173702.GA3840196@google.com>
In-Reply-To: <20250529173702.GA3840196@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 29 May 2025 13:14:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com>
X-Gm-Features: AX0GCFuiJcryO_X7sE1ePk8yCEY5HNa9j_jPT14Gm93VGY22kOHLk2kIn44ZkWY
Message-ID: <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com>
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

On Thu, 29 May 2025 at 10:37, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Long-term, I'd like to find a clean way to consolidate the library code for each
> algorithm into a single module.

No, while I think the current situation isn't great, I think the "make
it one single module" is even worse.

For most architectures - including s390 - you end up being in the
situation that these kinds of hw accelerated crypto things depend on
some CPU capability, and aren't necessarily statically always
available.

So these things end up having stupid extra overhead due to having some
conditional.

That extra overhead is then in turn minimized with tricks like static
branches, but that's all just just piling more ugly hacks on top
because it picked a bad choice to begin with.

So what's the *right* thing to do?

The right thing to do is to just link the right routine in the first
place, and *not* have static branch hackery at all. Because you didn't
need it.

And we already do runtime linking at module loading time. So if it's a
module, if the hardware acceleration doesn't exist, the module load
should just fail, and the loader should go on to load the next option.

Not any silly "one module to rule them all" hackery that only results
in worse code. Just a simple "if this module loads successfully,
you'll link the optimal hw acceleration".

Now, the problem with this all is the *non*modular case.

For modules, we already have the optimal solution in the form of
init-module error handling and runtime linking.

So I think the module case is "solved" (except the solution is not
what we actually do).

For the non-module case, the problem is that "I linked this
unconditionally, and now it turns out I run on hardware that doesn't
have the capability to run this".

And that's when you need to do things like static_call_update() to
basically do runtime re-linking of a static decision.

And currently we very much do this wrong. See how s390 and x86-64 (and
presumably others) basically have the *exact* same problems, but they
then mix static branches and static calls (in the case of x86-64) and
just have non-optimal code in general.

What I think the generic code should do (for the built-in case) is just have

        DEFINE_STATIC_CALL(sha256_blocks_fn, sha256_blocks_generic);

and do

        static_call(sha256_blocks_fn)(args..);

and then architecture code can do the static_call_update() to set
their optimal version.

And yeah, we'd presumably need multiple versions, since there's the
whole "is simd usable" thing. Although maybe that's going away?

                   Linus
