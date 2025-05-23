Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF53295DBA;
	Fri, 23 May 2025 14:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748011916; cv=none; b=kkBH4pP/UHQ7W6qvYkyMc0+XD+QGUk3fysABiUtrwhyrvPG7Bm3OP7YqCTUEDzJIbBfPAriVI7/FEbPmq1gfJgp8W6z07R4P/7J7kxDKp/gfdJi7Vm6cgiUWK3J9Q5Fbep2ts8qpMlvfiN2nVaBllbmjQgDZHzt5JposKlbZAbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748011916; c=relaxed/simple;
	bh=flbhIFdpvk+11a/PVBLYuQaVdsfTyo5lYLKVPfZknus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pmalk9nsXILK4DMPRv42o17uzuRpDTmPM4AcLHklq9V9Gt4xzljZkCOb3ksJl/s+cjrUjpqDB1JmWPnyTFcZU5d99gKOx0MMSCjwxwix8cKAVf8KKsYHn+P6SvpQH+t7wy8wiI9VUK+Z1/WsbAA42TOOriZOyRiIZaTrrjGuPo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uRR0kNnQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uRR0kNnQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B59C4CEE9;
	Fri, 23 May 2025 14:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748011916;
	bh=flbhIFdpvk+11a/PVBLYuQaVdsfTyo5lYLKVPfZknus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uRR0kNnQkOFd9jBfCiiC3JAWdET8mJekNG32DhLkrApGElvTZYv3HEEQhRhbqpXiA
	 3GG1HqZvRNvwzj15prdLPcE+SatxcYz9l5l58d7NDfB6o2OZcY3DGQaBFXU/N8obZX
	 UI09uS7ZxnmZeNDEkI/Mn9JwindaZiYaSAXk2HM4iPPcuLzl5qNgoWpOlDWZp/6RhM
	 o2kGQ8rA7Fqg6phQk+TT0i/z+mVQV1h3+9g9ZHOzjs/5GwXy1sWnbW9xmOZiN8cgKA
	 xa3ECcfVvnu0L+idecOnC0vImdrzYjnlt/39RFdE7trAwWzw0awkekfn2ZaJgmzWjK
	 23OwSwKAD4lGA==
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
Subject: [PATCH v2 03/13] rust: pin-init: add `zeroed()` & `Zeroable::zeroed()` functions
Date: Fri, 23 May 2025 16:50:59 +0200
Message-ID: <20250523145125.523275-4-lossin@kernel.org>
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

`zeroed()` returns a zeroed out value of a sized type implementing
`Zeroable`.

The function is added as a free standing function, in addition to an
associated function on `Zeroable`, because then it can be marked `const`
(functions in traits can't be const at the moment).

Link: https://github.com/Rust-for-Linux/pin-init/pull/56/commits/809e4ec160579c1601dce5d78b432a5b6c8e4e40
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/pin-init/src/lib.rs | 52 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 436fa3bc0339..7535c3fcc961 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1482,6 +1482,33 @@ fn init_zeroed() -> impl Init<Self>
     {
         init_zeroed()
     }
+
+    /// Create a `Self` consisting of all zeroes.
+    ///
+    /// Whenever a type implements [`Zeroable`], this function should be preferred over
+    /// [`core::mem::zeroed()`] or using `MaybeUninit<T>::zeroed().assume_init()`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use pin_init::{Zeroable, zeroed};
+    ///
+    /// #[derive(Zeroable)]
+    /// struct Point {
+    ///     x: u32,
+    ///     y: u32,
+    /// }
+    ///
+    /// let point: Point = zeroed();
+    /// assert_eq!(point.x, 0);
+    /// assert_eq!(point.y, 0);
+    /// ```
+    fn zeroed() -> Self
+    where
+        Self: Sized,
+    {
+        zeroed()
+    }
 }
 
 /// Marker trait for types that allow `Option<Self>` to be set to all zeroes in order to write
@@ -1510,6 +1537,31 @@ pub fn init_zeroed<T: Zeroable>() -> impl Init<T> {
     }
 }
 
+/// Create a `T` consisting of all zeroes.
+///
+/// Whenever a type implements [`Zeroable`], this function should be preferred over
+/// [`core::mem::zeroed()`] or using `MaybeUninit<T>::zeroed().assume_init()`.
+///
+/// # Examples
+///
+/// ```
+/// use pin_init::{Zeroable, zeroed};
+///
+/// #[derive(Zeroable)]
+/// struct Point {
+///     x: u32,
+///     y: u32,
+/// }
+///
+/// let point: Point = zeroed();
+/// assert_eq!(point.x, 0);
+/// assert_eq!(point.y, 0);
+/// ```
+pub const fn zeroed<T: Zeroable>() -> T {
+    // SAFETY:By the type invariants of `Zeroable`, all zeroes is a valid bit pattern for `T`.
+    unsafe { core::mem::zeroed() }
+}
+
 macro_rules! impl_zeroable {
     ($($({$($generics:tt)*})? $t:ty, )*) => {
         // SAFETY: Safety comments written in the macro invocation.

base-commit: ae8b3a83fb9de394f609035041cd7a668fda2ab3
prerequisite-patch-id: https://lore.kernel.org/all/20250523125424.192843-2-lossin@kernel.org
prerequisite-patch-id: https://lore.kernel.org/all/20250523125424.192843-3-lossin@kernel.org
prerequisite-patch-id: https://lore.kernel.org/all/20250523125424.192843-4-lossin@kernel.org
-- 
2.49.0

