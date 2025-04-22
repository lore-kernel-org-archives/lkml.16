Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D2318E3F;
	Tue, 22 Apr 2025 09:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745314971; cv=none; b=SAp+qSm9AXStbWTfcLWlMsZPJBd4PmJ9CwFR3jfI0B/0rYiSFKleDVworXs1QaqcRFgFs9oq6ldiDPv7asQW1q2mfQq5kOeJCrgq9hkgcNSGyP8oj/189F+O0sijtNwKk66fAPQhE01XbgmutkGcD6MJddi1dwQ2gKmaj3QfdvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745314971; c=relaxed/simple;
	bh=giw+6MyCHdZywR7m7dt+mCd3GwwU6C9flGDnJylbZgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iZOirkUb5GEr8RZ+58lMMxysqc1qj0DfqwdFcuq4vwh0EfCxIPO/377miuCHBx2WdkK+hfLn+pDIeQeV3+tums2AfxL8CkJSY+JiRZbur8YyokRne0vB0T/GNuLh4x88B7ASQ9eHYI9HUP3S4RSDiFYTOrtt61BdxHn2hlP6yjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WqGzwEP2; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WqGzwEP2"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5f624291db6so6519809a12.3;
        Tue, 22 Apr 2025 02:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745314968; x=1745919768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lAvTvLUdqqAzLw2gZ7OvfhTJtrVrtFonRS0q6nbLx3Y=;
        b=WqGzwEP2dYcF3ojcLbeg/xGIiWDpSeWqq9uyDNLU40jGjecEhOHQuBmEMWgXGM8str
         ZP+38xlifBt/T5hZS3Hr5cytnm9AlontowUnE1d6VqgWsG09CnfWmQS4+PYY3Fqf4jgM
         b4JlEO6/fF4xzQr20AIGl1VgAd51ME9z6Xev9IN1ofRxUlJz+Sy+a2cXJH5TdBCIQSNj
         RPVsyYxVpYk+seubtlSUtCuw1XzhkcrJs6wp8sgZh4R9L7TpUe82DKljv66tYdBKp/iF
         2jbSWZDfqdxda/itc++eWF+ehIbrCTLcI1Bsu+gFO7c0w+COvUykPo5H9yndjMK/BEED
         jfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745314968; x=1745919768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lAvTvLUdqqAzLw2gZ7OvfhTJtrVrtFonRS0q6nbLx3Y=;
        b=QmGuac7HO+Mn8MQSs6Aqlud0NwoLP7XLt7p6Pqf7YCdoKy5uKmvK8idSy1OUnHMI5b
         QysbQ2Rr3//jru9SFYUFU/sNdaR08OEnrIcIGkKQ/Uejkjgxnoa2jGwgPUPm36fs9e2l
         /wk/TWGTLpUzAatkP+sm3Ju9CAgJs0X8Sqil70MKfOETXr6zz7IlqqZHxTy0CVFhngrF
         o5yfdiftVzl8gf72aN9NsS4zuzblvCsUKBcc6JDYEo3vRojI4fnOTheVx9Z95/01XigB
         qUaziyzPb+mkLmf4JzYXPtyBQyckf4rnUzGCtyeiReyCSyP3OZyK/cDADewx2WTk6k69
         o31g==
X-Forwarded-Encrypted: i=1; AJvYcCVpzs6fjPVHjk4aNZRs/lzaB8r42UbrpoPTeuZhqe9d3sn3mjpRl3DIdOrxMHxuAOiRvZWqQ08/FmOP1XA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA/ZGcWITIiht5uFC5uXUrUX0gcOfWZ5KPQlkZi3I2/oSV7tsy
	lHOQ62+0TQkFHCYsoueAhYIbSPS1s2UCQHpgfihtwwZC67cO0iOV
X-Gm-Gg: ASbGnctc6ETjWW3eA0Nv820KryiCgG/IQQMJrZpm2QmcbokLDCdgprrIuHaWqcMP8DI
	1B4nLA6MJJ36xrR4Vnjguw+LyQI4kDw4ru9AOhpXRlbpJcdQM0iaWCuAQTaUdRtKxf2bek9R8gS
	Icqnss4ano4hft+kcrW16Vk4kLCPwJst72SJuapk2UmtDkBiTg1Le0+UbSAsY5gZIdUuP/1NOVY
	C361zNM3QfTC8yE4WkihCRRMtFjRRiKZIOAKCqLoY58ONabkuHenXJwOUacVmz6g7gN9+S/u+2I
	tsArJ6mu24TUFJkMLsRAkT30gsvcO4hzZO3LSKVHPvK40UieUA==
X-Google-Smtp-Source: AGHT+IFIv5+jMt/XPmELxbgBkCZmK6cAirZd2wKtsSxBKUaXdoLdYEJaLL0Bymq+RgHXuuAvSh6r6A==
X-Received: by 2002:a17:906:174e:b0:acb:9769:364c with SMTP id a640c23a62f3a-acb97695797mr694684066b.21.1745314968088;
        Tue, 22 Apr 2025 02:42:48 -0700 (PDT)
Received: from [10.5.1.156] ([193.170.134.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace36192e83sm11085566b.17.2025.04.22.02.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 02:42:47 -0700 (PDT)
Message-ID: <4df4e3a0-9caa-4253-bf65-66c238bf0291@gmail.com>
Date: Tue, 22 Apr 2025 11:42:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] rust: pin-init: Implement `Wrapper` for
 `UnsafePinned` behind feature flag.
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250421221728.528089-1-benno.lossin@proton.me>
 <20250421221728.528089-4-benno.lossin@proton.me>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250421221728.528089-4-benno.lossin@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.04.25 12:18 AM, Benno Lossin wrote:
> From: Christian Schrefl <chrisi.schrefl@gmail.com>
> 
> Add the `unsafe-pinned` feature which gates the `Wrapper`
> implementation of the `core::pin::UnsafePinned` struct.
> 
> For now this is just a cargo feature, but once `core::pin::UnsafePinned`
> is stable a config flag can be added to allow the usage of this
> implementation in the linux kernel.
> 
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> Link: https://github.com/Rust-for-Linux/pin-init/pull/37/commits/99cb1934425357e780ea5b0628f66633123847b8
> [ Fixed commit authorship. - Benno ]
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> ---
>  rust/pin-init/src/lib.rs | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
> index 467ccc8bd616..745cf534d239 100644
> --- a/rust/pin-init/src/lib.rs
> +++ b/rust/pin-init/src/lib.rs
> @@ -269,6 +269,10 @@
>  #![forbid(missing_docs, unsafe_op_in_unsafe_fn)]
>  #![cfg_attr(not(feature = "std"), no_std)]
>  #![cfg_attr(feature = "alloc", feature(allocator_api))]
> +#![cfg_attr(
> +    all(feature = "unsafe-pinned", CONFIG_RUSTC_HAS_UNSAFE_PINNED),
> +    feature(unsafe_pinned)
> +)]
>  
>  use core::{
>      cell::UnsafeCell,
> @@ -1557,3 +1561,11 @@ fn pin_init<E>(value_init: impl PinInit<T, E>) -> impl PinInit<Self, E> {
>          unsafe { cast_pin_init(value_init) }
>      }
>  }
> +
> +#[cfg(all(feature = "unsafe-pinned", CONFIG_RUSTC_HAS_UNSAFE_PINNED))]
> +impl<T> Wrapper<T> for core::pin::UnsafePinned<T> {
> +    fn pin_init<E>(init: impl PinInit<T, E>) -> impl PinInit<Self, E> {
> +        // SAFETY: `UnsafePinned<T>` has a compatible layout to `T`.
> +        unsafe { cast_pin_init(init) }
> +    }
> +}

I've realized that for us to use `UnsafePinned` in `Opaque` internally 
we need to have a `T: ?Sized` for this implementation. `cast_pin_init`
won't work for that since we can't cast pointers between different DSTs.
We could add something similar that uses a closure to convert a
`*mut T` to `*mut U`.

That won't really be relevant until we actually use 
`core::pin::UnsafePinned` however.

Should I do another PR to extend this to `T: ?Sized`?

Cheers
Christian
