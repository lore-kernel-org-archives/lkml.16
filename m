Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75961624F9;
	Thu,  6 Feb 2025 18:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867708; cv=none; b=qtwxW7kTxGG0x47Z9Lw/4dE+frbNFUrBEZJjYCuNK/Parh8RRKAyPKBMgEkh7+pEOF7vGlZrA44SER1okhV+QPUEkLyZrUR9T3k7CjNfaW+OUTWksYg8d9XOg6w0PVbWc+86uNLZbgxbmc3kWeag8jeMnWlmYZsohRYsgAc60P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867708; c=relaxed/simple;
	bh=yUL/lKF6RBoXb0M91gAmqYh2sft1ZqUBNxXwCB8J9dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBuX4UyPfVOXHwpZ1roliXr9EkN6OhwctaIp+aSYZMLAISreS2SyfAsSSiK4dgjIA+l9UvIO+f0Nqu6NOzDzp+vKX3fZM76cLvPApNm6Uy7a4d5CpAyjOvyG1dvN4r106khugTy0xYyNahLNGFt8iM//DMf8jtAkgqN+IuwarzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bxi9oT97; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bxi9oT97"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466D6C4CEDD;
	Thu,  6 Feb 2025 18:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738867708;
	bh=yUL/lKF6RBoXb0M91gAmqYh2sft1ZqUBNxXwCB8J9dI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bxi9oT97NJ7Dz2UuOewlMHTO30pxwWt8hNiqQLN68qSRfonnU/sQ7FgAior2gUMfX
	 b1Qu7E9m8UnqhzZ/Ae1fhAIBLrVMmmGTfy9erElMCBCFAFDy0xoU3oZsMlOJKP7u7T
	 IrRKb/bOXKjGfeYdZaM7OMJSemhFeXSMspuX9lod9hI4AnC8ZXjc4Z4c4v+Nh72+Pq
	 qXarvWIrrrCGX5F7xd5fZr4bN3o3PxD1RfgehO+tORvGOZnU/bZF0teekeudiezFQz
	 nvgrtYWHhhwFKwXYj/nWheqlJK/aaEob9rRrTeBopFlpyKroafMLKY28WOwjreX1Vl
	 zA7k1s7MFufmQ==
Date: Thu, 6 Feb 2025 10:48:27 -0800
From: Kees Cook <kees@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: "Justin M. Forbes" <jforbes@fedoraproject.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Add -fzero-init-padding-bits to bindgen_skip_cflags
Message-ID: <202502061039.A75818BA@keescook>
References: <20250129215003.1736127-1-jforbes@fedoraproject.org>
 <202502060744.6F701A4CBE@keescook>
 <CANiq72meqUFt136PQt=h6b5p+wJ5KvdYM2ci_QNKbHaR2wY71A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72meqUFt136PQt=h6b5p+wJ5KvdYM2ci_QNKbHaR2wY71A@mail.gmail.com>

On Thu, Feb 06, 2025 at 04:55:21PM +0100, Miguel Ojeda wrote:
> On Thu, Feb 6, 2025 at 4:45 PM Kees Cook <kees@kernel.org> wrote:
> >
> > Thanks for this! I keep forgetting to keep flags in sync. I wonder if
> > there is a way to automate some kind of warning for this (even when
> > CONFIG_RUST=n)?
> 
> You mean at editing time?
> 
> > Reviewed-by: Kees Cook <kees@kernel.org>
> 
> Thanks! I will add it.
> 
> > Miguel, I see you took this already -- is it planned to land for -rc2?
> 
> Possibly, depends on how it goes; otherwise -rc3 -- why?

Many subsystems base their trees on -rc2, so if it missed rc2, Rust builds
in a given subsystem will be broken under gcc 15 (but fine in -next).
But perhaps that's enough of a corner case that it doesn't matter? I
have other fixes I'm sending to Linus tomorrow, if you'd rather it go in
sooner? I'm fine either way. :)

-- 
Kees Cook
