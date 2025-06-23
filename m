Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A0A77111
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750678928; cv=none; b=hVYaBeMzzsa+7l8IANkETR/4rDICtoax5o8tSYwMf77qDw1bI0RWodO05tMw5zJw9grkMVuWFQDRQrdUlZoNeTPl2TgYTpanOJO9cG1K5rYHHSMxg79bXWxlfCcZGYbGnILg9Gv/b8R6/ZEoUUTIHz+y1Dm2UsmnqeeHRp3/AIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750678928; c=relaxed/simple;
	bh=JWkNAYIXXxAvHocsXw3a5RBhWI73mua+uVzpAKrzxQo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JU1la3BamJ268umd3ZlidtOCJ4Z7Wd/sB5lxor5oPbKiec5mpTbocTTGorvK3ewajYPRSyDG4bhRt+CWmWDN0GaxW8i7KplAoaIVVQIEYT9AusFvpL+Ny301pklUcDou+e3/fIUrw6CpUDg49pq/+43uEE05DS9gm4ACotHKCKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TjPZc1tK; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TjPZc1tK"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-450eaae2934so35108405e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 04:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750678925; x=1751283725; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gOakrre7l7gSs8tnftFg1umC3O4hex3jEXhe5bAXm4c=;
        b=TjPZc1tKJMPQH5NNZcbKfcZqaFd8c5WwED8IzY3MsCAQME4R1vaAyUZYRYV8UEzcfY
         MHbw4M9o13668sXiaTSavIN976kUSPCXSw1L2BFJUOMGWMie0zCE2wslNClSEN9zx3XE
         FeHBCj3ghC3uqP2qMo4lxRMGl8jFbQSt8Vy4KYBe+9fIyvDKY2CW4yz44lrMwHB7uIq+
         R9jqnf/D4BFfKA0Rc2QceSVYm1Atdugl1RoqbmQ73hX4aXQsDX9XgJTOt9GnVAjvcbJd
         Zwqe/0Y1mXzsZGUBPbcoF/jwVlI/DzttLtyxdIfctC0SITgz9hE59RZ7eBRxxV7zIYbM
         Oq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750678925; x=1751283725;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gOakrre7l7gSs8tnftFg1umC3O4hex3jEXhe5bAXm4c=;
        b=NrrZ9NoYyDHsGTfrT8okgxEI7DADcQdusZFk8ilS4cax/FtqqzJ60Iw9o3SJE/Nf60
         fbH2qAMmfptPZKYcpxmb+5/FfVKMaT9xdIdRt4LBFXW7N8vcqOmBqbaR9GXbcXPlNeRF
         dzwyGIBh5LscMikpnqR6iVfqPFvgYJ8D7vDDYaxLUtjcckNl4FDqGoiPEdxua0ZsCFgH
         cShLshNMziDhdAptVgtU6DQddFhGEdA5qsPWGQFsRixWduEM7smmGdDygty+Gm6+s3ub
         xJOMBpmBnABmxOBiZu5nNbymvjriRlQmM2Xc3/XZqk768Ud9Sy5Dt5XlL4WB+2ReVvFA
         klaw==
X-Forwarded-Encrypted: i=1; AJvYcCWv3XQMKW3e+FNfVhqMzHIjLl8+ll3gixBcNThoE5TD8FewIXs/xL2LG0sNVM0dUJZGsG+Y2Ag+UYIuOhw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcPsCPdD0ITor6yYbjasXzWvGF3Eol5Pvvk9AOMwfjWQr8STQM
	uEmr29TZhlNB8za6j3o5YSt34BMWDhbtg4d4UM8+0dGzW5VaBO6h8pbGKn4EtH1Wswji0YtKMsK
	hLu38KAJjym5bcgWong==
X-Google-Smtp-Source: AGHT+IFLgU2zCTWelcLduERfWArl79+0ODmzTBoOgn9WbMCJ/VeopIZFCpbEQxpUShrPw9S7d8IZRIEelvQI5Xg=
X-Received: from wmbfs6.prod.google.com ([2002:a05:600c:3f86:b0:453:ccf:1528])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b14:b0:453:a88:d509 with SMTP id 5b1f17b1804b1-453659ca92cmr134236355e9.10.1750678925797;
 Mon, 23 Jun 2025 04:42:05 -0700 (PDT)
Date: Mon, 23 Jun 2025 11:42:03 +0000
In-Reply-To: <20250620-num-v1-2-7ec3d3fb06c9@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com> <20250620-num-v1-2-7ec3d3fb06c9@nvidia.com>
Message-ID: <aFk9i71j2rKcC6KL@google.com>
Subject: Re: [PATCH 2/3] rust: num: add the `last_set_bit` operation
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jun 20, 2025 at 10:14:52PM +0900, Alexandre Courbot wrote:
> Add an equivalent to the `fls` (Find Last Set bit) C function to Rust
> unsigned types.
> 
> It is to be first used by the nova-core driver.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  rust/kernel/num.rs | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
> index 6ecff037893dd25420a6369ea0cd6adbe3460b29..95766201a7cf208989f37ecbc6d54d264385a754 100644
> --- a/rust/kernel/num.rs
> +++ b/rust/kernel/num.rs
> @@ -161,3 +161,41 @@ pub const fn align_up(self, value: $t) -> $t {
>  }
>  
>  power_of_two_impl!(usize, u8, u16, u32, u64, u128);
> +
> +macro_rules! impl_last_set_bit {
> +    ($($t:ty),+) => {
> +        $(
> +            ::kernel::macros::paste! {

I think this would read slightly nicer with the paste! invocation on the
outer scope.

$(::kernel::macros::paste! {
    ...
})+

> +            /// Last Set Bit: return the 1-based index of the last (i.e. most significant) set bit
> +            /// in `v`.
> +            ///
> +            /// Equivalent to the C `fls` function.
> +            ///
> +            /// # Examples
> +            ///
> +            /// ```
> +            #[doc = concat!("use kernel::num::last_set_bit_", stringify!($t), ";")]
> +            ///
> +            #[doc = concat!("assert_eq!(last_set_bit_", stringify!($t), "(0x0), 0);")]
> +            #[doc = concat!("assert_eq!(last_set_bit_", stringify!($t), "(0x1), 1);")]
> +            #[doc = concat!("assert_eq!(last_set_bit_", stringify!($t), "(0x10), 5);")]
> +            #[doc = concat!("assert_eq!(last_set_bit_", stringify!($t), "(0x1f), 5);")]
> +            #[doc = concat!(
> +                "assert_eq!(last_set_bit_",
> +                stringify!($t),
> +                "(",
> +                stringify!($t),
> +                "::MAX), ",
> +                stringify!($t), "::BITS);"
> +            )]
> +            /// ```
> +            #[inline(always)]
> +            pub const fn [<last_set_bit_ $t>](v: $t) -> u32 {
> +                $t::BITS - v.leading_zeros()
> +            }
> +            }
> +        )+
> +    };
> +}
> +
> +impl_last_set_bit!(usize, u8, u16, u32, u64, u128);
> 
> -- 
> 2.49.0
> 
