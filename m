Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD97256C9F;
	Wed, 21 May 2025 11:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747828539; cv=none; b=sQ1627D1l8MreS2Mk5cxVpGf+FPRUQxP8DVfpMUJgSDsz2btyFQTis9Vn/+wQHlCeiiMYWj90pAAccavOvnLdK2OoJnCIDGrvD9L0VCO9kGBhRmyOhduCXr5pgeGxYvRHGgDkdf8vx//UtkmV5vF7wZZSu2SdWTyXA8thF4hvpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747828539; c=relaxed/simple;
	bh=kTQaC8Mq0470XlFwBKqdzKs3XmS4yEy7N/X89mNIHLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSDPTojsE5P25D4hpdGWbT55zAlv+uEp3Q+qLMHVjxJn5es2OagUUJqJnPc4QYh7G9IHO/EV76ZcBwOFcrfZ0IXGQ8ggy448HXxZ04eKo2KApID/8qWHQADXW1U1ugoQjBtBf+wKi65+sKbFonSvnyjwDem1dlY24XEK8TdhGmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Xl51ISTq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Xl51ISTq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90109C4CEE4;
	Wed, 21 May 2025 11:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747828539;
	bh=kTQaC8Mq0470XlFwBKqdzKs3XmS4yEy7N/X89mNIHLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xl51ISTqnif5w/dXpZtHMwyicuwVuSYWr+Rg6yG9fZqCMHPKRBsaeJNO8pMG+nyIG
	 IdcFypPhkQbFbCveyVVxxyytoRM41pJbhlxiqREAOv64b9PUQXTdajW33RGeQZgw/b
	 NdwGey7JIq3gt+4nqygXSeSIl77thrXlFNfwFcic=
Date: Wed, 21 May 2025 13:55:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Gerald =?iso-8859-1?Q?Wisb=F6ck?= <gerald.wisboeck@feather.ink>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rust: miscdevice: add additional data to
 MiscDeviceRegistration
Message-ID: <2025052107-awhile-drainer-38d0@gregkh>
References: <20250517-b4-rust_miscdevice_registrationdata-v3-0-cdb33e228d37@gmail.com>
 <20250517-b4-rust_miscdevice_registrationdata-v3-1-cdb33e228d37@gmail.com>
 <aCiSRZjOETsD8MhX@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCiSRZjOETsD8MhX@pollux>

On Sat, May 17, 2025 at 03:42:29PM +0200, Danilo Krummrich wrote:
> On Sat, May 17, 2025 at 01:33:49PM +0200, Christian Schrefl wrote:
> > +pub struct MiscDeviceRegistration<T: MiscDevice> {
> >      #[pin]
> >      inner: Opaque<bindings::miscdevice>,
> > +    #[pin]
> > +    data: UnsafePinned<T::RegistrationData>,
> >      _t: PhantomData<T>,
> >  }
> 
> I recommend not to store data within a Registration type itself.
> 
> I know that this is designed with the focus on using misc device directly from
> the module scope; and in this context it works great.
> 
> However, it becomes quite suboptimal when used from a driver scope. For
> instance, if the misc device is registered within a platform driver's probe()
> function.
> 
> I know this probably isn't supported yet. At least, I assume it isn't supported
> "officially", given that the abstraction does not provide an option to set a
> parent device. Yet I think we should consider it.

It's going to be a requirement to properly set the parent device, and
as you point out, this really should be in some sort of scope, not just
a module.

But, we have two types of users of a misc device, one like this is
written, for a module-scope, and one for the "normal" device scope.  The
device scope is going to be tricker as it can, and will, get
disconnected from the device separately from the misc device lifespan,
so when that logic is added, it's going to be tricky as you point out.

So I'll take this now, but in the future this is going to have to be
cleaned up and modified.

thanks,

greg k-h
