Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EF6256C82;
	Mon, 12 May 2025 12:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747051880; cv=none; b=S62tZG+kh+CzIyKUdFGlaa6wnL3F6cn2C7u22P4UF5l0sm2bScXYh0rm2qtm5KHes/wa/Cx9D8RuKbQvW1Wf4GdYcIvkH9Jr7JpAdOw4ariWJeHMHQ7txUwjcFERhClWAAjM3qpl7nJdEf44/y9NCIvaIYA5XsniI+bIGTgCKQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747051880; c=relaxed/simple;
	bh=q4eRIz5gjXM2GQAmWEtAt6syFIFK0R9/zFDd8CK/zSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uax+1qC5p+MwUkF/Cy/LH8iG/MR0T2LzYbPq1o6w7WLPybAo6IWy3s2pxNCYTfoCHRWGGfgGJQJP9g62aQhfXeKKQyZOUthr84v/lt0mnWTUEtaSALaQcjVi9lUm0ZTJDVqEE8AU15NvKjd2W+WUlWA3b+fMe4rbU8HaWOpje/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VtjcylKg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VtjcylKg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE28C4CEE7;
	Mon, 12 May 2025 12:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747051877;
	bh=q4eRIz5gjXM2GQAmWEtAt6syFIFK0R9/zFDd8CK/zSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VtjcylKgCfJVGwLxr5DduPtm+LTwhyW5vbUN1WdXNJJ9oSs4QkdwiCdC7yuteFaQQ
	 jMptnxTZMrJp2gCXJZndOy974mnpEw0HaIBeDTVnQHFTaxZWqxR087IuivVPV9ezp3
	 +Xa1P1Zpwb0Bk4ZxLXJFbTuCYDjofpESMJ6P4oGlFKRZvIaiMWgLfregK6xeuhPvgO
	 I6ng0l1uEwbS6tL2mJaHEEOsFQeNW1a/Oy47NEXB9/ociSi7bUexZkEML1InhNx+pk
	 +tjPPpB8HQ2XfJGoIrtao/kJiYVQR9s2mRU4XwhkWUigiYU4OErC9vx6Cpb3hVXPkX
	 sC2IXHrZ3SlXw==
Date: Mon, 12 May 2025 14:11:11 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Asahi Lina <lina@asahilina.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: Re: [PATCH 1/4] rust: drm: gem: Use NonNull for Object::dev
Message-ID: <aCHlX4-DSYPuJv_Z@pollux>
References: <20250501183717.2058109-1-lyude@redhat.com>
 <20250501183717.2058109-2-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501183717.2058109-2-lyude@redhat.com>

On Thu, May 01, 2025 at 02:33:16PM -0400, Lyude Paul wrote:
> There is usually not much of a reason to use a raw pointer in a data
> struct, so move this to NonNull instead.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
