Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D08835893;
	Tue, 22 Apr 2025 06:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745304976; cv=none; b=Nlw93c6OgjB+1gdiigzQZ+udHYxgnxreqHyBc74DpVpLrNB3AB6I+EiLX441G6p4RAJI/pR5kcFKiOwaCFvtH6GmZJUqtkUafmvteQqaPj5YHgaUeyHSIzLs//bj4QMmdrTmOfFuHhiiBEDvm0HWrhrRAjl8ooVUnU/CNvsiBGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745304976; c=relaxed/simple;
	bh=usMR2DwEtIazhxZ4d4P5fHt95B1LOqMK8EkIWiPCXHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FtxX7AiJBwBvrlkR1qPbHfa7V8E9c95UXLEQWV/EQp0/hFB282ZOJLBx34c9xLvtKLOVo1cprQWtqZXHuKZcPPNSuZT4f99whBthcNN0yC0H0/6B6HHeT88HXjA8pwESb0AmCktMRUrEAWY+slqVPkWG4KGkSRZUOaMyDwBMses=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sbj7VMoq; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sbj7VMoq"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39bf44be22fso3223094f8f.0;
        Mon, 21 Apr 2025 23:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745304973; x=1745909773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Br06/YnAFuSvdSFJqO10HWWOatiDYmQlrdmj/ddCQBM=;
        b=Sbj7VMoqhoIMVy0JtYeYR90oWBGgzwr6E10nqPSOTijZ7tbNEeHO332jiu/vaDDgwt
         0Aw780GFLB+fvNIkxHaQ2c67/dVXCWz9ex6zOFSyw5P3hnLKmuTQt5YBOq9OLxkuNNp9
         YwAmJfkHdGNd8nrUOXKP5XG/fKFBFnTwpAYfGFXmQ0SS+ngx45GHUbt7uFBPyIbSUrGG
         kFcAN/vN24/McfJWKlGIIojwPEmug+Ru4wWIzUCZ1QRDY6ylcUPqTJ8Qs/QFyFls1OeH
         UuiY8ONK2Yfm4qQLWp0DClNvCMzlt3WWXTXTOcvEeFqOpVg667/2LoZ/oYhi6igXK28Q
         BWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745304973; x=1745909773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Br06/YnAFuSvdSFJqO10HWWOatiDYmQlrdmj/ddCQBM=;
        b=R5iUY/jBt/Erki/S/9Dv/4jlhOTHQiY/9T+hQHElPHTITNDPEJrWWfhhmXcyWvXp6E
         DfEmY90E2sG5UYZg2cYKeM5ubPPjnOUJj2oRf0yGz53Eki/BVseWiul8jotptmisVAXe
         j2zO9IaPluR+RK29OZJA5J1nD7+CWdG0ayH5cXITUQM7wYAqzBHarpwE6F/8salGmklm
         PeBk/vH9omoae0FN4sxg9SEok7nWt1w6rUbWLBtA7sF/pzQKhHDkMhF4B6NkurnHM2XW
         JV922k6IIS8pjJx1z93foaUW8blXY5x1Lia/gdzvPoKWmq+Enw0x5LqugC6IZ55eLd7Z
         lrfw==
X-Forwarded-Encrypted: i=1; AJvYcCV5bwD4Va4MQjKTp8aVSkvyucjrV1J/JxnlsQPdc2V4Nzle+tGdbqTydN60Esx1gISOb7v4QOj8hmjlWT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIi0G2o4Z9mpgfS7GRLSQkHxxne0i894x3lZOMIYvV31Sxr+Ph
	PdVlxpj09WUiX6oAX86MYcUcTaqQsUnDVwXGEiMDgGAwLrT/t+Rd
X-Gm-Gg: ASbGncsI2F2KLjL34PgmjnzDbA8h5+CloiNi1x/nolNNLoE2i+Bwwb3+iHHk0aa2qGN
	cN+iJD2zNS9YjcOI6nvCJqvG/b1VpEL42a7ZgD6N7GHtx6j0EPNrQwQh9pkP2pN68OWwr4C5Mia
	AVzmLwRI7VQaArojDeBmHFc9TtDpGJeZScoD+yFJSehfRuxkcKbyFwh8GMf3/9f3IuLMCnVKdna
	ODfSaxpfXDtbvTGIjIigsdyRQcZoY1DBBZfKcdb0y6+W/qmVAjxwCRxLbW5R0GYwzIq03541i1f
	xAruu1X74S3HqLcl/bRpufxL22lPVNFTlbtCkmwCx8bPI3WqVbsouQSQL+bWypiaIlBfrtz3b4z
	JPcV/mGQT8KVJ/vjvXhkJPw==
X-Google-Smtp-Source: AGHT+IFZ0ZiqmtL8XqOP4W8PuEhRsHIR8roewQgVY7RDAFTndPG9IT3W/f49bWmpJjBLdbSC1LZMQw==
X-Received: by 2002:a5d:584b:0:b0:391:412b:e23f with SMTP id ffacd0b85a97d-39efba3c819mr10470456f8f.15.1745304973201;
        Mon, 21 Apr 2025 23:56:13 -0700 (PDT)
Received: from ?IPV6:2001:4bc9:1f91:3f49:880a:9a87:b7c1:e3a3? ([2001:4bc9:1f91:3f49:880a:9a87:b7c1:e3a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4a4e9esm14381905f8f.96.2025.04.21.23.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 23:56:12 -0700 (PDT)
Message-ID: <61dc2ae0-c15a-4243-bdb1-de06ba2e0000@gmail.com>
Date: Tue, 22 Apr 2025 08:56:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] rust: pin-init: add `cast_[pin_]init` functions to
 change the initialized type
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250421221728.528089-1-benno.lossin@proton.me>
 <20250421221728.528089-2-benno.lossin@proton.me>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250421221728.528089-2-benno.lossin@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.04.25 12:17 AM, Benno Lossin wrote:
> These functions cast the given pointer from one type to another. They
> are particularly useful when initializing transparent wrapper types.
> 
> Link: https://github.com/Rust-for-Linux/pin-init/pull/39/commits/80c03ddee41b154f1099fd8cc7c2bbd8c80af0ad
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> ---

Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>

>  rust/pin-init/src/lib.rs | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
> index 0806c689f693..a880c21d3f09 100644
> --- a/rust/pin-init/src/lib.rs
> +++ b/rust/pin-init/src/lib.rs
> @@ -1216,6 +1216,38 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
>      __internal::InitClosure(f, PhantomData)
>  }
>  
> +/// Changes the to be initialized type.
> +///
> +/// # Safety
> +///
> +/// - `*mut U` must be castable to `*mut T` and any value of type `T` written through such a
> +///   pointer must result in a valid `U`.
> +#[expect(clippy::let_and_return)]
> +pub const unsafe fn cast_pin_init<T, U, E>(init: impl PinInit<T, E>) -> impl PinInit<U, E> {
> +    // SAFETY: initialization delegated to a valid initializer. Cast is valid by function safety
> +    // requirements.
> +    let res = unsafe { pin_init_from_closure(|ptr: *mut U| init.__pinned_init(ptr.cast::<T>())) };
> +    // FIXME: remove the let statement once the nightly-MSRV allows it (1.78 otherwise encounters a
> +    // cycle when computing the type returned by this function)
> +    res
> +}
> +
> +/// Changes the to be initialized type.
> +///
> +/// # Safety
> +///
> +/// - `*mut U` must be castable to `*mut T` and any value of type `T` written through such a
> +///   pointer must result in a valid `U`.
> +#[expect(clippy::let_and_return)]
> +pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>) -> impl Init<U, E> {
> +    // SAFETY: initialization delegated to a valid initializer. Cast is valid by function safety
> +    // requirements.
> +    let res = unsafe { init_from_closure(|ptr: *mut U| init.__init(ptr.cast::<T>())) };
> +    // FIXME: remove the let statement once the nightly-MSRV allows it (1.78 otherwise encounters a
> +    // cycle when computing the type returned by this function)
> +    res
> +}
> +>  /// An initializer that leaves the memory uninitialized.
>  ///
>  /// The initializer is a no-op. The `slot` memory is not changed.

