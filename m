Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C098A2E628;
	Sun,  9 Feb 2025 16:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739118300; cv=none; b=OZuPJhCcDPCJz08+Pr3vi/eRA4WgexOH+Gy+QoUpPkiu/Ja/vlhGDqitAB+Ew2tO5lMTm/BEs8eVJ9w7Y0O0cpw4rL5OHOhEmUmxe+yaEXLM2Odp0INARz5ECs4il6Zj5tBx0mHuP51qcaolCLeYZ+YkzD2A25xHaACmK3WaJSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739118300; c=relaxed/simple;
	bh=2bQ+tcqH5EtS7S0QEPYtfnUgdgfQq9ccejVh9pcj5BY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a0I0qn2NXNXHc35Kgz3twWqfqI/3RvuikYICTGClGUF4v/5OX4EDfhJcEHZL16wtTb0rgB1bagqfj8ZzjMHMUBFm1WpuNqm4gDxW8DyetJ31Rw9WoSCCcUmkHmNwh1q1hZeoMNx12oy6GTUTSzvEv8UGgN0oLuNwdYxaKHcZ6yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=carRTbK7; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="carRTbK7"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30738a717ffso32746941fa.0;
        Sun, 09 Feb 2025 08:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739118297; x=1739723097; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYePso6o92PJgqPCHEmqrcNvF6yFcuiTY1VevXVmunE=;
        b=carRTbK7rplI65fLf+YCMcowh/PYYHkHlZE8EecwEeKhYh7otg9CG879ZUrNAzrrdP
         TQ/wDEHhkqZg2vPMBSaWjNC44k+S06CzaHWhsdvfQ3UwZJAZYy80j6r/4CWSU/Jym0Zn
         r02ZI/4cEJpCUgTX4CCYFFszhRvCH2mifM7ch5jLfkHS/vabPOUe1i2k0qr2gccUPCS0
         30i8RmqyLTwdqEvkDP9/I4VjHBKdxRaJpFX4wEYLk0c4XYSV33Y5jvdWeyyMhtK7cnbB
         7a/63JmDOgu8XckfM7S573g99vakLTtkDBbPsOnJn+XmSZdGackebiivbjIW+SzC96Pq
         esng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739118297; x=1739723097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYePso6o92PJgqPCHEmqrcNvF6yFcuiTY1VevXVmunE=;
        b=l8HIhsP8J2xumfdoSF691gZZIVy/RHw+NZxrFflGNslzd18GHqlIqm5KltSrp8fJhZ
         VMKvaR8FXUyaDin8pZfmecvdd2jiSykJk+cWkZ/3GQZhV2htnPx4kHrWtV/8qQ4MwOC/
         gIKYZZpX+NoPLeAbamPU7NW6eoNyJT+oD5J4hdjcWr9ipGSqgccN33PQ1Vh7ySWc/siR
         blxgezLyR3hB3bXL2jDBpqCZGWfLoMJg9b7YPF6UkUrEn2rj/T5uXgiEeusFTjU635km
         mMxcq4BdofP3RdUe7cMiSFA3CbFt1sL0KzWhhhVRP/yHR1ZrmnsC8kjNwe86lysGUsgr
         mP0A==
X-Forwarded-Encrypted: i=1; AJvYcCXVVcVHa4IgEuZ80QEcGgOV9e/x9MD6Y9n8y8uZFWYjteMmcaV6f2X2TMQhztfTy/bNQQh/G1qPrSl3TMI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yziql9Ppxt3NJWZAYWybmhXFPGeJgfksNciwKcxJ1g5Wevui4SV
	6BQmBXYudYfHAGsEkkS0JUs/714nrnU0xYTF/7QAcrTD/UqzMxWpb/auRbiAHtZap38PL7/KoQB
	HGqSkhZWk958jhBtrwJpMPUz13lQ=
X-Gm-Gg: ASbGnctXMBtgnUoFCx0kywQLtWHN/4MS6N4tMPXMyDeGb1SdXGdoTEZhSYwFVjiTg5W
	Lyvnc5bvOFmylDKWVeYXCBu2Z5iQrwoBEkjjwlA6ya3HOLSr67efqQLz8QH6JqlLqQ534VeGcrz
	7ZD3+yn36frf+JJ7cGbvTf4MicoQR8A5U=
X-Google-Smtp-Source: AGHT+IEAwmyzg4GLKu1Zjit3HTXBB+JuDSMNFF2IEGVzsM2Cn6NTUYgdrIQS1ZL5lJvcyWh0AKCchD4ny8r1psxzfAg=
X-Received: by 2002:a2e:b8c3:0:b0:300:38ff:f8cd with SMTP id
 38308e7fff4ca-307e580018dmr32652431fa.9.1739118296464; Sun, 09 Feb 2025
 08:24:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209-rust-analyzer-macros-core-dep-v1-1-5ebeb3eb60a9@gmail.com>
In-Reply-To: <20250209-rust-analyzer-macros-core-dep-v1-1-5ebeb3eb60a9@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 9 Feb 2025 11:24:20 -0500
X-Gm-Features: AWEUYZnKl5LuTbNxugCvH_kP3f9lb6FaLQxYlTrLSpLhqes7dfAQHj6XWu-zNL8
Message-ID: <CAJ-ks9nkY7za5zQLv7YkvCeJ1BQ70ZnTTP3Q4VNAmMaG3sGu+Q@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: add missing macros ->
 core dep
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Fiona Behrens <me@kloenk.dev>, Kees Cook <kees@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chayim Refael Friedman <chayimfr@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[-cc Wedson Almeida Filho <wedsonaf@google.com>, retired email]

Actually macros depends on std and proc_macro rather than core.

On Sun, Feb 9, 2025 at 10:29=E2=80=AFAM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> The macros crate has depended on core since its introduction in commit
> 1fbde52bde73 ("rust: add `macros` crate"). This dependency was omitted fr=
om
> commit 8c4555ccc55c ("scripts: add `generate_rust_analyzer.py`") resultin=
g in
> false-positive warnings emitted from rust-analyzer such as:
>
>   [{
>         "resource": "/Users/tamird/src/linux/rust/macros/module.rs",
>         "owner": "_generated_diagnostic_collection_name_#1",
>         "code": {
>                 "value": "non_snake_case",
>                 "target": {
>                         "$mid": 1,
>                         "path": "/rustc/",
>                         "scheme": "https",
>                         "authority": "doc.rust-lang.org",
>                         "query": "search=3Dnon_snake_case"
>                 }
>         },
>         "severity": 4,
>         "message": "Variable `None` should have snake_case name, e.g. `no=
ne`",
>         "source": "rust-analyzer",
>         "startLineNumber": 123,
>         "startColumn": 17,
>         "endLineNumber": 123,
>         "endColumn": 21
>   }]
>
> Add the missing dependency to improve the developer experience.
>
> Fixes: 8c4555ccc55c ("scripts: add `generate_rust_analyzer.py`")
> Suggested-by: Chayim Refael Friedman <chayimfr@gmail.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index aa8ea1a4dbe5..8f99af38dd09 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -75,7 +75,7 @@ def generate_crates(srctree, objtree, sysroot_src, exte=
rnal_src, cfgs):
>      append_crate(
>          "macros",
>          srctree / "rust" / "macros" / "lib.rs",
> -        [],
> +        ["core"],
>          is_proc_macro=3DTrue,
>      )
>
>
> ---
> base-commit: 6273a058383e05465083b535ed9469f2c8a48321
> change-id: 20250209-rust-analyzer-macros-core-dep-0f57868dd19f
>
> Best regards,
> --
> Tamir Duberstein <tamird@gmail.com>
>
