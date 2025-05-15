Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F37422A1E5
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 21:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747344050; cv=none; b=kzD0/VQzEtRo2CFIb30tTPtTWB5edfk0sDI1OEheQ3emFjjFS9CVBhVtK3b0n+qnIbwHI353ZaQdWqIehZUuqQyzBbEXx23iRE8w5xEv11kgY8t7cz8PkX82J6cEXUxhw68/NajXLZApOPGWMn36WNmZNnD29njpwphFILDSQns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747344050; c=relaxed/simple;
	bh=QOm3m/r0dyEo2Mfa7umeu+ruloxr/DK67GsqoXNotWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QRK+jq8p390SoAqXMo57WC9QAI5Uuyr8kP8AUSdezlJOjd5BbILM7DqKslKv79d80zJnHzDOsBSuLGfheTfFEqNB7o62kF9cx/ILBEkK5OTcRGqesss6iRmfFIl1pEMRAelI3xretzWuge7iEkF/HhCzzmeoHpmkSM0rKBz/2mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MxLafy8E; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MxLafy8E"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad216a5a59cso205393266b.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1747344046; x=1747948846; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BBR1eDOR9aCst/oayM8CR1mluYptr7n0p9+2J85ynlw=;
        b=MxLafy8E8iqQ5lgWlpYcoGzbiZPRAexp0uA9BJZ/N3ylYtyyZsMxITSSXWApTBv0dP
         GOPzzLyH4/Dm0OiyRJLjOrvLeci3X2UJZsQNI5FQG8mbJywQBTighY19678rCPPDOTWh
         cCjmK9/JUbOoPb74X5vfD/YNRVksUgzZH55xI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747344046; x=1747948846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBR1eDOR9aCst/oayM8CR1mluYptr7n0p9+2J85ynlw=;
        b=QRQVaeu04dN9wPwJW1EVtr515wUI+SPVI2SsM1OdMhGVKyb9riHuYhvIoPrb8Rsh7m
         B32sVnIINCX90JH93tvpJjxHd+aorjOc/tK56DUhsZLt+kme5St3EEkNRtbkKFSlH7iB
         OpKqCdtWqKrEnR7EbWn9XysGgVJzKpsGWtK2LM2ffAT3QP4lIWmFWYDeSlmHEHIA2RQY
         JVT5dVEXOb0jadl6nOcvQJKTeE1FQkpx6SfYrUAA4mVqBEhQKLZyqgw2go0yhG3lUHgn
         rEgHNA1yCRB/nOn0vulDIyh+ZFU5MIcW6GUWRaG3zdO8KatpaiuOM4gYW0H2Hr6onQ+E
         7iIA==
X-Forwarded-Encrypted: i=1; AJvYcCUU7kyxZIHsGVwzrTm6CZmgde/prl4m69qPlJlKzAi+pNkjgvupmc9MTQXslvqaku2jwl6w4frDp4GNsUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOJdCuRnkcU+0lUORZDbQAF2z0TnMuCjYIzoBl0enz+Fkexy3u
	l6zIzlbxAIBpctDTKkut4yxF4yxcpQcLEtcJD4ANs67ulYIuA+/TaTOHnq+jlg4wuCfDgV/v0gr
	cxL9vcZA=
X-Gm-Gg: ASbGnctUCQTzgv/d42unhtO1hfFshNbkr45h2INID6acMvzejE34pdRp/aJxra8bOxC
	bl0+H9KWh4CPYf0ku+TGuxBunKSoDyn1xEXMzy+kNwMP+YMo1GbgQttSDzl5BMYKBwI3XAJW6Mc
	oEw80hVAWHUd6+Qhtnjh++2+OfuHRDE3hZJNSBRU15Tgl2T0FGlFrBEz+rBP14/F1pas4n9GD6d
	JmMgxOqB0kJ+c2qFQlA5JeVUn/9Nb3crV/hew6XaMlgJ5vgwy3Ys05vfAd1BKHnQQLoTtaZOK3a
	WtLscC51tCHCxaKhpFUJfSCsDqZWWYgpkETT805d+k069Xi4VReoHSAdkAA5BW4z2262wB1Mrrx
	4j+CBBZnqlWfFWMkgMap48LJq4Q==
X-Google-Smtp-Source: AGHT+IHV08S/ZvAE9jB6dIYfouFy60KD4EdTHvVNQjB5N8GIJnypZtwY+2cwz6ervBhyFeQhbgfmoQ==
X-Received: by 2002:a17:906:c115:b0:ad2:2abd:4613 with SMTP id a640c23a62f3a-ad52d5d85b1mr130610166b.41.1747344046571;
        Thu, 15 May 2025 14:20:46 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d49889asm40091066b.141.2025.05.15.14.20.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 14:20:45 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5fbfa0a7d2cso2345197a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:20:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXxI8dunmvenv4r6plDqC5xR5KWv9zthBiCItZI4CxMqgkK+uya8I++czLs1Jr0BDaNTA2kL+xNmbfWhN0=@vger.kernel.org
X-Received: by 2002:a05:6402:34d3:b0:5fb:e868:4d47 with SMTP id
 4fb4d7f45d1cf-600900a54a2mr778653a12.7.1747344044885; Thu, 15 May 2025
 14:20:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <feb98a0f-8d17-495c-b556-b4fe19446d5d@zytor.com>
In-Reply-To: <feb98a0f-8d17-495c-b556-b4fe19446d5d@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 15 May 2025 14:20:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi7sLm+zHUkyFO8V6QNghLQn0yiWsHfm8WU=V15K7K07Q@mail.gmail.com>
X-Gm-Features: AX0GCFvQzChipAAsH_IbAZosPG5_B84g3tcv-qhuY1vOrrfycyiz9i-JpJtmDoM
Message-ID: <CAHk-=wi7sLm+zHUkyFO8V6QNghLQn0yiWsHfm8WU=V15K7K07Q@mail.gmail.com>
Subject: Re: Metalanguage for the Linux UAPI
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>, 
	libc-alpha@sourceware.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 May 2025 at 13:05, H. Peter Anvin <hpa@zytor.com> wrote:
>
> We have finally succeeded in divorcing the Linux UAPI from the general
> kernel headers, but even so, there are a lot of things in the UAPI that
> means it is not possible for an arbitrary libc to use it directly; for
> example "struct termios" is not the glibc "struct termios", but
> redefining it breaks the ioctl numbering unless the ioctl headers are
> changed as well, and so on. However, other libcs want to use the struct
> termios as defined in the kernel, or, more likely, struct termios2.

Honestly, I *really* don't want to go down that rat-hole.

It's going to be full of random project-specific issues, and the
bigger projects - like glibc - wouldn't use the kernel headers anyway,
even with some generic language, because they have their own history,
they deal with lots of other non-Linux platforms, and it's just all
downside for them.

In fact, it's all downside for the kernel too. I do *not* want kernel
headers to be used by other projects, because I simply don't want to
hear about "we do Xyz, so the innocuous uapi header change breaks
Abc". It's all pain, for no gain.

So as far as I'm concerned, the uapi header split has been very
successful - but not because other projects can then use our uapi
headers. No, purely because it helped *kernel* people be more careful
about a certain class of changes, and was a big read flag in that it
made people go "Oh, I can't just change that structure, because it's
exported as an API to user space".

If you _really_ want to do a Metalanguage for these things, and want
to support lots of different namespace issues, several different
languages etc, I have a very practical suggestion: make that
metalanguage have a very strict and traditional syntax. Make it look
like C with the C pre-processor.

There are lots of libraries and tools to parse C, and turn it into
other forms. Making up a new language when we already *have* a good
language is all kinds of silly. Just use the language it already is
in, and take advantage of the fact that there's lots of infrastructure
for that language.

                    Linus
