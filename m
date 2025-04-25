Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D83642069;
	Fri, 25 Apr 2025 13:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745589140; cv=none; b=YhJ0jCTCvHl3Efiaf7U1YAnxfnOCrQAE2dax9JzbmrVIDM0JMtz4ZbnM644/tgRNAW7QX/iN5NieM0OeHW634FkXKlhwPygeuJ6apGfikjk9HKwc1GfuKY5h8LrWb4IaEUO6w18w07JhCYnqo2wAr72x4MN3sn5uzXpaRJDRHcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745589140; c=relaxed/simple;
	bh=RtxtbztRYYXsq67qqqMHH+EvvE1eSf561O8SdGCaius=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLDFYcYF+09B/EPQqPJU0LliM1Tc0SIjFWe1evnYha4Ykx3ipvBNKewAHxTnIMM/wuFoyznsZ3qX/aGzJ3nYtaQGBH4TceyLWelgdRcSQlGOZIzMGpGMXDHVWbmw5zlVseKdkatIM6FWyKui/Hu/PDKJmne48xRDJnuQ6zw7+OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=js+k4tjw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="js+k4tjw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B79C4CEE4;
	Fri, 25 Apr 2025 13:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745589139;
	bh=RtxtbztRYYXsq67qqqMHH+EvvE1eSf561O8SdGCaius=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=js+k4tjwLNlucIW7dK6hTOaiyPrJreERiOWKdVyGp0hCrm71Q3cmTy2MLnsrib4QX
	 Xb7TFw97xjtY3WhnMKPgx128HXUV4p/LoVIKcl9bxyln8bnQyS5ufMwP4VR0zhYLF5
	 OOLZcBnurByDmYneY7UAauNBhW5N/KDRu9nwkP5U=
Date: Fri, 25 Apr 2025 15:52:16 +0200
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
Message-ID: <2025042509-french-washbowl-5cde@gregkh>
References: <20250424-strncpy-from-user-v1-1-f983fe21685a@google.com>
 <680a5f5d.050a0220.2035d2.545b@mx.google.com>
 <aAtZQkre4KRU2kr1@google.com>
 <aAuQjSzatuNoDDXL@Mac.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAuQjSzatuNoDDXL@Mac.home>

On Fri, Apr 25, 2025 at 06:39:25AM -0700, Boqun Feng wrote:
> On Fri, Apr 25, 2025 at 09:43:30AM +0000, Alice Ryhl wrote:
> > On Thu, Apr 24, 2025 at 08:57:13AM -0700, Boqun Feng wrote:
> > > On Thu, Apr 24, 2025 at 03:17:48PM +0000, Alice Ryhl wrote:
> > > > This is needed for ioctls that operate on a user-provided string.
> > > > 
> > > > It is somewhat unfortunate that strncpy_from_user does not nul-terminate
> > > > the string when the end of `buf` is reached. This implies that we can't
> > > > return a &CStr from the function, since the buffer may not always be
> > > > nul-terminated.
> > > > 
> > > > That said, we could add more convenient helpers on top that add a NUL
> > > > byte in that case.
> > > > 
> > > > This method isn't defined on UserSliceReader because it complicates the
> > > > semantics. The UserSliceReader type also has its own maximum length, so
> > > > we would have to limit the read by that length too.
> > > > 
> > > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > > ---
> > > >  rust/kernel/uaccess.rs | 27 +++++++++++++++++++++++++++
> > > >  1 file changed, 27 insertions(+)
> > > > 
> > > > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > > > index 80a9782b1c6e98ed6eae308ade8551afa7adc188..1bd82045e81ea887008e30241bd6de27f096b639 100644
> > > > --- a/rust/kernel/uaccess.rs
> > > > +++ b/rust/kernel/uaccess.rs
> > > > @@ -369,3 +369,30 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
> > > >          Ok(())
> > > >      }
> > > >  }
> > > > +
> > > > +/// Reads a nul-terminated string into `buf` and returns the length.
> > > > +///
> > > > +/// Fails with [`EFAULT`] if the read happens on a bad address. If the end of `buf` is reached,
> > > > +/// then the buffer will not be nul-terminated.
> > > > +#[inline]
> > > > +pub fn strncpy_from_user(ptr: UserPtr, buf: &mut [u8]) -> Result<usize> {
> > > 
> > > Sorry maybe there is an email I'm missing, but could you provide more
> > > context of the usage?
> > > 
> > > First the function name is a bit weird, because the 'n' in "strncpy"
> > > means the parameters should have an 'n' (i.e. length) in it, but there
> > > is none in the Rust version.
> > 
> > There is a length! It's the length of `buf`. It's pretty normal that C
> > methods with a pointer and length become a Rust method with a slice.
> > 
> 
> That's exactly the point, no need to reuse a name from C if we have
> something better.

Up to point, us kernel developers are used to the C names, so keep it
close if at all possible, ESPECIALLY for just links/wrappers of C
functions like this one is.

> > The distinction between strcpy and strncpy in my eyes is that strcpy
> > reads until you find a NUL byte, whereas strncpy reads until you find a
> > NUL byte *or* you read a user-specified number of bytes. This method is
> > in the latter category.
> > 
> 
> Then copy_from_user_until_nul()? Or cstrcpy_from_user()? We should have
> a bit consistent naming on Rust side regardless how C names things IMO.

You need to specify a max length, otherwise that's just going to confuse
us all.  strncpy_from_user() is the function we are used to using for
copying up to N number of bytes from userspace where a 0 termination
stops the copy if N isn't reached.  So I vote highly for the original
name here please.

thanks,

greg k-h
