Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED2B1AC88B;
	Sat, 28 Jun 2025 12:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751113755; cv=none; b=l7iRXcroE9szXaYX1Y6l7Vj+PFAzGjFZCax8dXTX9mDfzS6FpT/RIbCxSz8JpgHatenOBQrCyLxNoVIMqXFFpuEnq6GBJWUaQvRzhoPSslQ0Q3lvCyraNMQBtZ65AF8x8OmrHEDxAyjlEyrFJNYZJZY4nXVMEAtb5sPaG508DPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751113755; c=relaxed/simple;
	bh=6e6bkAAqO4DlwzMyBf2Bv1Otfnqw8aMDaRR5IA3G2kc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=pLzK/ZlEqxQ2oJbfmzFKDyGEN/L3abTR2iZQY6caBbWA8xuJK4J3J1P0mun+a/FIMBZ4eM5TpsnSkUqM9jFlw08d9AR8JsPxDN+9Ji4no7+7r9HRVwjIf6Z9bNpKy0dEp4GrXH2fRqcFL8kH1Pofy7bOnG4dTJ2H2iRT6e3lHh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XyM1h4oZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XyM1h4oZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44B9C4CEEA;
	Sat, 28 Jun 2025 12:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751113755;
	bh=6e6bkAAqO4DlwzMyBf2Bv1Otfnqw8aMDaRR5IA3G2kc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=XyM1h4oZx/zo5W2HAkwmNN4tCUNPeDPpAHPnZHnT5ma01wUdDoMDctc2FQXCQC3FM
	 n12e16f90VJfwhgDzvsypl+QUyLmmUCMIQbxEdGDb+n2Y4fGIm/7U5FiUpnalL6Qhh
	 JRw5e8mt9f2DQgElcKkboXVutF0RVUruIl9uey1Ldtsvw+Vtk290iBBf09D/i83DsE
	 kRgB6GIRMiPtGQDRXJB3LKjx/O8hjiEMHC+gzr1M8T2jFF+mx2fAGNNMouPo/UkhSj
	 xehkHOjwYp+n5kJY/TR2UQOzuX0onZuLOYJrMAy76Lu+9N9xHTuEQ79Ufs4IV6V8Dh
	 /y9YyNJYo4TBw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Jun 2025 14:29:11 +0200
Message-Id: <DAY60NP32ZDA.155XFXZ9AOF70@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: init: Fix generics in *_init! macros
From: "Benno Lossin" <lossin@kernel.org>
To: <j@jannau.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@kloenk.dev>
X-Mailer: aerc 0.20.1
References: <20250628-rust_init_trailing_comma-v1-1-2d162ae1a757@jannau.net>
In-Reply-To: <20250628-rust_init_trailing_comma-v1-1-2d162ae1a757@jannau.net>

On Sat Jun 28, 2025 at 1:36 PM CEST, Janne Grunau via B4 Relay wrote:
> From: Janne Grunau <j@jannau.net>
>
> The match pattern for a optional trailing comma in the list of generics
> is erroneously repeated in the code block resulting in following error:
>
> | error: attempted to repeat an expression containing no syntax variables=
 matched as repeating at this depth
> |    --> rust/kernel/init.rs:301:73
> |     |
> | 301 |         ::pin_init::try_pin_init!($(&$this in)? $t $(::<$($generi=
cs),* $(,)?>)? {
> |     |                                                                  =
       ^^^
>
> Remove "$(,)?" from all code blocks in the try_init! and try_pin_init!
> definitions.

Oops, that's a good catch! Seems like nobody used the generics before...

Do you need this to go in as a fix into v6.16, or is it fine if I pick
it for v6.17, since it's only a build failure?

@Miguel any opinion?

---
Cheers,
Benno

> Fixes: 578eb8b6db13 ("rust: pin-init: move the default error behavior of =
`try_[pin_]init`")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  rust/kernel/init.rs | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
