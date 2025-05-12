Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF75C296D23;
	Mon, 12 May 2025 17:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747070999; cv=none; b=QhqLKDjw8nY4TnWUyWx+Cp48B9S1OIzS6Ngn2IwPebmsUF3motMOni7VM/425YIFetGgrrCuTmZz5zJQmVRtX64nzu9Y5AtTVDttVgY7VqCSEKNugCzUIqryz4B+xcAlMdyYcqtw1ioVzlQxo2RAMx79RgekdkB6spLCczOGsmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747070999; c=relaxed/simple;
	bh=ohP3qwU/g292m6VUOxkkeEfG4yKASr7Uz6QM0jrslJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtxvCG127PIrhEnx03aPrZ8SRuqy2m8ESlk96VzmD05vyfIDkq56B/MNxxXZrNDVEvBSz9vV7XPATC8ciytvFk0SkH4cQayDV753jhN9TNeglnnovG8zy6j48IQYaiVjkNY/OYnRTNRba7R1wyExvuQ3opob4XEc6rLLvyQqm7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RCCPTbi7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RCCPTbi7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BFB6C4CEE7;
	Mon, 12 May 2025 17:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747070999;
	bh=ohP3qwU/g292m6VUOxkkeEfG4yKASr7Uz6QM0jrslJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RCCPTbi7SjeUkqsta7xtU0G8ZJkwCEaeIhgmNOGdlIBXZTqqKIGTUahgIx8fY/T2+
	 8W/EJzP0D+7cA+QqLG9BSmlnb/Mp4/8OQADhfnY1vg3kQCUiC23CdDl8ZBPC35i/OE
	 whsVWKEpMii9g7p4cZ7xhUOC1MzOvwD3RS2cQADZIQAyRk1CzUAEiBbbNwsicjZZjV
	 sKuqnKFB6sLK9+KqU9wECDoDraj2HHWFuEli+e2rDP/AEZy5+m+Jvhw6FadWPNWWbe
	 4kbxza4L8O1gnhgBdL+cSs8TGhMcCoxsK2iQ4eR1wgHL2yhSINlX8f0ihGuVallwol
	 toQ1zqJOvaa0Q==
Date: Mon, 12 May 2025 12:29:57 -0500
From: Rob Herring <robh@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 3/9] rust: device: Move property_present() to FwNode
Message-ID: <20250512172957.GB3463681-robh@kernel.org>
References: <20250504173154.488519-1-remo@buenzli.dev>
 <20250504173154.488519-4-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250504173154.488519-4-remo@buenzli.dev>

On Sun, May 04, 2025 at 07:31:48PM +0200, Remo Senekowitsch wrote:
> The new FwNode abstraction will be used for accessing all device
> properties, so it must have the property_present method.
> 
> It's possible to duplicate the methods on the device itself, but since
> some of the methods on Device would have different type sigatures as the
> ones on FwNode, this would only lead to inconsistency and confusion.
> Hence, remove the method from Device.
> 
> There aren't any users to update yet.

But there is one going into 6.16 most likely with the cpufreq stuff[1] 
which complicates merging.

Rob

[1] https://lore.kernel.org/all/f7e96b7da77ac217be5ccb09b9309da28fd96c90.1745218976.git.viresh.kumar@linaro.org/

> 
> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> ---
>  rust/kernel/device/mod.rs      | 7 -------
>  rust/kernel/device/property.rs | 8 +++++++-
>  2 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/rust/kernel/device/mod.rs b/rust/kernel/device/mod.rs
> index b4b7056eb80f8..15d89cd45e871 100644
> --- a/rust/kernel/device/mod.rs
> +++ b/rust/kernel/device/mod.rs
> @@ -6,7 +6,6 @@
>  
>  use crate::{
>      bindings,
> -    str::CStr,
>      types::{ARef, Opaque},
>  };
>  use core::{fmt, marker::PhantomData, ptr};
> @@ -200,12 +199,6 @@ pub fn fwnode(&self) -> Option<&property::FwNode> {
>          // defined as a `#[repr(transparent)]` wrapper around `fwnode_handle`.
>          Some(unsafe { &*fwnode_handle.cast() })
>      }
> -
> -    /// Checks if property is present or not.
> -    pub fn property_present(&self, name: &CStr) -> bool {
> -        // SAFETY: By the invariant of `CStr`, `name` is null-terminated.
> -        unsafe { bindings::device_property_present(self.as_raw().cast_const(), name.as_char_ptr()) }
> -    }
>  }
>  
>  // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
> index e75d55f5856cf..70593343bd811 100644
> --- a/rust/kernel/device/property.rs
> +++ b/rust/kernel/device/property.rs
> @@ -6,7 +6,7 @@
>  
>  use core::ptr;
>  
> -use crate::{bindings, types::Opaque};
> +use crate::{bindings, str::CStr, types::Opaque};
>  
>  /// A reference-counted fwnode_handle.
>  ///
> @@ -31,6 +31,12 @@ impl FwNode {
>      pub(crate) fn as_raw(&self) -> *mut bindings::fwnode_handle {
>          self.0.get()
>      }
> +
> +    /// Checks if property is present or not.
> +    pub fn property_present(&self, name: &CStr) -> bool {
> +        // SAFETY: By the invariant of `CStr`, `name` is null-terminated.
> +        unsafe { bindings::fwnode_property_present(self.as_raw().cast_const(), name.as_char_ptr()) }
> +    }
>  }
>  
>  // SAFETY: Instances of `FwNode` are always reference-counted.
> -- 
> 2.49.0
> 
