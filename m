Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F009E25D1F7;
	Tue, 29 Apr 2025 10:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745921436; cv=none; b=bAif1I0I9hkL4U4WPRW3goAb65YD8+v7zlW3H9SqVUR8+2Q7VtAHVaTXgQA7ki0G/YA1ohqoDlbqFD9FV7nfZ3ZZ2togBs0CZDz42Im3f1zyyUBU8Vf5N2pQdaVL6kZnKL/smYhIPihF6185shTW5pacSrqRCvlBarcS+mfUA40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745921436; c=relaxed/simple;
	bh=EbyccB+3B/xHeNQYbLM7WFH0l2wXsrXI9YIO7/pZOCY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ul4X4HzAOQPjpZynrjMQh/H7HttwmF+o4wCYyK2YywwrRILgZwdzzI54B9iFPfsDFUhko7ufuwoNiwuymxe5QUIf3FA6Jg+8KQBF0beZLl4Fbznsy0ub1D8HaSgIJP+qqTx6r4ON7GBgzmpJziTFuvSBu6wcHuJ0n6c5h1sUgjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9hdKOdx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9hdKOdx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78257C4CEE3;
	Tue, 29 Apr 2025 10:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745921435;
	bh=EbyccB+3B/xHeNQYbLM7WFH0l2wXsrXI9YIO7/pZOCY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=T9hdKOdxZaKYLZ+caxTklN20eACqevBGgj+wZjkDhiM2fGgin3k8U83Wb0884TOOp
	 IMn4wUgNewyTKs+m9UdO3f+IMgfrh9Z7KEB68iVfZwGvvY2rjNomTkjR1s/M8K79gR
	 OH8GD2ysuAyXPm88LzCwtov7b+Bmw8qb8tkyx7ilegCrB/q1DLZqr0YJGjnJtfYW3S
	 H93+bCZUKFzXowqkMRebutPvc/GSrPECdI5pzMfbQ6/+BK7dnOqU9LlHnidbBcE5Xw
	 cKoNwB1ZtbgwDjGWuF+eAksqn+QDHz141qoBoJ+S0+N8aQRF+noBB5QTovdgqvuE6q
	 2UT84DmHR1cig==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>
Cc: <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  "Boqun Feng" <boqun.feng@gmail.com>,  "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>,  "Frederic Weisbecker" <frederic@kernel.org>,
  "Thomas Gleixner" <tglx@linutronix.de>,  "Anna-Maria Behnsen"
 <anna-maria@linutronix.de>,  "John Stultz" <jstultz@google.com>,  "Stephen
 Boyd" <sboyd@kernel.org>,  "Miguel Ojeda" <ojeda@kernel.org>,  "Alex
 Gaynor" <alex.gaynor@gmail.com>,  "Gary Guo" <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  "Benno Lossin"
 <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor
 Gross" <tmgross@umich.edu>,  "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 2/8] rust: hrtimer: Add HrTimer::raw_forward() and
 forward()
In-Reply-To: <cdf47123d4115b0aca452dc6f6da8029cc77d292.camel@redhat.com>
	(Lyude Paul's message of "Fri, 25 Apr 2025 17:29:17 -0400")
References: <20250415195020.413478-1-lyude@redhat.com>
	<20250415195020.413478-3-lyude@redhat.com> <87ikmvkpcb.fsf@kernel.org>
	<4b35d95762198caa308be918e47ab569623c62eb.camel@redhat.com>
	<Q4COk7wIAydWBNAOyqmn50EBKQAPuyZ1kX4V3khDLKJYTRHPh4C6YSgewemkB9tHXRniEFrpbrefUu1lBzafqQ==@protonmail.internalid>
	<cdf47123d4115b0aca452dc6f6da8029cc77d292.camel@redhat.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 29 Apr 2025 12:10:23 +0200
Message-ID: <87plgv2s8g.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Lyude Paul" <lyude@redhat.com> writes:

> oh - nevermind I get it but I think you made a mistake andreas, comment b=
elow
>
> On Fri, 2025-04-25 at 17:06 -0400, Lyude Paul wrote:
>>
>>
>> Perhaps I will understand this at some point after sending this email, b=
ut as
>> I'm writing this I have to admit I'm very confused. This is the first ti=
me
>> I've actually looked directly at the hrtimer_forward() source and I have=
 to
>> say this is 100% not what I expected the term "overrun" to mean. Honestl=
y,
>> enough so I'm kind of wondering if overrun is even the right word for th=
e C
>> documentation to be using here.
>>
>> To make sure I'm understanding this right, an overrun is not "how many t=
imes
>> we would have executed the timer between now and the new execution time"=
 (e.g.
>> "how many times did our new expiration value overrun the previous expiry
>> interval"). Instead it's actually "if the timer's next execution time is
>> greater than the previous expiry time then the timer will be forwarded by
>> `interval`, but if the timer's execution time is shorter than the previo=
us
>> expiry time then the new execution time will be determined by figuring o=
ut if
>> the timer were to execute at `interval` what the closest expiry time at =
that
>> interval to the previous expiry time would be". Which, I'm afraid to adm=
it
>> doesn't actually make any sense to me and makes me feel like "overrun" is
>> entirely the wrong word to be used here.
>>
>> I'm having a little trouble understanding how I'd really describe this i=
n the
>> documentation because I'm also having a lot of trouble understanding why=
 this
>> behavior is the way it is and why someone would want it to work like thi=
s.
>> Should this be something like "Forward the timer to the closest expiry t=
ime to
>> the current expiry time that can be reached if the timer were to execute=
 at
>> the given interval"?. Or should I maybe just copy the C documentation as=
 close
>> as possible and just leave this strange behavior as an exercise for the
>> reader?
>
> Yeah I think you misunderstood how the code works. Going to show how the =
code
> would run through using the last example you gave of:
>
>>   If the timer expires 5s after `now` and `interval` is 2s, then the
>>   expiry time is moved 4s forward and the return value is 2.
>
> The timer value wouldn't actually be moved forward here and the return va=
lue
> would be 0:
>
> u64 hrtimer_forward(struct hrtimer *timer, ktime_t now, ktime_t interval)
> //                                 ^ now+5         ^ 5          ^ 2
> //                                 =3D 10
> {
> 	u64 orun =3D 1;
> 	ktime_t delta;
>
> 	//                5  - 10 =3D -5
> 	delta =3D ktime_sub(now, hrtimer_get_expires(timer));
>
> 	// -5 < 0 =3D true
> 	if (delta < 0)
> 		return 0; // 0 overruns, timer executes at the same interval
>
> 	// (we don't execute the rest, so I've ommitted it)
> 	// ...
> }
> EXPORT_SYMBOL_GPL(hrtimer_forward);

Thanks for explaining, that makes a lot more sense =F0=9F=98=85 I think I f=
lipped the sign
of `delta`.

However, I still think the documentation is not correct. How is this instea=
d:

  Conditionally forward the timer.

  If the timer expires after `now`, this function does
  nothing and returns 0.

  If the timer expired at or before `now`, this function forwards the timer=
 by `interval`
  until the timer expires after `now` and then returns the number of times
  the timer was forwarded by `interval`.

  This is mainly useful for timer types etc etc ...

Best regards,
Andreas Hindborg


