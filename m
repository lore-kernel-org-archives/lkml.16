Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA75211A11;
	Sat,  5 Jul 2025 17:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751736881; cv=none; b=bniGijM6VqDh79MoGG32XM3poggJq+1CpfBC3p+ffoG89HokKlqNKbl+d8y5PBwXPkU8mr56E/WiPK2G2bOoKZweQCnd8E1rthl41gj/th6WzGfgAf6CtlJJ5N7zd8A5YbBGJbCrHR2D2yYXKVp11gxvnP1DtrKJJ1k+gQ2P3Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751736881; c=relaxed/simple;
	bh=+0Ul1OitS5n7/6Y4J/CBql5bB9ZtL1YtuNqEWklf5WQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXT9T3TsuWvD+kYgxURgoTb7FOid1i0p7uvUcuUuQZjY8hemr5JnEd5lwOKVmWyglwqndUVIm32QqNpJq6Fzur+oNLGQDIRFCzGISNOfo37SdZwrm/O3Meqdm9LWkoP3lsOR4tGNSlrUWDUm7DM0pc/YWuCI9PwFlbp/9lGEV/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDFewc3q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDFewc3q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0C1C4CEE7;
	Sat,  5 Jul 2025 17:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751736880;
	bh=+0Ul1OitS5n7/6Y4J/CBql5bB9ZtL1YtuNqEWklf5WQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iDFewc3qYhVOowha3y4Ay+wzLsXI5m3ZT+N0HP5TcdbXVBQQzLbFPdAoTOIkATHo+
	 LIA5g+qv68DL8f3qOEp+4G9SU11RhfnBUSiizDh0OUUz1pMhP3sdptO9o5aXGJyqIH
	 VQgBhS21rA+usboMM0p/k/acfJpqsz/BzyXZW46wheampRZDt30mwoDJ8uSjCMOIGu
	 ytcg4QpIKJRqxtD2zsaeW0oKiM1kWxAEPUaEe1mXYaBCxBVWWuEOofRX1Owkmk9kn4
	 SB5g3TEzBjiXu9MtXp8+4lxKZi9rLtP5/QXSly9pl4wvCkbTDgVCElb2BRyZ7jwEcu
	 +859zrIWXCcpA==
Date: Sat, 5 Jul 2025 19:34:33 +0200
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
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v12 3/3] rust: platform: add resource accessors
Message-ID: <aGliKRLJWfTs6rg0@cassiopeiae>
References: <20250704-topics-tyr-platform_iomem-v12-0-1d3d4bd8207d@collabora.com>
 <20250704-topics-tyr-platform_iomem-v12-3-1d3d4bd8207d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-topics-tyr-platform_iomem-v12-3-1d3d4bd8207d@collabora.com>

On Fri, Jul 04, 2025 at 01:25:28PM -0300, Daniel Almeida wrote:
> +impl Device<Bound> {
> +    /// Returns an `IoRequest` for the resource at `index`, if any.
> +    pub fn request_io_by_index(&self, index: u32) -> Option<IoRequest<'_>> {
> +        // SAFETY: `resource` is a valid resource for `&self` during the
> +        // lifetime of the `IoRequest`.
> +        self.resource_by_index(index)
> +            .map(|resource| unsafe { IoRequest::new(self.as_ref(), resource) })
> +    }
> +
> +    /// Returns an `IoRequest` for the resource with a given `name`, if any.
> +    pub fn request_io_by_name(&self, name: &CStr) -> Option<IoRequest<'_>> {
> +        // SAFETY: `resource` is a valid resource for `&self` during the
> +        // lifetime of the `IoRequest`.
> +        self.resource_by_name(name)
> +            .map(|resource| unsafe { IoRequest::new(self.as_ref(), resource) })
> +    }
>  }

I think we should name this io_request_by_index() and io_request_by_name()
instead. We're not requesting to remap I/O memory (yet), but trying get an
IoRequest instance, hence I think this order fits better.
