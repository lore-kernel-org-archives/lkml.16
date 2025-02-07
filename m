Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EED81E;
	Fri,  7 Feb 2025 00:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738887382; cv=none; b=M14cZQAIK6ZKoI9KXUo1znATgfszhn2mOGW0TRyFyhtQfA0go/pKQA+ysKYG9RWMcNWVANgl+qd6aEPTIifrK8DyclCWO2yAUjZlDb1XR780Cr6qK1oGk7lv+1w5XBdbsSB8e/f5vVyJxhNVhy1ztnXAnYG7z+aQdifG6ZF7aMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738887382; c=relaxed/simple;
	bh=ZqV+c31QIWooiiy1h6FMhrdGf39cppM+j25+fek91Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pw3LUddXFPzuS1/nwx2r7wO3NOj/p2zhXv+U4Rv17GpWmh+EoHLovCOfpzvw8mu2BenM09pz3ulJ7mv79OoyxKr9u+JcRI1xeFYAO/t5lmRRWpYohUKzcgj1viqGJe1MGiXSeGzVvk1MIpExPa+d8oubZG66CxX+VIbVB4K16q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JSUO0CdU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JSUO0CdU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD607C4CEDD;
	Fri,  7 Feb 2025 00:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738887381;
	bh=ZqV+c31QIWooiiy1h6FMhrdGf39cppM+j25+fek91Rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JSUO0CdUyZ6qrRyKZUCHStitYhJGqUkITuRQs3/Kl+xjgcufxd1jjz9P36Wh8lhDQ
	 BfrOUceF3ha4TGxPvZc7ImCpbccPt/fk93B1A/0xEf3yRSh39PfNl8J0yuU4hv4IYb
	 NirJIqfFlcplYbyoH/7mEnuCfSojvIHIeE+3QmaRtlfrR0AjOczTpfHJxQjIVIQjZr
	 GYW96W1DZcJU8UDDDcnyZgs7if8ucEB1pkya4jPJXsm00xrkan1rH4w552R+gGehwh
	 g1Um7qHlHDeMuVteRKYMz3Cb8CxJVivF+67W57rduaU++fSOTqaR0gbqm0gIdjxvHX
	 FiWGBPht57Jxg==
Date: Fri, 7 Feb 2025 01:16:16 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust/kernel: Add faux device bindings
Message-ID: <Z6VQ0D-L4Z0pxxsa@cassiopeiae>
References: <20250206210503.102061-2-lyude@redhat.com>
 <Z6U4APfuIEOgMzmd@cassiopeiae>
 <13397687a4490bc5410402c9e92a90959756e102.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13397687a4490bc5410402c9e92a90959756e102.camel@redhat.com>

On Thu, Feb 06, 2025 at 06:04:03PM -0500, Lyude Paul wrote:
> On Thu, 2025-02-06 at 23:30 +0100, Danilo Krummrich wrote:
> > > +//! Abstractions for the faux bus.
> > > +//!
> > > +//! This crate provides bindings for working with faux devices in kernel modules. It should be
> > > +//! preferred for creating virtual devices over the platform API.
> > 
> > "preferred" implies a bit that platform devices are still an option for that
> > (even if not preferred). Maybe just not mention it at all. But if you want to,
> > maybe something along the lines of "faux devices are the solution for the
> > historical abuse of platform devices as virtual devices"?
> > 
> > > +//!
> > > +//! C header: [`include/linux/device/faux.h`]
> > > +use crate::{bindings, device, error::from_err_ptr, prelude::*};
> > > +use core::ptr::{addr_of_mut, null, NonNull};
> > > +
> > > +/// The faux device representation.
> > > +///
> > > +/// This type represents the registration of a [`struct faux_device`]. When an instance of this type
> > > +/// is dropped, its respective faux device will be unregistered from the system.
> > 
> > Ultimately, this will be used to be passed to C APIs, such as drm_dev_alloc(),
> > which increment the reference count of the underlying struct device.
> > 
> > Should we consider that in Rust we may have a need to take additional references
> > in the future too?
> > 
> > Maybe it would be more future proof to call this structure `Registration` and
> > leave us the option to define faux::Device for reference counting later on.
> 
> Yeah I was considering calling this Registration rather than Device, but
> mainly for the reason that a device registration (at least to me) is a unique
> resource.

What about the fact that your comment says "This type represents the
registration [...]"? :-)

> I think actually taking references to the Device should be the job
> of the kernel device core though

Everyone who stores a pointer to a reference counted thing has to take a
reference.

drm_dev_init() for instance, takes a refernece because a drm_device can outlive
the parent device' (in this case the faux device') registration.

Once we get to native Rust APIs of this kind in the future, we'd need to take
our own reference of this device.

The `Registration` structure's lifetime should represent the time in which a
device is registered in the system.

Whereas the `Device` structure's lifetime should represent the lifetime of a
single reference to the device. This is exactly what pci::Device,
platform::Device, and the base device::Device do.

For the faux device it's that faux_device_create() allocates, initializes and
registers the device at once and faux_device_destroy() unregisters the device
and drops the initial reference from faux_device_create() at once. After that,
the device is unregistered, but depending on whether there are still references
held to the device, it can still be alive.

I also suggest to have a look at `MiscDeviceRegistration` registration, which is
similar from the registration side of things.
