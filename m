Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C221E18A92D;
	Fri, 28 Mar 2025 21:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743198500; cv=none; b=qlREzhg4l23vaG+dhbrZZgd6JVnhjm1VK414dGhRE6ae36Nh6bYlPCJEXyoPgKHjdJX22uOqgb60j1wFhKjOApLkpX4bN+3Gxb/9zQ067R/FAcTuCmyef3bUukhUGq3HfaWs8ruCV1DY4DThwVw+gKSTLKUcTlaODIgPtO76PoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743198500; c=relaxed/simple;
	bh=w3ACs6rTfc/po9dQcPQwGPJr3B1S4bhmSiFUpxWpEEI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IYHqYLLAW1vuHsVjMm1rtIsbiFGahbuXrjbV8pURbo7hrFCKD26pbscbnXo8HwJcNWnUWXWmk9WBT3N3xNeUgZiBg0CPk5AlW5tBhXanBbl2ZlbXt1nxa4Xsoeb/IPbElqKDEQVJZmWoeMnrtUCEDP3QZZn4+foj4IPqnyraa9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=M3VgqoXF; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="M3VgqoXF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743198496; x=1743457696;
	bh=mp/YgxMmFO+kOEx0tFPHbQk5ClolWrqq0KLqSJf5bwU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=M3VgqoXF31wEmMk0hlUwwPEUjRuNZLNRqAxKMN3O8qyzbPC6ikOOXAoJ1smrB48Jh
	 oBKJ7CV03eTkrrYgGr+XCt/1hx6GhO77gJK9DkJTtg2mm+cvalN26N1a8SikRlwigY
	 c0N7Pyv61qe6w9xCqvjEm7oFwgWuVQn9tE/WZ/ZYppQJpUWXLi9r6D3alhD71xmLu+
	 o/3yqKYCpdNXC/Cn0IxUyFnyf4KwRRwiJygQ5uwYRGrkJ4yo17jy2AxogmnoNX9LO7
	 6AersOBZnKDCUUHyzuZo56P31cfHHHq29vQsSzIs8/EU15TfNrOe4UqPhSZ/5HdrBa
	 vMJpzsl3uIk0A==
Date: Fri, 28 Mar 2025 21:48:12 +0000
To: Igor Korotin <igor.korotin@yahoo.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/1] rust: macros: Fix macro referencing core and kernel crates v2
Message-ID: <D8S8AIAU4NQP.1IVXRJMF4I9AF@proton.me>
In-Reply-To: <20250328180312.2025317-1-igor.korotin@yahoo.com>
References: <D8RHIOTYBFI5.3ETKTDNGZW3FH@proton.me> <20250328180312.2025317-1-igor.korotin@yahoo.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 104095309b3fdc6f7c15616d55a7aa8f689270ae
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This email seems to be a cover letter for the next version of your
patch. In that case, you should send it as its own thread to the list
(and not in reply to my previous email).

On Fri Mar 28, 2025 at 7:03 PM CET, Igor Korotin wrote:
>> > To prevent issues where user-defined modules named `core` or `kernel`
>> > could be picked up instead of the standard ones, update macros to use
>> > absolute paths, `::core::...` and `::kernel::...`, for core and kernel
>> > references.
>>=20
>> Please split this sentence up into smaller parts. Also "standard ones"
>> sounds weird to me, `core` and `kernel` are crates and not modules.
>
> Simplified the commit message.

You don't need to reply if you're fine with the suggestion :)

>> > Suggested-by: y86-dev <y86-dev@protonmail.com>
>>=20
>> Please use my real name and other mail address instead:
>>   =20
>>     Benno Lossin <benno.lossin@proton.me>
>
> Sure. Tried to find your creds via your github profile/commits without=20
> success.
>
>> > Closes: https://github.com/Rust-for-Linux/linux/issues/1150
>> > Signed-off-by: Igor Korotin <igor.korotin@yahoo.com>
>> > ---
>> >  rust/ffi.rs                  | 2 +-
>> >  rust/kernel/device.rs        | 2 +-
>> >  rust/kernel/device_id.rs    | 4 ++--
>> >  rust/kernel/kunit.rs        | 8 ++++----
>> >  rust/kernel/static_assert.rs | 4 ++--
>> >  rust/kernel/str.rs          | 4 ++--
>> >  rust/macros/lib.rs          | 6 +++---
>> >  scripts/rustdoc_test_gen.rs  | 8 ++++++--
>> >  8 files changed, 21 insertions(+), 17 deletions(-)
>>=20
>> There are also some occurrences of `kernel::` & `core::` in proc macros,
>> for example:
>> - rust/macros/kunit.rs:129
>> - rust/macros/module.rs:347
>> - ...
>>=20
>> Could you also add those to the patch? Thanks!
>>=20
>> (line numbers after applying your patch to rust-next)
>
> Agreed. Fixed references in auto-generated code in files
> 1. rust/macros/kunit.rs           =20
> 2. rust/macros/module.rs          =20
> 3. scripts/rustdoc_test_builder.rs=20
> 4. scripts/rustdoc_test_gen.rs    =20

Yeah those last two are also good finds.

---
Cheers,
Benno

