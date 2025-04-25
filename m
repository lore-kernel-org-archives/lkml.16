Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5664928EC;
	Fri, 25 Apr 2025 14:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745592347; cv=none; b=Y2aHLToh61MKT3b+A/maSIMT/f3xSuZX0TmPXaTXRyBdCWHo4+SnB0xKBpyZksI7/Vj4dAlqp7AetfxMpBX1oZjSC1mXTEDKrnUI+VSiZAMx+MpJWjLmiIjNJj/Tx7FOIPmgQ/Zy04JG+eppH5bjdA9w/bJsTbcOgbb+lsnOYYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745592347; c=relaxed/simple;
	bh=Tbpyg/unb2pDILYaNqFu8shfhDo5HYaKrcdkDyYp/Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iUZ9dJXAmS1TsyqVPp8ClhOZlaygDjzTS0WgO20dN1J9TccoAVRCFQpfRdWfpEqLfEu/nJDAYiCy4BSvTo0Rqf+cH4mYApHhBx0+5RnTXvzuiCbMke7rE55qQTXWRDV9Tm4WlGeQvqCa7DfnKRUeQIEpCeH99s6Jb8ocXsdWvQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0X+q4DxY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0X+q4DxY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF05C4CEE4;
	Fri, 25 Apr 2025 14:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745592346;
	bh=Tbpyg/unb2pDILYaNqFu8shfhDo5HYaKrcdkDyYp/Bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0X+q4DxYRxO/eY/9MTaJR30+8g/1Ewc/wVZYK++zmXSQ69X8Q0+KhR3CMsBodAYew
	 13HAilLCDObffmfhPjil+xScGrNcGrup+M7IO/5Fgjs/Iavi/722TcwvlCqtQtyzYC
	 2CKPqgc9LNZOWJCJiIgn0lyJwKIt3ICbh3CG6Gdg=
Date: Fri, 25 Apr 2025 16:45:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] uaccess: rust: add strncpy_from_user
Message-ID: <2025042538-sitter-flame-9a50@gregkh>
References: <20250424-strncpy-from-user-v1-1-f983fe21685a@google.com>
 <680a5f5d.050a0220.2035d2.545b@mx.google.com>
 <aAtZQkre4KRU2kr1@google.com>
 <aAuQjSzatuNoDDXL@Mac.home>
 <2025042509-french-washbowl-5cde@gregkh>
 <aAudvTvdhLwBv9gG@Mac.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAudvTvdhLwBv9gG@Mac.home>

On Fri, Apr 25, 2025 at 07:35:41AM -0700, Boqun Feng wrote:
> On Fri, Apr 25, 2025 at 03:52:16PM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Apr 25, 2025 at 06:39:25AM -0700, Boqun Feng wrote:
> > > On Fri, Apr 25, 2025 at 09:43:30AM +0000, Alice Ryhl wrote:
> > > > On Thu, Apr 24, 2025 at 08:57:13AM -0700, Boqun Feng wrote:
> > > > > On Thu, Apr 24, 2025 at 03:17:48PM +0000, Alice Ryhl wrote:
> > > > > > This is needed for ioctls that operate on a user-provided string.
> > > > > > 
> > > > > > It is somewhat unfortunate that strncpy_from_user does not nul-terminate
> > > > > > the string when the end of `buf` is reached. This implies that we can't
> > > > > > return a &CStr from the function, since the buffer may not always be
> > > > > > nul-terminated.
> > > > > > 
> > > > > > That said, we could add more convenient helpers on top that add a NUL
> > > > > > byte in that case.
> > > > > > 
> > > > > > This method isn't defined on UserSliceReader because it complicates the
> > > > > > semantics. The UserSliceReader type also has its own maximum length, so
> > > > > > we would have to limit the read by that length too.
> > > > > > 
> > > > > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > > > > ---
> > > > > >  rust/kernel/uaccess.rs | 27 +++++++++++++++++++++++++++
> > > > > >  1 file changed, 27 insertions(+)
> > > > > > 
> > > > > > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > > > > > index 80a9782b1c6e98ed6eae308ade8551afa7adc188..1bd82045e81ea887008e30241bd6de27f096b639 100644
> > > > > > --- a/rust/kernel/uaccess.rs
> > > > > > +++ b/rust/kernel/uaccess.rs
> > > > > > @@ -369,3 +369,30 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
> > > > > >          Ok(())
> > > > > >      }
> > > > > >  }
> > > > > > +
> > > > > > +/// Reads a nul-terminated string into `buf` and returns the length.
> > > > > > +///
> > > > > > +/// Fails with [`EFAULT`] if the read happens on a bad address. If the end of `buf` is reached,
> > > > > > +/// then the buffer will not be nul-terminated.
> > > > > > +#[inline]
> > > > > > +pub fn strncpy_from_user(ptr: UserPtr, buf: &mut [u8]) -> Result<usize> {
> > > > > 
> > > > > Sorry maybe there is an email I'm missing, but could you provide more
> > > > > context of the usage?
> > > > > 
> > > > > First the function name is a bit weird, because the 'n' in "strncpy"
> > > > > means the parameters should have an 'n' (i.e. length) in it, but there
> > > > > is none in the Rust version.
> > > > 
> > > > There is a length! It's the length of `buf`. It's pretty normal that C
> > > > methods with a pointer and length become a Rust method with a slice.
> > > > 
> > > 
> > > That's exactly the point, no need to reuse a name from C if we have
> > > something better.
> > 
> > Up to point, us kernel developers are used to the C names, so keep it
> > close if at all possible, ESPECIALLY for just links/wrappers of C
> > functions like this one is.
> > 
> 
> Well, see my other suggestion about always putting a NUL at the end.
> Then it's going to be a different function than what strncpy() does.

Ah, I missed that, and yes, we should do that.

> And I also asked for the usage there, because IMO, there's no point of
> replicating a strncpy() in Rust, we should design a better API, rather
> than mimic what C does.

Fair enough.  But as this is going to be getting into the "let's make
string copies correct", please add Kees Cook to the discussion as he's
doing a lot of work here on the C side of this.

> > You need to specify a max length, otherwise that's just going to confuse
> > us all.  strncpy_from_user() is the function we are used to using for
> > copying up to N number of bytes from userspace where a 0 termination
> > stops the copy if N isn't reached.  So I vote highly for the original
> > name here please.
> > 
> 
> Have you read the Rust the function signature? There is no parameter for
> the max length, the max length is implied in the `buf` slice. Plus we
> should really consider what the usage is, for example, wouldn't it be
> ideal that we provide a buffer that has an extra byte so that the
> copy result is always NUL terminated? I randomly checked a few users of
> C strncpy_from_user() (alloc_name() in mm/memfd.c, mtrr_write() in
> arch/x86/kernel/cpu/mtrr/if.c), they all do the same: providing the
> extra byte (i.e. buf size is > n). So it seems preferable to me that we
> provide a function doing that instead of just replicating
> strncpy_from_user() semantics here.
> 
> (You're the one that keeps telling us to focus on usages, and I think
> that's a good perspective ;-))

Ok, fair enough, I had missed the "always put a NULL at the end" which
is a good idea.  And yeah, "implying" the size by the size of the buffer
passed in makes sense in one way, the function signature then does look
odd, I missed that.

So yes, a better name might be good, but again, let's try to sync with
the C side where we can.  We now have C string functions that have an
"implicit" length already in them that is discovered by the compiler at
build time, so following their model is good.

thanks,

greg k-h
