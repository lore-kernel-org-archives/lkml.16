Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263EF1DF754;
	Tue, 29 Apr 2025 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745922990; cv=none; b=VGSbf7jzQQiS0w8rWb86UEVdNHXhjv3ueP4qh5ZpmfBBqteMV2zTyhNuDBJuZfinKwr7hsSRW+hTPjuqCYYIfKVkqYZEJHdO60Sio5neSzzQ+ffczA+Mw2ZYZSZ38cVVBhhy5rUBsa+zzdnP6E8TY+la2dmw4EZ4IVHsLI9X4mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745922990; c=relaxed/simple;
	bh=XvlFYCGm9QRKdPWrZ+CC9szelX1V1i98J3w/eXfSAEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GI+qc1Yj/cXnXBgiBMkZO4EDJdqWCigwFj4nmJQjApMCbsJem5LphuvhbePRODo6n/6EaVhG0PblAvr8+UWixMT1Vzxc/eQxhTQkxi0iu2DVJpwaqmKTBClRmwJDh+fl7t+tj9VtsUW0ABHKCnRE55PZtSjPNnmNIASgakpTyeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4OQ+FXi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4OQ+FXi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1162C4CEE3;
	Tue, 29 Apr 2025 10:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745922989;
	bh=XvlFYCGm9QRKdPWrZ+CC9szelX1V1i98J3w/eXfSAEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n4OQ+FXiWgYJHXjXf8za/0AyPfbKWngj5IW0V0NEobqJ0uCQr4DKr1yRvi01nvwff
	 2CUB91TNDneoXgFewlJNVUvgKedIBMQLFlpxzw/ICzwux1jrkynLS2td2tbPyfpn6H
	 SUnAQM7I3UMhxy9quIAoWEuZEvu56AqFYGFXHGU+fxhkK1GmEghlks3t1A0L4dAkWI
	 NTxfHkaRt52ZLrJ/9Oe9BxQ5Zykpu/+/U2eJttRqH43cWBNqLf1/x8eikwOk4yerQ3
	 4hvRgcFJyz3r4iEg8IGItB9Oj+P6KKnE/I4+K6kM49xCLjkelJvJv6NlgWB1WkiRAo
	 4OLvHoRnMNnkA==
Date: Tue, 29 Apr 2025 12:36:24 +0200
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
Subject: Re: [PATCH v2 2/2] uaccess: rust: add
 UserSliceReader::strcpy_into_buf
Message-ID: <aBCrqJe4two4I45G@pollux>
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
> +    pub fn strcpy_into_buf<'buf>(&mut self, buf: &'buf mut [u8]) -> Result<&'buf CStr> {
> +        if buf.is_empty() {
> +            return Err(EINVAL);
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

So, this one we can only ever hit if `len == dst.len()`, which means that the
string (incl. the NULL terminator) is longer than dst. If at the same time
`len < buf.len()`, we know that dst has been shortened because
`buf.len() > self.length`, which means that the string spans across the
self.length boundary.

That seems a bit subtle to me. Maybe we should check for `dst.len() < buf.len()`
instead and add a comment explaining the logic a bit more in detail.

> +        } else {
> +            // SAFETY: Due to the check at the beginning, the buffer is not empty.
> +            unsafe { *buf.last_mut().unwrap_unchecked() = 0 };
> +        }
> +        self.skip(len)?;
> +
> +        // SAFETY: `raw_strncpy_from_user` guarantees that this range of bytes represents a
> +        // NUL-terminated string with the only NUL byte being at the end.
> +        Ok(unsafe { CStr::from_bytes_with_nul_unchecked(&buf[..len]) })
> +    }
>  }
>  
>  /// A writer for [`UserSlice`].
> 
> -- 
> 2.49.0.901.g37484f566f-goog
> 
