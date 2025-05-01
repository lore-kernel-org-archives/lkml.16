Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DE22DC799;
	Thu,  1 May 2025 18:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746123118; cv=none; b=b/66dC+Od99gIF+azWyEkxA2nLP3OIuvc4XcnAOZ1omCzC39cXlWqueF7SE59Y0lKkeKQzU88c2Z55R4ylwSd0gF6BKYz+9dpEL5rmAWG5lco8B9AnIgnZagSilQlYA16oqUNI2RpNUxf7+4blfGGiRydEpgI74O/eB4rLeA6tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746123118; c=relaxed/simple;
	bh=gOk61yHjfCCGWRmwY9cwrxs+cpgZNAfK4hq0p8qNcq8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fuXrrEkJhlKlyyepXrdTJDRKi6Tl07ymqdMTxEyzHyF+JimD5mtn8sM5rAfd6fgz3nHLiGKZMZVtIIHmxdqIU2kl0roPQlZhBFM3p7RON6E40s5gtFw+t5WEkXSOZWHpAfl8GQEeZjIwYTcbo10lMU4OFoTsm4NCNPUaOddo7Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dyWdcO59; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dyWdcO59"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4DA5C4CEE3;
	Thu,  1 May 2025 18:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746123117;
	bh=gOk61yHjfCCGWRmwY9cwrxs+cpgZNAfK4hq0p8qNcq8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dyWdcO59KUZfhqJh1CQgA50ra3P0WZEUracgFCwtmjexUjKOdc3z583w2/qkBzqiM
	 PYKQ8t+PXBv2/2CvrC6JBjp5eF8KbqAvxLENb8ILCviVfemyI5Y07J2ddoy8fJeNx3
	 YmSfR4UP4wtFV+tKptz/HLmcHMUTDM4WfHmBxGmP/malpO8WpNt9phuzVdH5xYHMV2
	 rVylZ0GWqJ9q5qr4demQfu27OpwgAQrXp3cII+bl/bH0zH2CJt5sYJkGDipi22zm+A
	 phknxEisK7FfupAUz2jSx3gxxIpF4CPLHMgk48b7BAY5yvrzDGccpNYQqiyn264jqI
	 cg7Y0ztns70pg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Joel Becker" <jlbec@evilplan.org>,  "Peter Zijlstra"
 <peterz@infradead.org>,  "Ingo Molnar" <mingo@redhat.com>,  "Will Deacon"
 <will@kernel.org>,  "Waiman Long" <longman@redhat.com>,  "Fiona Behrens"
 <me@kloenk.dev>,  "Charalampos Mitrodimas" <charmitro@posteo.net>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,  "Breno Leitao"
 <leitao@debian.org>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 1/3] rust: configfs: introduce rust support for configfs
In-Reply-To: <CANiq72nd0Pfv4TrpULGQ_fZkyBpHyVVZ1H45_RJBgBxkJuzCJQ@mail.gmail.com>
 (Miguel
	Ojeda's message of "Thu, 01 May 2025 16:08:11 +0200")
References: <20250501-configfs-v6-0-66c61eb76368@kernel.org>
	<20250501-configfs-v6-1-66c61eb76368@kernel.org>
	<ELsEgktE6XbGxDyusumtuVzyX-eotyYuQdviHTZaIxN7KZaGFr0fNqrv5tac_gYWfbDZYNTC-wQyQuxnmufA2g==@protonmail.internalid>
	<CANiq72mS_HV5rDjP+t+k0jX9QeAgF2SB9_xX54iEBTH-GoPuEg@mail.gmail.com>
	<87msbw1s9e.fsf@kernel.org>
	<86-cT9dBPpEIyQXWVCeEmj3TRvBm6Ta0p1B20sSngRGOqOuC96i6hG3Q9Hg3bN8AQTCPXlsxg_C5Ok0G4JJzpQ==@protonmail.internalid>
	<CANiq72nd0Pfv4TrpULGQ_fZkyBpHyVVZ1H45_RJBgBxkJuzCJQ@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Thu, 01 May 2025 20:11:42 +0200
Message-ID: <87h62419r5.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Thu, May 1, 2025 at 1:32=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> The one just before the cut?
>
> Both.

But why does that matter? Anything in the commit message after the cut
is dropped when applying the patch, right?

>
>> Thanks. Would be nice with a lint for missed intra-doc links.
>
> Definitely -- I filled it a while back:
>
>     https://github.com/rust-lang/rust/issues/131510
>
>> Clippy gets mad if we move it up. Because rustfmt wants the unsafe block
>> to a new line:
>
> Yeah, then it is one of the cases I was referring to. In that case, it
> is fine, but please indent the safety comment to match the `unsafe`
> block.

OK. rustfmt does not seem to care about this though.

>
>> The reason I choose build_error is that if this should somehow end up
>> being evaluated in non-const context at some point, I want the build to
>> fail if the condition is not true. I don't think I get that with assert?
>
> I am not sure what you mean. My understanding is that `const` blocks,
> if execution reaches them, are always evaluated at compile-time (they
> are a const context):
>
>     https://doc.rust-lang.org/reference/expressions/block-expr.html#const=
-blocks
>
> e.g.
>
>     https://godbolt.org/z/h36s3nqWK
>
> We are lucky to have Gary with us, since he stabilized this particular
> language feature, so he can correct us! :)

I might not have the full picture, but it is my understanding that
while `const fn` are evaluated in const context when called from const
context, they _may_ be called from non-const context, and then they are
evaluated in non-const context if their arguments are not const [1].
They are not guaranteed to be evaluated in const context.

So my thinking is that down the road, refactoring of this code may cause
the `AttributeList::add` to be called in a way so that it is not
evaluated in const context, and then the `assert` would be evaluated at
run time. With `build_error` we would get an error during build.

But I should probably use `build_assert` instead of the conditional with
`build_error`.


Best regards,
Andreas Hindborg


[1] https://doc.rust-lang.org/reference/const_eval.html#r-const-eval.const-=
expr.list

