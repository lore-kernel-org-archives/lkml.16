Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3498F40
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 05:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749704484; cv=none; b=lbm5S/yXpwpJOZ1qata/zZPZysrGebSOu8lHL00Xv8xlfP4nqysqPU6b8CuUqqSVP8CcnS0lS1iBV4w0FhA3yHmwSIcvf+ssV5kkk8w0FxsSavrx4iRqcddtvNumlbKnJr+axhmVnJ/LSpEPq7oAlRnEGjYyCgMrQUoCnc/SEy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749704484; c=relaxed/simple;
	bh=9pHjVMGg2ruxdwaHtiPTktq8Zbd4RUe/LdD/4hfxsW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBGCzhnY8DwkQ5oWuwvcmHgAz/4rWQBNEOFLCam70PpCVm/U0TkWqup4BpetnjvFUDhFAVWmpWrFvryKDJ2tX2iPoRiDqB8tZYLKXeZOTTpcirwiiPSASqEsCPR6G3TkLarJGjUXq0xUx4nSHFYM7q7FHdM8EbQ+7pzATJz8Jx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=viLNnXJn; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="viLNnXJn"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234f17910d8so5711705ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749704481; x=1750309281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ta897ANnsOKw/3ZrDJN+Z/Yd5TG55/Y0TTXdSO5Wgwo=;
        b=viLNnXJngWrQpc05n6uWOIH+yg1CAoaDc7rhmN8TZqE/BcUNz5fRkH4TA/7J10XIU4
         bLlDIsTEezVSVLmDgi//cx0s+pPkgNEhlQzceBU4QKLmDFk3SMpc260bVNjkSta4LU9j
         oW3Tl/sK/FxI+fYwQfhQwXXLWXOKxkRPAh+fIKInhaOW580yODdPTF1+yxwLZUfNpv9W
         y/CW6bdwqbeEbs5+k9h74F4eqlEMl9aGleAYQltTPbJy0mZhaCObpnWxEr9t+ASzXm4e
         L1LZKeFoccFh76AoUCGp2BjsfKQRG+au3B7knpxKzDlf8EU9ytWTgNLDPzZ6PFhrBrn9
         2aLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749704481; x=1750309281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ta897ANnsOKw/3ZrDJN+Z/Yd5TG55/Y0TTXdSO5Wgwo=;
        b=b5v/s8ju38dLSAJ8alDj4OXlfsvC8jrlUs9PbMUOZDYuKfBXWMCst6L/VuExW63y1C
         95iKBXya3HQVkKXwjyx7wGJtXwdP9MR1nM6jjCKLDsFxyNLIa8qYp8i9IpnRiRvsF/fU
         UrGBg03/4HDPGwdQ/lwS8Kah4NftDSU6/jLP+Qlsq/BsKnYw+Yzq6t/C1iKwnJAboVWR
         WMnC/sYPYULWHDn/uqvj51zTaA/87vf/V7tX3kvD7mNJ6YQV9pvLTpqRMYsSyi6bmGn7
         +rkVsk8f8HF0nH0SnEVl1FEtIcjXsJl0xUCz5ZNbg/CS20e1litwqZLj5EavHW4NONe1
         Otgg==
X-Forwarded-Encrypted: i=1; AJvYcCWe1ALeQCaZQb/sxikRR8+bIpPSBLjA67mGi+yLcit1iaszznvUOMTbtiU3O+esv7kceFpk11zo128zsWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXHRHmye+TZ3EpZr4/TLCFixrZj4B6DnKqGipnC1GGFw3kOOQP
	7aDf7xKxLKqTZE4LuRfF3mrYgL2CN4rN6Br8A2C3mCpyH5lWFk5/MRWRv68aDm/UidI=
X-Gm-Gg: ASbGncsKDDwCK6pDzA3gkulbpaYa7d5k5agZejnu9U+dYbkZqMFvj8LoPCJiLIDg79F
	1H7ufjCjtxjSFQ9w1C2JqeV6GwsiPjahNXL3ccfBKehREuNYDO36Z6XASu9kZTeGm5x0UhL/l91
	cIOZ+3GLcKYP8ExoQvKliYxTAtIHATt2uRqjwTqIk29TWYujfAbQuzsZ7bZ9Nsjp52XcWWz0Tut
	gCT3GZXoOc3HnGtnkvTlLRFFMrx9NW6vdbUbJWUnXNPxwMwlYlB3ctD1WaUVTnV5CsmGoBjqnbm
	l1t37aXf/STJoYSAeoFbRI2tkH0Z8uCHktehRmwvig7tP9VTaD0ts+yyyAr5zd9gldPmvLt3Qw=
	=
X-Google-Smtp-Source: AGHT+IHFd17mtrnTaIfhEeysW8IO5ia6VXlIvrfEaCUzdPUvSOMJM3AaKiJKr973WWitYYB9zcOAZA==
X-Received: by 2002:a17:902:ef0c:b0:234:986c:66f9 with SMTP id d9443c01a7336-2364ca0c6e4mr33957475ad.22.1749704480788;
        Wed, 11 Jun 2025 22:01:20 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e6d9c45sm4698395ad.140.2025.06.11.22.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 22:01:20 -0700 (PDT)
Date: Thu, 12 Jun 2025 10:31:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 2/3] rust: Use CpuId in place of raw CPU numbers
Message-ID: <20250612050117.3oi6belkf5lrreoh@vireshk-i7>
References: <cover.1749554685.git.viresh.kumar@linaro.org>
 <e790f17123beb45c6a811135ec3df8f0bd761c0e.1749554685.git.viresh.kumar@linaro.org>
 <aEmq8fs1fHSB3z4i@tardis.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEmq8fs1fHSB3z4i@tardis.local>

On 11-06-25, 09:12, Boqun Feng wrote:
> I generally found that `u32::from(cpu)` is more clear than `cpu.into()`,
> but it's up to you. Same for the rest of `cpu.into()` cases.

Updated as:

diff --git a/rust/kernel/cpu.rs b/rust/kernel/cpu.rs
index 7549594fad7f..abc780d7a8ec 100644
--- a/rust/kernel/cpu.rs
+++ b/rust/kernel/cpu.rs
@@ -129,7 +129,7 @@ fn from(id: CpuId) -> Self {
 /// any references to the CPU device within the notifier's callback.
 pub unsafe fn from_cpu(cpu: CpuId) -> Result<&'static Device> {
     // SAFETY: It is safe to call `get_cpu_device()` for any CPU.
-    let ptr = unsafe { bindings::get_cpu_device(cpu.into()) };
+    let ptr = unsafe { bindings::get_cpu_device(u32::from(cpu)) };
     if ptr.is_null() {
         return Err(ENODEV);
     }
diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index ea6106db5c29..11b03e9d7e89 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -527,7 +527,7 @@ pub fn generic_suspend(&mut self) -> Result {
     #[inline]
     pub fn generic_get(&self) -> Result<u32> {
         // SAFETY: By the type invariant, the pointer stored in `self` is valid.
-        Ok(unsafe { bindings::cpufreq_generic_get(self.cpu().into()) })
+        Ok(unsafe { bindings::cpufreq_generic_get(u32::from(self.cpu())) })
     }
 
     /// Provides a wrapper to the register with energy model using the OPP core.
@@ -682,7 +682,7 @@ fn clear_data<T: ForeignOwnable>(&mut self) -> Option<T> {
 impl<'a> PolicyCpu<'a> {
     fn from_cpu(cpu: CpuId) -> Result<Self> {
         // SAFETY: It is safe to call `cpufreq_cpu_get` for any valid CPU.
-        let ptr = from_err_ptr(unsafe { bindings::cpufreq_cpu_get(cpu.into()) })?;
+        let ptr = from_err_ptr(unsafe { bindings::cpufreq_cpu_get(u32::from(cpu)) })?;
 
         Ok(Self(
             // SAFETY: The `ptr` is guaranteed to be valid and remains valid for the lifetime of
diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
index 11ddd43edcb5..19c607709b5f 100644
--- a/rust/kernel/cpumask.rs
+++ b/rust/kernel/cpumask.rs
@@ -94,7 +94,7 @@ pub fn as_raw(&self) -> *mut bindings::cpumask {
     #[inline]
     pub fn set(&mut self, cpu: CpuId) {
         // SAFETY: By the type invariant, `self.as_raw` is a valid argument to `__cpumask_set_cpu`.
-        unsafe { bindings::__cpumask_set_cpu(cpu.into(), self.as_raw()) };
+        unsafe { bindings::__cpumask_set_cpu(u32::from(cpu), self.as_raw()) };
     }
 
     /// Clear `cpu` in the cpumask.
@@ -106,7 +106,7 @@ pub fn set(&mut self, cpu: CpuId) {
     pub fn clear(&mut self, cpu: CpuId) {
         // SAFETY: By the type invariant, `self.as_raw` is a valid argument to
         // `__cpumask_clear_cpu`.
-        unsafe { bindings::__cpumask_clear_cpu(cpu.into(), self.as_raw()) };
+        unsafe { bindings::__cpumask_clear_cpu(i32::from(cpu), self.as_raw()) };
     }
 
     /// Test `cpu` in the cpumask.
@@ -115,7 +115,7 @@ pub fn clear(&mut self, cpu: CpuId) {
     #[inline]
     pub fn test(&self, cpu: CpuId) -> bool {
         // SAFETY: By the type invariant, `self.as_raw` is a valid argument to `cpumask_test_cpu`.
-        unsafe { bindings::cpumask_test_cpu(cpu.into(), self.as_raw()) }
+        unsafe { bindings::cpumask_test_cpu(i32::from(cpu), self.as_raw()) }
     }
 
     /// Set all CPUs in the cpumask.

-- 
viresh
