Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF4A205519;
	Wed, 14 May 2025 10:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747218704; cv=none; b=gGtE6GZj/98kC3tN1mMX8Bp960WQrJj+ySusqvfnpW2OM7sCMOStQzxnt/mw3Z8Ed+/TxM4GWl+OIlZuxlGeQFiNKXyfEO6Heo4rwFwQvOBhWIy5cJlHfgWIti/DStcyCAMtA5C1guAgwHshbMChKNpsw4MPZN11ALbokrxRBDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747218704; c=relaxed/simple;
	bh=G0+QX/zF56JLU7CT+yZRAmDLlF9uRRUgaW5/QAX62KU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=B3JbMVklP9TuMJt9FGJLR14nOTDfdPvDCBNDVjQlQnFKIiS15a6aohZCRucMSUIHMJUJnPjKR0x0p3v0gWJeNJy/OU56mhAWvAy2auYJfJhbLRC0ZhnIC/rZe2xBovYo+qW747D4GS19zC8q9nAy+Eox6e2HEslVymjZnO8PR+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sLq6biU8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sLq6biU8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02538C4CEE9;
	Wed, 14 May 2025 10:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747218703;
	bh=G0+QX/zF56JLU7CT+yZRAmDLlF9uRRUgaW5/QAX62KU=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=sLq6biU8sWDSg5rzq/GmyFRoLQgkmisnSzlfGJKicVgqecF47vZivdovgZ5ZtnPiR
	 P50iwSEXX/faOlFiHnJ5SInRdCcTnV3ao0AauN5dDQO12tKlM+QIVo0IDGozTYKkao
	 o6oHOxN8QS3p189H9nbzokmBrKb9m1YCbFHwR2upomlJAL6Y2mu6egvhX7wEw5UCW6
	 ZKEmi2NM2jY5nRiR6oeBQkfOLujk45JtB+rnw5gJ/KrVA6ccDLvp8u2Zrp/X0e1zTk
	 1PlBzYNsHnyIUW1OgGgTwbT3988lxjfzz3KVActJ7W0i/M6xcw0t8USpAilrd3+KiU
	 F1zTc9fqcXssg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 May 2025 12:31:38 +0200
Message-Id: <D9VTC578EVTH.2HFJ9TNPFW8NQ@kernel.org>
To: "Mark Brown" <broonie@kernel.org>
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
X-Mailer: aerc 0.20.1
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9VATLUHDGU8.53I80TGVRV0J@kernel.org>
 <aCRKR5h_X04OXgjq@finisterre.sirena.org.uk>
 <D9VS6WE94O04.GXFI0K5BH4XN@kernel.org>
 <aCRti2d5x2bL0mj6@finisterre.sirena.org.uk>
In-Reply-To: <aCRti2d5x2bL0mj6@finisterre.sirena.org.uk>

On Wed May 14, 2025 at 12:16 PM CEST, Mark Brown wrote:
> On Wed, May 14, 2025 at 11:37:46AM +0200, Benno Lossin wrote:
>> On Wed May 14, 2025 at 9:46 AM CEST, Mark Brown wrote:
>> > On Tue, May 13, 2025 at 10:01:05PM +0200, Benno Lossin wrote:
>
>> >> This isn't fully clear what it's supposed to mean to me. Maybe mentio=
n
>> >> the `regulator_enable` function?
>
>> > I suspect this is adequately clear to someone with the domain specific
>> > knowledge required to be using the API.
>
>> I still think it's useful to name the exact function that is meant by
>> "enabled".
>
> It's not clear to me that it's helpful to have to refer to the C API, as
> opposed to just being free standing.

To me it would be much more clear if the function were named.

>> >> Why don't we drop the refcount if the `regulator_disable` call fails?
>
>> > If you fail to disable the regulator then the underlying C code won't
>> > drop it's reference count.
>
>> So if it fails, the regulator should stay alive indefinitely? Would be
>> useful to explain that in the comment above the `ManuallyDrop`.
>
> Practically speaking if the regulator disable fails the system is having
> an extremely bad time and the actual state of the regulator is not clear.
> Users might want to try some attempt at retrying, one of which could
> possibly succeed in future, but realistically if this happens there's
> something fairly catastrophic going on.  Some critical users might want
> to care and have a good idea what makes sense for them, but probably the
> majority of users of the API aren't going to have a good strategy here.

Makes sense. So does `regulator_disable` take ownership of the refcount?
If yes, then just put that in the comment above the `ManuallyDrop` & in
the `Drop` impl of `EnabledRegulator`.

---
Cheers,
Benno
