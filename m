Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9D01C5485;
	Mon, 19 May 2025 12:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657811; cv=none; b=ASbTljAKlIbiGdemuBhzgJvgtdApvFun6Pl4a0UwMi1EGrmqdyk1IW23rNFLcQof1zNXHTp/jCbcHBmKEOGjOT+3ln4AP7tr3menp63ySQlAGoNUcc4V+UU9/EfOmbKtGl81DhgRk0ehs/W7Fn4wFcQ8VDUPUJOivD8qrmSOLcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657811; c=relaxed/simple;
	bh=O3K+tc7r6sCh2WGTsamVvNqKcPwy0BoFCEaeoHRZrgw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=fF2PltWP3JsKmKa/e1wy9x9L4McG9ldliDaTJuX/IQSxlskFuipSHoI5sYniEkEu33ZFHScTNgHOm68eQr5FmBwjt83RXHfybaM6U6x1w7Jma6BbkZ670tVKp42xqbaxGuVG85Z0FnQsjB3yhKyWmEOr7nD+JCqkLOrUUCNhdaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qsDEfCsa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qsDEfCsa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0931AC4CEE9;
	Mon, 19 May 2025 12:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747657810;
	bh=O3K+tc7r6sCh2WGTsamVvNqKcPwy0BoFCEaeoHRZrgw=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=qsDEfCsa017zfFatvitoerp33o/vXsUqOMGzgt3hWELWDCn+KP72BytZz5PA9rPke
	 dNd7b6znWVPEoNQqURvCUB/VMSrY4k6gCjgQfSt0vGxJKi5W4pKXkde7ANQrtjiX/6
	 ncKZvqGU1BaXFAPsqg6UhxVx7q4f5wL3ebaPGKgDu2cVFIsS36UimPkJ9lZRxVub3m
	 MhsekG3cCjZDWIx4WN6x6Gn7FuCY4HtpIu6KGWVKQ2LgT3T9ihhBSx+3tUIbJXgwdJ
	 olbe4QX6wRiDf7ZJ8hZITqhsS8HhXm9d06zam8ReBzXcibXN7cd1/LuWewwT2puyC+
	 yGYZGVmt9UTtA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 14:30:05 +0200
Message-Id: <DA04ZK6NFF1N.35LFZRY7O7SG8@kernel.org>
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
 <DA03MG3VURVI.37CBV5WEEKJSH@kernel.org>
 <8229a161-52b8-4265-8296-8f1ac49bab62@sirena.org.uk>
In-Reply-To: <8229a161-52b8-4265-8296-8f1ac49bab62@sirena.org.uk>

On Mon May 19, 2025 at 1:46 PM CEST, Mark Brown wrote:
> On Mon, May 19, 2025 at 01:25:56PM +0200, Benno Lossin wrote:
>> On Mon May 19, 2025 at 11:56 AM CEST, Mark Brown wrote:
>
>> > No.  You should not leak any refcount, the per consumer refcount
>> > duplicates what's being done for the regulator as a whole, one should
>> > never be incremented or decremented without the other (but there may b=
e
>> > multiple consumers to choose from).
>
>> What stops the last `regulator_put` to also call `regulator_disable` a
>> correct number of times?
>
> We obviously could but the regulator API defaults to not doing anything
> unless explicitly told to since getting things wrong can physically
> damage the system.  We've no idea if just disabling the regulator would
> be safe at this point so we just don't touch anything and complain about
> it.

Gotcha.

>> What are the kinds of problems that one could encounter when not calling
>> `regulator_disable` before `regulator_put` or if `regulator_enable` was
>> never called to begin with?
>
> If you don't disable the regulator you've just leaked a reference which
> is obviously a problem.

For sure. But I'm trying to figure out if this is a safety-related issue
or not. Safety in Rust has a rather specific meaning that can be
summarized with "no UB". So since the C side does nothing if the user
screwed up the refcounts, it lets me to believe that we don't have any
safety related issues when forgetting to call `regulator_disable`.

Of course we still should strive for an API that makes that impossible
or at least very hard, but we don't need to make the API `unsafe` or
have to take special care. (At least if I understood correctly)

---
Cheers,
Benno
