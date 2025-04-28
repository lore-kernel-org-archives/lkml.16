Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD4078F20;
	Mon, 28 Apr 2025 20:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745871505; cv=none; b=as5TviY0QB2xW2kPSXhVhxHFxwUV3T0OKiI3Y1SnbSp4LfVl4yCf743moTyToCPtuYknDhsvHn5sXhXUpbC8wiqY2vFGPZOSWtPvgs2V1RdH/84K6Jqucj9DW0YesWZw/2oFUdW05tAcR4VBXTy40NVAetmPLkf9XrfHLZ9Cuxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745871505; c=relaxed/simple;
	bh=YYUrwN/uqkmPsiM0BaU9Qwb0CpV6JgN5ms1zlzfdRgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BW7zKR4tG1thnI8Lct/ao4gV91MOWDplvKzUgymKjnVK/ovsVlAU/mJygog/3ZlRtalbAIsyPmB2U+wiMlbwJRfXHi6Zk62UJN+0CX8J1S47bLhc9tyPC7aiw9qmuS6dN4eqZq5JBAf9+ihopP7lmfSBZh4MiF5HPQye/GJGuMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFg7DSuL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFg7DSuL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E730C4CEE4;
	Mon, 28 Apr 2025 20:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745871503;
	bh=YYUrwN/uqkmPsiM0BaU9Qwb0CpV6JgN5ms1zlzfdRgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZFg7DSuLPN9fdSkC3Xg8X3ox+E6eP96g2gB9ao96dm5I7op20czVYMhiVlS2d5QLO
	 qLuVPSUj344gcZuHjGRTRRFzbyAW0AORb5LgCSn66c2c3pLHi/eM3p36TyTGpzdSJs
	 8zgPGh9Ce2COUsMnaWYeHs9nZAmo9bYxXWWjYHe9c5+Fhi6LwF/U7VRBLKsQGqm/qj
	 qZC2Av0LAUFb+XaFVwdaildbK54BrG+Piln+J73nupl0G9LczREIt2rndQCBMjKVub
	 KTi+qPqOT1TZzSpN7CaXNgKoQV+VapomTd7+Hau5GxFg/yBh3cQV88j3L5O0ek9Eza
	 pQOX7o1KVVV4g==
Date: Mon, 28 Apr 2025 15:18:21 -0500
From: Rob Herring <robh@kernel.org>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Remo Senekowitsch <remo@buenzli.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	Dirk Behme <dirk.behme@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 3/7] rust: property: Introduce PropertyGuard
Message-ID: <20250428201821.GA1572343-robh@kernel.org>
References: <20250425150130.13917-4-remo@buenzli.dev>
 <aAuryiI0lY4qYyIt@pollux>
 <81a65d89-b3e1-4a52-b385-6c8544c76dd2@gmail.com>
 <aAyyR5LyhmGVNQpm@pollux>
 <D9GIUOH0CKE4.3R01AYKCCG54O@buenzli.dev>
 <aAzrg31NB2g0X4qL@cassiopeiae>
 <39798ebd-35a8-4a67-9df4-f12a6f20ef11@gmail.com>
 <aAz1f2jhdwjXmHex@cassiopeiae>
 <D9GWI4GT3ZK4.25N3DYX5MSX0P@buenzli.dev>
 <c922d67c-ab20-4e46-9359-01fb32223d17@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c922d67c-ab20-4e46-9359-01fb32223d17@nvidia.com>

On Sun, Apr 27, 2025 at 03:12:18PM -0700, John Hubbard wrote:
> On 4/26/25 2:50 PM, Remo Senekowitsch wrote:
> > On Sat Apr 26, 2025 at 5:02 PM CEST, Danilo Krummrich wrote:
> > > On Sat, Apr 26, 2025 at 04:35:07PM +0200, Dirk Behme wrote:
> > > > On 26.04.25 16:19, Danilo Krummrich wrote:
> > > > > On Sat, Apr 26, 2025 at 01:08:39PM +0200, Remo Senekowitsch wrote:
> > > > > > On Sat Apr 26, 2025 at 12:15 PM CEST, Danilo Krummrich wrote:
> ...
> > > > > Why do you think it is important to force this error print by having it in
> > > > > PropertyGuard::required() and even take an additional device reference for this
> > > > > purpose, rather than leaving it to the driver when to print a message for an
> > > > > error condition that makes it fail to probe()?
> > > > 
> > > > To my understanding doing the error print in "core" was proposed by
> > > > Rob [1]:
> > > 
> > > That is fine, though it doesn't answer my question above. :)
> > 
> > If the question is addressed to me, I don't think it is important.
> > I don't have a particular preference either way. I'm just trying to
> 
> Generally, printing in libraries an lower level routines (in this case,
> "core") is undesirable. We'll do it anyway, sometimes:
> 
>     a) Behind a *_DEBUG configuration, to debug the core itself, or
> 
>     b) Desperation: hard to recover from errors, that the upper layers
>        for some reason lack context to provide an adequate error
>        message for.
> 
> The idea is that the lower level you are in the software stack, the
> more rare printing should be.

If that's a kernel style/requirement, I've never heard that. About the 
only coding style in this area I'm aware of don't print messages on 
kmalloc failure because the core does. It's the same concept here.

When practically every caller is printing a message, it should go in the 
called function. It's not really different than anything else we do. If 
we have 2 functions commonly called in sequence, we combine them into a 
single helper function. 

It's a pattern we have in the C API that I'd rather not repeat with 
Rust.

Rob
