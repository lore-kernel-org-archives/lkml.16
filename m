Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF550254AF0
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749466289; cv=none; b=hYFfYxDPHJQ9thux0NycbJt5xM91/3jRDzLsElkm0fsb3Om6QbcwHEjMX61/mJgUQP7Js9hqCFqFwcUPwCQFcaDH3UDpr9JZE63vOTW6Zel2c4qC3wSC059rMwImv/StgIf6pwCAg+NXcNn50AuS+Zxp41pRqTeVZJBVxx+cFQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749466289; c=relaxed/simple;
	bh=vAskjpcH6vhWvyjCt+ZEhpMlamDmGUA5e29hvqCXjn8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jTSBMrJaDictEgybDu2t9qxHftO5QBKHuGfAf0xICDU0X1XhQ3bM0BtVwViNvEyYVllswtvT5cEiOtld5oxyn+1nC+CS/oFNQCkuKX9VYLxON0PT6fENAa078R1bHqi3/GJhZFR8hzFoJA2DLulo+NlLpGqj9VrHD+ve8VEJdTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HM1pz/Jq; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HM1pz/Jq"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b2f1032e1c4so3852468a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 03:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749466287; x=1750071087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuJVGUTIF3T1jhhXzS1OPftMs4dFph12eMR9dmfddLo=;
        b=HM1pz/JqFD34hUkNs9KAfv8Wp5AaueM238vC3jBBLhJzireguYxP0LyQJyc0AWzSmM
         8iC8xQ6gixr21Nb+hci6ua2qFrVfGKoCaQcSr5+4FKpCj6CgS2jCRV5oq/3L538LFmxY
         PkT5QYd/RYYvM/kCGU4DF9tw7umzwZUxiyRFWEHNHxg5/LmJfsDcRQnr6dQq3sDud5gS
         tyhoH0721SnbegN6oSBQ0+HjrlhQ6X3DjdtqqzYVj6Z87TvX5MS4F8Eg9xGSTcUoQqBB
         gC0y0G87V+xf2aIx4twvjW2ILV4x0jyJU0fJofRPVoqHtQJJyXkWY9CrRuwZdJXMeJ00
         abng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749466287; x=1750071087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuJVGUTIF3T1jhhXzS1OPftMs4dFph12eMR9dmfddLo=;
        b=h4Unlay2NFiBY445nxz//Vh16i+mMS9ST04wW3jaBbSgAUwgemNpsu6wPIk+AuSC9N
         oc+wmsLt708YJs0B6jPA+vT6HHoU6Wps28mrlWAPym8y+D4Lg0/LtdHlnzlma0Mt0slj
         o7/ziTL2oBMgUK9YyA8Es7dwAZAEy2UI4+oWqcFN2F772Td7k2VEzake+3uMwLrzq53o
         57b6cp1qQqN4I52lqzkI44wl1iFyHt9VG0gkfF+gWU6CyPVmeTjXDky93lX7xI3bOgsB
         MbMj136Wd8ziHUmNUBQjUUmScitYqz8lutBtvzqFdGnc1j0bRi7IIwVOgFfFtVIOXRU6
         p8mw==
X-Forwarded-Encrypted: i=1; AJvYcCUXZyXTVQRiXgpN+u4HS7eG4Jn1SxuLoJEE0Jb9OO1lDn27axmjthkdGK+egRx2Psb7Xpvc1g0Ohgrav8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKSbaq4gB/4gfMzdGidQIcmkdcGJD2wwe5i0veT01bbc7tjyOS
	SfNpMaVr4jQo6rJSvDEp0Ml5eb5VI3jmiAz0RMNwHydAfwAg3Lq1nSWGjex30ybsKnU=
X-Gm-Gg: ASbGncsos9tm25tYGCj/tB/0lsMaR0MhtYizfMduzGigwm5jxWIZ6L4A0avDooBRtep
	emLXJFRuTVQqZer+Mh+yu+RhSl8SofnGy5WxBZbmEGXqNQxlbZW04EX97ekS8ed+Xyaqd2iCk+k
	BbY4zfh7gMdsf8xe9zZ+bZrGx/EnM46khzuswWtv9OOCv8Z51D9iAekiPD9cVkKmqav/3UYGTrd
	qaxMW5wEhbGOtR9tRWYt7OaFGaRrDKB5Jj8UQL1mj38l5P7JtkKmc8LUNgbsBFO1jCdKv0tHA32
	91GH5NJzgNIpcdzZ18d+ywI+hyJ3inPiVt1cTV8FGyLdapJHa2uWGkHP7Xy9q+U=
X-Google-Smtp-Source: AGHT+IFtddb8Pk9oUlMiGk2PgHCrKtzyED4YhZOR2BDPpcARAojukNT+Ds8TpBuI/KoJwfjdjeGaCQ==
X-Received: by 2002:a17:90b:58d0:b0:311:df4b:4b94 with SMTP id 98e67ed59e1d1-313472c4cf2mr22335820a91.4.1749466287046;
        Mon, 09 Jun 2025 03:51:27 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349f352b0sm5434927a91.18.2025.06.09.03.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:51:26 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Boqun Feng <boqun.feng@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Yury Norov <yury.norov@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/2] rust: Use CpuId in place of raw CPU numbers
Date: Mon,  9 Jun 2025 16:21:06 +0530
Message-Id: <8d9bcd481f58eaf8aabc15408971264a5b18172e.1749463570.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1749463570.git.viresh.kumar@linaro.org>
References: <cover.1749463570.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use the newly defined `CpuId` abstraction instead of raw CPU numbers.

This also fixes a doctest failure for configurations where `nr_cpu_ids <
4`.

The C `cpumask_{set|clear}_cpu()` APIs emit a warning when given an
invalid CPU number — but only if `CONFIG_DEBUG_PER_CPU_MAPS=y` is set.

Meanwhile, `cpumask_weight()` only considers CPUs up to `nr_cpu_ids`,
which can cause inconsistencies: a CPU number greater than `nr_cpu_ids`
may be set in the mask, yet the weight calculation won't reflect it.

This leads to doctest failures when `nr_cpu_ids < 4`, as the test tries
to set CPUs 2 and 3:

  rust_doctest_kernel_cpumask_rs_0.location: rust/kernel/cpumask.rs:180
  rust_doctest_kernel_cpumask_rs_0: ASSERTION FAILED at rust/kernel/cpumask.rs:190

Fixes: 8961b8cb3099 ("rust: cpumask: Add initial abstractions")
Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://lore.kernel.org/rust-for-linux/CANiq72k3ozKkLMinTLQwvkyg9K=BeRxs1oYZSKhJHY-veEyZdg@mail.gmail.com/
Reported-by: Andreas Hindborg <a.hindborg@kernel.org>
Closes: https://lore.kernel.org/all/87qzzy3ric.fsf@kernel.org/
Suggested-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/rcpufreq_dt.rs |  4 +--
 rust/kernel/cpu.rs             |  4 +--
 rust/kernel/cpufreq.rs         | 27 ++++++++++++------
 rust/kernel/cpumask.rs         | 51 ++++++++++++++++++++++++----------
 4 files changed, 59 insertions(+), 27 deletions(-)

diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
index 94ed81644fe1..43c87d0259b6 100644
--- a/drivers/cpufreq/rcpufreq_dt.rs
+++ b/drivers/cpufreq/rcpufreq_dt.rs
@@ -26,9 +26,9 @@ fn find_supply_name_exact(dev: &Device, name: &str) -> Option<CString> {
 }
 
 /// Finds supply name for the CPU from DT.
-fn find_supply_names(dev: &Device, cpu: u32) -> Option<KVec<CString>> {
+fn find_supply_names(dev: &Device, cpu: cpu::CpuId) -> Option<KVec<CString>> {
     // Try "cpu0" for older DTs, fallback to "cpu".
-    let name = (cpu == 0)
+    let name = (cpu.as_u32() == 0)
         .then(|| find_supply_name_exact(dev, "cpu0"))
         .flatten()
         .or_else(|| find_supply_name_exact(dev, "cpu"))?;
diff --git a/rust/kernel/cpu.rs b/rust/kernel/cpu.rs
index 0b545dbf5c83..da53f04da495 100644
--- a/rust/kernel/cpu.rs
+++ b/rust/kernel/cpu.rs
@@ -119,9 +119,9 @@ fn from(id: CpuId) -> Self {
 /// Callers must ensure that the CPU device is not used after it has been unregistered.
 /// This can be achieved, for example, by registering a CPU hotplug notifier and removing
 /// any references to the CPU device within the notifier's callback.
-pub unsafe fn from_cpu(cpu: u32) -> Result<&'static Device> {
+pub unsafe fn from_cpu(cpu: CpuId) -> Result<&'static Device> {
     // SAFETY: It is safe to call `get_cpu_device()` for any CPU.
-    let ptr = unsafe { bindings::get_cpu_device(cpu) };
+    let ptr = unsafe { bindings::get_cpu_device(cpu.into()) };
     if ptr.is_null() {
         return Err(ENODEV);
     }
diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index b0a9c6182aec..1cb9c6c8cd4b 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -10,6 +10,7 @@
 
 use crate::{
     clk::Hertz,
+    cpu::CpuId,
     cpumask,
     device::{Bound, Device},
     devres::Devres,
@@ -465,8 +466,9 @@ fn as_mut_ref(&mut self) -> &mut bindings::cpufreq_policy {
 
     /// Returns the primary CPU for the [`Policy`].
     #[inline]
-    pub fn cpu(&self) -> u32 {
-        self.as_ref().cpu
+    pub fn cpu(&self) -> CpuId {
+        // SAFETY: The C API guarantees that `cpu` refers to a valid CPU number.
+        unsafe { CpuId::from_u32_unchecked(self.as_ref().cpu) }
     }
 
     /// Returns the minimum frequency for the [`Policy`].
@@ -525,7 +527,7 @@ pub fn generic_suspend(&mut self) -> Result {
     #[inline]
     pub fn generic_get(&self) -> Result<u32> {
         // SAFETY: By the type invariant, the pointer stored in `self` is valid.
-        Ok(unsafe { bindings::cpufreq_generic_get(self.cpu()) })
+        Ok(unsafe { bindings::cpufreq_generic_get(self.cpu().into()) })
     }
 
     /// Provides a wrapper to the register with energy model using the OPP core.
@@ -678,9 +680,9 @@ fn clear_data<T: ForeignOwnable>(&mut self) -> Option<T> {
 struct PolicyCpu<'a>(&'a mut Policy);
 
 impl<'a> PolicyCpu<'a> {
-    fn from_cpu(cpu: u32) -> Result<Self> {
+    fn from_cpu(cpu: CpuId) -> Result<Self> {
         // SAFETY: It is safe to call `cpufreq_cpu_get` for any valid CPU.
-        let ptr = from_err_ptr(unsafe { bindings::cpufreq_cpu_get(cpu) })?;
+        let ptr = from_err_ptr(unsafe { bindings::cpufreq_cpu_get(cpu.into()) })?;
 
         Ok(Self(
             // SAFETY: The `ptr` is guaranteed to be valid and remains valid for the lifetime of
@@ -1218,7 +1220,10 @@ extern "C" fn adjust_perf_callback(
         target_perf: usize,
         capacity: usize,
     ) {
-        if let Ok(mut policy) = PolicyCpu::from_cpu(cpu) {
+        // SAFETY: The C API guarantees that `cpu` refers to a valid CPU number.
+        let cpu_id = unsafe { CpuId::from_u32_unchecked(cpu) };
+
+        if let Ok(mut policy) = PolicyCpu::from_cpu(cpu_id) {
             T::adjust_perf(&mut policy, min_perf, target_perf, capacity);
         }
     }
@@ -1263,7 +1268,10 @@ extern "C" fn target_intermediate_callback(
 
     /// Driver's `get` callback.
     extern "C" fn get_callback(cpu: u32) -> kernel::ffi::c_uint {
-        PolicyCpu::from_cpu(cpu).map_or(0, |mut policy| T::get(&mut policy).map_or(0, |f| f))
+        // SAFETY: The C API guarantees that `cpu` refers to a valid CPU number.
+        let cpu_id = unsafe { CpuId::from_u32_unchecked(cpu) };
+
+        PolicyCpu::from_cpu(cpu_id).map_or(0, |mut policy| T::get(&mut policy).map_or(0, |f| f))
     }
 
     /// Driver's `update_limit` callback.
@@ -1278,8 +1286,11 @@ extern "C" fn update_limits_callback(ptr: *mut bindings::cpufreq_policy) {
     ///
     /// SAFETY: Called from C. Inputs must be valid pointers.
     extern "C" fn bios_limit_callback(cpu: i32, limit: *mut u32) -> kernel::ffi::c_int {
+        // SAFETY: The C API guarantees that `cpu` refers to a valid CPU number.
+        let cpu_id = unsafe { CpuId::from_i32_unchecked(cpu) };
+
         from_result(|| {
-            let mut policy = PolicyCpu::from_cpu(cpu as u32)?;
+            let mut policy = PolicyCpu::from_cpu(cpu_id)?;
 
             // SAFETY: `limit` is guaranteed by the C code to be valid.
             T::bios_limit(&mut policy, &mut (unsafe { *limit })).map(|()| 0)
diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
index c90bfac9346a..11ddd43edcb5 100644
--- a/rust/kernel/cpumask.rs
+++ b/rust/kernel/cpumask.rs
@@ -6,6 +6,7 @@
 
 use crate::{
     alloc::{AllocError, Flags},
+    cpu::CpuId,
     prelude::*,
     types::Opaque,
 };
@@ -35,9 +36,10 @@
 ///
 /// ```
 /// use kernel::bindings;
+/// use kernel::cpu::CpuId;
 /// use kernel::cpumask::Cpumask;
 ///
-/// fn set_clear_cpu(ptr: *mut bindings::cpumask, set_cpu: u32, clear_cpu: i32) {
+/// fn set_clear_cpu(ptr: *mut bindings::cpumask, set_cpu: CpuId, clear_cpu: CpuId) {
 ///     // SAFETY: The `ptr` is valid for writing and remains valid for the lifetime of the
 ///     // returned reference.
 ///     let mask = unsafe { Cpumask::as_mut_ref(ptr) };
@@ -90,9 +92,9 @@ pub fn as_raw(&self) -> *mut bindings::cpumask {
     /// This mismatches kernel naming convention and corresponds to the C
     /// function `__cpumask_set_cpu()`.
     #[inline]
-    pub fn set(&mut self, cpu: u32) {
+    pub fn set(&mut self, cpu: CpuId) {
         // SAFETY: By the type invariant, `self.as_raw` is a valid argument to `__cpumask_set_cpu`.
-        unsafe { bindings::__cpumask_set_cpu(cpu, self.as_raw()) };
+        unsafe { bindings::__cpumask_set_cpu(cpu.into(), self.as_raw()) };
     }
 
     /// Clear `cpu` in the cpumask.
@@ -101,19 +103,19 @@ pub fn set(&mut self, cpu: u32) {
     /// This mismatches kernel naming convention and corresponds to the C
     /// function `__cpumask_clear_cpu()`.
     #[inline]
-    pub fn clear(&mut self, cpu: i32) {
+    pub fn clear(&mut self, cpu: CpuId) {
         // SAFETY: By the type invariant, `self.as_raw` is a valid argument to
         // `__cpumask_clear_cpu`.
-        unsafe { bindings::__cpumask_clear_cpu(cpu, self.as_raw()) };
+        unsafe { bindings::__cpumask_clear_cpu(cpu.into(), self.as_raw()) };
     }
 
     /// Test `cpu` in the cpumask.
     ///
     /// Equivalent to the kernel's `cpumask_test_cpu` API.
     #[inline]
-    pub fn test(&self, cpu: i32) -> bool {
+    pub fn test(&self, cpu: CpuId) -> bool {
         // SAFETY: By the type invariant, `self.as_raw` is a valid argument to `cpumask_test_cpu`.
-        unsafe { bindings::cpumask_test_cpu(cpu, self.as_raw()) }
+        unsafe { bindings::cpumask_test_cpu(cpu.into(), self.as_raw()) }
     }
 
     /// Set all CPUs in the cpumask.
@@ -178,21 +180,40 @@ pub fn copy(&self, dstp: &mut Self) {
 /// The following example demonstrates how to create and update a [`CpumaskVar`].
 ///
 /// ```
+/// use kernel::cpu::CpuId;
 /// use kernel::cpumask::CpumaskVar;
 ///
 /// let mut mask = CpumaskVar::new_zero(GFP_KERNEL).unwrap();
 ///
 /// assert!(mask.empty());
-/// mask.set(2);
-/// assert!(mask.test(2));
-/// mask.set(3);
-/// assert!(mask.test(3));
-/// assert_eq!(mask.weight(), 2);
+/// let mut count = 0;
+///
+/// let cpu2 = CpuId::from_u32(2);
+/// if let Some(cpu) = cpu2 {
+///     mask.set(cpu);
+///     assert!(mask.test(cpu));
+///     count += 1;
+/// }
+///
+/// let cpu3 = CpuId::from_u32(3);
+/// if let Some(cpu) = cpu3 {
+///     mask.set(cpu);
+///     assert!(mask.test(cpu));
+///     count += 1;
+/// }
+///
+/// assert_eq!(mask.weight(), count);
 ///
 /// let mask2 = CpumaskVar::try_clone(&mask).unwrap();
-/// assert!(mask2.test(2));
-/// assert!(mask2.test(3));
-/// assert_eq!(mask2.weight(), 2);
+///
+/// if let Some(cpu) = cpu2 {
+///     assert!(mask2.test(cpu));
+/// }
+///
+/// if let Some(cpu) = cpu3 {
+///     assert!(mask2.test(cpu));
+/// }
+/// assert_eq!(mask2.weight(), count);
 /// ```
 pub struct CpumaskVar {
     #[cfg(CONFIG_CPUMASK_OFFSTACK)]
-- 
2.31.1.272.g89b43f80a514

