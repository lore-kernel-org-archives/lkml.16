Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D911E570B;
	Thu, 19 Jun 2025 09:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750325614; cv=none; b=qj/Mlz82kFcJ9OjeaZmFBzYM3R0fOXZ+p7peV45MwQtncLn1imvXnnRhb3H/40dUqTHfi2GpE9zsItAzE8E/pIXHTq7Nutp0oK6vswVqBp1lJeAUXAbTzIZ5Ok2PcafEqT+UHcpP42+SI1kaYvBLTHldhAR9sfjw+cF4wa6eyRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750325614; c=relaxed/simple;
	bh=BNMqhj72zAplT0S3Q+pS2ssd6wnwL4rZR95IgGtQehM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mUzJD9QQuw5AoBOa+2q4EHQXQz3E2ed3dqTpm8ElyjWcj6UCCdS4fS2xYKCslzwnwCSa9uIvcN3r2p8ZEM3QHFmpjHAdjBQqzAoN87dg/Q7CZYq86A/2rgrSek+qR6hzPkW7d1kfgxpUr4r+xt149T7Sb2hVn4dtLgtX6ZPUOgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMlxFSWn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMlxFSWn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A52AFC4CEEA;
	Thu, 19 Jun 2025 09:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750325614;
	bh=BNMqhj72zAplT0S3Q+pS2ssd6wnwL4rZR95IgGtQehM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LMlxFSWno8hA2LuuB2ChNYFu8ZN7TTK7TS/wYGnlFhLKZyg73dg35JkJxXwzGzvB1
	 9SYBRw8OvYc1QbiZDDFpI+4sJu2YOSUfwBAb4yy5l0lTcxAv4YgjxJ2Fpryeqcr1fk
	 xuLPhsj3Cz275cb7ft0n2MpxyjkQL5OObLQcNrZdKhQ4qEmXb+VpAnSlKDhAv8V79+
	 pjejGvxp/abqMC0MTMnnyd8JGBSEj7qVbAagHRlJIum/7cCAqF8clfTGNhk1KoKQgj
	 cs2csXDgkprqLbsgiebSmggIKyIM7SRUatCK8/k9ZrDcgoowSLtV8MLHfedIKekUij
	 Ga5Mk2HM1Bfaw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
Cc: "Oliver Mangold" <oliver.mangold@pm.me>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Asahi Lina" <lina@asahilina.net>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 1/5] rust: types: Add Ownable/Owned types
In-Reply-To: <DAPZ1KYN5FB6.3C7CI4Y0OKOE0@kernel.org> (Benno Lossin's message
	of "Wed, 18 Jun 2025 23:19:56 +0200")
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me>
	<20250502-unique-ref-v10-1-25de64c0307f@pm.me>
	<D9VS2Q4IX7LH.3JLXQUMWYJ2FP@kernel.org> <aFKICIo8L958iFbz@mango>
	<0KbPJp-9Rk5DVetcI8bAv8kiy90arS0GSl4qi8R83fIgPTv0MXRhz06vbuTjt5hXGguPZbL6JsQxDmuj4ejVrA==@protonmail.internalid>
	<DAPZ1KYN5FB6.3C7CI4Y0OKOE0@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 19 Jun 2025 11:33:25 +0200
Message-ID: <877c18849m.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Wed Jun 18, 2025 at 11:34 AM CEST, Oliver Mangold wrote:
>> On 250514 1132, Benno Lossin wrote:
>>> On Fri May 2, 2025 at 11:02 AM CEST, Oliver Mangold wrote:
>>>
>>> > +/// - That the C code follows the usual mutable reference requirements. That is, the kernel will
>>> > +///   never mutate the [`Ownable`] (excluding internal mutability that follows the usual rules)
>>> > +///   while Rust owns it.
>>>
>>> I feel like this requirement is better put on the `Owned::from_raw`
>>> function.
>>
>> Thinking about it some more, the problem I see here is that if the type
>> implements `OwnableMut` this requirement changes from "never mutate" to
>> "never access at all".
>>
>> The safety requirements between `Ownable`, `OwnableMut`, `RefCounted`,
>> `OwnableRefCounted` and `AlwaysRefCounted` are interacting, but I agree
>> that, when looking at it a certain way, `Owned::from_raw()` is the place
>> where one would expect these to be. I'm not sure anymore what is best here
>> :/
>
> I still think `Owned::from_raw` is the correct place to put this.
>
>>
>>> > +pub unsafe trait OwnableMut: Ownable {}
>>>
>>> I don't like the name, but at the same time I also have no good
>>> suggestion :( I'll think some more about it.
>>
>> There was already a bit of discussion about it. I had my own implementation of this
>> where I used the names `UniqueRefCounted` and `UniqueRef`, but after discovering
>> this version from Asahi Lina, I took it as it was, keeping the name.
>>
>> No one else came up with different suggestions so far, so maybe we should just leave it
>> at `Owned`/`Ownable`?
>
> I'm just hung up on the `Mut` part... Haven't come up with a good
> replacement yet.

What do you dislike about the xxxxMut pattern?


Best regards,
Andreas Hindborg



