Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E001C1F21;
	Wed, 14 May 2025 16:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747240954; cv=none; b=bkjEbsXiha6FtXbjU6o2WdK1YKeGQ/dqULdKESM7VM3jAvIgdw4NXuqqn1oncLfk4RMFon9/CeiHm14XX6S0jJG8nwIiqsnRAbmZfqZ8jfrdomtq1WJHNKjHswRXs1T2Bt9TV7lNtnHwiCzGkk337AWyRCz30ZrRz/7rs/2jiXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747240954; c=relaxed/simple;
	bh=4AFo5tUm54a7xxV7M6z3IWvxfRA4JW1Lh17G8gW+JMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4Q9F/SsNvRAW2IIKrw6I1orc1BjVABcGgYQmRsb0vcpFbYKnL1fIh7CHLv8fQ48wenPcL/Gc3ZHTDmGrqYg6vE2pppNRjZbHfr60Hc2c0bAZIQDLHN/G/5vvMXRLbM9kOJJx43JzAs4rWZ6PLcRNxa7L25Q1CsVxu6zThz+OOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4/vmQB0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4/vmQB0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB456C4CEE3;
	Wed, 14 May 2025 16:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747240953;
	bh=4AFo5tUm54a7xxV7M6z3IWvxfRA4JW1Lh17G8gW+JMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e4/vmQB0wJCa+u6yUwzs4SgwlAXKKzdTAMl4yQkzUNj5mWXDKUi8mFgsmuj/J44r9
	 MXE6LlU3xVClde/94h9kn46mt3VKoQXv4dbXtXi4EdjWLaj0p5Ua98QohUkBuTsnQr
	 p0oT1eiu/X4gMLa0sFNFwRwmzNfPrG70LhmgkZp2rmSEUOqpNZzkKMNMNeCJNe0OrH
	 xQZyp2gDnuhh6QNanBmRmuOaHTK6ylkrSC9f7t2YUOqMsy6KacqxAbcdbQik5bzU2H
	 4VreJcYYBgR9Zs43rKFuDQfbfz5Z/jq7m+B2hT0tux4BRXuNmuQNpgFxnjnfcDgaFs
	 s6+wQ+iy6y41w==
Date: Wed, 14 May 2025 18:42:26 +0200
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
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 19/19] gpu: nova-core: load and run FWSEC-FRTS
Message-ID: <aCTH8gnO5b4MsaiN@pollux>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-19-fcb02749754d@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-nova-frts-v3-19-fcb02749754d@nvidia.com>

On Wed, May 07, 2025 at 10:52:46PM +0900, Alexandre Courbot wrote:
> +
> +        dev_info!(pdev.as_ref(), "WPR2: {:#x}-{:#x}\n", wpr2_lo, wpr2_hi);
> +        dev_info!(pdev.as_ref(), "GPU instance built\n");

Please use dev_dbg!().
