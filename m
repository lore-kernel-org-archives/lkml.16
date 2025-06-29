Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386D21BC41;
	Sun, 29 Jun 2025 16:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751213092; cv=none; b=VbUCMRyDbnd6JCS3SaxIoPFZAJ1gbog9bmszvA0egxyHWKTkLWJojQMWs0g748j0Vo6ddoKyR35BFvQRsDg7FY9VZim4h+xN49PW0w6SsYab1vr4V4SXhDztbufq+FAktCdl2Td/GkiHga4jGXGmpCITaOouIX4uGsyFVlLnmJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751213092; c=relaxed/simple;
	bh=KeqSZuSRh0NAtyUnqNnvxYbaDF1XAz5BRybJ4E13bvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lgj4ExXygHwPwQ6CJ6Aa0SyzIWcrKPLHTlEvRYbsWyVxBH15CWkSx8mfDdXq24cidnMLgdUkP61oTfcWs4Fi1Hxlg4MJY/HA6D+TvD0xvRKC9C7Nw0UOH6lyuA75hQ6vdlS9QmyKhA8l99btf5wbTbMgyJbEb1vSzPoqL1NhO1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XsTLAnGo; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsTLAnGo"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b7fd20f99so37747131fa.0;
        Sun, 29 Jun 2025 09:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751213088; x=1751817888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lHX67cPsmHX1OdOx39kmuL8Gc8iNbyn/5TzDDO0Fik=;
        b=XsTLAnGojlrXusBv2bF0tlVIq57IlwG8QPBsxgBOdkMDfz8HPfcZdtsXU7wQfEP4F5
         PUMnVFenwhWsP+jNUQTTF3CXFbdSOUQHYIQvyI+dTvVM2+zrcU+vInmEpc6IhXqzub/6
         NzFfwLtgDVVV/EZ1JwJL3JZNgl/5GxCne/KYVp68EwREKqkeOvM0GkJupmT3vL/0bLMC
         yx3Ls8Ekas/ppwon6DJA1NE6J+264krIck4g5NTWA9RScgx+X5c1fHwEHuCKtqFR4rjA
         vW5ZMXR+Th6BCC4MJvGlG/Ia2lwWq/csYD+h7FqbRdu9LRRtEQ0evulfKpLnZJO3fLhw
         qI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751213088; x=1751817888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1lHX67cPsmHX1OdOx39kmuL8Gc8iNbyn/5TzDDO0Fik=;
        b=XSNXA8KfPuI/jWGnk4B7P+NLCaxS03wK9nSc6srBb19HR2umupMqzE41k08qa8ARx5
         gnUE61EZ7Y2SAQyOmoWhhhH9Owlz7JPoGIlc4IHJOBp3x1vaa/v92pqW+BL7QqfwtYCL
         2992OSLcbrqjVqG1hX3ICSriM5QIzwA4mbG2B9/VqIxzlZTgaVvs7k30bY9k/ZDducnf
         COdkgQWQ9XUhyeKN2f57K6i/2/ZgR4MeV5VPpuKFaZGtyvqiVT2PB5C9QU2dWI6o41CV
         9twjYJMA9glbUJM/7IlRePfg2jZ0QKXXjC+jEmPc5FOdexFumP8dx/fYdqUHv7lG6TIB
         HPQA==
X-Forwarded-Encrypted: i=1; AJvYcCUeQbnzZCjtpS9jNf1R96JkBIx7lGCRUk+VVmpdSupFa9eU6N/c4n/2MDp5eVNdmnujdtmWKLBYLvrp6qrK2ls=@vger.kernel.org, AJvYcCXt4SuHENd5fd4L8T/2REcN4U71hsY49xtLA5kwR062YZh4U0cpBYUx89VAsY5YKJgxYLaKSyaht1FSsQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvrTpSwvNn+IR0aLHKD42LAlvw9mV5ARPxPMv7gawXEqTTNykS
	Iwg6JplCnuIwZtfIQdBHaZ1Wo4GBsQO3ZmD2c/S1nMFrd93SW5D2b00i9k8UQrOmefMsYSBUD6o
	88wzCgJoi3RdHu32UzDGjKCG+Gxny0ck=
X-Gm-Gg: ASbGncsicGFTMLC/rGZMVAoEOId0Nlx35sLxC3cEXp0yrFZB4mwalM9/7oz4KUyWuv/
	jFjwD0xo/s78ngrKbyFJ2tvd1xyU1F5CpE5tZrQ+FNtkp21cNl+HehAEgOmJniZbAf/ADY6yRFk
	MRh/prHBEgmLiVj+ZiwBp+DrAqdFSpftGULRDBW8pY8ST25jxMgJLie9r8xnU077ocAQ8UaCdTX
	Ev03c8vxDJr1/+J
X-Google-Smtp-Source: AGHT+IFxNystqzJxYIsxvp5/n0W1NLOjcjbum40RbJECd0wGBfQOZV/fsv3ML/Z3iPLIVrlQVcCtA4b5cAAmdQ4xv/g=
X-Received: by 2002:a05:651c:1688:b0:32b:4521:73d1 with SMTP id
 38308e7fff4ca-32cdc822c18mr25239941fa.20.1751213087969; Sun, 29 Jun 2025
 09:04:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629024310.97937-1-contact@antoniohickey.com> <20250629024310.97937-2-contact@antoniohickey.com>
In-Reply-To: <20250629024310.97937-2-contact@antoniohickey.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 29 Jun 2025 12:04:11 -0400
X-Gm-Features: Ac12FXyx2LNlbthRTHQQwGX1BvYTw18Ieui2d2Z0NZ14li-H6n1GFxrOr1V6kkU
Message-ID: <CAJ-ks9m45p9FHCvbuOS0zJvZfHMcXOLvN+rfjQfyNTHzDovspA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: kernel: create `overflow_assert!` macro
To: Antonio Hickey <contact@antoniohickey.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Cote <danielstonecote@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 28, 2025 at 10:43=E2=80=AFPM Antonio Hickey
<contact@antoniohickey.com> wrote:
>
> This commit creates a macro for overflow assertions, the use of this
> macro will avoid local `#ifdef`s by encapsulating the conditional
> behavior (like `#[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]`) to the macro.
>
> In addition this macro allows us to document the intent of the assertion
> more clearly.
>
> Co-developed-by: Daniel Cote <danielstonecote@gmail.com>
> Signed-off-by: Daniel Cote <danielstonecote@gmail.com>
> Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1159
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/kernel/lib.rs             |  1 +
>  rust/kernel/overflow_assert.rs | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 rust/kernel/overflow_assert.rs
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 6b4774b2b1c3..e395adb6b293 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -92,6 +92,7 @@
>  pub mod of;
>  #[cfg(CONFIG_PM_OPP)]
>  pub mod opp;
> +pub mod overflow_assert;
>  pub mod page;
>  #[cfg(CONFIG_PCI)]
>  pub mod pci;
> diff --git a/rust/kernel/overflow_assert.rs b/rust/kernel/overflow_assert=
.rs
> new file mode 100644
> index 000000000000..5164339813cb
> --- /dev/null
> +++ b/rust/kernel/overflow_assert.rs
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Overflow assertion.
> +
> +/// Verifies at runtime that an expression is within an expected bound.

This is a strange comment, imo. The only thing special about this
macro relative to a plain `assert` is that it disabled when
CONFIG_RUST_OVERFLOW_CHECKS=3Dn.

> +///
> +/// This macro is only active when `CONFIG_RUST_OVERFLOW_CHECKS` is enab=
led.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// overflow_assert!(3 <=3D 10);
> +/// overflow_assert!(5 <=3D 5);
> +///
> +/// const X: u8 =3D 5;
> +/// overflow_assert!(X + 3 < 10);
> +///
> +/// const MAX: i32 =3D 42;
> +/// const fn f(x: i32) -> i32 {
> +///     x + 1
> +/// }
> +/// overflow_assert!(f(40) < MAX);
> +/// overflow_assert!(f(40) < MAX, "f(x) must not overflow the max value.=
");
> +/// ```
> +#[macro_export]
> +macro_rules! overflow_assert {
> +    ($cond:expr $(,$arg:literal)?) =3D> {
> +        if cfg!(CONFIG_RUST_OVERFLOW_CHECKS) {
> +            ::core::assert!($cond $(,$arg)?);
> +        }
> +    };
> +}
> --
> 2.50.0
>
>
>
