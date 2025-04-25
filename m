Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A3B255252;
	Fri, 25 Apr 2025 14:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745590479; cv=none; b=nFQngG/mxZDsfcdH5Rs+o83IYqeg/ZtkUmC6wt07Pb2Pj9nnYD/i/Zp3ugyRY188HtabOZG0DIyCa90WQe0SZMQJBmEi7MJg/MwOXf6+Hw0Q6IVrPDiPCrgmCA1/YtLtcgSNXUwKtF52r5u7PbZ6G+E0gQA2okByEYgXujdKeU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745590479; c=relaxed/simple;
	bh=Rt8pIp+e+1duoFC/ZGp1CQgHoJH2lFYVKU/3HZzUzHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RjFdZ6kwobGSjP76u/3MJ7i1AAMgkwudGe693BaKlWNC7HEL3Kozm0powhH3Kbx23fb1VjJW6l/SZ0CXKddjGoh93G3T3e/LZXAvjghl1RFBFeEdKSDPEnpXXbSWIyGkuKYMtySQvf0maiBkqCL/P8abFwvrIQqNk+MshonFszU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DBgLP+3s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DBgLP+3s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFF3C4CEE4;
	Fri, 25 Apr 2025 14:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745590479;
	bh=Rt8pIp+e+1duoFC/ZGp1CQgHoJH2lFYVKU/3HZzUzHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DBgLP+3s08PdABce4Dwased61BxI6ChNtzVfQevK6YxANl3EdMCiT+VFzouDNoHnv
	 OzMkYITdw9Ued2VK9hrE1t6pc5ONRBGsqzGeafKLXFDTA6OWB7coWuvsPArugRzgu6
	 dtS6xUlT7E9UzPY6gxPV+9j0fK9DHaR2L13l/7/qh+O/AKq+hlDqjePugUfwr2peRh
	 UQIo2hGVEVEK8pok7CFurUxywRhfW0FxgOV4aWDFlyh/vqazxkY8mt2gW3rQ9dlLXZ
	 I+OQPrNrextPXLJ2rJHUm+qRLEiyytIQcBIxcfYjkHRmWK9/tZ+PJgbF8L4UcoCntz
	 ANey25Kocx4Gg==
Date: Fri, 25 Apr 2025 16:14:33 +0200
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
Message-ID: <aAuYyXq1FLOhKDX3@pollux>
References: <20250424-strncpy-from-user-v1-1-f983fe21685a@google.com>
 <aApniKYrVaDsu60S@pollux>
 <aAtZZgeF5GKdPcaB@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAtZZgeF5GKdPcaB@google.com>

On Fri, Apr 25, 2025 at 09:44:06AM +0000, Alice Ryhl wrote:
> On Thu, Apr 24, 2025 at 06:32:08PM +0200, Danilo Krummrich wrote:
> > On Thu, Apr 24, 2025 at 03:17:48PM +0000, Alice Ryhl wrote:
> > > 
> > > +/// Reads a nul-terminated string into `buf` and returns the length.
> > > +///
> > > +/// Fails with [`EFAULT`] if the read happens on a bad address. If the end of `buf` is reached,
> > > +/// then the buffer will not be nul-terminated.
> > > +#[inline]
> > > +pub fn strncpy_from_user(ptr: UserPtr, buf: &mut [u8]) -> Result<usize> {
> > 
> > Should probably be named strcpy_from_user() instead.
> 
> See my reply to Boqun.
> 
> > > +    // CAST: Slice lengths are guaranteed to be `<= isize::MAX`.
> > > +    let len = buf.len() as isize;
> > > +
> > > +    // SAFETY: `buf` is valid for writing `buf.len()` bytes.
> > > +    let res = unsafe {
> > > +        bindings::strncpy_from_user(
> > > +            buf.as_mut_ptr(),
> > > +            ptr as *const u8,
> > 
> > kernel::ffi::c_char should always match u8, but should we use the FFI type
> > regardless?
> 
> Hmm. Should we? I don't mind changing it, but I guess this could be an
> interesting discussion point.

I think we should stick to the FFI type, even if we know the types are
guaranteed to match. But I also won't object with how it is.
