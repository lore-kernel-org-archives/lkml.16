Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC011F91E3
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 03:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745636670; cv=none; b=HqWdyz7oolOgLk4IalDgkD6eIpLJJJ2KmoGv7uFRZz/RyimH/LCBkFMJijnv7GBYdOVXcbyA5FpFipxEA8XxJdKe1QoQFfrsnWGBREfD6Ssdd/DQVE+f8fzScXOvtT+G+Ug3BokhEul1E8PCwgtAQJ7LVN2GNAFVPeaI8iTwC2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745636670; c=relaxed/simple;
	bh=GTJ//8V8E4lhqHArq3UxGsIGl6/VT0BfXlXZWxH9QFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z7MLxky1QRwg+U+4iiGEizBc5L9vXEqcTKMUur9JGnD5Yy0fUo0i2WFwMpC6S+fT14ybi+OhNWFf9ceGsc9KdFvblWqkIJKrFTFMK980TPFrJ9Oa4dmnnIRnRhWb3B/m8jYZS9RaLwx0QELQma+MXFYB1qRzuJ6j7SHmbkEkFC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Jv5YbnPt; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Jv5YbnPt"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso1428366a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745636667; x=1746241467; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oPhqmcKvY9AvewH7vCAuPy8QpwgWU5A4tiUVrwJrrSM=;
        b=Jv5YbnPteJV6OH5iqTLaJgaqAd0+IGWekpdp61mcT20OMITmJBewTyvTzno4Nxz5ND
         2L40xXkRWDba7YAz4jWTMZZamdJyWHzu5+IvO3lm3HkIONO0PE1af+ZgG6jVsN8ZfivW
         C4G0q5/ezdUOCiPfvJabdNYc1rjrC/ZD5cmBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745636667; x=1746241467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPhqmcKvY9AvewH7vCAuPy8QpwgWU5A4tiUVrwJrrSM=;
        b=BDCvR5vHR3A5FkZXph3mtsGZ+6RU8sEv0BHzU7O+3Aaq+j2yJprkJePxnZoAW0sAe+
         4W6XAjQPdM8RI5yl7gOwMfxLoIcJAAdi94rafS6QIbIiK9OJtx9k9DXi+inA4o1RXLmF
         sJDOecfQJTGBIbGQSY7ffu3qz5GX9w0LypX6ZjY+isw+uik8zrFT8YbRVwDVwlrWys3I
         COlUIlQUmP6wkAvWWQEDVsm1etr9mZJ6ma8wf7BA37rEKQlHooA3kX0Iw1y0O7f02Z5J
         lMT1mGYv3kTDdRki55MR4TPv0iNt/yY0dHXARuQWTywOdAmI0O/9GrIiDdVO5Pt4ggb8
         3FlA==
X-Forwarded-Encrypted: i=1; AJvYcCXGpPKWyjybc4q5S+XeA/7VDEpv2eoXqO5WY4+0FhPHmivf+CHVX4x/YMXZdiueRC8YT0ESUr1IBR8KlF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPh0ZQg/M5CxBlBqJb37BVyaCuYbtWMmTz31aBN8OeESOBTaRn
	pLsTbg2f9wdChaMK1BpwRi7wAEGIba0p8kLrD6OdGkJxZDdvSC0p9Uh/oz5V3C7l4FFsQS4vBMq
	uPP8=
X-Gm-Gg: ASbGncvkUrvy0JO4bO/McH1jnLYOhUxbQDkmZght2GmASyV0zsYCWsZID7Htyle/3jR
	F/RC7SFzcTmcfay/OZ1cIIYK1TgXVK2r/MNGYOJSPPiY0x2HTrB0tPBYrUWE3dNSdKAksXui+lr
	1Kq8mTmXn/UyvUhhnABmMC0nwOA6XTio2VpEbKeU39ptwfDhHL/ZGqPuBx1AkKI49ziDiCioqop
	vzp0BxL1l0aS7Om6YZrPE2PSwuc2iIjFwAuKEJLUUmXHGvS6ihvRI6mgJ+Rc3evVp8q9lK3vDd6
	M1wm3DRxXxKvCz0jTIEGG/xsvJ9HjrAFbsLjdoHXCFGirr9ScMWbU6ZrZwQ6SW7IqUdOmxw2vOJ
	uZA+9JM1q+WntvoA=
X-Google-Smtp-Source: AGHT+IGZvgXEtud0rGrJPzyxJ4YeB4nrcln2MdeFVbGW7htNBQgCbAwWfJcGXvUgsIYtqSpdHREguw==
X-Received: by 2002:a05:6402:26c6:b0:5f4:35c7:ff37 with SMTP id 4fb4d7f45d1cf-5f7257976d4mr3990538a12.1.1745636666756;
        Fri, 25 Apr 2025 20:04:26 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f70354654bsm2055469a12.60.2025.04.25.20.04.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 20:04:25 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-acacb8743a7so478013366b.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:04:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnfm0Fsm0FBuXSBbol3SIjJyCsLvhvPsRf2fUTAJZDezs5NVqdD35CluN2nrFiHE4WFX0kGjzOsr4U+TA=@vger.kernel.org
X-Received: by 2002:a17:907:7da3:b0:aca:95eb:12e with SMTP id
 a640c23a62f3a-ace73540c92mr337021266b.24.1745636664671; Fri, 25 Apr 2025
 20:04:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <l7pfaexlj6hs56znw754bwl2spconvhnmbnqxkju5vqxienp4w@h2eocgvgdlip>
 <CAHk-=wjajMJyoTv2KZdpVRoPn0LFZ94Loci37WLVXmMxDbLOjg@mail.gmail.com>
 <ivvkek4ykbdgktx5dimhfr5eniew4esmaz2wjowcggvc7ods4a@mlvoxz5bevqp>
 <CAHk-=wg546GhBGFLWiuUCB7M1b3TuKqMEARCXhCkxXjZ56FMrg@mail.gmail.com>
 <q3thzkbsq6bwur7baoxvxijnlvnobyt6cx4sckonhgdkviwz76@45b6xlzvrtkr>
 <CAHk-=wh09TvgFu3WKaeLu8jAxCmwZa24N7spAXi=jrVGW7X9ZA@mail.gmail.com> <mlsjl7qigswkjvvqg2bheyagebpm2eo66nyysztnrbpjau2czt@pdxzjedm5nqw>
In-Reply-To: <mlsjl7qigswkjvvqg2bheyagebpm2eo66nyysztnrbpjau2czt@pdxzjedm5nqw>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 25 Apr 2025 20:04:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiSXnaqfv0+YkOkJOotWKW6w5oHFB5xU=0yJKUf8ZFb-Q@mail.gmail.com>
X-Gm-Features: ATxdqUHS8znrEYMOPUF1a-wv9B602cVOVCl5sRHxinjIxR42DruVX1W-GKZj2oA
Message-ID: <CAHk-=wiSXnaqfv0+YkOkJOotWKW6w5oHFB5xU=0yJKUf8ZFb-Q@mail.gmail.com>
Subject: Re: [GIT PULL] bcachefs fixes for 6.15-rc4
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-bcachefs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Apr 2025 at 20:00, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> No, what I wrote is exactly how CI lookups work with the dcache. Go have
> a look.

Kent, I literally wrote most of that code, and you are claiming that
the CI case is trying to be the fast case.

Not so. Get a clue. The CI case is the "nobody cares" case. It goes
off and does nasty stuff. It's very much designed to *not* affect the
sane case.

The things you complain about may be exactly those things. You just
don't understand the design.

             Linus
