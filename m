Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4090E23E342
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 09:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746176586; cv=none; b=ENTo4fkxR1a8NN38goaB6rM2EjRdITBCR5BclNSs/cD6QoR+HNiuHDyl2rCUaxkH87Hl+dZ4cQ2oRz/RRNWTfnttZlgATtwZmGQUpsKfAdO1xSWIE8jAGtT9LMfAv1NeAC0f2MkL2BDBo1n4g08MWYLl0rIrpV4tImeIYW+btsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746176586; c=relaxed/simple;
	bh=HVf+21hPVJuLZGJqbjtv80+9kY063qAQpNuSCz5YkVs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JTfj6586KnN0UKaI+hfE3I2xVVtTA5x4Yl6zLDhmI6bbjCLfobivYIebzkuyy5g9ll+EH4noyWzYJ/0y93VA5q4RpAzw68L0aqXfIJpLAKYtR2Ni6yMKsY5rOeQm4q3V3HDgONrqv6I1KGdN0G7I4u/nl2X2cjZ5t20bRjM5u+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=EAbEXjwS; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="EAbEXjwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1746176583; x=1746435783;
	bh=LC4muJgF9aO4kWCf6YNzTnzURDKFFJSrIvZ3fBgfPW0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=EAbEXjwSKUfaHBGUxZvZrV2CnRHC1Z350HXzHbyQpVVYg6pxdoLwsbrjumniCaUXn
	 LWwcjV61rioxbBvOu9xIGNLiPKT3g+ANvfmv1PvpjVtUD4ARe6ogNMbfKMUlQikGF0
	 UUqIf5HWKKqL1wdl4IUGr0Mp7paPBj+SLtmasSYOVxmFjAXykDQCDsVLZQgQpDPQch
	 iGRGNnvt6riX+KCB15r2wNdN1pT+Y7j4DiNQcPajkJnx9KS8zJHsL/CDLLna0KyJ+7
	 AgC4DKIigoMo2uR9bWlggb9KLhp5VMSowQ6HJ+I1gMlPzOUURsRcbJFi8luGiTbwnV
	 rogm1QI+6KTPg==
Date: Fri, 02 May 2025 09:02:55 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina@asahilina.net>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver Mangold <oliver.mangold@pm.me>
Subject: [PATCH v10 4/5] rust: kbuild: provide `RUSTC_HAS_DO_NOT_RECOMMEND` symbol
Message-ID: <20250502-unique-ref-v10-4-25de64c0307f@pm.me>
In-Reply-To: <20250502-unique-ref-v10-0-25de64c0307f@pm.me>
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 29275a13ff99657841e7389e7d241def33c76c99
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Miguel Ojeda <ojeda@kernel.org>

Rust 1.85.0 (current stable version) stabilized [1]
`#[diagnostic::do_not_recommend]` [2].

In order to use it across all supported Rust versions, introduce a new
Kconfig symbol for it.

This allows to perform conditional compilation based on it, e.g. on the
use site to enable the attribute:

    #[cfg_attr(RUSTC_HAS_DO_NOT_RECOMMEND, diagnostic::do_not_recommend)]
    impl A for i32 {}

An alternative would have been to `allow` the following warning:

    #![allow(unknown_or_malformed_diagnostic_attributes)]

However, that would lose the checking for typos across all versions,
which we do not want to lose.

One can also use the Kconfig symbol to allow the warning in older
compilers instead, to avoid repeating the `cfg_attr` line above in all
use sites:

    #![cfg_attr(
        not(RUSTC_HAS_DO_NOT_RECOMMEND),
        expect(unknown_or_malformed_diagnostic_attributes)
    )]

That still loses the checking for typos in older versions, but we still
keep it in newer ones, thus we should still catch mistakes eventually.

In this case we can promote it to `expect` as shown above, so that we do
not forget to remove these lines if we stop using the attribute somewhere.

Link: https://github.com/rust-lang/rust/pull/132056 [1]
Link: https://doc.rust-lang.org/reference/attributes/diagnostics.html#the-d=
iagnosticdo_not_recommend-attribute [2]
Link: https://lore.kernel.org/rust-for-linux/CANiq72mYfhuRWkjomb1vOMMPOaxvd=
S6qjfVLAwxUw6ecdqyh2A@mail.gmail.com/
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 init/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index dd2ea3b9a799205daa4c1f0c694a9027e344c690..556e274bba6c015cf482e22472e=
9c24d5a2a7ca5 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -140,6 +140,9 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
 config RUSTC_HAS_COERCE_POINTEE
 =09def_bool RUSTC_VERSION >=3D 108400
=20
+config RUSTC_HAS_DO_NOT_RECOMMEND
+=09def_bool RUSTC_VERSION >=3D 108500
+
 config PAHOLE_VERSION
 =09int
 =09default $(shell,$(srctree)/scripts/pahole-version.sh $(PAHOLE))

--=20
2.49.0


