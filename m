Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F9428B512;
	Mon, 14 Apr 2025 19:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658939; cv=none; b=uFyQX2DSF7XuhQfyMQLzhHR6tkqx6nkSDsoRrvKyAHFL/Rp4jn1BALXkNLq20ljBVFgSaHjsbNRaGUx3LV1lXS4CUTT+wweFPfgsAvECYNkeTnIuo2E6FOGPYBxTMludjwjkS7IRotY41/Vz7gXpJ/Au/IJ5fvFBoDZas3xmSqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658939; c=relaxed/simple;
	bh=nIqel8sF5aGOeh5Zf3p9yAVGtxyjMWnYFGuVyV7v7Ew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JBiyxRbTZCR4P+ZF8VdmjIa1sAJraZGtRJaztfMxL07peEdlx37ynDHS/YhukwMxOOuVdgdo2MZX8KxiI/qVQgEfkvj+Pop/DpW/o5J1YNtiCtf9lG0IX3S+aBOqcRwejuAVjJfrqfq5oDMeEvYF/hOxvNh7SiReDdSaiAtPFHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZdWI7B9; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZdWI7B9"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2243803b776so70436695ad.0;
        Mon, 14 Apr 2025 12:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744658936; x=1745263736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IMpKntOoWqOPI4F7pSZs0AGZGaf4Czl/zYkqLuKCY7Q=;
        b=KZdWI7B9BGFMh4AFnbpWDD9jrX9tFP1k9V7gwIIT7Kr4b66s+XzCWi6imb0kiD9QrL
         4whdB9aStwaEpENG3fn7ltgLaBG9W1M6FVGQFr2v5Hut+WIhn4PqLVuPPxM0uCeunMTV
         resgvra0ffHuKepbLpzz6b29I1X0N6ka/ed5qs63VW3L99m54+R5yi/U4p46ebJvlj28
         X+fmZPVTzR6WM55aUBdOGpqH01J2MwgzQoPEM4I8NO1CvRlLlAdiRF/gRz2V3YA0vYEU
         yzRtrN+YOc3eONmW+th5N4kHiVdNj9CFPGjflCj4GuBInDYAa39ACsI9LU1suFUksZtq
         67Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658936; x=1745263736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMpKntOoWqOPI4F7pSZs0AGZGaf4Czl/zYkqLuKCY7Q=;
        b=NB3yH7RdDTxFWDMYd9e1FhoHF5sbVaVPovYLoti4wif+v/7YMVTJ9rERYxF6Shrz1u
         D3ZNu5IMz12f8nqvWj7Lj06jkKxBRfVA1jwnuvsWmmobSd4R6+5hvO88OAcOsZmDW4nU
         j2MJurktElae7kIQpqN/1ZTlStIjqoLb/GoYw3u3TCIrT2SD5kOkDt6g9ZvmmTDo3MiB
         f7QW910zS38rtvfIiywN5vDQ/TJVGe5I7bRZEh+hEA93ga83v43UsdPT9wPa7yz5UOJ5
         GuOkn4Gr5OkZBCEBFTSIuypIMCfk913HmnNfWEBldNWNK2ZlW59mr7wKV6mEpiD1DkUD
         ix7g==
X-Forwarded-Encrypted: i=1; AJvYcCWQiIGkvy8bGAOINK1/fzcdHUGVeAPCZr1ohYrRPbdRHyRQz7IGCaM213PNuckxEP8PbcUuAZPjUiZDE5vhIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv2NO2JjCzfV5uGmIyuB5dYb7RUMSWrO7gsHOHwNM3ZGEBpkX/
	bOjwRRotNqGrnspgNaZJD4pJaildnqQFmi027jRTTJ/T7pV/FtDs
X-Gm-Gg: ASbGncu3+0Dbq2o06ub5YpppvNdZLpRMX2ULq+7lhEtlJwFlaOpYN3DEL1kwRANSAUK
	4kqe2gw5Zpbze7Pt+3wVtNhx7iJG6apq9N5idaKRWltvP0Vw/Hxs/DDyPz9aB5b3jl610WLTL2S
	BEcZtJtCSFw1PWR5N9jNUgM3VNf5nB6vp6xMFr5NXqTaXvYm89SyxgEmC8aAQnLsUFI+qSIbnFe
	IRoWUnEK1+Z8X+xyqRa93LwWAcPyrltsW57Gb1pi0ckAp+yENTOeH3nMX2Tvr+nJp1eAVKkdnPK
	vwhTqPFfgWrDdhayrYte7sPdbv/6rU/4DdovlM9bBMV+y7B4/pQQ4Ag8ImL/oWiF
X-Google-Smtp-Source: AGHT+IHUJqPv71XqfBEgk7CHyIk9qxNWnHSnPWRNgqr/BnZRpyU2Spq8ltezT/k0DZBEeCi+eGcGwg==
X-Received: by 2002:a17:903:1a05:b0:224:256e:5e3f with SMTP id d9443c01a7336-22bea4bd566mr202083455ad.25.1744658936430;
        Mon, 14 Apr 2025 12:28:56 -0700 (PDT)
Received: from mitchelllevy.localdomain ([131.107.174.166])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f0f9bsm7223159b3a.104.2025.04.14.12.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 12:28:55 -0700 (PDT)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Mon, 14 Apr 2025 12:28:27 -0700
Subject: [PATCH RFC v2 1/3] rust: percpu: introduce a rust API for per-CPU
 variables
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-rust-percpu-v2-1-5ea0d0de13a5@gmail.com>
References: <20250414-rust-percpu-v2-0-5ea0d0de13a5@gmail.com>
In-Reply-To: <20250414-rust-percpu-v2-0-5ea0d0de13a5@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Christoph Lameter <cl@linux.com>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744658935; l=13401;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=nIqel8sF5aGOeh5Zf3p9yAVGtxyjMWnYFGuVyV7v7Ew=;
 b=vtj/4I/d40UsQeU/uI4V3EplUz1GsyP/yr1B8Vgqs8WIn8iPCtAwX4Vpq9mUNfcz8dklRhEtU
 Xg+yT3wyreEAwZwIxFAIz1oBDlHanTgy6ghc8aoRTddN/djbgBn0T3n
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

Add a CpuGuard type that disables preemption for its lifetime. Add a
PerCpuAllocation type used to track and, in the case of dynamic
allocations, create and free per-CPU allocations. Add a define_per_cpu!
macro to create static per-CPU allocations. Add a PerCpu type that
manages PerCpuAllocation's being used from multiple cores, and add a
PerCpuToken type used to assert exclusive access to a particular per-CPU
variable.

Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
 rust/helpers/helpers.c          |   2 +
 rust/helpers/percpu.c           |   9 ++
 rust/helpers/preempt.c          |  14 +++
 rust/kernel/lib.rs              |   3 +
 rust/kernel/percpu.rs           | 239 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/percpu/cpu_guard.rs |  29 +++++
 6 files changed, 296 insertions(+)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index e1c21eba9b15..cff605710f77 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -23,7 +23,9 @@
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
index de07aadd1ff5..dc88becdb338 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -67,6 +67,9 @@
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
index 000000000000..ecce8cdaa22a
--- /dev/null
+++ b/rust/kernel/percpu.rs
@@ -0,0 +1,239 @@
+// SPDX-License-Identifier: GPL-2.0
+//! This module contains abstractions for creating and using per-CPU variables from Rust.
+//! See the define_per_cpu! macro and the PerCpu<T> type.
+pub mod cpu_guard;
+
+use bindings::{alloc_percpu, free_percpu};
+
+use crate::percpu::cpu_guard::CpuGuard;
+use crate::prelude::*;
+use crate::sync::Arc;
+
+use core::arch::asm;
+use core::marker::PhantomData;
+
+use ffi::c_void;
+
+/// Represents an allocation of a per-CPU variable via alloc_percpu or a static per-CPU
+/// allocation. Calls free_percpu when dropped if not a static allocation.
+pub struct PerCpuAllocation<T> {
+    /// Offset into the per-CPU area: either the address of a statically-allocated per-CPU variable
+    /// or a "pointer" returned by alloc_percpu or similar.
+    offset: usize,
+    /// Whether `self` is statically allocated
+    is_static: bool,
+    /// PhantomData so the compiler doesn't complain about `T` being unused.
+    deref_type: PhantomData<T>,
+}
+
+/// Holds a per-CPU variable.
+pub struct PerCpu<T> {
+    alloc: Arc<PerCpuAllocation<T>>,
+}
+
+/// Represents exclusive access to the memory location pointed at by a particular PerCpu<T>.
+pub struct PerCpuToken<'a, T> {
+    _guard: CpuGuard,
+    pcpu: &'a mut PerCpu<T>,
+}
+
+/// A wrapper used for declaring static per-CPU variables. These symbols are "virtual" in that the
+/// linker uses them to generate offsets into each cpu's per-cpu area, but shouldn't be read
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
+impl<T> PerCpuAllocation<T> {
+    /// Dynamically allocates a space in the per-CPU area suitably sized and aligned to hold a `T`.
+    ///
+    /// Returns `None` under the same circumstances the C function `alloc_percpu` returns `NULL`.
+    pub fn new() -> Option<PerCpuAllocation<T>> {
+        // SAFETY: No preconditions to call alloc_percpu
+        let ptr: *mut c_void = unsafe { alloc_percpu(size_of::<T>(), align_of::<T>()) };
+        if ptr.is_null() {
+            return None;
+        }
+
+        Some(Self {
+            offset: ptr as usize,
+            is_static: false,
+            deref_type: PhantomData,
+        })
+    }
+
+    /// Convert a statically allocated per-CPU variable (via its offset, i.e., the address of the
+    /// declared symbol) into a `PerCpuAllocation`.
+    ///
+    /// # Safety
+    /// `offset` must be a valid offset into the per-CPU area that's suitably sized and aligned to
+    /// hold a `T`.
+    pub unsafe fn new_static(offset: usize) -> PerCpuAllocation<T> {
+        Self {
+            offset,
+            is_static: true,
+            deref_type: PhantomData,
+        }
+    }
+}
+
+impl<T> Drop for PerCpuAllocation<T> {
+    fn drop(&mut self) {
+        if !self.is_static {
+            // SAFETY: self.offset was returned by alloc_percpu, and so was a valid pointer into
+            // the percpu area, and has remained valid by the invariants of PerCpuAllocation<T>.
+            unsafe { free_percpu(self.offset as *mut c_void) }
+        }
+    }
+}
+
+impl<T> PerCpu<T> {
+    /// Allocates a new per-CPU variable
+    pub fn new() -> Option<Self> {
+        let alloc: PerCpuAllocation<T> = PerCpuAllocation::new()?;
+
+        let arc = Arc::new(alloc, GFP_KERNEL).ok()?;
+
+        Some(Self { alloc: arc })
+    }
+
+    /// Wraps a `PerCpuAllocation<T>` in a `PerCpu<T>`
+    pub fn new_from_allocation(alloc: PerCpuAllocation<T>) -> Option<Self> {
+        let arc = Arc::new(alloc, GFP_KERNEL).ok()?;
+        Some(Self { alloc: arc })
+    }
+
+    /// Creates a new PerCpu<T> pointing to the same underlying variable
+    pub fn clone(&self) -> Self {
+        Self {
+            alloc: self.alloc.clone(),
+        }
+    }
+
+    /// Get a `&mut T` to the per-CPU variable represented by `&mut self`
+    ///
+    /// # Safety
+    /// The returned `&mut T` must follow Rust's aliasing rules. That is, no other `&(mut) T` may
+    /// exist that points to the same location in memory. In practice, this means that any PerCpu
+    /// holding a reference to the same PerCpuAllocation as `self` mut not call `get_ref` for as
+    /// long as the returned reference lives.
+    unsafe fn get_ref(&mut self) -> &mut T {
+        // SAFETY: addr_of!(this_cpu_off) is guaranteed to be a valid per-CPU offset by the per-CPU
+        // subsystem
+        let this_cpu_off_pcpu: PerCpuAllocation<u64> =
+            unsafe { PerCpuAllocation::new_static(core::ptr::addr_of!(this_cpu_off) as usize) };
+        let mut this_cpu_area: *mut c_void;
+        // SAFETY: gs + this_cpu_off_pcpu.offset is guaranteed to be a valid pointer because `gs`
+        // points to the per-CPU area and this_cpu_off_pcpu is a valid per-CPU allocation.
+        unsafe {
+            asm!(
+                // For some reason, the asm! parser doesn't like
+                //     mov {out}, [gs:{off_val}]
+                // so we use the less intuitive prefix version instead
+                "gs mov {out}, [{off_val}]",
+                off_val = in(reg) this_cpu_off_pcpu.offset,
+                out = out(reg) this_cpu_area,
+            )
+        };
+        // SAFETY: this_cpu_area + self.alloc.offset is guaranteed to be a valid pointer by the
+        // per-CPU subsystem and the invariant that self.offset is a valid offset into the per-CPU
+        // area.
+        //
+        // We have exclusive access to self via &mut self, so we know no-one else has a reference
+        // to the underlying pcpu variable because of the safety requirements of this function.
+        unsafe { &mut *((this_cpu_area.add(self.alloc.offset)) as *mut T) }
+    }
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
+    pub unsafe fn get(&mut self, guard: CpuGuard) -> PerCpuToken<'_, T> {
+        PerCpuToken {
+            _guard: guard,
+            pcpu: self,
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
+        func(unsafe { self.pcpu.get_ref() });
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
+/// # Safety
+/// `$id` must be declared with either `define_per_cpu!` or `declare_extern_per_cpu!`, and the
+/// returned value must be stored in a `PerCpu<T>` where `T` matches the declared type of `$id`.
+#[macro_export]
+macro_rules! unsafe_get_per_cpu {
+    ($id:ident, $guard:expr) => {{
+        let off = core::ptr::addr_of!($id);
+        $crate::percpu::PerCpu::new_from_allocation($crate::percpu::PerCpuAllocation::new_static(
+            off as usize,
+        ))
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
index 000000000000..6f7d320a5c9a
--- /dev/null
+++ b/rust/kernel/percpu/cpu_guard.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+//! Contains abstractions for disabling CPU preemption. See CpuGuard.
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

