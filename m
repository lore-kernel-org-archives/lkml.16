Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA69D1B415F;
	Sat, 26 Apr 2025 11:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745667383; cv=none; b=OuY7pzfU5TSusfYk2ci8VZCTjd0RtWgSs7mpXtjgM+rTg7+523t4/c6q/rqgWovHE/q0WylaMHE41/KZX2S+2jVkgEYcXwM84U+pRaCKb+KgLlhLD2RynU5XCR0IesFLcUnd+7DAyCpVsLU4gt89s/28o+oqwXwPveCZvz4ZfFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745667383; c=relaxed/simple;
	bh=n/4iha95Zbcp86peH449f0fki/aJK2xFRxxSlsPap44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvWkK7hrmPkBFtEA58YoAl6jWOaepkPViS2/jKqW7RU2EDjesP1hO0IUsYY/UEuvVqAIvyCv9yoVXlH2fpJbeTBEpCW7CSYnbAbH/ThkXnrC14K5xX8SFpmAVuRoxYU7aaKbpxer/HZ6haI24FK/jIDpmNfwY1zhiVBmHwk33zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCNHa4or; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCNHa4or"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso17446085e9.3;
        Sat, 26 Apr 2025 04:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745667380; x=1746272180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0/VMm3QuljiLlffJxVJ6L4JY1qtpOC7HK9j5X/vctqU=;
        b=NCNHa4orjC4dPApR5yT8QXniKvWLevaFvqx3d3RcZhNnTj6OTp9H60BGWWvdzfqIHe
         V73Vnt5JuOM8UXLSoJCsKErnSDYHFh1HhFP3WTolOOfx92o+MnyCRosnb3mKi8YKv9kE
         J6RxtI7rH6EhgWAYda1YYxJwNA4oB9OBEXm+isO2CuHL2MwABgKEk3nn+WsqJMhYbLMI
         1AJGHFOEoULTzrvoPS6DznLyVfbMGS9oad2v1wOtT/j1EGzYXozIEB2MaxRIG20EzxHy
         dj76sAHB2xs962M0fm8wVzLjgx458+yvo2+NSQCLH5dNFStcZsQyWcRsBTOewQcvu1T2
         Yk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745667380; x=1746272180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0/VMm3QuljiLlffJxVJ6L4JY1qtpOC7HK9j5X/vctqU=;
        b=niLAxac5U19I97snSVcoWkmVEcy7WqQUFvi9mcqEVckujqT+/BpNEcZWRNHaD8aOKY
         1d/Q3WDkbfohwNEz1ClPqTycLyZ5mPtyss/LAyIFeY2PpID+EMRu3pjNhtwpPheU2/P+
         9PWSg9qUEaFaGjeiGsfxQhGV7qdA8/fuf84drZB4CzHh3rqc/oALjCDX/94J1r7Qwv/+
         Yat59KYRmIJg47quNzILQAJ9NAlvOSz8/+Xg6FkIQCENUW70Ri3ckpXq2JmlAL+3H2ML
         Tpampczq+S5F59si+x23CvekIggTtkKpXxPrJxOmfvt72lqhCJx4C5LzSuH2573TNedG
         ph6g==
X-Forwarded-Encrypted: i=1; AJvYcCUxi+b9b3jX3vTrf/lcO6xOC5S+LL9y7Vu1W/StqJ7cvTQ9sQXvToHLL9Agmgf2dffaMlNoCxpbQ5FID8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwfvttnhbyoaTZvFFF8QyNl20EVOThsYF356KwyMP4DC361Wbd
	pTRQ2b3oPH1MjSXuaUJJWXFkKajXgu+4r3BAYtq2S/dxjii6ysuB
X-Gm-Gg: ASbGncsTjRryMAb5Wim+z0KUX6c3NPvduCuzvhTbiyJM/mfje1OwkpyVrtZaBaAKwI2
	D1PcIC2VpXJGqGfVk9FqxWlNGvMV0uK6QFM8cUfcQdu+vHb5ioPzbD/Od2NXr3gpWOoCrnnuRPf
	m0eqwEL8mRxX96gYx0qrmD0BiaU5qs+MQqT+Y1MUhyXG7C5ruJhWqLLWIERjggV0k6B7SEK1VTu
	sHXqMImCPYU/o9xDH0Y8PRJ5uMYLIpYEsAibJ86hkKOTT/Pqm4Bqi2FBWafPJ7fJgw+larIEi/z
	v5JOOBx7C5wQQvEoUcr4p+VaUTCA7JkO1zm0ZDLZ5DbjfJjFhbt4RA==
X-Google-Smtp-Source: AGHT+IFQNbhBheWfvqI5jKGbv4tsqpTFU/tqF6Ou4LGxW4bdRwrVniQ+n7zLzMppUST3EmrCgMVW/Q==
X-Received: by 2002:a05:600d:1:b0:43d:526:e0ce with SMTP id 5b1f17b1804b1-440aa5bd66amr34264245e9.21.1745667380022;
        Sat, 26 Apr 2025 04:36:20 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5310ad2sm56664515e9.21.2025.04.26.04.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 04:36:19 -0700 (PDT)
Message-ID: <3d214f39-e529-45ce-b6f7-9dd50d0e119c@gmail.com>
Date: Sat, 26 Apr 2025 13:36:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rust: pin-init: improve documentation for `Zeroable`
 derive macros
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250426083901.13289-1-benno.lossin@proton.me>
 <20250426083901.13289-2-benno.lossin@proton.me>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250426083901.13289-2-benno.lossin@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.25 10:39 AM, Benno Lossin wrote:
> Specify that both `MaybeZeroable` and `Zeroable` work on `union`s. Add a
> doc example for a union. Also include an example with visibility on the
> field.
> 
> Link: https://github.com/Rust-for-Linux/pin-init/pull/48/commits/ab0985a0e08df06c60a32ca5888f74adcc2c1cf3
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> ---
> Also see the compile-fail & macro expansion tests added by this commit
> (not included in the kernel, since the test files are only upstream):
> 
>     https://github.com/Rust-for-Linux/pin-init/pull/48/commits/278070d12b41f0fca1b0d6dff6c5f38f3cf46044
> ---

Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>

