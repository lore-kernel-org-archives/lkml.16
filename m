Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9D510E0;
	Sat,  5 Jul 2025 17:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751736495; cv=none; b=SYo6Ba/Tx884TwtIk05jSaDLStV9bwwNnTwwLHoyrFLJDgg0EOqspIWPl5YSbDdHzEmctKC0G+dfxC4AuukJ+6bPL0bWOzz4pglosF6GQhJp2i3GdPVNmFjQO5SYG7g/coRGdqWJY/X1g2+LJ1JDfG/GKTRMInNeatN4Af2bfOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751736495; c=relaxed/simple;
	bh=YlxLzKes0woNFoFDq4Lln1Zi2b4y+fCRU3EgGSikovI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=df1BUyXfbnWVEAx+eSHwG6+BPGCLvoNnhv9VbUrkCDh7qsw0elZN/ByosHPvqGE5B9ak1EJnU2lhvPN1HovPOK/NpFCV9kE1+rS/Ie/NqwERs0NUMD2+OtyLo8xt+QwABeTEE7kIM4aw1oDMr/sZ9cEN1o0IypfQccKxaOqGFuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ewj3gib3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ewj3gib3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A44F8C4CEE7;
	Sat,  5 Jul 2025 17:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751736494;
	bh=YlxLzKes0woNFoFDq4Lln1Zi2b4y+fCRU3EgGSikovI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ewj3gib3IFDYdHWkEMbERFojYaQQVMLJ4f+Fzaxpsn8E3M1Y6Laf+KZkoIVeEeioF
	 kWLN6M6rzQULjdmttqI5OAWa30IsYF7nKiIDygc1GTHUDnb4Cx1FBrRB1OweQcDlZI
	 tiesK357KjQFRUkzcaEnu6b2ymPjHOl/WDXWpa/KI/cHY60bLK5EXUwFtZ0+3IUzHf
	 HpYSnDSSnF51jfKbklSSwwby0znE/gAsNx50b6O3ZpDF5+N/R2QWC3GoYgndo2U3q6
	 Z68rlpos+p7TWwpnCxIw6E9pY1tgSDOMC0AVrCmBaj+Hf95ySTLPK/K1rTQGfMnZgb
	 bkGVPdErKZ1gQ==
Date: Sat, 5 Jul 2025 19:28:07 +0200
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
Subject: Re: [PATCH v12 1/3] rust: io: add resource abstraction
Message-ID: <aGlgpyuz2JKErAUj@cassiopeiae>
References: <20250704-topics-tyr-platform_iomem-v12-0-1d3d4bd8207d@collabora.com>
 <20250704-topics-tyr-platform_iomem-v12-1-1d3d4bd8207d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-topics-tyr-platform_iomem-v12-1-1d3d4bd8207d@collabora.com>

On Fri, Jul 04, 2025 at 01:25:26PM -0300, Daniel Almeida wrote:
> +/// Resource Size type.
> +///
> +/// This is a type alias to either `u32` or `u64` depending on the config option
> +/// `CONFIG_PHYS_ADDR_T_64BIT`.
> +#[cfg(CONFIG_PHYS_ADDR_T_64BIT)]
> +pub type ResourceSize = u64;
> +
> +/// Resource Size type.
> +///
> +/// This is a type alias to either `u32` or `u64` depending on the config option
> +/// `CONFIG_PHYS_ADDR_T_64BIT`.
> +#[cfg(not(CONFIG_PHYS_ADDR_T_64BIT))]
> +pub type ResourceSize = u32;

I think someone commented on this previously, but maybe I also do not remember
correctly.

Anyways, can't we just do:

	pub type ResourceSize = bindings::phys_addr_t;

Given that phys_addr_t is already either u32 or u64.
