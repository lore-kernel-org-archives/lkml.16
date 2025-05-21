Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56CE265607;
	Wed, 21 May 2025 12:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747829066; cv=none; b=VxFiCCir4sg2XVVu9vwHd+euArObermldDBRe5r0kKwwXgnABYNCESG06Nqr+NmjisgyWq2W4R8oFVSWyI5+Htj0SUkucAluUW1+372XaaDJX05/OltGZsN1i92jSJ18+CjW3z/oEW0AOuFN7zZMhVASOKOjxA7xAV3Ch7Kzi+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747829066; c=relaxed/simple;
	bh=DTgMlVSDmF7Xt997YsoltV7NwJDAvGPJIz+InLgjWwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tL5czkgWzEuv+SXsLktiGhv7ALN5a8dEOfx/VZhzvmOlYYH5BQwbUGxHipZZZnidQqh4UWuni14r639CitzgRSh0uky9eQEypuPDXt/7jSD416bbc+QneP98vnTaLB48JH3QV7PcmNbQPcTRomrGouibFr9jJ5rW6uNhTynLN8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hWgs/eT1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hWgs/eT1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E74C4CEED;
	Wed, 21 May 2025 12:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747829065;
	bh=DTgMlVSDmF7Xt997YsoltV7NwJDAvGPJIz+InLgjWwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hWgs/eT1O9dm7/BiY3oUnnNGACEKJWu5yPkNec+qAffGxrfDPi0H/48Hiwr+qOc58
	 Yr7dT/takov+aXQxX+6F56zPHxlmNoW6fBJBnnfD5War7C72K4PmsgQ9e0L2XUFsri
	 8XvtGDRO88viY3X4J72lh2/OB9gY1211dhS57g3o=
Date: Wed, 21 May 2025 14:04:22 +0200
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
Message-ID: <2025052104-mockup-dupe-2573@gregkh>
References: <20250517-b4-rust_miscdevice_registrationdata-v3-0-cdb33e228d37@gmail.com>
 <20250517-b4-rust_miscdevice_registrationdata-v3-1-cdb33e228d37@gmail.com>
 <aCiSRZjOETsD8MhX@pollux>
 <2025052107-awhile-drainer-38d0@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025052107-awhile-drainer-38d0@gregkh>

On Wed, May 21, 2025 at 01:55:36PM +0200, Greg Kroah-Hartman wrote:
> On Sat, May 17, 2025 at 03:42:29PM +0200, Danilo Krummrich wrote:
> > On Sat, May 17, 2025 at 01:33:49PM +0200, Christian Schrefl wrote:
> > > +pub struct MiscDeviceRegistration<T: MiscDevice> {
> > >      #[pin]
> > >      inner: Opaque<bindings::miscdevice>,
> > > +    #[pin]
> > > +    data: UnsafePinned<T::RegistrationData>,
> > >      _t: PhantomData<T>,
> > >  }
> > 
> > I recommend not to store data within a Registration type itself.
> > 
> > I know that this is designed with the focus on using misc device directly from
> > the module scope; and in this context it works great.
> > 
> > However, it becomes quite suboptimal when used from a driver scope. For
> > instance, if the misc device is registered within a platform driver's probe()
> > function.
> > 
> > I know this probably isn't supported yet. At least, I assume it isn't supported
> > "officially", given that the abstraction does not provide an option to set a
> > parent device. Yet I think we should consider it.
> 
> It's going to be a requirement to properly set the parent device, and
> as you point out, this really should be in some sort of scope, not just
> a module.
> 
> But, we have two types of users of a misc device, one like this is
> written, for a module-scope, and one for the "normal" device scope.  The
> device scope is going to be tricker as it can, and will, get
> disconnected from the device separately from the misc device lifespan,
> so when that logic is added, it's going to be tricky as you point out.
> 
> So I'll take this now, but in the future this is going to have to be
> cleaned up and modified.

Nope, can't take it, it breaks the build from my tree:

error[E0432]: unresolved import `crate::types::UnsafePinned`
  --> rust/kernel/miscdevice.rs:20:37
   |
20 |     types::{ForeignOwnable, Opaque, UnsafePinned},
   |                                     ^^^^^^^^^^^^ no `UnsafePinned` in `types`

error[E0432]: unresolved import `pin_init::Wrapper`
  --> rust/kernel/miscdevice.rs:23:5
   |
23 | use pin_init::Wrapper;
   |     ^^^^^^^^^^^^^^^^^ no `Wrapper` in the root

error: aborting due to 2 previous errors

:(

