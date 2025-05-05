Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D24D1F2BAB;
	Mon,  5 May 2025 16:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462159; cv=none; b=gTec71IkPIq6yhcpb4LjDtwJVqkEnS2ZNtltmpPExRzwEJEHZSo7yQmgssY8HIN6YCtU2Y3d39Cklo058EPGriauLr84TS9j3rLIKrxw8yiD+63udewv4x78Xus42YIoCmeDlLVc74PBjjbsPS3lQr2yuxHXNdeuDe4rZpNof2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462159; c=relaxed/simple;
	bh=sFOY+QrXVtBQFRQMgXZC8sVi2S+7f/V7wdC68vwuIG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9npoKwvIFtrE3oIogxRhEsWDeO+SSymqf/+u/HaQDm9lZxv0SA1LisJmuCNX75H4GhfSSUAV/Mp5GD9nf5SxvW1i+xAVWUx4JgN3JYGESeQGBTj4M9yp/w61n942E5pj2dWOijaFvcaRPu5Z/hn5K1vdqixFBoFMQYV+fZO26k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o62aBtRY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o62aBtRY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653D3C4CEE4;
	Mon,  5 May 2025 16:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746462158;
	bh=sFOY+QrXVtBQFRQMgXZC8sVi2S+7f/V7wdC68vwuIG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o62aBtRYwB/QZFkBq5VWw6vOET5V4UrbPN6zhj7pAtTva3xzMuD28a2HHTRLZ0laM
	 dLfYzg/v8fwMmIsGsPPfh930Z6aZRa/F2pka1SVBW+4cxHt3EfhOMlFOdNejoC5ZGu
	 NFmea31JIVuCcOgkoLV6IxrkcI8GmHgK9zvRCOn9l0vOXL9d8wvaGXigUJbXn7NoJK
	 NbcMNz4W+2j0Yo69r8HVngUnCd1P/+0m44FOeoMmBzofOy5LzxXE2ym7GM8RsBwkdJ
	 nMMZRsEsYgBc8iI1ZdY3G5sC83VFPh1YU1/xiBamfeaoQzcSVAxRxcCIefeg4cnGTP
	 vrC2seBRgB0/g==
Date: Mon, 5 May 2025 18:22:31 +0200
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
Subject: Re: [PATCH v3 2/2] uaccess: rust: add
 UserSliceReader::strcpy_into_buf
Message-ID: <aBjlx_AfQCS-pmht@polis>
References: <20250505-strncpy-from-user-v3-0-85c677fd4f91@google.com>
 <20250505-strncpy-from-user-v3-2-85c677fd4f91@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505-strncpy-from-user-v3-2-85c677fd4f91@google.com>

On Mon, May 05, 2025 at 12:17:32PM +0000, Alice Ryhl wrote:
> +    /// Read a NUL-terminated string from userspace and return it.
> +    ///
> +    /// The string is read into `buf` and a NUL-terminator is added if the end of `buf` is reached.
> +    /// Since there must be space to add a NUL-terminator, the buffer must not be empty. The
> +    /// returned `&CStr` points into `buf`.
> +    ///
> +    /// Fails with [`EFAULT`] if the read happens on a bad address (some data may have been
> +    /// copied).
> +    #[doc(alias = "strncpy_from_user")]
> +    pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8]) -> Result<&'buf CStr> {
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
> +            // This implies that len == dst.len() < buf.len().
> +            //
> +            // This means that we could not fill the entire buffer, but we had to stop reading
> +            // because we hit the `self.length` limit of this `UserSliceReader`. Since we did not
> +            // fill the buffer, we treat this case as if we tried to read past the `self.length`
> +            // limit and received a page fault, which is consistent with other `UserSliceReader`
> +            // methods that also return page faults when you exceed `self.length`.
> +            return Err(EFAULT);
> +        } else {
> +            // This implies that len == buf.len().
> +            //
> +            // This means that we filled the buffer exactly. In this case, we add a NUL-terminator
> +            // and return it. Unlike the `len < dst.len()` branch, don't modify `len` because it
> +            // already represents the length including the NUL-terminator.
> +            //
> +            // SAFETY: Due to the check at the beginning, the buffer is not empty.
> +            unsafe { *buf.last_mut().unwrap_unchecked() = 0 };
> +        }
> +
> +        // SAFETY: `raw_strncpy_from_user` guarantees that this range of bytes represents a
> +        // NUL-terminated string with the only NUL byte being at the end.

This isn't true if we hit the else case above, no?

With that fixed,

	Reviewed-by: Danilo Krummrich <dakr@kernel.org>
