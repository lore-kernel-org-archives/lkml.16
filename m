Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2C926D4D2;
	Wed, 21 May 2025 13:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832404; cv=none; b=HFyVZTxXuuDTp6pqWXsxlcjpZ/HUsK8gDlrTdb160AxO/nd1PKcF0tFslrXGN5G9v5TaXcbgo0FSbyVztFkjagiBXEc7IsBY/QQIAlzLp8cYnsCM/zr5tsHx/7HIuaJp1T5RBeCzX2Puvw6OtV1+q6SVyies4RYvuw0VNZoPLYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832404; c=relaxed/simple;
	bh=iWukOTP5Zbi8mZBtT07eYoKDE3ALYLBiIEOJ2pVeONY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpI1shw4vbibEmtFgqZqCfjr1G1aaJnQYDV4t89zzVNKn8/EustGXE6ywr6JNwklxQFg8tjq+rWQ8M7wSY4M2lpNZ1D7G/N0MhjJXqUPmlX8NoGlk9OYe5KtDPDdCsmmRSW7sD3Ptc4JdWZ4XzEnh98dTKTPp+w2CXe8YLx8kUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rYrXcWSw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rYrXcWSw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB9BC4CEE7;
	Wed, 21 May 2025 13:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747832403;
	bh=iWukOTP5Zbi8mZBtT07eYoKDE3ALYLBiIEOJ2pVeONY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rYrXcWSwhiFPPMjV66tTBtf4yvaIBeKi9k8dqVlQGjZYXU0VheqzVvs7VXQewG7At
	 gBNaDGto6i9n0P2WU+XFgz1exfsVmgX91tDvDD3ZqsnlAX/VXWgz2SE2fiZjD8d7Hg
	 30Ir1QfMu7EH0z/gLvew27wF3QQ5Xm3jP/OBefmc=
Date: Wed, 21 May 2025 15:00:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
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
Message-ID: <2025052138-phony-amplify-83ea@gregkh>
References: <20250517-b4-rust_miscdevice_registrationdata-v3-0-cdb33e228d37@gmail.com>
 <20250517-b4-rust_miscdevice_registrationdata-v3-1-cdb33e228d37@gmail.com>
 <aCiSRZjOETsD8MhX@pollux>
 <2025052107-awhile-drainer-38d0@gregkh>
 <2025052104-mockup-dupe-2573@gregkh>
 <4616772d-0052-4c2f-afec-69ae32f908aa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4616772d-0052-4c2f-afec-69ae32f908aa@gmail.com>

On Wed, May 21, 2025 at 02:16:20PM +0200, Christian Schrefl wrote:
> Hi Greg,
> 
> On 21.05.25 2:04 PM, Greg Kroah-Hartman wrote:
> > On Wed, May 21, 2025 at 01:55:36PM +0200, Greg Kroah-Hartman wrote:
> >> On Sat, May 17, 2025 at 03:42:29PM +0200, Danilo Krummrich wrote:
> >>> On Sat, May 17, 2025 at 01:33:49PM +0200, Christian Schrefl wrote:
> >>>> +pub struct MiscDeviceRegistration<T: MiscDevice> {
> >>>>      #[pin]
> >>>>      inner: Opaque<bindings::miscdevice>,
> >>>> +    #[pin]
> >>>> +    data: UnsafePinned<T::RegistrationData>,
> >>>>      _t: PhantomData<T>,
> >>>>  }
> >>>
> >>> I recommend not to store data within a Registration type itself.
> >>>
> >>> I know that this is designed with the focus on using misc device directly from
> >>> the module scope; and in this context it works great.
> >>>
> >>> However, it becomes quite suboptimal when used from a driver scope. For
> >>> instance, if the misc device is registered within a platform driver's probe()
> >>> function.
> >>>
> >>> I know this probably isn't supported yet. At least, I assume it isn't supported
> >>> "officially", given that the abstraction does not provide an option to set a
> >>> parent device. Yet I think we should consider it.
> >>
> >> It's going to be a requirement to properly set the parent device, and
> >> as you point out, this really should be in some sort of scope, not just
> >> a module.
> >>
> >> But, we have two types of users of a misc device, one like this is
> >> written, for a module-scope, and one for the "normal" device scope.  The
> >> device scope is going to be tricker as it can, and will, get
> >> disconnected from the device separately from the misc device lifespan,
> >> so when that logic is added, it's going to be tricky as you point out.
> >>
> >> So I'll take this now, but in the future this is going to have to be
> >> cleaned up and modified.
> > 
> > Nope, can't take it, it breaks the build from my tree:
> > 
> > error[E0432]: unresolved import `crate::types::UnsafePinned`
> >   --> rust/kernel/miscdevice.rs:20:37
> >    |
> > 20 |     types::{ForeignOwnable, Opaque, UnsafePinned},
> >    |                                     ^^^^^^^^^^^^ no `UnsafePinned` in `types`
> > 
> > error[E0432]: unresolved import `pin_init::Wrapper`
> >   --> rust/kernel/miscdevice.rs:23:5
> >    |
> > 23 | use pin_init::Wrapper;
> >    |     ^^^^^^^^^^^^^^^^^ no `Wrapper` in the root
> > 
> > error: aborting due to 2 previous errors
> > 
> > :(
> 
> This requires my `UnsafePinned` [0] patches (& with that pin-init-next) like I wrote
> in the cover letter.
> 
> [0]: https://lore.kernel.org/rust-for-linux/20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com/

I never read cover letters, all of the needed information should be in
the individual commits as that's what ends up in the changelog :)

thanks,

greg k-h
