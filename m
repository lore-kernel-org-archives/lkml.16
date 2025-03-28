Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A248158535;
	Fri, 28 Mar 2025 00:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743122970; cv=none; b=IcJ23XSNBblyJdSBrU/Bxf9AqyNhttrRlTF4P/WDi25klTQ02N91uCaMk3mwnYE0ZQXs/5lakgmUr9GZtJ3o5T5Vlsgjjemml/i+dAhSTEjqgeCtyc/d/rhJX/f+9A7wSRl7aIsL4IUswaVJz12lnWhQxB1hQxeaWTdaKSfKT5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743122970; c=relaxed/simple;
	bh=CDd1GTucEoHrrZlomf52vHn8hPmoPQzITPrNeUXkf+A=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=i+kjxYN8Pmuu7kR3yQ4K/Wwm8eItwrSw2R15qL+xxZ/O47Y9RdFAjF+sGrfw/UUW84b3Lr92j1oX5MiNFEsPZlv8CmpVEBaTFBF4G8aoifKrsGd6Z+PCxIM1Is4K9g1aBkflHpuyvr/DKQeNWMnXa19wRL9EDIVV1nL3NbYp4oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Oo52v3KT; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Oo52v3KT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743122965; x=1743382165;
	bh=rk99a3TNP9iPxT1r/wOUmQVVkZw/unTaG0OiNb8uqsU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=Oo52v3KT4XbOFJNmr/FmSIOBGXqQ4NfJtzdTjX41G1M9U7JBNwnqf/lE8DXt1ALlO
	 va4p//pkXihA85/hhJ1jZ/PIA4CZ9wzckG+KP9D10TKG0d4AN3hMtcO9+rzxIi3H9G
	 kK9kBmTADxQekUj/rS2r1+EEkVjOiX0aJ/ITMAvvmR1kgDsi3ayrQ6JJWOxQ6oRGE1
	 gBLmCvmC5xX7TOnWFPfJ02wdYqaJu4DE+TuShp45OliPhad9wzlEx1BjwmRXrobzX/
	 UQVSy+jBe/bsr8ieX/Va6q4ktpKt2eEuB7muoDM7KAkuKSGiA+X5m+7S6xlDMarpf3
	 gtTxfv6ORVgdQ==
Date: Fri, 28 Mar 2025 00:49:21 +0000
To: Igor Korotin <igor.korotin@yahoo.com>, linux-kernel@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, y86-dev <y86-dev@protonmail.com>
Subject: Re: [PATCH] rust: macros: Fix macro referencing core and kernel crates
Message-ID: <D8RHIOTYBFI5.3ETKTDNGZW3FH@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 8b7a0f89dd873e1ab6d9e246ec9d7d70515e6697
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed Mar 26, 2025 at 7:23 PM CET, Igor Korotin wrote:
> To prevent issues where user-defined modules named `core` or `kernel`
> could be picked up instead of the standard ones, update macros to use
> absolute paths, `::core::...` and `::kernel::...`, for core and kernel
> references.

Please split this sentence up into smaller parts. Also "standard ones"
sounds weird to me, `core` and `kernel` are crates and not modules.

> Suggested-by: y86-dev <y86-dev@protonmail.com>

Please use my real name and other mail address instead:
   =20
    Benno Lossin <benno.lossin@proton.me>

> Closes: https://github.com/Rust-for-Linux/linux/issues/1150
> Signed-off-by: Igor Korotin <igor.korotin@yahoo.com>
> ---
>  rust/ffi.rs                  | 2 +-
>  rust/kernel/device.rs        | 2 +-
>  rust/kernel/device_id.rs     | 4 ++--
>  rust/kernel/kunit.rs         | 8 ++++----
>  rust/kernel/static_assert.rs | 4 ++--
>  rust/kernel/str.rs           | 4 ++--
>  rust/macros/lib.rs           | 6 +++---
>  scripts/rustdoc_test_gen.rs  | 8 ++++++--
>  8 files changed, 21 insertions(+), 17 deletions(-)

There are also some occurrences of `kernel::` & `core::` in proc macros,
for example:
- rust/macros/kunit.rs:129
- rust/macros/module.rs:347
- ...

Could you also add those to the patch? Thanks!

(line numbers after applying your patch to rust-next)

---
Cheers,
Benno

