Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75C43FC2;
	Mon, 14 Apr 2025 16:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744646432; cv=none; b=Ma18wL75UNNVr0w3Jmwfa0nmV89u5XNcIqNguK5TD0QpD0KOFdspsrWNEyIZnQm+UjsnBnSumkz0NYOTlZH9Vaef2f+iohtcpaqY4ljp3wCRvoeElb5YyvgMlB0eGko3dGXpDCgAX5W40Rl6KdhWnyRkvGpJyVv4J9F8jtuHZfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744646432; c=relaxed/simple;
	bh=lnJMQohROrGG0E+k95G2QQrt0142N0BCbZ+hQ7mfYqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dIE8kl339lvT4FmfdVLJ48LO1q1hPSc/awFB0HsuUrC36oM4ASU86g6KIc0KmUeB5by2GBwgPjCTuPJy9jQSzt/kaCluVHOA4kEsiDOcgUDi1fzSFPLEymfR55r2jl98cDomYCwFYkTXeqb3K02LE87AfvgB87GcttSyYCj8YOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rJ0+ytki; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rJ0+ytki"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21CAC4CEE2;
	Mon, 14 Apr 2025 16:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744646432;
	bh=lnJMQohROrGG0E+k95G2QQrt0142N0BCbZ+hQ7mfYqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rJ0+ytkibDwS7N3hAZnpfAFyc79oD7Twbe80+2/BmrUBbnAXz54q5ElxDuY6B5268
	 QUDUvszCSy2ueghTdODPW10V+pkKdp7GA1Py0hPh9W57aDIhUnJxIQAwgz6I4aeaPa
	 7spRv6skLsKa3beMibKXjgeT7ai0t/4yFhe7gbVQjqCFIwfXTylQkKkenZLMT8NFUi
	 lLw/uH/VD+Z+SzclmVnva6Bq+a1jWeF4hUKnpGqKpzhKrcaHGFEQvHk+BNy/c0G/SU
	 35XfVXE1H3DFNp2N6x5wTgKAgzM4a1ezUrvzLkBQE9lipXAsXMOPjxtNwHdlceE620
	 GAQAtlq6HR+pw==
Date: Mon, 14 Apr 2025 18:00:25 +0200
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
Message-ID: <Z_0xGRsI74PsAL_E@cassiopeiae>
References: <20250326171411.590681-1-remo@buenzli.dev>
 <20250414152630.1691179-1-remo@buenzli.dev>
 <20250414152630.1691179-2-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414152630.1691179-2-remo@buenzli.dev>

On Mon, Apr 14, 2025 at 05:26:26PM +0200, Remo Senekowitsch wrote:
> Not all property-related APIs can be exposed directly on a device.
> For example, iterating over child nodes of a device will yield
> fwnode_handle. Thus, in order to access properties on these child nodes,
> duplicate the APIs on a fwnode as they are in C.

What do you mean with "duplicate the APIs"?

Also, this patch does three separate things.

  (1) move property_present() to separate file
  (2) implement FwNode abstraction
  (3) implement Device::fwnode()

I'd rather keep property_present() in device.rs and also move fwnode() into
device.rs, even though in C it's in property.c. impl Device blocks should be in
device.rs.

Hence, please split this in two patches, one for (2) and one for (3).

> +++ b/rust/kernel/property.rs
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Unified device property interface.
> +//!
> +//! C header: [`include/linux/property.h`](srctree/include/linux/property.h)
> +
> +use core::ptr;
> +
> +use crate::{bindings, device::Device, str::CStr, types::Opaque};
> +
> +impl Device {
> +    /// Obtain the fwnode corresponding to the device.
> +    fn fwnode(&self) -> &FwNode {
> +        // SAFETY: `self` is valid.
> +        let fwnode_handle = unsafe { bindings::__dev_fwnode(self.as_raw()) };
> +        if fwnode_handle.is_null() {
> +            panic!("fwnode_handle cannot be null");

Please don't use panic!() unless you hit an error condition that is impossible
to handle.

If __dev_fwnode() can ever return NULL, make this function return
Option<&FwNode> instead.
