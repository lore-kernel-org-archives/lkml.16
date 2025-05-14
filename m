Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3C7276033;
	Wed, 14 May 2025 12:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747225390; cv=none; b=tJTnbR5F7rkSQEdNi2xJwo90+3wjK3i7cs7nU+JJml9lJ2U+HAEmXKUEGeA6rUzzLVGTNno9eDNYH0wZyqJX4LZaC9xT0xV+geTN/jjXsZDaoOOTjzIhN4jnKCq1morvQH0o8WA5y+FJYqEasQcC+M+a+ALY1XG/Eb9igP/v6o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747225390; c=relaxed/simple;
	bh=Dt5INkOPJeej6qFk4yDwKbXDar8A7nfwBKWNn0ZcxIs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VaXn4YeAYSqDYNTiZt9IlYnGZQDa6lYsVNSfZsV+3okcKTKpSKBVessoHfZo2+xJJjIAVCKVnP9QmFb1hchgBZPV7vtwieRanDGSPWuNUyuzbg7+fIP2nJvN+8unspyhGO4Sk3he5WCFonRDSvMaRpHqmKioLDucnl0wSj2Md0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bEoZx+3w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bEoZx+3w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560FDC4CEE9;
	Wed, 14 May 2025 12:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747225389;
	bh=Dt5INkOPJeej6qFk4yDwKbXDar8A7nfwBKWNn0ZcxIs=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=bEoZx+3w2l789KDxfaD3x2XNUrw/hB6SrKBocvKMGaL0mXwZixC7+C+xm937b8P46
	 CCgwYXgX1yPfy5WktQZIeis5lTAlq7snq51mEvGUfif8IwnnSTltqDLUhBnaikNHTw
	 KkzRHMGDT67A9giu9v/Gj5ogfA8mhcR9GWfskNWZo43aAbFeN35UTmUPtpoGlrYoRC
	 5LotdyHUHVCvPzR4L2lEOb0zxmyFJwZnvZ8wxAtzk+v+9W13JnN6JEGdWnmHawp8l9
	 A3m9YpYDdj6tIRVOheRnosyhiYH8AU+kujZNOHvas396CfX+X0h/isJlAnbBD1M1gj
	 29BD/XXZly5wA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 May 2025 14:23:04 +0200
Message-Id: <D9VVPGM147GP.3V338KUZGRQ6D@kernel.org>
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: "Benno Lossin" <lossin@kernel.org>
To: "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9VATLUHDGU8.53I80TGVRV0J@kernel.org>
 <aCRKR5h_X04OXgjq@finisterre.sirena.org.uk>
 <D9VS6WE94O04.GXFI0K5BH4XN@kernel.org>
 <aCRti2d5x2bL0mj6@finisterre.sirena.org.uk>
 <D9VTC578EVTH.2HFJ9TNPFW8NQ@kernel.org>
 <aCSDnjxVENpimTyf@finisterre.sirena.org.uk>
In-Reply-To: <aCSDnjxVENpimTyf@finisterre.sirena.org.uk>

On Wed May 14, 2025 at 1:50 PM CEST, Mark Brown wrote:
> On Wed, May 14, 2025 at 12:31:38PM +0200, Benno Lossin wrote:
>> On Wed May 14, 2025 at 12:16 PM CEST, Mark Brown wrote:
>> > Practically speaking if the regulator disable fails the system is havi=
ng
>> > an extremely bad time and the actual state of the regulator is not cle=
ar.
>> > Users might want to try some attempt at retrying, one of which could
>> > possibly succeed in future, but realistically if this happens there's
>> > something fairly catastrophic going on.  Some critical users might wan=
t
>> > to care and have a good idea what makes sense for them, but probably t=
he
>> > majority of users of the API aren't going to have a good strategy here=
.
>
>> Makes sense. So does `regulator_disable` take ownership of the refcount?
>> If yes, then just put that in the comment above the `ManuallyDrop` & in
>> the `Drop` impl of `EnabledRegulator`.
>
> In the C API the disable operation just fails and it's treated as though
> you hadn't done anything from a refcounting point of view.

But if it succeeds it takes ownership? The function `regulator_disable`
is also used in the `Drop` impl of the `EnabledRegulator`, so it better
give up the refcount, otherwise we would leak it.

---
Cheers,
Benno
