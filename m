Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ABC27AC41;
	Tue,  6 May 2025 12:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535962; cv=none; b=V63SwthajCqfz6MfkxEqT8n1Y6+0dzELcwMioshiSyoODAE4DpRMPzdTSI2RZaCdamh2RCPz2GCMfZlplJYUCfpxlJWNa9udcgWKJ6DiJuGK8oSGImlgNQhS4TWex6AevaH0RLPnJiIz7fLBjMTXkQ0GHPvxObe9S7pAmOVBtwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535962; c=relaxed/simple;
	bh=CoGj5SFcRaCss+CpurOaTAPuqA7YnJFs78eMCJRv7H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDtYAXpKrDlQ/wcZ8Zg0jaQ8mlB6oPYtIfKmrIELa1nPzPlYtgKYEbwVb5AmlpyhakgE5VkaXTC7QuvtUOcLT/KU/CbOztjTlq80A73MUPypMFEwil9nE4XMs/BCSCklBcLgDpea3damHGDxqjyMILiKkDRZ3z/55FBLPI1M3lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gaYu+12Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gaYu+12Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AABAC4CEE4;
	Tue,  6 May 2025 12:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746535962;
	bh=CoGj5SFcRaCss+CpurOaTAPuqA7YnJFs78eMCJRv7H8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gaYu+12YUu9M8YmpGzc0XxsT+IKB0ZKv5u0NT+X9pcZbWFnzcmw/SkQic+ogKcLxD
	 qtyed+o+FA94SdC/r6RXdcse9KifRcdHmsQ/YABoTYXv/E7VnjgPuHoD37ZIpOQ191
	 yiElZUmotKu6yJIlSsiv+O99p6Vj/yErO8pN3be0=
Date: Tue, 6 May 2025 14:52:39 +0200
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
Message-ID: <2025050645-trifocals-olympics-4692@gregkh>
References: <20250505-strncpy-from-user-v3-0-85c677fd4f91@google.com>
 <20250505-strncpy-from-user-v3-1-85c677fd4f91@google.com>
 <2025050544-sneak-compactor-d701@gregkh>
 <aBnT8Y3lJqd6J40q@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBnT8Y3lJqd6J40q@google.com>

On Tue, May 06, 2025 at 09:18:41AM +0000, Alice Ryhl wrote:
> On Mon, May 05, 2025 at 04:30:05PM +0200, Greg Kroah-Hartman wrote:
> > On Mon, May 05, 2025 at 12:17:31PM +0000, Alice Ryhl wrote:
> > > This patch adds a direct wrapper around the C function of the same name.
> > > It's not really intended for direct use by Rust code since
> > > strncpy_from_user has a somewhat unfortunate API where it only
> > > nul-terminates the buffer if there's space for the nul-terminator. This
> > > means that a direct Rust wrapper around it could not return a &CStr
> > > since the buffer may not be a cstring. However, we still add the method
> > > to build more convenient APIs on top of it, which will happen in
> > > subsequent patches.
> > > 
> > > Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> > > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > ---
> > >  rust/kernel/uaccess.rs | 35 ++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 34 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > > index 80a9782b1c6e98ed6eae308ade8551afa7adc188..a7b123915e9aa2329f376d67cad93e2fc17ae017 100644
> > > --- a/rust/kernel/uaccess.rs
> > > +++ b/rust/kernel/uaccess.rs
> > > @@ -8,7 +8,7 @@
> > >      alloc::{Allocator, Flags},
> > >      bindings,
> > >      error::Result,
> > > -    ffi::c_void,
> > > +    ffi::{c_char, c_void},
> > >      prelude::*,
> > >      transmute::{AsBytes, FromBytes},
> > >  };
> > > @@ -369,3 +369,36 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
> > >          Ok(())
> > >      }
> > >  }
> > > +
> > > +/// Reads a nul-terminated string into `buf` and returns the length.
> > > +///
> > > +/// This reads from userspace until a NUL byte is encountered, or until `buf.len()` bytes have been
> > > +/// read. Fails with [`EFAULT`] if a read happens on a bad address (some data may have been
> > > +/// copied). When the end of the buffer is encountered, no NUL byte is added, so the string is
> > > +/// *not* guaranteed to be NUL-terminated when `Ok(buf.len())` is returned.
> > > +///
> > > +/// # Guarantees
> > > +///
> > > +/// When this function returns `Ok(len)`, it is guaranteed that the first `len` of `buf` bytes are
> > > +/// initialized and non-zero. Furthermore, if `len < buf.len()`, then `buf[len]` is a NUL byte.
> > > +/// Unsafe code may rely on these guarantees.
> > > +#[inline]
> > > +#[expect(dead_code)]
> > > +fn raw_strncpy_from_user(ptr: UserPtr, buf: &mut [MaybeUninit<u8>]) -> Result<usize> {
> > 
> > Nit, the parameters here are backwards from the C version of
> > strncpy_from_user(), which is going to cause us no end of grief when
> > reviewing code between the two languages :(
> 
> I'll swap them.
> 
> fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], src: UserPtr) -> Result<usize> {
> 
> > Also, it's not your fault, but we don't have any type of __user tag for
> > data coming from userspace yet to track this type of thing?  The
> > compiler (well sparse) can catch this type of thing in C, any hints on
> > what we could do in Rust for the same type of guarantee (i.e. don't
> > touch user data before it's been copied, and then we need to treat it as
> > "unverified" but that's a different patch series...)
> 
> The UserPtr typedef is intended to do that, but since it's only a
> typedef to usize, the compiler won't detect it if you mix up a user
> pointer with a length. (It will detect mix-ups with pointers since we
> use an integer type for UserPtr.)

Sorry, I missed the "UserPtr" for some reason.  But having an integer
type for UserPtr feels like it's going to cause problems in the
long-run.

> What we can do is replace the typedef with
> 
> #[repr(transparent)]
> struct UserPtr(pub usize);
> 
> That way, it becomes it's own separate type (this is called the newtype
> pattern [1]) so that it can't be mixed up with anything else.

Why not use a real pointer like:
	struct UserPtr(pub *const u8)

> The #[repr(transparent)] annotation makes the compiler treat it like a
> bare long for ABI-purposes. I'm not sure if any function ABIs actually
> treat a long differently from a struct that just contains a long, but if
> such ABIs exist, then the annotation ensures that the long ABI is used
> rather than the struct-containing-long ABI.

In the kernel, "unsigned long" is guaranteed to hold a pointer.  Which
is why many of the old allocation functions return that type.

thanks,

greg k-h
