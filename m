Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F0F25C839;
	Mon,  5 May 2025 14:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746455409; cv=none; b=O1BBCNUzYMnYWQLohZOyluvhjg02AY6PHXCZAKtcRSqR9TQie5u1oDp77qq4FjW0WzzNqZiMOe1voX88CBQSG0Uc99jr1dh4tylQOOAr9B1B5PKDpqn+V41QGCN623fJlnctHdPq8ql+2+VsamjjmiwXFlD029IDoakvNeOD1/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746455409; c=relaxed/simple;
	bh=4j0o1rykGNx1GToDhdSP39vGQ4lWCej0GHB/+vebaw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3wio81Ken0DJpoK4WPS1ogg/0AyCkSxoon11MFNOxj7ci8/3aeTrPeHyMTjm3/RsP0RqYEDFzQbfVJ+92AcmAhVrnW9ov6/NGTSIuOGaw0aM8jURunmpdiI6c/zSUD5uVt/v95ll0NvhHMj1eyVaSlWb2pRWN6D9x1w/U9uT2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y+i052vL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y+i052vL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8DDAC4CEE4;
	Mon,  5 May 2025 14:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746455408;
	bh=4j0o1rykGNx1GToDhdSP39vGQ4lWCej0GHB/+vebaw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y+i052vLyeBz97D7t0ga1iiua9zTsUcYnLBlxHs1G1E03z9AoDwuztVEwC5z+VCIn
	 Vus4no+UpjRLGjHABoI4/T960VDcuAG3QF4kVhtN61dnxCdrHSDT0spNllLi1/nfwT
	 sFyOhE1j+cLr2abJM/OYN9aP2Zo1nNb6HNzTD8Yo=
Date: Mon, 5 May 2025 16:30:05 +0200
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
Subject: Re: [PATCH v3 1/2] uaccess: rust: add strncpy_from_user
Message-ID: <2025050544-sneak-compactor-d701@gregkh>
References: <20250505-strncpy-from-user-v3-0-85c677fd4f91@google.com>
 <20250505-strncpy-from-user-v3-1-85c677fd4f91@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505-strncpy-from-user-v3-1-85c677fd4f91@google.com>

On Mon, May 05, 2025 at 12:17:31PM +0000, Alice Ryhl wrote:
> This patch adds a direct wrapper around the C function of the same name.
> It's not really intended for direct use by Rust code since
> strncpy_from_user has a somewhat unfortunate API where it only
> nul-terminates the buffer if there's space for the nul-terminator. This
> means that a direct Rust wrapper around it could not return a &CStr
> since the buffer may not be a cstring. However, we still add the method
> to build more convenient APIs on top of it, which will happen in
> subsequent patches.
> 
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/uaccess.rs | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index 80a9782b1c6e98ed6eae308ade8551afa7adc188..a7b123915e9aa2329f376d67cad93e2fc17ae017 100644
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
> @@ -369,3 +369,36 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
>          Ok(())
>      }
>  }
> +
> +/// Reads a nul-terminated string into `buf` and returns the length.
> +///
> +/// This reads from userspace until a NUL byte is encountered, or until `buf.len()` bytes have been
> +/// read. Fails with [`EFAULT`] if a read happens on a bad address (some data may have been
> +/// copied). When the end of the buffer is encountered, no NUL byte is added, so the string is
> +/// *not* guaranteed to be NUL-terminated when `Ok(buf.len())` is returned.
> +///
> +/// # Guarantees
> +///
> +/// When this function returns `Ok(len)`, it is guaranteed that the first `len` of `buf` bytes are
> +/// initialized and non-zero. Furthermore, if `len < buf.len()`, then `buf[len]` is a NUL byte.
> +/// Unsafe code may rely on these guarantees.
> +#[inline]
> +#[expect(dead_code)]
> +fn raw_strncpy_from_user(ptr: UserPtr, buf: &mut [MaybeUninit<u8>]) -> Result<usize> {

Nit, the parameters here are backwards from the C version of
strncpy_from_user(), which is going to cause us no end of grief when
reviewing code between the two languages :(

Also, it's not your fault, but we don't have any type of __user tag for
data coming from userspace yet to track this type of thing?  The
compiler (well sparse) can catch this type of thing in C, any hints on
what we could do in Rust for the same type of guarantee (i.e. don't
touch user data before it's been copied, and then we need to treat it as
"unverified" but that's a different patch series...)

thanks,

greg k-h
