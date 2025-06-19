Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5A12192F1;
	Thu, 19 Jun 2025 09:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750325296; cv=none; b=Vt3yFWL/aMYD5C5Vwd3Xigf+zo8VHbOk7CbAsS9A1BmMbwvB+oXN/s5w37DlXUE5B+yu3rM72F071GibsJnQv0emtLkBZc5tX/NLLOMuJ+1XjEJpvjXHG/hIMEy5bl8VR4CbxCahXtNz3/tjhrsjis8Lk4jf8N2TXT0cFQZ3AoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750325296; c=relaxed/simple;
	bh=CdvJbqAN2i2KZVe8rF157rI8pFB9iQGI5sNq/y3z5Lo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GUlxX8lgg4LrRRM83l/zLDbP074GKKAHnblz0KEIg7z1/tj2eJViiSJk7tM8SkL/d3boBOyIwHUG2wLrPAE0BwqkWKJTVncJ9t/494abnBveON293tcD3ISgoA7Sf82k/+WKp3BJB5CnmSI0ZvFPdLrCEuiTxcHycJ4QtZxQ8yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAAp/X+g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAAp/X+g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41161C4CEEA;
	Thu, 19 Jun 2025 09:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750325296;
	bh=CdvJbqAN2i2KZVe8rF157rI8pFB9iQGI5sNq/y3z5Lo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TAAp/X+gg05uI6cdtgwIB7zPQu5Do5p66zsUPLMOWIcrnXXpYGzIp/o608NhR+Fcy
	 WDu+opKV31mUkP53uqM7mDtmZ6VOOv+hXkcQn8Z+299Z+CrF1Ac9FN+VWwcBnS2w5r
	 X1X+IB3HG5XS0wl8y2spjWtQekTA0YgCpe7+DKA1KfGhLLTTpjziDxNj/iPzovz+LP
	 3IYPkvBUnLX0x7JwAU7wAOEJBFdqyL0cwqtBJhGO8bkUlxMMs1UR2V0sTb8+HGy/Yf
	 aqE1D8m62dpVQ7lda66LKxgfF3vBYomp7k94GqzcO1TkxK51LIGQaJzhhnSFye8hpK
	 Cc0A0OpAuvsrw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "FUJITA Tomonori" <fujita.tomonori@gmail.com>,  <aliceryhl@google.com>,
  <alex.gaynor@gmail.com>,  <ojeda@kernel.org>,
  <anna-maria@linutronix.de>,  <bjorn3_gh@protonmail.com>,
  <boqun.feng@gmail.com>,  <dakr@kernel.org>,  <frederic@kernel.org>,
  <gary@garyguo.net>,  <jstultz@google.com>,
  <linux-kernel@vger.kernel.org>,  <lossin@kernel.org>,
  <lyude@redhat.com>,  <rust-for-linux@vger.kernel.org>,
  <sboyd@kernel.org>,  <tglx@linutronix.de>,  <tmgross@umich.edu>
Subject: Re: [PATCH v1 1/2] rust: time: Rename Delta's methods
 as_micros_ceil and as_millis
In-Reply-To: <CANiq72kacWaLo=EE8WyA_M2Pr9h1MkqjeAmqet6CSGWLvM7B9g@mail.gmail.com>
 (Miguel
	Ojeda's message of "Thu, 19 Jun 2025 09:23:38 +0200")
References: <CANiq72kSfHTPeRQjhHKhdw8zuozvNy50CJjTuEbUnW_3j9x8tw@mail.gmail.com>
	<CAH5fLgggDKUwmU3oCTMS1dQGzA5Whp2fnXoLmbGmNF1W89Ar_A@mail.gmail.com>
	<CANiq72mBfTr0cdj_4Cpdk62h2k+Y5K3NSs54_1-9jiszMZ6AuA@mail.gmail.com>
	<20250619.160844.1477802332578239775.fujita.tomonori@gmail.com>
	<v2VP7JfqanHzCbCjzZsKXCG3l7icurTwDY22nHhk0sJjQjy2gubeujbVvfLe7c8-2KOURnZ87UHLxjAGiTxfeQ==@protonmail.internalid>
	<CANiq72kacWaLo=EE8WyA_M2Pr9h1MkqjeAmqet6CSGWLvM7B9g@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 19 Jun 2025 11:28:01 +0200
Message-ID: <87ikks84im.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Thu, Jun 19, 2025 at 9:08=E2=80=AFAM FUJITA Tomonori
> <fujita.tomonori@gmail.com> wrote:
>>
>> So would the function be defined like this?
>>
>> fn as_nanos(self) -> i64;
>>
>> If that's the case, then we've come full circle back to the original
>> problem; Clippy warns against using as_* names for trait methods that
>> take self as follows:
>>
>> warning: methods called `as_*` usually take `self` by reference or `self=
` by mutable reference
>
> Yeah, the Clippy warning is indeed one more data point that the
> guidelines are confusing to the point of having Clippy complain or,
> more likely, the guidelines' intention is that we should just pick
> `&self`.
>
> If we decide to be OK with `self`s in the kernel for these cases, we
> can simply disable the lint. Doing so means we lose the rest of the
> checking for that lint, sadly.
>
> And, yeah, we are indeed going in circles.
>
> What I would normally suggest for cases like this is answering: what
> would be the best for the kernel's particular case, regardless of
> existing guidelines/lints? Then, if we think it is better to be
> different, and there is enough justification to do so, then try to
> mitigate the lose of the lints, talk to upstream, write our own
> variation of the guidelines, etc.
>
> So I would like to hear if anybody feels strongly about either
> direction, i.e. any other pros/cons that we haven't thought of.

The table at [1] seems to suggest `to_*` or `into_*` being the right
prefix for this situation. It does not fully match `to_*`, as the
conversion is not expensive. It does not match `into_*` as the type is
`Copy`.

I am leaning towards `to_*`, but no strong feelings against `into_*`.

I would not go with `as_*`, I would expect that to borrow.


Best regards,
Andreas Hindborg


