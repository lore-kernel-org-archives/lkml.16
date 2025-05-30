Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18FC225412;
	Fri, 30 May 2025 18:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748630322; cv=none; b=vFUEQV4FxOvD/kckXRwKJ+UU8ADiPoA3U7nWWSbFj6DrmTgK0DyMeAFppFVLyk+ujZ2mVWIwtD7sMsVNDwghi7YCmIo3HROpFtDK+pjnQESXT5KqvIBuwKFJB0z3EOpq5g1Simv8pUhTuJK7qUU90R3F8+MBMwnBsxSt37y6rxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748630322; c=relaxed/simple;
	bh=Kg5KBVaEBU3PjO2hxbIqIef9RfVpaplA7hMk1GsmEbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhQE4DfRcFTUlOXotN78l0IUibnxc/JiYXxicgcR0C/sPWqJNpQaSTccmYhDrgtNWFYKZG9jkfJrs3sdf0RuOvm7GVyA33OjeJDLDmt8XQKvaYErDBy36er877Pf7nf0ab9ptGgQqWwMVyTOYp3uNzFZ7NuVPRanmL3a9pJ0Jxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9ygWVM4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9ygWVM4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74476C4CEE9;
	Fri, 30 May 2025 18:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748630321;
	bh=Kg5KBVaEBU3PjO2hxbIqIef9RfVpaplA7hMk1GsmEbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a9ygWVM483ysOOejKgo4t5/8UKWf4B8wOVDRT+M1Tm7F4NXMSBNqy9+YA6Pw/t2o7
	 GWTCQ0gMDB0boA9sZtGxWZkOilIvzLHSlYZdbzLL2wdBy6BEpWHZM5dLKjQ00roJPk
	 x2JTtYYpOatd8tkfPRENI+zNqS3yEK9dYbmqp3H6z1UoQVcM0Ig7f/puHLRzy4KO4v
	 UTIZ+FOUAO37/vttn0v9Z+RZlsI29Yq1mvz6FqTJYGu5UhE86pXSKFQtq3E/3/sj4j
	 HgOaAR2/BfHoij2tvmRpEPtLAB30zXvf3xFfMnisRxWcYk9nV0feHCm/ZgkpFn5mRO
	 ln0m8LzG2fX2w==
Date: Fri, 30 May 2025 20:38:35 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] rust: miscdevice: properly support device drivers
Message-ID: <aDn7K1FPlFPUsjo0@pollux>
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-6-dakr@kernel.org>
 <726b746e-d2c1-4208-b2cc-d08d24abd7cf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <726b746e-d2c1-4208-b2cc-d08d24abd7cf@gmail.com>

On Fri, May 30, 2025 at 07:35:56PM +0200, Christian Schrefl wrote:
> On 30.05.25 4:24 PM, Danilo Krummrich wrote:

<snip>

> > +#[pinned_drop]
> > +impl<T: MiscDevice> PinnedDrop for RawDeviceRegistration<T> {
> > +    fn drop(self: Pin<&mut Self>) {
> > +        // SAFETY: We know that the device is registered by the type invariants.
> > +        unsafe { bindings::misc_deregister(self.inner.get()) };
> > +    }> +}

<snip>

> >  #[pinned_drop]
> >  impl<T: MiscDevice> PinnedDrop for MiscDeviceRegistration<T> {
> >      fn drop(self: Pin<&mut Self>) {
> > -        // SAFETY: We know that the device is registered by the type invariants.
> > -        unsafe { bindings::misc_deregister(self.inner.get()) };
> > -
> >          // SAFETY: `self.data` is valid for dropping.
> >          unsafe { core::ptr::drop_in_place(self.data.get()) };
> 
> I think this can race for a use after free.
> The data gets freed in this `Drop` impl but the `miscdevice_deregister` call will only
> happen in the `DeviceRegistrationInner` `Drop` implementatation, since the fields 
> will only be dropped after the `drop` function has executed.

Yes and no. :-) The fun part is that the drop order actually depends on whether
we have a parent device and use Devres or whether we have no parent device.

In the first case the drop order is correct by chance, due to Devres revoking
things when the parent device in unbound, which happens before, since the faux
device is dropped first.

But in general you're right, this needs to be fixed.

> Either  inner: DeviceRegistrationInner<T> needs to be wrapped in a ManuallyDrop and
> dropped manually,
> or the Data needs to be wrapped in a type that will automatically drop it (this would
> be fine with `UnsafePinned`).

There's also option 3), which is moving the drop_in_place() for the registration
data into RawDeviceRegistration::drop(), right below misc_deregister(), until we
have `UnsafePinned`.

(This is fine, since RawDeviceRegistration already has (and requires) a pointer
to the registration data and hence is always embedded in a
MiscDeviceRegistration.)
