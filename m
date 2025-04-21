Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3DA224251;
	Mon, 21 Apr 2025 22:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745273929; cv=none; b=sVtV37colzFqNfdmS0QiW1tEy6YqMYdQcyWveiXza/58/XVPl1x3F3Seo+fbu/QM7rdbpaylmdPiUhQkmOZa2zvLH17DJNYyCd59yRbuVzfDYIDvHKvRj6ADqSypQbnvRJb2tYw+tdJaG899ioUInybY8bMca7RvXfKip4bSIbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745273929; c=relaxed/simple;
	bh=B9OmBplToGh1/2qzxlyKaJxqoY/Ah+8zPHR1Lm0CbV8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EYofsRVAT2xQzQXmdQznPaN5xmiMcjqx4K0wA3/jnGZ97uZKTnAwu/xXFUlDmA61XZPStiqZLnQ9oHbPVjNAc34nsFRomxCMJqKeNTVBHPNAJTDxfZkvY8wZa6SZwYGRiSd7NTskIXj6QimHafRj5dgccBQuwKMHEHXU/ahLg28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ekkkczar; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ekkkczar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745273926; x=1745533126;
	bh=7mODMizDoYBcqpfdZIoYY859tvhO4kodU/Zr4OTpKY4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ekkkczarAVThSL0opBMBWzXJtFNizYhkpjbnfHzuJRmRBXmnUDLxVdLAt0mQ/iQvF
	 6KRHo1Ja3QfST2SuM/w9TiDzcbxofnUVDC1+Tv9mOQTnLnkHPzhtm1JN58k7Wq9PWz
	 Oh6akISqPqIzPCz/8P30RUcnre3lzqAd/pbAwU1hHeY1pyFKZzX6la/d7397th8rF3
	 PC1BcK8/5ed42B0FZQS8WjmizEGkvQtivMNYaBDj50jJBcw1eZPkajTWp2DfGaGsby
	 vY2RCK3QsnuDAtKQPeuyoBx5Mj/1vTKV/zZPiY0UodKSHGqDSWSFucfeH8dp3crpfn
	 PUcrCp+OGEuYg==
Date: Mon, 21 Apr 2025 22:18:41 +0000
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, Alban Kurti <kurti@invicto.ai>, Michael Vetter <jubalh@iodoru.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] rust: pin-init: allow `Zeroable` derive macro to also be applied to unions
Message-ID: <20250421221728.528089-8-benno.lossin@proton.me>
In-Reply-To: <20250421221728.528089-1-benno.lossin@proton.me>
References: <20250421221728.528089-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: e4b53a7ee8ddf6e16b06229558b16600aa73a101
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Enabling the same behavior for unions as for structs is correct, but
could be relaxed: the valid bit patterns for unions are the union of all
valid bit patterns of their fields. So for a union to implement
`Zeroable`, only a single field needs to implement `Zeroable`. This can
be a future improvement, as it is currently only needed for unions where
all fields implement `Zeroable`.

There is no danger for mis-parsing with the two optional tokens (ie
neither one or both tokens are parsed), as the compiler will already
have rejected that before giving it as the input to the derive macro.

Link: https://github.com/Rust-for-Linux/pin-init/pull/42/commits/5927b497ce=
522d82f6c082d5ba9235df57bfdb32
Signed-off-by: Benno Lossin <benno.lossin@proton.me>
---
 rust/pin-init/src/macros.rs | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/rust/pin-init/src/macros.rs b/rust/pin-init/src/macros.rs
index e4054fe3ed3d..332d7e08925b 100644
--- a/rust/pin-init/src/macros.rs
+++ b/rust/pin-init/src/macros.rs
@@ -1412,4 +1412,34 @@ fn ensure_zeroable<$($impl_generics)*>()
             }
         };
     };
+    (parse_input:
+        @sig(
+            $(#[$($struct_attr:tt)*])*
+            $vis:vis union $name:ident
+            $(where $($whr:tt)*)?
+        ),
+        @impl_generics($($impl_generics:tt)*),
+        @ty_generics($($ty_generics:tt)*),
+        @body({
+            $(
+                $(#[$($field_attr:tt)*])*
+                $field_vis:vis $field:ident : $field_ty:ty
+            ),* $(,)?
+        }),
+    ) =3D> {
+        // SAFETY: Every field type implements `Zeroable` and padding byte=
s may be zero.
+        #[automatically_derived]
+        unsafe impl<$($impl_generics)*> $crate::Zeroable for $name<$($ty_g=
enerics)*>
+        where
+            $($($whr)*)?
+        {}
+        const _: () =3D {
+            fn assert_zeroable<T: ?::core::marker::Sized + $crate::Zeroabl=
e>() {}
+            fn ensure_zeroable<$($impl_generics)*>()
+                where $($($whr)*)?
+            {
+                $(assert_zeroable::<$field_ty>();)*
+            }
+        };
+    };
 }
--=20
2.48.1


