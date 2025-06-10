Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C34322A4CC;
	Tue, 10 Jun 2025 15:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749568702; cv=none; b=Hrjy7xJQdbsjgU9hm8v+CZoG0HMtkMEj3dDa7Y9FRZXa1JMLQpzQNF9NjrdCn767zr1ZdoFht9tZYcdywl1q+ffNGd7AfnZKMMLlnETVDcqARjR/lu/WBEWiPS3C1QXqDVbAijwlbnHqUhsQ1TmZnRUNn+GIo8lsmnKGeQM6wZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749568702; c=relaxed/simple;
	bh=OKdKK12Iq422U1/f3KpZ9kmapPOtIkN5J87lwnhRmRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Cksgcq9FpVct1SffyNI+bJi/EGuLIQHk6mmrtyHMti8yZJ2irAIrLEra9oCIcDI6nyA572ZeWx7Vk2IT50N8jI1BfLWwwKmBdjTDZ29LDVHh2iy1oQA/5m9q68GjVRXnufT0m39Zc1YcCZy6omaSl0pjrvfVTa1tuxYol1Lc2y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfuY8ddk; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfuY8ddk"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3292aad800aso55817491fa.0;
        Tue, 10 Jun 2025 08:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749568698; x=1750173498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kkIN98kkjc/rusmJx4gySWmf+VhEEgW8XhFdLMsrBE0=;
        b=OfuY8ddkX7ycCO7Ky3n+q0yRqJVwPBpS4Zw7DOMbVgoMKeJMhRK5hiPvhFqSznw8jO
         ts6Oi1kuScWQCkzdoMAWp1fuMnmN1WqBmB9goen/sd+DYyDomEDFc5kSzuiA4me69QY4
         CUWqr/d8kDE+4im5DPQVNxxpJG6q8RGwp5XNOdjMB+6s3GyikpsxCAedxM7umjTwxCBC
         8UiJyNR641CQmPRQA9mEmJaL5/weafSsjS0u6pwkrPrTjM96gUcSaOhZMzuMR7A7P4Id
         D3NzXfdNB/zc7sHf0JjD9kjK//vlRKuB8ir4sT7yN1isIQ0uAkwHYi6u3OMqbgft5OPt
         D08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749568698; x=1750173498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kkIN98kkjc/rusmJx4gySWmf+VhEEgW8XhFdLMsrBE0=;
        b=fvu+3Jb+9CI/pezwjfGChl+erVh+74yeps8KmZgpSGyMoGd36f6UYa+IJLOha5hL3R
         HuZmZu1ZenFOZqDqFD8gHX+zHyVlmnExcbetsDxhDIa0pgATiP0QjyMsF/RfsCTyzrr/
         C99FKnw3BHUUYCLvuDWJQRp2xiYVj2Ik6kjzFyrt8DKZF8tMUqeypALg7zhA2jCZ1/yT
         BjkseK+YZgd4LgSzmpALelvD8LD+rwUXc0y9fHOGDNnAxMaSo5urvNGeVmA+9EIltqBO
         NQFnt2mePXeS+n7Un1GzE/Om/QrUpUcNI/69+T5nW8VrGnKIDMGf/GFwkRPxQkHmpFyH
         dawA==
X-Forwarded-Encrypted: i=1; AJvYcCVoEs5APnZ9+zNdbcKPwiEaBdfxd2BBBP0vOPAwRD1jWRK3vFiblBWoWhD9/zaY1/WAfJLT+GXMpvuk+oY=@vger.kernel.org, AJvYcCX1FPV9qNd/yzylwxMlaOlbZ+zu85I3yLUpA78pka/urCBTSq0q2mEsZ0rT7OPnpRy8dFF+VEiQWy6q7V2U7AQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOk0w7OwyC2huRw0FIk6yhFkrMk+KyJ3AWC7KtNQyYjhLDhcxW
	r31yDtYEPz0sVikKbtgYCpWiB6vFDhz5QLkslz123gjcrKj0bmfV9zLDhlfDz79u
X-Gm-Gg: ASbGncs+W/6eLko0FxShMzqaoGzVjFE7NxCqSvafizMZs8BDTxRkTVhM+22Yk0EKViL
	WZvDZBOvHKIOpgsDhgJNa03ormzyanjd0D9Z46lKtwz8k8Jyg5KOZK2cTjuNnV1ykuCc2GPYpmi
	4EUpNClkuK4gofqxzSErVkfVeieVcYXXSptO4YLdC6iGBTmTdYnxVAI21NDAcU1WzL7SeNGWGER
	3gjRM1AIz/nwlkuiejfkdEqO01MYPOXtVg+6J1lp5KrkRSSyGFQS5argtmVo0/oAlD9sTPe6vsG
	Eb2xa/p3CAa0ZAlWABOSCMIHVy7xEVd0ohONcTQn8HbQgc7FTCIv9GJxS5WBdGel+MdxX4y34H1
	S+X9qcO8YJfDsWSJGghnDs0Iqaul30JW6MHGxd/zUw3MVUb3JDQJ1sQ==
X-Google-Smtp-Source: AGHT+IHFstzegUCu3unNRoyjx6xH2EWT5QGEdOnhTn0NWFMHzCdU63lOrpQBWfJQFi0HeyCGkJ2rQA==
X-Received: by 2002:a17:907:3eaa:b0:ad2:27b1:7214 with SMTP id a640c23a62f3a-ade771c4846mr386662266b.17.1749568687596;
        Tue, 10 Jun 2025 08:18:07 -0700 (PDT)
Received: from olsa.tail3379.ts.net (h-85-24-244-168.A980.priv.bahnhof.se. [85.24.244.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade31cc25b7sm665901266b.66.2025.06.10.08.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 08:18:07 -0700 (PDT)
From: =?UTF-8?q?Oliver=20S=C3=A4fstr=C3=B6m?= <safstrom.oliver@gmail.com>
To: rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Oliver=20S=C3=A4fstr=C3=B6m?= <safstrom.oliver@gmail.com>
Subject: [PATCH] docs: rust: Refactor safety lines docs to sections in cpufreq.rs
Date: Tue, 10 Jun 2025 17:17:50 +0200
Message-ID: <20250610151750.46314-1-safstrom.oliver@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Closes: https://github.com/Rust-for-Linux/linux/issues/1169

Signed-off-by: Oliver Säfström <safstrom.oliver@gmail.com>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/cpufreq.rs | 76 +++++++++++++++++++++++++++++++-----------
 1 file changed, 57 insertions(+), 19 deletions(-)

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index b0a9c6182aec..685442135c39 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -901,12 +901,16 @@ fn register_em(_policy: &mut Policy) {
 #[repr(transparent)]
 pub struct Registration<T: Driver>(KBox<UnsafeCell<bindings::cpufreq_driver>>, PhantomData<T>);
 
-/// SAFETY: `Registration` doesn't offer any methods or access to fields when shared between threads
+/// # Safety
+///
+/// `Registration` doesn't offer any methods or access to fields when shared between threads
 /// or CPUs, so it is safe to share it.
 unsafe impl<T: Driver> Sync for Registration<T> {}
 
 #[allow(clippy::non_send_fields_in_send_ty)]
-/// SAFETY: Registration with and unregistration from the cpufreq subsystem can happen from any
+/// # Safety
+///
+/// Registration with and unregistration from the cpufreq subsystem can happen from any
 /// thread.
 unsafe impl<T: Driver> Send for Registration<T> {}
 
@@ -1055,7 +1059,9 @@ pub fn new_foreign_owned(dev: &Device<Bound>) -> Result {
 impl<T: Driver> Registration<T> {
     /// Driver's `init` callback.
     ///
-    /// SAFETY: Called from C. Inputs must be valid pointers.
+    /// # Safety
+    ///
+    /// Called from C. Inputs must be valid pointers.
     extern "C" fn init_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
@@ -1070,7 +1076,9 @@ extern "C" fn init_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::
 
     /// Driver's `exit` callback.
     ///
-    /// SAFETY: Called from C. Inputs must be valid pointers.
+    /// # Safety
+    ///
+    /// Called from C. Inputs must be valid pointers.
     extern "C" fn exit_callback(ptr: *mut bindings::cpufreq_policy) {
         // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
         // lifetime of `policy`.
@@ -1082,7 +1090,9 @@ extern "C" fn exit_callback(ptr: *mut bindings::cpufreq_policy) {
 
     /// Driver's `online` callback.
     ///
-    /// SAFETY: Called from C. Inputs must be valid pointers.
+    /// # Safety
+    ///
+    /// Called from C. Inputs must be valid pointers.
     extern "C" fn online_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
@@ -1094,7 +1104,9 @@ extern "C" fn online_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi
 
     /// Driver's `offline` callback.
     ///
-    /// SAFETY: Called from C. Inputs must be valid pointers.
+    /// # Safety
+    ///
+    /// Called from C. Inputs must be valid pointers.
     extern "C" fn offline_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
@@ -1106,7 +1118,9 @@ extern "C" fn offline_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ff
 
     /// Driver's `suspend` callback.
     ///
-    /// SAFETY: Called from C. Inputs must be valid pointers.
+    /// # Safety
+    ///
+    /// Called from C. Inputs must be valid pointers.
     extern "C" fn suspend_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
@@ -1118,7 +1132,9 @@ extern "C" fn suspend_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ff
 
     /// Driver's `resume` callback.
     ///
-    /// SAFETY: Called from C. Inputs must be valid pointers.
+    /// # Safety
+    ///
+    /// Called from C. Inputs must be valid pointers.
     extern "C" fn resume_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
@@ -1130,7 +1146,9 @@ extern "C" fn resume_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi
 
     /// Driver's `ready` callback.
     ///
-    /// SAFETY: Called from C. Inputs must be valid pointers.
+    /// # Safety
+    ///
+    /// Called from C. Inputs must be valid pointers.
     extern "C" fn ready_callback(ptr: *mut bindings::cpufreq_policy) {
         // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
         // lifetime of `policy`.
@@ -1140,7 +1158,9 @@ extern "C" fn ready_callback(ptr: *mut bindings::cpufreq_policy) {
 
     /// Driver's `verify` callback.
     ///
-    /// SAFETY: Called from C. Inputs must be valid pointers.
+    /// # Safety
+    ///
+    /// Called from C. Inputs must be valid pointers.
     extern "C" fn verify_callback(ptr: *mut bindings::cpufreq_policy_data) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
@@ -1152,7 +1172,9 @@ extern "C" fn verify_callback(ptr: *mut bindings::cpufreq_policy_data) -> kernel
 
     /// Driver's `setpolicy` callback.
     ///
-    /// SAFETY: Called from C. Inputs must be valid pointers.
+    /// # Safety
+    ///
+    /// Called from C. Inputs must be valid pointers.
     extern "C" fn setpolicy_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
@@ -1164,7 +1186,9 @@ extern "C" fn setpolicy_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::
 
     /// Driver's `target` callback.
     ///
-    /// SAFETY: Called from C. Inputs must be valid pointers.
+    /// # Safety
+    ///
+    /// Called from C. Inputs must be valid pointers.
     extern "C" fn target_callback(
         ptr: *mut bindings::cpufreq_policy,
         target_freq: u32,
@@ -1180,7 +1204,9 @@ extern "C" fn target_callback(
 
     /// Driver's `target_index` callback.
     ///
-    /// SAFETY: Called from C. Inputs must be valid pointers.
+    /// # Safety
+    ///
+    /// Called from C. Inputs must be valid pointers.
     extern "C" fn target_index_callback(
         ptr: *mut bindings::cpufreq_policy,
         index: u32,
@@ -1200,7 +1226,9 @@ extern "C" fn target_index_callback(
 
     /// Driver's `fast_switch` callback.
     ///
-    /// SAFETY: Called from C. Inputs must be valid pointers.
+    /// # Safety
+    ///
+    /// Called from C. Inputs must be valid pointers.
     extern "C" fn fast_switch_callback(
         ptr: *mut bindings::cpufreq_policy,
         target_freq: u32,
@@ -1225,7 +1253,9 @@ extern "C" fn adjust_perf_callback(
 
     /// Driver's `get_intermediate` callback.
     ///
-    /// SAFETY: Called from C. Inputs must be valid pointers.
+    /// # Safety
+    ///
+    /// Called from C. Inputs must be valid pointers.
     extern "C" fn get_intermediate_callback(
         ptr: *mut bindings::cpufreq_policy,
         index: u32,
@@ -1243,7 +1273,9 @@ extern "C" fn get_intermediate_callback(
 
     /// Driver's `target_intermediate` callback.
     ///
-    /// SAFETY: Called from C. Inputs must be valid pointers.
+    /// # Safety
+    ///
+    /// Called from C. Inputs must be valid pointers.
     extern "C" fn target_intermediate_callback(
         ptr: *mut bindings::cpufreq_policy,
         index: u32,
@@ -1276,7 +1308,9 @@ extern "C" fn update_limits_callback(ptr: *mut bindings::cpufreq_policy) {
 
     /// Driver's `bios_limit` callback.
     ///
-    /// SAFETY: Called from C. Inputs must be valid pointers.
+    /// # Safety
+    ///
+    /// Called from C. Inputs must be valid pointers.
     extern "C" fn bios_limit_callback(cpu: i32, limit: *mut u32) -> kernel::ffi::c_int {
         from_result(|| {
             let mut policy = PolicyCpu::from_cpu(cpu as u32)?;
@@ -1288,7 +1322,9 @@ extern "C" fn bios_limit_callback(cpu: i32, limit: *mut u32) -> kernel::ffi::c_i
 
     /// Driver's `set_boost` callback.
     ///
-    /// SAFETY: Called from C. Inputs must be valid pointers.
+    /// # Safety
+    ///
+    /// Called from C. Inputs must be valid pointers.
     extern "C" fn set_boost_callback(
         ptr: *mut bindings::cpufreq_policy,
         state: i32,
@@ -1303,7 +1339,9 @@ extern "C" fn set_boost_callback(
 
     /// Driver's `register_em` callback.
     ///
-    /// SAFETY: Called from C. Inputs must be valid pointers.
+    /// # Safety
+    ///
+    /// Called from C. Inputs must be valid pointers.
     extern "C" fn register_em_callback(ptr: *mut bindings::cpufreq_policy) {
         // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
         // lifetime of `policy`.
-- 
2.49.0

