Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B03F2EA495
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249691; cv=none; b=cZWwG97CCTUtDadzxC0Cr5HCXv8mdIg6vw+DmJMwl7p4m3lj6x8wNEwunPgfsiNLVTm2YIALtz2Nyicpubq/B+VXwJs2l4PG3NsOCh75ds862lsaLwfKXeNW1VuyCtEJSf2kMv9a7nLSPvQgyfu/V6av2q6Sh56AZEtYW64L0KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249691; c=relaxed/simple;
	bh=PoENILfftPuKovdbTf1s6VqO1XZgvziz6Eq/RLvuL6k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R6RU8Y/zM39nL8+CSD7JR1FjTkmDR0X71uSmTgHGMeGaeiOftOPVUYF7O9Kmc0bFUjNAukxVo4l+jqTpvPREHnudyJl4S70zUutvmetkazG7PQzST2zgLP4JiJBD+iahN7joidvf+4wW8OcpgDmUY5ivBo1vuibVKpmIytAqWsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=fhZ82mRS; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="fhZ82mRS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1750249681; x=1750508881;
	bh=EUK7UbppZKvXdNuoTpuczW050PGsMvbPwEvZ2b3BRjk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=fhZ82mRSd0oyCtUsVTOgSZhMvQeq+nIMXSzcveD49s4eJMvA808h3cWDcxL0Y93GY
	 TwIxqJEHRGy0t/XFKFnKHuYH4gN3UudgNz+esiVppzqkAC/em04TCCreEPIt/BnN17
	 IHr5YViO29ZAkT41vrJ1r8Xpqq5ldYgwA4xg0FxaGzC8d/zqCAJtAtDpBwGu429SOq
	 FigUMNpbeYVu1taByq9dagT3R+jjq0kFHbzape2Z0vujRytKBYG+Vkh2lWGHq8V3w/
	 xCzVdAjnDvLjUoi8Z6d4ZtPKi7f8TtnmqNTBqRUwvslMFxq3lr1FqsY14rtuwA6Rn5
	 KkBYFtkzddG0g==
Date: Wed, 18 Jun 2025 12:27:55 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, Asahi Lina <lina+kernel@asahilina.net>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver Mangold <oliver.mangold@pm.me>
Subject: [PATCH v11 3/4] rust: Add missing SAFETY documentation for `ARef` example
Message-ID: <20250618-unique-ref-v11-3-49eadcdc0aa6@pm.me>
In-Reply-To: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me>
References: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 76c778666a390c4fcd86d43530e3c2afc02800ae
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

SAFETY comment in rustdoc example was just 'TODO'. Fixed.

Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
---
 rust/kernel/types.rs | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 40c0138bd336057e7d3a835a9e81391baa2fd2b1..a22d5d39d89edfe357fdfe903ef=
42e5d5404237f 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -526,7 +526,9 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
     ///
     /// struct Empty {}
     ///
-    /// # // SAFETY: TODO.
+    /// // SAFETY: The `RefCounted` implementation for `Empty` does not co=
unt references and
+    /// // never frees the underlying object. Thus we can act as having a =
refcount on the object
+    /// // that we pass to the newly created `ARef`.
     /// unsafe impl RefCounted for Empty {
     ///     fn inc_ref(&self) {}
     ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
@@ -534,7 +536,7 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
     ///
     /// let mut data =3D Empty {};
     /// let ptr =3D NonNull::<Empty>::new(&mut data).unwrap();
-    /// # // SAFETY: TODO.
+    /// // SAFETY: We keep `data` around longer than the `ARef`.
     /// let data_ref: ARef<Empty> =3D unsafe { ARef::from_raw(ptr) };
     /// let raw_ptr: NonNull<Empty> =3D ARef::into_raw(data_ref);
     ///

--=20
2.49.0


