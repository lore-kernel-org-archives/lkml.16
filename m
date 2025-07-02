Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBFC26A0EB;
	Wed,  2 Jul 2025 12:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751459678; cv=none; b=W2ptykIc890+oJZuyJmNkZSKoRvvIPiVH/hRHNo4VCDH70fz2FRmG6B9S6sJ8TZDT+25/RGWGDM08NFMfBCsFBMoNYf4qZK33soygPR5tVN7EGPgtudO33O6GtW2RvPBAblJSofn3tlf4MrI4irkMzb2BT16qlU+FXXLrC1aQEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751459678; c=relaxed/simple;
	bh=mzTW+TqSUEzk8fmktxy5CGaAVrReWkENvam7sk5L6Wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tiw2iqy5TkxyT64Lm4USxDJaKncA6VGeWoCfsE1hmOaZLPjPe4FyoCom2DTH4s5FQqHS+esFQ8ZBcE6JeoQYMsQnTCunsQi4d+M0fVfVq+jpN6e0R6WhTGsRAgd2uYILFkLrD1z0+JHrTbEJoF9FBkTOG7EcCJcNrxT27v7rpXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAOuONiY; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAOuONiY"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-313dc7be67aso943494a91.0;
        Wed, 02 Jul 2025 05:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751459676; x=1752064476; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzTW+TqSUEzk8fmktxy5CGaAVrReWkENvam7sk5L6Wk=;
        b=ZAOuONiY80yRq9KsGYHEyWS1RG8Nn1mjWMiRtrwPQu8qUnQooEo6p9Slw6y2Fh+/b1
         HDDOpELcgFNSkoS8QYx/dRqqiY59HFAaiDMpYHDVnFJB3gkm3GayE5V/MoMAUPmpKfmT
         mLihmIiqHKyCvDDrEqm+SozfDjUWpXDp51wZGNOhOVhJpFK56NiL+5YhiMklmvFEePB7
         rtQLr3zlKhl3tCaX3Cu6as5tcaJY4fmLffIxNCniP5zXGdPdKOBiZGw9w5ybM+dhcfd2
         fs5Ugn9ZmdaWXJ6DdSrcxOxfyRAVTGHd3RDMR/+fskA4owP+pDqRHww1MVnLPOOeQfvC
         uesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751459676; x=1752064476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzTW+TqSUEzk8fmktxy5CGaAVrReWkENvam7sk5L6Wk=;
        b=B5kSYEzZwqZKzkcRTUxw45fNrEJGhlh37LhrJ9yzZXLiCeBYjvSBWbBqjRrjQ/t62J
         jHJqFuL1tTyZYz81HoT3rQ9dch5zZtxPo3Qjm/0Ko6zq4MonW32nbyZNBNAtHZYtcNU/
         godShxBCMihZsCgjhVJmZVTAs+M34IZIr55FL4xBVvntd0lIXkd7CkRsCb9lWXaIRkdJ
         HdtIsAEhLbp0Nz8/gBWSkg5nCUaHMhyYvIZOSx8DOq5fFZ5Wi8ADII9aAmuyCfxWCPpE
         B5ow25qvB9lWEZJpyKd8k9B6C5BK+pWTk57LFkVfkefziSiqROSb5bmsBsExd6pRJZS5
         zF1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUI622QHPzJT5//AHuMooKNhQn/Y+y50ndmusbwTYgSK+cJ4leW1EP46ANVKpun+Sfl87BOKwOpmczc3ILjErQ=@vger.kernel.org, AJvYcCWDTvtHL6bxldd0bRLtdMi2+LCVDOsW7k7md+BTzXPtWqd4lGnlr6WTeiCVKd1cl61e7m+GfRFGzjeLr4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoC+31QOxWEwYtsksjD5LMo2K7lC467l23agoPoUok3H12J5/3
	mJPYm9nSFDkPKaHcCC4fKnenNkPfdfwzhYRojOgonGm/KhZcc1Dyoh73AYLYo18vXWA618OgY0w
	RzSTlM+DbjXNtqm3zZyWC/UQ/laFukNk=
X-Gm-Gg: ASbGncuOMJVZelm6bSgtrDYlfa1spL2LZywNTPNrrVQBu0BUcINFkRdVMG1qlJUdgD6
	FFkKoxPcsNvUDZ6ST1gVOSmsyITFFKLcrAfQ4X/8yQXMe4XWLhzu1OQxxAqVLfBV+rjbDXplyTe
	DhnozVfg+m2nX4fvsKrvoTpzd9PipsCK+7T/nWiHIA8Hs=
X-Google-Smtp-Source: AGHT+IG9SfscpjxpOW8VWWo+j+txbqwJKQnHHud5dEaZRHtbgncdC7yj8rxKvhncYz2QiCbWHr5XiJn+ENwDcuJiJlw=
X-Received: by 2002:a17:90b:534c:b0:311:a314:c2dd with SMTP id
 98e67ed59e1d1-31a90bdc46fmr1470452a91.4.1751459675919; Wed, 02 Jul 2025
 05:34:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <kyrCsGDYN5QdXPkUe4OxMxU2UzHfJ-vH5z643gA-_KFJIaew0duyMXU0yfTrGN5ZCNaecP8Yu2kIXKXMoWS2lA==@protonmail.internalid>
 <20250701001809.496389-1-fujita.tomonori@gmail.com> <874ivvvvjw.fsf@kernel.org>
 <20250702.180922.1185854079687770335.fujita.tomonori@gmail.com>
In-Reply-To: <20250702.180922.1185854079687770335.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Jul 2025 14:34:23 +0200
X-Gm-Features: Ac12FXyeX_CoN9Gd5KjF3KbaBd5lVxPxjLli5fXfW5MTYFZJjXeqhByvQVxV6mk
Message-ID: <CANiq72kq8EMKkehTQS2odA-AVqxZe=EQs4yj4tQ8CK3zi9e9Pw@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: Add examples with doctest for Delta
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: a.hindborg@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, frederic@kernel.org, gary@garyguo.net, 
	jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org, 
	lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org, 
	tglx@linutronix.de, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 11:09=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> I think that Miguel suggested adding examples but either is fine by me:
>
> https://lore.kernel.org/lkml/CANiq72kiTwpcH6S0XaTEBnLxqyJ6EDVLoZPi9X+MWka=
nK5wq=3Dw@mail.gmail.com/

Ah, if Andreas was talking about the examples in general (not just the
edge cases within each example, which is what I understood in my
previous reply), then we definitely want to have examples in our
documentation. Unit tests serve a different purpose.

It is a balance -- to me, examples should try to be minimal and yet
show all "cases" a user may need to care about, but if other tests
would be useful as tests (e.g. passing `i64::MAX` as input), then
those would be unit tests.

Cheers,
Miguel
