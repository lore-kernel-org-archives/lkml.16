Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4C42C1793;
	Tue, 29 Apr 2025 11:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745924962; cv=none; b=XEaUCJ9P6VqoliQifFkQOYGtGmBCNwxXcTiCiw3P6tiGmp/7Rt7pzK3WpoO2Po9IQsbCYvQgrHzOgTYhlbM/u+eDrPHk8AHyLtzygDoIrFhk/eLTBe49XQO/+7adwPYtI2hqatu+kCpJd+KoEp5yrH/U8Km8g1+zIjsg+zd2fKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745924962; c=relaxed/simple;
	bh=ZXz2yD+d82VC43nSuY5nImDpV2JGQJKNMs4bpCo0zTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rGOveMVU+kxQxAvH38j3BfC63KSsMWYEzxCDXrpYj7QhNkCnuI8CcyH8dWlM8AtyGWvMvlqSwAW2LB8yuydN2nWgY+9ae/O2IugyzBjXBM+M13XWXvnnaB11c1XriIPTyZnkqn1ul67rd1o31UpXvpSey1syAhnbrkQAakw+vOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vPpCB6J8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vPpCB6J8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BEF0C4CEE3;
	Tue, 29 Apr 2025 11:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745924961;
	bh=ZXz2yD+d82VC43nSuY5nImDpV2JGQJKNMs4bpCo0zTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vPpCB6J8Did6SL6ieVRERHWiMQVou2FditYC4SOcc+YlGE6WGBmjz+eOJaWTGMSXe
	 aufbHjwU2vdQxeoDYbflnRVYny9LrndOQ3GZNv52+wh/48GhF4cd8cyWrevVsH1GMK
	 0fXO+AxzZYKH4ICDygZ4OoXnWrj7+2S+H3B79SpM=
Date: Tue, 29 Apr 2025 13:09:18 +0200
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
Subject: Re: [PATCH v2 2/2] uaccess: rust: add
 UserSliceReader::strcpy_into_buf
Message-ID: <2025042919-varsity-registrar-fb45@gregkh>
References: <20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com>
 <20250429-strncpy-from-user-v2-2-7e6facac0bf0@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-strncpy-from-user-v2-2-7e6facac0bf0@google.com>

On Tue, Apr 29, 2025 at 09:02:23AM +0000, Alice Ryhl wrote:
> This patch adds a more convenient method for reading C strings from
> userspace. Logic is added to NUL-terminate the buffer when necessary so
> that a &CStr can be returned.
> 
> Note that we treat attempts to read past `self.length` as a fault, so
> this returns EFAULT if that limit is exceeded before `buf.len()` is
> reached.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/uaccess.rs | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index acb703f074a30e60d42a222dd26aed80d8bdb76a..7cec1b62bd8b816f523c8be12cb29905740789fc 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -293,6 +293,41 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut Vec<u8, A>, flags: Flags) -> R
>          unsafe { buf.set_len(buf.len() + len) };
>          Ok(())
>      }
> +
> +    /// Read a NUL-terminated string from userspace and append it to `dst`.
> +    ///
> +    /// Fails with [`EFAULT`] if the read happens on a bad address.

Also returns this error:

> +    pub fn strcpy_into_buf<'buf>(&mut self, buf: &'buf mut [u8]) -> Result<&'buf CStr> {
> +        if buf.is_empty() {
> +            return Err(EINVAL);

if the buffer is of 0 length.  Don't know if you want to document that
or not.

> +        }
> +
> +        // SAFETY: The types are compatible and `strncpy_from_user` doesn't write uninitialized
> +        // bytes to `buf`.
> +        let mut dst = unsafe { &mut *(buf as *mut [u8] as *mut [MaybeUninit<u8>]) };
> +
> +        // We never read more than `self.length` bytes.
> +        if dst.len() > self.length {
> +            dst = &mut dst[..self.length];
> +        }
> +
> +        let mut len = raw_strncpy_from_user(self.ptr, dst)?;
> +        if len < dst.len() {
> +            // Add one to include the NUL-terminator.
> +            len += 1;
> +        } else if len < buf.len() {
> +            // We hit the `self.length` limit before `buf.len()`.
> +            return Err(EFAULT);

How can this happen?  And if it does, why is that a memory fault?
Doesn't this just mean that we read smaller than our overall size of our
buffer?  Or am I misreading this completely?

Maybe a self-test would be good to exercise all of this :)

thanks,

greg k-h
