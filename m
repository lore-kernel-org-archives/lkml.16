Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D2114BFA2;
	Thu,  1 May 2025 19:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746129107; cv=none; b=qlts5tjCeKICwNto+g3bi/Iohsy99Wn8E75n/nFUh3xQdHNKcrfRn39UQUQJoVX3PV42v5YYcJMM6/vtjIwa0M8yFV6p2ZVPDrgFoq/8Cn1aZr2mWBjRXWMsPEMGaavkjDmiJmZziDup6SwJXblnhFEf2j50Wo4wMImtzF94q9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746129107; c=relaxed/simple;
	bh=h5EaA3VYNdY85kolMxFMOR2dzJyUo6BJHKJnsp377hg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HO0SqbuL9V7fl8I5AxA0mNCzBwULU/I8ZlB89GHnAFwk6jrBtuCpqqRvcEkgRubPxY5puvbDPX932/UFPLSgPEyAQU9YY0J/QOWXrGUkVPBBfbsLrexDhhpP8vLcjGekxujq/r24QM555mjT3HPMv9VpZNe6ew25hPH/zzMuMf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p9bPucCF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p9bPucCF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CAAC4CEE3;
	Thu,  1 May 2025 19:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746129107;
	bh=h5EaA3VYNdY85kolMxFMOR2dzJyUo6BJHKJnsp377hg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=p9bPucCFym0ouSDo518c/ovDHLqJJstQ4vL0N+9izjgaTZdgxOiFf5RIKJugz9cck
	 1CX28D/Yrjv0aulm5NuoROgX+dm6wPa1FLezst2Bo1KAdTJILhK62u3+QvQ65eSezj
	 +ckctRUo3Ya7yu4JYFeWP1cOWsvL6HRarAsY/Q/6l6jjDmY16XLJunNjtLXH35XUGY
	 hgOKLde84eJ2RvKlxPRSiUVIJkwTzGgtydZVWc0BtWUvAeKF73N7pPl9mLiYNxuA5q
	 kSY/FHlvienFolCsZBBIX7I8hkKf1ldzdgOhdEB031ofvunb7FlF283HOsxlkUzxcd
	 4YToc8umN/Hgw==
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
In-Reply-To: <CANiq72miL3eZ40ujmA-pXCqMS8y2AzJQ1UKpL1_hX03AJ0fteQ@mail.gmail.com>
 (Miguel
	Ojeda's message of "Thu, 01 May 2025 21:26:24 +0200")
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
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Thu, 01 May 2025 21:51:29 +0200
Message-ID: <87bjsc154u.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Thu, May 1, 2025 at 8:11=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> But why does that matter? Anything in the commit message after the cut
>> is dropped when applying the patch, right?
>
> Yes, but it is not common to add a newline there. I mentioned it
> because it looked odd, no worries.
>
>> I might not have the full picture, but it is my understanding that
>> while `const fn` are evaluated in const context when called from const
>> context, they _may_ be called from non-const context, and then they are
>> evaluated in non-const context if their arguments are not const [1].
>> They are not guaranteed to be evaluated in const context.
>>
>> So my thinking is that down the road, refactoring of this code may cause
>> the `AttributeList::add` to be called in a way so that it is not
>> evaluated in const context, and then the `assert` would be evaluated at
>> run time. With `build_error` we would get an error during build.
>
> No, it will always be evaluated at compile-time (if it is evaluated at al=
l).
>
> Please see again the links I provided. There is no `const fn` in the
> example I provided, and yet it is a build error.
>
> From your link, it is clear `const` blocks are a const context, which
> are always evaluated at compile time:
>
>     Certain forms of expressions, called constant expressions, can be
>     evaluated at compile time.
>
>     In const contexts, these are the only allowed expressions, and are
>     always evaluated at compile time.
>
>     A const context is one of the following: (...) A const block
>
> And from mine, it mentions that it is guaranteed to be evaluated if
> execution reaches that point and that such evaluation would happen at
> compile time:
>
>     A const block is a variant of a block expression whose body
>     evaluates at compile-time instead of at runtime.
>
>     If the const block expression is executed at runtime, then the
>     constant is guaranteed to be evaluated, even if its return value is
>     ignored:
>
>         fn foo<T>() -> usize {
>             // If this code ever gets executed, then the assertion has
>             // definitely been evaluated at compile-time.
>             const { assert!(std::mem::size_of::<T>() > 0); }
>             // Here we can have unsafe code relying on the type being
>             // non-zero-sized.
>             /* ... */
>             42
>         }
>
> That example they give is precisely about using a `const` block for
> guaranteeing something that unsafe code relies on.
>
> I hope that helps.

Ah - I understand. I missed that you wrapped the assert in a const
block, a quite important bit =F0=9F=A4=A6 Thanks for explaining!


Best regards,
Andreas Hindborg



