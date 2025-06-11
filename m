Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45602777F9;
	Wed, 11 Jun 2025 12:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749643718; cv=none; b=dEkYOXAI14APbXApiBJg/+Vbene9G2zp3mbuG+KQdQ9ZIe53Cw/nhH/P99enl8SGvtrcE8B3u4GNmGaTbkdCVGUVtyPDAIG4+fCBmsgr9wCdyV7ZjxJGzYH87IKig7idT0NFucuJXKYj2RtzmHa4ZzsdtFFY/jP7uFYP9IH5t5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749643718; c=relaxed/simple;
	bh=AnIiuo8BIh5hjVnofxK+qJ7JMiLRx8UmXZqyBno9Lv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=siWRoiS24gQAXvHFgfvhucxPCEH5J7UOTrz5KvFTdneW7FvTJvEDcdii+uRMxB/yRtRqlnni6CPoMjYz9K5xNhljS3PU8DQ/ejdc1mX0zLpm79sjEXvbVL9HgZynOiaQSbFxH7OD9w9s3/7hxc3nL3WODA/u4Dypju5WbqHfUm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wu7T6Ezs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wu7T6Ezs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81DDBC4CEEE;
	Wed, 11 Jun 2025 12:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749643718;
	bh=AnIiuo8BIh5hjVnofxK+qJ7JMiLRx8UmXZqyBno9Lv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wu7T6EzsDP3hw85m+kw487h0aX/by7owc5icNs8fS3XI90yYgAP6DpsJA/Y/et4zV
	 UUo1Vumm5U/Znx2Tqr9dlWz9bl/sRE27B7g6OlxEdNtfmlBAV+3styJ23XlldwDwLX
	 IO58CaqW/tCIxWEaJ9SRYN6gpZu1wuNF+FCrc1efFLF82/Hi7dYx9K+XYa3y+Lw87+
	 SG70TW5hs1+FDQaisn5yvymCBjFYZrOU8QdHqWUV4014c3NffZsSEHfu3rJDBL0cxR
	 Plhn+fevcmqECIw24pnOXQnxHJFy+QY+mwdE+yh6BghIPBDwuZP7xUFtot9HgKmfX5
	 4qFjA+b9n5yIA==
Date: Wed, 11 Jun 2025 14:08:31 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 3/9] rust: device: Move property_present() to FwNode
Message-ID: <aElxv3hRIc6Z_7jg@cassiopeiae>
References: <20250611102908.212514-1-remo@buenzli.dev>
 <20250611102908.212514-4-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611102908.212514-4-remo@buenzli.dev>

(+Viresh, FYI)

On Wed, Jun 11, 2025 at 12:29:02PM +0200, Remo Senekowitsch wrote:
> The new FwNode abstraction will be used for accessing all device
> properties.
> 
> It would be possible to duplicate the methods on the device itself, but
> since some of the methods on Device would have different type sigatures
> as the ones on FwNode, this would only lead to inconsistency and
> confusion. For this reason, property_present is removed from Device and
> existing users are updated.
> 
> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> ---
>  drivers/cpufreq/rcpufreq_dt.rs | 3 ++-
>  rust/kernel/device.rs          | 7 -------
>  rust/kernel/device/property.rs | 7 +++++++
>  3 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
> index 94ed81644fe1c..4eb240dc9fdc8 100644
> --- a/drivers/cpufreq/rcpufreq_dt.rs
> +++ b/drivers/cpufreq/rcpufreq_dt.rs
> @@ -20,7 +20,8 @@
>  /// Finds exact supply name from the OF node.
>  fn find_supply_name_exact(dev: &Device, name: &str) -> Option<CString> {
>      let prop_name = CString::try_from_fmt(fmt!("{}-supply", name)).ok()?;
> -    dev.property_present(&prop_name)
> +    dev.fwnode()?
> +        .property_present(&prop_name)
>          .then(|| CString::try_from_fmt(fmt!("{name}")).ok())
>          .flatten()
>  }
> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> index b69f03a7f8d30..241a395d529a1 100644
> --- a/rust/kernel/device.rs
> +++ b/rust/kernel/device.rs
> @@ -6,7 +6,6 @@
>  
>  use crate::{
>      bindings,
> -    str::CStr,
>      types::{ARef, Opaque},
>  };
>  use core::{fmt, marker::PhantomData, ptr};
> @@ -219,12 +218,6 @@ pub fn fwnode(&self) -> Option<&property::FwNode> {
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
> index 03850b7bb8087..50c61aa056e6b 100644
> --- a/rust/kernel/device/property.rs
> +++ b/rust/kernel/device/property.rs
> @@ -8,6 +8,7 @@
>  
>  use crate::{
>      bindings,
> +    str::CStr,
>      types::{ARef, Opaque},
>  };
>  
> @@ -55,6 +56,12 @@ unsafe fn from_raw(raw: *mut bindings::fwnode_handle) -> ARef<Self> {
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
