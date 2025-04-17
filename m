Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBE319F133
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744874736; cv=none; b=oC27H1hfy//7fbjPbJNbIZGPdvZ7Bq0jz5gGsq7trUIFDTcZvdIjkvnEpNvh9h7+H0zaAIQnOGwPlgKF1rs5exEp6lSnvAXEPi3zi9b7roJbjzIVxDdsE8/zYJhcCRgEGaKeulXmyTIX6Zh+foNTG58LPTpn/fthhEzjh31ZQiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744874736; c=relaxed/simple;
	bh=CAvDAZwfGLBI/HItNzkiNR1FoMJ30j2kia+vuCfBV2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cn7wO8NQ+yQeJbLhEqz9XhjAl6HCDdgzo2GV8pgUE59f3BXZXLUzpyhgHrjrDtReDusIDXc9eGP7NjdGQnin1wjLaL3Zj/fkats8BuC3k1z8W0HVv7d7jqjCuoHelxZW3fFxt3u1lynCBrd/2FZk04l2qAQ9V0RIRgbLW99NRGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=M7cFYtq9; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="M7cFYtq9"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e643f0933afso1310477276.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1744874732; x=1745479532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCSw/es2iR8/yNVw4J5gJ8YTwX58btUZLp0G7enr38c=;
        b=M7cFYtq99BiMTuc3lZQh8R3w7URZBjK19DcAfDJ9GBrlDoTyJc7OeLOX6GqbGDl4to
         uE+Za1l1ViEZbfNlBqTIzrefp/0TjXbUmGobLBXRWViFa03xcAjfhHDKP2sNwSlOeayN
         pNrbrf5PvfoYfmfdpzj2DUtN1Eh0Dv3xQ9QUD8+ZvLa+IvLjNJAjdubQtMvUEgQnw2Mu
         h7TMf9h2tNX0jT+35UjKjReAYKg3P4InchqgVx4f7i0QEjvBTh1YXzv203BNWxB27BOi
         ovEAraPbQztyNmvmHW5ZxZSHFvtx8irEWYf/QiJ8pbmj1IBdDPPPhqBLtHoADm11IADP
         TD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744874732; x=1745479532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCSw/es2iR8/yNVw4J5gJ8YTwX58btUZLp0G7enr38c=;
        b=BXPrjif9Kck3vQDF0u2ckklUTBe9XBL06wGsGuKl0/FCo0P71C/GoBU9YakmnnMfht
         TpKLjQwClJzad0SLlt4v3g14zyMtmJ/ojBeF8bBS5q1/js0cMDb2YFT9Ft57BpfRw/Gd
         NUiYlVSmhcEKi3w6EGGiXXO9nRIhQnERMgbIZRgZAmPbT9831tMCpZ8b+yo48TnxYKUI
         yEtHPzj0ehhWwV14GQa16MxXxy3V/D8C7hTTaCahtnTyn8l1OoZ/lvTrxN4X5Yy6lVFO
         bHWhetLyPob+qAGs1gFTEV2nltg2RSgZir97vRW/Fz/Lokyg94idsGYa9/Fw3Z8h9fLC
         qxTg==
X-Forwarded-Encrypted: i=1; AJvYcCWycZWhcsBl5WK70E606z3ZDQxS62xW1wy2+5AlqiSy0GO4phSpne65FRwVKA3n5sN93kWHrZ35uHPR144=@vger.kernel.org
X-Gm-Message-State: AOJu0YzERe/GMUPZ7Gpbzlwfcm45X+LlY8Rp3MLkBjgP6XR3d60RHgTn
	STs79XcVWqoGplufc033xHQ5auc3a6xKIUHzI1azmTQd7KB5+ZnlxUanwqFQiGGCea7bHhWz2fq
	QPoMVRErpn/wdLUVg56crXVK9mCE7bYqkieGe4g==
X-Gm-Gg: ASbGncsjxFK5DMVOLHESq/5oYdp9wOhzTMueggv0DAhKriPmeFF/1idcoJ7md7+XNFs
	VurRxsFNGSru6AKpDYyH8z6EIV1mUXVsNN3dnt9XABR5d+f0wDhVk/7M+WNTa8f5Tg3lueTPsjq
	VgS5/9bKBWr0SnbPmJz2zLKGx+Pd+eb4oC
X-Google-Smtp-Source: AGHT+IE+p2PW3ydbONwQRu4rSA2EsOCb+RSOH2X4Csb3G9CdLF2TBoaq+QSeCw64kVxVVt90nJDanY3G9zyLsMtv34M=
X-Received: by 2002:a05:6902:240b:b0:e6b:723f:bcf with SMTP id
 3f1490d57ef6-e7282a769b0mr2670551276.21.1744874732296; Thu, 17 Apr 2025
 00:25:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com> <20250325-rust-analyzer-host-v5-12-385e7f1e1e23@gmail.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-12-385e7f1e1e23@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 17 Apr 2025 02:25:21 -0500
X-Gm-Features: ATxdqUGfByujakoDWsaF_GHACD1pGmqrbiR7ZbZczWOGW_x4V9XFFfDIb1tbrFk
Message-ID: <CALNs47sy7fcQoOaxQ0moyRt5TJOi4VWc8AxXHzPgouccPP4N7A@mail.gmail.com>
Subject: Re: [PATCH v5 12/13] scripts: generate_rust_analyzer.py: define scripts
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 3:07=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Generate rust-project.json entries for scripts written in Rust. This is
> possible now that we have a definition for `std` built for the host.
>
> Use `str::rstrip` for consistency.
>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Fiona Behrens <me@kloenk.dev>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

> +    with open(scripts / "Makefile") as f:
> +        makefile =3D f.read()

Since we are using pathlib, this can be `makefile =3D (scripts /
"Makefile").open().read()`

> +    for path in scripts.glob("*.rs"):
> +        name =3D path.name.rstrip(".rs")

`stem` should provide the file name without extension, so

    name =3D path.stem

> @@ -267,7 +281,7 @@ def generate_crates(
>      for folder in extra_dirs:
>          for path in folder.rglob("*.rs"):
>              logging.info("Checking %s", path)
> -            name =3D path.name.replace(".rs", "")
> +            name =3D path.name.rstrip(".rs")

The above applies here too.

A couple of optional nits if you resend but nothing to block on:

Reviewed-by: Trevor Gross <tmgross@umich.edu>
