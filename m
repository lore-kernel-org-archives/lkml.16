Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C495A111AD;
	Wed, 28 May 2025 18:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748455583; cv=none; b=I0DGH0oUwC1vztlYifPcbYUt01UWgFUhWO0lYSvFauvVcepyABr5b9HkeZxl2mrBn7a1HJ225327sUr1YIeebrjPN16r38CSvV495uztzvANfLUD1zZtLiwQSBfXzyn8/QwBZriUDLEy0K1gZ+6HodII5PK0QjnjHHM/yY2nNvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748455583; c=relaxed/simple;
	bh=SwYQFIc7r2JHQ2hnmDJnXLD9YNcIS11EmU+W4n5WpnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ioTWUxN7Qflcgv4wD+BORdChkgsBa0Ung05XWhUbr3OR8AE2Tt7c7XqcXM5XOeZLXioqcR2bXnNItVxzG7L3JPESpwSKEjloUjTHs44x6SzMNhvoaRALzqnZcbKR7fVSI2UkHwzi6M5Gi1x5tG0dCCMSts9CmSlT5oXnMkcCHtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tPYy9JI5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tPYy9JI5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DC1C4CEE3;
	Wed, 28 May 2025 18:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748455583;
	bh=SwYQFIc7r2JHQ2hnmDJnXLD9YNcIS11EmU+W4n5WpnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tPYy9JI5+Gq5oIXon40EQ7pZd9jgDOyyAG7rfA1wIsXVU6Qg1E7TFYs9rekn7ijcZ
	 czdAEjOqRjbCaQC5a1Zf4ZXBhNSpGOM39Oj+BUsp0Ckgzc7oP4wjVoJpmhgSzBO8UY
	 5oUxUni4HiriTQY9fnXq7QAo5h55D801ScHz80ztdfprIIDTx7TDfUn9rwRHrCdzi+
	 ysZHBygnTEMVto2mSjV+I5Ulb/YBHAebj1cxrloW8JxHyYDno1597lDZ496iqVPqrU
	 ZtE5dX013juINIBqTO3C/BtjYmsX30k0MKDhpZ0Hec8EXu8wiVsfefoMfdmdpninH4
	 pmAXzwCsHDwEQ==
Date: Wed, 28 May 2025 20:06:16 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
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
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 3/3] rust: platform: allow ioremap of platform
 resources
Message-ID: <aDdQmJ-pen_MQNDB@cassiopeiae>
References: <20250509-topics-tyr-platform_iomem-v8-0-e9f1725a40da@collabora.com>
 <20250509-topics-tyr-platform_iomem-v8-3-e9f1725a40da@collabora.com>
 <aCYVG-VVdJXYnSTt@pollux>
 <5B875DFB-D655-4BAC-A475-43AE309520E2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5B875DFB-D655-4BAC-A475-43AE309520E2@collabora.com>

On Wed, May 28, 2025 at 02:29:44PM -0300, Daniel Almeida wrote:
> Hi Danilo,
> 
> […]
> 
> > 
> >> +    ///     let offset = 0; // Some offset.
> >> +    ///
> >> +    ///     // If the size is known at compile time, use `ioremap_resource_sized`.
> >> +    ///     // No runtime checks will apply when reading and writing.
> >> +    ///     let resource = pdev.resource(0).ok_or(ENODEV)?;
> >> +    ///     let iomem = pdev.ioremap_resource_sized::<42>(&resource)?;
> >> +    ///
> >> +    ///     // Read and write a 32-bit value at `offset`. Calling `try_access()` on
> >> +    ///     // the `Devres` makes sure that the resource is still valid.
> >> +    ///     let data = iomem.try_access().ok_or(ENODEV)?.read32_relaxed(offset);
> >> +    ///
> >> +    ///     iomem.try_access().ok_or(ENODEV)?.write32_relaxed(data, offset);
> > 
> > Since this won't land for v6.16, can you please use Devres::access() [1]
> > instead? I.e.
> > 
> > let iomem = pdev.ioremap_resource_sized::<42>(&resource)?;
> > let io = Devres::access(pdev.as_ref())?;
> > 
> > let data = io.read32_relaxed(offset);
> > io.write32_relaxed(data, offset);
> > 
> > Devres::access() is in nova-next and lands in v6.16.
> > 
> > [1] https://gitlab.freedesktop.org/drm/nova/-/commit/f301cb978c068faa8fcd630be2cb317a2d0ec063
> 
> Devres:access takes &Device<Bound>, but the argument in probe() is
> &Device<Core>.
> 
> Are these two types supposed to convert between them? I see no explicit
> function to do so.

Yes, it comes from impl_device_context_deref!() [1], which, as the name implies,
implements the corresponding Deref traits.

Device dereference in the following way:

	&Device<Core> -> &Device<Bound> -> &Device (i.e. &Device<Normal>)

You can just pass in the &Device<Core>, it will work.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git/tree/rust/kernel/device.rs?h=driver-core-next#n284
