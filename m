Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41658211A3C;
	Tue, 29 Apr 2025 11:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745924688; cv=none; b=Dvvc9yIvCq8OgOd8RxFbhjml5Jdpg7z18eAnELB2xrBk3Y824f5kv3oIsTcYXgkJh3Kg1hhr00BKRYrDTZVJx+LPfzZrY42z+U56dKXinynmWYuorGO5XKneKP5SIDw6qeVgPA+rnvY1uB24PrSbmOU7JP8gC0XSFBS/jthz6wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745924688; c=relaxed/simple;
	bh=/Vk5qZ7Z9YA0GlYke/ahJ6SBeDSFVY93udsKSOdevuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWe1q+akviXwCPbvthZ/1fuWJRw1uzf66ImXZnAtB8w7wUSObZPBgB/5kmUky5tDONvuVGsvwB2wNEeOuPKyrKqGQ3SMF/pK42rJKCZfrpggtJL18Erk0mj443uO5t2pZz1EpFxt7NAkKCW20Cy86sYvlO9pWEJS5IcFFAqJpMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dzh7sy6R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dzh7sy6R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 057CAC4CEE3;
	Tue, 29 Apr 2025 11:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745924687;
	bh=/Vk5qZ7Z9YA0GlYke/ahJ6SBeDSFVY93udsKSOdevuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dzh7sy6RWGDTOj9K+WajtMfvA+7sphfWkxyW8ddBiFHiVSX+l5s6jfS0OwriC29tX
	 +5+9JJNVxure+z5XWgY6w4hUlqk/3jotr4y6lOlRAJQSOEoKBju5LK8BRd8GR0p4LO
	 lO1CbNQwhqeubojFBM3vcP2+jkB5v5KN1EKUKbwc=
Date: Tue, 29 Apr 2025 13:04:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] uaccess: rust: add strncpy_from_user
Message-ID: <2025042918-outer-roamer-ab80@gregkh>
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
> 
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

I don't know if it matters, but this can fill up the buffer a bit and
still fail, to quote from the strncpy_from_user() documentation:

	 If access to userspace fails, returns -EFAULT (some data may have been copied).

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

Nit, this can just be returning EFAULT, but I guess it's safest just to
mirror what was passed back.

I would say to just leave it as "pub" for now, but that's not a big
deal.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
