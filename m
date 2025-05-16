Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4860B1361;
	Fri, 16 May 2025 12:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747397643; cv=none; b=pt6EiwvUW6X6h8quY0EaW/jdF4xyVE4paid/jRfbGrSyPCuf86e1D1ae9YvHkEV6HbAtpxnSrDAy7mx+TId/2EQ4FxO284QVfqn0Uo6nIj9uFnO+JR3IYWAL4EISmPgenWVFtPb+Y/KYdbYCnJBp5DwPYweFMlvX8KPgSLMxDVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747397643; c=relaxed/simple;
	bh=l0eKWla4Ve3xFHCq34yr+gQ3U6VR2dIwm5VdL5/Mo3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5EL3OXrVdwJO5gSO/GQxsTSuT2JgUwIAw2suOewSMm27bpMfvycrsDjcxJjQblOxiSXyQuZ9/QY+zkU6ycNh8sZU71aMF6dXaPcU8INt4M30PXttoLo2mT7XQ2R2xVrxxpLIfY1FZaOZxYKDQpH2HVxGdWa1DyhDRLJR/oZcsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWBRPaQc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWBRPaQc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D07C4CEE4;
	Fri, 16 May 2025 12:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747397642;
	bh=l0eKWla4Ve3xFHCq34yr+gQ3U6VR2dIwm5VdL5/Mo3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JWBRPaQckf2fwpuqhBvYNiyD0sGG/KsTdE2FEkybtywn7sN588dftgBncSwZFoij9
	 v1bjmnDG+RycQe3ZKwauQyuYf6kVQa3RQ1/MDSVrU510eIJxPlAsJKVSWcrP08iVCj
	 WFi9sJ8uGR9HRoz5o4JUG2FawrVZGdLVCaCYYfdbjcVZIUJnrT/olpna8o4e3sbF7B
	 gqMjbdfpm+1w4/l0i11jHc2/pfiMeqhFxDvYy9UE36e4bLqkXNlQ1Vij6KiwLuI4Sh
	 42P6xa4FIQR2GUorQ27C2tpHE4WkBMSP/dZZkcEIMGn80TFBpiumRNdFh0aEsKhSO3
	 D/U6OufZSLmQw==
Date: Fri, 16 May 2025 14:13:56 +0200
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
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 0/3] rust: select AUXILIARY_BUS instead of depending
 on it
Message-ID: <aCcsBIOJHr-hq4Wg@pollux>
References: <20250515-aux_bus-v2-0-47c70f96ae9b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-aux_bus-v2-0-47c70f96ae9b@nvidia.com>

On Thu, May 15, 2025 at 05:23:17PM +0900, Alexandre Courbot wrote:
> I noticed this after trying to understand why my minimal Nova defconfig
> was not selecting NOVA_CORE anymore and why I couldn't even find it in
> menuconfig.
> 
> CONFIG_AUXILIARY_BUS cannot be enabled directly and must be selected by
> another module. Options that depend on it thus cannot be enabled unless
> a different module selecting AUXILIARY_BUS is also enabled.
> 
> All non-Rust modules using CONFIG_AUXILIARY_BUS select it, so it should
> make sense for the Rust ones to use that scheme as well.

Applied to nova-next, thanks!
