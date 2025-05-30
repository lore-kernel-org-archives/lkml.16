Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B51224AFE;
	Fri, 30 May 2025 11:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748606235; cv=none; b=JoguiK4Q+jP8Ct2geOsfU9jTa4F9Fw7GA2cqkVrOF8ShZ2G5sf54giKlNSbNRQ04x6sLcEhGyMhDt09ZVFvZpXAwFHue6Y3p3E3GnAPaNBjdlMYhGGUPnaTARN0sbpkxW19bcc4B5UxdnFW1+H7RJpAQDihQoFMl5FeediPNPOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748606235; c=relaxed/simple;
	bh=yprLKIL5EOcfMSlo6iTpsD0WWz5KZsnDgNEziHBUpCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhbfEK6OW0BmZE3R8X39AW/sUoVa7i/x/oivsOs2E3RLgyyd9K0wkeerRG7sRlDoH9v3G8QybyYYvrLKOksv5eqexcWIu2ieN8gqVLt5tQQaOlx8LeV51hxh+qvCoJvrlHTG5x+Q9a6ujUVRJcyKEjtfDXMUiItVjptGZcGdHLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=urltr8Tj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="urltr8Tj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B57C3C4CEE9;
	Fri, 30 May 2025 11:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748606234;
	bh=yprLKIL5EOcfMSlo6iTpsD0WWz5KZsnDgNEziHBUpCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=urltr8TjlU9yevlGNGZYsW/5ttQm+SYDwETSXdMS3H13s3KG0PtZ4rdgpYccnZuo7
	 253TbK6rChcXrbul0cug2artRTruvBWS6CVFbrFtoIPntZVUXKKZv1MTzdTtGvDVGx
	 PtfSlmfkGu7zg5W6ZLrkIr9cMOpGftxMON+PfOT4=
Date: Fri, 30 May 2025 13:57:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] uaccess: rust: add strncpy_from_user
Message-ID: <2025053041-zeppelin-used-1d3d@gregkh>
References: <20250527-strncpy-from-user-v4-0-82168470d472@google.com>
 <20250527-strncpy-from-user-v4-1-82168470d472@google.com>
 <DA9GNN7GH1VE.2NDPJZLNHAUP4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA9GNN7GH1VE.2NDPJZLNHAUP4@kernel.org>

On Fri, May 30, 2025 at 01:32:44PM +0200, Benno Lossin wrote:
> On Tue May 27, 2025 at 2:34 PM CEST, Alice Ryhl wrote:
> > This patch adds a direct wrapper around the C function of the same name.
> > It's not really intended for direct use by Rust code since
> > strncpy_from_user has a somewhat unfortunate API where it only
> > nul-terminates the buffer if there's space for the nul-terminator. This
> > means that a direct Rust wrapper around it could not return a &CStr
> > since the buffer may not be a cstring. However, we still add the method
> > to build more convenient APIs on top of it, which will happen in
> > subsequent patches.
> >
> > Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> 
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> 
> One question below.
> 
> > ---
> >  rust/kernel/uaccess.rs | 35 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 34 insertions(+), 1 deletion(-)
> >
> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > index 80a9782b1c6e98ed6eae308ade8551afa7adc188..9b1e4016fca2c25a44a8417c7e35e0fcf08aa959 100644
> > --- a/rust/kernel/uaccess.rs
> > +++ b/rust/kernel/uaccess.rs
> > @@ -8,7 +8,7 @@
> >      alloc::{Allocator, Flags},
> >      bindings,
> >      error::Result,
> > -    ffi::c_void,
> > +    ffi::{c_char, c_void},
> >      prelude::*,
> >      transmute::{AsBytes, FromBytes},
> >  };
> > @@ -369,3 +369,36 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
> >          Ok(())
> >      }
> >  }
> > +
> > +/// Reads a nul-terminated string into `dst` and returns the length.
> > +///
> > +/// This reads from userspace until a NUL byte is encountered, or until `dst.len()` bytes have been
> > +/// read. Fails with [`EFAULT`] if a read happens on a bad address (some data may have been
> > +/// copied). When the end of the buffer is encountered, no NUL byte is added, so the string is
> > +/// *not* guaranteed to be NUL-terminated when `Ok(dst.len())` is returned.
> > +///
> > +/// # Guarantees
> > +///
> > +/// When this function returns `Ok(len)`, it is guaranteed that the first `len` bytes of `dst` are
> > +/// initialized and non-zero. Furthermore, if `len < dst.len()`, then `dst[len]` is a NUL byte.
> > +/// Unsafe code may rely on these guarantees.
> > +#[inline]
> > +#[expect(dead_code)]
> > +fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], src: UserPtr) -> Result<usize> {
> 
> We could also return `&[u8]` here instead of the size. Would that
> improve the users of this API?

That would differ from the C function, strncpy_from_user() and force us
reviewers to try to remember what is supposed to be happening here.  So
I wouldn't recommend that if at all possible please.

thanks,

greg k-h
