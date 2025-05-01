Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF581EFF91;
	Thu,  1 May 2025 11:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746099132; cv=none; b=AbYYIkNN70EVMrvcaL/2WoiLYYWtlB6PIkB4lOWpVI8JBg7LOEQp/iR5XPQg+7VoLRFSWejN7bOCAquF4gteftpVcE/VN7fNDLfZxJtAceiliDOYsfO2zkhdHIJo1ARirExujwv7V8X19JyLrweiEspeSAuYJYp0+sTIx9PJMYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746099132; c=relaxed/simple;
	bh=i7brWx4GNLvRNgqrmbTOpqQaXLw7gytabLKOYnNELUM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fk7If02G1SispQ3RVbha8W0RV4wrqgpbA8PJIiZZ9L3Vn8iUzvDqsA8BiQou6yti6Azj0nvokm4sEKAIleK6DlU+5On6+DOPk+TVHWGXJQhzOsOEPzc8l2H0+CTPtO3IKRKcQniniNqyJr1d/7ksqDVZBDIqXeDhPgRmhoq9El8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Af0QUX9d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Af0QUX9d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D616C4CEE3;
	Thu,  1 May 2025 11:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746099131;
	bh=i7brWx4GNLvRNgqrmbTOpqQaXLw7gytabLKOYnNELUM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Af0QUX9dq//ASAFd4J+n3SiOFYqwW/JJX+PJxm+afgZoKRu/Nex7bI/uJ4CQWFkJR
	 7NS6mEIkMj/pU9OMkrwoqdAzs0OfpZ2n6lkky0oCFoXJ94ptbu8YKpQbqjNhdSVCCL
	 s5aDV8cTOVk6MF3OxF3gYK/uDcgy7V+qdMXJVRhlZ0UN/UqqVlqpI9DD+WvCfR8Z9f
	 H0hTA317/pi0QAk46vPS4V4nEgZLwXETQpAUw0UAgTEy9fv9wnObJN+gHyIlwJEemm
	 1b8XRngJtIS1T/tlY/7IX9a4lM1FXPxQ/uB61lCCW3L+s+f67EkJCbowxrRa4BX7gG
	 qJT07r0FrRqnQ==
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
In-Reply-To: <CANiq72mS_HV5rDjP+t+k0jX9QeAgF2SB9_xX54iEBTH-GoPuEg@mail.gmail.com>
 (Miguel
	Ojeda's message of "Thu, 01 May 2025 12:52:10 +0200")
References: <20250501-configfs-v6-0-66c61eb76368@kernel.org>
	<20250501-configfs-v6-1-66c61eb76368@kernel.org>
	<ELsEgktE6XbGxDyusumtuVzyX-eotyYuQdviHTZaIxN7KZaGFr0fNqrv5tac_gYWfbDZYNTC-wQyQuxnmufA2g==@protonmail.internalid>
	<CANiq72mS_HV5rDjP+t+k0jX9QeAgF2SB9_xX54iEBTH-GoPuEg@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Thu, 01 May 2025 13:31:57 +0200
Message-ID: <87msbw1s9e.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Thu, May 1, 2025 at 12:15=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>
>> ---
>>
>
> Spurious newlines.

The one just before the cut?

>
>> This patch is a direct dependency for `rnull`, the rust null block drive=
r.
>> ---
>
> By the way, you don't need this `---`.

b4 adds it =F0=9F=A4=B7

>
>> +//! `configfs` interface.
>
> I don't know if configfs is supposed to be written in code spans, but
> I appreciate you are trying to be throughout in your Markdown use ;)
> It may be easier to read to not have it in code spans, since we have
> many already and it is not code anyway.

OK

>
> By the way, you may want to mention somehow the title they use in
> their docs: "Userspace-driven Kernel Object Configuration".

Will do.

>
>> +//! See the [rust_configfs.rs] sample for a full example use of this mo=
dule.
>
> Files are, though, like the C header below, so: [`rust_configfs.rs`]

OK

>
>> +/// with configfs, embed a field of this type into your kernel module s=
truct.
>
> Either with or without a code span, i.e. being consistent is best.

I am! Consistently inconsistent. Very much so in this series. Will fix.

>
>> +    /// Return the address of the `bindings::config_group` embedded in =
`Self`.
>
> I think you may be able to use intra-doc links for [`Self`].

Thanks. Would be nice with a lint for missed intra-doc links.

>
>> +        let c_group: *mut bindings::config_group =3D
>> +        // SAFETY: By function safety requirements, `item` is embedded =
in a
>> +        // `config_group`.
>> +            unsafe { container_of!(item, bindings::config_group, cg_ite=
m) }.cast_mut();
>
> It doesn't work to put the safety comment on top? (We had issues
> similar to this in the past, so if it is intentional, that is fine).

Clippy gets mad if we move it up. Because rustfmt wants the unsafe block
to a new line:

  warning: unsafe block missing a safety comment
    --> rust/kernel/configfs.rs:557:13
      |
  557 |             unsafe { container_of!(item, bindings::config_group, cg=
_item) }.cast_mut();
      |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^
      |
      =3D help: consider adding a safety comment on the preceding line
      =3D help: for further information visit https://rust-lang.github.io/r=
ust-clippy/master/index.html#undocumented_unsafe_blocks
      =3D note: requested on the command line with `-W clippy::undocumented=
-unsafe-blocks`

>
>> +/// This type is constructed statically at compile time and is by the
>> +/// [`kernel::configfs_attrs`] macro.
>
> Sentence is missing something. Also, we never used `# Note` yet, but I
> guess it is fine.

Thanks, rephrased:

  # Note
=20=20
  Instances of this type are constructed statically at compile by the
  [`kernel::configfs_attrs`] macro.

>
>> +    /// Null terminated Array of pointers to `Attribute`. The type is `=
c_void`
>
> Intar-doc link(s)?
>
>> +        // We need a space at the end of our list for a null terminator.
>> +        if I >=3D N - 1 {
>> +            kernel::build_error!("Invalid attribute index");
>> +        }
>
> Would the following work instead?
>
>     const { assert!(I < N - 1, "Invalid attribute index") };
>
> (Please double-check it actually catches the cases you need)

The reason I choose build_error is that if this should somehow end up
being evaluated in non-const context at some point, I want the build to
fail if the condition is not true. I don't think I get that with assert?


Best regards,
Andreas Hindborg



