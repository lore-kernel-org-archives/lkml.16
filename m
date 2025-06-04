Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D338D433B3;
	Wed,  4 Jun 2025 07:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749022624; cv=none; b=S4WIcvRjyz4ca3000GY0/OGJwburUtB2ZInvBoHsCZUqgoHnv5ZRnzx1tmilcW+/Aa65j8AzqeJrb0fGSxSOsPqNYjr2GhiKcv53dyNQrvjIjshoBaEVT0hSCSZ1Dayght5PeX3OFrLtBJkdEPLJDEIY+nj+quMPEW4xCTw3l/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749022624; c=relaxed/simple;
	bh=d6bzrrrHM9j+n2fqUEXXHj0ikP00VzbiVopQRHoGd60=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=ipsXdls4WN9TwWrdbWX0McE+rLHbeU7CG/SR1BNEh59iWhxFaBk1Vq0WoHFPpkT0hjU6Bkyv0xCmh8SVEDMmlKgaV6VSvvmRA99Cig4k5C6Bqjh48lo5ImXaD7sBr00G1/vzhbup5M8xwa6hvhjtCHVLuUTmpIHub8VJlddncpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z9HRAtjC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z9HRAtjC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CA7C4CEE7;
	Wed,  4 Jun 2025 07:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749022624;
	bh=d6bzrrrHM9j+n2fqUEXXHj0ikP00VzbiVopQRHoGd60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z9HRAtjCX0So+q71FA402PK6WvgvjerkUDf1gnEz62bZkcvU0hbVDD1JtlQG1s1SR
	 4uzuSx4ZK6On0hVPmHNar2GGrLmRKiaWSeXGTvZRGDFSu9b08fP5awzek9hQ/dVwcL
	 kQOKlcIMVsoVaVgnyrgVglOy/cP5N/difcqj7TjkeycDVzKndntIY1jdmVUAL2uSJK
	 87gA2rVn3/QUPsVzM/ivWzLRdFT0UvzMyjwE04myrK+u+mR3rzsYdOweCJfLOwCU8u
	 huUNF2qXGPvkET9UEuz75upFBr+KiV8EeDqyPbJiau6wSlLpbXZe4Zd40ULA1ae52v
	 L6vhm/XdbjEmA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 09:36:59 +0200
Message-Id: <DADKRV2K4A5I.3UAZF5O9EW6R8@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
X-Mailer: aerc 0.20.1
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com> <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com> <D9W5IX9Z7QMU.3DL48O2KYTN1Z@kernel.org> <aD3BN7-MAyYq2NAX@google.com>
In-Reply-To: <aD3BN7-MAyYq2NAX@google.com>

On Mon Jun 2, 2025 at 5:20 PM CEST, Alice Ryhl wrote:
> On Wed, May 14, 2025 at 10:04:43PM +0200, Benno Lossin wrote:
>> On Wed May 14, 2025 at 9:20 PM CEST, Daniel Almeida wrote:
>> > +                )
>> > +            });
>> > +
>> > +            if res.is_err() {
>> > +                // SAFETY: We are returning an error, so we can destr=
oy the slot.
>> > +                unsafe { core::ptr::drop_in_place(addr_of_mut!((*slot=
).handler)) };
>> > +            }
>> > +
>> > +            res
>> > +        };
>> > +
>> > +        // SAFETY:
>> > +        // - if this returns Ok, then every field of `slot` is fully
>> > +        // initialized.
>> > +        // - if this returns an error, then the slot does not need to=
 remain
>> > +        // valid.
>> > +        unsafe { pin_init_from_closure(closure) }
>>=20
>> Please don't use `pin_init_from_closure`, instead do this:
>>=20
>>     pin_init!(Self {
>>         irq,
>>         handler,
>>         _pin: PhantomPinned
>>     })
>>     .pin_chain(|this| {
>>         // SAFETY: TODO: correct FFI safety requirements
>>         to_result(unsafe {
>>             bindings::request_irq(...)
>>         })
>>     })
>>=20
>> The `pin_chain` function is exactly for this use-case, doing some
>> operation that might fail after initializing & it will drop the value
>> when the closure fails.
>
> No, that doesn't work. Using pin_chain will call free_irq if the call to
> request_irq fails, which is incorrect.

Good catch. That's a bit annoying then... I wonder if there is a
primitive missing in pin-init that could help with this... Any ideas?

---
Cheers,
Benno
