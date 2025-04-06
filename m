Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE7B145FE8;
	Sun,  6 Apr 2025 11:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743938946; cv=none; b=uNirSw4GI5tz+ce9Ces7pi874x4URBOTnloARIYoW7tQqNORO33mCFGfoUPKHDV0BL0a2Rv9OX73mcuIcbyk3q2BHMyYm9I2ETQhPgUkGH9deNYkYvuMzU9iAemvQKdMnn/qWoEjxKD/vkENMDEoSYQXDdnPNXMTzCvBavuMDN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743938946; c=relaxed/simple;
	bh=SeXebZxEhQ15JpusxB3sN3Pr/PFpR6JwIs1E3MUTMKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mj3xw1/vQYsKVeZH7XHR8oxmskpG9cxCK4P+SVVGxIWA8pbanxNi95GdnfieRq4W6jacPxmTzukRCE6Urh3XTEj4JLqeJM2kvHNi46rYyqv+UErLS6UErpvU2+XRX3UeRpAzsnJNer5XY+02AA6+ULziPdJ0SSveAnY2xG3p6zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn; spf=pass smtp.mailfrom=smail.nju.edu.cn; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
X-QQ-mid: bizesmtp89t1743938916t77954ce
X-QQ-Originating-IP: v5OIOCLctsBUbeHm0hxz4BSjuEmz9FqwX4x2qU4Kq9s=
Received: from localhost.localdomain ( [36.152.24.149])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 06 Apr 2025 19:28:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16350347360751056876
EX-QQ-RecipientCnt: 4
From: Xizhe Yin <xizheyin@smail.nju.edu.cn>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	xizheyin <xizheyin@smail.nju.edu.cn>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH] rust: convert raw URLs to Markdown autolinks in comments
Date: Sun,  6 Apr 2025 19:26:05 +0800
Message-ID: <07D9F73C7B35C74B+20250406112605.6152-1-xizheyin@smail.nju.edu.cn>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OYpbVsTx4C81TGrW4r/HTBiqiKQjdaOf16rxvmAsV6dGebVujdK2NTri
	QxKqdlg/qPv8cImRJqfH16zqPkbh/N5vdvz09g9jc2gJVjwq4ykEDY9hXJ4+6b5NOTzMLEB
	Erljoe7meI3x7/RAvJljVREiVOVc9jGr/CTLZWEhv27PCti7Ym2dB0qWRGu9eT66Wu5pjGm
	iA4D8HDBPzc9q7otiai5S2omKS/O9uRWSiWcIGxDuQkEWLQ3BbpWjY/lgp1wUvXut6Mr/FN
	sM/gVmRhQk4JxIEnk+yRgjXURjTKq2p+k9dnhY/78FSuvr5z5qOY5e5Axhit96CGMDEx36y
	osQTbc6X511+meWC4ctPF8cr5i/f2WBLrvlUNMCcyLb58woOAFtXOWauDX2d5kW2zUiN9Jc
	PjY1g+WXNrqNZXLQWg12wfkqjPHg15snc/Jc0wDaYd2XRcWEvCh4AubaWKiPtZ3opW2xAkA
	wpHrEq8JNj+uhIE2QUdl9/M41hPUUvHk/BlkGT2w10VW+JsPnn1aZmiNXhkG+iPs7zuj32J
	8m0bATMJLpoDyBJkeCtRt/8ZBoazZ6FhtyngheIUntWIM5qF1KToTuZJLENgDNwhOBASoxZ
	FYdBKApwAmzu5iT+5nI4CVyGSkHwYSh1R84M3SyQCxvh/lH6qjUAVEPSTYfeHbv0SshWP53
	AVV4zuIrAFkLD1rVMyGsAV5lxiageFrVTCRtqOtcLbnfO7LwkKEJgP2YXkOT7oZ9V0wpTdE
	JbSoGA95G2QR8ARr1fLr7jWtWGa9Hf88b0c0OOnrNBmtECxQ8pLcQp6sJH1IbU0E8vzxDBq
	EvvPviO/HLbPBCo5lWLrUoR6sasrMDNYDHTR59JCjXEPE+3Ub5eX9La842sHjs/uJiiANjN
	r1wkUlb1nDQdgeB/bfhhbmIGQMxSbWyAdJ9Pv+kQZcJn9EhgntB8Zk8LgoG8/VNbEI1OZnH
	ZGpurNrq7wJVzILJ7IW/UdgbQxO0wFTtRhTobuWIoMF1+eWzwMqvBBCvI
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

From: xizheyin <xizheyin@smail.nju.edu.cn>

Some comments in Rust files use raw URLs (http://example.com) rather
than Markdown autolinks [text](URL). This inconsistency makes the
documentation less uniform and harder to maintain.

This patch converts all remaining raw URLs in Rust code comments to use
the Markdown autolink format, maintaining consistency with the rest of
the codebase which already uses this style.

Link: https://github.com/Rust-for-Linux/linux/issues/1153
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: xizheyin <xizheyin@smail.nju.edu.cn>
---
 rust/kernel/alloc/kbox.rs               | 2 +-
 rust/kernel/block/mq/gen_disk.rs        | 2 +-
 rust/kernel/std_vendor.rs               | 2 +-
 rust/kernel/sync/arc.rs                 | 2 +-
 rust/pin-init/examples/pthread_mutex.rs | 2 +-
 rust/pin-init/src/lib.rs                | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index b77d32f3a58b..604d12c6f5bd 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -101,7 +101,7 @@
 pub type KVBox<T> = Box<T, super::allocator::KVmalloc>;
 
 // SAFETY: All zeros is equivalent to `None` (option layout optimization guarantee:
-// https://doc.rust-lang.org/stable/std/option/index.html#representation).
+// <https://doc.rust-lang.org/stable/std/option/index.html#representation>).
 unsafe impl<T, A: Allocator> ZeroableOption for Box<T, A> {}
 
 // SAFETY: `Box` is `Send` if `T` is `Send` because the `Box` owns a `T`.
diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
index 14806e1997fd..cd54cd64ea88 100644
--- a/rust/kernel/block/mq/gen_disk.rs
+++ b/rust/kernel/block/mq/gen_disk.rs
@@ -129,7 +129,7 @@ pub fn build<T: Operations>(
             get_unique_id: None,
             // TODO: Set to THIS_MODULE. Waiting for const_refs_to_static feature to
             // be merged (unstable in rustc 1.78 which is staged for linux 6.10)
-            // https://github.com/rust-lang/rust/issues/119618
+            // <https://github.com/rust-lang/rust/issues/119618>
             owner: core::ptr::null_mut(),
             pr_ops: core::ptr::null_mut(),
             free_disk: None,
diff --git a/rust/kernel/std_vendor.rs b/rust/kernel/std_vendor.rs
index 279bd353687a..abbab5050cc5 100644
--- a/rust/kernel/std_vendor.rs
+++ b/rust/kernel/std_vendor.rs
@@ -148,7 +148,7 @@ macro_rules! dbg {
     };
     ($val:expr $(,)?) => {
         // Use of `match` here is intentional because it affects the lifetimes
-        // of temporaries - https://stackoverflow.com/a/48732525/1063961
+        // of temporaries - <https://stackoverflow.com/a/48732525/1063961>
         match $val {
             tmp => {
                 $crate::pr_info!("[{}:{}:{}] {} = {:#?}\n",
diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 8484c814609a..350c380bb8d4 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -135,7 +135,7 @@ pub struct Arc<T: ?Sized> {
     // meaningful with respect to dropck - but this may change in the future so this is left here
     // out of an abundance of caution.
     //
-    // See https://doc.rust-lang.org/nomicon/phantom-data.html#generic-parameters-and-drop-checking
+    // See <https://doc.rust-lang.org/nomicon/phantom-data.html#generic-parameters-and-drop-checking>
     // for more detail on the semantics of dropck in the presence of `PhantomData`.
     _p: PhantomData<ArcInner<T>>,
 }
diff --git a/rust/pin-init/examples/pthread_mutex.rs b/rust/pin-init/examples/pthread_mutex.rs
index 9164298c44c0..5ac22f1880d2 100644
--- a/rust/pin-init/examples/pthread_mutex.rs
+++ b/rust/pin-init/examples/pthread_mutex.rs
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
-// inspired by https://github.com/nbdd0121/pin-init/blob/trunk/examples/pthread_mutex.rs
+// inspired by <https://github.com/nbdd0121/pin-init/blob/trunk/examples/pthread_mutex.rs>
 #![allow(clippy::undocumented_unsafe_blocks)]
 #![cfg_attr(feature = "alloc", feature(allocator_api))]
 #[cfg(not(windows))]
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 05c44514765e..0806c689f693 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1447,7 +1447,7 @@ macro_rules! impl_zeroable {
     {<T: ?Sized + Zeroable>} UnsafeCell<T>,
 
     // SAFETY: All zeros is equivalent to `None` (option layout optimization guarantee:
-    // https://doc.rust-lang.org/stable/std/option/index.html#representation).
+    // <https://doc.rust-lang.org/stable/std/option/index.html#representation>).
     Option<NonZeroU8>, Option<NonZeroU16>, Option<NonZeroU32>, Option<NonZeroU64>,
     Option<NonZeroU128>, Option<NonZeroUsize>,
     Option<NonZeroI8>, Option<NonZeroI16>, Option<NonZeroI32>, Option<NonZeroI64>,
-- 
2.49.0

