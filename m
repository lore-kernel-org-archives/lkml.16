Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB812D3A75
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362134; cv=none; b=AzfjT5JrFUM2dHHA2BA7TYbq+xWWNkW/PCSF+n0/+kIh5d5fdJESupNk8fY689DSanRkWdsgQB0kmGCQ7bMaArvSLPWLq3CfCLl3+xvwylXUg77Z2ur551mWkvjAJtxTifddK4AqwOTy5bwd2mt/qhtilh9zKlH33DRr3Cv9pcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362134; c=relaxed/simple;
	bh=4FRGKxUjmT5V97OsFFUs9UKwCeGpR9rkrqnQkUrp31M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Er6ByWXaKu8VdLflzjYUReX0e0/qmkAGFSeVWHm7O0SPw5FM3PJP89+ofi0361+x8h/8Oufu7oS79hNWS1T1368c+jGVOZxbqmuU9OJ5PweniIil4HDeZ32AHNYUbYpncbA72L7jL6LVglOXX9vJMynIyEEyZesYBfeJEUfVOWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=guaWKyh0; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="guaWKyh0"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-391315098b2so711885f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 02:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744362130; x=1744966930; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SHnGewIV1agnoOjGZwgUR7YbP805CZBtE+LcY2jKnig=;
        b=guaWKyh0ETUKUrxGok2gg/uJgNYTfRlxo9LUwHPFgOeKB8mXhBVdYgoGqbvkJ+G/hv
         0ICKn/a1JexWCDbfbenTjjwnSKyyiBTUkO9Bz9Mv44etPlsw2lLuvUzc2rT1/sogg6DK
         63T+/0uoorqHfng5Ewe0TzOdGLiDmB7TI8/nW1+y+wMkiNuvtVDZogWNSAdarvKjz/8S
         ge7GrPBsGr3TIyK15+vWnzNn7LttfwxR6VeFUV7kQYkiilF3Wi6GP0NLOD2uZW53ROxr
         vuv2SfUu12Q9WW8+awiEf88ATB0FPkn2HvH12fbGkf7gr3rv1BYxlHbkI+auyMpBWyYY
         6X2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744362130; x=1744966930;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SHnGewIV1agnoOjGZwgUR7YbP805CZBtE+LcY2jKnig=;
        b=jy2EC0s6vAsAioelwt3yt36JdCdLLj8gdCYlHBAO+NgUsIXtjMMMP6dn2awD0idrez
         0eu+wOm88HHasaw9vqmRy0CofSFdH4Y0WFoODwOeRqsc1oWr8oF3PiW8Ymu44RZc7X0N
         HaChWvXarhr8HzfAI3kpGkdGdfG9fF6RKf2kBXRuEAmSbbPAMN38i2KpKg5AKAjL/H5z
         CJ1bj6E5t2a0EVH4vfW+h85tzqYwCx7V6hhWLCFSOFwX7ACS92VdyqeCL1B/SXFwEZiH
         qt+tErac/ICOnfPVUQ4Bv23Tbf6KPOrZm690qXiNcOYOVdre8utMlygEPhbTXZO4Bb++
         LF2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWG7OixAw5K/6/xC+Xe9cF+z3BTXvOk44Sm26hIc7kl/uaafvSYnq5mkkPqIm4PF3egapAw22MJicTkiRw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXMAGYeteMOetpGjF56zBpnZTNLImtm3rTtLtq/wwTWKqdwQEI
	ChSA8zay+SZvPzPiVmF5raEg1dbA1sq8sb+e13SFmm3uuo3Q3W91GAgsPgVsvTSH+fhne7q2fRo
	wYj9OorLw19IAFg==
X-Google-Smtp-Source: AGHT+IGknNB36GwS9G8tRiPkbu2Av2DOm6kWwYYKMcuyvBuMkSEKDm/6GTJWrFS/W+dxqv11gdhJsHkpVK/R1Lw=
X-Received: from wmbev17.prod.google.com ([2002:a05:600c:8011:b0:43e:fb23:3edc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40d9:b0:391:3f4f:a169 with SMTP id ffacd0b85a97d-39ea5214ecdmr1468410f8f.32.1744362130477;
 Fri, 11 Apr 2025 02:02:10 -0700 (PDT)
Date: Fri, 11 Apr 2025 09:02:08 +0000
In-Reply-To: <20250409-container-of-mutness-v1-1-64f472b94534@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250409-container-of-mutness-v1-1-64f472b94534@gmail.com>
Message-ID: <Z_jakOS8mciIpxy0@google.com>
Subject: Re: [PATCH] rust: retain pointer mut-ness in `container_of!`
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 09, 2025 at 10:43:16AM -0400, Tamir Duberstein wrote:
> Avoid casting the input pointer to `*const _`, allowing the output
> pointer to be `*mut` if the input is `*mut`. This allows a number of
> `*const` to `*mut` conversions to be removed at the cost of slightly
> worse ergonomics when the macro is used with a reference rather than a
> pointer; the only example of this was in the macro's own doctest.
> 
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> This patch is extracted from 3 other series to reduce duplication.
> ---
>  rust/kernel/lib.rs    |  5 ++---
>  rust/kernel/rbtree.rs | 23 ++++++++++-------------
>  2 files changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index de07aadd1ff5..1df11156302a 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -190,7 +190,7 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
>  /// }
>  ///
>  /// let test = Test { a: 10, b: 20 };
> -/// let b_ptr = &test.b;
> +/// let b_ptr: *const _ = &test.b;
>  /// // SAFETY: The pointer points at the `b` field of a `Test`, so the resulting pointer will be
>  /// // in-bounds of the same allocation as `b_ptr`.
>  /// let test_alias = unsafe { container_of!(b_ptr, Test, b) };
> @@ -199,9 +199,8 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
>  #[macro_export]
>  macro_rules! container_of {
>      ($ptr:expr, $type:ty, $($f:tt)*) => {{
> -        let ptr = $ptr as *const _ as *const u8;
>          let offset: usize = ::core::mem::offset_of!($type, $($f)*);
> -        ptr.sub(offset) as *const $type
> +        $ptr.byte_sub(offset).cast::<$type>()
>      }}
>  }

This implementation does not check the type of `ptr`. Would we not want
it to have the type of the field?

Alice
