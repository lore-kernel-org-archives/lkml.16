Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch [79.135.106.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3653719AD8B;
	Sat, 21 Jun 2025 23:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750547008; cv=none; b=eeDXe5rgMatNoi6Tsn6q1ni/45T5QW08hvBt22Bz4fN7e4P5wbJoT0oK9JFS0FzejH4oayPY3AGG9DGbHBljdEfKN78U6erRqYJCfxRK887CjZnLWOfn/99N+rXsT7iInIX+Mel4/7nphLdG5kw6tsEhhW7gYdmr9/C/Eie6Y7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750547008; c=relaxed/simple;
	bh=beYFh2RKPFVYBrlqLYT6byHof9QsKZOvZ8o8uhVUR8Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RbbgeYT/pXuMPnL8D7YJyaDU2PLxYYOCWwizf5wziixIJtE5XNZlxgSIHo7gBODwx3cukxuIZSpckUhs8CmaDNWTzTPiCarZrpkhWNA6i8xgoxzvHJxPU5EDrbADQ8oMwSFvDrhzaHIbRdMYGHsi2PB6PHnnzpttRANPcfAPsHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=antoniohickey.com; arc=none smtp.client-ip=79.135.106.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antoniohickey.com
Date: Sat, 21 Jun 2025 23:03:13 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
From: Antonio Hickey <contact@antoniohickey.com>
Cc: Antonio Hickey <contact@antoniohickey.com>, Daniel Cote <danielstonecote@gmail.com>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: [PATCH v3 1/2] rust: kernel: create `overflow_assert!` macro
Message-ID: <20250621230231.100181-2-contact@antoniohickey.com>
In-Reply-To: <20250621230231.100181-1-contact@antoniohickey.com>
References: <20250621230231.100181-1-contact@antoniohickey.com>
Feedback-ID: 144211621:user:proton
X-Pm-Message-ID: e7fe154b63377d0ea2164a76455d8f7ed10c571f
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This commit creates a macro for overflow assertions. The use of this
macro will avoid local `#ifdef`s by encapsulating the conditional
behavior (like `#[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]`) to the macro.

In addition this macro allows us to document the intent of the assertion
more clearly.

Co-developed-by: Daniel Cote <danielstonecote@gmail.com>
Signed-off-by: Daniel Cote <danielstonecote@gmail.com>
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1159
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/lib.rs             |  1 +
 rust/kernel/overflow_assert.rs | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 rust/kernel/overflow_assert.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b4774b2b1c3..e395adb6b293 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -92,6 +92,7 @@
 pub mod of;
 #[cfg(CONFIG_PM_OPP)]
 pub mod opp;
+pub mod overflow_assert;
 pub mod page;
 #[cfg(CONFIG_PCI)]
 pub mod pci;
diff --git a/rust/kernel/overflow_assert.rs b/rust/kernel/overflow_assert.r=
s
new file mode 100644
index 000000000000..cc5f60611ba2
--- /dev/null
+++ b/rust/kernel/overflow_assert.rs
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Overflow assert.
+
+/// Verifies at runtime that an expression is within an expected bound.
+///
+/// This macro is only active when `CONFIG_RUST_OVERFLOW_CHECKS` is enable=
d.
+///
+/// # Examples
+///
+/// ```
+/// overflow_assert!(3 <=3D 10);
+/// overflow_assert!(5 <=3D 5);
+///
+/// const X: u8 =3D 5;
+/// overflow_assert!(X + 3 < 10);
+///
+/// const fn f(x: i32) -> i32 {
+///     x + 1
+/// }
+/// overflow_assert!(f(40) < 42);
+/// ```
+#[macro_export]
+macro_rules! overflow_assert {
+    ($cond:expr) =3D> {
+        if cfg!(CONFIG_RUST_OVERFLOW_CHECKS) {
+            ::core::assert!(
+                $cond,
+                concat!("overflow assertion failed: ", stringify!($cond))
+            );
+        }
+    };
+}
--=20
2.50.0


