Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2553A224B14
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745273920; cv=none; b=mXU0teVn2xCZgJqsSLRaMo1W59Y6TdgTWra0gM2buXBq7wgoEdAjpl1QGal4HPwgIIOJ9ePqyWHWlax5LNlHAXiU1k6uoteBxqBQ6xPAmm7VRXjsf4FoWT32JBijd32Q/FmL1JLItBjU1vZ5w3sleBWgXdImAfMj9r55KJ5yHm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745273920; c=relaxed/simple;
	bh=AnLdPTvgp2orHhK7rWJUN9hxRduqvn5Rqu4Oa2c5Wus=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UiyOAynqY71rVpiE8l84Cl0idNGg24y0EV+hQNrqpLEwDa0e4U1K2Gfc8jLzKnqQrVQZ5k+FdXTHdacTSCI042fGKQy9aD/SAu5R7Ipz/dsbYDSTbZW0dij0w5ugjhX9B2GHmF6CX2MAfarFDWGgLQpxuVf2IeZzmX16PQRJZHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=bq2Gg3EU; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="bq2Gg3EU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745273916; x=1745533116;
	bh=mueWKD1P2UKooNTZqBTBY3yKdZp1/00n7RyzSvrxqEk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=bq2Gg3EU7BkK+GdJt+11TYNRhtuTYAxQsGrPlSKzxQUYIA1T2skAM5qfxNdCOEpvo
	 kNfZevvNZg7zgY/HEH6PrWkmOa/LP0ZYUr3euKM7qPOb8ZTrSTeic51JLE1IYt5/ry
	 8AfLweSFtK7iPI5KFmMXZtB1J5OsCtODJFtoqY/kT4fDj8rJmL76YxQLSZ39j0RzVK
	 l7vedbO/UbcaVVnAwvzNY6v2JuLBsmhxDz0DxlH+iMBJ8mbTMBB+x2HkZWjNzFUKPJ
	 1ov31FU6mYc1Q0AdJKV1y0VfROiDAtXkh7SyyG4r8JQCLxlPXmIck+OAzoqM+GDQ2v
	 6qAVY6waM1xZg==
Date: Mon, 21 Apr 2025 22:18:33 +0000
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, Alban Kurti <kurti@invicto.ai>, Michael Vetter <jubalh@iodoru.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] rust: pin-init: allow `pub` fields in `derive(Zeroable)`
Message-ID: <20250421221728.528089-7-benno.lossin@proton.me>
In-Reply-To: <20250421221728.528089-1-benno.lossin@proton.me>
References: <20250421221728.528089-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: bdb47e7f214ab31586c066848632a8e3facb5073
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add support for parsing `pub`, `pub(crate)` and `pub(super)` to the
derive macro `Zeroable`.

Link: https://github.com/Rust-for-Linux/pin-init/pull/42/commits/e8311e52ca=
57273e7ed6d099144384971677a0ba
Signed-off-by: Benno Lossin <benno.lossin@proton.me>
---
 rust/pin-init/src/macros.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/pin-init/src/macros.rs b/rust/pin-init/src/macros.rs
index 361623324d5c..e4054fe3ed3d 100644
--- a/rust/pin-init/src/macros.rs
+++ b/rust/pin-init/src/macros.rs
@@ -1393,7 +1393,7 @@ macro_rules! __derive_zeroable {
         @body({
             $(
                 $(#[$($field_attr:tt)*])*
-                $field:ident : $field_ty:ty
+                $field_vis:vis $field:ident : $field_ty:ty
             ),* $(,)?
         }),
     ) =3D> {
--=20
2.48.1


