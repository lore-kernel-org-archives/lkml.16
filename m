Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6BF23E355;
	Wed,  2 Jul 2025 09:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447830; cv=none; b=liD3jzn7072VbEylfvbBZfmTd2WM86OVCT0qWXz4bGzvaOhHfx0VefKr1TekqyojaI9nHcxKeiQOoO1JoZNt9lVCJX4HoMX5K58Wa8MSWhQKPq66PHR8LEC5VLZUH/PL2gEy8ZIBUPgT5gmHhPZgNJmFZvaWDfDhi/TMJFmd4Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447830; c=relaxed/simple;
	bh=5trX2/qBt370oQM+eQOmc4ScCf1+K3pdG9doe5YgmgY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GucmG4xTLi3SF7+0WAIL1gn5wx9a5IhgZg0RIs169V+oIozjrHIBECnxKEkf76AdQYrKEk5Erwr2QmB1avpoT7luLJLIJvyLdMz8ouHJpcFW3CC/cIdpUydJ1BgzltBZbYD+pNJ+kv/xw4TAQDw0ajCFrFF0neOXsEJByCSioak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iNGNS0Pe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iNGNS0Pe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E7FC4CEED;
	Wed,  2 Jul 2025 09:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751447829;
	bh=5trX2/qBt370oQM+eQOmc4ScCf1+K3pdG9doe5YgmgY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iNGNS0Pe9MXE3erkwPxh1ibwgsZgQq8saMTuE4GuBkKVVeCwm7hMNMnYHWtJQ6uK9
	 K6Y31MMrKM6JfyfGEc6jvIjZ1nlWv8xu6MLy4v2/iyq8VlLDfYqoiU4+vk+9NPNykZ
	 wG4w6FEODOwRx8Dgm2o3e6X+elTmiaDHkCQr2RBQubnsfud0tamfZ9IIrjs2tyY6mj
	 S3zVxy+aSy17ee55oh+A5T2gbDyhcSEDcvS2TwP8kuTz3greGCUfGCddFaidZm+F65
	 UnGO3NwcE2te7XXjsNpVwAB4G7hnQZSxCQESU6DZZpShg7/R/cHDQ5uxWX7yYaUjX5
	 ScT69UdBZhtQg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <aliceryhl@google.com>,  <alex.gaynor@gmail.com>,  <ojeda@kernel.org>,
  <boqun.feng@gmail.com>,  <anna-maria@linutronix.de>,
  <bjorn3_gh@protonmail.com>,  <dakr@kernel.org>,  <frederic@kernel.org>,
  <gary@garyguo.net>,  <jstultz@google.com>,
  <linux-kernel@vger.kernel.org>,  <lossin@kernel.org>,
  <lyude@redhat.com>,  <rust-for-linux@vger.kernel.org>,
  <sboyd@kernel.org>,  <tglx@linutronix.de>,  <tmgross@umich.edu>
Subject: Re: [PATCH v1] rust: time: make ClockSource unsafe trait
In-Reply-To: <20250701.083940.2222161064880631447.fujita.tomonori@gmail.com>
	(FUJITA Tomonori's message of "Tue, 01 Jul 2025 08:39:40 +0900")
References: <20250630131011.405219-1-fujita.tomonori@gmail.com>
	<CAH5fLgirsNn9WwEUgFaY2z9+9gG3SWssCoNSzpE56F=sS02kEw@mail.gmail.com>
	<WFqBzZDwsggoxcPQzynlG5_2FqsVdmQlUKufvcDECQUsXJOPHCA4dzoAByNPpuPrAcBoeKoDSR9v3OkJxsYxNg==@protonmail.internalid>
	<20250701.083940.2222161064880631447.fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 02 Jul 2025 11:17:00 +0200
Message-ID: <87sejfuf3n.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> On Mon, 30 Jun 2025 15:33:31 +0200
> Alice Ryhl <aliceryhl@google.com> wrote:
>
>> On Mon, Jun 30, 2025 at 3:10=E2=80=AFPM FUJITA Tomonori
>> <fujita.tomonori@gmail.com> wrote:
>>>
>>> Mark the ClockSource trait as unsafe and document its safety
>>> requirements. Specifically, implementers must guarantee that their
>>> `ktime_get()` implementation returns a value in the inclusive range
>>> [0, KTIME_MAX].
>>>
>>> Update all existing implementations to use `unsafe impl` with
>>> corresponding safety comments.
>>>
>>> Note that there could be potential users of a customized clock source [=
1]
>>> so we don't seal the trait.
>>>
>>> Link: https://lore.kernel.org/rust-for-linux/Z9xb1r1x5tOzAIZT@boqun-arc=
hlinux/ [1]
>>> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>
>> LGTM:
>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>
> Thanks!
>
>> Though you're missing `` around [0; KTIME_MAX] in some places, which
>> may be worth adding.
>
> Andreas, would you like me to send v2 with the above changes?

Perhaps we should use rust ranges instead [1]? Like this, no brackets: `0..=
=3DKTIME_MAX`.


Best regards,
Andreas Hindborg


[1] https://doc.rust-lang.org/reference/expressions/range-expr.html

