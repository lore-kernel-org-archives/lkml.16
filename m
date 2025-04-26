Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5F31F8AF8;
	Sat, 26 Apr 2025 10:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745664517; cv=none; b=OLfDdhO9R8QiAFKL/NWdYW2I7nTOlPVpxyRnNaD79tGmuRqS43F0+3B9cKgwk/UndCdIOf/z6/RP2AMmAiWrUrqXl10f8oWJosTQCJ7yq2uA8BGt7bZ8dXUNdMe31dqAOJw2rjGRzPh04azIBu+dcXv67fQocOVyY/dby69ywxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745664517; c=relaxed/simple;
	bh=pKTDCK4cY26jRil8CWKoDTVuO0+ZKNDD8/E881y5Xes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uvx9xqo17lAL5WmnJP5i+F52KwYe3lSYETYFiM54XNnor+/dt126plLJufO80wGiUrjQH3FhidmebmpZIng++tNwBtPHtGIbo+vMECZm9PInlblOTt1u/4h/18HKHaK27punUzBcMlB5KW9aseqoZBmSKJqNAdfhAOdEmdtUE0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8+O4Kx1; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8+O4Kx1"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so19548505e9.2;
        Sat, 26 Apr 2025 03:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745664513; x=1746269313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1DXo9j8925u2hJh5R0nY4xsxuRuRQj8ll0SgQyWiY5c=;
        b=E8+O4Kx1NiSUdI9QT8iXHRDXMM4JYQYQq9UG8YGLmf6YqR5C1PwS+4i56YThg5S3//
         RvvNhY/DI/EGH/e64twSAcrOu0kSRAjV60X5PMsHZvhxSKdDlDQna/25vJfhLAYmuyBi
         qYAQzX5AlnpKRwoF1DmO4yLM+ys+QzGrVK5QMh7lXZ+urS+WC7n6xu4PG/cioDuihFTq
         tVnI4eH480LPFjLZOAg0S4M9kJFFp75tBMQv7bRnQ0FaOoAtqudYGLWNtWxiWwNH2dMn
         1+nUPvftoxyi20wkDShgTafLeEoTJk0RsoVfWc9UDsigf4QeXmaOV48EudGOd5xUH5UT
         CRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745664513; x=1746269313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1DXo9j8925u2hJh5R0nY4xsxuRuRQj8ll0SgQyWiY5c=;
        b=RELfWIXZrzL6kv1UibxMg7DvcSZycQpGuGB+zab0+K/5wSIQgbkIiipPmqr1TmDKnd
         fWzT6yTr/FbCFQLzWsz8IEHTvv2pN6GHZ+kZGeP+ujpgX+WzGLe8ZqkFEjOjDwdl6NCU
         /CmqjrKtC67YvSUY9s+1cwBHv5T797TzF/8ZsHlG9BO5ZJXPtz4hJjOAtfnNw2oXAO+t
         CStV5xrkcifzznN0YcS4HcjcJEIuoQVwRUE69K2TXmxBST1eOow+t3XPyTMS/AdMMbVU
         fbau1Yl9BPyLpbwPutTe3h7TcoIeD0G1EdLJnaX9FJ9kTywuyYIomeiOraJLE6+TMkTO
         GFFg==
X-Forwarded-Encrypted: i=1; AJvYcCUDQgrn7PWITjlV3cGmMDINph2r3iSYNevPEXGQ7A7LSpNHgrC/G+bYwOdxjKlsKKH0bihzp3NSVukeuNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOS4QpojA3AHw3+XVx56jv8xAFW8zPU0D9DGBfjHXLlzwJm1y4
	bexSV8Bv96NzIRMIqBpzFp+R7p33qJd93EdRcdYw0t1u2iRLuhAa
X-Gm-Gg: ASbGnct8R+/E3vSwfe+gab8h2ovZzvKI2u8Yy+DP2XkNEGzF422WeF3A2D3O7hbbtvy
	1f4112PUSi+KJJcxw+iMVWn49UZkCMukgBmECucYnTeHeFr/4DV+PB+2Sj83mymXx53PMlOW/OM
	DgmEQ+Qfzw+q0aOy0XXeJO704drD1dBVx009Tv6zBk+fI5icIhKu7NF3LCsdUQNi0HD4YW+PlEk
	R037MOogYOhGH+/LL/oR/cBfNO2u9ZKJmEqyYwqkmkgXyEng6LbJrnGr5ZqDLLv9EKN8yQE4AvZ
	eAWuvN1NcwgzXTm2qcjo4KdzCwWs/hs2+XT1Hz1nbtpXNTueYbh0Ow==
X-Google-Smtp-Source: AGHT+IHR27TaJXcIDk87X9O4X9rTf8eBIEdWKyhhRifdVmAv7cVmRMYL/veddYC5/nrZtLKd32NVxw==
X-Received: by 2002:a05:600c:a363:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-440a66aaf09mr41548825e9.25.1745664513464;
        Sat, 26 Apr 2025 03:48:33 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a530324dsm54255275e9.10.2025.04.26.03.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 03:48:33 -0700 (PDT)
Message-ID: <fd150149-e7d3-4b09-b6e2-a633edda5791@gmail.com>
Date: Sat, 26 Apr 2025 12:48:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rust: pin-init: fix typos
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250426083901.13289-1-benno.lossin@proton.me>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250426083901.13289-1-benno.lossin@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.25 10:39 AM, Benno Lossin wrote:
> Correct two typos in the `Wrapper::pin_init` documentation.
> 
> Link: https://github.com/Rust-for-Linux/pin-init/pull/48/commits/fd0bf5e244b685188dc642fc4a0bd3f042468fdb
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> ---
> Second round of pin-init syncs for v6.16. Depends on
> 
>     https://lore.kernel.org/all/20250421221728.528089-1-benno.lossin@proton.me
> ---
>  rust/pin-init/src/lib.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
> index 05a0cd6ad8f4..b5a295effd9c 100644
> --- a/rust/pin-init/src/lib.rs
> +++ b/rust/pin-init/src/lib.rs
> @@ -1580,7 +1580,7 @@ unsafe impl<$first: Zeroable, $($t: Zeroable),*> Zeroable for ($first, $($t),*)
>  /// });
>  /// ```
>  pub trait Wrapper<T> {
> -    /// Create an pin-initializer for a [`Self`] containing `T` form the `value_init` initializer.
> +    /// Creates an pin-initializer for a [`Self`] containing `T` from the `value_init` initializer.
>      fn pin_init<E>(value_init: impl PinInit<T, E>) -> impl PinInit<Self, E>;
>  }
>  
> 
> base-commit: 39051adb070432b283e6c11b2b24937281b9f97f

Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>

