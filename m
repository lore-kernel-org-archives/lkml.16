Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D101D19049B;
	Mon, 23 Jun 2025 20:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750709899; cv=pass; b=PQKm2kU1EH1D/Ffr5uah7N9y0Ebrew7UJmP/+q+bPCijayxfnwQTw3Acq8yn0zfabwt1ixHRX5J0fx8oUiVUqg7kbziy2HNvw4Habc8ln5Xy1wxG6iOVOx9waRsF8jkxWCRbwvSpXSSs33iiRl6z/fEFTqU1E6h6Y34HvKjmyJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750709899; c=relaxed/simple;
	bh=3hlJLa0kfG7gE+lr+wJ30LnboKlt5YahPW/GPKq7lfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dQIU3MCX1Kpb4iVqKccth2oss9v4mMRNW/Xb9hEEVx30u/V2XtZsC1znr2DrP87FUxXXSPlRBjPTEh/ZWJDoRgZ5X5FQaznuIrrdGHs8BFKXXvTXB2aS/0fODSwfqMdS6NldfIplddo2Ou5G4ssXir1UrU9TiNCOrHjzcKb2FPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=OZWsOFn9; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="OZWsOFn9"
ARC-Seal: i=1; a=rsa-sha256; t=1750709878; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DSVi3hHf9UD3xgyX2a5yQv9eb3p6iFnk5dD2T1VvOM9dtWVlBbAKNUtZqzUgpjlm1GMqkGlEKC+nSvYd3SGMc1H4dz8O3npST08GPQpvWjtwpzWcNJbXLzncvLeL3cEjK6VLyyQi9X2vOH2N3OTEMoAn0G1qGiZVsV5kaiHTDZU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750709878; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WqLTbHpOLfN/8P0kYn2TCUukVUVe+wOiSE7+iFMQKxM=; 
	b=CtyiyMdibD7cXVHC0ZC1HAYt3K7GEiDutkJfv762tlkn4Yp+ZBPgcffhvZH2FstQwJI69JH2L1WGGBU5fZ+LDwKusdD3WWzS8FPmyWzP04h5my8GASyrVPJD7n0T5AhX0O6FvBhs9J/r3Lm+kKmqZWb0ozKryKK/PWJmEb3GznM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750709878;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=WqLTbHpOLfN/8P0kYn2TCUukVUVe+wOiSE7+iFMQKxM=;
	b=OZWsOFn9iGTptTo0K3O8TaWjhYB0gumrKf7yJTj0fkiljv31kkkJLqyNkYRrWJqX
	hxDlv8KZKA0SHkWmdJSth4+uTXViMTgA5imq/5kXgKNl4ScZOK/lfb3R+P1RAaI2hpD
	L5CnwyitdabD4lDSPdYMHWLIuuam5vmiGanYUsFo=
Received: by mx.zohomail.com with SMTPS id 1750709876006799.3496765035169;
	Mon, 23 Jun 2025 13:17:56 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Mon, 23 Jun 2025 17:17:33 -0300
Subject: [PATCH v7] rust: kernel: add support for bits/genmask macros
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-topic-panthor-rs-genmask-v7-1-9f986951e7b5@collabora.com>
X-B4-Tracking: v=1; b=H4sIAFy2WWgC/33PTWrDMBAF4KsEraui0Z/drnqPksVoLMWiiWUkY
 xqC7145EFKK6+UbmO/xbqz4HH1h74cby36OJaahhublwKjH4eR57GpmUkgNQio+pTESH3GY+pR
 5LvzkhwuWLx7QkWlU8EErVt/H7EP8vtOfx5r7WKaUr/emWa7XB6r/R2fJgbdGqoYgCPL4Qel8R
 pcyvlK6sBWe1QMzAiTsYKpihpTrggTywmxh+okpaHcwXTFlhNCB0CJtYuYXJu0OZirmAlrQQoL
 uNmfaJ2ZB7GB2nSkCAr614Aj+Ysuy/ABNsT61+AEAAA==
X-Change-ID: 20241023-topic-panthor-rs-genmask-fabc573fef43
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>
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
Changes in v7:
- Rebase on top of latest rust-next
- Use RangeInclusive
- Fix formatting
- Fix checks of start/end to account for RangeInclusive
- Use the paste macro to simplify the implementation
- Get rid of the _unbounded versions (they were not const fns anyway, so
  users can just write it themselves)
- Change the examples to account for RangeInclusive
- Link to v6: https://lore.kernel.org/r/20250610-topic-panthor-rs-genmask-v6-1-50fa1a981bc1@collabora.com

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
 rust/kernel/bits.rs | 133 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs  |   1 +
 2 files changed, 134 insertions(+)

diff --git a/rust/kernel/bits.rs b/rust/kernel/bits.rs
new file mode 100644
index 0000000000000000000000000000000000000000..8db122b5db9565b76c14fc33e33058f9dac7bd75
--- /dev/null
+++ b/rust/kernel/bits.rs
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Bit manipulation macros.
+//!
+//! C header: [`include/linux/bits.h`](srctree/include/linux/bits.h)
+
+use crate::prelude::*;
+use core::ops::RangeInclusive;
+use macros::paste;
+
+macro_rules! impl_bit_fn {
+    (
+        $ty:ty
+    ) => {
+        paste! {
+            /// Computes `1 << n` if `n` is in bounds, i.e.: if `n` is smaller than
+            /// the maximum number of bits supported by the type.
+            ///
+            /// Returns [`None`] otherwise.
+            #[inline]
+            pub fn [<checked_bit_ $ty>](n: u32) -> Option<$ty> {
+                (1 as $ty).checked_shl(n)
+            }
+
+            /// Computes `1 << n` by performing a compile-time assertion that `n` is
+            /// in bounds.
+            ///
+            /// This version is the default and should be used if `n` is known at
+            /// compile time.
+            #[inline]
+            pub const fn [<bit_ $ty>](n: u32) -> $ty {
+                build_assert!(n < <$ty>::BITS);
+                (1 as $ty) << n
+            }
+        }
+    };
+}
+
+impl_bit_fn!(u64);
+impl_bit_fn!(u32);
+impl_bit_fn!(u16);
+impl_bit_fn!(u8);
+
+macro_rules! impl_genmask_fn {
+    (
+        $ty:ty,
+        $(#[$genmask_ex:meta])*
+    ) => {
+        paste! {
+            /// Creates a compile-time contiguous bitmask for the given range by
+            /// validating the range at runtime.
+            ///
+            /// Returns [`None`] if the range is invalid, i.e.: if the start is
+            /// greater than or equal to the end.
+            #[inline]
+            pub fn [<genmask_checked_ $ty>](range: RangeInclusive<u32>) -> Option<$ty> {
+                let start = *range.start();
+                let end = *range.end();
+
+                if start >= end || end >= <$ty>::BITS {
+                    return None;
+                }
+
+                let high = [<checked_bit_ $ty>](end)?;
+                let low = [<checked_bit_ $ty>](start)?;
+                Some((high | (high - 1)) & !(low - 1))
+            }
+
+            /// Creates a compile-time contiguous bitmask for the given range by
+            /// performing a compile-time assertion that the range is valid.
+            ///
+            /// This version is the default and should be used if the range is known
+            /// at compile time.
+            $(#[$genmask_ex])*
+            #[inline]
+            pub const fn [<genmask_ $ty>](range: RangeInclusive<u32>) -> $ty {
+                let start = *range.start();
+                let end = *range.end();
+
+                build_assert!(start < end);
+                build_assert!(end < <$ty>::BITS);
+
+                let high = [<bit_ $ty>](end);
+                let low = [<bit_ $ty>](start);
+                (high | (high - 1)) & !(low - 1)
+            }
+        }
+    };
+}
+
+impl_genmask_fn!(
+    u64,
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::bits::genmask_u64;
+    /// let mask = genmask_u64(21..=39);
+    /// assert_eq!(mask, 0x000000ffffe00000);
+    /// ```
+);
+
+impl_genmask_fn!(
+    u32,
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::bits::genmask_u32;
+    /// let mask = genmask_u32(0..=9);
+    /// assert_eq!(mask, 0x000003ff);
+    /// ```
+);
+
+impl_genmask_fn!(
+    u16,
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::bits::genmask_u16;
+    /// let mask = genmask_u16(0..=9);
+    /// assert_eq!(mask, 0x000003ff);
+    /// ```
+);
+
+impl_genmask_fn!(
+    u8,
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::bits::genmask_u8;
+    /// let mask = genmask_u8(0..=7);
+    /// assert_eq!(mask, 0x000000ff);
+    /// ```
+);
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b4774b2b1c37f4da1866e993be6230bc6715841..1bb294de8cb000120a0d04f61d6f7262fbc9f600 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -54,6 +54,7 @@
 pub mod alloc;
 #[cfg(CONFIG_AUXILIARY_BUS)]
 pub mod auxiliary;
+pub mod bits;
 #[cfg(CONFIG_BLOCK)]
 pub mod block;
 #[doc(hidden)]

---
base-commit: dc35ddcf97e99b18559d0855071030e664aae44d
change-id: 20241023-topic-panthor-rs-genmask-fabc573fef43

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

