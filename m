Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323404A0F;
	Wed, 14 May 2025 14:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747231569; cv=none; b=hBFjm7xRHtlkfLaJopR6iWgmam00G+LfVAxxTwkpfPQ5HD6gOFBgtOGtoVTkz1AJvRxXw0T7MtyJUMtRi8JqucGXF3PHFwcmaDBDJb39Bx85FVIq8aD82mBOs4qCG6AvdbU/3bWDGe7owX2oBorqUqVJ88vXY7iYr7z4+yHXa94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747231569; c=relaxed/simple;
	bh=6VWroJfqXW3f/nuCV3yKOtP1GGZzBfP7+NeW4zEP8iM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=PIE70EVU4vjkykltyfcH4Hyf4n2fmUf4EhqnPMGbkSrTEYF+Vk6LKb7LxAfoulNYtSFFbQyRtW+3KlvpC4xkXeuPm/sgfaMBgXX05G1JrX1Ou/CSit8c1p537U+mQ0MRLDM61ezfa41n5fc1fDrUPlrus5Un+ICcqVKLFjBsGS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rAqN4uH8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rAqN4uH8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA30C4CEED;
	Wed, 14 May 2025 14:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747231568;
	bh=6VWroJfqXW3f/nuCV3yKOtP1GGZzBfP7+NeW4zEP8iM=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=rAqN4uH8uGsFsz1E3Bn5lHcypmPb15H+R/k6RfsVzAO0fKrqNdl0OHjRkFJ12hl11
	 0iPpPOVYqo7S2tofsg6YdKGAjjepxq7Lw/2swWHMrIoEwV7BU5eCXMOKHE6kB+7DEi
	 E8PP90pdy+4wsgDgv6kwBcmj5++1QDvzXG5Ze/QZ5HVNcB75ocJVUTkQDL3qh6kD70
	 pBYSG7Aqq5wQIV0dF3I3LI9FUQ1z1/FzeEIvXm7AVQ6dxGCmeibinWEztdfsOtBt46
	 i8OpXXW9IjyjN3uZJEwn5leGlyRyOBMjZovxImRvGR76ze67xlDqwZHGBFN2IEzNyh
	 dHMZCIYJpGbZA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 May 2025 16:06:03 +0200
Message-Id: <D9VXWBFF85HC.VQBCQLD2X9VE@kernel.org>
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
 <D9VVPGM147GP.3V338KUZGRQ6D@kernel.org>
 <aCSRJnKu3-igA2PK@finisterre.sirena.org.uk>
In-Reply-To: <aCSRJnKu3-igA2PK@finisterre.sirena.org.uk>

On Wed May 14, 2025 at 2:48 PM CEST, Mark Brown wrote:
> On Wed, May 14, 2025 at 02:23:04PM +0200, Benno Lossin wrote:
>> On Wed May 14, 2025 at 1:50 PM CEST, Mark Brown wrote:
>
>> > In the C API the disable operation just fails and it's treated as thou=
gh
>> > you hadn't done anything from a refcounting point of view.
>
>> But if it succeeds it takes ownership? The function `regulator_disable`
>> is also used in the `Drop` impl of the `EnabledRegulator`, so it better
>> give up the refcount, otherwise we would leak it.
>
> I can't understand what you are saying at all, sorry.  What does "take
> ownership" mean, and what is the "it" here?  We are talking about the
> case where regulator_disable() fails here, that means it didn't do what
> it was asked to do.

My confusion got cleared by what Daniel wrote:

> I am operating under the assumption that regulator_enable() and
> regulator_disable() do not touch the reference count. Note that we do not
> acquire a new reference when we build EnabledRegulator in Regulator::enab=
le(),
> we merely move our instance of Regulator into EnabledRegulator.

and

>>> +impl Drop for EnabledRegulator {
>>> +    fn drop(&mut self) {
>>> +        // SAFETY: By the type invariants, we know that `self` owns a =
reference,
>>> +        // so it is safe to relinquish it now.
>>> +        unsafe { bindings::regulator_disable(self.as_ptr()) };
>>
>> Same here, what happens to the refcount?
>
> It remains the same, we never acquired one when we enabled, so we are rel=
ying
> on inner.drop() to decrement it.

I'll try to explain what my initial question regardless, maybe that'll
clear up your confusion :)

My initial question was whether `regulator_disable` would drop the
refcount (in the case of success and/or in the case of failure). Since
if it failed in the quoted code:

> +    /// Disables the regulator.
> +    pub fn disable(self) -> Result<Regulator> {
> +        // Keep the count on `regulator_get()`.
> +        let regulator =3D ManuallyDrop::new(self);
> +
> +        // SAFETY: Safe as per the type invariants of `Self`.
> +        let res =3D to_result(unsafe { bindings::regulator_disable(regul=
ator.as_ptr()) });
So this call would fail                           ^^^^^^^^^^^^^^^^^

> +
> +        res.map(|()| Regulator {
> +            inner: regulator.inner.inner,
> +        })
> +    }

Then the `.map` call below the `regulator_disable` call would not take
ownership of the `inner.inner` value of the `regulator` variable, since
the `res` variable would be the `Err` variant of the `Result` enum (the
closure supplied to the `map` function only operates on the `Ok`
variant). This would mean that the refcount is not decremented, but the
`Regulator` wouldn't be available to the caller any more, thus leaking
the refcount.

Now if the `regulator_disable` function took ownership of the refcount
(ie decrement it, or store the regulator somewhere else that would own
that refcount), then this would be fine.

See my reply to Daniel as for what I suggest to do about the refcount
leak.

---
Cheers,
Benno
