Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F48D24677F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677919; cv=none; b=XJUp6FJu+rWrIykGobEvl4BdLAbAAurLcJwuOq4+voH9Ak4xflgDmisNgloUNc3iC79bV3iVev0JqE+WEmIZei3f812a6hWlyxLZqgOeLOU/S6oPQkdAf1U7/u3G0rm316poNbhwJzyqsZV4RZR0kwLkQPfxD/p+KQ1EYKNUg48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677919; c=relaxed/simple;
	bh=abwOXp0UsdJR4D9ILB106oi7Q9bX3i+w0YcE694rjtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BPQDrzTGtl+1UoaQSgxczdsChCdpxfUBvBQp6bzlXQKvDcsV556A5BpjoVhDOdELAMLRDR7sT++inJpqSyGlllYOhKMcsJPHH9DaWhhtCpKXYK3N4Amtieh1RWQGkEfsYlJVj1VUpDx8OreBwhkiqDTDi8k1bY5pVRAAyNkI7jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z0prTqdT; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z0prTqdT"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a528243636so221896f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749677916; x=1750282716; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/5ar9QXlIyiBU/c1loFvues+d0iCU3bkGxECwh2V9g=;
        b=Z0prTqdTsvene1KUs/rw5rrYVWRZsNk/s0y6jyRadUaBcgUQFGYeqXqIpQLuHAVUKW
         dkbhIMkVWntWldu30ysXH/XDUjEjsL+bnez8O82odmzuCeK2hsjrFe5Iyilg5780Clzf
         XHnmaMj1Wkt7HfYTLS8jX1E4pjKkJmW0ZLJy3tzWt8cDNEVt8v68KZYdOAC1vXiOTfRm
         3vTr6siG1MCLEOrLf10BjhiqA1MrrhCkMYmHNS8eRily0z6wbYRd7QfIIEFgW6ZWsgIY
         J60T8jAbkZ40owH5eFAhyd8uyvHA62QDAQWwa2SZ2wV0b4U2SjCzjxEIQSIIH4sYGHlt
         1ggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749677916; x=1750282716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/5ar9QXlIyiBU/c1loFvues+d0iCU3bkGxECwh2V9g=;
        b=hqECDBPa6dviQK+SY44UwDzjIL0E3DIfVRQvEBeszlcywZzh+2WNjvpIGb9c/DDwVd
         wdUOkF4NHaqkN9QuO2KpG2AcXdzc0uMcIEtHDMnHfFQEjRhwSffr9s1KDavfFkNug4ex
         KesEr1tiRPsUBDyYZC30nl0xX0i3TE+ef1aGwKxDQ+3OycNhAv6ketICkrFtoXrvRkvJ
         ezONqD0J7AFtudIobIPlSVe/moLoN513M5gM9U48UHyp08jts0iniV3jun7bJlnbaXUU
         Z4aZNArqa3qzHainJRIqha+JogblLPZiqslrLLQ/8hqKbPqEUhbMpUs+UiIrbaGqeLii
         9Eqw==
X-Forwarded-Encrypted: i=1; AJvYcCXU2rnIOvSVugRMv9G0ZyjOaARU1fSDa/wbUGmar0eWnuQiZk2/2nN66p3RrmUTOKA+whUu2tE7mNqGILc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSp8DXQFH6qZ52X8/E68UJ3e66StKKOBtGEFpNQDuuMTo6WBfF
	+CcOyszED1wxbdEEpBaqVd2RnH51iJYQsitoZBHZCbf6sUshXy/wgE+xizVRWuUObdHq2nUjH/O
	dXNsTuJFBAtIhvtPLq9oLn8LAUeVeXLYUvXcm/ooc
X-Gm-Gg: ASbGnct7J/uOShHqxyxweHfFszo0GjDeJ7X2qeu/iq+pSL/p/fr66E/ZH6X/nhf8XLi
	Q6SyRF2BXMvImfu5T9xKhnXOK39tHg4Qg5K8TXKTlc5Gw91kQMsqS+Cl/MyxypqyDYFhy54cbtp
	rblZN1XnZjrX9Tt1wz5vFbeCZY6I9u+emBXcSX/CULCCYX
X-Google-Smtp-Source: AGHT+IHHSpGnOkmwiZUhWn5tR19FPasvkAF9uSu8jBeCBhPrOha3D1g6d+vqysm61mf9cwIZSb6yKNKhiFY/0zz3ckc=
X-Received: by 2002:a05:6000:230f:b0:3a5:39be:c926 with SMTP id
 ffacd0b85a97d-3a560759d44mr726868f8f.32.1749677915566; Wed, 11 Jun 2025
 14:38:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611202952.1670168-1-andrewjballance@gmail.com> <20250611202952.1670168-3-andrewjballance@gmail.com>
In-Reply-To: <20250611202952.1670168-3-andrewjballance@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 11 Jun 2025 23:38:22 +0200
X-Gm-Features: AX0GCFttGEw3V80GdhYdzCwIxKhxUWpWnqO2fdzYtI8uhl6GYiu-70__QWoreMw
Message-ID: <CAH5fLggTL9Ej8rcakd-gDz+h0dZhA1PRzxf+76EjxotOBJW7fg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] rust: device add support for dynamic debug to pr_debug!
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
> adds support for dynamic debug for the pr_debug macro.
>
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> ---
>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/print.rs            | 167 +++++++++++++++++++++++++++++++-
>  2 files changed, 164 insertions(+), 4 deletions(-)
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index bc494745f67b..e05e9ce5d887 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -46,6 +46,7 @@
>  #include <linux/cred.h>
>  #include <linux/device/faux.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/dynamic_debug.h>
>  #include <linux/errname.h>
>  #include <linux/ethtool.h>
>  #include <linux/file.h>
> diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
> index 9783d960a97a..4f0d79804d23 100644
> --- a/rust/kernel/print.rs
> +++ b/rust/kernel/print.rs
> @@ -371,13 +371,15 @@ macro_rules! pr_info (
>  ///
>  /// Use this level for debug messages.
>  ///
> -/// Equivalent to the kernel's [`pr_debug`] macro, except that it doesn'=
t support dynamic debug
> -/// yet.
> +/// Equivalent to the kernel's [`pr_debug`] macro.
> +///
> +/// This has support for [`dynamic debug`].
>  ///
>  /// Mimics the interface of [`std::print!`]. See [`core::fmt`] and
>  /// [`std::format!`] for information about the formatting syntax.
>  ///
>  /// [`pr_debug`]: https://docs.kernel.org/core-api/printk-basics.html#c.=
pr_debug
> +/// [`dynamic debug`]: https://docs.kernel.org/admin-guide/dynamic-debug=
-howto.html
>  /// [`std::print!`]: https://doc.rust-lang.org/std/macro.print.html
>  /// [`std::format!`]: https://doc.rust-lang.org/std/macro.format.html
>  ///
> @@ -390,8 +392,18 @@ macro_rules! pr_info (
>  #[doc(alias =3D "print")]
>  macro_rules! pr_debug (
>      ($($arg:tt)*) =3D> (
> -        if cfg!(debug_assertions) {
> -            $crate::print_macro!($crate::print::format_strings::DEBUG, f=
alse, $($arg)*)
> +        #[cfg(any(DYNAMIC_DEBUG_MODULE, CONFIG_DYNAMIC_DEBUG))]
> +        {
> +            if cfg!(debug_assertions) {
> +                $crate::dynamic_pr_debug_unlikely!($($arg)*);
> +            }
> +        }
> +
> +        #[cfg(not(any(DYNAMIC_DEBUG_MODULE, CONFIG_DYNAMIC_DEBUG)))]
> +        {
> +            if cfg!(debug_assertions) {
> +                $crate::print_macro!($crate::print::format_strings::DEBU=
G, false, $($arg)*)
> +            }
>          }
>      )
>  );
> @@ -423,3 +435,150 @@ macro_rules! pr_cont (
>          $crate::print_macro!($crate::print::format_strings::CONT, true, =
$($arg)*)
>      )
>  );
> +
> +/// all of the code that is used for dynamic debug for pr_debug!
> +/// this is public but hidden. This code should only be called
> +/// by the `pr_debug!` or `dev_dbg!` macros.
> +#[cfg(CONFIG_DYNAMIC_DEBUG_CORE)]
> +#[doc(hidden)]
> +pub mod dynamic_debug {
> +
> +    pub use bindings::_ddebug;
> +
> +    use crate::c_str;
> +    use core::fmt;
> +    use kernel::str::CStr;
> +
> +    /// a wrapper around the C `struct _ddebug`.
> +    /// this is public but hidden.
> +    ///
> +    /// # Invariants
> +    ///  - this is always static mut.
> +    ///  - this is always located in the "__dyndbg" section.
> +    ///  - this has the same layout as `_ddebug`.
> +    #[repr(transparent)]
> +    pub struct _Ddebug {
> +        pub inner: bindings::_ddebug,
> +    }
> +
> +    impl _Ddebug {
> +        pub const fn new_unlikely(
> +            modname: &'static CStr,
> +            function: &'static CStr,
> +            filename: &'static CStr,
> +            format: &'static CStr,
> +            line_num: u32,
> +        ) -> Self {
> +            // rust does not have support for c like bit fields. so
> +            // do some bit fiddling to set the line, class and flags var=
ibles
> +            let class: u32 =3D bindings::_DPRINTK_CLASS_DFLT << 18;
> +            let flags: u32 =3D bindings::_DPRINTK_FLAGS_NONE << 24;
> +            let bit_fields: u32 =3D line_num | class | flags;
> +
> +            let arr: [u8; 4] =3D bit_fields.to_ne_bytes();
> +            let bits =3D bindings::__BindgenBitfieldUnit::new(arr);
> +
> +            #[cfg(CONFIG_JUMP_LABEL)]
> +            {
> +                Self {
> +                    inner: bindings::_ddebug {
> +                        modname: modname.as_char_ptr(),
> +                        function: function.as_char_ptr(),
> +                        filename: filename.as_char_ptr(),
> +                        format: format.as_char_ptr(),
> +                        _bitfield_align_1: [],
> +                        _bitfield_1: bits,
> +                        // SAFETY: STATIC_KEY_INIT_FALSE is initialized =
as zero
> +                        key: unsafe { core::mem::zeroed() },

Please define a STATIC_KEY_INIT_FALSE constant in
rust/kernel/jump_label.rs and refer to it. You can use mem::zeroed()
in the definition of the constant.

> +                    },
> +                }
> +            }
> +
> +            #[cfg(not(CONFIG_JUMP_LABEL))]
> +            {
> +                Self {
> +                    inner: bindings::_ddebug {
> +                        modname: modname.as_char_ptr(),
> +                        function: function.as_char_ptr(),
> +                        filename: filename.as_char_ptr(),
> +                        format: format.as_char_ptr(),
> +                        _bitfield_align_1: [],
> +                        _bitfield_1: bits,
> +                        __bindgen_padding_0: 0,
> +                    },
> +                }
> +            }
> +        }
> +    }
> +
> +    /// a wrapper function around the c function `__dynamic_pr_debug`.
> +    /// # Safety
> +    /// - descriptor must be a valid reference to a `static mut` _Ddebug
> +    pub unsafe fn dynamic_pr_debug(descriptor: &mut _Ddebug, args: fmt::=
Arguments<'_>) {
> +        // SAFETY:
> +        // - "%pA" is null terminated and is the format for rust printin=
g
> +        // - descriptor.inner is a valid _ddebug
> +        unsafe {
> +            bindings::__dynamic_pr_debug(
> +                &raw mut descriptor.inner,
> +                c_str!("%pA").as_char_ptr(),
> +                (&raw const args).cast::<ffi::c_void>(),
> +            );
> +        }
> +    }
> +
> +    /// macro for dynamic debug equilant to the C `pr_debug` macro

typo

> +    #[doc(hidden)]
> +    #[macro_export]
> +    macro_rules! dynamic_pr_debug_unlikely {
> +        ($($f:tt)*) =3D> {{
> +            use $crate::c_str;
> +            use $crate::str::CStr;
> +            use $crate::print::dynamic_debug::{_ddebug, _Ddebug};
> +
> +            const MOD_NAME: &CStr =3D c_str!(module_path!());
> +            // right now rust does not have a function! macro. so, hard =
code this to be
> +            // the name of the macro that is printing
> +            // TODO:
> +            // replace this once either a function! macro exists
> +            // or core::any::type_name becomes const
> +            const FN_NAME: &CStr =3D c_str!("pr_debug!");
> +            const FILE_NAME: &CStr =3D c_str!(file!());
> +            const MESSAGE: &CStr =3D c_str!(stringify!($($f)*));
> +            const LINE: u32 =3D line!();
> +
> +            #[link_section =3D "__dyndbg"]
> +            static mut DEBUG_INFO: _Ddebug =3D
> +                _Ddebug::new_unlikely(MOD_NAME, FN_NAME, FILE_NAME, MESS=
AGE, LINE);
> +
> +            // SAFETY:
> +            // - this is reading from a `static mut` variable
> +            // - key.dd_key_false is a valid static key
> +            let should_print: bool =3D unsafe {
> +                #[cfg(CONFIG_JUMP_LABEL)]
> +                {
> +                    $crate::jump_label::static_branch_unlikely!(
> +                        DEBUG_INFO,
> +                        _Ddebug,
> +                        inner.key.dd_key_false
> +                    )
> +                }
> +                #[cfg(not(CONFIG_JUMP_LABEL))]
> +                {
> +                    // gets the _DPRINTK_FLAGS_PRINT bit
> +                    DEBUG_INFO.inner.flags() & 1 !=3D 0
> +                }
> +            };
> +
> +            if should_print {
> +                // SAFETY: `&mut DEBUG_INFO` is a valid reference to a s=
tatic mut _Ddebug

No, we can't use mutable references like this. In Rust, the real
meaning of &mut is exclusive, not mutable. (And the real meaning of &
is shared.) We don't have exclusive access to the DEBUG_INFO static
here - the access is shared, so we must use &_ references instead of
&mut _ references here.

Note that by using Opaque, it's possible to mutate the value even if
it's behind a &_ reference.
#[repr(transparent)]
pub struct _Ddebug {
    pub inner: Opaque<bindings::_ddebug>,
}
and then you can do DEBUG_INFO.inner.get() to obtain a mutable raw
pointer to the contents.

> +                unsafe {
> +                    $crate::print::dynamic_debug::dynamic_pr_debug(
> +                        &mut DEBUG_INFO,
> +                        format_args!($($f)*)
> +                    );
> +                }
> +            }
> +        }};
> +    }
> +}
> --
> 2.49.0
>
