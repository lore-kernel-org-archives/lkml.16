Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180E823C517;
	Fri,  2 May 2025 09:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746176578; cv=none; b=fTN7FJbp11isN8zIqZS82UjEoQESOiFYqahS0J4QIINeSPhib1JoR1MKGCAXZEsZTkHXNQp6UNiwtUbi1OeDeG0VRUEFWx5xHK8lV90j+eHxUBHF7AMuCwxuvjSRIVND8QeMpX9Sl4oRwANUO4L8c0C9U/FRsNurcD1vwVoSl04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746176578; c=relaxed/simple;
	bh=Ar4lKIWcTiho0vArUzBhEcodfh10O5kWSMX5HswMJ1E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=igFUtdQJKFTK6O8umXoI/5fzju+/ztyjCLBYtZtKvEhBiwQcKlnvF6r91v1p4UuuM0xYIswocJD6f9bKgDYlMGUHtNeAetyRcQD6tBQVb2+3bs/wUEumrUUhOYyICzWipKHb54iPvUqMW0B5XUvoFrltp3BGc+ZEN/Kvyf5SINI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=NSYmm22R; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="NSYmm22R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1746176574; x=1746435774;
	bh=HrwkYic3s8vLfkP4y8Kt+4FOjgbkN5SBXJN+ruGJsJY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=NSYmm22Ry5eAQ4V6jbcV/Eg3z+cOGNfDQ95aNXap9TELJg89/NR8WSxJ1APq6AdUr
	 QHO2MPiU7R2IIF8FKuWv2hNIb4wpB39MObc9B/zwdgS8Le5HUYa9aeqbfcb8TQ0cIb
	 iULBnqaGYfzGTNHKJa9Rz+deGvzhvoR7nF5UI9U7qJlESkvGur3joqlSbOXRYFVLRZ
	 8PNY5mSARqrXWbcDxRWut6GMEVp6JRzrGk8IU0JhZICDVzAqRkCwVpFrRKWz5q68lr
	 PrWf3fGHLi2bfAmixdP/GZV5/2xScYdCd3hemTQlyUkqdhIPqpd8Jcpwm0DRE0tDu3
	 jX14+FfD70Tig==
Date: Fri, 02 May 2025 09:02:46 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina@asahilina.net>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver Mangold <oliver.mangold@pm.me>
Subject: [PATCH v10 3/5] rust: Add missing SAFETY documentation for ARef example
Message-ID: <20250502-unique-ref-v10-3-25de64c0307f@pm.me>
In-Reply-To: <20250502-unique-ref-v10-0-25de64c0307f@pm.me>
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 25864bd009001c377ac62f6823ff8eb924649b19
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
index d7fa8934c545f46a646ca900ab8957a04b0ad34d..33d2b4e4a87b991c6d934f4e8d2=
c6c71a15b1bcb 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -498,7 +498,9 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
     ///
     /// struct Empty {}
     ///
-    /// # // SAFETY: TODO.
+    /// // SAFETY: The `RefCounted` implementation for `Empty` does not co=
unt references
+    /// // and never frees the underlying object. Thus we can act as havin=
g a
+    /// // refcount on the object that we pass to the newly created `ARef`=
.
     /// unsafe impl RefCounted for Empty {
     ///     fn inc_ref(&self) {}
     ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
@@ -506,7 +508,7 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
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


