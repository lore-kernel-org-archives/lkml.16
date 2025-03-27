Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80514212B38;
	Thu, 27 Mar 2025 11:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743076233; cv=none; b=GbuswJpIeWkDQQkuDOBxMuOWSMn5E5vgJHpVUcM89mVh1pc/R/JDhHuJU2ESEoBM0ngxUj/VG+Asi4C3ft+O0V5SafwGfBYbcqdpgfsbQQAsBOTrhHiySWY1yELgNLhZ+9yg/HbQCeiQvG9gN+6D2Hza5FWtJe25Y3rKWAW+U6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743076233; c=relaxed/simple;
	bh=PeVyVMBC5eU+KwcsRny3CgOSWBNkaR0c3V+ay+UFp1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRNxT8jYJrWLUBUqhXUSFBg38T06bejqyFCKIQRBIwiZEQ5jzxFop1p0lpxQBUDRPvb0WDTvUAVCTLBa/WQmPCXcEfPXtRk6Lmhmh4w23x7mTbpk5d0sDTY/NvzqkwIwoojplI0/5+rUCLGEcgiH7gupANgAyHmk8jIyvBLrVQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drtu6bwf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="drtu6bwf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C57C4CEDD;
	Thu, 27 Mar 2025 11:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743076233;
	bh=PeVyVMBC5eU+KwcsRny3CgOSWBNkaR0c3V+ay+UFp1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=drtu6bwfPr0RhNHzF9uI8D3GxKtMKN1SaRKwTwifwjFgzi8xBDOKU43sEWqlo+JsI
	 2HEC+adMvOaYzzsT28H6PB7Qmku7Bre21/W5ZwrnL+UMwTFhnof1z3nE0R6OaciUCz
	 aCA0OAS/uy7QTPeDjRGNWiQdYj0HcyCPXzBbO8SXKB/RsunmRrnrUyd19ws5J9f0su
	 tUoooPWvCMoqbhBzTY2ztci5XVR/k/Ea7i1x7ds6RhLGmZVmGEllqeUDN6R9oFOVdp
	 rd3Dm8MELd5BppLtw17k5bZ4hhF+LDeTFgfZWT7GW4W9rlejnuyv8cbiB6Me94T4jV
	 7unq8vgwCWRMA==
Date: Thu, 27 Mar 2025 12:50:26 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RESEND v2] rust: regulator: add a bare minimum regulator
 abstraction
Message-ID: <Z-U7ggqQAVq1IIJi@pollux>
References: <20250326-topics-tyr-regulator-v2-1-780b0362f70d@collabora.com>
 <a98eb789-4c49-4607-ad15-76e260888d64@sirena.org.uk>
 <0698A75E-D43C-4D02-B734-BFE1B3CC5D34@collabora.com>
 <f22cbd85-1896-4842-8746-d74ee160ab3c@sirena.org.uk>
 <D9ADCA08-C3B3-4964-BDB9-E62A2C7DE85F@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D9ADCA08-C3B3-4964-BDB9-E62A2C7DE85F@collabora.com>

On Thu, Mar 27, 2025 at 08:46:29AM -0300, Daniel Almeida wrote:
> Any function that takes 'self' by value (i.e.: “self" instead of “&self” )
> effectively kills it.

I'm sure Daniel didn't mean it that way, but to avoid confusion, I want to
clarify that a function that takes `self` as argument not necessarily results in
`self` being destroyed. It could be moved into some other structure, directly
returned by the same function etc.

It's just that if the functions lets `self` go out of scope, then it's
destroyed.
