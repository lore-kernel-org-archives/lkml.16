Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7EF216396;
	Thu,  1 May 2025 10:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746094616; cv=none; b=M1epP/2aeBFqUH6fdW41+IgzotzDXv+zcZBUlr/X7H9d8sijhMqNpIZr+dyGLi2Fj2vrFQ30Wa0BpMeAaVD1LVbm+m/Xx4yNRrOAcNVdtrhjozoaFtpY94jkc52OygiBL3JDwBQTOPH4EU5s4xpSdIDfyVd/gZacM6HzrrvNqRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746094616; c=relaxed/simple;
	bh=Cr3ZHSzEgeKFgHuefrtMvoEvE5amHsyjFsNRgb1wYek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRsmHWlY4SfS/2OlOxxy2rjGwTI50nCdR6oF6NY5MLTFxQt5qQZPHKRHSFTcuzSQceCflGjpN/OvatnFacfvtmbvEqeABNMuVeG5dreoqjauznc8C8xnpYZIvdLUybOrBW9SVQO29zKeFF+pNuTR9EiFfvyFXLYTJTS6D+ndGSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJjU7zSJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJjU7zSJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50999C4CEE4;
	Thu,  1 May 2025 10:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746094615;
	bh=Cr3ZHSzEgeKFgHuefrtMvoEvE5amHsyjFsNRgb1wYek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJjU7zSJB0ThYaiFmiFVHdZoxpypb2QZE3dBAChYygzui6h8hhgQ+upOUgdKrwzRO
	 WrnL04MSPLGnsnqeI0q3tT1vpj/Z+Uyh/KueuUYFoqnoGytyqCAQXsB8P/BwtqmQqe
	 Cqs/REGwRPJU+mAHqnCO5TbqXvT7MktTU/n5+jG8QEieRwEryU98HcrK14CAHlSbt4
	 hH0NO6iOET4haXZRvAL96YXuNIO9muPS5ANwHaeRoNFgA/DXvaQn1Wv1ew6MLJ8VVf
	 /bU4xcb6rxNE8PO8bdWdK6idB6RCj1mYuewQU9YJbOjdZrrrg4ZTTVm6gRohAeZp5V
	 121OS4aBOsA5w==
Date: Thu, 1 May 2025 12:16:49 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/4] rust: debugfs: Bind DebugFS directory creation
Message-ID: <aBNKEewhCP8jRIZL@pollux>
References: <20250430-debugfs-rust-v2-0-2e8d3985812b@google.com>
 <20250430-debugfs-rust-v2-1-2e8d3985812b@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-debugfs-rust-v2-1-2e8d3985812b@google.com>

On Wed, Apr 30, 2025 at 11:31:56PM +0000, Matthew Maurer wrote:
> 
> +    /// Create a DebugFS subdirectory.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::c_str;
> +    /// # use kernel::debugfs::Dir;
> +    /// {
> +    ///    let parent = Dir::new(c_str!("parent"));
> +    ///    // parent exists in DebugFS here.
> +    ///    let child = parent.subdir(c_str!("child"));
> +    ///    // parent/child exists in DebugFS here.
> +    /// }
> +    /// // Neither exist here.
> +    /// ```
> +    pub fn subdir(&self, name: &CStr) -> Self {
> +        Self::create(name, Some(self))
> +    }

I think this should return a new type (SubDir), which is a transparent wrapper
of Dir and dereferences to Dir.

Subsequently, we can remove Dir::keep() implement SubDir::keep() instead. This
ensures that we can never call keep() on the root directory, which would always
be a bug.

As an alternative to the Deref impl, you can also implement
`From<SubDir> for Dir`, such that a SubDir can either be "kept" or converted to
a Dir. Probably, that's even better.
