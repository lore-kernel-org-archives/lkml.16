Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10331F4285;
	Wed, 14 May 2025 09:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215471; cv=none; b=alFNk6N5kJZPIASVwMUpW7YjYtN6+TUb57Ic6FruaKtcpdpCq0gA3Q7LYwYq0mN2lGCH5QfFi70yvq+riNqd/OTuN7t197yDC4noWTEh5n2DKe00jLu0qXEDPW4WtlcxqY6CRv3YCQdFMPZZRZs7A1dDg01XOck8/gtI/q5wzn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215471; c=relaxed/simple;
	bh=Qtslue7uND0uNsx0uKGx+CdibLc19hhJUSS3+9znthQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hpsF4pogFEUYIkFIXUnyKPBgmy726/p4OKF51dTjJ+zHee84yZTaBJNLMUAcaVAKRYnqXw1TDkxFYFkPpkt7NoOzT1wUl6JPd6kCjEgkIMbWeko0w9F4EcwBX8RS9mTC8E6OK8kIDm8MUSLLx3k6o1DsM959Zw7PWEwtpY/Gezs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r2jIfUct; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r2jIfUct"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27CBC4CEE9;
	Wed, 14 May 2025 09:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747215471;
	bh=Qtslue7uND0uNsx0uKGx+CdibLc19hhJUSS3+9znthQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=r2jIfUctWnzKhNY+6+c+YyvGKv4lRUj5PP1CftgSQJ17wJIwW3IRcMWds6Fmf192A
	 D3KzXya1KP4xje8mkOc2gLf5HyDwNBoGxfcxv5NL+3fKBHpMzV1s8ZxAfQnhwhXUc8
	 a/QWK5ZlXYWOaaWr4zrzPlPg+Ol3Xk3T+li/lEuTEeVkPducVITbI9n17yr7+euuSb
	 PMrvxsg+67np1NSUvMEY++mCd04yGO4zbhURnA+cZKBfpR6ItzxS5/cm7qGuD/D1m3
	 7GKegRxjY+01itpoEO4NC3GOvoUuc2+qJJgO4Ck5WNo2XipYbDc+zFy83Aj6jLUxtF
	 sYPzzYLmYPlwg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 May 2025 11:37:46 +0200
Message-Id: <D9VS6WE94O04.GXFI0K5BH4XN@kernel.org>
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
In-Reply-To: <aCRKR5h_X04OXgjq@finisterre.sirena.org.uk>

On Wed May 14, 2025 at 9:46 AM CEST, Mark Brown wrote:
> On Tue, May 13, 2025 at 10:01:05PM +0200, Benno Lossin wrote:
>> On Tue May 13, 2025 at 5:44 PM CEST, Daniel Almeida wrote:
>
>> > +/// A [`Regulator`] that is known to be enabled.
>> > +///
>> > +/// # Invariants
>> > +///
>> > +/// - [`EnabledRegulator`] is a valid regulator that has been enabled=
.
>
>> This isn't fully clear what it's supposed to mean to me. Maybe mention
>> the `regulator_enable` function?
>
> I suspect this is adequately clear to someone with the domain specific
> knowledge required to be using the API.

I still think it's useful to name the exact function that is meant by
"enabled".

>> > +impl EnabledRegulator {
>> > +    fn as_ptr(&self) -> *mut bindings::regulator {
>> > +        self.inner.inner.as_ptr()
>> > +    }
>
>> > +    /// Disables the regulator.
>> > +    pub fn disable(self) -> Result<Regulator> {
>> > +        // Keep the count on `regulator_get()`.
>> > +        let regulator =3D ManuallyDrop::new(self);
>
>> Why don't we drop the refcount if the `regulator_disable` call fails?
>
> If you fail to disable the regulator then the underlying C code won't
> drop it's reference count.

So if it fails, the regulator should stay alive indefinitely? Would be
useful to explain that in the comment above the `ManuallyDrop`.

---
Cheers,
Benno
