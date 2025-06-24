Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C8E25A330;
	Tue, 24 Jun 2025 22:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750803099; cv=none; b=f94kMeORKxkW6oxo4ev4NMvzjddBbd7OQ5YXBbPOMWbhOKEqARZSxw/3u5SRKUtnRcVG21KvEshf38qUj+Ba1D1+KJAr96VDYdSn4Vn0nGXCK4iQWfPwvN5hzDcoHF11fmBvf8blu2RAACDhdij3Cgoi3v+mayZedItR3FYWOI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750803099; c=relaxed/simple;
	bh=2fYVqdvVZOyhVdWES/18qc3/KomIzWwxDfp2+bGaXfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s+Jh97z71WeKQPEWSkGc8yQqZ/zb77r4tiS/m3N6apTzK6S2hXY9qdPtahJsfDYa6FvvLUwHMjiIk71IEZAWD308yDl4khukrxKp42SsLVYt9tMfELH1BtXoJAVqmxkF6HTIvRFPFhtlOzv+V/9CM3Yok0Bnw4tVKyLXe7AAxYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wtcd1QMb; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wtcd1QMb"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2366e5e4dbaso3389825ad.1;
        Tue, 24 Jun 2025 15:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750803097; x=1751407897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k1qfz7npuSV263RU/XyMTPXjzl3/t+g8dNO+Vafq5Vc=;
        b=Wtcd1QMbLp6m4aiE2SYODPO5Zk4lRMX4Tav6OWdVa0AI37o0Noe5uvqiYm6AIpiI/Q
         rRDUJTNwYN8aBmhxUg4+uGc2ZNGNPSCM8PrFx0S/3uNcsJK7mv/0hrvfR1AL3e/EnYCU
         SU6sn2agj2YOv6/ZF4OiUGqsS63Vef9g1Zokl5BJbOIol+EVFdEwZThZAq7DfIbY7Rbr
         D7C57WEl1zjWxFizsmkNe906qOFzOvrzHanxmqod3WBcOARhojqG0tsxcEr5fup0zMXy
         TajBKaZ/o9m8NT8ThwyZQ09UawghtkgIOEnjcuq8DrdoqRB+AJh45OUy5dUgZIgKi/zs
         dBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750803097; x=1751407897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1qfz7npuSV263RU/XyMTPXjzl3/t+g8dNO+Vafq5Vc=;
        b=JF8OUy8HStBlV5BZWnB3rIZjijIXHnoh2BjEjgAeG+Zntk2GF8W9flh7rdE/BTRDmH
         NSy3Z2/e4ABHFKKQnFMMH8DS5cWRQGqEiJOHxwBk6Rk6iq/VJWFRcMoRW1wXdVKkiJGn
         aOzr9cROJzXq0DAruklLzmnGdH9ovtGvpWVm+/zmu1LqR9GCV/ZU4VYlyJcDEUVDGhYF
         z1tIDgZiqqRHYe8VDJJX0QG+qb4rAwBNXZVw226pcyLMEH9NdMPSvCR6hRvmYAWFAIOn
         jouxLOG7Cu/36eLu0tLl255AQvOrx/CYWxJCuN5N8xBRcPymbRkmt+IEigA4kDY4OBmk
         1dkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPkdtnOGLxvR67/YTQEUQdG2t79ONNw1AUzmP28n3sOhDYrotHwRdJTsblgCNScrrXEzwm7wBQzq1WsbKlIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvRdZA+7q+aKcWtAsT8lU0bfosN84z1Yr1f00IjtuAL744rVD2
	6zPyPKuD+2zCyRcFo7q8W2FqjDSBASe23eIdv8oT4jfcl+Rx5rjqiZnM
X-Gm-Gg: ASbGncukmSxDg9LvxNwjTnWEivZISvYteUbrIlkccKH05XSwgGJ3d8UThoshjG14aZt
	P38AjCLnocVJYb2ebos7Ja/1baWIowfIzmgxYOprkXn6TKleocoB8Uh3vlD8gmpQOrr2grla8ja
	E6mLF9LdA3ugIbZqLvaNf/m6RNS/qIejcVWaEvNbtgUAe4jtJLMGoHrdVVNY54il5kwnxUlYiAR
	RJXZ7dIQppCb1ZeWfmeAcEsohKue+12FEHXNN1MFFZ9oJ8J6rquc1F8FheHNAR3J1Zns60Jygi/
	vn4cLB8x6vpwrUHhMsWVkOc9kxarTQkWf8hXapjZUwaV31fy0L+sTVaELqHjzawxtEHQmV/v0ES
	ZVU/Df2oiEKjsiJNZvIqy4FlagDz3g+bye5Ng
X-Google-Smtp-Source: AGHT+IHoR9fiqp6ip71cYAnZJhavz9a3WeQJL/OnTgAV6bvnKoELPcHgQjb4d+FplsKuexEMI1F26A==
X-Received: by 2002:a17:902:f68b:b0:232:59b:5923 with SMTP id d9443c01a7336-238253ec8b3mr9686685ad.23.1750803096739;
        Tue, 24 Jun 2025 15:11:36 -0700 (PDT)
Received: from mitchelllevy.localdomain (82.sub-174-224-205.myvzw.com. [174.224.205.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8393741sm114580555ad.15.2025.06.24.15.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:11:36 -0700 (PDT)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Tue, 24 Jun 2025 15:10:39 -0700
Subject: [PATCH 1/5] rust: percpu: introduce a rust API for per-CPU
 variables
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-rust-percpu-v1-1-9c59b07d2a9c@gmail.com>
References: <20250624-rust-percpu-v1-0-9c59b07d2a9c@gmail.com>
In-Reply-To: <20250624-rust-percpu-v1-0-9c59b07d2a9c@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Christoph Lameter <cl@linux.com>, Danilo Krummrich <dakr@kernel.org>, 
 Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750803093; l=15606;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=2fYVqdvVZOyhVdWES/18qc3/KomIzWwxDfp2+bGaXfw=;
 b=owgvvji1ROx81yigs8sJ/SU6nZxYmDVydO9bTpnfzG0fF3LIPscm98TeBFAnOSJ4u8J4DRJ98
 R/lO168ofM9CpMzoMIIy0UV12Gsckj1oHyEm9phovR2C2EiTNuyUzc5
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

Add a `CpuGuard` type that disables preemption for its lifetime. Add a
`PerCpuAllocation` type used to track dynamic allocations. Add a
`define_per_cpu!` macro to create static per-CPU allocations. Add
`DynamicPerCpu` and `StaticPerCpu` to provide a high-level API. Add a
`PerCpu` trait to unify the dynamic and static cases.

Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
 rust/helpers/helpers.c          |   2 +
 rust/helpers/percpu.c           |   9 ++
 rust/helpers/preempt.c          |  14 ++
 rust/kernel/lib.rs              |   3 +
 rust/kernel/percpu.rs           | 299 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/percpu/cpu_guard.rs |  35 +++++
 6 files changed, 362 insertions(+)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 0f1b5d115985..d56bbe6334d3 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -29,7 +29,9 @@
 #include "page.c"
 #include "platform.c"
 #include "pci.c"
+#include "percpu.c"
 #include "pid_namespace.c"
+#include "preempt.c"
 #include "rbtree.c"
 #include "rcu.c"
 #include "refcount.c"
diff --git a/rust/helpers/percpu.c b/rust/helpers/percpu.c
new file mode 100644
index 000000000000..a091389f730f
--- /dev/null
+++ b/rust/helpers/percpu.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/percpu.h>
+
+void __percpu *rust_helper_alloc_percpu(size_t sz, size_t align)
+{
+	return __alloc_percpu(sz, align);
+}
+
diff --git a/rust/helpers/preempt.c b/rust/helpers/preempt.c
new file mode 100644
index 000000000000..2c7529528ddd
--- /dev/null
+++ b/rust/helpers/preempt.c
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/preempt.h>
+
+void rust_helper_preempt_disable(void)
+{
+	preempt_disable();
+}
+
+void rust_helper_preempt_enable(void)
+{
+	preempt_enable();
+}
+
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b4774b2b1c3..733f9ff8b888 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -95,6 +95,9 @@
 pub mod page;
 #[cfg(CONFIG_PCI)]
 pub mod pci;
+// Only x86_64 is supported by percpu for now
+#[cfg(CONFIG_X86_64)]
+pub mod percpu;
 pub mod pid_namespace;
 pub mod platform;
 pub mod prelude;
diff --git a/rust/kernel/percpu.rs b/rust/kernel/percpu.rs
new file mode 100644
index 000000000000..a912f74349e0
--- /dev/null
+++ b/rust/kernel/percpu.rs
@@ -0,0 +1,299 @@
+// SPDX-License-Identifier: GPL-2.0
+//! This module contains abstractions for creating and using per-CPU variables from Rust.
+//! See the define_per_cpu! macro and the PerCpu<T> type.
+pub mod cpu_guard;
+
+use bindings::{alloc_percpu, free_percpu};
+
+use crate::alloc::Flags;
+use crate::percpu::cpu_guard::CpuGuard;
+use crate::sync::Arc;
+
+use core::arch::asm;
+
+use ffi::c_void;
+
+/// A per-CPU pointer; that is, an offset into the per-CPU area.
+pub struct PerCpuPtr<T>(*mut T);
+
+/// Represents a dynamic allocation of a per-CPU variable via alloc_percpu. Calls free_percpu when
+/// dropped.
+pub struct PerCpuAllocation<T>(PerCpuPtr<T>);
+
+/// Holds a dynamically-allocated per-CPU variable.
+pub struct DynamicPerCpu<T> {
+    alloc: Arc<PerCpuAllocation<T>>,
+}
+
+/// Holds a statically-allocated per-CPU variable.
+pub struct StaticPerCpu<T>(PerCpuPtr<T>);
+
+/// Represents exclusive access to the memory location pointed at by a particular PerCpu<T>.
+pub struct PerCpuToken<'a, T> {
+    _guard: CpuGuard,
+    ptr: &'a PerCpuPtr<T>,
+}
+
+/// A wrapper used for declaring static per-CPU variables. These symbols are "virtual" in that the
+/// linker uses them to generate offsets into each CPU's per-CPU area, but shouldn't be read
+/// from/written to directly. The fact that the statics are immutable prevents them being written
+/// to (generally), this struct having _val be non-public prevents reading from them.
+///
+/// The end-user of the per-CPU API should make use of the define_per_cpu! macro instead of
+/// declaring variables of this type directly.
+#[repr(transparent)]
+pub struct StaticPerCpuSymbol<T> {
+    _val: T, // generate a correctly sized type
+}
+
+impl<T> PerCpuPtr<T> {
+    /// Makes a new PerCpuPtr from a raw per-CPU pointer.
+    ///
+    /// # Safety
+    /// `ptr` must be a valid per-CPU pointer.
+    pub unsafe fn new(ptr: *mut T) -> Self {
+        Self(ptr)
+    }
+
+    /// Get a `&mut T` to the per-CPU variable represented by `&self`
+    ///
+    /// # Safety
+    /// The returned `&mut T` must follow Rust's aliasing rules. That is, no other `&(mut) T` may
+    /// exist that points to the same location in memory. In practice, this means that any PerCpu
+    /// on the same CPU holding a reference to the same PerCpuAllocation as `self` mut not call
+    /// `get_ref` for as long as the returned reference lives.
+    ///
+    /// CPU preemption must be disabled before calling this function and for the lifetime of the
+    /// returned reference. Otherwise, the returned &mut T might end up being a reference to a
+    /// different CPU's per-CPU area, causing the potential for a data race.
+    #[allow(clippy::mut_from_ref)] // Safety requirements prevent aliasing issues
+    pub unsafe fn get_ref(&self) -> &mut T {
+        let this_cpu_off_pcpu = core::ptr::addr_of!(this_cpu_off);
+        let mut this_cpu_area: *mut c_void;
+        // SAFETY: gs + this_cpu_off_pcpu is guaranteed to be a valid pointer because `gs` points
+        // to the per-CPU area and this_cpu_off_pcpu is a valid per-CPU allocation.
+        unsafe {
+            asm!(
+                "mov {out}, gs:[{off_val}]",
+                off_val = in(reg) this_cpu_off_pcpu,
+                out = out(reg) this_cpu_area,
+            )
+        };
+        // SAFETY: this_cpu_area + self.0 is guaranteed to be a valid pointer by the per-CPU
+        // subsystem and the invariant that self.0 is a valid offset into the per-CPU area.
+        //
+        // We know no-one else has a reference to the underlying pcpu variable because of the
+        // safety requirements of this function.
+        unsafe { &mut *((this_cpu_area).wrapping_add(self.0 as usize) as *mut T) }
+    }
+}
+
+impl<T> Clone for PerCpuPtr<T> {
+    fn clone(&self) -> Self {
+        *self
+    }
+}
+
+/// PerCpuPtr is just a pointer, so it's safe to copy.
+impl<T> Copy for PerCpuPtr<T> {}
+
+impl<T> PerCpuAllocation<T> {
+    /// Dynamically allocates a space in the per-CPU area suitably sized and aligned to hold a `T`.
+    ///
+    /// Returns `None` under the same circumstances the C function `alloc_percpu` returns `NULL`.
+    pub fn new() -> Option<PerCpuAllocation<T>> {
+        // SAFETY: No preconditions to call alloc_percpu
+        let ptr: *mut T = unsafe { alloc_percpu(size_of::<T>(), align_of::<T>()) } as *mut T;
+        if ptr.is_null() {
+            return None;
+        }
+
+        Some(Self(PerCpuPtr(ptr)))
+    }
+}
+
+impl<T> Drop for PerCpuAllocation<T> {
+    fn drop(&mut self) {
+        // SAFETY: self.0.0 was returned by alloc_percpu, and so was a valid pointer into
+        // the percpu area, and has remained valid by the invariants of PerCpuAllocation<T>.
+        unsafe { free_percpu(self.0 .0 as *mut c_void) }
+    }
+}
+
+/// A trait representing a per-CPU variable. This is implemented for both `StaticPerCpu<T>` and
+/// `DynamicPerCpu<T>`. The main usage of this trait is to call `get` to get a `PerCpuToken` that
+/// can be used to access the underlying per-CPU variable. See `PerCpuToken::with`.
+///
+/// # Safety
+/// The returned value from `ptr` must be valid for the lifetime of `&mut self`.
+pub unsafe trait PerCpu<T> {
+    /// Gets a `PerCpuPtr<T>` to the per-CPU variable represented by `&mut self`
+    ///
+    /// # Safety
+    /// `self` may be doing all sorts of things to track when the underlying per-CPU variable can
+    /// be deallocated. You almost certainly shouldn't be calling this function directly (it's
+    /// essentially an implementation detail of the trait), and you certainly shouldn't be making
+    /// copies of the returned `PerCpuPtr<T>` that may outlive `&mut self`.
+    ///
+    /// Implementers of this trait should ensure that the returned `PerCpuPtr<T>` is valid for
+    /// the lifetime of `&mut self`.
+    unsafe fn ptr(&mut self) -> &PerCpuPtr<T>;
+
+    /// Produces a token, asserting that the holder has exclusive access to the underlying memory
+    /// pointed to by `self`
+    ///
+    /// # Safety
+    /// `func` (or its callees that execute on the same CPU) may not call `get_ref` on another
+    /// `PerCpu<T>` that represents the same per-CPU variable as `&mut self` (that is, they must
+    /// not be `clone()`s of each other or, in the case of statically allocated variables,
+    /// additionally can't both have come from the same `define_per_cpu!`) for the lifetime of the
+    /// returned token.
+    ///
+    /// In particular, this requires that the underlying per-CPU variable cannot ever be mutated
+    /// from an interrupt context, unless irqs are disabled for the lifetime of the returned
+    /// `PerCpuToken`.
+    unsafe fn get(&mut self, guard: CpuGuard) -> PerCpuToken<'_, T> {
+        PerCpuToken {
+            _guard: guard,
+            // SAFETY: The lifetime of the returned `PerCpuToken<'_, T>` is bounded by the lifetime
+            // of `&mut self`.
+            ptr: unsafe { self.ptr() },
+        }
+    }
+}
+
+impl<T> StaticPerCpu<T> {
+    /// Creates a new PerCpu<T> pointing to the statically allocated variable at `ptr`. End-users
+    /// should probably be using the `unsafe_get_per_cpu!` macro instead of calling this function.
+    ///
+    /// # Safety
+    /// `ptr` must be a valid pointer to a per-CPU variable. This means that it must be a valid
+    /// offset into the per-CPU area, and that the per-CPU area must be suitably sized and aligned
+    /// to hold a `T`.
+    pub unsafe fn new(ptr: *mut T) -> Self {
+        Self(PerCpuPtr(ptr))
+    }
+}
+
+// SAFETY: The `PerCpuPtr<T>` returned by `ptr` is valid for the lifetime of `self` (and in fact,
+// forever).
+unsafe impl<T> PerCpu<T> for StaticPerCpu<T> {
+    unsafe fn ptr(&mut self) -> &PerCpuPtr<T> {
+        &self.0
+    }
+}
+
+impl<T> Clone for StaticPerCpu<T> {
+    fn clone(&self) -> Self {
+        Self(self.0)
+    }
+}
+
+impl<T> DynamicPerCpu<T> {
+    /// Allocates a new per-CPU variable
+    ///
+    /// # Arguments
+    /// * `flags` - Flags used to allocate an `Arc` that keeps track of the underlying
+    ///   `PerCpuAllocation`.
+    pub fn new(flags: Flags) -> Option<Self> {
+        let alloc: PerCpuAllocation<T> = PerCpuAllocation::new()?;
+
+        let arc = Arc::new(alloc, flags).ok()?;
+
+        Some(Self { alloc: arc })
+    }
+
+    /// Wraps a `PerCpuAllocation<T>` in a `PerCpu<T>`
+    ///
+    /// # Arguments
+    /// * `alloc` - The allocation to use
+    /// * `flags` - The flags used to allocate an `Arc` that keeps track of the `PerCpuAllocation`.
+    pub fn new_from_allocation(alloc: PerCpuAllocation<T>, flags: Flags) -> Option<Self> {
+        let arc = Arc::new(alloc, flags).ok()?;
+        Some(Self { alloc: arc })
+    }
+}
+
+// SAFETY: The `PerCpuPtr<T>` returned by `ptr` is valid for the lifetime of `self` because we
+// don't deallocate the underlying `PerCpuAllocation` until `self` is dropped.
+unsafe impl<T> PerCpu<T> for DynamicPerCpu<T> {
+    unsafe fn ptr(&mut self) -> &PerCpuPtr<T> {
+        &self.alloc.0
+    }
+}
+
+impl<T> Clone for DynamicPerCpu<T> {
+    fn clone(&self) -> Self {
+        Self {
+            alloc: self.alloc.clone(),
+        }
+    }
+}
+
+impl<T> PerCpuToken<'_, T> {
+    /// Immediately invokes `func` with a `&mut T` that points at the underlying per-CPU variable
+    /// that `&mut self` represents.
+    pub fn with<U>(&mut self, func: U)
+    where
+        U: FnOnce(&mut T),
+    {
+        // SAFETY: The existence of a PerCpuToken means that the requirements for get_ref are
+        // satisfied.
+        func(unsafe { self.ptr.get_ref() });
+    }
+}
+
+/// define_per_cpu! is analogous to the C DEFINE_PER_CPU macro in that it lets you create a
+/// statically allocated per-CPU variable.
+///
+/// # Example
+/// ```
+/// use kernel::define_per_cpu;
+/// use kernel::percpu::StaticPerCpuSymbol;
+///
+/// define_per_cpu!(pub MY_PERCPU: u64 = 0);
+/// ```
+#[macro_export]
+macro_rules! define_per_cpu {
+    ($vis:vis $id:ident: $ty:ty = $expr:expr) => {
+        $crate::macros::paste! {
+            // Expand $expr outside of the unsafe block to avoid silently allowing unsafe code to be
+            // used without a user-facing unsafe block
+            static [<__INIT_ $id>]: $ty = $expr;
+
+            // SAFETY: StaticPerCpuSymbol<T> is #[repr(transparent)], so we can freely convert from T
+            #[link_section = ".data..percpu"]
+            $vis static $id: StaticPerCpuSymbol<$ty> = unsafe {
+                core::mem::transmute::<$ty, StaticPerCpuSymbol<$ty>>([<__INIT_ $id>])
+            };
+        }
+    };
+}
+
+/// Gets a `PerCpu<T>` from a symbol declared with `define_per_cpu!` or `declare_extern_per_cpu!`.
+///
+/// # Arguments
+/// * `ident` - The identifier declared
+///
+/// # Safety
+/// `$id` must be declared with either `define_per_cpu!` or `declare_extern_per_cpu!`, and the
+/// returned value must be stored in a `PerCpu<T>` where `T` matches the declared type of `$id`.
+#[macro_export]
+macro_rules! unsafe_get_per_cpu {
+    ($id:ident) => {{
+        $crate::percpu::StaticPerCpu::new((&$id) as *const _ as *mut _)
+    }};
+}
+
+/// Declares a StaticPerCpuSymbol corresponding to a per-CPU variable defined in C. Be sure to read
+/// the safety requirements of `PerCpu::get`.
+#[macro_export]
+macro_rules! declare_extern_per_cpu {
+    ($id:ident: $ty:ty) => {
+        extern "C" {
+            static $id: StaticPerCpuSymbol<$ty>;
+        }
+    };
+}
+
+declare_extern_per_cpu!(this_cpu_off: u64);
diff --git a/rust/kernel/percpu/cpu_guard.rs b/rust/kernel/percpu/cpu_guard.rs
new file mode 100644
index 000000000000..14c04b12e7f0
--- /dev/null
+++ b/rust/kernel/percpu/cpu_guard.rs
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0
+//! Contains abstractions for disabling CPU preemption. See `CpuGuard`.
+
+/// A RAII guard for bindings::preempt_disable and bindings::preempt_enable. Guarantees preemption
+/// is disabled for as long as this object exists.
+pub struct CpuGuard {
+    // Don't make one without using new()
+    _phantom: (),
+}
+
+impl CpuGuard {
+    /// Create a new CpuGuard. Disables preemption for its lifetime.
+    pub fn new() -> Self {
+        // SAFETY: There are no preconditions required to call preempt_disable
+        unsafe {
+            bindings::preempt_disable();
+        }
+        CpuGuard { _phantom: () }
+    }
+}
+
+impl Default for CpuGuard {
+    fn default() -> Self {
+        Self::new()
+    }
+}
+
+impl Drop for CpuGuard {
+    fn drop(&mut self) {
+        // SAFETY: There are no preconditions required to call preempt_enable
+        unsafe {
+            bindings::preempt_enable();
+        }
+    }
+}

-- 
2.34.1

