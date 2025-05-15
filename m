Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B15C1A8F60;
	Thu, 15 May 2025 16:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324897; cv=none; b=M7tvPbaui63z+prknB8szTboHgx3QllmhouG84I90Nn0kkoUjw2oyokba/hdf3Xh9hMdAq+sKCqgc3ewKycwKACwMHc8/dldWpUIg+oIOBPoDlq24mbDnXmTNJHZvJYOH4GqzhRV5P3/q9654joNHyCqdariQvp++iVQcfntg5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324897; c=relaxed/simple;
	bh=/etv6FhAOMtkeW4iQwy/VQCKZ10duMq8G/6MNyszHSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFHX1156/KghG6FCzwCxIxVMGGOrrxGb4FFMBNo5EL/ujBrUAlcnVKowXpssq60rYHgNbkv2W+lWqVPQ7XKKD2rXizM3nfQNXifZGLFGT7u7kP+2K8hTc+e3LPq+231rXnzx0O8PbRZBpJPVPqq7UZ51HgA31JNP95LvWllLXRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q25G/zH7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q25G/zH7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3D8C4CEE7;
	Thu, 15 May 2025 16:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747324897;
	bh=/etv6FhAOMtkeW4iQwy/VQCKZ10duMq8G/6MNyszHSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q25G/zH71Wlj2naF1VSDhTfa8OoDvyjXREDkq+JxqSTafFi4kaCoHg4qxwFNwajyF
	 ciwBjJtk/1yIBGDDqihLGOwKMacM0qYcfk9RgHeF2fO4z+qw7g0qfQkVz7BR29HSiB
	 18W/ZahDF9uDVelC/Etmipgco/QZqJ9JZlwkoVjGeflNgktmCbyyS+zXIDBocNvyfA
	 20sELMwKw3l1CtOs+Pz+mcm8XgN0N221540HRxu0ogKJkDEHbI0Gi75XJhc7eup8eT
	 kSBIY/W1YqjT8vaAqu6Ti/leHUoRdnirjdbLZhILF224KXYvU7dreM7xH4SmiEyjGt
	 sTJFHMNSdFUrg==
Date: Thu, 15 May 2025 18:01:30 +0200
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
Subject: Re: [PATCH v8 2/3] rust: io: mem: add a generic iomem abstraction
Message-ID: <aCYP2j6R7NkcC2ya@pollux>
References: <20250509-topics-tyr-platform_iomem-v8-0-e9f1725a40da@collabora.com>
 <20250509-topics-tyr-platform_iomem-v8-2-e9f1725a40da@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-topics-tyr-platform_iomem-v8-2-e9f1725a40da@collabora.com>

On Fri, May 09, 2025 at 05:29:47PM -0300, Daniel Almeida wrote:
> +impl<const SIZE: usize> ExclusiveIoMem<SIZE> {
> +    /// Creates a new `ExclusiveIoMem` instance.
> +    pub(crate) fn ioremap(resource: &Resource) -> Result<Self> {
> +        let iomem = IoMem::ioremap(resource)?;
> +
> +        let start = resource.start();
> +        let size = resource.size();
> +        let name = resource.name();
> +
> +        let region = resource
> +            .request_region(start, size, name, io::resource::flags::IORESOURCE_MEM)
> +            .ok_or(EBUSY)?;
> +
> +        let iomem = ExclusiveIoMem {
> +            iomem,
> +            _region: region,
> +        };
> +
> +        Ok(iomem)
> +    }
> +
> +    pub(crate) fn new(resource: &Resource, device: &Device) -> Result<Devres<Self>> {
> +        let iomem = Self::ioremap(resource)?;
> +        let devres = Devres::new(device, iomem, GFP_KERNEL)?;

Here and in IoMem, Devres::new() requires a &Device<Bound>.
