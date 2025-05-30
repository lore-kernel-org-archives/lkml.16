Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D47D21CFF6;
	Fri, 30 May 2025 16:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748621678; cv=none; b=VgTm/RE1dJV2fReEddjAzWAJZTHQT22RemslewdwfUTQ9l4WZsHkhAanOS5DeYyhiUdRNNEwMhlcArzB4DVBOiy/YWLJPhPGDaos0wvBzE4r1M01M4TH7oZCnWkFYQjAak/owR3MlsHMFx9lzCdsgueBxxJMimeWV6nkBWhGbUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748621678; c=relaxed/simple;
	bh=07SjjF787R53d2NiXMYqs6iqzev11R/uOyi6Z3gUHuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mp5T9+A8Vuzm0IoIUHBJamKl/LYXDrYCCbXC0+6J8GTVdi6MHp7WsYT7GgauOCMJgKmiejV66UjtOIC/7/BCheaWOjuf/ImZtiKc0PPxYPiThM4S33ayf4PmvbxGGjqvi0zHUrR12qOi5bdRi2Mzp3+ZL+q7ILQJ/B2EgzQy9vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZfb2Bhg; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZfb2Bhg"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a363d15c64so1495932f8f.3;
        Fri, 30 May 2025 09:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748621675; x=1749226475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nYfPIik2VZq+X4ZDMfQ+Lt7jynuL6/hkz3PFespndps=;
        b=GZfb2BhgAn+bMGugKaucQ0qau/07bPJkY3vz7p4bzWezMEef+GxDol2TFiZW/kqbVs
         r/DYbZUain3t0onU0aWTMu4jnC4YlSn+Z0IlZKGhmpN7Nbp6qysRNA03WRWO4QT+AOOC
         jpfS3edk2LbpTReUMA7Umw8NIMGDI6Zux6u1cl73QwUcBdWcQbGFY9Q3WVX44Ezr+Y8x
         f1w9lS7vZOSM0/yIGxv9ZSHvA8Kx3x+syVf37wt5hPrNc/Bx8NPRSC735DowUJ2lbdIa
         YJQoOVWZJ3I2fGWLyEvvUyFziMRfkZCgZwH8tteq0hXUKnzBft/z8w+ClQXq0jf6wZ6O
         zE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621675; x=1749226475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nYfPIik2VZq+X4ZDMfQ+Lt7jynuL6/hkz3PFespndps=;
        b=hpS/2tczC5E4aT0o3qMvmZIbkb0LjFs/bP78AoY0S3pIqI8My+hJHOlKAIt95CbgGJ
         t1tnSEnNzt48AxzXsho+m/YXHCJ/Gw90rFI30i4jlyj9zoWVOI6eFyCeBwyoCy7oPZVU
         a0ssfJNoT1qffmVsv2LEUD4qFQ1CCa1AslYlb2jwHmZToypWN+EOZChaHPLa7OfN6jx/
         NgX0r5WgFWu93xMo1lmNEE1SstQg6XBIXhvVkkZsts8VjnILwcP8dWdWmcRc4qyNj5zs
         7vDaaOzpRJAFeLNF5PxBqrqm/T9eG73HCUZZ33GRqWZZ8sd3NzbIq+KExGHVc3LPnhx4
         AHuw==
X-Forwarded-Encrypted: i=1; AJvYcCUbaI/IOMK16zVjHNsQQTHHIxqAI9keDRMsHQUfhjbJL/kH4irLBMij/+TBpCm7TBknkhRylHvCYCyDawM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdwL6hn+WZFBvs0ufIq55BW2HSMVbwrYj7Jwvj/WVJWd2R345R
	c6t8E37BWT+y3ktU5cnV9srRK6o3zTJOPT3g6FUMtqKc3CeFyWopOefx
X-Gm-Gg: ASbGnctoC3AXF5Ao/vJeOKAbO4TEG945WToFGmecbQ/J8CRXXjbvMRW0miHVlUVxNSw
	HuMxxUIdRu2oa5Ky9+SXJOx8NkdnqwbBWynhevW+8yEvPlmCb5BxqoaV6U7F0s5X8ZY87wdZRHV
	urQ9d2NWI3L6LgDHvupthkfkoYKPgXfTMKXOwiwNO6bHPWZNwusux+2kbt7DPtJW1fIEh2GkwQA
	i8sAmVo0pT5sGujA76kfzGtdrDzoJg4PJHcELJwuy/3ZuBi0RHPUzmw7Y3POncuGgz/hsBP1h9N
	Pv1aa7qhkwXI29i5Nlf2g0dVMaIxqBXwI2TuxCL4ukd/ZWyFIGq4FOhod8ksyM7J
X-Google-Smtp-Source: AGHT+IHiJzE7KyvRIHrRSU+sorY+syXUuDJVU/hS8oEKl6EdHGkEiBm1A0zvKqlv0HxbU5qHaF/JRA==
X-Received: by 2002:a05:6000:310a:b0:3a4:dfc2:2a3e with SMTP id ffacd0b85a97d-3a4f7a6d223mr3555270f8f.39.1748621675123;
        Fri, 30 May 2025 09:14:35 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:cd68::171c? ([2001:871:22a:cd68::171c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8013e0esm21418975e9.39.2025.05.30.09.14.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 09:14:34 -0700 (PDT)
Message-ID: <4d0a5cd9-c7e3-47d5-a55e-a4f234463e3e@gmail.com>
Date: Fri, 30 May 2025 18:14:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] rust: types: support fallible PinInit types in
 Opaque::pin_init
To: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org,
 rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-2-dakr@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250530142447.166524-2-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.25 4:24 PM, Danilo Krummrich wrote:
> Currently, Opaque::pin_init only supports infallible PinInit
> implementations, i.e. impl PinInit<T, Infallible>.
> 
> This has been sufficient so far, since users such as Revocable do not
> support fallibility.
> 
> Since this is about to change, make Opaque::pin_init() generic over the
> error type E.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---

Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>

>  rust/kernel/types.rs | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 22985b6f6982..75c99d6facf9 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -354,13 +354,13 @@ pub const fn zeroed() -> Self {
>      }
>  
>      /// Create an opaque pin-initializer from the given pin-initializer.
> -    pub fn pin_init(slot: impl PinInit<T>) -> impl PinInit<Self> {
> -        Self::ffi_init(|ptr: *mut T| {
> +    pub fn pin_init<E>(slot: impl PinInit<T, E>) -> impl PinInit<Self, E> {
> +        Self::try_ffi_init(|ptr: *mut T| -> Result<(), E> {
>              // SAFETY:
>              //   - `ptr` is a valid pointer to uninitialized memory,
> -            //   - `slot` is not accessed on error; the call is infallible,
> +            //   - `slot` is not accessed on error,
>              //   - `slot` is pinned in memory.
> -            let _ = unsafe { PinInit::<T>::__pinned_init(slot, ptr) };
> +            unsafe { PinInit::<T, E>::__pinned_init(slot, ptr) }
>          })
>      }
>  

