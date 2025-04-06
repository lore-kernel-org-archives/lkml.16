Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.77.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CAF1EEE6;
	Sun,  6 Apr 2025 03:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.77.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743911545; cv=none; b=IfHvFE7AWVfZVwRd+9Hk5U6sNKoqu1MifNffliIVOkH0/soo+bA+D6BtS0AqOcmG334mmvHonkOHc5MlQExJ0aTNa6YhBHnTNIg9A2BvpVnhnoY6JDKFngft4lgAIfxOYQl3VLN1ZyaP5Jr90xLQwXClFvGE2jdhsGJbVwbNQns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743911545; c=relaxed/simple;
	bh=rY8/OwWhSh4Wdmz1L/w3ngh8RvKLFRK1JgTiRPZ0OhU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BWm8W+OlUPsSIsUy9QbksnDikJcHHzO/VtimdonhF9tm76zNy0IoyAun7SaAdjRzXqqS8+Xsv1ryoRhX7XzhkgQxD/B76x7OtMEM3XKc9gkcsHekEAU6tj7RdReYiWT+kmqOsREsd4iTqEbYKkWvPbffqo1fy0Hc5NERHVzR1kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn; spf=pass smtp.mailfrom=smail.nju.edu.cn; arc=none smtp.client-ip=114.132.77.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
X-QQ-mid: bizesmtpsz11t1743911437thz15z
X-QQ-Originating-IP: Qlqy6PbPAX34c31erUbh4nfB0lOCsT12VJwmJiBOUfU=
Received: from localhost.localdomain ( [36.152.24.133])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 06 Apr 2025 11:50:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13127222276208916939
EX-QQ-RecipientCnt: 4
From: Xizhe Yin <xizheyin@smail.nju.edu.cn>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	xizheyin <xizheyin@smail.nju.edu.cn>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH] rust: convert raw URLs to Markdown autolinks in comments
Date: Sun,  6 Apr 2025 11:48:11 +0800
Message-ID: <95E3B7B9ECBFB14C+20250406034811.32347-1-xizheyin@smail.nju.edu.cn>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NDtUtlvFer7vuL30EMS9WW//AhR2V8eVnM5LKYZgJsHOa4XSIg5er6NU
	/VkH0wmhHjme8CUmsPGN3+tVuSIeGbuUxQrG7CrlljWB10z6Gt+abS50gWZsdgpJ7mLGskk
	fAqskA8iAT/VVU5xnId8Q6Xvgg8rXU78O///FEvX/3PWE6I6IYKUUBCB1MP70wQFNn1KRoO
	pPFCSQtLJlA3KFlO982mCwHROnVjmpt2GQd268Wc4iN51tguNBnGeq3ONeNQXvXatbjhiUU
	vAzu7+U8idvrgn+oqznWTh6NMzrEOwEx/lGzx8uc6TtoSx8FQWvSamg0MauLnYS2Kh4t90m
	h3XBeJTaBk/szjZMT7lZ5x4LvXPj8j7xjpZnSTIO4xcFnTd71OnHSIohHJ7drU71FS8dNdB
	0gEvNeOQgjSQb67XOdsKsFzbe9p+J+C4mBMm6n3G70TPTJsOVeZEMMoRiz5y2RnmsmsvoBC
	dfTLPPie5BTHAYTsc2xzrV/GihEi+290h/XyfNb2vVmJYeHrJHXeOI8qA4bsTXUfl7fKyyk
	rBSBI5cIBKErU2i7lUBhAUoGA4wDpO5TxNkvg+W0LYa0wLSckeNxj713V/K6XghWV3CauK/
	jIBZQYVfKdiRwiwhHVwqwSgqo6ZI8hHkR4/YBNgxLE9ZFBkPUGfCAOPJbkBHbYJ1jzsyaeB
	bklO3V0N09NdYbFKfGSMeePARw044P/8R8j89EI1d64aHhGNhhEZuRyrKe0O1oH5+a28ka2
	DzdYM9RaM6qwwfrqfMHc526Wpa6VRBkmGlaPQjcukIIiF63wGlyGZaFuW67EgfRWWowzmlP
	1kcXk4zq+b/XD4XzQGaDHSp4UwLWTraAvVoD9rZUwALuvIP03k7mGqUnG1U1iihT9j5DGTn
	nR7zSHk6dOqkaeu4NU433BLmWqp1UJRNrjUqQHGev3mHMoYNRXm7+eZPfZ+XX5MjTp8lw7t
	NsPgwVAxtl+VJTm1d8L7lyfEhw+Sh9ob1DY3LJu2RhO5oCA==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

From: xizheyin <xizheyin@smail.nju.edu.cn>

Some comments in Rust files use raw URLs (http://example.com) rather
than Markdown autolinks [text](URL). This inconsistency makes the
documentation less uniform and harder to maintain.

This patch converts all remaining raw URLs in Rust code comments to use
the Markdown autolink format, maintaining consistency with the rest of
the codebase which already uses this style.

Link: Rust-for-Linux#1153
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Xizhe Yin <xizheyin@smail.nju.edu.cn>
---
 rust/kernel/alloc.rs               | 2 +-
 rust/kernel/alloc/allocator.rs     | 2 +-
 rust/kernel/cred.rs                | 2 +-
 rust/kernel/kunit.rs               | 2 +-
 rust/kernel/miscdevice.rs          | 2 +-
 rust/kernel/print.rs               | 2 +-
 rust/kernel/rbtree.rs              | 2 +-
 rust/kernel/std_vendor.rs          | 4 ++--
 rust/kernel/sync/arc/std_vendor.rs | 4 ++--
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index fc9c9c41cd79..d2f067ed8986 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -152,7 +152,7 @@ pub unsafe trait Allocator {
     /// - aligned to `layout.align()`,
     ///
     /// Additionally, `Flags` are honored as documented in
-    /// <https://docs.kernel.org/core-api/mm-api.html#mm-api-gfp-flags>.
+    /// [kernel documentation: GFP flags](https://docs.kernel.org/core-api/mm-api.html#mm-api-gfp-flags).
     fn alloc(layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError> {
         // SAFETY: Passing `None` to `realloc` is valid by its safety requirements and asks for a
         // new memory allocation.
diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index aa2dfa9dca4c..2e05ae842b62 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -6,7 +6,7 @@
 //! linked below. For instance, this includes the concept of "get free page" (GFP) flags and the
 //! typical application of the different kernel allocators.
 //!
-//! Reference: <https://docs.kernel.org/core-api/memory-allocation.html>
+//! Reference: [kernel documentation: Memory Allocation](https://docs.kernel.org/core-api/memory-allocation.html)
 
 use super::Flags;
 use core::alloc::Layout;
diff --git a/rust/kernel/cred.rs b/rust/kernel/cred.rs
index 2599f01e8b28..589557e18d79 100644
--- a/rust/kernel/cred.rs
+++ b/rust/kernel/cred.rs
@@ -6,7 +6,7 @@
 //!
 //! C header: [`include/linux/cred.h`](srctree/include/linux/cred.h).
 //!
-//! Reference: <https://www.kernel.org/doc/html/latest/security/credentials.html>
+//! Reference: [kernel documentation: Credentials](https://www.kernel.org/doc/html/latest/security/credentials.html)
 
 use crate::{
     bindings,
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 1604fb6a5b1b..ec0d4889cc12 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -4,7 +4,7 @@
 //!
 //! C header: [`include/kunit/test.h`](srctree/include/kunit/test.h)
 //!
-//! Reference: <https://docs.kernel.org/dev-tools/kunit/index.html>
+//! Reference: [kernel documentation: KUnit](https://docs.kernel.org/dev-tools/kunit/index.html)
 
 use core::{ffi::c_void, fmt};
 
diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index fa9ecc42602a..3cbd0258475c 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -6,7 +6,7 @@
 //!
 //! C headers: [`include/linux/miscdevice.h`](srctree/include/linux/miscdevice.h).
 //!
-//! Reference: <https://www.kernel.org/doc/html/latest/driver-api/misc_devices.html>
+//! Reference: [kernel documentation: Miscdevices](https://www.kernel.org/doc/html/latest/driver-api/misc_devices.html)
 
 use crate::{
     bindings,
diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index cf4714242e14..896a2ef2652a 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -4,7 +4,7 @@
 //!
 //! C header: [`include/linux/printk.h`](srctree/include/linux/printk.h)
 //!
-//! Reference: <https://docs.kernel.org/core-api/printk-basics.html>
+//! Reference: [kernel documentation: Printk basics](https://docs.kernel.org/core-api/printk-basics.html)
 
 use crate::{
     ffi::{c_char, c_void},
diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
index 5246b2c8a4ff..a9b10ae73dbf 100644
--- a/rust/kernel/rbtree.rs
+++ b/rust/kernel/rbtree.rs
@@ -4,7 +4,7 @@
 //!
 //! C header: [`include/linux/rbtree.h`](srctree/include/linux/rbtree.h)
 //!
-//! Reference: <https://docs.kernel.org/core-api/rbtree.html>
+//! Reference: [kernel documentation: Rbtree](https://docs.kernel.org/core-api/rbtree.html)
 
 use crate::{alloc::Flags, bindings, container_of, error::Result, prelude::*};
 use core::{
diff --git a/rust/kernel/std_vendor.rs b/rust/kernel/std_vendor.rs
index 279bd353687a..ae2a56d7cdc7 100644
--- a/rust/kernel/std_vendor.rs
+++ b/rust/kernel/std_vendor.rs
@@ -3,9 +3,9 @@
 //! Rust standard library vendored code.
 //!
 //! The contents of this file come from the Rust standard library, hosted in
-//! the <https://github.com/rust-lang/rust> repository, licensed under
+//! the [rust-lang/rust](https://github.com/rust-lang/rust) repository, licensed under
 //! "Apache-2.0 OR MIT" and adapted for kernel use. For copyright details,
-//! see <https://github.com/rust-lang/rust/blob/master/COPYRIGHT>.
+//! see [rust-lang/rust/blob/master/COPYRIGHT].
 
 /// [`std::dbg`], but using [`pr_info`] instead of [`eprintln`].
 ///
diff --git a/rust/kernel/sync/arc/std_vendor.rs b/rust/kernel/sync/arc/std_vendor.rs
index 11b3f4ecca5f..a95002ee4add 100644
--- a/rust/kernel/sync/arc/std_vendor.rs
+++ b/rust/kernel/sync/arc/std_vendor.rs
@@ -3,9 +3,9 @@
 //! Rust standard library vendored code.
 //!
 //! The contents of this file come from the Rust standard library, hosted in
-//! the <https://github.com/rust-lang/rust> repository, licensed under
+//! the [rust-lang/rust](https://github.com/rust-lang/rust) repository, licensed under
 //! "Apache-2.0 OR MIT" and adapted for kernel use. For copyright details,
-//! see <https://github.com/rust-lang/rust/blob/master/COPYRIGHT>.
+//! see [rust-lang/rust/blob/master/COPYRIGHT].
 
 use crate::sync::{arc::ArcInner, Arc};
 use core::any::Any;
-- 
2.49.0

