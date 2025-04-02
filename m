Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D2242A87;
	Wed,  2 Apr 2025 21:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743628179; cv=none; b=c8FrQ8C5sh+BntOgJgQqrUAnnKHRExRTtV3R0DvfyGL+F0R57E2JZ/1tGoRsDBZQMudDJKq7hze5pLixzV5ROckqdPK6MvWAUk9Dmqamurmde0a62LlBxQRQzOg4PNmkxl/iKtC6voDYLLPGG33ZoZ0WyCIx9/2mQhZbMWoQJKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743628179; c=relaxed/simple;
	bh=pDdg2pUujsuHDByxjg2MMuLuk8ydhxrM9P7TiksmsU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ep4SuLNoIn4a2vbhhNfCTA/FJbdCc5DP12UMw3xkojR1jQG9D7fom6dfaCqZNvuJfk2PlQBgRFoSYaFKKqg8QhPfckHwCfkRjHI7WRs3zqnzEvgUm8LYOK/pcU/w8qg6Z+Qmy6ISYDJ3gBDVS2zOTkwjybQGhiz59bQqEGisMTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYN5a+XL; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYN5a+XL"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bfd4d4c63so1896841fa.2;
        Wed, 02 Apr 2025 14:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743628176; x=1744232976; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDdg2pUujsuHDByxjg2MMuLuk8ydhxrM9P7TiksmsU4=;
        b=TYN5a+XLYkB0PiHhZmVQVXbb/GS0qEJ0wWAqtRW6IyXjweU0xzu2t8IkJ9YOWPzVJA
         L5nBGmj3flpA+18JpSy65nDjd/5dHyrIaQ/zlYEAG/JZ/K733dPOL+OkjGMCmoOZbU+O
         psTIEYm5fDyvI6nF2T3p4sA2V/vv6Edsb8N7kOV77dWYvRi7nKLrb4+w24ju8s8I4zPi
         d59wkYREI1Bx15+wDnZ42ET6pLzKfCyMQ3uL0WN/m+/b1RiA97cdU5aAQIzn0aSNW2zU
         YuGu6e3QuJM/GbCozTkgXtIV1d4IVQESpzQx61N6RjW6Ru4tzA4+VCgN9fqiGzcP/GaQ
         rMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743628176; x=1744232976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pDdg2pUujsuHDByxjg2MMuLuk8ydhxrM9P7TiksmsU4=;
        b=L+TkORIBN4hlQ9cH+X/RT9gMFSP1YQuLGQzQcpnot4cZRFPbOj4y8JW8r+LnP8H+iq
         5LRIXVON0HGLwFah1wvL1Vs0i6uvBCx0Au6avxMNM3FNluNgwW73L60va342FrQUi3+C
         x/DFwMNY0KAkhU1ZABr+YWHQdE3VLCMJhQBSm05P8/nT1822zYbDY5zaLwTLRIzL5rli
         GFfrudFN7JUExzOsm2bqjiLnyWm0QwAJK1s5OTwMCkeZLAR3e28btLrcxI8OezeO4dvj
         3SGlvD54t/t4aPCt1l72fEuqTy1jFDSa8DPXIu6RRyccLFh68eRdKINaQEWjegm0mlzJ
         g+uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuiaOQQ+pf5jaiQtw6tTOr9G1HbDXdtCvh86Fri2PrR2ZLu5eQFedJp8VzKcbOHNwCljgFEa1AZ6daPyHQa1Q=@vger.kernel.org, AJvYcCXZJlZnJUqJCLVHqIXoj+uti1SFB63jn/O5Euphht+y3V2u3l27K9rA/FFCcpkstJJIME11TJdODit6rQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9owQarIU7UuvUpEVvLCGADNRYt2T8PSMOElrsGLJLYioFOY3/
	BGTUGqzAa9YuQvAGHR1UpEQuRmyxaRxQ1mcKJKhPq3COcH1mdzFNxTQVRH2UKm+XGP1aA6VdNqM
	fMwpoLawb+0nsKBqQ1VVsnmabvYE=
X-Gm-Gg: ASbGncttkAxV/VrU2oB+d8o8GvJHPsZ+rpX6EijbMzs24BtFNv1fMGqPfWwvlwfZD5b
	aXESU2yI4g47E6PulrZtX77oYOpyE/fnStJLOMF8SE8k5cnTp6IOV0q6HGf+0+wPXY+4T6xTvdS
	qhb6kFhL8ahzf+gZ9oL6WbgGKGxdKmMGSkKYr3SutA6A==
X-Google-Smtp-Source: AGHT+IElNaah8ZmJP3TMXN4F2GDMv6Ww8Z37dhvkzK+TjpR8HD1UlkHAgeiXaBGrv90H564RXc8F3aY70RS/85mde+I=
X-Received: by 2002:a05:651c:554:b0:30b:f274:d1e2 with SMTP id
 38308e7fff4ca-30eeccf60e9mr31325291fa.1.1743628175418; Wed, 02 Apr 2025
 14:09:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401221205.52381-1-ojeda@kernel.org> <D8VPGBN60E61.1Z48FQW6TL3A@proton.me>
 <CANiq72mdvnHvWbVNQbiXSRxd1xrF+A=v0RdJO74xeY3HyhRmcg@mail.gmail.com>
 <CAJ-ks9nAAcoJoFF+qNPbhsM32kOh9u+LGYUwFN_n9qqudB6YhA@mail.gmail.com>
 <CANiq72k36Tvwbzkg6nRdxB8VNRHLf8QzLeCXZq7sEPewccsWNw@mail.gmail.com>
 <CAJ-ks9nfEg=sdn_-q+xOc+k9mU0pdMuumwRb76LXzE3RcOtg6w@mail.gmail.com> <CANiq72mERwbmXYq-pi=WUAZ_VYGcBVS7tzH4P5zSUVCMcL4-CQ@mail.gmail.com>
In-Reply-To: <CANiq72mERwbmXYq-pi=WUAZ_VYGcBVS7tzH4P5zSUVCMcL4-CQ@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 2 Apr 2025 17:08:58 -0400
X-Gm-Features: AQ5f1JqXiOgjgjbHiCZGQl5CAfHUvDvozUzbxrFGGJDQOEgolwWGp0Hhm3b85BE
Message-ID: <CAJ-ks9kJiCGAkzW9M6q-62kcyvwBea5Zt2EoeeY0T3aN7jK+ng@mail.gmail.com>
Subject: Re: [PATCH] rust: clean Rust 1.86.0 new `clippy::needless_continue` cases
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 4:29=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Apr 2, 2025 at 6:41=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
> >
> > The counterfactual is hard to prove - you don't know what true
> > positives the lint would catch. In my opinion disabling lints is
> > risking throwing the baby out with the bathwater.
>
> It is true that it is not easy to know what we will exactly lose right
> now (apart from what it claims in the docs and its examples), but one
> can easily test enabling it in a couple cycles and we would have some
> data from kernel code.
>
> To be clear, disabling now does not mean forever -- we can reevaluate
> with that data and possible improvements to the lint that happened
> meanwhile (sometimes they get improved or split due to feedback).

My experience in industrial settings is that this happens very rarely.

> By the way, the lint is in "pedantic" in Clippy and disabled by
> default -- so we are "only" disabling w.r.t. what we do nowadays.

> In any case, my main concern is cost: we already require a lot from
> Rust kernel developers, typically more than in C, and while one goal
> of the project is trying to see how far we can go on being strict
> about things like lints, I worry we may overdo it at times.

=F0=9F=91=8D

I don't have any new information to inject into this debate. It's a
judgement call.
