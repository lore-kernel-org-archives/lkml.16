Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A5B24EA90;
	Wed, 30 Apr 2025 10:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009163; cv=none; b=OMd+miJZ+gblCMzlI2DoYHpvTHz3NF63kaMEHWHln/jqpPDXj6mzfL8DoY5n4yASfokbFBX/rKlFngZgElyLya1uVg954/zc26mvRMHF19nqHsj2un/4bCM/Fz0AWwnkcDcm0nJRN4er8f+eGZxqQGXdlhyi51fK8T/dW6422B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009163; c=relaxed/simple;
	bh=o+S1aIP7xzbJyrhAIC/cn6ntSs0hD4BPJIGQKZt97QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpNG2SFoshFcXTEer2/8Nq8Fq1A2gKGoMDTdrIMr5kYZegiCR0rds65yr7V5Y11CRKtk+7MZmwHuMcXRHxKoFyTRnxE6m+BoA2xgiXNH8i2VAVUyrN9j8IbT01YiLv9c8iKFvbpDz4s4xAMeomT/9NRSaPmurkcTFvb6OAS6EoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owBorUhS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owBorUhS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC66C4CEEA;
	Wed, 30 Apr 2025 10:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746009160;
	bh=o+S1aIP7xzbJyrhAIC/cn6ntSs0hD4BPJIGQKZt97QA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=owBorUhSaii7VmgJCrYuG9Fv/vFiEpeulZVWmpn2SI2y9kgzM1m372LoLJCviqERr
	 7yavPWj1x247McK+IFtM7vLr01D0aKar6Nd40qUcxSZ4xWPs1i3ab6mveT2p8wTlIX
	 uBidLfXY+pY09ClJ1FvUJczfR7V82b5Anq91hcoO6lAiw3dcVPIXxr01wuALpPRWMt
	 sf9YBXQ8kq8OmxUWxMsGghoFmwaQWhdEGbw7PCK3KOl2K8fEUfVcu7yEyJxnFWg7+c
	 KoCuEnXVWgjuLxN5qQRGU27IRSVQPGiJEFNx6885EFsSgr0KhU8295ww/87nLd1n0V
	 futn8s4BTlWJw==
Date: Wed, 30 Apr 2025 12:32:33 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
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
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 11/16] gpu: nova-core: add falcon register definitions
 and base code
Message-ID: <aBH8QUwxabyo-oqm@pollux>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-11-ecd1cca23963@nvidia.com>
 <aAerWF9j5d01pQv0@cassiopeiae>
 <C4F54820-4FCE-4096-B341-DB9AB667D0B8@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C4F54820-4FCE-4096-B341-DB9AB667D0B8@nvidia.com>

On Wed, Apr 30, 2025 at 06:58:44AM +0000, Joel Fernandes wrote:
> > On Apr 22, 2025, at 10:45 AM, Danilo Krummrich <dakr@kernel.org> wrote:
> 
> > [1] https://play.rust-lang.org/?version=stable&mode=debug&edition=2024&gist=bf7035a07e79a4047fb6834eac03a9f2
> 
> I am still researching this idea from a rust point of view, but quick question - will this even work if the chip type (GAxxx) is determined at runtime? That does need runtime polymorphism.

I exetended the example in [2] to address this with `enum HalImpl<E: Engine>`
and a second architecture that is picked randomly. It needs match for every
access, but that's probably still better than the dynamic dispatch.

[2] https://play.rust-lang.org/?version=stable&mode=debug&edition=2024&gist=99ce0f12542488f78e35356c99a1e23f
