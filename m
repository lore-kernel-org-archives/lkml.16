Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6C91D7E4A;
	Wed,  4 Jun 2025 10:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749032593; cv=none; b=Xvoveh4QYtzLAt1dUWfzfvHzg3DLhg2DIuqFFVL7wxcTjc2chl4JcfUthlrH7F1yNgKYK3Dshbe1gN+uGfRXQNZbMQkjkeWln52LeTRslULa1lJXMegMPrQv+w3UJkALd2LCjr3hU4XhKyyRyyRuz9MPX2tx7eeQU6YJpCqD9ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749032593; c=relaxed/simple;
	bh=IsZt5w6RNpSLAPXJ4G5EuYXatQFaY7xih6awDDId0ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ua63+6+/S+O2SSqNUcVdc2hQ1L0HJ6GWs5QSES5VUwT1SJ86knimnBTtFt+QTUcW+eX6FT1xm9WX6ECtV1NuK39bbE12U+9cjPIIt0YvcwQ3tziIoCGFv2nPklqrk65gp3lKONtXLUhATY91fgkaOK0x0v6ysVe5kYCE+VdNpo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZs6XMtk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZs6XMtk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180C4C4CEF0;
	Wed,  4 Jun 2025 10:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749032592;
	bh=IsZt5w6RNpSLAPXJ4G5EuYXatQFaY7xih6awDDId0ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LZs6XMtkTpWknLrbNMU2qVWSTB1LLd2aXLOfCV25H+8gfPhhVMl9OxupmmvlwR4ZW
	 saXtJxodZpnDExgUfzyHpo70AnH9xZ0V4XLkcR5ahWWBP+3hEc6ew5Pdok1Tyfu8L2
	 nrKV8/NhBwDCnZ+FoLUQSlZK/uhkzCufVFO4SjlBe0pcdbfX0A2UQX9oHpkNHypb9V
	 UetIRQqyXSd0rtz79LUkxXFM5gCcobA+45lxNOAjRl57+XRZ7BYyZcppcbIDv8dWui
	 D3jkB/cNP8Cqc8Yc4SjB4n9Vzc2Jz3Iwwt+6qHWJ3Ml3znlDwS5Uo55ldzP7NGp9Lr
	 qGoEQCEilSS6Q==
Date: Wed, 4 Jun 2025 12:23:05 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 17/20] gpu: nova-core: compute layout of the FRTS
 region
Message-ID: <aEAeibsMAdlmIfch@cassiopeiae>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-17-05dfd4f39479@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-nova-frts-v4-17-05dfd4f39479@nvidia.com>

On Wed, May 21, 2025 at 03:45:12PM +0900, Alexandre Courbot wrote:
> +impl Chipset {
> +    /// Returns the HAL corresponding to this chipset.
> +    pub(super) fn get_fb_fal(self) -> &'static dyn FbHal {

Please don't use the 'get' prefix here.

Also, I feel like it's a bit random to have this on Chipset. I think the
standalone function to create a HAL was fine. (Same for falcon/hal.rs, where I
missed this.)
