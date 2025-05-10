Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2A91DF261
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 14:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746888682; cv=none; b=PRLQaJF4WIiQHrzw4um1G6UnBXd7rtz8TlAF1jBlYYp3b2wxDKUQNMKGu1qAljb3Vv3BcMDNwLwt734iIDiWHI01SiVcqR63Og3BEOzTeW6uXLMcRTsdQTTcv63Dmz22AOMgxb7t30nU42WiMmu9cIu2J6ZztBviGxI5Wh0ROl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746888682; c=relaxed/simple;
	bh=zsELSqRjGwpwYDGEAo1SYrGJoM/k0KSED4jVlGtRMAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jp+0+uW/89GXDJUFH8fov4XNCBa7osYM0fb4C3T8o+3z9JqkdJltaf4tMh89jiEaPCiDjO9ruF5RVHhWkdanVAQfjanmVOc+amv95Js/cTzxBGZCRrivA+83QOgnEUHZ1HXl2VlVbFGmKGEkvoeIGtODEZP49LaSuIm1o6dx2g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4ic0R1y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4ic0R1y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75A4C4CEEF
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 14:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746888680;
	bh=zsELSqRjGwpwYDGEAo1SYrGJoM/k0KSED4jVlGtRMAs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E4ic0R1yyK2r3oBsRPCIYxLhMJLSFseZ5yKdr2JKZxzxnzRhDKnjjvTXxjkXn6nt6
	 LLHZIvSoAalIlJ+aHGsZa0rXKO9SjxkMeMHqVFoMKV83rJISs53DnQEpbbSavKCy1B
	 4Ee7Qeu7EmlrHO6VPk2vMSNf2iYjJaiJ2ndfUuzXVyQAEYLdkNm58fTNFFMbmN0NqF
	 Op5CHWP1X7cvf/IkROLJyz1Waib/FMChy+4tt6wFCIqHRw7RtiFWVf0EcsiGAgF5yo
	 Cxg6xIsdXQDWAW1Q36CFZNJdFNYbY0LO8BF6eYNmWP7tD+pEnG55BGcjI85r/i6tI+
	 my1eTRXjOCMAw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3104ddb8051so31257881fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 07:51:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsqs31xHOrobcmAXJWG9jEINmyZe/Mb1CWJd6P8qVq6dkzLb8yHmqtQK03N1XOMoO7pzCKe4OFt5IoYcw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQHziHGfDRo/mW+JYhj/6vlqAGwlvNnoPSJ2dcfvWe4VoGzfo3
	8YKXJwOg0cTGh7XdCqgVxa9DSR+CQrgGEgiwWA+UO7etWuJf7bTfp4WaXk37UDAt7eHz/4o6e22
	YlgHP4OHGlr1PCgMf52AoyqIs0Do=
X-Google-Smtp-Source: AGHT+IFCwZSRdn26ua1mADuX2FLvZpSYy/nPAqD9VqLEUNl7tR+K1OfZnZXEbtVHGH/n+xlOJuIrvqqHRdo5HgpJRSw=
X-Received: by 2002:a05:651c:a11:b0:30b:efa5:69a8 with SMTP id
 38308e7fff4ca-326c463040cmr29581801fa.36.1746888679157; Sat, 10 May 2025
 07:51:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506154532.1281909-5-ardb+git@google.com> <20250506154532.1281909-7-ardb+git@google.com>
 <20250510145449.4117af82@pumpkin>
In-Reply-To: <20250510145449.4117af82@pumpkin>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 10 May 2025 16:51:07 +0200
X-Gmail-Original-Message-ID: <CAMj1kXESAk4ZT_HAFaWQJLmyo9CyFYbRsToEXagPygBpFhDZiw@mail.gmail.com>
X-Gm-Features: AX0GCFuDYk0wIKsB8w8fCdMgnjBRCjP7Um94zfPZ8VFPRS-ex_v1FteLOhbr35A
Message-ID: <CAMj1kXESAk4ZT_HAFaWQJLmyo9CyFYbRsToEXagPygBpFhDZiw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] x86/boot: Set __pgtable_l5_enabled correctly
 before calling into C code
To: David Laight <david.laight.linux@gmail.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 May 2025 at 15:54, David Laight <david.laight.linux@gmail.com> wrote:
>
> On Tue,  6 May 2025 17:45:35 +0200
> Ard Biesheuvel <ardb+git@google.com> wrote:
>
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Ensure that __pgtable_l5_enabled() is set to its permanent value before
> > calling into any C code that may manipulate page tables or reference any
> > global variable or object that may be dimensioned differently based on
> > whether 5-level paging is in use.
> ...
> >  #ifdef CONFIG_X86_5LEVEL
> > -/* __pgtable_l5_enabled needs to be in .data to avoid being cleared along with .bss */
> > -unsigned int __section(".data") __pgtable_l5_enabled;
> > +unsigned int __pgtable_l5_enabled = 1;
> > +
> > +/* These need to be in .data to avoid being cleared along with .bss */
> >  unsigned int __section(".data") pgdir_shift = 39;
> >  unsigned int __section(".data") ptrs_per_p4d = 1;
>
> Is that comment (and the section assignment) relevant given that they
> are initialised non-zero?
>

Excellent point - no, they are not.

> I'd guess that __pgtable_l5_enabled was getting set before .bss was cleared?
>

Yes.
