Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB7F21CFEF;
	Wed, 18 Jun 2025 21:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750283172; cv=none; b=cCSDMT/nTdn4z8NzNDqZsVmGS/YSgoa31VD4T7z1MenAbZohlbi3uVHcgxrWHZs1MURr3d8pjoHqJeTklp/VAugcENypJUkCfL4x5XL3OUvvIuetZQF2Pg3oZdcr1Eo7sFgiqPd87Ew+D5XWnsxlkhz7Te7GzG+HhZgNlutXuZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750283172; c=relaxed/simple;
	bh=niemzDV5RgTw4WjvIlphznf2tzfL71cvZ32XTWyNCmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G38Vhp76Ea/hyECYpUMFkXT0fgu4HXS2Wb0VYc1dxWjsiwLPm19O196y1PBzq1jmjj3ypesbALQ32PRAi/v7BNpQdvOvDEuVFKPzBrH3PUjAcmh/zQcndGOFUlkiM8j+OWIR4A/lNSwLpj1Ay5UeAixtLs8ihHJqoNLbz3U92bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SoXZL2BB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SoXZL2BB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F413C4CEE7;
	Wed, 18 Jun 2025 21:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750283172;
	bh=niemzDV5RgTw4WjvIlphznf2tzfL71cvZ32XTWyNCmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SoXZL2BBMXeILCHlyI5UGOEb26Us4j+BJFkTgyOePhHtWOJLhR5c5q0HTqz2rH4Os
	 XEmvmyU41kPsBGyFWsecZcusnOwnwUM3ld7GVqoKSadYhYVHHYeLWg5GiplBvkvOi7
	 VyDsrZvabJvJDFBiQw8xCHOxHBQpbM4oqq7mcmQx8eu0a9hfvG9BZxuSrvutiZ6Qpr
	 cgl30go5iDLle26yFcPL0VT5xJfa640o3o9XGPlLd/EKgbbBAv8V8dVIFH4HXPxaUO
	 v9IZsVMjIldS3oa56YcAHIDDc63f346AzeQghqU03BAbgs6Gl0OnLRC2Z7KT/FCG11
	 Pi9BZD4HqJaOA==
Date: Wed, 18 Jun 2025 23:46:06 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/7] rust: alloc: implement `Borrow` and `BorrowMut`
 for `KBox`
Message-ID: <aFMzntPTp29J72PL@pollux>
References: <20250616-borrow_impls-v4-0-36f9beb3fe6a@nvidia.com>
 <20250616-borrow_impls-v4-3-36f9beb3fe6a@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616-borrow_impls-v4-3-36f9beb3fe6a@nvidia.com>

On Mon, Jun 16, 2025 at 12:34:07PM +0900, Alexandre Courbot wrote:
> Implement `Borrow<T>` and `BorrowMut<T>` for `KBox<T>`. This allows
> `KBox<T>` to be used in generic APIs asking for types implementing those
> traits. `T` and `&mut T` also implement those traits allowing users to
> use either owned, borrowed and heap-owned values.
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to alloc-next, thanks!
