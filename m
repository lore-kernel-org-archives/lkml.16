Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9901C20127D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677543; cv=none; b=GI0sTD45ICdTFoRto0/bMHyjbYOShbrXaOOpM4pYuBzXsd1ne6gI4ganuMNHu4gMnjwaEN5tDMmg1PS9//jzTR/W8Vig4zytHDMQIjNRSB0rMRumi828b//IIuHwbl1BjGA+M9er9T7T0CpTXuc8QeXAkEy8JmQWQi+rgMtkg0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677543; c=relaxed/simple;
	bh=YupYUQilP0QxXHIjzGZlm4sAbHNJPvh2Hh0qSV+u4k4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LpPb2cNWnmJoj0ZIUbuoxnlwAsFIbobS1ES3A6gir5oYSctMwXbO6pZV8xy7z9UBhAYq+nNGeRP/oqwBu5HexYgI7DuXcsnEJaRohcZvUuGlQBco1HYFHtmqomg5nk8b/BM7/CpJZ4KDiyTLRhURfoAU7hzabroos/nZLWyDM4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ckv7/wFP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ckv7/wFP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-451d7b50815so1683425e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749677540; x=1750282340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spsEjP8qEOdvTfxDRozqzSsaxiwtL4VXiPFQ4J66DNw=;
        b=Ckv7/wFPkcIrxv8mBbLcOgRuhgtPjPHl+LpCZUhGZI4/WQp1IawDQKv1WH9NBLgVqW
         jz08US0aqUnmPfNerUq8l2v+btxgghBP+oQZ8t1WOo7NlXI0R/CiJA13QRas/anoPGjz
         J763JruCxfE6mM4PSuAhDdQELSaIIhlDABXXqnFzV7HWIY6b+7oimqS6DXVFeqr6jvj5
         1ah7lvQOcyPHOr0bwKHpf1V7TGPzY6F+vWek7O8p1Ti8ekTLWMU041InOrh0G4p6WD4x
         CYVrD4TwtJIlHMYS4B+bfj6I+lC01Y12q9lVE9WczZaCTwpm6NnkFAla8VIJAdeXPIXQ
         wC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749677540; x=1750282340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spsEjP8qEOdvTfxDRozqzSsaxiwtL4VXiPFQ4J66DNw=;
        b=CQ7Fwa4aMJRIuROtEVt8150hGnS1q1WIy5MdAqgGnVITBhDFw0AE9iksB56h3dqLKm
         3YtZkkMuf2ndKEeqSFGzDm4am/wp5ej1LSWNBfOI3klMU+pezw5seffy35/hwGpaMYKy
         a9RPgiJHpdXJfYFIjmPSWEcSJhS2U72XYxrddbCldNs4XD5V+u0lJ9Sh+vJS7YVVZcoJ
         0NBXjUM0/UYrHGBdJsnYX3lMc0l5/cg4lLh84Asx87rnIgGgJV687yvLf2WKn3/1tajJ
         LHixx05a/88yTlHsXIPkMHe6HjKqIT/vB3rma3i4meJlo5pVjp6ZU10b/aO8aLQ+X9ie
         FlzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpwgt4kgom/zWuHJtRm3K4UbBXpJZeevExycbzpstnW7r8HWxPLBPOAQM2YyywePIK5THhGG/OW0hLA30=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkEn5gvW9hhWVdoWxhZ4BNI+sFNCoKGcriaGZN8tkXxAYyvK3l
	RdasuUmB6Tqs9g3d8UEQP7RPEwZNI16DenA7uXDxMNPetI58gOSjSwZ+dNwVA+OkW/Lo2A3yl26
	jCbiRT/c+fiCNXQ1mOX9ytZcSIYWBBgDDXFkqyHpT
X-Gm-Gg: ASbGncuA+H7ad5CGGz0HjbyqeElKirVkbA2PphH4NXCjshs1MeysvV5Widq9ZwUx5j7
	eJH/thdE4TscubET3vbE+X8vnOwxb8eD1+cikdE+623rItdzEGpcDttFHeMMydC0EmuI3JrC2lj
	k9ebmMuN2lOYmUceSIc8DJaKaT4eDYjTB9GHr9rdrypT59dfGFviOp0fY=
X-Google-Smtp-Source: AGHT+IEVHVP3cU2A9uR1QbwmVLTk0uCabA4E3xKpPhc0gkg9XOaInY/OR3X/oP1yc4WJjUGEewZOobYz8P6AWX+7CP0=
X-Received: by 2002:a05:600c:1d0a:b0:450:d3b9:4b96 with SMTP id
 5b1f17b1804b1-4532b8c65e2mr13895795e9.13.1749677539877; Wed, 11 Jun 2025
 14:32:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611202952.1670168-1-andrewjballance@gmail.com> <20250611202952.1670168-2-andrewjballance@gmail.com>
In-Reply-To: <20250611202952.1670168-2-andrewjballance@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 11 Jun 2025 23:32:06 +0200
X-Gm-Features: AX0GCFu3JIhASEbKWApyPZ901XhH3tEKz1_inQTURtY-R1efLtqeP2Vjn9Q4Cfo
Message-ID: <CAH5fLghOp4+P5SVMAoNbxwjf9HASRRU11SErJary7SZ0qrB-HA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] rust: static jump: add support for nested arguments
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: jbaron@akamai.com, jim.cromie@gmail.com, daniel.almeida@collabora.com, 
	acourbot@nvidia.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	gregkh@linuxfoundation.org, rafael@kernel.org, rostedt@goodmis.org, 
	viresh.kumar@linaro.org, lina+kernel@asahilina.net, tamird@gmail.com, 
	jubalh@iodoru.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 10:30=E2=80=AFPM Andrew Ballance
<andrewjballance@gmail.com> wrote:
>
> allows for nested arguments to be used with the static_branch macro.
> e.g. `outer.inner.key` can now be accessed by the macro
>
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> ---
>  rust/kernel/jump_label.rs | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/rust/kernel/jump_label.rs b/rust/kernel/jump_label.rs
> index 4e974c768dbd..4ea3cbb340ff 100644
> --- a/rust/kernel/jump_label.rs
> +++ b/rust/kernel/jump_label.rs
> @@ -19,9 +19,9 @@
>  /// The macro must be used with a real static key defined by C.
>  #[macro_export]
>  macro_rules! static_branch_unlikely {
> -    ($key:path, $keytyp:ty, $field:ident) =3D> {{
> +    ($key:path, $keytyp:ty, $field:ident $(.$field_cont:ident)*) =3D> {{

I think this can be:
($key:path, $keytyp:ty, $($field:ident).+) =3D> {{

this means "one or more identifiers separated by dots.

>          let _key: *const $keytyp =3D ::core::ptr::addr_of!($key);
> -        let _key: *const $crate::bindings::static_key_false =3D ::core::=
ptr::addr_of!((*_key).$field);
> +        let _key: *const $crate::bindings::static_key_false =3D ::core::=
ptr::addr_of!((*_key).$field$(.$field_cont)*);
>          let _key: *const $crate::bindings::static_key =3D _key.cast();
>
>          #[cfg(not(CONFIG_JUMP_LABEL))]
> @@ -30,7 +30,7 @@ macro_rules! static_branch_unlikely {
>          }
>
>          #[cfg(CONFIG_JUMP_LABEL)]
> -        $crate::jump_label::arch_static_branch! { $key, $keytyp, $field,=
 false }
> +        $crate::jump_label::arch_static_branch! { $key, $keytyp, $field$=
(.$field_cont)*, false }
>      }};
>  }
>  pub use static_branch_unlikely;
> @@ -46,14 +46,14 @@ macro_rules! static_branch_unlikely {
>  #[doc(hidden)]
>  #[cfg(CONFIG_JUMP_LABEL)]
>  macro_rules! arch_static_branch {
> -    ($key:path, $keytyp:ty, $field:ident, $branch:expr) =3D> {'my_label:=
 {
> +    ($key:path, $keytyp:ty, $field:ident $(.$field_cont:ident)*, $branch=
:expr) =3D> {'my_label: {
>          $crate::asm!(
>              include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_ar=
ch_static_branch_asm.rs"));
>              l_yes =3D label {
>                  break 'my_label true;
>              },
>              symb =3D sym $key,
> -            off =3D const ::core::mem::offset_of!($keytyp, $field),
> +            off =3D const ::core::mem::offset_of!($keytyp, $field$(.$fie=
ld_cont)*),
>              branch =3D const $crate::jump_label::bool_to_int($branch),
>          );
>
> --
> 2.49.0
>
