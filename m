Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720332EB1D;
	Mon, 12 May 2025 13:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747057685; cv=none; b=Ab6u087UA0O9L/7geeBbaV34IzzReB1bxyH4oYJcAkqxa+Vdyi/YEH3oABMIY3deps9CR4cnb54KNWBlmXP7sypfxAlmapq44tPDFa+UhRBcBok5EfNd0YxTpnI4tsBkpghXf59a/qkV25Gkf3JMmRSdrCQdqSaIlKsUeKqnwuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747057685; c=relaxed/simple;
	bh=BHpueVAwfm3FWQvl4EsygXnay/5mtTUqUqaYBsW2JyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kNpEGQrGZtbsYwQqOpvf73cANIWxGsRYkBEdfkZigTaAOf5dXOb1csE2bLaD9ORWRFxuY9ZKr3yyi8QXnhQQEzfUz0z2e6vYYpiDQHUlU0er25K6Ur/U5CeO5gmA09gSbmvjL/xI5Vy3tXsJ69OfNVpsFCnI4Dsf7j1wC1GWRgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4xfudJ/; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4xfudJ/"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-af5499ca131so363784a12.3;
        Mon, 12 May 2025 06:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747057684; x=1747662484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1fMuIe/7ONMMCdQeIFnVXYkOelK3PlNZeZ2qTQVxIk=;
        b=a4xfudJ/s9mVIZaL9l12nxjr/ivn/qKigikuGFWoj2hrWsq300DXF9wHSaWf9mIarp
         yG6ps6qgh+M+vmztXRs+shNsNXGeVe5k6umQ666Fmv8Le9tliGiWYAYG4LjDxamWSoO0
         rx8vqrQ0gkYAkZ/rTvvmcEpwbhS8y30xqLVdFjrmeIDcj1nN1dYX8envogbq9npMUlpP
         V8t2NVFZPrkpwr4nJqcssC24DzrBV4KWD7pTtKUFepy6HK2M+Dk8xMQI9poE5wReU7iz
         NJWH9MKPgqmvPBk7KQpi+vxHmucNGKcco5lf/JnbSOmKtWxE+oIP/CC+3vwCghVz1T2J
         RpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747057684; x=1747662484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1fMuIe/7ONMMCdQeIFnVXYkOelK3PlNZeZ2qTQVxIk=;
        b=i+o4HbAeH8Aw6AE9hUeOWXwUMgwaA9K7JotLhm8uYZVNFa4iRjKhsbfo3VfFtdMJpG
         fhaPkySmlgC68go/H/If/LyMWA9v/OHLxjZofb61X10nJmhzSBRCjZbUGzvJMoZEQGth
         ZomfkucfG52dVdQw9KleV8jmSzDYienouQFo8beAcy/hYmE9zDuvC7XeTp1gYYoiIigU
         VcOM+2fxARJYqPrrgYtnaQe5IT8YBcoN17YY6VEnJQxGqmyH6hVh0ZF+HxvaL5WJOCeY
         iiPp6qSiMIXo3W5VnFwYEQodJlOxyRUK3msthjhzSmcqTcTGDLuO1Tx1PbZDDL2Dl9vy
         TFiw==
X-Forwarded-Encrypted: i=1; AJvYcCUWbBJjMeAUs5rQWOLsAkbuqp0Udy23e51SKrXl4NEhiw+au2JGeUAWda1PJTDy3GuZPWFFxik7ayOtpMd9@vger.kernel.org, AJvYcCWEiH3+Nt0ST/Pv66Pmw6QbDYGOx2QuAFv5VuLWz73QjAd94w7ItlxO8WxMW1AOV6mwLYAWOTNAr+0=@vger.kernel.org, AJvYcCXo/bJGjGocoZoxGCZXNR4F1u/SAWlNRGMy20Bzxes6lwOEYZ7M36Zn4Mk5sed1OXxHvkYgkKnH9P6O3i6y3bI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/DFZ12EaguY5ZrgVLScpe2AyvWJVPlBgUni5/dXKOwJv0lWH1
	6rvovstjDHqqFfNRBWsZafkiBp8hiu500HlDYmBjp0k763+pVK1lP2fbplM/GBdI7HbwvNflW1y
	f1EsA3xJjug8EZWfOVaDXsiNLbN8=
X-Gm-Gg: ASbGncunyB+87/NdFxrRbW8sIGnQES61bNOSjsG2fXizgqQBfd4B81ZesxZi/KIIDGH
	UKyCJj9yN+kjGTT+RDYGhQlZ2Neb8gV7xzlUWNi9HQuxqaxdOTRAu9tjMtnP6zhiTwMQn7irH3c
	HjV5OZkTFAKsaG7ovcUWD7hMQh0Y9EX0jU
X-Google-Smtp-Source: AGHT+IFdgJb6WFnCwQ1ckUq6mAtXOgztfx5HsquGECmUxd5me5EhOzT9KO3/c+Lqq8UBo7wF7VCfW7Fkeyh9no0X8W8=
X-Received: by 2002:a17:902:ec86:b0:224:1212:7da1 with SMTP id
 d9443c01a7336-22fc918d174mr63653765ad.13.1747057683677; Mon, 12 May 2025
 06:48:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416112454.2503872-1-ojeda@kernel.org>
In-Reply-To: <20250416112454.2503872-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 May 2025 15:47:51 +0200
X-Gm-Features: AX0GCFssLceZsQg3tu5ORZXSomdeXScaEYnRsjvkmAEYjZ92Z9K6uKADlNuukfc
Message-ID: <CANiq72kEgg2ATEdtVPLX5shUcVJdJKuftt6qMtA-t5C-ALpx6A@mail.gmail.com>
Subject: Re: [PATCH] docs: rust: explain that `///` vs. `//` applies to
 private items too
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 1:25=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Sometimes kernel developers use `//` for documenting private items,
> since those do not get rendered at the moment.
>
> That is reasonable, but the intention behind `///` (and `//!`) vs. `//`
> is to convey the distinction between documentation and other kinds of
> comments, such as implementation details or TODOs.
>
> It also increases consistency with the public items and thus e.g. allows
> to change visibility of an item with less changed involved.
>
> It is not just useful for human readers, but also tooling. For instance,
> we may want to eventually generate documentation for private items
> (perhaps as a toggle in the HTML UI). On top of that, `rustdoc` lints
> as usual for those, too, so we may want to do it even if we do not use
> the result.
>
> Thus document this explicitly.
>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72n_C7exSOMe5yf-7jKKnhS=
Cv+a9QcD=3DOE2B_Q2UFBL3Xg@mail.gmail.com/
> Link: https://github.com/Rust-for-Linux/linux/issues/1157
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks everyone!

    [ Fixed typo. - Miguel ]

Cheers,
Miguel
