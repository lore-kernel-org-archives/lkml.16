Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392A719995E;
	Mon,  5 May 2025 07:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431465; cv=none; b=AMsYmQFlJwZHr/FShRhMZbw06I4TG3y5Gv751yzkJwdVHjQTy+lzc4/nplm09BysP+Rutfch0T1RTX4NwEGjzJv2hl6G6Q+TpwSgRzcyzePiBC/PHM1KhVWCzjRNxNIxCfMD8sLqv27RF11KsdFA1xAr1nd8q8akPKnd7qdBpPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431465; c=relaxed/simple;
	bh=rFlC3G2QPaipY/UqH8fKM4Pv7E3NVNMi611EHmCocCU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Cp+zo0fkEe5VZEb71Clz7xKZoxd4dcdcTbGEyotpa2dvXp4AhaHQ/KiG9oscCucU1ewFuOuy1mVLfz5agc22tvebc8zzzwUTtdboH2e+Yz69gYpRoYJPmQRHzLTfbPCCKo/bD1HI8GZq3J7+VBefcH3FtFhP17ZCo/6Lv6LiZF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vJlBNxI8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vJlBNxI8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F40CEC4CEE4;
	Mon,  5 May 2025 07:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746431464;
	bh=rFlC3G2QPaipY/UqH8fKM4Pv7E3NVNMi611EHmCocCU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=vJlBNxI8UFwC4/8e6LPcZ1p0Srd8eYyojq5JtB7DfPu7dV0ODIiRojf4D2gAGBuoA
	 yWEnKE7x0Ynlv9X0IWycQ7C0TkgUEa1ksybM1ZnavdhHMN94XFarK58XATTeX77nbY
	 N+wSbegMCRjYxZByOEwjIadC77J38jZGeUWYoTNabmgg9NtFG2T3V3mnUr7TbZudnQ
	 X0HFeYpel41VZGb3lGU532727Z1EJkAh8iuUtUQNvDwDxALMUmBQZ+gfDR+t8xNNuS
	 xMhynZfP3UsbpT3djgC23wdBFac3KjAcr60ccxzSJrDC0xFqz5QbmnSMiaJkoePsTt
	 Pqm/Z94vhx15w==
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
In-Reply-To: <CANiq72m0cuf5YKfOY8oNg83dzWEqqyddGKKh_6fwQQ4hoCp+yQ@mail.gmail.com>
 (Miguel
	Ojeda's message of "Sat, 03 May 2025 13:18:40 +0200")
References: <20250501-configfs-v6-0-66c61eb76368@kernel.org>
	<20250501-configfs-v6-1-66c61eb76368@kernel.org>
	<ELsEgktE6XbGxDyusumtuVzyX-eotyYuQdviHTZaIxN7KZaGFr0fNqrv5tac_gYWfbDZYNTC-wQyQuxnmufA2g==@protonmail.internalid>
	<CANiq72mS_HV5rDjP+t+k0jX9QeAgF2SB9_xX54iEBTH-GoPuEg@mail.gmail.com>
	<87msbw1s9e.fsf@kernel.org>
	<86-cT9dBPpEIyQXWVCeEmj3TRvBm6Ta0p1B20sSngRGOqOuC96i6hG3Q9Hg3bN8AQTCPXlsxg_C5Ok0G4JJzpQ==@protonmail.internalid>
	<CANiq72nd0Pfv4TrpULGQ_fZkyBpHyVVZ1H45_RJBgBxkJuzCJQ@mail.gmail.com>
	<87h62419r5.fsf@kernel.org>
	<FLMJjrvUlrMEWy7KzihcYUt-V1IFyP8nt9KYysmVPsWdxUR9dRVXsRoSBw4Z0oFX8tzfWieBDkP7YPAHOXtFcg==@protonmail.internalid>
	<CANiq72miL3eZ40ujmA-pXCqMS8y2AzJQ1UKpL1_hX03AJ0fteQ@mail.gmail.com>
	<87bjsc154u.fsf@kernel.org>
	<CANiq72=SD9ogr+RpPK7E+cFmn2qAVu+MBCoChdp8-hw7JFu6zA@mail.gmail.com>
	<TbTextfZAMlWFS5cWlUE-Wtnp1bv8P783IQQbWUcnHvEgBjpIxukMngLdPkqNR9jWT9O_OtOY1ejin9JoOnsww==@protonmail.internalid>
	<CANiq72m8VWKRyFai0Xg8AZUTjG0eUVG8nY-ZCQOqOnvwsW0ZaA@mail.gmail.com>
	<875xij1ouy.fsf@kernel.org>
	<m9-XLEt04AwLCzToZZoXspXzPC6RJkp8ht7DnkVuEEPHQ02CjS0SNIKyKM1gsH-QfZruoYixHlsAHzfYyNEykw==@protonmail.internalid>
	<CANiq72m0cuf5YKfOY8oNg83dzWEqqyddGKKh_6fwQQ4hoCp+yQ@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Mon, 05 May 2025 09:50:50 +0200
Message-ID: <87ecx3xzqd.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Fri, May 2, 2025 at 8:57=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> Right, they are not from const context, but they are inside a `let`
>> statement, so if all the captured variables are constant (which they
>> are), the let statement will be evaluated in const context [1], right?
>
> No, I don't think so. Though I don't know what you mean by "captured
> variables" here or why you point to [const-eval.const-context.init].

I see. it is not guaranteed, but it _may_ be.

Regarding captured variables, I was referring to "any operands". From
[const-eval.const-context.init]:

  Const context is one of the following:
  ...
  The initializer of statics.

From [const-eval.const-expr.list]:

  The following expressions are constant expressions, so long as any
  operands are also constant expressions and do not cause any Drop::drop
  calls to be run.

  ...

[const-eval.const-expr.block]:

  ...

  let statements

So I was thinking that because I am initializing a static with a let
statement, it would run in const context. But I see that it is not
actually guaranteed.

> The way I read the reference is that Rust only guarantees evaluation
> at compile-time within const contexts, and a `let` statement is not a
> const context and its initializer is not one of the ones listed in
> [const-eval.const-context.init]. `const fn` isn't a const context
> either.

I agree. No guarantees, [const-eval.const-expr.runtime-context]:

  In other places, such as let statements, constant expressions may be,
  but are not guaranteed to be, evaluated at compile time.

> Which makes sense -- the `let` initializers are just "normal"
> expressions, i.e. you don't want to limit the kinds of code you can
> run there.
>
> For instance, here there is a panic at runtime trying to mimic a bit the =
patch:
>
>     https://godbolt.org/z/v5qdK9vve
>
> Similarly, if I take your patch and put there an `assert!(false)` in
> `add` -- I see no build error and `objdump` shows the panic call from
> the sample.

Right. Which is why I opted for `build_error`. But with the `const`
block solution you suggested is better.


Best regards,
Andreas Hindborg




