Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF7B2CA6;
	Sun, 18 May 2025 14:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747577302; cv=none; b=bXHRrk4oy3YVVkZRoGNzC9ad5runuZSXp7WPgF8mZ26+LXtOv0rfVDPcI4yRYIhUdeH54+H6NrbDRkmO3wCP4sqd3S+EC35FePDPunKmammISUxA3xnT2IAvbXA6XbXov9uP0lKFV3Q6kzSo6jItlP+wu/YtY4YFqoC/JyAAVxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747577302; c=relaxed/simple;
	bh=AgKo8TgX/Hl6XS9+GhfdbOr+7v2ldSOpPxbPPyQ1tWk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=j2rS1mKh6d9t7HFsnxotm2jyNfS+w9pHXJbeHZ01Kgy5uKPdNbcifqQuiZ0BRLYGEgoFhMqz9mhmg7+rxpVackSaahXfkvgKAP3hmbJl7xyYRIrY5ND2k25ZfhU50ACyaKTDnE6FbqvwApIlZOBWnmpFNqymiM9ExISI8tFv/0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BWTRwjWK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BWTRwjWK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF6AC4CEE7;
	Sun, 18 May 2025 14:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747577302;
	bh=AgKo8TgX/Hl6XS9+GhfdbOr+7v2ldSOpPxbPPyQ1tWk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=BWTRwjWKsiuVR+Z2kNiFXbZaJiotzFB9hYOPjwmm8UFsnc77yWPju19aMoniHkxa6
	 KxiQB4vQwwSwoY9wyUyBQmotfUi4b6TSRWq2z3H6ol4i44M8FXeND771erz9au6Hbv
	 /8yN3Yg4sfspz6wzb4CMRo3cB4wRKjKA7wuu0r6itQ9XncDe6k8MYyVojSZoldfEI9
	 38aky5DxLYwcdeNu5Bg4cuxETwYpPWosCaII47ZdsVGfiwkh5KVF7rYMEhPvLtkXhO
	 QlypuxIaS56RSqf7BEhWr3rlwSYESvytnnD4NwrnyjRvCT4IDB4edW6n3jPUZ0TVw8
	 l1UjPu4kVEIBA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 May 2025 16:07:20 +0200
Message-Id: <D9ZCFH8F2MBK.1J0BC54P9EWN9@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>
X-Mailer: aerc 0.20.1
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com> <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com> <D9ZBIGJWS9I6.17MVKGQWNNOX8@nvidia.com>
In-Reply-To: <D9ZBIGJWS9I6.17MVKGQWNNOX8@nvidia.com>

On Sun May 18, 2025 at 3:24 PM CEST, Alexandre Courbot wrote:
> Hi Daniel,
>
> On Thu May 15, 2025 at 4:20 AM JST, Daniel Almeida wrote:
> <snip>
>> +/// Callbacks for an IRQ handler.
>> +pub trait Handler: Sync {
>> +    /// The actual handler function. As usual, sleeps are not allowed i=
n IRQ
>> +    /// context.
>> +    fn handle_irq(&self) -> IrqReturn;
>> +}
>> +
>> +impl<T: ?Sized + Handler + Send> Handler for Arc<T> {
>> +    fn handle_irq(&self) -> IrqReturn {
>> +        T::handle_irq(self)
>> +    }
>> +}
>> +
>> +impl<T: ?Sized + Handler, A: Allocator> Handler for Box<T, A> {
>> +    fn handle_irq(&self) -> IrqReturn {
>> +        T::handle_irq(self)
>> +    }
>> +}
>
> I see that every smart pointer would have to implement Handler in order
> to be used with this module, but...
>
>> +#[pin_data(PinnedDrop)]
>> +pub struct Registration<T: Handler> {
>> +    irq: u32,
>> +    #[pin]
>> +    handler: T,
>
> ... what if you store another type `U: Borrow<T>` here, and take it as
> the argument of `register`? This way you should be able to use anything
> that implements Borrow<T>, which includes T itself, Arc<T>, Box<T>, and
> more, and can remove the two impl blocks above.

I don't think that this is easily possible, since then the
`Registration` struct will have two generics, which I think is worse.

The impls above are pretty common for these kinds of traits, so I don't
think it's too bad.

---
Cheers,
Benno
