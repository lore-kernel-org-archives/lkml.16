Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A59C187325
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919739; cv=none; b=OezRqviVJX1w0Wz9aQEExe0UlpCK76fQ5TEBVdLktlc3SlRew0OLZniAKQI4zWj2VS+vuzLSVnI2rz/X9zm0OgY5VZBRCoMZRdG6L81qIWgzqU2wxlvvLXBx367jCKVW+ruySi92Sbxk9vAv+Aocidr1urZt8whZF65gXYVV6r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919739; c=relaxed/simple;
	bh=458iOFvq7Sw7Xp2eVd2m3pBsra90zKwhTqH9KKaMjhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1VgTTVDvxYI9YhwLnLBt89iD3pDjRijZGcOGYSRcEavVXuGBlQXnLatVOOuVdTSdrKFDr7wUJiRzDW/GbXd5lH1U7KfI89OEAiGUri4Wf4p99hdXANxsZ4XJbYWOQndEqCnIrOH74KB+zw6/oq8Jp6wNC1ozk3MEHo6oa2OL50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RwJHZuuS; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RwJHZuuS"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2165448243fso45186105ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 01:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738919736; x=1739524536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y6GmwcslnSEGvLzcQU6pzFmhbTAn++zvtR1wPcCp22o=;
        b=RwJHZuuSe8DWXQvyW36j+/OqVOxYgI1iRvNhvxagS1X8xd1nejx0JOnCbjVeCqkfwi
         jagFGIivtHVEoi14OoLaXwMmoZRLaFQyKVs/CjdbV7JhdQw6eOrw6ad6bUzLkmFZWb9J
         E44d8ZlcsH1OtdRLioHU2veaL8cnXKbknaDzWZ2D7LDQ2yA5faHVOcjIHmAgrVIJ5FzQ
         Qx/SMJgye9h2jafLUIhu3VUn7+YM8A+5eJnDvN3TJ+uSRac9KzNbl7PPEK89Dp1SFMVK
         0YCclFBJL1i6L3JeY5gDuRpLIWbvKfyS5OM4wZaVKqNtlIWrqCCjyAnlIyeRXoNyepUs
         uK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738919736; x=1739524536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6GmwcslnSEGvLzcQU6pzFmhbTAn++zvtR1wPcCp22o=;
        b=V/N3jJWsn3WCXp/Wvy2t0rjGq0jOw6j9n8mHYJDcQv0qsZVQS5UmZ8b8Ahmu7ltdf6
         R0WHFFb0rOBr3RpGZyBTWW/DOWYh/pDN9M3rt1lS3syh9OJYXjcYrwMngNp+bESx2V8z
         tvchqRP61x7sbUzH21bK5olgnu+gkTCeG7cnDHgHi6DSSuWhF1hvT78ijxdPW2YCI13/
         k5rS8+jchbK7htW5p9grhv4ZKUjmYQ4SW96vC6j3IiotC2qE2YLAmKX+psKxWIm6nEXL
         n887LK/PI6IH/ryW0CnXagmxTxi0YdOXtnvKs/HiJZtgMqzvYJOFrNp8vcWVWD8VgJav
         BglQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8Py/y54ZJCr1i8hHON/OQgVrbCQiVG+1JTIdTPp0INQRndV6uhZ9AtFZMLUPBkFm8fV/G1hT3IZIE0kE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9V1//EnjokvNNKRsWwQTfI8DUk3bd4KB1jcgRhuiRPlLMgnOR
	gnzQ0097OXO/1C/Ac2VHyOLO4jU1sRrCYaW1pXhcJ+tOQTZpp70G3wKYiRtxQPQ=
X-Gm-Gg: ASbGncs7kpffxzOUgimnTVJ9zKo0ArK5pB6ZQS6IyTLTeT/F5mDqqzH0h7DPuKvSQfY
	KgqkKd29OqYAttdJDb1FATQQg3N6mykA2QKlkwk9nOdSrBT+tqE3dtviYPQxFV8iN3t8FStMQqf
	1FmyKtbra7y+xxAlmmVaonHj16jXQPbKLotsvCu5kNJFTDZheAZEzcjy//e8U9dN2KHJqk0J88/
	UNoWg9XNaiCaruh5c7pggfmnLnt0yEpnNMoizLhHXjfH5NH+5bQzWk2aezrcqnEVX8FlZ6AcCXN
	o10dBYymuHsbGhBWsg==
X-Google-Smtp-Source: AGHT+IG02W+Dsa0vEM8hEVWP8NQgbQQwr05SZPntrJd067WKzgCwBOPM2n0Jqmj/8cLR/UZJ0rBWRQ==
X-Received: by 2002:a17:902:ac8f:b0:21f:55e:ed58 with SMTP id d9443c01a7336-21f4e6a0313mr32650775ad.11.1738919736437;
        Fri, 07 Feb 2025 01:15:36 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51ae35a55sm2636566a12.0.2025.02.07.01.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 01:15:35 -0800 (PST)
Date: Fri, 7 Feb 2025 14:45:33 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V8 12/14] rust: Extend cpufreq bindings for driver
 registration
Message-ID: <20250207091533.4jmdz7pq6hz4eg3u@vireshk-i7>
References: <cover.1738832118.git.viresh.kumar@linaro.org>
 <5860ff88ff81d09838f7786507ec47a33cf16158.1738832119.git.viresh.kumar@linaro.org>
 <Z6SlRZouQ-nPH2EP@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6SlRZouQ-nPH2EP@pollux>

On 06-02-25, 13:04, Danilo Krummrich wrote:
> > +            unsafe { drop(KBox::from_raw(drv.attr)) };
> 
> This could just be
> 
> let _ = unsafe { KBox::from_raw(drv.attr) };
> 
> At least drop() should not be within the unsafe block.
> 
> > +        }
> > +
> > +        // Free data
> > +        drop(self.clear_data());
> 
> No need for drop(), but I also don't mind to be explicit.

For both of these I kept the explicit drop() to avoid any potential
confusion. I do prefer them.

-- 
viresh

-------------------------8<-------------------------

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index ecf7c6e2cb89..d2e7913e170b 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -645,7 +645,7 @@ pub fn new(name: &'static CStr, data: T::Data, flags: u16, boost: bool) -> Resul
 
         // Pass the ownership of the memory block to the C code. This will be freed when
         // the [`Registration`] object goes out of scope.
-        drv_ref.attr = KBox::leak(attr) as *mut _;
+        drv_ref.attr = KBox::into_raw(attr) as *mut _;
 
         // Initialize mandatory callbacks.
         drv_ref.init = Some(Self::init_callback);
@@ -813,7 +813,7 @@ fn clear_data(&mut self) -> Option<T::Data> {
 // cpufreq driver callbacks.
 impl<T: Driver> Registration<T> {
     // Policy's init callback.
-    extern "C" fn init_callback(ptr: *mut bindings::cpufreq_policy) -> core::ffi::c_int {
+    extern "C" fn init_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: `ptr` is valid by the contract with the C code. `policy` is alive only for
             // the duration of this call, so it is guaranteed to remain alive for the lifetime of
@@ -838,7 +838,7 @@ extern "C" fn exit_callback(ptr: *mut bindings::cpufreq_policy) {
     }
 
     // Policy's online callback.
-    extern "C" fn online_callback(ptr: *mut bindings::cpufreq_policy) -> core::ffi::c_int {
+    extern "C" fn online_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: `ptr` is valid by the contract with the C code. `policy` is alive only for
             // the duration of this call, so it is guaranteed to remain alive for the lifetime of
@@ -849,7 +849,7 @@ extern "C" fn online_callback(ptr: *mut bindings::cpufreq_policy) -> core::ffi::
     }
 
     // Policy's offline callback.
-    extern "C" fn offline_callback(ptr: *mut bindings::cpufreq_policy) -> core::ffi::c_int {
+    extern "C" fn offline_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: `ptr` is valid by the contract with the C code. `policy` is alive only for
             // the duration of this call, so it is guaranteed to remain alive for the lifetime of
@@ -860,7 +860,7 @@ extern "C" fn offline_callback(ptr: *mut bindings::cpufreq_policy) -> core::ffi:
     }
 
     // Policy's suspend callback.
-    extern "C" fn suspend_callback(ptr: *mut bindings::cpufreq_policy) -> core::ffi::c_int {
+    extern "C" fn suspend_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: `ptr` is valid by the contract with the C code. `policy` is alive only for
             // the duration of this call, so it is guaranteed to remain alive for the lifetime of
@@ -871,7 +871,7 @@ extern "C" fn suspend_callback(ptr: *mut bindings::cpufreq_policy) -> core::ffi:
     }
 
     // Policy's resume callback.
-    extern "C" fn resume_callback(ptr: *mut bindings::cpufreq_policy) -> core::ffi::c_int {
+    extern "C" fn resume_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: `ptr` is valid by the contract with the C code. `policy` is alive only for
             // the duration of this call, so it is guaranteed to remain alive for the lifetime of
@@ -890,7 +890,7 @@ extern "C" fn ready_callback(ptr: *mut bindings::cpufreq_policy) {
     }
 
     // Policy's verify callback.
-    extern "C" fn verify_callback(ptr: *mut bindings::cpufreq_policy_data) -> core::ffi::c_int {
+    extern "C" fn verify_callback(ptr: *mut bindings::cpufreq_policy_data) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: `ptr` is valid by the contract with the C code. `policy` is alive only for
             // the duration of this call, so it is guaranteed to remain alive for the lifetime of
@@ -901,7 +901,7 @@ extern "C" fn verify_callback(ptr: *mut bindings::cpufreq_policy_data) -> core::
     }
 
     // Policy's setpolicy callback.
-    extern "C" fn setpolicy_callback(ptr: *mut bindings::cpufreq_policy) -> core::ffi::c_int {
+    extern "C" fn setpolicy_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: `ptr` is valid by the contract with the C code. `policy` is alive only for
             // the duration of this call, so it is guaranteed to remain alive for the lifetime of
@@ -916,7 +916,7 @@ extern "C" fn target_callback(
         ptr: *mut bindings::cpufreq_policy,
         target_freq: u32,
         relation: u32,
-    ) -> core::ffi::c_int {
+    ) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: `ptr` is valid by the contract with the C code. `policy` is alive only for
             // the duration of this call, so it is guaranteed to remain alive for the lifetime of
@@ -930,7 +930,7 @@ extern "C" fn target_callback(
     extern "C" fn target_index_callback(
         ptr: *mut bindings::cpufreq_policy,
         index: u32,
-    ) -> core::ffi::c_int {
+    ) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: `ptr` is valid by the contract with the C code. `policy` is alive only for
             // the duration of this call, so it is guaranteed to remain alive for the lifetime of
@@ -944,7 +944,7 @@ extern "C" fn target_index_callback(
     extern "C" fn fast_switch_callback(
         ptr: *mut bindings::cpufreq_policy,
         target_freq: u32,
-    ) -> core::ffi::c_uint {
+    ) -> kernel::ffi::c_uint {
         // SAFETY: `ptr` is valid by the contract with the C code. `policy` is alive only for the
         // duration of this call, so it is guaranteed to remain alive for the lifetime of `ptr`.
         let mut policy = unsafe { Policy::from_raw_policy(ptr) };
@@ -967,7 +967,7 @@ extern "C" fn adjust_perf_callback(
     extern "C" fn get_intermediate_callback(
         ptr: *mut bindings::cpufreq_policy,
         index: u32,
-    ) -> core::ffi::c_uint {
+    ) -> kernel::ffi::c_uint {
         // SAFETY: `ptr` is valid by the contract with the C code. `policy` is alive only for the
         // duration of this call, so it is guaranteed to remain alive for the lifetime of `ptr`.
         let mut policy = unsafe { Policy::from_raw_policy(ptr) };
@@ -978,7 +978,7 @@ extern "C" fn get_intermediate_callback(
     extern "C" fn target_intermediate_callback(
         ptr: *mut bindings::cpufreq_policy,
         index: u32,
-    ) -> core::ffi::c_int {
+    ) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: `ptr` is valid by the contract with the C code. `policy` is alive only for
             // the duration of this call, so it is guaranteed to remain alive for the lifetime of
@@ -989,7 +989,7 @@ extern "C" fn target_intermediate_callback(
     }
 
     // Policy's get callback.
-    extern "C" fn get_callback(cpu: u32) -> core::ffi::c_uint {
+    extern "C" fn get_callback(cpu: u32) -> kernel::ffi::c_uint {
         Policy::from_cpu(cpu).map_or(0, |mut policy| T::get(&mut policy).map_or(0, |f| f))
     }
 
@@ -1001,7 +1001,7 @@ extern "C" fn update_limits_callback(cpu: u32) {
     }
 
     // Policy's bios_limit callback.
-    extern "C" fn bios_limit_callback(cpu: i32, limit: *mut u32) -> core::ffi::c_int {
+    extern "C" fn bios_limit_callback(cpu: i32, limit: *mut u32) -> kernel::ffi::c_int {
         from_result(|| {
             let mut policy = Policy::from_cpu(cpu as u32)?;
 
@@ -1014,7 +1014,7 @@ extern "C" fn bios_limit_callback(cpu: i32, limit: *mut u32) -> core::ffi::c_int
     extern "C" fn set_boost_callback(
         ptr: *mut bindings::cpufreq_policy,
         state: i32,
-    ) -> core::ffi::c_int {
+    ) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: `ptr` is valid by the contract with the C code. `policy` is alive only for
             // the duration of this call, so it is guaranteed to remain alive for the lifetime of
@@ -1036,7 +1036,6 @@ extern "C" fn register_em_callback(ptr: *mut bindings::cpufreq_policy) {
 impl<T: Driver> Drop for Registration<T> {
     // Removes the registration from the kernel if it has completed successfully before.
     fn drop(&mut self) {
-        pr_info!("Registration dropped\n");
         let drv = self.drv.get_mut();
 
         // SAFETY: The driver was earlier registered from `new()`.
@@ -1044,8 +1043,8 @@ fn drop(&mut self) {
 
         // Free the previously leaked memory to the C code.
         if !drv.attr.is_null() {
-            // SAFETY: The pointer was earlier initialized from the result of `KBox::leak`.
-            unsafe { drop(KBox::from_raw(drv.attr)) };
+            // SAFETY: The pointer was earlier initialized from the result of `KBox::into_raw()`.
+            drop(unsafe { KBox::from_raw(drv.attr) });
         }
 
         // Free data
diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
index 4030953c2001..b83bd97a4f37 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -300,9 +300,9 @@ extern "C" fn config_clks(
         dev: *mut bindings::device,
         opp_table: *mut bindings::opp_table,
         opp: *mut bindings::dev_pm_opp,
-        _data: *mut core::ffi::c_void,
+        _data: *mut kernel::ffi::c_void,
         scaling_down: bool,
-    ) -> core::ffi::c_int {
+    ) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: 'dev' is guaranteed by the C code to be valid.
             let dev = unsafe { Device::get_device(dev) };
@@ -324,8 +324,8 @@ extern "C" fn config_regulators(
         old_opp: *mut bindings::dev_pm_opp,
         new_opp: *mut bindings::dev_pm_opp,
         regulators: *mut *mut bindings::regulator,
-        count: core::ffi::c_uint,
-    ) -> core::ffi::c_int {
+        count: kernel::ffi::c_uint,
+    ) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: 'dev' is guaranteed by the C code to be valid.
             let dev = unsafe { Device::get_device(dev) };
