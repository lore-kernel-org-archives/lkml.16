Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1772DFA5F;
	Mon, 14 Apr 2025 18:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744653626; cv=none; b=ZCiv38VPV+fiLYcwiGN46LATgCShXL3PoubXRcggGZ+5iCUHK0joXB6OOBBedXudPjGr852qO7L+6lAk6KCKjXA9ZNVAzHoYAgtPm7qHXsHyZrI+fqx+P2xdfoZ/FB9GwYXvEXuL6CLF8PBgDXluopg9B9h1OWg4P/jeVKfyKQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744653626; c=relaxed/simple;
	bh=du8/1hX5zzzolymE01+Re2wbyHL/iAjLh9WAMGbD/Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhM7wiCX/M+wXUtlTNx8ahGFqMagkxeV0NRYvcCKFxqrUWWvMrZs0RsdLUn1X2PG02QF9QPkbi9tRR8FoT4DD7l3SxBdeGoQqduO1ErfpQwcRMHAHXOrjUelm+ek1HpobSX4SemG9LbDdlqrij7IgWskk4QbRKjc/F2polpVngk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mmIMZWZX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mmIMZWZX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547D4C4CEE2;
	Mon, 14 Apr 2025 18:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744653625;
	bh=du8/1hX5zzzolymE01+Re2wbyHL/iAjLh9WAMGbD/Jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mmIMZWZXoZsycDkznwidlk8QsGgG0ga1wLvRFVqz3G1J2gv6Aeq+s/+06Jf/zn9OS
	 q4jjv9SFKYlmbAhthAb+K19vZetiDsOTaNa/k2Igle13nN8GGoxfgcBKHJViiudpDD
	 jBP5DVgNsNG4O2CCsmaJWXNPzL4JwnyYMsFToJeCr2MVAN0w7Yu136cQcEJEJOoXwC
	 iHs7QzLr68Sj+7H6lKsf5m+DRHWbcYFi2sFU+8uQ/SAQC3ey/FoJNPH1qmBPKids2F
	 /SfO3uHE3qr4zBJ+s2DXhoc9ZIlbL5RoYXJLnMrQuEG57myzyymjaQ2h4AA8kF7tP2
	 Iw39W07CcFQ9g==
Date: Mon, 14 Apr 2025 20:00:19 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/5] rust: Move property_present to separate file
Message-ID: <Z_1NM0RqN_lKrD4v@cassiopeiae>
References: <20250326171411.590681-1-remo@buenzli.dev>
 <20250414152630.1691179-1-remo@buenzli.dev>
 <20250414152630.1691179-2-remo@buenzli.dev>
 <Z_0xGRsI74PsAL_E@cassiopeiae>
 <D96IEJBTKCGK.J44WDQUEHXVV@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D96IEJBTKCGK.J44WDQUEHXVV@buenzli.dev>

On Mon, Apr 14, 2025 at 06:40:54PM +0200, Remo Senekowitsch wrote:
> On Mon Apr 14, 2025 at 6:00 PM CEST, Danilo Krummrich wrote:
> > On Mon, Apr 14, 2025 at 05:26:26PM +0200, Remo Senekowitsch wrote:
> >> Not all property-related APIs can be exposed directly on a device.
> >> For example, iterating over child nodes of a device will yield
> >> fwnode_handle. Thus, in order to access properties on these child nodes,
> >> duplicate the APIs on a fwnode as they are in C.
> >
> > What do you mean with "duplicate the APIs"?
> 
> The property related methods on `Device` and `FwNode` are mostly
> the same. Same names, same function signatures. The methods on
> `Device` simply call `self.fwnode()` and then the same method on
> `FwNode`. I was asked to do this so driver authors don't have to write
> `dev.fwnode().read_propert()` etc. every time they want to do something
> on the device itself. This is the case here for `property_present` as
> well as the methods added in the following patches.

Yeah, I noticed when I continued with patch 2 of this series.

> > Also, this patch does three separate things.
> >
> >   (1) move property_present() to separate file
> >   (2) implement FwNode abstraction
> >   (3) implement Device::fwnode()
> >
> > I'd rather keep property_present() in device.rs and also move fwnode() into
> > device.rs, even though in C it's in property.c. impl Device blocks should be in
> > device.rs.
> 
> I was asked to move it by Rob Herring on Zulip[1]. Dirk Behme also
> agreed with it[2]. I have no strong opinion on this, hopefully you can
> come to an agreement. Whatever it is, I'll happily implement it.

Please also see my comment in patch 2. If we think device.rs becomes too messy
with that, we should convert device.rs to its own module, i.e.
rust/kernel/device/mod.rs and then have rust/kernel/device/property.rs instead.

> >> +++ b/rust/kernel/property.rs
> >> @@ -0,0 +1,75 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +
> >> +//! Unified device property interface.
> >> +//!
> >> +//! C header: [`include/linux/property.h`](srctree/include/linux/property.h)
> >> +
> >> +use core::ptr;
> >> +
> >> +use crate::{bindings, device::Device, str::CStr, types::Opaque};
> >> +
> >> +impl Device {
> >> +    /// Obtain the fwnode corresponding to the device.
> >> +    fn fwnode(&self) -> &FwNode {
> >> +        // SAFETY: `self` is valid.
> >> +        let fwnode_handle = unsafe { bindings::__dev_fwnode(self.as_raw()) };
> >> +        if fwnode_handle.is_null() {
> >> +            panic!("fwnode_handle cannot be null");
> >
> > Please don't use panic!() unless you hit an error condition that is impossible
> > to handle.
> >
> > If __dev_fwnode() can ever return NULL, make this function return
> > Option<&FwNode> instead.
> 
> Rob Herring mentioned this in the previous thread already:
> 
> > Users/drivers testing fwnode_handle/of_node for NULL is pretty common.
> > Though often that's a legacy code path, so maybe not allowing NULL is
> > fine for now.
> 
> I asked a follow-up question about how to proceed but got no reply[3].

I NULL is a possible return value of __dev_fwnode() (which seems to be the
case), there's no other option than makeing fwnode() fallible.

> 
> Best regards,
> Remo
> 
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/DS90UB954.20driver.20done.2C.20ready.20to.20upstream.3F/near/495807346 [1]
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/DS90UB954.20driver.20done.2C.20ready.20to.20upstream.3F/near/495945200 [2]
> Link: https://lore.kernel.org/rust-for-linux/D96HP1UV49SY.1U1BFA14P8XHE@buenzli.dev/T/#mc7967352b7bd1be812806939150511c1a5018bb1 [3]
