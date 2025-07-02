Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7D21BD035;
	Wed,  2 Jul 2025 18:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751480185; cv=none; b=kKPiHZ1UpFzgMAAPrZl5SBxV5PdboSok8v8Sx0OaIPLd9lLioircArjVXMxnidGShicLe03nUKLgebeCJwf6k+aICvqz2xWmh3Zc7/gtvn7bE2sXR8PfVCMEJ6HBGSaSAcNGdTfgyu7oNzP7BD1PqlzSQm5DIZzohBXZn50GxNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751480185; c=relaxed/simple;
	bh=QemdGRdGZsaQRA7jNPJkWvdluJuEqGsfp+Y6io2KtNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2PXQIUYpyMMcawTggG6QFHyLl0Hl2qhu5qKd2nXV1u8YHhbL/YGY5Oe6IMHNgdOAkJjeCRr/FQGgvj+FXqvYoIBWxo6LtF/Wj5IPvOBYBM5fmSP3ZteTwJERboevhXHSTSv0oLlIyxxGktZ9yzl5tsCyAxjtOF9+ZI5GaoZ75w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AUbMFdqr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AUbMFdqr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE43AC4CEE7;
	Wed,  2 Jul 2025 18:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751480184;
	bh=QemdGRdGZsaQRA7jNPJkWvdluJuEqGsfp+Y6io2KtNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AUbMFdqr7IOM/XDRYx2TVE1Qs6unGKZygcUD9PQ99G25eQsWvmxLw91+0CWwHjTwf
	 ytVsnxLAGPf8yJRJYordmm2jC0ofS5C+dIpeh33UK/ALnfRyil8T5nmOG9BlAqoOdD
	 XEJ3D70d9q9x3v1WotM4ktrX/wDJEPMLBxLv2ODQsyZ0NwLZZRIfUdA4eckdNtr0FQ
	 YFxr4S/+RGoxFGcU9i/VlGH0fYLezKERwWymuiuRo1D8PszL6c49RgH7q/BtYhNm7F
	 wgxDFB3zuUC/xIeEruXW77fbS++mBZTbINr/VFwjz4b2OvQN3WWziMjWvHrxbRNIdJ
	 O9cvmWXUlBFvw==
Date: Wed, 2 Jul 2025 20:16:17 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Ying Huang <huang.ying.caritas@gmail.com>,
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, Fiona Behrens <me@kloenk.dev>
Subject: Re: [PATCH v11 1/4] rust: io: add resource abstraction
Message-ID: <aGV3ce3ZJEOanSMJ@pollux>
References: <20250701-topics-tyr-platform_iomem-v11-0-6cd5d5061151@collabora.com>
 <20250701-topics-tyr-platform_iomem-v11-1-6cd5d5061151@collabora.com>
 <6b8c65cc-d0cd-4022-8d8c-3a4aaf8d36e5@kernel.org>
 <4DF66D6F-C89E-4472-AB76-B3EB1CB6F07C@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4DF66D6F-C89E-4472-AB76-B3EB1CB6F07C@collabora.com>

On Wed, Jul 02, 2025 at 03:11:04PM -0300, Daniel Almeida wrote:
> Hi Danilo
> 
> > On 2 Jul 2025, at 07:21, Danilo Krummrich <dakr@kernel.org> wrote:
> > 
> >> +#[cfg(CONFIG_HAS_IOPORT)]
> >> +/// Returns a reference to the global `ioport_resource` variable.
> >> +pub fn ioport_resource() -> &'static Resource {
> >> +    // SAFETY: `bindings::ioport_resoure` has global lifetime and is of type Resource.
> >> +    unsafe { Resource::as_ref(&raw mut bindings::ioport_resource) }
> >> +}
> >> +
> >> +#[cfg(CONFIG_HAS_IOMEM)]
> >> +/// Returns a reference to the global `iomem_resource` variable.
> >> +pub fn iomem_resource() -> &'static Resource {
> >> +    // SAFETY: `bindings::iomem_resoure` has global lifetime and is of type Resource.
> >> +    unsafe { Resource::as_ref(&raw mut bindings::iomem_resource) }
> >> +}
> > 
> > This caught my attention, and I have a few questions:
> > 
> >  1) What do you need them for? I don't see any methods that would usually
> >     consume those.
> > 
> >  2) Why are they behind CONFIG_HAS_IOPORT and CONFIG_HAS_IOMEM, even though the
> >     C instances are not?
> > 
> >  3) What happens if we pass them to IoMem::new()? Is this really safe, or do we
> >     need them to be a special Resource type?
> > 
> 
> Good catch, actually.
> 
> I worked on this patch with Fiona and IIRC, she needed access to these two for
> her LED abstractions. This patch has seen a few iterations already and this may
> or may not be obsolete by now. I must say I've never used these before so I
> don't really know how they work nor do I need this at all.

They serve as parent / root resource instances, e.g. if you want to create new
resource regions yourself.

> Fiona, do you still need these two accessors?

I'd say let's drop them for now, we can easily add them later on in the context
of an actual user.
