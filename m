Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC19276045;
	Thu,  5 Jun 2025 17:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749143402; cv=none; b=fTFdAwqMD+h2cGIiyX46sS+dEqprcII+WRM5VQrNKHgQ1IKRPIwLP2Mh5R/4mB1dLYjb5OnC9ed2f7NeD8ucSPual+1X+C1XhZPHmyFQA8WrtUGiOLIpkduLBdTv0azYz9lONX1yHvRGZksHGEownJsH/46Q18lTT2586CCDYQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749143402; c=relaxed/simple;
	bh=auMUuETD4ITpFk5SP4iCYcakWo0OQqLMaKASDaIUUvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AOb5g5VLhqbzJ5tm4N+zGAu2U6DHhvtnzKPfa9RlM51jLTWsISecQrsTxmOTt6b6q21gs3GnWtlixeTE8w8Lmh9oBdI3cgRPGL+jvk5TBtYTrPknfJzITKjehL2IpPsnyGfFVa4i6sZeQLMBFGIQXJ1NhnJkCuR2OPKOxcEke3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPu19Se9; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPu19Se9"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad55d6aeb07so237388466b.0;
        Thu, 05 Jun 2025 10:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749143399; x=1749748199; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TxfFzgtYBb4ft4C6Eic6I40ofbkTrFmHF3/vpqaw8aU=;
        b=kPu19Se9cCW88x7FhAa1liU3l8YB12SmhnR1bUaQxrYIPZmlCLrz1ACAPEZPG3Y6jX
         InbL+WkrWg4ADkx97NUSsXuprvHwXwmJugDcCeJSKPshWPQK/16KOWaPW+o37grs9NPX
         CTkyz93GVG8CvgfkCRIzcr3SvJ2HqjU0ggbVTlYhy01dGiljEzL/X1t+S7q3a6zG0j/D
         YeippREMxnSJn9nMvCDvYnYW0aH4CiCCIOWE5EUB+132RxLoOtrPTLawK7Ewt4B3XbL9
         Aokqg82PNOiBzPQtyv8ao1ezwRaeASSC3I/1MsFGXuSY38wyHEPLyBtEG86nXGSsEsdo
         65Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749143399; x=1749748199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TxfFzgtYBb4ft4C6Eic6I40ofbkTrFmHF3/vpqaw8aU=;
        b=Nm9rEoNCD1/l7eg1Ne8dUIr7OGlmjXI1Me3YCulhhNuWXutRPGOGE1eFGNX3KmLfMn
         Rdo6t6lLvSU/sTzMc6FdqvhoFs/ADy+E2lWjBEc7JAEPKedBkQaYsUSmzPbBqJKLI0wN
         DdeWOGMHeQF6ZQOiQQpygpVzowfwwiliKmDeIQx4f5WcyL6UYu3Jmn91vOnQAVvQAqQD
         pVr4yzxWmrwR2zn1PVPh76NxZjPeNT1Lo1nSYvD8RczIBa8wdoCV3D5EjfqL3c+Qsbe0
         KyBcL9sU0xJvANa0OeOBoJrWWyYEV35b5TI5htm9BfolIPOhjw7mgEqsenaaXArsFrDK
         0Hug==
X-Forwarded-Encrypted: i=1; AJvYcCW3F+MTQ+BaJpOPzJHnCZmwsixIPiZReLt1UhGp8TvxdrN8Z5zdaZewcj1bK7XctSusGoNqNuULAvK7C9s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG5KjMq2xdy9swxRsL25W9uhkLsb8gx3fzoYmeBGmS9s46Q7sc
	zSB+i7pjcNzfjsH/adwbnMMk5bwDUSDtZEBzcsNAkOaxrV1c0vJP2Oze
X-Gm-Gg: ASbGncsWESo3FB+RZ3vHrhaj3vC3e1J4tFchZSWVkiEfqDo3GdP9+hg5rMRYkD5UBwS
	YHWdjv18wGY6/mJVAWakPcA24Vuoy0j2ccaWGSqiEFE5w2OXwtMLm/nu9n2UE74xnK3a8nLfLzy
	e3yqjcD9oXwBO4PxfjOt2A15B9s5aNc5aVNeD0J0Br9IWrWkVGwcJbSeYFczaTfv3tSw5ZuvXpJ
	wit0rq3lQVjTphCITbZvZPOG5nxZSDkBp2hTL78yT3HdAuK11Ok2X+k6zDbqL/qA6U0nMIBg4dA
	XlKyKDDia1a4TERsjOaPxLF9tNfSIOjp+2R6imFzu6vEpTRvxibAnjEabSr+ZFyi1xgzs+M=
X-Google-Smtp-Source: AGHT+IEsVOA0auJUk6exuoLdSdDwFOdG16tI4HMOQvczbyt6qahPlfzvc6AhMJLJW1WcX8/cbwF+CA==
X-Received: by 2002:a17:906:dc8e:b0:ad8:ac7e:eeb4 with SMTP id a640c23a62f3a-addf8ebb59emr683586466b.37.1749143397574;
        Thu, 05 Jun 2025 10:09:57 -0700 (PDT)
Received: from [10.5.1.144] ([193.170.134.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5dd04537sm1303953766b.92.2025.06.05.10.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 10:09:57 -0700 (PDT)
Message-ID: <c42f77c3-d263-43e4-ab37-856c2398c5e1@gmail.com>
Date: Thu, 5 Jun 2025 19:09:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: pin-init: examples, tests: use `ignore` instead of
 conditionally compiling tests
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250605155258.573391-1-lossin@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250605155258.573391-1-lossin@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.25 5:52 PM, Benno Lossin wrote:
> Change `#[cfg(cond)]` to `#[cfg_attr(not(cond), ignore)]` on tests.
> 
> Ignoring tests instead of disabling them still makes them appear in the
> test list, but with `ignored`. It also still compiles the code in those
> cases.
> 
> Some tests still need to be ignore, because they use types that are not
> present when the condition is false. For example the condition is
> `feature = std` and then it uses `std::thread::Thread`.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://lore.kernel.org/all/aDC9y829vZZBzZ2p@google.com
> Link: https://github.com/Rust-for-Linux/pin-init/pull/58/commits/b004dd8e64d4cbe219a4eff0d25f0a5f5bc750ca
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---

Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>

> 
> Depends on https://lore.kernel.org/all/20250523125424.192843-3-lossin@kernel.org
> 
> ---
>  rust/pin-init/examples/pthread_mutex.rs | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/pin-init/examples/pthread_mutex.rs b/rust/pin-init/examples/pthread_mutex.rs
> index 6c4d18238956..49b004c8c137 100644
> --- a/rust/pin-init/examples/pthread_mutex.rs
> +++ b/rust/pin-init/examples/pthread_mutex.rs
> @@ -139,7 +139,8 @@ fn deref_mut(&mut self) -> &mut Self::Target {
>      }
>  }
>  
> -#[cfg_attr(all(test, not(miri)), test)]
> +#[cfg_attr(test, test)]
> +#[cfg_attr(all(test, miri), ignore)]
>  fn main() {
>      #[cfg(all(any(feature = "std", feature = "alloc"), not(windows)))]
>      {
> 
> base-commit: ae8b3a83fb9de394f609035041cd7a668fda2ab3
> prerequisite-patch-id: 8d7ade67c2e5189bf8a2c91253d925e25744cba5
> prerequisite-patch-id: 0ebbd4a86bebeff23257870db92a1b0fe017c481
> prerequisite-patch-id: 1437fc7adeff6e13abd433594da923272b9388bf

