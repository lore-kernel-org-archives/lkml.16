Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D6413A26D;
	Sat,  7 Jun 2025 22:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749335522; cv=none; b=G0SMrE7UpmqeobLd1ns7cdNHNxsdMtuUFh/ifI0hbGkaZIKOwYVvnGQEi4mf1SZALm2Ey7eBReTyrPedg9sTPRBHpJejGgqjwLRGqPgNrMy9g4S1B1MkgOmUilLlsVPbtBUB2xAy2L7V02Re9xXPWWMd0gw4iR/3zhUItEdv1JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749335522; c=relaxed/simple;
	bh=5J7Fr5rmwhfz0NSkqMCXhDC603RLUuOSgyDTh8OvDo8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FVk3w7UZUBA5B4VM4uqFyYN6tJu/UMWT/xTCKdbI5eKCs4ecYsThmFfvp52sJ/yYa6RsNhEJLWTitq+zwIUGFmZdMO0nAXGfvqvM0SQYUbo0ZLJYKnNExxnd09LMor2+dO7ujynOSy/RZ51Ub/dqvV1xk+VY8xtis8eMyMq20Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UcObktIt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UcObktIt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0138C4CEE4;
	Sat,  7 Jun 2025 22:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749335522;
	bh=5J7Fr5rmwhfz0NSkqMCXhDC603RLUuOSgyDTh8OvDo8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=UcObktItjCit5VFA4KSOkbOERQbktODTW2MzonUHi/suWmgarWyx7C+od4gGp93SC
	 4rqXf81xH27HKcyCD3nSjDRS4MnzqSUyIB3CgyK86IdDsYYgJuPGvOfpC7QQDnJjOP
	 FYQ07lV40viTOA9Fm+xSoCO6NDT1V2Sls4beSLLuu6UqfkUJKlHlFnO2W4eYEq6L5m
	 IuKmgx9ZxtinITZ/xbBquJ0Ml/GsirnKne8HE4UV716v/HRvDan37MovfJSccNok5n
	 vtF3lWVaKZOvaFnzZM+iemShIVnZ655hdkGNLLTdw81NIMyOupanFG7qbK5QNSQAur
	 3GcSldViHtT8A==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Jun 2025 00:31:58 +0200
Message-Id: <DAGNOQOY3B3X.MQD616P04I3U@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: add `assert_sync` function
From: "Benno Lossin" <lossin@kernel.org>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250607-assert_sync-v1-1-b18261da83e2@gmail.com>
 <DAGEZCRR61A0.30H1MJQXW4CV5@kernel.org>
 <2531463d-fa6e-430c-a3a6-b179654cfbbe@gmail.com>
 <DAGI57J7WBD0.2BOT553TRIXH8@kernel.org>
 <407f04ff-b313-4629-bbdd-f25df14f44da@gmail.com>
In-Reply-To: <407f04ff-b313-4629-bbdd-f25df14f44da@gmail.com>

On Sat Jun 7, 2025 at 9:20 PM CEST, Christian Schrefl wrote:
> On 07.06.25 8:11 PM, Benno Lossin wrote:
>> On Sat Jun 7, 2025 at 5:54 PM CEST, Christian Schrefl wrote:
>>> On 07.06.25 5:42 PM, Benno Lossin wrote:
>>>> On Sat Jun 7, 2025 at 3:02 PM CEST, Christian Schrefl wrote:
>>>>> - Add `assert_send` as well.
>>>>
>>>> Sounds like a good idea.
>>>
>>> Should I already add this in V2 for this series?
>>=20
>> If you want to then sure, but we can also wait until we have a use-case.
>> Also, let's finish the discussion about the macro idea below.
>>=20
>>>>> +///     assert_sync::<i32>(); // Succeeds because `i32` is Sync
>>>>> +///     // assert_sync::<NotThreadSafe>(); // Fails because `NotThre=
adSafe` is not `Sync`.
>>>>
>>>> Can you split this into two examples and mark the failing one with
>>>> `compile_fail`?
>>>
>>> I've tried it with `compile_fail` and it didn't work, I think
>>> that's not supported in (kernel) doc tests yet.=20
>>=20
>> Hmm, I thought that this worked... @Miguel any idea?
>>=20
>>>> We also could provide a macro similar to [1].
>>>>
>>>> [1]: https://docs.rs/static_assertions/latest/static_assertions/
>>>
>>> You mean the `assert_impl_*!` macros?
>>=20
>> Yes, but the others might also be useful from time to time.
>> >> That might make sense, with macros we would not need to write
>>> a const block to ensure its not executed at runtime (although
>>> it's probably optimized out anyways).
>>=20
>> It 100% will be optimized out.
>>=20
>>> It would also mean that we won't need a assert for every Trait, which
>>> seems nice. So a macro sounds pretty good to me.
>>=20
>> It depends, the macro impl needs to define its own function, which might
>> be inefficient if one uses it a lot. But there is no way to be generic
>> over traits, so there is no other way.
>>=20
>> Let's see what the others think.
>
> The error messages in the macro are slightly worse:
> error[E0277]: `*mut ()` cannot be shared between threads safely
>    --> rust/kernel/compile_assert.rs:40:18
>     |
> 40  | assert_impl_all!(NotThreadSafe: Sync); // Fails because `NotThreadS=
afe` is not `Sync`
>     |                  ^^^^^^^^^^^^^ `*mut ()` cannot be shared between t=
hreads safely
>     |
>     =3D help: within `PhantomData<*mut ()>`, the trait `Sync` is not impl=
emented for `*mut ()`, which is required by `PhantomData<*mut ()>: Sync`
> note: required because it appears within the type `PhantomData<*mut ()>`
>    --> /home/chrisi/.rustup/toolchains/1.78-x86_64-unknown-linux-gnu/lib/=
rustlib/src/rust/library/core/src/marker.rs:740:12
>     |
> 740 | pub struct PhantomData<T: ?Sized>;
>     |            ^^^^^^^^^^^
> note: required by a bound in `assert_impl`
>    --> rust/kernel/compile_assert.rs:34:48
>     |
> 34  |             const fn assert_impl<T: ?Sized $(+ $trait)+>() {}
>     |                                                ^^^^^^ required by t=
his bound in `assert_impl`
> ...
> 40  | assert_impl_all!(NotThreadSafe: Sync); // Fails because `NotThreadS=
afe` is not `Sync`
>     | ------------------------------------- in this macro invocation
>     =3D note: this error originates in the macro `assert_impl_all` (in Ni=
ghtly builds, run with -Z macro-backtrace for more info)
>
> error: aborting due to 1 previous error
>
> compared to the function:
>
> error[E0277]: `*mut ()` cannot be shared between threads safely
>    --> rust/kernel/compile_assert.rs:28:31
>     |
> 28  | const _: () =3D { assert_sync::<NotThreadSafe>() };
>     |                               ^^^^^^^^^^^^^ `*mut ()` cannot be sha=
red between threads safely
>     |
>     =3D help: within `PhantomData<*mut ()>`, the trait `Sync` is not impl=
emented for `*mut ()`, which is required by `PhantomData<*mut ()>: Sync`
> note: required because it appears within the type `PhantomData<*mut ()>`
>    --> /home/chrisi/.rustup/toolchains/1.78-x86_64-unknown-linux-gnu/lib/=
rustlib/src/rust/library/core/src/marker.rs:740:12
>     |
> 740 | pub struct PhantomData<T: ?Sized>;
>     |            ^^^^^^^^^^^
> note: required by a bound in `assert_sync`
>    --> rust/kernel/compile_assert.rs:26:38
>     |
> 26  | pub const fn assert_sync<T: ?Sized + Sync>() {}
>     |                                      ^^^^ required by this bound in=
 `assert_sync`
>
> I guess I'll keep it as a function for now.

Can we improve this by using a proc-macro instead and manipulating the
span? I honestly don't think the error is too bad.

---
Cheers,
Benno
