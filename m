Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CE422D79D;
	Fri, 16 May 2025 08:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747384763; cv=none; b=rnW5zC+pn+calR8EA6MAQWyzDGmlwpfG5z5XzZU0z46a/WrfQH0DfCNvdgmXCm9PRDxyvdQy9Nzay46UGfpbQOmreFFTWb3jPSVTCbEXrrU5q/Lz+5IY6MELNwx2pwppL9ljgz1ormDd6JYT6t9e0XGsD3rU+vut13IVUtvXjH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747384763; c=relaxed/simple;
	bh=H0odFVdYFn4C9hDrXHlEI4anEVr44q9kFLG4xs2B2pA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NdMF99yDQ59gnYYvA9OMAzEzN+y/3y9VzZfsZ/O1RxKzwag4wiHcp3xLhSVS+we0VBwHDcI0HpCIdT9Z7TgRJ5E+YBYICY9PhAMZk0pLQvTEu97E9k8w+klW8jMmaYst8IEl1jfKTJZR3IvZyIl2bvwGXHvAkHBYVGqF1uAmfNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5/tRmMQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5/tRmMQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E924FC4CEED;
	Fri, 16 May 2025 08:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747384760;
	bh=H0odFVdYFn4C9hDrXHlEI4anEVr44q9kFLG4xs2B2pA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M5/tRmMQfeFyvXdfGzyzX03b7n8Mov6N0Sw6gXe/vg9/jibSILlWrFOkwhtEz9AnB
	 LsLg3IENV7KG6wuZO6oKxlIbBoGYZaiTBcBv2O2Sh0OI/TGFbPXJuJvQTJxjEU4Nez
	 Muy4x+FZYzReJ1YKgd6KzTu4jZb5lZieAwaF7+sk+4emhqyfIRj+ZTy8s644TfJBgy
	 Y9kQ5XfKymMhRkb9dlGyK80TCfmOKvaArz0+BgmWMjWvNOG3M8KMekchZGK5clMHz1
	 C7vQdgKMUFj71IndKSLTy5xzDlmUBxpW0bg1FzhkjW3ucJELEG4h2M6N3/f0NqGPOJ
	 ogVF1F492nqUQ==
Date: Fri, 16 May 2025 10:39:09 +0200
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
Message-ID: <aCb5rTrg-OmlB1Cq@pollux>
References: <20250509-topics-tyr-platform_iomem-v8-0-e9f1725a40da@collabora.com>
 <20250509-topics-tyr-platform_iomem-v8-3-e9f1725a40da@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-topics-tyr-platform_iomem-v8-3-e9f1725a40da@collabora.com>

On Fri, May 09, 2025 at 05:29:48PM -0300, Daniel Almeida wrote:
> +impl Device<device::Core> {

For the ioremap_*() ones, `impl Device<device::Bound>` should be enough.

Also, PCI names those just iomap_*(), maybe we should align those names for
consistency.
