Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BD439855;
	Sat, 28 Jun 2025 13:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751118569; cv=none; b=S6JQO3T7l9l6uGUZqiuYEG0VkQv19ZzUt3Bjtt7Va46CwWqPEnTDIxcg4lCr4iRid0+uzyxW/ph3qPxMjGP+yB2WZbpeEloKM317Gizl0WAdT2wxTq5lDI0ys8zATUu9bRqpXnwM6YNpLphd3XK2dmQ4QKtwzA4h5KPR+Yw7/qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751118569; c=relaxed/simple;
	bh=16MAsRdlds0FoL36ZBrNX/Oiili/DgKzDu1f6eYudE0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ZHfBMtL0G0dz1qQrYvZD7fHtQaKJX+UgThEeuqhY0MOX9kR5KZntDN+oioTrPxvTQfd/Vo/hZKor3pOmLOh0DWoe3GLSStmOazJ16HzvDUKCW+pcabQ0u1eoWztTQen+hcahgHr/UVkQHVqYNhVcWkNH4AA7QZWwLOIeu8rb4qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZcEb9+1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZcEb9+1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05DBC4CEEA;
	Sat, 28 Jun 2025 13:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751118569;
	bh=16MAsRdlds0FoL36ZBrNX/Oiili/DgKzDu1f6eYudE0=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=RZcEb9+1Ge569Z/EwNtDdm31mFO/Fl9L+CWPICJTindmAyUl7Sp/Sdo/36WTZfbvs
	 UPAcFgjOe07BejmXCfozvG/LZYoAvNLoCz/sQL6/KJXYfSXP1BcNRZRqxEFQuPirK6
	 4E+VgZskcWMrwb4HX/zmqRyKUu7unw0YGvl7Udx+YAPk9XNlc85++4cvL/qVC9uzlk
	 Xp+yKQjIG73CZdft7YTdGZ6EWzoxyT1ZVIUOBNyX0yO6uG/i1PJncItKhLXkihSmTd
	 SeX1mRG+z831FQoPWITzD9yQQOzTwxA89NhOT6WPCgozwMH9KqXapE33oSUGut8nJG
	 bRGVawk207MjQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Jun 2025 15:49:25 +0200
Message-Id: <DAY7Q38HP1QW.22PF232X1EV25@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@kloenk.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: init: Fix generics in *_init! macros
From: "Benno Lossin" <lossin@kernel.org>
To: "Janne Grunau" <j@jannau.net>
X-Mailer: aerc 0.20.1
References: <20250628-rust_init_trailing_comma-v1-1-2d162ae1a757@jannau.net>
 <DAY60NP32ZDA.155XFXZ9AOF70@kernel.org>
 <20250628132507.GA1546990@robin.jannau.net>
In-Reply-To: <20250628132507.GA1546990@robin.jannau.net>

On Sat Jun 28, 2025 at 3:25 PM CEST, Janne Grunau wrote:
> On Sat, Jun 28, 2025 at 02:29:11PM +0200, Benno Lossin wrote:
>> On Sat Jun 28, 2025 at 1:36 PM CEST, Janne Grunau via B4 Relay wrote:
>> > From: Janne Grunau <j@jannau.net>
>> >
>> > The match pattern for a optional trailing comma in the list of generic=
s
>> > is erroneously repeated in the code block resulting in following error=
:
>> >
>> > | error: attempted to repeat an expression containing no syntax variab=
les matched as repeating at this depth
>> > |    --> rust/kernel/init.rs:301:73
>> > |     |
>> > | 301 |         ::pin_init::try_pin_init!($(&$this in)? $t $(::<$($gen=
erics),* $(,)?>)? {
>> > |     |                                                               =
          ^^^
>> >
>> > Remove "$(,)?" from all code blocks in the try_init! and try_pin_init!
>> > definitions.
>>=20
>> Oops, that's a good catch! Seems like nobody used the generics before...
>
> Nobody upstream, it's used downstream in the asahi tree.
>
>> Do you need this to go in as a fix into v6.16, or is it fine if I pick
>> it for v6.17, since it's only a build failure?
>
> I don't need it since I have to carry it anyway in the downstream tree
> but I think it would be good idea to fix it in v6.16.
> Since it's in the kernel crate (the macros in pin-init are fine) I'd
> propose that Miguel picks it with other rust fixes.

Sounds good!

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno
