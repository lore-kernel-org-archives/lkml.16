Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F105F1E570B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 09:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750325569; cv=none; b=EYiKFE+T6bwZFTcMmEGrQ2hnj4fGHiR55/JsdCoCbvbgR6pbbSU2qkOfW/A5c+YBBF3Fi+ojaozKzQrn/K7FeNjpaPlnFzsMIxmEXYoTmZBeAGN54L/HodI38+SQaA7ZLSPKaZZONWev19uO6NP7Wha3Jh3EoMcQ1bXgTh9zvUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750325569; c=relaxed/simple;
	bh=BBsKzlD1HaZNFQ00OJNqMQlFuwwlB6f+BWhKJ6p9TTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EAc0I95Qd8x9R0TnDCso9hsMZC7fJxvVMflTJEMe+PokMozjVXb/NOb8/TwM2Oeme2v6pK2y5Ti169wOTmy1CBqxGoEpMGjtNdCG7sxdcxhHvdFN+9s0EWw4MH6VsSE03uJicaMhMzQr8qFod/vyl1eOfONM5mM0o4+aM5I8VUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j20PemO6; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j20PemO6"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2e8f84653c3so136981fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 02:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750325567; x=1750930367; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBsKzlD1HaZNFQ00OJNqMQlFuwwlB6f+BWhKJ6p9TTk=;
        b=j20PemO6Ck2aHkEhpi2XGorzQRyzxjzvtWwggCK56VH2ozGLluZNiVTOW/6+zkcPzn
         ASKTsedtifv6CyQkep4HOskS0l80qziraokBo14HZb0JAcnvd23+vFQe94F+D+rw3w2v
         NHqgmg84wDHFz2bBecanPOjajeHngd1iI5LH8sD4+oNdctuRAV8iGBOji+nr373ShxTD
         sWLasDb2A4kzdUTvbgQ80NbiAFNpx1hUt5CavY2Con6L0JidaSwLwdHSgqe1v3cRdepm
         W8i3uPZSnJxASif+eDWB6qgt1q50dWlkjBuEbb69hNOfdevjCQNSczGvr+N1CWshzJfz
         9Qbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750325567; x=1750930367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBsKzlD1HaZNFQ00OJNqMQlFuwwlB6f+BWhKJ6p9TTk=;
        b=vX0h2mOg9shB7Cz+ixOjTE/vNqTaeTikxGS9RqtscEMle3bofN5W8jKqZ7vCr454TS
         YA7cKpt2vx6MCW1s70s7JmbY4BvkSRnM/Vh4ztRv7tbARUggey8ZBkBQERy18fXx/kfR
         2DbVmipOiNZTHJAJ4nyrwo7vIFtzancNxXenWqJAQeYc2+KiyFTLBmB3P4wsXRvRYchd
         4hMunbuAXojuDBiWh2jXu8IQl6QwxOiln3f6EGAmaX6GBpAazANm6IoKf7/gOG2T01RG
         mbeBbmcvuHciiz5lKG7wDER4iyuqplvjesCT1ZgDtkTAwoiXKtBjFK9ukFbOKAqT3gZy
         Yh5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVe+UMl6Na+ImvSpWrDo3UxP7UMdggLsRj0UO4ZxHZ9tg8MrBno6DQJo3B9ILgeIJ7XxeGSCYw2gcTD5WQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsN3R3Rba9BLZMJKmVDvm3zALO8ppZjzDsgJhdv4ug8d/ruadd
	z7RaDQMiIzpYOzoaFOaVGAD36CLwTrwDHCuCyi6TrGiTNtNFww9C7kW+46v12t7spGqhcjQdMYg
	vg4KCONP7VWRX5VsXxGNdZDzZAs3oRZ927JsDeo1U
X-Gm-Gg: ASbGncuP6xJnKXMP0JvrK13DkgAg/5LFCO6MIaAgZonyA7ny6VbwlJCj2zbTH/oVOyd
	OpeZI8KeNSGBcVcWs8Nl/qu/p/2HE/FL6l+h3yWTkdvM92n/UkBQN2nHht/x7vUKnJLq7HZ20I6
	uNhChcIGf01Sw8pj8t/gWN+ai2Xbl0W9dZulNDDwJDySLG0DNg9dSJHhjQZn/7MAqdnR4ny0gBU
	A==
X-Google-Smtp-Source: AGHT+IFEvooeG4VcErFMLHhwcnUP1Kg+jzxVyPLvzkXLE8yIClgj+ttPBoQQQPiG07i+rui2fBgT/Bw6DQkuafbQY+4=
X-Received: by 2002:a05:6870:8887:b0:2ea:923e:e753 with SMTP id
 586e51a60fabf-2eaf0837092mr11661006fac.22.1750325566775; Thu, 19 Jun 2025
 02:32:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611194840.877308-1-bqe@google.com> <20250611194840.877308-4-bqe@google.com>
 <CAH5fLgi1GBqDHvMh30fbxVUjnTETLXthpK6eGLJA0Vh_TZRnsQ@mail.gmail.com>
 <CACQBu=W4PziG3Fsnzqu_wu-vgBThktD7FcEJ-vOhOMhNDz8h3g@mail.gmail.com> <CANiq72kuRLANX=W7xUo1Jv7euH2eAhwHbx-CF4_4Nj=e9e1Weg@mail.gmail.com>
In-Reply-To: <CANiq72kuRLANX=W7xUo1Jv7euH2eAhwHbx-CF4_4Nj=e9e1Weg@mail.gmail.com>
From: Burak Emir <bqe@google.com>
Date: Thu, 19 Jun 2025 11:32:35 +0200
X-Gm-Features: Ac12FXzMiLrysaexKIHEsv3OlSgqtWrN4f4wQ24ucSR8dePMWMPttaiZ4o50cC0
Message-ID: <CACQBu=VyU3vPLaimFZWPVkLpSHgRNFJgQP1khhfq=a1UpU74aA@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] rust: add bitmap API.
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Kees Cook <kees@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	Carlos LLama <cmllamas@google.com>, Pekka Ristola <pekkarr@protonmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 11:53=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Jun 12, 2025 at 10:47=E2=80=AFAM Burak Emir <bqe@google.com> wrot=
e:
> >
> > True, I observed the panic but the test is erroneously marked as failin=
g.
> > I have commented it out and added TODO to enable it once
> > [should_panic] is supported.
>
> No, please do not use `unwrap()`.
>
> Instead, tests are supposed to be written as you would normally write
> kernel code as much as possible, i.e. fallible.
>
> We also have now support for tests that return `-> Result`, so you can
> e.g. use the `?` operator.

Point taken about unwrap(), I will update all unit tests to return a result=
.

The lack for [should_panic] support remains
(CONFIG_RUST_BITMAP_HARDENED is intended to produce a panic which
would be nice to test), so I can only comment out the test.

Thanks,
Burak
