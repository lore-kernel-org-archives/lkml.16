Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB5823C8D6;
	Fri,  7 Feb 2025 18:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952247; cv=none; b=sGSfoZAwE/h1S2qGN74MV8DUSykijX0Wrph2A78VSjJ9zFnhHqRUacuTq4iAgUlRJSpzju387TYvBl0bMhY1wZHDLkFTE69qOlTGrB3NNbavaRmOQTdYOZh5F4sl9+s5iAekLeA1ACOgADtGUbKKCExSd+hz1Vr3qpWiMrcyAj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952247; c=relaxed/simple;
	bh=MQyviWzYjxp0l2AJi0hRyQfYReCzQHDwKEcEKNmQxMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPVB3uPPjhFCWA4NfQtG12gDBn8vDNqBOjnI37ecX7xfecYnfmmxHsdXl2cGDlWNv3fM/pnTke0YsqQYX6bbYqHZRDW7Ks7CyiOxHxNmJyVZH+BAoVjnkuerGLTJBDA3A9yVrpInczBOam28Us6+llqmfnVoOJrMAGFizM2kl5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jSq2Vleb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jSq2Vleb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 847EEC4CED1;
	Fri,  7 Feb 2025 18:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738952247;
	bh=MQyviWzYjxp0l2AJi0hRyQfYReCzQHDwKEcEKNmQxMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jSq2Vleb/VpCehpgV9otWpOxLiRNYcOyRJPHYW+NrxQtliv4qyPfDkPBS1jiJFNZg
	 XUzF0iGQa7Ez6N5+3mZljaB64Px/rv/oK4Fy7PFay772GHgHqj2hOsy8+y4XiXCp7H
	 o39+iudDFFW+HH9T4sHpSMWq1ZX8N1fYH9eG9ENI3xOP75iRJ1OMnyrBls2HG3hpqa
	 Dr3ElVN0QS4VKv2G7zqYfit1zukyzesOKQNGbFpHNi7k4j9Wm1taZ6VxiFLcS3NrRW
	 TZT2Ss9oQRaXZ9iwWjq+DTsUM3lOVntV3lqqMPwExY3tCtmupGtcqajoUNd4i5lNIP
	 volIAQPBxp92Q==
Date: Fri, 7 Feb 2025 19:17:20 +0100
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
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust/kernel: Add faux device bindings
Message-ID: <Z6ZOMD__u4VbH8ME@pollux>
References: <20250207004049.178049-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207004049.178049-1-lyude@redhat.com>

On Thu, Feb 06, 2025 at 07:40:45PM -0500, Lyude Paul wrote:
>
> +/// The registration of a faux device.
> +///
> +/// This type represents the registration of a [`struct faux_device`]. When an instance of this type
> +/// is dropped, its respective faux device will be unregistered from the system.
> +///
> +/// # Invariants
> +///
> +/// `self.0` always holds a valid pointer to an initialized and registered [`struct faux_device`].
> +///
> +/// [`struct faux_device`]: srctree/include/linux/device/faux.h
> +#[repr(transparent)]
> +pub struct Registration(NonNull<bindings::faux_device>);
> +
> +impl Registration {
> +    /// Create and register a new faux device with the given name.
> +    pub fn new(name: &CStr) -> Result<Self> {
> +        // SAFETY:
> +        // - `name` is copied by this function into its own storage
> +        // - `faux_ops` is safe to leave NULL according to the C API
> +        let dev = unsafe { bindings::faux_device_create(name.as_char_ptr(), null()) };
> +
> +        // The above function will return either a valid device, or NULL on failure
> +        Ok(Self(NonNull::new(dev).ok_or(ENOMEM)?))

Since the type has an "Invariants" section, you need to add "INVARIANT:" to this
comment.

> +    }

...

> diff --git a/samples/rust/rust_driver_faux.rs b/samples/rust/rust_driver_faux.rs
> new file mode 100644
> index 0000000000000..81ec465d52651
> --- /dev/null
> +++ b/samples/rust/rust_driver_faux.rs
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Rust faux device sample.
> +
> +use kernel::{c_str, faux::*, prelude::*, Module};
> +
> +module! {
> +    type: SampleModule,
> +    name: "rust_faux_driver",
> +    author: "Lyude Paul",
> +    description: "Rust faux device sample",
> +    license: "GPL",
> +}
> +
> +struct SampleModule {
> +    _dev: Registration,

Probably forgot to change this to "_reg" or similar.

Also, maybe faux::Registration here and below, personally I tend to find it a
bit more obvious. But of course totally up to you.

> +}
> +
> +impl Module for SampleModule {
> +    fn init(_module: &'static ThisModule) -> Result<Self> {
> +        pr_info!("Initialising Rust Faux Device Sample\n");
> +
> +        let dev = Registration::new(c_str!("rust-faux-sample-device"))?;
> +
> +        dev_info!(dev.as_ref(), "Hello from faux device!");
> +
> +        Ok(Self { _dev: dev })
> +    }
> +}
