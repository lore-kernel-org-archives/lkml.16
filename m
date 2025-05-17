Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F92017B418;
	Sat, 17 May 2025 19:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747509004; cv=none; b=Yi3XnAuVly4GYL6gKm6JgiLYkIGxZa5XimdhInhAcX1xWK8DOigM+w0oePq/f1HXdhxiB83haGo3jdbFL9FsnfAEaUciOPUIJWDYsOlnKt7pHPyK8+ThzWp4vCr9R9soLtD075iVgMTQ0QoQsTiO/onHzazPQBPnFLCPkn6Xols=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747509004; c=relaxed/simple;
	bh=k+5UWbrgpiWdeXHIP57h4QlIssmQ95rqoMKkKrHaPxI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=JsJNs7JeU96qJT3BNXs7EnF5r29IsOS8/eecfLL4MzmmvBE3yvv9FUv1fBnTwHqDSGe+4Biihv7RPpolD689l8JDSMRHK4f4rNAsuzwEpjLfaiPygUoMTCLB3kSK3teYm5UAHnDT1fRPuGT8p6O6GcVjqPB8xAiJ2upI3frEXpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ue6aPgp8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ue6aPgp8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F7B0C4CEE3;
	Sat, 17 May 2025 19:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747509004;
	bh=k+5UWbrgpiWdeXHIP57h4QlIssmQ95rqoMKkKrHaPxI=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=ue6aPgp8i1e9ocaSTTZtZOHsOo7o51s0k0vjFhsPY2DzIn7UA+zWoYRzcZ4QzuymF
	 Z/6Syvc1gPmXFyf3/PIIwP3k9R+ArwCXAPbBAanyNpnsfi62ZwYw5A2fElYKhR+dTp
	 CI4jydXFPfKzYWYCsv6/UXC8wnxGHfSxjblHQqfhPALGCsipxLS3yzb1Kj5Gf/mImW
	 QqlyVevcr1L/rzNK+2808giI8ae5iPr5k0jE0MjO/WbpylWXGn6v2OR+/eyk3DG9y4
	 /yocrj0qwO1ae5YFW2Dg4FFaQ/dbbDsyV8qeTfr/nfo3PlrR3q8z8azDsCf8WYmT+Q
	 A/a3ppo3ztFyA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 May 2025 21:09:59 +0200
Message-Id: <D9YO8NQ32W8Z.ZZKSFWFK6HEZ@kernel.org>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: miscdevice: fix typo in MiscDevice::ioctl
 documentation
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250517-rust_miscdevice_fix_typo-v1-1-8c30a6237ba9@gmail.com>
In-Reply-To: <20250517-rust_miscdevice_fix_typo-v1-1-8c30a6237ba9@gmail.com>

On Sat May 17, 2025 at 1:06 PM CEST, Christian Schrefl wrote:
> Fixes one small typo (`utilties` to `utilities`) in the documentation of
> `MiscDevice::ioctl`.
>
> Fixes: f893691e7426 ("rust: miscdevice: add base miscdevice abstraction")
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> ---
> I've found this small typo while working on my `miscdevice` changes.
> ---
>  rust/kernel/miscdevice.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno
