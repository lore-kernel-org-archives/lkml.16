Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACAD126BF7
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 02:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751165029; cv=none; b=qvju4PkPN2Fe6r6W2aqTwBga4+YVdipL4LCV8D5DV7M2pfVEiWFyRCAnXjJa7SaI5XCoNv4wG60Fb7BBXWt4so/6fIKBZxuQf44eakke1FpGclciCVeWJtwPE5zpqJd01q1WwJZaoRzrj1AMBtPWc7foPZttkV333Ynrv6p0PS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751165029; c=relaxed/simple;
	bh=y9+c4Dydyj6PSIakrqHsunCMh3Pe/1E1ohIDOLO/elg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kD8OhHco/VNWTLWe1LbNGgEEL70KTk5TbNAead7RshqMgQux7RBriT9hH40MZqsDsJo8sDne0Um9y46r5BabAsEWZZOHxjJQYHOqfYIAQmdSnYmnOCeOHK3G34239+EhJ99g+epp9K1T45Xrom4GzhWVBDpQLyOzUmMDfnfksJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=antoniohickey.com; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antoniohickey.com
Date: Sun, 29 Jun 2025 02:43:35 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
From: Antonio Hickey <contact@antoniohickey.com>
Cc: Antonio Hickey <contact@antoniohickey.com>, Daniel Cote <danielstonecote@gmail.com>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: [PATCH v4 1/2] rust: kernel: create `overflow_assert!` macro
Message-ID: <20250629024310.97937-2-contact@antoniohickey.com>
In-Reply-To: <20250629024310.97937-1-contact@antoniohickey.com>
References: <20250629024310.97937-1-contact@antoniohickey.com>
Feedback-ID: 144211621:user:proton
X-Pm-Message-ID: 1b08d8d0d2e5fdb75cb7717514dba7dfe7085357
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This commit creates a macro for overflow assertions, the use of this
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
 rust/kernel/overflow_assert.rs | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)
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
index 000000000000..5164339813cb
--- /dev/null
+++ b/rust/kernel/overflow_assert.rs
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Overflow assertion.
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
+/// const MAX: i32 =3D 42;
+/// const fn f(x: i32) -> i32 {
+///     x + 1
+/// }
+/// overflow_assert!(f(40) < MAX);
+/// overflow_assert!(f(40) < MAX, "f(x) must not overflow the max value.")=
;
+/// ```
+#[macro_export]
+macro_rules! overflow_assert {
+    ($cond:expr $(,$arg:literal)?) =3D> {
+        if cfg!(CONFIG_RUST_OVERFLOW_CHECKS) {
+            ::core::assert!($cond $(,$arg)?);
+        }
+    };
+}
--=20
2.50.0


