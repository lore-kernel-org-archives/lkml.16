Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A591914A8B;
	Tue, 13 May 2025 13:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747141862; cv=none; b=Exo9CPPlm12iB3Ctjykao2Z2bvYdJ4dWwa81JQ2bAI9ntjTq9/SMWTGfc5hPf3w+2WVLRmo6N7ABCRDB88ufaYTWOlAguC127/vR438cLCCyUqotPQAMCCI8lk3bz+F4uEMLXBPiIFn7XBzFENlnMra+OkU71hqf6t/jf6OecY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747141862; c=relaxed/simple;
	bh=gKhlhLz8On/I4blpj1Xo3XEfw/VwE1nkBsqpbi+0TmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHAEG/2IETDfxXXGUzJ3dDqoQluVcl8Kn0ISu3+JFivgxaQZ5WjEULuYmnnC+aAmiwePT8A7NkTCD5Pw24vASUBHPtx83lOdHbRHe6PARsajxMXYlqjFV8AVUeH5o0XZl2ZzbvqTPTmVe3y9BF1+e4+FUSJBsvXwBcP2H/S1z5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxlRHcBd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxlRHcBd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148CBC4CEE4;
	Tue, 13 May 2025 13:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747141862;
	bh=gKhlhLz8On/I4blpj1Xo3XEfw/VwE1nkBsqpbi+0TmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YxlRHcBdIyTjITqhshYiFpQXnErtT8W0x9QfgcocaaCo3KmngxVi2PXU3ae//Rjoh
	 n4XkubZAQmTCqOZ45WiYdnv11SkVaD8EReCBBjhdAeVed0+ggtyM/eMMx7I7O6YZwC
	 0roJwxFIGOud8lJxctuySPBSWWTOZpr76LQKKFxNeAou84cnhNOVJKKAH0+telo092
	 sBi0KjRi4500jrLdmCQQPQiPSNXK+31H5gtWADb+Fm+ygH8whuP46M/dbSvAuRyZnw
	 3wKeAbQFoyl7THTiqI57VDigZ26jxFa7EcQgfJTBB/rjbroheuwJo7tpThgRc9SlH2
	 lZe92SOiaznnA==
Date: Tue, 13 May 2025 15:10:54 +0200
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
	Jonathan Corbet <corbet@lwn.net>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Shirish Baskaran <sbaskaran@nvidia.com>
Subject: Re: [PATCH v3 00/19] nova-core: run FWSEC-FRTS to perform first
 stage of GSP initialization
Message-ID: <aCNE3uxeuc8TU45w@pollux>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>

On Wed, May 07, 2025 at 10:52:27PM +0900, Alexandre Courbot wrote:
>       gpu: nova-core: derive useful traits for Chipset
>       gpu: nova-core: add missing GA100 definition
>       gpu: nova-core: take bound device in Gpu::new
>       gpu: nova-core: define registers layout using helper macro

    [ Fix typo in commit message. - Danilo ]

>       gpu: nova-core: fix layout of NV_PMC_BOOT_0

    [ Use Result from kernel::prelude. - Danilo ]

>       gpu: nova-core: move Firmware to firmware module

    [ Don't require a bound device, remove pub visibility from Firmware
      fields, use FIRMWARE_VERSION consistently. - Danilo ]

Applied the patches above to nova-next, thanks!
