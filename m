Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64808635B;
	Mon, 31 Mar 2025 18:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447162; cv=none; b=jVqfzbumNYjDcHp3hdvqv5AO+UTdlqTmHNMO0ueHQ/zZEhho9U7GhzgGYPVOv1uU/VAyMyHOkyzmhpZB+MRerWAfTGjINq04al0mKMTUPoHxLcsZTGNifGm1ctBXJWEAOtWYrFJIRKkvOiP/i+IMAVgBi8XX5Y8gMxkIfqUDiI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447162; c=relaxed/simple;
	bh=drfaP2yE98Rco29b/ny5O2lcVF6+W5Bnqs+feOf0X/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EAdFxoWbwMgiK5m3eL8Gpkm/UOo98wnxMvXbLDkI5+f0qSPcRy5LHZHvgwQK8Jf+mTGE/+Qn9bE59FmbaM+7q/+Jt8C6vcTNz9ylSV/06uk+nXoY/xfL8JyK7YuKl6kJpPmebTdW+MG946smBK9Bf5dyk2rtd+XDtXEE8P7/bZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8BRyF5P; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8BRyF5P"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223f7b10cbbso11670035ad.3;
        Mon, 31 Mar 2025 11:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743447160; x=1744051960; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzZeJysI7elY14cefHBV0630yeRDEoEFnaTTGe6JujU=;
        b=m8BRyF5PIsBJofOiC6Y0pBdaEU7ls5KBDD6OEPNv85xnr1hU7Sg+Bx/YHHXa5gu0RH
         ijkPr7SF9xOlz+dl8MdF1XO1Zk9S9VHh0URKWpNUq+UGxkpqBjPHDNd+Ox6nshyVUkpB
         KIdtMj2Tmk3mwM3u02D3a5yIks24+u1N0mcTfmK8xE5RH3tiXKeqgaGjXVcNu7eDzK/4
         I94D/bDHHkczprLczVcpntltzK6fSTUL7V+viag/lM2rcHDS45VBYus8NuE2LAxZO3aQ
         FbuYvzRkZQ/9tgNWYAer08RV1PGjSeu06+DUupaiw+85r5Il5eutVw+vx1yy1ckC4nqu
         sqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743447160; x=1744051960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GzZeJysI7elY14cefHBV0630yeRDEoEFnaTTGe6JujU=;
        b=FMNHNcToTNCltGBt0oz5TdTVbl3P9RqlCt3/+cQmjr9jIVLUqSrchciY1Wd4s7Ne8a
         3HyNKx2SIwu680MxHCBa3xN5+R6D/Aro5/MgfzCQFptobHmhWZiwewEkhPxfBz0bCQcE
         2shqZ3853jaOJp3/enyBo7HsslMTwsO02+r1fGuWMquvDpaZxM3txFmUsUlzJVB/W08P
         wvdU8lZw5MwhDiBeBs0Zr9Bc1j2BvcuX7TVNU0KXmyxgoSwwXH4w84QoTXIzHx1568Ts
         sxKaXF/HWqD1LXwfLKzzDSdCdOlliiU5HdaBTmLNqqdZPuRDco97sl3CE8ncY+8X2qmf
         a3EA==
X-Forwarded-Encrypted: i=1; AJvYcCUYdJf0HNL1Y2Ff4H3Dp1mbCCwxBQpDwiF52lOxaGzSurgLWTM3SWaWYQZIlfiPHDCZWfSlb/0/DcyWE8I=@vger.kernel.org, AJvYcCWSBs+ZNdf9fyE4rgnHA8XU0EFkZNkcy2BkX28ZWjoAi5Sd/XAsyuwVVLM/3Xg1VjHEkn7fByYbp1radwOOxhY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb3VTf3Y6q1zP3jgTdGauoEZqH0Y5OF/bWdRhVcwgIGSOuj6X+
	C/3TZHN+uSITKlr2aoUYrjX7Rj2qaFID1Eef4QQ4ElXbFUlnzbOHpCVbBskEe46Uaf1K6u2nKby
	glFOdNRPCaEnE1/SjgUVsyUMSiqo=
X-Gm-Gg: ASbGncuEQplCcooFgkYq0BLrzrdNoeFELN9SyoaN3dwAu60G8S0uqssLAwuRzstOyPR
	BYnLW7rG6QpP9uOcFOw9WnlNUJoJvroIf+y0LfX1CI6/GnnyIpz9z35ZZ4ct2JdNIIlKvThApyN
	EuxVkO0x/sKDBtRi9iZ/xfWhSMhA==
X-Google-Smtp-Source: AGHT+IE2Hzqjn1wZsG8WMjIPZkN86wCbBmOKgSfsBufV5hXuNCms6bbYyYzTIEoPZRDM3asooEkFXsY/Uzbx6gF26AI=
X-Received: by 2002:a17:903:41d0:b0:224:88c:9255 with SMTP id
 d9443c01a7336-2292f949195mr65692125ad.3.1743447159886; Mon, 31 Mar 2025
 11:52:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327161617.117748-1-bqe@google.com> <Z-rFPhrNTB8t5xTF@thinkpad>
In-Reply-To: <Z-rFPhrNTB8t5xTF@thinkpad>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Mar 2025 20:52:26 +0200
X-Gm-Features: AQ5f1JpLXWuXf1PUorNOb4IdBwcnHekI9O3T_4z-8lZajxumI29YOGcJZ3rNN7E
Message-ID: <CANiq72kSVHsgZGULhy+t4XyD2xGAKdiyKshC1VgKjTFoHUbMNg@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] rust: adds Bitmap API, ID pool and bindings
To: Yury Norov <yury.norov@gmail.com>
Cc: Burak Emir <bqe@google.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 6:39=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
>
> I didn't find any discussions related to the bit_set in kernel context.
> Is it possible to use it in kernel? If not, can you mention that in commi=
t

In principle, from a very quick look, yes, it supports `no_std` and
should be very easy to vendor since they don't have dependencies (i.e.
`bit_set` and `bit_vec`).

> message? If yes, I think you should consider to use internal language
> tools.

Hmm... if by "internal language tools" you mean a normal library (like
that one you mention), then yeah, they can be considered.

In general, we have been prudent about using third-party libraries so
far, but it is possible if it is the right choice -- please see:

    https://rust-for-linux.com/third-party-crates#suitability-of-a-crate

So if everyone agrees that or another library would be the best fit
than mimicking or using the C side (performance-wise,
maintainability-wise, etc.), then I am happy to integrate it.

> I encourage you to implement the tests as normal kernel tests - in
> source files that may be enabled in config. I can't insist on that,
> and will not block the series because of lack of benchmarks and
> tests written in a traditional way.
>
> But to me, scattered wrongly formatted commented-out in-place way of
> writing tests is something fundamentally wrong. Not mentioning that
> it bloats source files, making them harder to read.

I don't think documentation makes things harder to read; quite the
opposite -- if the docs are good.

But, yeah, if it is an actual test that is not suitable as an example,
then it should be a separate test (whether as a `#[test]` one, if that
works already for this use case, or as a sample module otherwise).

Thanks!

Cheers,
Miguel
