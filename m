Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E204217F36
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744873867; cv=none; b=dFRfdJr6MbtPVD1ey7wRpcMuVV2c+2OxLiLe4AsZVIpjHoSAAr/xKpGgK7PNoGygZw3qE9Ss0uPg0gp741xwmGukJqfsVmsmcwS1rjlA/9lAWOaJJNgNegASc80vCkfAlhJJoPSSz2/jrLH1jyeiDMsIs7ZCperKN3g6cH64SDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744873867; c=relaxed/simple;
	bh=tviSTmff1afpb8klQio9z76Bda9qCmF9rlTxmyn4Jzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DcrWxN2CgdNA0BdCSdrPa/4SEq+OdSZtqZU8Yoq3gnFVmHgwgWoDbMIBb+9Tax0vlfNKRtAc1b8F8irUnyLSDDRuOVZaWBeYsWAhgMLdKzhpAzCE2rzoaSFdnxCDwDRzbU4heKKvtaYsmgbK9TkocoT4+s89pk8FMLkvZTkj+VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=T+nTw/43; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="T+nTw/43"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e6df4507690so429421276.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1744873864; x=1745478664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpU/EXyyDjiU44teDiS87vVaKo5dkE+fJf9jnkZlWjo=;
        b=T+nTw/43HFZIZKt57M+Hjlid9OF24NBH9sHWIbKjGaBIzmC0zY7hNx95MXClsucq9i
         TIwom5tejHtTiXEetvovKMOBpo4w5NT4B08g6wrWJplzU/Q/EHJQQc+wmZY3Y91+P4qt
         WfBX8ZHOWqar6s7eiNKiHMmRaq2dkKWN3F1fahLDPLLCBf0s1OjJUY3AjlNibCLHT6iS
         qPKMjJrVHxSP9odM5G47d2gqOW0p9IHl/jHRkHxoDmXWo9QE6VabwQfV9F94vAWxmUXQ
         Rdg3SJnYUW1grlUF1CBjfbdf9Bha7+Zc7d+3CUw30a/f08WZa60XISRK278wIGyaW+qt
         JuZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744873864; x=1745478664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpU/EXyyDjiU44teDiS87vVaKo5dkE+fJf9jnkZlWjo=;
        b=NawuyRYIHGfsj4ejp1zzwVjq5vWIZIKzVLM0DpauMUu2WfPOyEuls6rGbMzT3lGXsz
         T6wjYetfbdyIavQbkosouFsTHCNj9xt239546mW8wrTm+n1NP9AcAYhzwvkET3GChU1x
         Xg1C8wYGMvAV6wKyy7f8EIl43U8Fm9yLv/hNGOSBV9hkZPvHs5EsdB6pddwq1f7XS6+B
         cA3AkUOd+7hv/9xnkVwjv9FId2yFpYnI/0j/TiQEKWehMgcIXJF173tD3EnTZg6earwU
         nlLTviXZV+rEjhjPUt4JxZIunIkWZrVy3jmkVpyJ5TFZke56FScVC+tULE5JBxXPTf4s
         +uDA==
X-Forwarded-Encrypted: i=1; AJvYcCVC0ZNJshFIhMdJTxozPtVQdzQ9rR7XHSOUYwMq+oolBcXPUw3aZ5KQoTV5GRuL+svsAZViNvHfqKSbW8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvKQeSV7WwIV03uHwUXBanSDBW7joiODFIqfC8E/z1Iw0pXjxF
	nl3ipysGjPFbm1JirSJ3LsJ5tfBr3trGM6FqdgHVhLhqsMz14eVFi7thYf2AN8jWAkmUtPy9Kd6
	BjiNryZf07PK3ctK8rgpakjAShqSUAQuf/DeGCQ==
X-Gm-Gg: ASbGncvD0WdkXOjsdW9t60P5mp7fuzpDMJxRW3Usspk/K9OVPQPyw1eXg4SbRnENRC8
	0AmKDQIvGqWlZpz0YXTIpMneCqB0q8/Zsnp/rGbT4EtIm5ydRrA2xg+6aP/DwgMcV/Otnp1uQtj
	+Vta9VJ7vPPoAcV49MmM8knQ==
X-Google-Smtp-Source: AGHT+IEi920jFsOkCXOITeOeuLFT1lqte36DnI8bIahvpncns/FQ54QuvgAzwiPwHvxcppMuHzxPPOSb6zlSksMEqeA=
X-Received: by 2002:a05:6902:2589:b0:e60:8b26:8c34 with SMTP id
 3f1490d57ef6-e7282a75222mr2272949276.22.1744873864423; Thu, 17 Apr 2025
 00:11:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com> <20250325-rust-analyzer-host-v5-6-385e7f1e1e23@gmail.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-6-385e7f1e1e23@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 17 Apr 2025 02:10:53 -0500
X-Gm-Features: ATxdqUE-Klo-KfOapj4E4gV65oOXgdtjTVe08rFy0gCvLEWTuaEpYGH9CSdhcus
Message-ID: <CALNs47uO9ST7Ev3yG3LPNeJ=0Mdq9pQwO2Jcy624__FpnU=NHA@mail.gmail.com>
Subject: Re: [PATCH v5 06/13] scripts: generate_rust_analyzer.py: add type hints
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
> Python type hints allow static analysis tools like mypy to detect type
> errors during development, improving the developer experience.
>
> Python type hints have been present in the kernel since 2019 at the
> latest; see commit 6ebf5866f2e8 ("kunit: tool: add Python wrappers for
> running KUnit tests").
>
> Add a subclass of `argparse.Namespace` to get type checking on the CLI
> arguments. Move parsing of `cfg` out of `generate_crates` to reduce the
> number of variables in scope with `cfg` in their name. Use a defaultdict
> to avoid `.get("key", [])`.
>
> Run `mypy --strict scripts/generate_rust_analyzer.py --python-version
> 3.8` to verify. Note that `mypy` no longer supports python < 3.8.
>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 166 +++++++++++++++++++++++++-------=
------
>  1 file changed, 109 insertions(+), 57 deletions(-)

> +                {
> +                    crate: vals.lstrip("--cfg").split()
> +                    for crate, vals in map(lambda cfg: cfg.split("=3D", =
1), args.cfgs)
> +                },

Tiny nit only if you wind up touching this again, generators or
comprehension are a bit more canonical than `map` and `filter`

     for crate, _, vals in (cfg.partition("=3D") for cfg in args.cfg)

The rest looks good to me, with or without that

Reviewed-by: Trevor Gross <tmgross@umich.edu>
