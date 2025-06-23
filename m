Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C9A274FD4;
	Mon, 23 Jun 2025 15:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750693791; cv=none; b=ua2Okhj0csMf0zVj8CUVqDlyJFw4VtoHKSZG36nuAC51S/9KCDCm0WBvgswzrAnikbuXgPzMT2i0PSAG/oWjqpIgO1iImKy+5Cc+ceCXou8b6GG/wBByO+zz3vNVJ6WW3YT9XPg3yILqjW74nbLrdcB/osuGcsrbYRV0zMcCfao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750693791; c=relaxed/simple;
	bh=p5jsOelRBofIlMfVGe6HPkogI/0BxX7s0UubjR2mgu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivNPq37M1hvkJdEha/gWi5ZfVwENLZcYkcz/eZg0fLt/gca8FTGqRQOUfTzsYRtksROTFfw4BcTz7JYsrfTMiA6sa5kRMyHKnja6/fBunwPD0UgW92giaowXXspW268tfThl0+EkK/4OgsrN58+Y4P6ZfaJyVkhPb8CCOlldikk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=llcJ8Bg1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="llcJ8Bg1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA41C4CEEA;
	Mon, 23 Jun 2025 15:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750693791;
	bh=p5jsOelRBofIlMfVGe6HPkogI/0BxX7s0UubjR2mgu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=llcJ8Bg1Cy/Z3eqrc0ESCpAK6W+TzwQFUwZDST71d97WHXB8iMvahuHygI4DiYht4
	 LkBSWHEx2Q9wMbqJK1bNcNzCf7QJzn9P7LP4grCL6fSRx4Vn479snBGRk5ioartO/3
	 HKHSYhoccEVZ2rsjfzr8QoIHVHhashvSQ2kD4OddIO1d+vR0rT586WR/MCpwpgAKbu
	 GbsG715t+DqU+8LvhGKySzpntlEM6czIP4kQDWsbnt3np50GrCXJq1h+NlXgU8jnZP
	 dZY+S+GCIZhf9xqDclY9Ur/Cjr3sCvOdMdlo46DEjDpl2g+xyiNh/atpzhWWAv3C0i
	 TbeXVQzslIW9Q==
Date: Mon, 23 Jun 2025 17:49:44 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Benno Lossin <lossin@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 02/24] rust: dma: expose the count and size of
 CoherentAllocation
Message-ID: <aFl3mE-i_FInwJK5@cassiopeiae>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
 <20250619-nova-frts-v6-2-ecf41ef99252@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619-nova-frts-v6-2-ecf41ef99252@nvidia.com>

On Thu, Jun 19, 2025 at 10:23:46PM +0900, Alexandre Courbot wrote:
> These properties are very useful to have (and to be used by nova-core)
> and should be accessible.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to alloc-next, thanks!

  [ Slightly extend the commit message. - Danilo ]
