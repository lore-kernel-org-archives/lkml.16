Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EF82264DD;
	Thu, 19 Jun 2025 12:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750337514; cv=none; b=mbmcMPI1VTem+6v66kMZ1Lj5tOGb0Cokwf1NewQ7hsfr/VES72nzCaQ9s+eL4NvVVqP3O7m5ekbT5cCnapca31v9MSwa5OVhuit7ts+cMaoYQ6DomSEhWkwSLumzvFsIkY3c9LHO4FRrD4ysuKNFlVruC7n7G6tCZORRLbHr/98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750337514; c=relaxed/simple;
	bh=e1UBzeiV9AlClAXRxxXd9aer/JQpA4TTkuCFypUdkvs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f5liOfj2FPuXmhXmu4pveH3obeRXdv+aPnSXh0efOSdnRMJmjehy2bJcDG661ejznyTMGEzhPFL7htCdT/N4RlkRe0tyeeALd0g3F022l0+zEkZUI64q2O4EJ7mD134VQFgYn1WG4TNq862h9WhFSCQfaa4CYx0Tl+sDhUoQdoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kE9Swjri; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kE9Swjri"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D48C4CEEA;
	Thu, 19 Jun 2025 12:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750337514;
	bh=e1UBzeiV9AlClAXRxxXd9aer/JQpA4TTkuCFypUdkvs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kE9SwjriWNP/jIYKzby6V9v9DynzRBJ1lEbOdAvOh5Pw/OvykqeN7smtbCrmzQq/g
	 dEXOoLEVKQvNH2tdVsiBjGxCu5fmmVOPyxMd8tUSGIUtrmf0by3GN1LzpHt4rfJeF/
	 UUBPKsRqmzFf+nWcZf4hJg065xXzxY7oiM/F/811Ky8AFht7QC2ZKNXhPBdgiDiH2O
	 Suw0lKYpMH0A5AGr3Hs5xbUvrsN0/7qmQxZpyGoO012Enkd1H4/IzT3f0z+SOmJCIT
	 HIXlNqJm7IALFxAJ4JBqMI7zn3isieKewpuXQoenf1h71xe6hcq83i2KbXoE7aSLF5
	 GfjuO9EqJP+jA==
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
In-Reply-To: <CANiq72kHvfkrK0KG2Y60HkLMt=mgJrJMOcuF9Feker0FjgoVkg@mail.gmail.com>
 (Miguel
	Ojeda's message of "Thu, 19 Jun 2025 13:44:52 +0200")
References: <CANiq72kSfHTPeRQjhHKhdw8zuozvNy50CJjTuEbUnW_3j9x8tw@mail.gmail.com>
	<CAH5fLgggDKUwmU3oCTMS1dQGzA5Whp2fnXoLmbGmNF1W89Ar_A@mail.gmail.com>
	<CANiq72mBfTr0cdj_4Cpdk62h2k+Y5K3NSs54_1-9jiszMZ6AuA@mail.gmail.com>
	<20250619.160844.1477802332578239775.fujita.tomonori@gmail.com>
	<v2VP7JfqanHzCbCjzZsKXCG3l7icurTwDY22nHhk0sJjQjy2gubeujbVvfLe7c8-2KOURnZ87UHLxjAGiTxfeQ==@protonmail.internalid>
	<CANiq72kacWaLo=EE8WyA_M2Pr9h1MkqjeAmqet6CSGWLvM7B9g@mail.gmail.com>
	<87ikks84im.fsf@kernel.org>
	<eA4kkaheodmz2bvo4hsNPi7K85CCQheFde7p25BWA83Kxp8_GQ-Anf_QVdhuIPAm9bDHnZqTlpAqcluWgNw4og==@protonmail.internalid>
	<CANiq72kHvfkrK0KG2Y60HkLMt=mgJrJMOcuF9Feker0FjgoVkg@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 19 Jun 2025 14:51:44 +0200
Message-ID: <878qln7v33.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Thu, Jun 19, 2025 at 11:28=E2=80=AFAM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
>>
>> The table at [1] seems to suggest `to_*` or `into_*` being the right
>> prefix for this situation. It does not fully match `to_*`, as the
>> conversion is not expensive. It does not match `into_*` as the type is
>> `Copy`.
>>
>> I am leaning towards `to_*`, but no strong feelings against `into_*`.
>>
>> I would not go with `as_*`, I would expect that to borrow.
>
> It is an integer division by compile-time constant, so likely just a
> multiplication and some adjustment, so it depends on whether we
> consider that "expensive".
>
> However, even if we consider that "expensive", we will still have the
> same question when we have a really cheap method.
>
> The root issue is that the table just doesn't say what to do in some
> of the "free" cases, and it is generally confusing.
>
> Since I am asking for opinions: why do you consider `as_*` as
> expecting to borrow?

1) I **feel** that is usually the case. I did not check `std` if this
also the case in practice.
2) The table at [1] says `as_*` is borrowed -> borrowed.
3) To me, the wording "as" indicates a view into something.

> The standard does take `&self` the majority of
> the time (but not always), and Clippy also expects a borrow, but you
> also said in a previous iteration that you don't want to take a
> pointer just to pass an integer, which makes sense: we wouldn't pass a
> reference if we were using the integer.

Yes, I would prefer taking by value. I think Alice mentioned earlier in
this thread that the compiler will be smart about this and just pass the
value. But it still feels wrong to me.


Best regards,
Andreas Hindborg


