Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D30296723;
	Fri, 23 May 2025 14:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748011929; cv=none; b=r6LaWnacv8oS6Dpwp4QdXLzT1ELubHLxiPxumR9vuYkWK69UYcb+/v8Nqx1BfAL+1S0jzA5v0lA/Km3svhGsfppJwem8aYYLuI+EdQrIan06TZNQSmIoBhSZqOuS+WFlautxCDJZCWDjYmfjRRNWCUSMoEHPbQLx8xfoRKL6LFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748011929; c=relaxed/simple;
	bh=h1EAbAQm5zTjrP/xtZUJqPFk4Y8UuAD+BbM2X3wU6Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tqfZV9NjRgFBRLu+jEj7H0VABdtEvsvetVdI55ZeV/ht4dzf4AOqLVzmo6oR5XME728wCrgImMELFVXG8cjyX97LS0Ztve0PGctbW0H+8z4ZgSXPFvMQOXtMj9F8K4+CUFaUfRne61X0EP6fHuJagTv6s0yHit4SrdVeDdwUNr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzfvwSRY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzfvwSRY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15BD7C4CEF2;
	Fri, 23 May 2025 14:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748011929;
	bh=h1EAbAQm5zTjrP/xtZUJqPFk4Y8UuAD+BbM2X3wU6Ds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KzfvwSRYx6H5wW/q9aoLQGbx/srZe9YGzBKKgeguDaZqG9BuLilaIniqj41jR63Gy
	 xxzCOAvfVTtUIvwNEPbpoJNg+1nOYlxrWURVYZvEWYb4KQdpuVW+8E7UsL+WBBnDcd
	 1C3e0OOqBvwKStLwAdJGNPDNIPxbql25mE22tYId/fdj5p6z0213s9KE8A2rhmGAh4
	 86wDoBTdhlKdapVXfD+YxNWvQHkrL+CdvrGmAlq/TwJwJsSMH/Lwdf0JFYj8FtB2u7
	 M2+4ZQ2G4EjvJrbcjpfpKIYsVe2ewxiESXFEeb6W28iPhJVnnkgwNHPxezN5Wk2JLU
	 n38NaxMsxDnWg==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Fiona Behrens <me@kloenk.dev>,
	Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/13] rust: pin-init: implement `ZeroableOption` for function pointers with up to 20 arguments
Date: Fri, 23 May 2025 16:51:02 +0200
Message-ID: <20250523145125.523275-7-lossin@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523145125.523275-1-lossin@kernel.org>
References: <20250523145125.523275-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`Option<[unsafe] [extern "abi"] fn(...args...) -> ret>` is documented
[1] to also have the `None` variant equal all zeroes.

Link: https://doc.rust-lang.org/stable/std/option/index.html#representation [1]
Link: https://github.com/Rust-for-Linux/pin-init/pull/56/commits/b6c1ab4fb3699765f81ae512ecac5a2f032d8d51
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/pin-init/src/lib.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index e46be80bd344..645633de0f6c 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1638,6 +1638,22 @@ unsafe impl<$first: Zeroable, $($t: Zeroable),*> Zeroable for ($first, $($t),*)
 
 impl_tuple_zeroable!(A, B, C, D, E, F, G, H, I, J);
 
+macro_rules! impl_fn_zeroable_option {
+    ([$($abi:literal),* $(,)?] $args:tt) => {
+        $(impl_fn_zeroable_option!({extern $abi} $args);)*
+        $(impl_fn_zeroable_option!({unsafe extern $abi} $args);)*
+    };
+    ({$($prefix:tt)*} {$(,)?}) => {};
+    ({$($prefix:tt)*} {$ret:ident, $($rest:ident),* $(,)?}) => {
+        // SAFETY: function pointers are part of the option layout optimization:
+        // <https://doc.rust-lang.org/stable/std/option/index.html#representation>.
+        unsafe impl<$ret, $($rest),*> ZeroableOption for $($prefix)* fn($($rest),*) -> $ret {}
+        impl_fn_zeroable_option!({$($prefix)*} {$($rest),*,});
+    };
+}
+
+impl_fn_zeroable_option!(["Rust", "C"] { A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U });
+
 /// This trait allows creating an instance of `Self` which contains exactly one
 /// [structurally pinned value](https://doc.rust-lang.org/std/pin/index.html#projections-and-structural-pinning).
 ///

base-commit: ae8b3a83fb9de394f609035041cd7a668fda2ab3
prerequisite-patch-id: https://lore.kernel.org/all/20250523125424.192843-2-lossin@kernel.org
prerequisite-patch-id: https://lore.kernel.org/all/20250523125424.192843-3-lossin@kernel.org
prerequisite-patch-id: https://lore.kernel.org/all/20250523125424.192843-4-lossin@kernel.org
-- 
2.49.0

