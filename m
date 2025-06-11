Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D841DF965
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749662670; cv=none; b=tvqMWcO/pGix3Jzktx+FThRbayw6xChWy6lfffmN57sT/D7TORBV+57m3lY+anRVLHsFaugzJJ/12TDEYlygkFykzqEIH7krFUyvZ3miZrSv5oF22kF7HclXtnAf3eLqFy2hi/67UZqEU2Byb5EuI/mAvbGkiYI06Un4353ZLzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749662670; c=relaxed/simple;
	bh=UEtaR4QFXoWG5mFkO6pOWfp4vS5WT0e1+nwbfyCMPhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oht7eb/IfOWWF6/mVzNRwk2Thc07K3S9JMEyBN1sL90EBDSZ4C4ERV/OjRBe236h+UKiJNq+NAS+oRJK1zn8011A/JTY+NJh/STXt9v6ODdp55POaI155H1a8cYauYm8+d2hEK9GsrKgQJ1aNiIivH3qwWyZMSfk12RICDN93lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EqcURWLx; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EqcURWLx"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-60d6303a11eso83548eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749662668; x=1750267468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSGkIw7lXPoOOQ6xsmLGULxOdNRYgMzOtzpFjJzQIBE=;
        b=EqcURWLxj/yJOelUagSjzGBEBgnV4yOUJVSwyz01ARl7cu5kntMsD83hSVxbXepXhw
         OSARt3JXqOr7eXqivB2JAzGpDJBzb8tCEKDqMVAKAuhDAp/y+Zy3HiYfnBOk54fxTZoR
         ZoEjhHBXgh/JLy6xkngjWuTZUEb6O4zGvdAH3Kls5k0nrwKBVcljqNkMBHa3B+NSO+a/
         lWsNks70nuOMk6G3zs/frpwkyukUuRBXmz8eKDGMD74blzxWfWSUWZpcbxaQW6+0Bntl
         NTKRFM8Zlb/rLkDIHGcggyXeTnuz6yWdOC4HKDJ2elCL9bcNGU6aDb7A1WZi03/Gyeiy
         ojIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749662668; x=1750267468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DSGkIw7lXPoOOQ6xsmLGULxOdNRYgMzOtzpFjJzQIBE=;
        b=qqHXJOo6vs5CqkN2Jv9Iht8bu9XAnPWdQ1dLJti8jur1zPYiNZedOtQ/2qcHxEkBca
         l26q0eSC+8afzONZmiFuTL2VKxJ53amPKj/0ioeISLYbZL9HYNdgZgn3hoIfommMCju/
         3+kaxSO1yz88VosIrTP4x7jl9DrzKJ/daE/Aoi320wCUS9MJcZ5s1KLZdhSSHa3eW5MG
         ASKpPAoMotwZvfat/7z8bpqWIE6ue+qfBmRJei5my7mBV26fuQXoxXKzAKEZw1Na7lAJ
         yjqq4UWu2aXFE01rHeM5WvFZSb/aSYLN116O3mMBnnuGInT0FlJMp29Oo4JOxmKGBV2v
         pogw==
X-Forwarded-Encrypted: i=1; AJvYcCVK38EllLmQb/JBuyVFnxHXbkbvJG2ZzcB13hwbAG6flO1zDb46/T2WABaKzsocgG/fWQ96twv6tTRnvys=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWYwjQvg6O3wuzhzZ+Q9GhwKWFbLXxhvnJdlC/9D9SmrU50v7P
	7VygMrveZNNXuxwHiixce1QJ8DYbJwV+W2rQtNTopY6cG/ePIuwjpUo3838zrceyGjfPt60os4+
	N8cBJb99fGo/gLmZ5reWM1D7Akb0p6GL10Hd0hmhm
X-Gm-Gg: ASbGncsNc4B70fnK8EPBzi3gEilwvp24OadfY+N+Won4vhucsYM4cq/hSQ3ooaqGg96
	hv6OSzrs12lMK1e+VvlH6Z7J8QCmxazyG7ht1hHszLRXmTl/xXhAx412MrFUbG8Rk2wD7lPNpyG
	N3Y6NUOBueexjfS1we5s4nDZ8RExAm4vHM9Az80Gd1ZlZ+rrVtf55nDMowPwxh/liUVtk20A/1E
	Q==
X-Google-Smtp-Source: AGHT+IHDg8JRnLesFPl1JibUsTLTfDGDn0XZA+uvbAbHEWDtg3wuwb5nGOyTn+G0bLzDeQzprxGqSlM6xctnYJhmBSs=
X-Received: by 2002:a05:6870:170b:b0:29e:6394:fd4a with SMTP id
 586e51a60fabf-2ea96b78087mr2556511fac.2.1749662667786; Wed, 11 Jun 2025
 10:24:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602135231.1615281-1-bqe@google.com> <20250602135231.1615281-4-bqe@google.com>
 <LGWNtyhjCByj6PPHMsGCwo-WBkCCUuCOn_cUuwlwHPhfRZ4TdDR97a3u63ACSIvJQZF2SyAInyX90iMkERX2MK3Up-R6jazWHWhFzTIWah4=@protonmail.com>
In-Reply-To: <LGWNtyhjCByj6PPHMsGCwo-WBkCCUuCOn_cUuwlwHPhfRZ4TdDR97a3u63ACSIvJQZF2SyAInyX90iMkERX2MK3Up-R6jazWHWhFzTIWah4=@protonmail.com>
From: Burak Emir <bqe@google.com>
Date: Wed, 11 Jun 2025 19:24:16 +0200
X-Gm-Features: AX0GCFs7WUVNcSH5-pbXuRcq_xrq1pRsTFNiXrQfUtQYZGhl32F3isfEx9mg9UE
Message-ID: <CACQBu=VX_x97dJcjUUs_=fxYmtitcrNd8NB+5K8Cqu2+9yoXqg@mail.gmail.com>
Subject: Re: [PATCH v11 3/5] rust: add bitmap API.
To: Pekka Ristola <pekkarr@protonmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Carlos LLama <cmllamas@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 11:20=E2=80=AFPM Pekka Ristola <pekkarr@protonmail.c=
om> wrote:
>
> On Monday, June 2nd, 2025 at 16.53, Burak Emir <bqe@google.com> wrote:


[...]
>
> > +    ($cond:expr, $($arg:tt)+) =3D> {
> > +        #[cfg(RUST_BITMAP_HARDENED)]
>
> The config name should be prefixed with `CONFIG_`.
>
> > +        assert!($e, $($arg)*);
>
> `$e` is not defined, it should be `$cond`.
>

Thanks for pointing out the macro and config mistakes around
CONFIG_RUST_BITMAP_HARDENED.
Fixing all these.

I could not get kunit to enable RUST_BITMAP_HARDENED - now I understand why=
!
Also added the missing test now, exercised the code and observed the
fault (though [should_panic] does not seem to work).

Cheers,
- Burak
