Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600731119A;
	Sun,  9 Feb 2025 17:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739122516; cv=none; b=rk3tNmAqesIG0m0U0fhZJnFUrFbOjurTmvc2pmFC9ywl79x1JxjUrBDeg9w3RX6jtt2X2lpdDiGx4ItI9QYB6BZ3TUdPiBqRDT578O6t2qVTHX2CIrTGtF8MvlTk5HCFyoHoqjC5AKuTDRYcQ7BcHi9RBZ1rOr0INQigT1Sj2c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739122516; c=relaxed/simple;
	bh=TMnCOXbNzxXmUgK4NzxxduVE2kuRaK95N6DCSO6NLSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JCwwH8qFcxrr38gkbUYjkOK7MzcqC/U3HIP9wLrlkPjauz6BB6gM1jXe4upKfdHwi46sU/Dz07PRyAvSMqFG6HHYySFVvzBRzjFD2AwtsxUgtTM07gztR2prvqAFNCpdkuyWb+hCq+0ikUD/lHAc/+4ysuA1FMPZWkqu6Y0Llmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Marfoe+U; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Marfoe+U"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30795988ebeso35587871fa.3;
        Sun, 09 Feb 2025 09:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739122512; x=1739727312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNgqRWveBWG4iTqEJzwpFdjho4GVrOnC7aYKMr31tgs=;
        b=Marfoe+UIFenKf4u7lnlXOyJzC1GnrF1WF9prte7QQzgsm/6DThfFV9urh+hav+tpu
         m/r+gvy2VUuSKVL6US/vs0gM76sbNeLGcq7gi6rZ49/iOa9cylQJHfd2cdoddKCBERrk
         s4LHFhrvFPyfzJaJhVRAzK2WUh11YOvl4+/T4XtVJEVwpOFerCITdpyuM0Z8H+NEkGs9
         oRYNrzOeUQfHYJVISTowm5sbcIhhPpi1K9BtTnCVeMUZqjr2VIaxxlWd2jzrYquQDaGH
         Yrqs1DlPGo9zcK9vh358LSCsXAyuAo26SLXx9SfL20Kho/n1NPOoqm5opE9so87fGd5y
         yYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739122512; x=1739727312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNgqRWveBWG4iTqEJzwpFdjho4GVrOnC7aYKMr31tgs=;
        b=KwS+wVXPRTP5ZpuKzHw+y8rk+pVnm0Y5aY5kNTEUcq3IsUgdfCmfx5x1QTyKZv2zoX
         fJ24C4kEW4DN8lyRrnSQP5RplHRlVqhf+RhKc8T0MdpLW4wYczjUaYsW7WzqOKY40IuZ
         +0NHI0NwWSybIHpCfQrrgau9jNsi2jqT9KxO2ITElYuYOlEEuHIIFsRKOroR9UNfFXcG
         QEionmnXARXaoONHqxbel4FvwBYcJnUHZQ84A2kaBcTwaZWYL7L4cxWJ0lUqI0FN4jqX
         o1tI1Cu4gmm+5890QEracOIPplAJgt4OabwGVlzdh89zupm/z6hpDPTJB3JGUb7NYO0Y
         snfw==
X-Forwarded-Encrypted: i=1; AJvYcCUE9wLgEQEXS3kONbmevjstl+1XVNHZZNmJrE/Kt8HgQRJCXzi78sbxWgFRH61Wb43b4rHoleVznzSp5LQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoCF6eg8foGjAjS5XJhxHvhFwVtpFEYjLqZSD44JLY8wT/ggLi
	1LeR/6tVE/LrdF+1k3L37z6IiYPNVgtqFGI1BlRMny9r2LYWZ2DkoWm+OGac7whI3eJUuynJ+ee
	uaiV1gTsl7pbhWsEZbMbjaYPtOkc=
X-Gm-Gg: ASbGncvTDakmDEezfc/GCqJHqF1NLqocnHOBEXEYr/HBBMyB5q7bwWM4LOs+teihA+C
	4bGtEFItqrR38RWNbQiX3CiKC1y2v3tFzWujAk9dFGnl7Xe6tbbCdFFAD68Op9p0R6gVA+yIbZL
	bzq3ekalpdrtGVFEaYwtfyguhFQS7e/RI=
X-Google-Smtp-Source: AGHT+IGHQHSfsskbaqxoGkiz3yJg2ympJRGJ1ahIL+zM8HjAbHS0vVWSGgp3eTMXR4CRkz+zbd6Atbr/t0Vd2iM/mME=
X-Received: by 2002:a05:651c:2129:b0:308:f01f:1829 with SMTP id
 38308e7fff4ca-308f01f1f54mr619651fa.6.1739122512229; Sun, 09 Feb 2025
 09:35:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209-rust-analyzer-macros-core-dep-v2-1-897338344d16@gmail.com>
In-Reply-To: <20250209-rust-analyzer-macros-core-dep-v2-1-897338344d16@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 9 Feb 2025 12:34:36 -0500
X-Gm-Features: AWEUYZk2-sUx3grg7mzGCfx1aDokbRm1Vaxsdv5Z1x6G4x3z2D3B0Y6ptKvYqMM
Message-ID: <CAJ-ks9=p0ysmsV5Vbs1Tc8LFrqB5Lkh9BfP2XDFBA0JvCT25Vg@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: generate_rust_analyzer.py: add missing macros deps
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Fiona Behrens <me@kloenk.dev>, Kees Cook <kees@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Lukas Wirth <lukas.wirth@ferrous-systems.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chayim Refael Friedman <chayimfr@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 9, 2025 at 12:12=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> The macros crate has depended on std and proc_macro since its
> introduction in commit 1fbde52bde73 ("rust: add `macros` crate"). These
> dependencies were omitted from commit 8c4555ccc55c ("scripts: add
> `generate_rust_analyzer.py`") resulting in missing go-to-definition and
> autocomplete, and false-positive warnings emitted from rust-analyzer
> such as:
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
> Add the missing dependencies to improve the developer experience.
>
> Fixes: 8c4555ccc55c ("scripts: add `generate_rust_analyzer.py`")
> Suggested-by: Chayim Refael Friedman <chayimfr@gmail.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> Changes in v2:
> - Change macros deps from [core] to [std, proc_macro], improving
>   autocomplete and go-to-definition.
> - Remove Wedson Almeida Filho <wedsonaf@google.com> from cc; email
>   bounced.
> - Link to v1: https://lore.kernel.org/r/20250209-rust-analyzer-macros-cor=
e-dep-v1-1-5ebeb3eb60a9@gmail.com
> ---
>  scripts/generate_rust_analyzer.py | 28 ++++++++++++++++++----------
>  1 file changed, 18 insertions(+), 10 deletions(-)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index aa8ea1a4dbe5..316174c22346 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -57,25 +57,33 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs):
>          crates_indexes[display_name] =3D len(crates)
>          crates.append(crate)
>
> -    # First, the ones in `rust/` since they are a bit special.
> -    append_crate(
> -        "core",
> -        sysroot_src / "core" / "src" / "lib.rs",
> -        [],
> -        cfg=3Dcrates_cfgs.get("core", []),
> -        is_workspace_member=3DFalse,
> -    )
> -
>      append_crate(
>          "compiler_builtins",
>          srctree / "rust" / "compiler_builtins.rs",
>          [],
>      )
>
> +    # NB: sysroot crates reexport items from one another so setting up o=
ur transitive dependencies
> +    # here is important for ensuring that rust-analyzer can resolve symb=
ols. The sources of truth
> +    # for this dependency graph are `(sysroot_src / crate / "Cargo.toml"=
 for crate in crates)`.
> +    for crate, deps in [
> +        ("core", []),
> +        ("alloc", ["compiler_builtins", "core"]),
> +        ("std", ["alloc", "compiler_builtins", "core"]),
> +        ("proc_macro", ["core", "std"]),
> +    ]:
> +        append_crate(
> +            crate,
> +            sysroot_src / crate / "src" / "lib.rs",
> +            deps=3Ddeps,
> +            cfg=3Dcrates_cfgs.get(crate, []),
> +            is_workspace_member=3DFalse,
> +        )
> +
>      append_crate(
>          "macros",
>          srctree / "rust" / "macros" / "lib.rs",
> -        [],
> +        ["std", "proc_macro"],
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

Adding Danilo and Lukas, missed from v1.
