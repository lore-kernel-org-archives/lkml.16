Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81DF2248BD;
	Tue, 10 Jun 2025 14:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749565012; cv=pass; b=Jw6vluDaNQ/Q4oGjpRUw2YLrGtrHyrjDoITFKfoJFOXlvwGBbQq0MCXCqw0+VJtvE6ZuJkbfy9AWWTXH7RNAgW9TTDmZ0QWqHPh673n223mBtezkO8+JlJ0cLy+WXfOSharUTgZlFSO6mnA6jBZ0Bx3/dMuxNw6kH+MbRRNxN/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749565012; c=relaxed/simple;
	bh=oIAuEVXSh5sHnZgOLFO27YDdqoi+J8kGbOASj4ziSGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SWCrBkL6JqmnAg1i2OpsBvT2EbKHCNqK23c8m8QSYo41p1vez3rIVsiUju7vSnS144wkSVrZA+WThkBus5ZAS3DR+2kT96ivDE0OJGMMbVDqk7JvJWR/TGd8ym/1UyOsO/aGY8hVZPJvhriaU/PnRt1VS4JyryfKPivWbjHkTIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=JWgXkRN5; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="JWgXkRN5"
ARC-Seal: i=1; a=rsa-sha256; t=1749564983; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WErU6gX2IcXfG5LegThrZkkBshzXM1QNuI172c3k+s/gK2Yw3RHjfE3dmpX2u9ztEak8MxiYeZRPIc7NXayz9GTVmkUu4hIdDgxkbDLkUZpdv5brGUinrVNeF0TXxj3LWWkAzHHQAY5NK8Vq6FmaZHwU11ksl+xqR+Q8uGpYjhQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749564983; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uu0WvazvC9zmXueCdI/DDh2csyOG+Bw8bXmZ27Y5b50=; 
	b=HpKl7/pG8XS4V7i6OuwKpbo5j3J0ApwV/iALjxH8e5EmGSwNksrb3qLMhKl/oqMq5SgxWKD91MqrAFLmKrXWkfWpKhsEYzdEGciOyCFqp78h60ah276SgeOkE8uBcesTcN4Pysvl+E2HqNb2JKpxpXicLbBydbAZGmAYBpklBGU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749564983;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=uu0WvazvC9zmXueCdI/DDh2csyOG+Bw8bXmZ27Y5b50=;
	b=JWgXkRN53wuk0U8j5+JNIj0sSb1CwYsG3O7RdeStz2Us8EC+nr3kHSniQFC+kk4A
	GS4trIoSGK7EmjgRrFD6x9OgpuC3gojF2jnh+QzjPlGPlPRJ6LbMBynNeU7tJg8oYWR
	Eto/VWkJi2PwVesh564wrbzl/Vf9XNlCydyjap8U=
Received: by mx.zohomail.com with SMTPS id 1749564980750689.7865356526389;
	Tue, 10 Jun 2025 07:16:20 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Tue, 10 Jun 2025 11:14:55 -0300
Subject: [PATCH v6] rust: kernel: add support for bits/genmask macros
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-topic-panthor-rs-genmask-v6-1-50fa1a981bc1@collabora.com>
X-B4-Tracking: v=1; b=H4sIAN49SGgC/33PwWrDMAyA4VcpPs/Dku207LT3GD0oityYtXGwQ
 +goefe5hbJCuxx/gT6hiyqSoxT1sbmoLHMsMQ01mreN4p6Gg+jY1VZo0IFBq6c0RtYjDVOfss5
 FH2Q4UfnWgVr2WxskOKvq+pglxPON/trX7mOZUv65XZrxOr2j7n90Rg1659FuGYJhoU9OxyO1K
 dM7p5O6wrO9Y94AwgpmK+bZtl1AYDH+Feb+MAu7FcxVzHpjXGBqiF9i/gHDZgXzFWsDNeAMguu
 e3lyW5RfIryEcqwEAAA==
X-Change-ID: 20241023-topic-panthor-rs-genmask-fabc573fef43
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External

In light of bindgen being unable to generate bindings for macros, and
owing to the widespread use of these macros in drivers, manually define
the bit and genmask C macros in Rust.

The *_checked version of the functions provide runtime checking while
the const version performs compile-time assertions on the arguments via
the build_assert!() macro.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
Changes in v6:
Thanks, Alex {
  - Added _checked and _unbounded versions of the functions
  - Implemented the functions through a macro
  - Changed the genmask logic to prevent over/underflow (hopefully)
  - Genmask now takes a range instead of "h" and "l" arguments
  - Made all functions #[inline]
  - +cc Alex directly
  - Removed all panics
}
- Link to v5: https://lore.kernel.org/r/20250326-topic-panthor-rs-genmask-v5-1-bfa6140214da@collabora.com

Changes in v5:
- Added versions for u16 and u8 in order to reduce the amount of casts
  for callers. This came up after discussing the issue with Alexandre
  Courbot in light of his "register" abstractions.
- Link to v4: https://lore.kernel.org/r/20250318-topic-panthor-rs-genmask-v4-1-35004fca6ac5@collabora.com

Changes in v4:
- Split bits into bits_u32 and bits_u64
- Added r-b's
- Rebased on top of rust-next
- Link to v3: https://lore.kernel.org/r/20250121-topic-panthor-rs-genmask-v3-1-5c3bdf21ce05@collabora.com

Changes in v3:
- Changed from declarative macro to const fn
- Added separate versions for u32 and u64
- Link to v2: https://lore.kernel.org/r/20241024-topic-panthor-rs-genmask-v2-1-85237c1f0cea@collabora.com

Changes in v2:

- Added ticks around `BIT`, and `h >=l` (Thanks, Benno).
- Decided to keep the arguments as `expr`, as I see no issues with that
- Added a proper example, with an assert_eq!() (Thanks, Benno)
- Fixed the condition h <= l, which should be h >= l.
- Checked that the assert for the condition above is described in the
  docs.
---
 rust/kernel/bits.rs | 168 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs  |   1 +
 2 files changed, 169 insertions(+)

diff --git a/rust/kernel/bits.rs b/rust/kernel/bits.rs
new file mode 100644
index 0000000000000000000000000000000000000000..98065c8f7c94cfc3b076e041de190e942e1b4a9f
--- /dev/null
+++ b/rust/kernel/bits.rs
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Bit manipulation macros.
+//!
+//! C header: [`include/linux/bits.h`](srctree/include/linux/bits.h)
+
+use crate::build_assert;
+use core::ops::Range;
+
+macro_rules! impl_bit_fn {
+    (
+        $checked_name:ident, $unbounded_name:ident, $const_name:ident, $ty:ty
+    ) => {
+        /// Computes `1 << n` if `n` is in bounds, i.e.: if `n` is smaller than
+        /// the maximum number of bits supported by the type.
+        ///
+        /// Returns [`None`] otherwise.
+        #[inline]
+        pub fn $checked_name(n: u32) -> Option<$ty> {
+            (1 as $ty) .checked_shl(n)
+        }
+
+        /// Computes `1 << n` if `n` is in bounds, i.e.: if `n` is smaller than
+        /// the maximum number of bits supported by the type.
+        ///
+        /// Returns `0` otherwise.
+        ///
+        /// This is a convenience, as [`Option::unwrap_or`] cannot be used in
+        /// const-context.
+        #[inline]
+        pub fn $unbounded_name(n: u32) -> $ty {
+            match $checked_name(n) {
+                Some(v) => v,
+                None => 0,
+            }
+        }
+
+        /// Computes `1 << n` by performing a compile-time assertion that `n` is
+        /// in bounds.
+        ///
+        /// This version is the default and should be used if `n` is known at
+        /// compile time.
+        #[inline]
+        pub const fn $const_name(n: u32) -> $ty {
+            build_assert!(n < <$ty>::BITS);
+            1 as $ty << n
+        }
+    };
+}
+
+impl_bit_fn!(checked_bit_u64, unbounded_bit_u64, bit_u64, u64);
+impl_bit_fn!(checked_bit_u32, unbounded_bit_u32, bit_u32, u32);
+impl_bit_fn!(checked_bit_u16, unbounded_bit_u16, bit_u16, u16);
+impl_bit_fn!(checked_bit_u8, unbounded_bit_u8, bit_u8, u8);
+
+macro_rules! impl_genmask_fn {
+    (
+        $ty:ty, $checked_bit:ident, $bit:ident, $genmask:ident, $genmask_checked:ident, $genmask_unbounded:ident,
+        $(#[$genmask_ex:meta])*
+    ) => {
+        /// Creates a compile-time contiguous bitmask for the given range by
+        /// validating the range at runtime.
+        ///
+        /// Returns [`None`] if the range is invalid, i.e.: if the start is
+        /// greater than or equal to the end.
+        #[inline]
+        pub fn $genmask_checked(range: Range<u32>) -> Option<$ty> {
+            if range.start >= range.end || range.end > <$ty>::BITS {
+                return None;
+            }
+            let high = $checked_bit(range.end)?;
+            let low = $checked_bit(range.start)?;
+            Some((high | (high - 1)) & !(low - 1))
+        }
+
+        /// Creates a compile-time contiguous bitmask for the given range by
+        /// validating the range at runtime.
+        ///
+        /// Returns `0` if the range is invalid, i.e.: if the start is greater
+        /// than or equal to the end.
+        #[inline]
+        pub fn $genmask_unbounded(range: Range<u32>) -> $ty {
+            match $genmask_checked(range) {
+                Some(v) => v,
+                None => 0,
+            }
+        }
+
+        /// Creates a compile-time contiguous bitmask for the given range by
+        /// performing a compile-time assertion that the range is valid.
+        ///
+        /// This version is the default and should be used if the range is known
+        /// at compile time.
+        $(#[$genmask_ex])*
+        #[inline]
+        pub const fn $genmask(range: Range<u32>) -> $ty {
+            build_assert!(range.start < range.end);
+            build_assert!(range.end <= <$ty>::BITS);
+            let high = $bit(range.end);
+            let low = $bit(range.start);
+            (high | (high - 1)) & !(low - 1)
+        }
+    };
+}
+
+impl_genmask_fn!(
+    u64,
+    checked_bit_u64,
+    bit_u64,
+    genmask_u64,
+    genmask_checked_u64,
+    genmask_unbounded_u64,
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::bits::genmask_u64;
+    /// let mask = genmask_u64(21..39);
+    /// assert_eq!(mask, 0x000000ffffe00000);
+    /// ```
+);
+
+impl_genmask_fn!(
+    u32,
+    checked_bit_u32,
+    bit_u32,
+    genmask_u32,
+    genmask_checked_u32,
+    genmask_unbounded_u32,
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::bits::genmask_u32;
+    /// let mask = genmask_u32(0..9);
+    /// assert_eq!(mask, 0x000003ff);
+    /// ```
+);
+
+impl_genmask_fn!(
+    u16,
+    checked_bit_u16,
+    bit_u16,
+    genmask_u16,
+    genmask_checked_u16,
+    genmask_unbounded_u16,
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::bits::genmask_u16;
+    /// let mask = genmask_u16(0..9);
+    /// assert_eq!(mask, 0x000003ff);
+    /// ```
+);
+
+impl_genmask_fn!(
+    u8,
+    checked_bit_u8,
+    bit_u8,
+    genmask_u8,
+    genmask_checked_u8,
+    genmask_unbounded_u8,
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::bits::genmask_u8;
+    /// let mask = genmask_u8(0..7);
+    /// assert_eq!(mask, 0x000000ff);
+    /// ```
+);
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index c92497c7c655e8faefd85bb4a1d5b4cc696b8499..a90aaf7fe6755a5a42055b7b4008714fcafe6f6f 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -36,6 +36,7 @@
 pub use ffi;
 
 pub mod alloc;
+pub mod bits;
 #[cfg(CONFIG_BLOCK)]
 pub mod block;
 #[doc(hidden)]

---
base-commit: cf25bc61f8aecad9b0c45fe32697e35ea4b13378
change-id: 20241023-topic-panthor-rs-genmask-fabc573fef43

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

