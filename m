Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE4619005E;
	Mon, 16 Jun 2025 19:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750103887; cv=none; b=gsDy1uuBQU52UQF1LCO+3x90bavNu3H7vR2PTqhspkLmiAkmLJKw0kFxR9w4/k8SiiDsrDz3bt4rjgcnlKHCvtltoYiiRE2zMjAUC0VkO3gb63Ymw9flm4YP4t0TyWc3t6jiH4gP56nQC5qppEYWtHQgtQL/oWvpqB021oP55dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750103887; c=relaxed/simple;
	bh=/feiPjn6IPr98wPlkq1IKxaO9WeaHLAyI5gM4wxjWCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+jKcazawD10KdlbsAFe2Qex60hfhJccE81ROYD6NIkMle/Yr6FVOD0HOya23O8KBijKlB0Z0d9wo9m0ondJziwgOaDnjjiD8/9btR0MsVD87/YOf6T6NWNRAhHuW5HkNE1GLiUA6SUuG40Qq0KSbkmolRdUmLclnCArLXP2/NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbWDr1Zw; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbWDr1Zw"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-53115af5fa8so195258e0c.0;
        Mon, 16 Jun 2025 12:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750103885; x=1750708685; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E6N+5HeaZDWj1fZ4xreqtfbeyVKfhN6SMpmQSO+XUGw=;
        b=RbWDr1Zw6afn+TfSasY1BfBcao12TNF+wtGjqiWKNMw9QqpHta4MBI70RVZHKW1ZDg
         fKQLygxZz7TaNzhAnzkLKBKjbUtz9EpW+Ril6gWcjcu8lQiU121EY27ETqUVpWAj5mxX
         wfZNe+/qM63BglEwyktskN+sc0aZYTXFRjUMg90EsPvV8FulL7Oe7B321KR+VhL8u29A
         UnJ7YYpURYYRyguC743dmOrg6/qe33sQmhrqLx7f9swxweDrDXQ1uAO7cA6grncbfqxZ
         XGPCQbTHkKZBrOOcKb9tKvTDEkqI9vL/n8ADl8S3cGAvKtAn1Y34v/tmAc8d7MgJ71fI
         EJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750103885; x=1750708685;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6N+5HeaZDWj1fZ4xreqtfbeyVKfhN6SMpmQSO+XUGw=;
        b=OTD2BltaNhRQuLM9/mbUHLmPUU/PqPVK4kWITfqWqB/CmOlGnYVyrBC8xU2bAm061j
         g6lCUDO3Jz/lthXpzhHXK99t5cXdkb7Gny9+KPafL/X+xfPWblUiicc5/Bni+QEGVN+K
         3gv5/TQK7KWj2TGiVd3tpQKegXPVfnkK4vclGAOAJpaPcMftyHDYNr9ZnSoadsqGqP85
         FefWB0Ig8CPtOkaBeRnElgbE8wrdjSyZxbjb4sKC9MY99iPfzfPtMFP+tcH7Xo8jygV2
         GS6LqoO+pF1nCm+92Bt6qJTtsBd9Jn6NIg9lH9+prkKPEnAwLcHYcE0PHX5kh8nFGyNZ
         S20w==
X-Forwarded-Encrypted: i=1; AJvYcCUWK0aRYlPBZDqN+sswJuRvXmmqm8IsYH/WALPLE7coXC6htwCgOLwVOiIouTxKG7u0L8yCuLAjotuJ6dQ=@vger.kernel.org, AJvYcCVG2S+zahFgw2AirrxbMo7huLHPdSk7+ym4/UIrvLuufxTUy2/v0N2SZdmjP8w9pEVJtwLBih02B354GK1epxA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkzh28+QAg5WMiZx2BQemMkhMP4FBCgrKT14SgOga01mpQAT2o
	XiFSWD6WJt5nbDc9m4B9Fpn2v2KRowZCaV8f83OlRF6gbNSJWYXgttOzHWnbCSXHqeAvNH4cS7Q
	zWXfkBklT0A8K21g0Qd5I0k2/A/iTAgE=
X-Gm-Gg: ASbGncv4zZqG/IrCU9rI3VhCpARWCZAaURFVYFPYpdvBBsWrCGsarHxD7/4Ji+HYni6
	c+zXlUh45QxM5XzC7qcAVWSN7HczE6d5eoATuVY8Du0c6neNNg8aZDjVn8Zl2mt9jYKhLRrZcYK
	wlkoSvPGgqZni10KrDEfECTEZmgI9YPv2+MBqGZF2l7y9YMF4LDNHs978=
X-Google-Smtp-Source: AGHT+IFJcwHRC8VLNp/T5fCIjle4tPDHMELrWRQNXJhzRfFrjjbwfqaXacj4kqpHjEMPtfN0zBr330MfOYCPsXIBHMo=
X-Received: by 2002:a05:6102:1626:b0:4dd:b34f:2d4f with SMTP id
 ada2fe7eead31-4e96c0e3e21mr300739137.2.1750103885024; Mon, 16 Jun 2025
 12:58:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250615072042.133290-1-christiansantoslima21@gmail.com> <DANSZ6Q476EC.3GY00K717QVUL@nvidia.com>
In-Reply-To: <DANSZ6Q476EC.3GY00K717QVUL@nvidia.com>
From: Christian <christiansantoslima21@gmail.com>
Date: Mon, 16 Jun 2025 16:57:54 -0300
X-Gm-Features: AX0GCFs7MaqoIo8ZRVcci-6aW2tboFVMxk3YbQcY6v2wsL4n7A6Rt2ZpSxUFB_I
Message-ID: <CABm2a9cs+pTT49GW28QViwaK-VT3=Y+sV209-Lk5S_YxEnXv+Q@mail.gmail.com>
Subject: Re: [PATCH v7] rust: transmute: Add methods for FromBytes trait
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ~lkcamp/patches@lists.sr.ht, 
	richard120310@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi, Alexandre.

> This test won't build unless you add a
>
>     /// use kernel::transmute::FromBytes;
>
> here.

My bad, I completely forgot about it.

> I asked this in the previous revision [1] but didn't get a reply: why aren't we
> defining this as the default implementations for `FromBytes`, since must users
> will want to do exactly this anyway? I tried to do it and it failed because it
> only works if `Self` is `Sized`, and we cannot conditionally implement a
> default method of a trait.

For my part, I didn't answer your question because, IMO, I don't
really understand much of the problem and, as was pointed out before,
the implementation is incomplete, I think we're now reaching the end.

> We can, however, use a proxy trait that provides an implementation of
> `FromBytes` for any type that is `Sized`:
>
>     pub unsafe trait FromBytesSized: Sized {}
>
>     unsafe impl<T> FromBytes for T
>     where
>         T: FromBytesSized,
>     {
>         fn from_bytes(bytes: &[u8]) -> Option<&Self> {
>             if bytes.len() == core::mem::size_of::<Self>()
>                 && (bytes.as_ptr() as usize) % core::mem::align_of::<Self>() == 0
>             {
>                 let slice_ptr = bytes.as_ptr().cast::<Self>();
>                 unsafe { Some(&*slice_ptr) }
>             } else {
>                 None
>             }
>         }
>
>         fn from_mut_bytes(bytes: &mut [u8]) -> Option<&mut Self>
>         where
>             Self: AsBytes,
>         {
>             if bytes.len() == core::mem::size_of::<Self>()
>                 && (bytes.as_mut_ptr() as usize) % core::mem::align_of::<Self>() == 0
>             {
>                 let slice_ptr = bytes.as_mut_ptr().cast::<Self>();
>                 unsafe { Some(&mut *slice_ptr) }
>             } else {
>                 None
>             }
>         }
>     }
>
> You can then implement `FromBytesSized` for all the types given to
> `impl_frombytes!`.
>
> The main benefit over the `impl_frombytes!` macro is that `FromBytesSized` is
> public, and external users can just implement it on their types without having
> to provide implementations for `from_bytes` and `from_mut_bytes` which would in
> all likelihood be identical to the ones of `impl_frombytes!` anyway. And if
> they need something different, they can always implement `FromBytes` directly.
>
> For instance, the failing tests in `dma.rs` that I mentioned above can be fixed
> by making them implement `FromBytesSized` instead of `FromBytes`.

Hmm... I can change the implementation for this, but I think the idea
behind `FromBytes` and `AsBytes` is that they are the default
implementation and other parts adapt to them. Also, in the case of
Slices, since we'll use only `Sized` types, do we just abort the
conversion for them? If the maintainers are ok, I don't mind tho.

Thanks,
Christian
