Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1689627F742;
	Thu, 24 Apr 2025 16:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745512334; cv=none; b=aneMwW6IHx38AyjjEozqp6WC4qmVsnV60yoMOZ5FFBgehXA9ERTbl7JMGl/Dk/ZiZpt0WZ1EzJeVOSlbKYMq175kkLxqV5jRH22U59dsQrqalZaa5TFvini/ljOdpUDZnTW6VG1KutIyEoGfqctQLGLVpSgWfEozAODBzCKhHeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745512334; c=relaxed/simple;
	bh=jva7wafBYgaOEM30wgQ8oEGnjWWenTIsvDWbAoiVlHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JsrI3coQkn+xssqW3p9cN8BlcQLDQVFhalrwN3tMncNOsVqrZ7UkCSJ7G9u+9vwIdCVANJeoJGPihsoXox//gncBLj1fykgCokTVko+OSxGjUTVMYHJqIFIHVy2f4x1ZgS2gRChAA1e7mI+MKZ0vxe1zascvyrxzusKv94qHvxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l4k4ea5B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l4k4ea5B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64FCC4CEE3;
	Thu, 24 Apr 2025 16:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745512333;
	bh=jva7wafBYgaOEM30wgQ8oEGnjWWenTIsvDWbAoiVlHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l4k4ea5BX0KDjb4FZan1SrTSbNDkjCuhhCux1ejQpXWAISpWEkmWPjG6CszHCmaCK
	 ifrqj2U+8Klr29Ej8frKn8UmjkqbwHw3BRRbOeA6fwv9uo9vg8J7Lcoe7NGw6poLx7
	 tl666kOh041/lvDL3wQhU1iTJa3eyKWCLMbx7B9tznDEfYh6UAQf3dtlCBEvC9f49Z
	 xwOh+U9SlPIKxlwyAwXeTDAN8rwkbEYYzfCxzlv91kkL7fdfrEZt3pWkrQ6Hk8ZakU
	 eyAVfAXJ0H0UOizUxegd8r/jShKn+Qo+2wopnn+YbLF5EnU9VsWWpbenls52emqi3g
	 zfEBlEPggG4EA==
Date: Thu, 24 Apr 2025 18:32:08 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] uaccess: rust: add strncpy_from_user
Message-ID: <aApniKYrVaDsu60S@pollux>
References: <20250424-strncpy-from-user-v1-1-f983fe21685a@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-strncpy-from-user-v1-1-f983fe21685a@google.com>

On Thu, Apr 24, 2025 at 03:17:48PM +0000, Alice Ryhl wrote:
> 
> +/// Reads a nul-terminated string into `buf` and returns the length.
> +///
> +/// Fails with [`EFAULT`] if the read happens on a bad address. If the end of `buf` is reached,
> +/// then the buffer will not be nul-terminated.
> +#[inline]
> +pub fn strncpy_from_user(ptr: UserPtr, buf: &mut [u8]) -> Result<usize> {

Should probably be named strcpy_from_user() instead.

> +    // CAST: Slice lengths are guaranteed to be `<= isize::MAX`.
> +    let len = buf.len() as isize;
> +
> +    // SAFETY: `buf` is valid for writing `buf.len()` bytes.
> +    let res = unsafe {
> +        bindings::strncpy_from_user(
> +            buf.as_mut_ptr(),
> +            ptr as *const u8,

kernel::ffi::c_char should always match u8, but should we use the FFI type
regardless?
