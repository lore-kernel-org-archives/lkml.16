Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900981DB356;
	Sun, 18 May 2025 14:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747577098; cv=none; b=cTk7VeJW7SCzcyWkCtyUCujH0F0K7C+qPPqsC0kfSDigHxpYYbd6p2fnvD1p09q31xQ0NUkSd5IPHR2EIZiI4PZSSJ1KjlYLDmWWSCLm5ysxbJTGDqgL3z2X9DrWVROpDsPLhNMqrWjAkn/EVX96itOMD4SCGRwvB93+mn2Ed3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747577098; c=relaxed/simple;
	bh=OIZFzZ1NkkLAZVEoI5VXNZQkf2dWSp87t8Hf0ugTnEs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Kiovh33Z3T2h/FEQZ8NHfRCTRyajFZeC01RMdSHvat5gvP+qIj6o/y/y+5txd13PObJgcJuz50LNDERk9d4bwWJPLKNnfavpTvuxibEQVNQIHAgmTwHDuKt6F5B2rlIqramRZdZjVbFfAp765+T42je+Z361i8sEC1cSoUT9Z7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+aZNYP1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+aZNYP1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66410C4CEE7;
	Sun, 18 May 2025 14:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747577098;
	bh=OIZFzZ1NkkLAZVEoI5VXNZQkf2dWSp87t8Hf0ugTnEs=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=X+aZNYP1YsiWwhQ64ZkrMBCVEH5LVQlpSda2Km7gTfVRvrG1Xk8FKDdmMCjr7ghhI
	 PnMDHWI7LLQEZJRYZvyuDMNKoDGoGzBzPAkt67M5bCSD3pPq+uuaIohAsujsJul2ru
	 yWr6h0BpUhM/QUud+PU9ajvA0C+fYhPqF0zGYZmKgmkJj5IUw1UvaaPNr46GP/BgAj
	 CKQXdqn+ri8yx+j5Xxci5UKw273dZknWtiojdbXv0JjJUUV10g+R9JFO5CEnaFYSq6
	 2e+Qyhv4fxuwOys15AevsOw/7Urm/SC1cVwZJR9bU2fp1NqREFhgr70+B0ilgCyA3B
	 5RfY0ct4VxA6A==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 May 2025 16:04:24 +0200
Message-Id: <D9ZCD8D6J5QW.14H6VM9LQ5R2Z@kernel.org>
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
To: "Mark Brown" <broonie@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
 <D9Z3R4EYAXV9.211IFNRTOPM6O@kernel.org>
 <D9Z4XGQ2QHXA.2H5X1NZ5IZECC@nvidia.com>
 <aCnQo15SbhXZ9Fln@finisterre.sirena.org.uk>
In-Reply-To: <aCnQo15SbhXZ9Fln@finisterre.sirena.org.uk>

On Sun May 18, 2025 at 2:20 PM CEST, Mark Brown wrote:
> On Sun, May 18, 2025 at 05:14:41PM +0900, Alexandre Courbot wrote:
>
>> The initial proposal does such clamping by design, but I also suspect
>> the C API behave like it does for good reasons (which I am not familiar
>> enough to be aware of unfortunately).
>
> It's so that if you have multiple logical users within the device (eg,
> an interrupt handler and code for normal operation) they can work
> independently of each other.  You could also request the regulator
> multiple times but that's often not idiomatic.
>
> Originally we didn't actually refcount within the individual consumers
> at all and only refcounted on the underlying regulator, the per consumer
> reference count is mainly there for debugging purposes.

I'm not sure if I understand correctly, so I'll just try to echo it and
see if it's correct :)

The `enable`/`disable` functions change a refcount on the underlying
regulator that tracks if the regulator actually is enabled/disabled.
Asking the hardware to enable or disable a regulator can fail, but if we
already know that it is enabled, only the refcount is incremented.
    It's okay to leak this enabled-refcount, since when the regulators
actual refcount (so the one adjusted by `_get` & `_put`) hits zero, we
can also disable the regulator. So the enabled-refcount is essentially a
weak refcount that only does something while the regulator exists.

In that case, we can use any API for enabling/disabling, since all of
them will be safe. Just a question of which gives the required
expressiveness and makes misusing it hard.

---
Cheers,
Benno
