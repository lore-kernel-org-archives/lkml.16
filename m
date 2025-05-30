Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9FE2116F5;
	Fri, 30 May 2025 20:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748638406; cv=none; b=iNxwF7DBPTkvUPidSYiVZZor5bkhwEtvBlsDyhXk6qdxtbpufTVY+5lw04S/EtIzGy+Vivts88CsbFNEJlhyKTQUCVt/NUeYZ3LVWc7sEwaYvPMT38RpQ+x5+xzignQtKSyMJ4TpqcUa7jqrLFCtBh5jaK2hBF6/eV+d0mZv7N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748638406; c=relaxed/simple;
	bh=YVT4uvEvFXOsSBx4+D+qPFb/3c/ZaJlDw9VoSq9O6n0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZsdAn5rU1IXcZq/2iCATUceRBVstUkXn/J5jsexGv2+C2TsT9Po7DwIoWkHwOQKt0hoQji0skyp6Vd7mOqijVjVeGc2QjNJNByqtUggE9SrR0RQBnEo2uUCcl4G9Jg7gu+0Jy+jBrb/tBrrbYw2/0+LyDs00DlMQ8zKXxrZvVdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQoXd4jG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQoXd4jG"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso23331055e9.0;
        Fri, 30 May 2025 13:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748638403; x=1749243203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vTQhwZuH1D3pG1/efE1/+CfG22aLhAJyJR5QOwhnJto=;
        b=QQoXd4jGVGbBxAJUUqQc09WU+Cdo18ikpjMauHRc+LI5BYrz78RnBGUqFSoCeFqPfF
         ZzDjBHpGo+ORpXfWu43rdA598H69ewb2khLDr1yl53rEvE02uhlyXNfnbo6Q8qZr5diM
         oS/hp/I8Tw2gDLvf7ODOW7WUJWeuNlSF7TGG7AfjdMc8uY5l1veQWcdtdEB7cQzYWH0Z
         yZ4IAuF6c8kb4AworWY7X0B6T2suYpQ6E8UnNbtP/g9Je0eiNuhQOWbmpQedJb25NWBa
         z1b6YoazB+gj8X31+cT0PRnaFLnQ+EzMcnJtLEAjXtqEyOqa8AGBedcInnOXAH3FilPz
         fkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748638403; x=1749243203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vTQhwZuH1D3pG1/efE1/+CfG22aLhAJyJR5QOwhnJto=;
        b=PvOoMktR74kJ1YQ1Ga3LZv4+yW2MGVXZK2raJKWxscj2AtnDTjaCClfx0ZgrBRsBKl
         TTasaypf7EHPGdiwKVeSm44K1vrPHThS35pQqiPQi6zQ3ubn9l/D7BSg9syuqxmK/kOF
         /KJUp8Neu+Q5AQXj2ELeWMEyxUnqCQ7wbpat3dNPloUliunblr07gfS9nLha+YlJUafS
         kf/oL1evZlAMaMAWaG6DXyKtu0gxsc65cyU4dsBWYnfzUozWjk6lSkzCGgfeGNVLVDKW
         Q52sd6Yafcwo7PeortA04MS+yqWvNCt4FUh7rgHtNug1kfLSoXVkjxLpyfwKArzDxIE1
         zLgg==
X-Forwarded-Encrypted: i=1; AJvYcCUAVF2moZnpGp0/zWSZ5Q5Lh2T6zYEMmTbP8obaXHouFvCOqx0sXh3K6q+ozwKFO4YRmqBVzjpvDmK9fV8=@vger.kernel.org, AJvYcCUwsYgIn1A+uXjSJ3MA2NsDReashsYid7CUzUZDk0119lV5pbF6iBYDV/6o4fue5NlMSNUfccIdoMeEHyOakHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YykBKSm2+vuMQBEec0TVpFFFMmQW3q+gWxeXShA9MQpipI3l4qL
	ceguXCt8qdrjZcWPhj6sHKtquUOm/+fMY6XS8aV1oN+WcWw3dz6paiX0
X-Gm-Gg: ASbGncvh7MfEXih7izGzu+a1kELAInMTVZAF9JtbnK8PTRHkqlETOyAWrNQEAzTUalu
	MPoQUKZdBgDl2WoUn/YuHfM8Y9LUTSaSCW2Q3p0TlPXcdFk5HRSHTaMczWf0KAaMNF0y1vZtlVM
	Vl/DXtJe3tpmOxZQPGpU7/PHcmaIoYrnr/99cXmh3Iib1w4EMfH3ouqTX9+3f+iOtpZaxkGZMSk
	qBxt+xU3UHpiDOY3RrpMt34oMzupdQjtkunU2ACJ9b4jKASER0Ukx1fGM8IktakWkEMxlyolBE6
	0yQfxdwR73/8EdCue8fudwNSI+G1CXHffUAKUHEfLcAn7L+f48fnOIEM4cdtAYTU
X-Google-Smtp-Source: AGHT+IFmAiP1RxGGJAA9EDRk9rB/7AW5wQ90IzgbMxbykuqqcsbgSu4G72rFo2Oq2y7hQkDfe3RR2A==
X-Received: by 2002:a05:600c:5392:b0:441:d2d8:bd8b with SMTP id 5b1f17b1804b1-450d653615emr47615675e9.8.1748638402920;
        Fri, 30 May 2025 13:53:22 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:cd68::171c? ([2001:871:22a:cd68::171c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73fbcsm5746401f8f.48.2025.05.30.13.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 13:53:22 -0700 (PDT)
Message-ID: <fa66bd89-e52b-45ef-969c-c6f147f20185@gmail.com>
Date: Fri, 30 May 2025 22:53:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] rust: implement `Wrapper<T>` for `Opaque<T>`
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Benno Lossin <lossin@kernel.org>
Cc: =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com>
 <20250530-b4-rust_miscdevice_registrationdata-v4-1-d313aafd7e59@gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250530-b4-rust_miscdevice_registrationdata-v4-1-d313aafd7e59@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.05.25 10:46 PM, Christian Schrefl wrote:
> Moves the implementation for `pin-init` from an associated function
> to the trait function of the `Wrapper` trait and extends the
> implementation to support pin-initializers with error types.
> 
> Adds a use for the `Wrapper` trait in `revocable.rs`, to use the new
> `pin-init` function. This is currently the only usage in the kernel.
> 
> Reviewed-by: Gerald Wisböck <gerald.wisboeck@feather.ink>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> ---

Danilo, FYI this is basically a patch from my `UnsafePinned`
series [0] that I've used instead of your patch [1] that does something similar.
(I've only dropped `the call is infallible` from the safety
comment like in your patch since I missed that before).

Let me know if you want me to handle this any different.

[0]: https://lore.kernel.org/rust-for-linux/20250511-rust_unsafe_pinned-v4-2-a86c32e47e3d@gmail.com/
[1]: https://lore.kernel.org/rust-for-linux/20250530142447.166524-2-dakr@kernel.org/

Cheers
Christian

>  rust/kernel/revocable.rs |  2 ++
>  rust/kernel/types.rs     | 25 +++++++++++++------------
>  2 files changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> index 1e5a9d25c21b279b01f90b02997492aa4880d84f..4db68ea2207ebafcc09d082fdc1e281f31846a38 100644
> --- a/rust/kernel/revocable.rs
> +++ b/rust/kernel/revocable.rs
> @@ -5,6 +5,8 @@
>  //! The [`Revocable`] type wraps other types and allows access to them to be revoked. The existence
>  //! of a [`RevocableGuard`] ensures that objects remain valid.
>  
> +use pin_init::Wrapper;
> +
>  use crate::{bindings, prelude::*, sync::rcu, types::Opaque};
>  use core::{
>      marker::PhantomData,
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 86562e738eac85480a048041e979335b81c5e3c9..7ab70d5f76099c3442dce5b02c6b226fc74c851e 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -9,7 +9,7 @@
>      ops::{Deref, DerefMut},
>      ptr::NonNull,
>  };
> -use pin_init::{PinInit, Zeroable};
> +use pin_init::{PinInit, Wrapper, Zeroable};
>  
>  /// Used to transfer ownership to and from foreign (non-Rust) languages.
>  ///
> @@ -345,17 +345,6 @@ pub const fn uninit() -> Self {
>          }
>      }
>  
> -    /// Create an opaque pin-initializer from the given pin-initializer.
> -    pub fn pin_init(slot: impl PinInit<T>) -> impl PinInit<Self> {
> -        Self::ffi_init(|ptr: *mut T| {
> -            // SAFETY:
> -            //   - `ptr` is a valid pointer to uninitialized memory,
> -            //   - `slot` is not accessed on error; the call is infallible,
> -            //   - `slot` is pinned in memory.
> -            let _ = unsafe { PinInit::<T>::__pinned_init(slot, ptr) };
> -        })
> -    }
> -
>      /// Creates a pin-initializer from the given initializer closure.
>      ///
>      /// The returned initializer calls the given closure with the pointer to the inner `T` of this
> @@ -406,6 +395,18 @@ pub const fn raw_get(this: *const Self) -> *mut T {
>          UnsafeCell::raw_get(this.cast::<UnsafeCell<MaybeUninit<T>>>()).cast::<T>()
>      }
>  }
> +impl<T> Wrapper<T> for Opaque<T> {
> +    /// Create an opaque pin-initializer from the given pin-initializer.
> +    fn pin_init<E>(slot: impl PinInit<T, E>) -> impl PinInit<Self, E> {
> +        Self::try_ffi_init(|ptr: *mut T| {
> +            // SAFETY:
> +            //   - `ptr` is a valid pointer to uninitialized memory,
> +            //   - `slot` is not accessed on error,
> +            //   - `slot` is pinned in memory.
> +            unsafe { PinInit::<T, E>::__pinned_init(slot, ptr) }
> +        })
> +    }
> +}
>  
>  /// Types that are _always_ reference counted.
>  ///
> 

