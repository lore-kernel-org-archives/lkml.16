Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EAE20C00E;
	Mon, 19 May 2025 11:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747653962; cv=none; b=INYdWYZWv1JWkuqsluoquCdC93lsapt98jqoizUQ6fsNDu/Ox7c32Oy/DKGNtswoJxXou8fKspTu2mi1ffPyPVgoOE2DNNR4vqaY9GJQfEIQvsw9nwHoVQjdZUtlPhoBI1HEZKf5QfQ2mX9u5DP+NkHPYr4udyjhC0n1aqqGiVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747653962; c=relaxed/simple;
	bh=CyciRqM4WuEjNvbBnTR1/J0lpsio59msLUFVBD5Neb8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=MCKAtg5OSijigmc3JY/UA3cXwFxoRym8pklW9GoblJQqWYe9Az7cItrbkU/tm+0LIyG8K6FXjCIANFGWgPyLZHTLtV/dAT+Gu8f5p0b1D71nzsqXDkorwsby/nMqLfNm8W6te2xm77XWTUY9VQAgLu1ADy6mtpuP54DibR2e1YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4gB4dne; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4gB4dne"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE4FC4CEEF;
	Mon, 19 May 2025 11:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747653962;
	bh=CyciRqM4WuEjNvbBnTR1/J0lpsio59msLUFVBD5Neb8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=H4gB4dneueaI9OB30BAP71ph1XYMI1k4MkS0738ClMKnmAdWiianrZjXfA3CkW4sH
	 Ve99GmDU/6Yk82QvETHG31c3FoS2B6wiWYyG8/A2BuV0vzJZDffEnScmT6bAy0uE5i
	 xZkVM9c5EMiZosyTPUba9zCSgLq1UygictZogrYFJX42bX3wuZqMmyxjvYaHx/AvTZ
	 xjW7XD4TeJTLHJzYV01OwgMvori6xhGDZl3kBWIh4GrYrxr/Eqgdyd+Jwpy80dfD4m
	 B3eapCf22QDo0gTDBOTINWc6RUMGqZKDpdq1i0mC36WTJbVoT5oNdUHFLGWdmVt9mj
	 TN9IF92jpXpig==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 13:25:56 +0200
Message-Id: <DA03MG3VURVI.37CBV5WEEKJSH@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: "Benno Lossin" <lossin@kernel.org>
To: "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
 <D9Z3R4EYAXV9.211IFNRTOPM6O@kernel.org>
 <D9Z4XGQ2QHXA.2H5X1NZ5IZECC@nvidia.com>
 <aCnQo15SbhXZ9Fln@finisterre.sirena.org.uk>
 <D9ZCD8D6J5QW.14H6VM9LQ5R2Z@kernel.org>
 <a1a6b2f8-af42-4942-ab62-678e37381d08@sirena.org.uk>
In-Reply-To: <a1a6b2f8-af42-4942-ab62-678e37381d08@sirena.org.uk>

On Mon May 19, 2025 at 11:56 AM CEST, Mark Brown wrote:
> On Sun, May 18, 2025 at 04:04:24PM +0200, Benno Lossin wrote:
>
>> I'm not sure if I understand correctly, so I'll just try to echo it and
>> see if it's correct :)
>
>> The `enable`/`disable` functions change a refcount on the underlying
>> regulator that tracks if the regulator actually is enabled/disabled.
>> Asking the hardware to enable or disable a regulator can fail, but if we
>> already know that it is enabled, only the refcount is incremented.
>
> Yes.
>
>>     It's okay to leak this enabled-refcount, since when the regulators
>> actual refcount (so the one adjusted by `_get` & `_put`) hits zero, we
>> can also disable the regulator. So the enabled-refcount is essentially a
>> weak refcount that only does something while the regulator exists.
>
> No.  You should not leak any refcount, the per consumer refcount
> duplicates what's being done for the regulator as a whole, one should
> never be incremented or decremented without the other (but there may be
> multiple consumers to choose from).

What stops the last `regulator_put` to also call `regulator_disable` a
correct number of times?

What are the kinds of problems that one could encounter when not calling
`regulator_disable` before `regulator_put` or if `regulator_enable` was
never called to begin with?
    I'm asking, because if the answer is "memory bugs", then we'll need
to make the abstraction such that users cannot misuse the enable/disable
calls (or make those calls `unsafe`).

---
Cheers,
Benno
