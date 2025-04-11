Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733AD487BF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 15:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744385695; cv=none; b=r3liO0W3Mcf2zAEd/cljYE/ihY/C8D6lqzxCSfUHDpV6FgKSyPvPb7kaFrM9JLl6Wh0+fkPhQwgi4PGBLarfQVCpuz/cyKPCv7WRhYy95g/V2tjYp/5ufXxeZ+48oPd+dDkIcMaP5jxZ1dfiCUcPhTeMJ4tALKqheySlXkyfmu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744385695; c=relaxed/simple;
	bh=QgAD9HMAXwARtw7ZhLdS69yGcm8TcyMIwFNG5/gF6Eg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=SPjlymmIO4zPPSchLhh2lIRCVdyMYEWVe7/+IsDLesAutqBePIfouo28lYHeLAiQnHKuqUuql2G3ixplGwiLkUQJlahWmXDdI7hZJLKJXWZtyAYbrr+Uaz+rCFo3lkH5qxBT1x8YiQpQxKMjCfZ9/Y4uJWuXsdGKCvBtQrjQ8BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ubHwGkIZ; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ubHwGkIZ"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3913f97d115so1136612f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744385692; x=1744990492; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u4VkktuBuel++xM+h8VL0/WF71SZD4PePpFrBdBEO8Y=;
        b=ubHwGkIZ1tGu9sYIug2bp5TtkyAnWGKzF1ugHd9v3CYYBxvxJ27GfVQk9T5NeNPXL0
         W7RnIPoQZDOPlMysvqedCtygAESNhADMuqUarS9fNKnUpXm1p6YtGrgDTI4zLAtbOSGA
         8/pH3FOpXm1pSk0yhv/OrhJnw01o/URl5J4tpVlr5TGtA5a9wISoDHJSXuDJdg/zxEEn
         cncMbqTwnGcdCfCYPEr0ZAdx4+IESxckMM6ZQBpngcPiHisxf1oPsy9Jq0ZMTogRSFBC
         NNZNaC8tv6eyDYx6pYkTPLX8p7spo2kmHIY5hamGR8tEPXemOkjZxJkg1THVvKpzDkOM
         b6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744385692; x=1744990492;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u4VkktuBuel++xM+h8VL0/WF71SZD4PePpFrBdBEO8Y=;
        b=hlTm+6VSwtANNv4srTJuEg+yGE0U38EVjcAn3awC+HdEIjLG+Q5DgAlahFlbJoHo44
         L4gR+8mI0SBS4WdkVWYER2F7mzbas60AOeqJcRChXbB4/Y+SyS8wgCKRiFCnwadRnaFa
         iidbq2lqrI7XoPcjfIVHfVnmV3/id8lNK2+uIqhE95sFACcurwogywjL1/8WEx9SFZw3
         NpEMAzgQ87JYNRQCqtm+BQ/mBiCVs4RxuM1kbK9m2P+gJG4DRoxogLnc5C3Lmmf7vlOM
         5srJ62akUzkYbQekEwH8lOMuHMiFmXttwOU3iup0Xxk9gr122lh6FCBiaMA3q5KOEFe5
         V/XA==
X-Forwarded-Encrypted: i=1; AJvYcCXNoY1FJsJs/G2DdcnlzbISQQerSxrEbnUsOpBYWVI0tiJerJOv2hCGuLF7oex8pX7bfdGTGwHw7FhLTKk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0AKlybx+dpFTT/bvP3xmWyagt7PDYkdAdwTicZkbQdWNR8fpU
	9TO48jaO4Z2le4yYC20zkMmpRw9vX/CznAiCeCTfqsxAHkPzTdc24E+eTv8ZntuYJXQ0DJ68eBW
	HIoyalP6Z4BEx9Q==
X-Google-Smtp-Source: AGHT+IGaGTyCjhYfHXDYYrhPGT0Gf+5CF736EXUzVp/09nAwD1r8MPrJaZDtsY12SjT/zDakwt7RFJPy1WhSrVg=
X-Received: from wmbfj8.prod.google.com ([2002:a05:600c:c88:b0:43c:ec26:c3a3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:598e:0:b0:38d:df15:2770 with SMTP id ffacd0b85a97d-39d8f21d531mr6305056f8f.0.1744385691754;
 Fri, 11 Apr 2025 08:34:51 -0700 (PDT)
Date: Fri, 11 Apr 2025 15:34:24 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAH82+WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0ND3eSi1MSSVN3y/KLswtLU0lTdFANTY0NTi2TzRJMkJaC2gqLUtMw KsJHRsbW1AC/Vg3ZiAAAA
X-Change-Id: 20250411-create-workqueue-d053158c7a4b
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6809; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=QgAD9HMAXwARtw7ZhLdS69yGcm8TcyMIwFNG5/gF6Eg=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBn+TaFUEY6DxqwhiH1EZCxZ6RKx8VGPBDEGSsxX
 1f35NRkF1CJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ/k2hQAKCRAEWL7uWMY5
 RjhgD/9wtJ4frzudd8SvI9+YHbVrY+UTKhu3hHIgt3PVe2PyTrHEs79nyIwLcLwxg2YNHi/rphL
 GKEexyOUEKq86Mw/cksCBGlcS9dhAyGkQczjhL0/Urm3uFmty3iE6IhGwU10XMGxBzICGXaeq8v
 PwBQ3Y60tgM+NV0C+Xfe20iBwd0bwbR07xFdFdwQ76EqeQDLxXORYba0XDopHiLqbicFoCXIPgK
 xSLgyeB4gQu7xVRQOI2/thsJI0AjZcsD1WvF+AjU4kZqI4oH9OvO286Yq6oJH4EU8dc6VPwYql6
 UIFMFTDj+xN3mjFw1Q9PzFD0ZPp7zymisuyTAnT+9bTlSXcKCnYHv9rqfaaVkdWW0XErCLYljj5
 XRnUsRkhSQX1geIAKzEKhnmj2xRhWdpNGOHL19XWvXrSdAhmrJQ1MxpANrGw2gkRFCIG9bexzXS
 +jNy45zVVrRsIV0Efd6w24vVwxmpJGZW+qn4JZAByP8ffByQvOLZOwOrcmPiUk+ZpjcPVas6469
 8Zsb4RNXdFHvAChw0VVGpUsr8xroNZnIX7Bn0H1rUBjlzy3BcvxOyJdganmSXidflIUlgBHexrw
 ob2SrA+bEJO2ebEE3BAqhqDHZi1VPISx1Y3f6eH0kXqkEGw2f9MMBddHogBp+JV3XFo8Eim8uZ8 w+jMJtw5RNG6ToQ==
X-Mailer: b4 0.14.2
Message-ID: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com>
Subject: [PATCH] workqueue: rust: add creation of workqueues
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Creating workqueues is needed by various GPU drivers. Not only does it
give you better control over execution, it also allows devices to ensure
that all tasks have exited before the device is unbound (or similar) by
running the workqueue destructor.

This patch is being developed in parallel with the new Owned type [1].
The OwnedQueue struct becomes redundant once [1] lands; at that point it
can be replaced with Owned<Queue>, and constructors can be moved to the
Queue type.

A wrapper type WqFlags is provided for workqueue flags. Since we only
provide the | operator for this wrapper type, this makes it impossible
to pass internal workqueue flags to the workqueue constructor. It has
the consequence that we need a separate constant for the no-flags case,
as the constructor does not accept a literal 0. I named this constant
"BOUND" to signify the opposite of UNBOUND.

Link: https://lore.kernel.org/rust-for-linux/20250325-unique-ref-v9-0-e91618c1de26@pm.me/ [1]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
This patch is based on top of:
https://lore.kernel.org/all/20250411-workqueue-delay-v1-1-26b9427b1054@google.com/
---
 rust/kernel/workqueue.rs | 141 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 140 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index c30fe0185e7a6a89943a5ba9f5b36a5bca3edb85..eaee42e289c4d00c447727c42e9048298560122a 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -194,7 +194,7 @@
     time::Jiffies,
     types::Opaque,
 };
-use core::marker::PhantomData;
+use core::{marker::PhantomData, ops::Deref, ptr::NonNull};
 
 /// Creates a [`Work`] initialiser with the given name and a newly-created lock class.
 #[macro_export]
@@ -346,6 +346,145 @@ pub fn try_spawn<T: 'static + Send + FnOnce()>(
     }
 }
 
+/// Workqueue flags.
+///
+/// For details, please refer to `Documentation/core-api/workqueue.rst`.
+///
+/// # Invariants
+///
+/// Must contain a valid combination of workqueue flags that may be used with `alloc_workqueue`.
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub struct WqFlags(bindings::wq_flags);
+
+impl WqFlags {
+    /// Bound to a cpu.
+    pub const BOUND: WqFlags = WqFlags(0);
+    /// Execute in bottom half (softirq) context.
+    pub const BH: WqFlags = WqFlags(bindings::wq_flags_WQ_BH);
+    /// Not bound to a cpu.
+    pub const UNBOUND: WqFlags = WqFlags(bindings::wq_flags_WQ_UNBOUND);
+    /// Freeze during suspend.
+    pub const FREEZABLE: WqFlags = WqFlags(bindings::wq_flags_WQ_FREEZABLE);
+    /// May be used for memory reclaim.
+    pub const MEM_RECLAIM: WqFlags = WqFlags(bindings::wq_flags_WQ_MEM_RECLAIM);
+    /// High priority.
+    pub const HIGHPRI: WqFlags = WqFlags(bindings::wq_flags_WQ_HIGHPRI);
+    /// Cpu intensive workqueue.
+    pub const CPU_INTENSIVE: WqFlags = WqFlags(bindings::wq_flags_WQ_CPU_INTENSIVE);
+    /// Visible in sysfs.
+    pub const SYSFS: WqFlags = WqFlags(bindings::wq_flags_WQ_SYSFS);
+    /// Power-efficient workqueue.
+    pub const POWER_EFFICIENT: WqFlags = WqFlags(bindings::wq_flags_WQ_POWER_EFFICIENT);
+}
+
+impl core::ops::BitOr for WqFlags {
+    type Output = WqFlags;
+    fn bitor(self, rhs: WqFlags) -> WqFlags {
+        WqFlags(self.0 | rhs.0)
+    }
+}
+
+/// An owned kernel work queue.
+///
+/// # Invariants
+///
+/// `queue` points at a valid workqueue that is owned by this `OwnedQueue`.
+pub struct OwnedQueue {
+    queue: NonNull<Queue>,
+}
+
+impl OwnedQueue {
+    /// Allocates a new workqueue.
+    ///
+    /// The provided name is used verbatim as the workqueue name.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::c_str;
+    /// use kernel::workqueue::{OwnedQueue, WqFlags};
+    ///
+    /// let wq = OwnedQueue::new(c_str!("my-wq"), WqFlags::UNBOUND, 0)?;
+    /// wq.try_spawn(
+    ///     GFP_KERNEL,
+    ///     || pr_warn!("Printing from my-wq"),
+    /// )?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    pub fn new(name: &CStr, flags: WqFlags, max_active: usize) -> Result<OwnedQueue, AllocError> {
+        // SAFETY:
+        // * "%s\0" is compatible with passing the name as a c-string.
+        // * the flags argument does not include internal flags.
+        let ptr = unsafe {
+            bindings::alloc_workqueue(
+                b"%s\0".as_ptr(),
+                flags.0,
+                i32::try_from(max_active).unwrap_or(i32::MAX),
+                name.as_char_ptr(),
+            )
+        };
+
+        Ok(OwnedQueue {
+            queue: NonNull::new(ptr).ok_or(AllocError)?.cast(),
+        })
+    }
+
+    /// Allocates a new workqueue.
+    ///
+    /// # Examples
+    ///
+    /// This example shows how to pass a Rust string formatter to the workqueue name, creating
+    /// workqueues with names such as `my-wq-1` and `my-wq-2`.
+    ///
+    /// ```
+    /// use kernel::alloc::AllocError;
+    /// use kernel::workqueue::{OwnedQueue, WqFlags};
+    ///
+    /// fn my_wq(num: u32) -> Result<OwnedQueue, AllocError> {
+    ///     OwnedQueue::new_fmt(format_args!("my-wq-{num}"), WqFlags::UNBOUND, 0)
+    /// }
+    /// ```
+    #[inline]
+    pub fn new_fmt(
+        name: core::fmt::Arguments<'_>,
+        flags: WqFlags,
+        max_active: usize,
+    ) -> Result<OwnedQueue, AllocError> {
+        // SAFETY:
+        // * "%pA\0" is compatible with passing an `Arguments` pointer.
+        // * the flags argument does not include internal flags.
+        let ptr = unsafe {
+            bindings::alloc_workqueue(
+                b"%pA\0".as_ptr(),
+                flags.0,
+                i32::try_from(max_active).unwrap_or(i32::MAX),
+                (&name) as *const _ as *const crate::ffi::c_void,
+            )
+        };
+
+        Ok(OwnedQueue {
+            queue: NonNull::new(ptr).ok_or(AllocError)?.cast(),
+        })
+    }
+}
+
+impl Deref for OwnedQueue {
+    type Target = Queue;
+    fn deref(&self) -> &Queue {
+        // SAFETY: By the type invariants, this pointer references a valid queue.
+        unsafe { &*self.queue.as_ptr() }
+    }
+}
+
+impl Drop for OwnedQueue {
+    fn drop(&mut self) {
+        // SAFETY: The `OwnedQueue` is being destroyed, so we can destroy the workqueue it owns.
+        unsafe { bindings::destroy_workqueue(self.queue.as_ptr().cast()) }
+    }
+}
+
 /// A helper type used in [`try_spawn`].
 ///
 /// [`try_spawn`]: Queue::try_spawn

---
base-commit: d11cfa069ac43b6e38f2f603a18e742ef048122a
change-id: 20250411-create-workqueue-d053158c7a4b

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

