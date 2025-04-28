Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B8F1C5F14;
	Mon, 28 Apr 2025 16:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859447; cv=none; b=lEON2X9c/hl3O/uVeKFLE/wjgMHBt5T79efH9+XaXIvHCtFgLhVPuNyYpJX3dfsL9LEGyDoRXfvu6vN+632G2ftY8mFkHbHuvBZ1aUHSInSzYinRq4QRI/jnEMkgZufME3feAdZF3EGI5k/jHD68+RRzmb6Eb4SCZMEWOmhrDmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859447; c=relaxed/simple;
	bh=wPE11EiQsJSjvy1z6vnGpurxWJ0BYq1at4VNRv/ng1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvVt2+mKFP4IMIxV86dIaDfYcJhZpvFcR31LQWS0DDH1q3iCBaJvaoP21fB9AtEk60i4O/DVJz4OEI4oYmQCpG2OQZC8xH+VhfjpLRj+1mcjeHjjWXCytfENeG0GUc//mG6MBtumn4iKcvFhPVLvDrA/rffDw0LNGElrOFqwT5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oKwG7OtT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oKwG7OtT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD1CC4CEE4;
	Mon, 28 Apr 2025 16:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745859447;
	bh=wPE11EiQsJSjvy1z6vnGpurxWJ0BYq1at4VNRv/ng1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oKwG7OtTsOd809Si2aOdp5mSlorANtsp80EBZh7FBL1+25QYbsV/P8hZ/fLOFNBSx
	 UCq18PDjomiYRJrF91jslAPyfzxFdTLeNmQBefAhYSCtZD6oBoyrBxobGW7K8AX6dK
	 Yj2IsQU0gWJjNvZX3omES3/NwdMcID7Yd+JuxCqQ=
Date: Mon, 28 Apr 2025 18:57:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Jason Kridner <jkridner@beagleboard.org>,
	Deepak Khatri <lorforlinux@beagleboard.org>,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Dhruva Gole <d-gole@ti.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: kernel: device: Add of_platform_populate/depopulate
Message-ID: <2025042824-sliver-slip-b585@gregkh>
References: <20250428-rust-of-populate-v1-1-1d33777427c4@beagleboard.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-rust-of-populate-v1-1-1d33777427c4@beagleboard.org>

On Mon, Apr 28, 2025 at 07:52:29PM +0530, Ayush Singh wrote:
> Add abstractions for managed of_platform_populate and
> of_platform_depopulate.
> 
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
> Allow calling platform_populate/depopulate from Rust code.
> 
> To see how the bindings look in usage, see my working tree [0] for a
> connector driver  I am working on.
> 
> Open Questions
> ***************
> 
> 1. Function names
> 
> The rust implementations are based on devm_* versions of these
> functions, i.e of_platform_depopulate() is called when the device is
> unbound. Since in case of Rust, these are methods on the Device struct,
> I am not sure if the `devm_` prefix is required.
> 
> 2. Maybe should be functions instead of methods?
> 
> Not sure what the policy is regarding this.
> 
> [0]: https://github.com/Ayush1325/linux/commits/b4/beagle-cape/
> ---
>  rust/bindings/bindings_helper.h |  1 +
>  rust/kernel/device.rs           | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 8a2add69e5d66d1c2ebed9d2c950380e61c48842..51ec0754960377e5fc6bc0703487bf2086eff0e6 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -25,6 +25,7 @@
>  #include <linux/mdio.h>
>  #include <linux/miscdevice.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/pci.h>
>  #include <linux/phy.h>
>  #include <linux/pid_namespace.h>
> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> index 40c1f549b0bae9fd9aa3f41539ccb69896c2560d..7186fe9658ff2a143a43bd6b3500c9a6d6ef9630 100644
> --- a/rust/kernel/device.rs
> +++ b/rust/kernel/device.rs
> @@ -207,6 +207,16 @@ pub fn property_present(&self, name: &CStr) -> bool {
>          // SAFETY: By the invariant of `CStr`, `name` is null-terminated.
>          unsafe { bindings::device_property_present(self.as_raw().cast_const(), name.as_char_ptr()) }
>      }
> +
> +    /// Populate platform_devices from device tree data
> +    pub fn of_platform_populate(&self) -> crate::error::Result<()> {
> +        crate::error::to_result(unsafe { bindings::devm_of_platform_populate(self.as_raw()) })

Don't you have to document the unsafe stuff here?

> +    }
> +
> +    /// Remove devices populated from device tree
> +    pub fn of_platform_depopulate(&self) {
> +        unsafe { bindings::devm_of_platform_depopulate(self.as_raw()) }

Same here?

And I'm going to think that not using devm_ as part of the rust binding
name is going to do nothing but cause people confusion over time...

thanks,

greg k-h
