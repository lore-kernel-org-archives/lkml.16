Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5A2208A9;
	Fri, 11 Apr 2025 12:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373171; cv=none; b=MLC1VZGlJhLJHWAT9RA4JJX2iZZArKZsEINLezrPq+x1D8QXiI0ESBQjkZSuutKn/+5PaoeE0EbQ+7ynjvr2DUOGX8yJMu9cSMkGwPiYhsMcppds7QAANk3lRXFnIjiX+hl6yzMQF0TultSj4BRR8NQhzpDiOrKjyVFtWrXugX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373171; c=relaxed/simple;
	bh=AIXABDllIelhOsY1BKFmLuSOXhZ4hK/N6InVrQSsN5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tqkJQLEWf9zf0IET5AK9ho69/t9d+hoUz2CRiZA8WE+6+xiICNzgZiGt1litXpT1ijru4pN/bHPvncI7rGXvwgSEpBQihuB6XvnOgiZc+5g+2kp2xINxdqUxiRP4y/Fq4PTXfNozQlCMIHvZV0RKReRwCt7ag8oaujFCxeWyYNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kohwZS/j; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kohwZS/j"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-301c4850194so1506883a91.2;
        Fri, 11 Apr 2025 05:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744373168; x=1744977968; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WyKAP6DEXcekkjlEcgRNMfVdpQ80rYUvb1CCgwJK8SU=;
        b=kohwZS/jIiBLwGYQQme8uc9AX+QDlYcIf1tqFx26Ejjv1Otrh1zp6skW7YZtK1xGSy
         SaqV647djEkbKwdSqDaI6qdwHIaZEA9lHsLmPT3X+ZNZQrwB4gDOJ5g3AsABM0z0m7x/
         6ngEATjWAyhn+Tg5pCo8ceq1dUvSG1E7flLS2lfGIp1kltzPdypC5YejPwUpLvjgRpHv
         MciaA2rL/tFZkGBoBgg/1ffFamiS6XCz8LfC7YBXrVInAz4ru5+XU9YQRM1DTS79M8vO
         NKtNM7GfxHmoWqDVhHUG02KPt/C3yLneMwzcBuURO/FaMCUvMo6Ouajm2hyXV7XWRVof
         +U1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744373168; x=1744977968;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WyKAP6DEXcekkjlEcgRNMfVdpQ80rYUvb1CCgwJK8SU=;
        b=sCpV4GR6LdSACOYE7TWD2T3QZGZ5h6/aB7tu264bg7xxjCkjKY/r76Jn8krZIKhfwe
         0ATEH+2MgKPQ4JtNUFf86bJ3F+9w5OLz3g1sgU421ZfH6NPr6xMbE661+ov0IW9sya1x
         Cui+tqJ5fsdS3/oFHmaCb20Tn9SkNcKTRm1ArvvAttvLoO8ropeORGUgKwgOU62qKtKM
         zKcwRo3M9zHZ1Ika/j5oM/4fV4GgY1kYFj3aIoO9r1TFA/v4oMRCEuWvVp5lqAz+H676
         cXLOwfmIUZ7Nf8YGsnaC/CDdicFXhb/ij4AS/blWDv1XZeTblP2Bv2Cpy4eJQ4lUYZpp
         kO0w==
X-Forwarded-Encrypted: i=1; AJvYcCUS5jJoValDd1IBnphXVrdSY2zG/psTYf0o6cDE9HAYsKpE7U3JuzeavSJFczidkU+AIKYG2S6wAPhFjLE=@vger.kernel.org, AJvYcCX+gmghByrfbc58idIHaEn3p1xnznp1/QWw2jJDCSgKfmpGXUGqW3teSpZlWzglEQwcbZ8k9ZCL1H03VU3lunI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAuWvi7We6j31lJBfZAXmHyjAYTbl1aGZAvaU6W7mGC8TQ2WdV
	6nVzvj44laMZIwgfYQO9ugzu4iy++frbD5OP9S5LBvBlF2/qT0gC
X-Gm-Gg: ASbGncs8ycpR8/Gb2n1IuOYPep/HFIgtJfOachgTWDcElkmCSmJM4QRfWxCAiexadWY
	uq4KyLdkOYCXcaTK8TwmJxLV0Risd5VoLlo8wekrFUcc2JrASubS34e7AlbQE87vrzB7Nvt8sQe
	rzNWNFbGu8124rf1eVTHikEvYoea7uDRgvj9ep0zoYUweOa5OW7Fd82PK/L2R9WrkHGgjo0ESYN
	DkTLnGvOesj+G1ivMc0UX1UXPhphgroii9+PrKHIgJLIzAAmq5rjSYciXS75vM/Nj2xiPQ+wR28
	87uE+lNLox1tn/YXkTKc+YZ8cNzpCarpJot4FqlqHDDQt0ed
X-Google-Smtp-Source: AGHT+IH3ntoNzsbwpt98IjUOPrT38m21FKHV8+iVlp9d6b2z6vAs3Tw9e9f6pfklWNC4L6k0vaxkDQ==
X-Received: by 2002:a17:90b:1f89:b0:2ff:702f:7172 with SMTP id 98e67ed59e1d1-308237c1421mr3498931a91.33.1744373168405;
        Fri, 11 Apr 2025 05:06:08 -0700 (PDT)
Received: from fedora.local ([2804:d57:4e50:a700:f33d:65d1:e22e:109b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd12b5eesm5520714a91.29.2025.04.11.05.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:06:08 -0700 (PDT)
From: Filipe Xavier <felipeaggger@gmail.com>
Date: Fri, 11 Apr 2025 09:05:41 -0300
Subject: [PATCH v3] rust: add new macro for common bitmap operations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-feat-add-bitmask-macro-v3-1-187bd3e4a03e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJQF+WcC/4XNzQ6CMAzA8VchOzszugHRk+9hPHQfQKNzZiOLh
 vDuDk5cjOnp36S/ziy5SC6xczWz6DIlCs8S8lAxM+JzcJxsaQYCGiGF4r3DiaO1XNPkMd25RxM
 DbxUoXRtZdw5YOX5F19N7g6+30iOlKcTP9ifX6/YvmWtexoAFbbTqWn0ZPNLjaIJnK5lhx0Dzk
 4HCWKkdaov2JPo9syzLF6uPBAkDAQAA
X-Change-ID: 20250304-feat-add-bitmask-macro-6424b1c317e2
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org, 
 felipe_life@live.com, linux-kernel@vger.kernel.org, 
 Filipe Xavier <felipeaggger@gmail.com>, Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.2

We have seen a proliferation of mod_whatever::foo::Flags
being defined with essentially the same implementation
for BitAnd, BitOr, contains and etc.

This macro aims to bring a solution for this,
allowing to generate these methods for user-defined structs.
With some use cases in KMS and upcoming GPU drivers.

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/We.20really.20need.20a.20common.20.60Flags.60.20type
Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
Suggested-by: Lyude Paul <lyude@redhat.com>
---
Changes in v3:
- New Feat: added support to declare flags inside macro use.
- Minor fixes: used absolute paths to refer to items, fix rustdoc and fix example cases.
- Link to v2: https://lore.kernel.org/r/20250325-feat-add-bitmask-macro-v2-1-d3beabdad90f@gmail.com

Changes in v2:
- rename: change macro and file name to impl_flags.
- negation sign: change char for negation to `!`. 
- transpose docs: add support to transpose user provided docs.
- visibility: add support to use user defined visibility.
- operations: add new operations for flag, 
to support use between bit and bitmap, eg: flag & flags.
- code style: small fixes to remove warnings.
- Link to v1: https://lore.kernel.org/r/20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b@gmail.com
---
 rust/kernel/impl_flags.rs | 231 ++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs        |   1 +
 rust/kernel/prelude.rs    |   1 +
 3 files changed, 233 insertions(+)

diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
new file mode 100644
index 0000000000000000000000000000000000000000..992988d26bc82e8461987206cc3ae9335f9387c8
--- /dev/null
+++ b/rust/kernel/impl_flags.rs
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! impl_flags utilities for working with flags.
+
+/// Declares a impl_flags type with its corresponding flag type.
+///
+/// This macro generates:
+/// - Implementations of common bitmap op. ([`::core::ops::BitOr`], [`::core::ops::BitAnd`], etc.).
+/// - Utility methods such as `.contains()` to check flags.
+///
+/// # Examples
+///
+/// Defining and using impl_flags:
+///
+/// ```
+/// impl_flags!(
+///     /// Represents multiple permissions.
+///     #[derive(Debug, Clone, Default, Copy, PartialEq, Eq)]
+///     pub Permissions,
+///     /// Represents a single permission.
+///     #[derive(Debug, Clone, Copy, PartialEq, Eq)]
+///     pub Permission {
+///         const READ = 1 << 0,
+///         const WRITE = 1 << 1,
+///         const EXECUTE = 1 << 2,
+///         },
+///     u32
+/// );
+///
+///
+/// // Combine multiple permissions using operation OR (`|`).
+/// let read_write: Permissions = Permission::READ | Permission::WRITE;
+///
+/// assert!(read_write.contains(Permission::READ));
+/// assert!(read_write.contains(Permission::WRITE));
+/// assert!(!read_write.contains(Permission::EXECUTE));
+///
+/// // Removing a permission with operation AND (`&`).
+/// let read_only: Permissions = read_write & Permission::READ;
+/// assert!(read_only.contains(Permission::READ));
+/// assert!(!read_only.contains(Permission::WRITE));
+///
+/// // Toggling permissions with XOR (`^`).
+/// let toggled: Permissions = read_only ^ Permission::READ;
+/// assert!(!toggled.contains(Permission::READ));
+///
+/// // Inverting permissions with negation (`!`).
+/// let negated = !read_only;
+/// assert!(negated.contains(Permission::WRITE));
+/// ```
+#[macro_export]
+macro_rules! impl_flags {
+    (
+        $(#[$outer_flags:meta])*
+        $vis_flags:vis $flags:ident,
+
+        $(#[$outer_flag:meta])*
+        $vis_flag:vis $flag:ident {
+            $(
+                $(#[$inner_flag:meta])*
+                $kw:ident $name:ident = $value:expr
+            ),* $(,)?
+        },
+        $ty:ty
+    ) => {
+        $(#[$outer_flags])*
+        #[repr(transparent)]
+        $vis_flags struct $flags($ty);
+
+        $(#[$outer_flag])*
+        $vis_flag struct $flag($ty);
+
+        impl ::core::convert::From<$flag> for $flags {
+            #[inline]
+            fn from(value: $flag) -> Self {
+                Self(value.0)
+            }
+        }
+
+        impl ::core::convert::From<$flags> for $ty {
+            #[inline]
+            fn from(value: $flags) -> Self {
+                value.0
+            }
+        }
+
+        impl ::core::ops::BitOr for $flags {
+            type Output = Self;
+            #[inline]
+            fn bitor(self, rhs: Self) -> Self::Output {
+                Self(self.0 | rhs.0)
+            }
+        }
+
+        impl ::core::ops::BitOrAssign for $flags {
+            #[inline]
+            fn bitor_assign(&mut self, rhs: Self) {
+                *self = *self | rhs;
+            }
+        }
+
+        impl ::core::ops::BitAnd for $flags {
+            type Output = Self;
+            #[inline]
+            fn bitand(self, rhs: Self) -> Self::Output {
+                Self(self.0 & rhs.0)
+            }
+        }
+
+        impl ::core::ops::BitAndAssign for $flags {
+            #[inline]
+            fn bitand_assign(&mut self, rhs: Self) {
+                *self = *self & rhs;
+            }
+        }
+
+        impl ::core::ops::BitOr<$flag> for $flags {
+            type Output = Self;
+            #[inline]
+            fn bitor(self, rhs: $flag) -> Self::Output {
+                self | Self::from(rhs)
+            }
+        }
+
+        impl ::core::ops::BitOrAssign<$flag> for $flags {
+            #[inline]
+            fn bitor_assign(&mut self, rhs: $flag) {
+                *self = *self | rhs;
+            }
+        }
+
+        impl ::core::ops::BitAnd<$flag> for $flags {
+            type Output = Self;
+            #[inline]
+            fn bitand(self, rhs: $flag) -> Self::Output {
+                self & Self::from(rhs)
+            }
+        }
+
+        impl ::core::ops::BitAndAssign<$flag> for $flags {
+            #[inline]
+            fn bitand_assign(&mut self, rhs: $flag) {
+                *self = *self & rhs;
+            }
+        }
+
+        impl ::core::ops::BitXor for $flags {
+            type Output = Self;
+            #[inline]
+            fn bitxor(self, rhs: Self) -> Self::Output {
+                Self(self.0 ^ rhs.0)
+            }
+        }
+
+        impl ::core::ops::BitXorAssign for $flags {
+            #[inline]
+            fn bitxor_assign(&mut self, rhs: Self) {
+                *self = *self ^ rhs;
+            }
+        }
+
+        impl ::core::ops::Not for $flags {
+            type Output = Self;
+            #[inline]
+            fn not(self) -> Self::Output {
+                Self(!self.0)
+            }
+        }
+
+        impl ::core::ops::BitOr for $flag {
+            type Output = $flags;
+            #[inline]
+            fn bitor(self, rhs: Self) -> Self::Output {
+                $flags(self.0 | rhs.0)
+            }
+        }
+
+        impl ::core::ops::BitAnd for $flag {
+            type Output = $flags;
+            #[inline]
+            fn bitand(self, rhs: Self) -> Self::Output {
+                $flags(self.0 & rhs.0)
+            }
+        }
+
+        impl ::core::ops::BitXor for $flag {
+            type Output = $flags;
+            #[inline]
+            fn bitxor(self, rhs: Self) -> Self::Output {
+                $flags(self.0 ^ rhs.0)
+            }
+        }
+
+        impl ::core::ops::Not for $flag {
+            type Output = $flags;
+            #[inline]
+            fn not(self) -> Self::Output {
+                $flags(!self.0)
+            }
+        }
+
+        impl ::core::ops::BitXor<$flag> for $flags {
+            type Output = Self;
+            #[inline]
+            fn bitxor(self, rhs: $flag) -> Self::Output {
+                self ^ Self::from(rhs)
+            }
+        }
+
+        impl $flag {
+            $(
+                $(#[$inner_flag])*
+                pub $kw $name: Self = Self($value);
+            )*
+        }
+
+        impl $flags {
+            /// Returns an empty instance of `type` where no flags are set.
+            #[inline]
+            pub const fn empty() -> Self {
+                Self(0)
+            }
+
+            /// Checks if a specific flag is set.
+            #[inline]
+            pub fn contains(self, flag: $flag) -> bool {
+                (self.0 & flag.0) == flag.0
+            }
+        }
+    };
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 496ed32b0911a9fdbce5d26738b9cf7ef910b269..7653485a456ae5aa51becbf04153ea54a7067d9e 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -49,6 +49,7 @@
 #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
 pub mod firmware;
 pub mod fs;
+pub mod impl_flags;
 pub mod init;
 pub mod io;
 pub mod ioctl;
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index dde2e0649790ca24e6c347b29465ea0a1c3e503b..0f691dd2df71d821265fae01555ba50e6a76f372 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -25,6 +25,7 @@
 #[doc(no_inline)]
 pub use super::dbg;
 pub use super::fmt;
+pub use super::impl_flags;
 pub use super::{dev_alert, dev_crit, dev_dbg, dev_emerg, dev_err, dev_info, dev_notice, dev_warn};
 pub use super::{pr_alert, pr_crit, pr_debug, pr_emerg, pr_err, pr_info, pr_notice, pr_warn};
 

---
base-commit: beeb78d46249cab8b2b8359a2ce8fa5376b5ad2d
change-id: 20250304-feat-add-bitmask-macro-6424b1c317e2

Best regards,
-- 
Filipe Xavier <felipeaggger@gmail.com>

