Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0DD1E231E;
	Tue, 29 Apr 2025 10:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745921486; cv=none; b=hxchHv+GzEvrkyYcGgZt2rQcEA+56Erlh2RapuGUkzU3/wE1liHKAAyGmWoq+jj5jPbhhYhpGtC+6jHyAOqme4hrrPNbWU3YATBpvwgcszfHm5cYrTEWx6cuN47UzEykNSv5evCQVSADWNWfUbLwq5VMZ8qyauVx1hBjogIjnyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745921486; c=relaxed/simple;
	bh=F9cFJP6/J4g3ZosI4Pf+TVkYrl5kDfDEveUQILIdukM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0CUrIV+oaiHN9EAyeEyLuyhpjtgGpELM8Lbpto1+hcnZUCKTFQRP391VqMTY4x6yw7Ao/LOLZmi8kmAKOU+Un79n4G15OyPo//YHy0hhUTanTd+Mvwk5nuqcgdmIU4Kf4T8XKVz9tAu6f+Ft6vp2SiTDcanfp56C47emNzzU9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tJP/3G8n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tJP/3G8n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA74C4CEE3;
	Tue, 29 Apr 2025 10:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745921485;
	bh=F9cFJP6/J4g3ZosI4Pf+TVkYrl5kDfDEveUQILIdukM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tJP/3G8nUCmuTgqikedCBIAxRVrloE1PxOQ6fSnOV5m0iT+dF7hMvMMlmbMA+3wnw
	 wLN5SkfOERSunHzSWtGBOnGslvyzSoXXkDKKRDN20IRIGd8PDTGCGgazt9Nv2+Rqoy
	 rciTFmnyLDC3Vr4lNiKz6y7wCbB3dOl40UbUtTLe/lOc18d8TYQhQtv6O5Rz+Wm0NY
	 /PbNGRrNJLKQDxCbiP22OCdHi+ioFkdsE3ngV80qAaOwf3fYoxH+NUk0d7uMdVU1A7
	 07fRKdDYlFguN5ev7s/eu7PNfQdULIXvLXd0IK91fq9hHUbso0gUWLDpkB2grpvV8q
	 LRuJuYUrLzSjQ==
Date: Tue, 29 Apr 2025 12:11:20 +0200
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
Subject: Re: [PATCH v2 1/2] uaccess: rust: add strncpy_from_user
Message-ID: <aBClyLz4y7a15WMg@pollux>
References: <20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com>
 <20250429-strncpy-from-user-v2-1-7e6facac0bf0@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-strncpy-from-user-v2-1-7e6facac0bf0@google.com>

On Tue, Apr 29, 2025 at 09:02:22AM +0000, Alice Ryhl wrote:
> This patch adds a direct wrapper around the C function of the same name.
> It's not really intended for direct use by Rust code since
> strncpy_from_user has a somewhat unfortunate API where it only
> nul-terminates the buffer if there's space for the nul-terminator. This
> means that a direct Rust wrapper around it could not return a &CStr
> since the buffer may not be a cstring. However, we still add the method
> to build more convenient APIs on top of it, which will happen in
> subsequent patches.

If we can't think of a use-case to be built upon outside of
rust/kernel/uaccess.rs, I'd make it private. We can still make it public should
we find a use-case later on. If we have one already, it's fine of course.

With that,

	Reviewed-by: Danilo Krummrich <dakr@kernel.org>

> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/uaccess.rs | 34 +++++++++++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index 80a9782b1c6e98ed6eae308ade8551afa7adc188..acb703f074a30e60d42a222dd26aed80d8bdb76a 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -8,7 +8,7 @@
>      alloc::{Allocator, Flags},
>      bindings,
>      error::Result,
> -    ffi::c_void,
> +    ffi::{c_char, c_void},
>      prelude::*,
>      transmute::{AsBytes, FromBytes},
>  };
> @@ -369,3 +369,35 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
>          Ok(())
>      }
>  }
> +
> +/// Reads a nul-terminated string into `buf` and returns the length.
> +///
> +/// This reads from userspace until a NUL byte is encountered, or until `buf.len()` bytes have been
> +/// read. Fails with [`EFAULT`] if a read happens on a bad address. When the end of the buffer is
> +/// encountered, no NUL byte is added, so the string is *not* guaranteed to be NUL-terminated when
> +/// `Ok(buf.len())` is returned.
> +///
> +/// # Guarantees
> +///
> +/// When this function returns `Ok(len)`, it is guaranteed that the first `len` of `buf` bytes are
> +/// initialized and non-zero. Furthermore, if `len < buf.len()`, then `buf[len]` is a NUL byte.
> +/// Unsafe code may rely on these guarantees.
> +#[inline]
> +pub fn raw_strncpy_from_user(ptr: UserPtr, buf: &mut [MaybeUninit<u8>]) -> Result<usize> {
> +    // CAST: Slice lengths are guaranteed to be `<= isize::MAX`.
> +    let len = buf.len() as isize;
> +
> +    // SAFETY: `buf` is valid for writing `buf.len()` bytes.
> +    let res = unsafe {
> +        bindings::strncpy_from_user(buf.as_mut_ptr().cast::<c_char>(), ptr as *const c_char, len)
> +    };
> +
> +    if res < 0 {
> +        return Err(Error::from_errno(res as i32));
> +    }
> +
> +    #[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
> +    assert!(res <= len);
> +
> +    Ok(res as usize)
> +}
> 
> -- 
> 2.49.0.901.g37484f566f-goog
> 
