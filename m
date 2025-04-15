Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6110F224D7;
	Tue, 15 Apr 2025 12:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744721409; cv=none; b=fkrYQiVqX1Hkpxl0fbodXAVAPNhtcfModKSPBkqQTSlv2YPE8dTg/4rd9BR7muut+EOmRV7pGUoMBtlJ19Vp9KF9sy729YILnZXCtg4AFCPideikoms+HYizXqyThV6GGjHyH4e32sWyWSIhwp4/gH6SOS2adLip8n0N5Aoy2Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744721409; c=relaxed/simple;
	bh=rezgQpPxWltmaUqTygJWKXVQNgPGjrBMHbxeUkuR0zI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cE/V4bHPy45NQNZVGfS0Qp2+FqZAtGl5ckwVWkgW6LSgk/9sYRpmVu93z3FGQkuQyLObO3f/Err0glRKRzfpHuKKg3PXphnoqIjZWlccDmmaBlzU3hLXkuBdtBZ+5a8QalPP6Vw9rdl8hqZlg4169WQ09dDbqxXaqdQ1P8qljms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqtWyGat; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OqtWyGat"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 439EEC4CEDD;
	Tue, 15 Apr 2025 12:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744721408;
	bh=rezgQpPxWltmaUqTygJWKXVQNgPGjrBMHbxeUkuR0zI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OqtWyGatGL1qLaRO2Khl8JH8yVvfqnY2ct4YvkbR3HeQkU1fN2PTLWH7+0JpmTAcD
	 Oxn1qPTcFHF50TlS1Q/FwM5uBFG/p0ras3kuGbJMRM6V5eZj/nFsXHniArz8mRVh8m
	 tZfXG2pEqnueH6OttcojF19NGIrKu+k7jf6/EiUbrK/ccMd5BgKxA0iC3kF6gE1S62
	 tb8vW+cZduTlRLsDJXw+2Y+Usg++u52eZCo8bjVCiK6QZEgkIV4y5GMhVfxgDeTe5k
	 1g59FcPM1uhCF1Y3yOB4+cmD6TJyf5IrNrJDV71g4ScZS1CtTkem3wmru6ZOcMTZ2F
	 TUkdxkABikXLQ==
Date: Tue, 15 Apr 2025 14:50:02 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, david.m.ertman@intel.com,
	ira.weiny@intel.com, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu,
	airlied@gmail.com, acourbot@nvidia.com, jhubbard@nvidia.com,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 4/5] rust: auxiliary: add auxiliary registration
Message-ID: <Z_5V-uznqkAvrf9p@cassiopeiae>
References: <20250414131934.28418-1-dakr@kernel.org>
 <20250414131934.28418-5-dakr@kernel.org>
 <Z_5M5Auqj2KK-rPz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_5M5Auqj2KK-rPz@google.com>

On Tue, Apr 15, 2025 at 12:11:16PM +0000, Alice Ryhl wrote:
> On Mon, Apr 14, 2025 at 03:18:07PM +0200, Danilo Krummrich wrote:
> > +impl Registration {
> > +    /// Create and register a new auxiliary device.
> > +    pub fn new(parent: &device::Device, name: &CStr, id: u32, modname: &CStr) -> Result<Self> {
> > +        let boxed = KBox::new(Opaque::<bindings::auxiliary_device>::zeroed(), GFP_KERNEL)?;
> > +        let adev = boxed.get();
> > +
> > +        // SAFETY: It's safe to set the fields of `struct auxiliary_device` on initialization.
> > +        unsafe {
> > +            (*adev).dev.parent = parent.as_raw();
> > +            (*adev).dev.release = Some(Device::release);
> > +            (*adev).name = name.as_char_ptr();
> > +            (*adev).id = id;
> > +        }
> > +
> > +        // SAFETY: `adev` is guaranteed to be a valid pointer to a `struct auxiliary_device`,
> > +        // which has not been initialized yet.
> > +        unsafe { bindings::auxiliary_device_init(adev) };
> > +
> > +        // Now that `adev` is initialized, leak the `Box`; the corresponding memory will be freed
> > +        // by `Device::release` when the last reference to the `struct auxiliary_device` is dropped.
> > +        let _ = KBox::into_raw(boxed);
> > +
> > +        // SAFETY:
> > +        // - `adev` is guaranteed to be a valid pointer to a `struct auxiliary_device`, which has
> > +        //   been initialialized,
> > +        // - `modname.as_char_ptr()` is a NULL terminated string.
> > +        let ret = unsafe { bindings::__auxiliary_device_add(adev, modname.as_char_ptr()) };
> > +        if ret != 0 {
> > +            // SAFETY: `adev` is guaranteed to be a valid pointer to a `struct auxiliary_device`,
> > +            // which has been initialialized.
> > +            unsafe { bindings::auxiliary_device_uninit(adev) };
> 
> Does this error-path actually free the box?

Yes, auxiliary_device_uninit() calls put_device() on the underlying struct
device, hence the release() callback is called at this point, which frees the
Box.
