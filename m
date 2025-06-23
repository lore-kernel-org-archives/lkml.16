Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203F9274FD4;
	Mon, 23 Jun 2025 15:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750693816; cv=none; b=iyFBS5Gs1DSH/1FtXqhqfHaaPtMe5C1UjhZfX30zgUMjLBB/hlv16QrKASbhviWO7fJHeQJhKWpbkMquZnJnz6v3wZhr3lxS+rsGNwpEl+JOF+M583b91EtYhCoQApinn/OFGKU/u5iHIiLPucQbKZ7GIWS0GFi10/N5ir4ThV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750693816; c=relaxed/simple;
	bh=gbion1/qQxu9hmM1ZmDJCMvGF30yf1xFP7ClQFXYwrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ll5L9cMFTo6xBImXdAznly/3MTE5DwwSuN24LKFGMo9YPW8tJxtrtr8BQzcmU5iV3joRm9U5mgoABEIySguBb5NYvs0iQPznAqMTnoecJNiHNMHu+TWcCqONhG5LoWdN1KyovrF3BMp4OuTt7UYon+GM71QVisJ2pkhTMekOTUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8NS3wG6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8NS3wG6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BE7C4CEEA;
	Mon, 23 Jun 2025 15:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750693816;
	bh=gbion1/qQxu9hmM1ZmDJCMvGF30yf1xFP7ClQFXYwrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y8NS3wG6TF+yc7T3Nes5WnDUSTVmK69IYHpcQ25VO40xzq85gq8Jx9CWfCRY8MFNO
	 cg+6SBZQBRTpISeG0JsQodokhzkBa8xvZjGVIzxUxGIehPsJGfWqzIR980iiP+RPVO
	 uUPMsb9PRYsqwPWHiRpuNi5q2cp8uy7OO60pSWQrfP7RD3v2x9oh6QzE6aC9Y/BYgO
	 /siE1FUHUjXunTDNoEdJaKxPva5CTTrI9hXi/gCZ4dwB3Ha/Rdr5UFEmZNLURo5MMU
	 CeQC3Q9tJrJqWDnxNWl8GjlnQDSFp7ldKmNMIw8H6N5OdVDCczuCYTLi0fTFPD6vxv
	 b6PBOCRFqz0sw==
Date: Mon, 23 Jun 2025 17:50:08 +0200
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
Subject: Re: [PATCH v6 03/24] rust: dma: add dma_handle_with_offset method to
 CoherentAllocation
Message-ID: <aFl3sF_DbmJkFC-6@cassiopeiae>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
 <20250619-nova-frts-v6-3-ecf41ef99252@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619-nova-frts-v6-3-ecf41ef99252@nvidia.com>

On Thu, Jun 19, 2025 at 10:23:47PM +0900, Alexandre Courbot wrote:
> Sometimes one may want to obtain a DMA handle starting at a given
> offset. This can be done by adding said offset to the result of
> `dma_handle()`, but doing so on the client side carries the risk that
> the operation will go outside the bounds of the allocation.
> 
> Thus, add a `dma_handle_with_offset` method that adds the desired offset
> after checking that it is still valid.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to alloc-next, thanks!
