Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF05928137F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544779; cv=none; b=fyDNzlpT9BMcQG9v+cIn7oP/bzYoMRvdNMhhXNPi4HYr0MJzgLkUOqn6pBv5Qdrtd3kySApnsBFLR0HqgCHwMYRWPPtfY1nuChZie6YQT4sXga46+kqynWhBxktfvV8WNWl2tDfapk8rTSG+o/ByNzAdZl2/wAaaeYAbRCRiux8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544779; c=relaxed/simple;
	bh=lSzyyorNQWpUeJdFSnWOJ/JyzIC1ctxhHa98E077uwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teTkj9fqpMyPIN7HELCJ/lPWqmKMOuXtAiATPWR19FhGx4tkFqdBx601esBWavuIK10wsRzIzYlVpsqvzbXu/jWsYHYVMNeV/1qoa+ZvsRHo/MS/XawgOZqD7gUCnplNDKNNOAFQpRW6SZhPdC6+QBk9i528kUHjLsImTa9IGrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QEI1+w1O; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QEI1+w1O"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b2c40a7ca6eso4983988a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749544777; x=1750149577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FOP1cXECrwk9qwKzMvL7cnfwsmHYTvlIaJnjJpXTWtw=;
        b=QEI1+w1O3T/TwtvaJ1OOy2yvIL2Zy2s4Rajc94mQzUlEx5rtRo7CuKpH5ePtkbOYMm
         kn77GeX58FywTS/t5XE0ROXIvdJ1ais/dDizQC9+Z8fS+GV+wOsg0OeU+u1mPCVubBW5
         NbAjNuNAHTAt9yPnYLZeTBh5iAF1vw+i3cZufdoxVAQTXNfml8aKUO63L+RhgbUlQ7JV
         EXmC9BFzIQeDwruDvVQsYcan8KHtpZQDeCutymlBWyxJBxEDYDD10nxAOD9n0deFjNFq
         7ZsoEIAM6Dc3fv92VFRnqKtw+vuWHQnmeYb5N6YYRM54RRaH3cKbMZ3EeYYFA6U7lw6I
         SeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749544777; x=1750149577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOP1cXECrwk9qwKzMvL7cnfwsmHYTvlIaJnjJpXTWtw=;
        b=GS+4j/lP9l/7btpbB4t1aiVCNF0l0x9FPXz2p3dthktGjhJ9pOoaqSMajvGYQfvfA3
         AF/Oyr2dZRvN3TAt/4UbnvYTbackeJG4H0sEEVd2P+TUKm0ytk6/FlwIXdnT2Z8gC4G6
         loQTchIy3UEe+TTChOzOTH8bwnyH2kpyT1gwJnVS8BlqJS3OuW/0UawwI080GthP5OlX
         NoXLp1FTIjvXqWoP0Ib9UhQ550d8wIgEhfr+dusZR5qmMyzgMdClyAZbE3XPgwozbA6I
         cnzSccw3yBUK89B7d7z9N+lr2yw9PFfFsLzI5aRO9KopLg9VYHYpYLuVqH5hITMrZK6G
         RWyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjD+hDoCIKunguFAIdyoJkhqkJKkCMzhQCxUwkV0O6CSFFwj3elo+CEPGpCfEOHpwYril0szl+MX1PJAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHmP9L+coZrqxQwq+lYas1b0KfOWy4Ja9p/m0+5o3PRbTzli1f
	F/sf/ksUT73hrL55R1648Fs2dFuWb7VszUHGL9Q9qx1Xjkuj1w4aRjhYIbDGMFTWgiA=
X-Gm-Gg: ASbGncsaTnTUAaBZSMU3xyJ/FQ+iAfFwibF+FbYODskI2ZKoxL2cb3BVghaQHOpwaJc
	MqUekXWys+R4A0T9Uqosh9CPbZhlJ4xnHgVlxqiBOVimqrjMo//ysRl165kijaXL8CyTnpj2Kxw
	8o0dCLDZtPpTsszwt7QdMeYeQQK6PtUF02DdZ0R7Txfw1fUf8etWFWqwRJcSbDRcFowCbW2IF/E
	Y1h0e2DXCJO8ksOxXp8rddw++iF8yA4HpOfBVTR8ZzTPLNpefCDxi/0XjMFbZqtlnrJnNPQZlVG
	SEkpmEOrvr1yOXLc88U9nR2/YN/F4nwkf8W1zPs9ZHyPM6wg07y37IQhoKUbuHgtqundHezxcA=
	=
X-Google-Smtp-Source: AGHT+IFtinTUgR+n9j8q/WN69RN6/ZoHZHEpAWwz2j7iqmWGwSG/25yxSAVk6NLQzVc422or5a/dtQ==
X-Received: by 2002:a17:90b:4988:b0:312:959:dc3c with SMTP id 98e67ed59e1d1-313a154205fmr2570637a91.10.1749544776780;
        Tue, 10 Jun 2025 01:39:36 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fc9d2sm66389185ad.113.2025.06.10.01.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:39:36 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:09:33 +0530
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
	Vincent Guittot <vincent.guittot@linaro.org>,
	Yury Norov <yury.norov@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] rust: cpu: Introduce CpuId abstraction
Message-ID: <20250610083933.2xwl5wz4drs4mgk4@vireshk-i7>
References: <cover.1749463570.git.viresh.kumar@linaro.org>
 <f10910c7585f5556869ea6f34b64d4136b8d5581.1749463570.git.viresh.kumar@linaro.org>
 <20250609111857.ijvagblorxtq7d2n@vireshk-i7>
 <aEbp_X8PpU9XzQU9@Mac.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEbp_X8PpU9XzQU9@Mac.home>

On 09-06-25, 07:04, Boqun Feng wrote:
> I think you can keep this as a separate patch for the ease of review.
> And I just realize that we should use raw_smp_processor_id() because
> the current API only support an unstable cpuid read. For a stable cpuid
> read, we need some lifetime description of the return value to make sure
> it doesn't outlive the scope that guarantees the cpuid is stable. Well,
> the user can still use the unstable CpuId and ensure the scope provides
> the cpuid stability (see comments of smp_processor_id()), it's just
> CpuId::current() doesn't need to guarantee that.
 
> We need mention that the result is an unstable one, and refer to the
> raw_smp_processor_id() in include/linux/smp.h (we probably also want to
> fix the typo there, i.e. s/raw_processor_id/raw_smp_processor_id, while
> we are at it). Also it's worth mentioning that if the context between
> CpuId::current() and use of the return value indeed guarantee cpuid
> stability, the users can treat it as a stable one.

Thanks. How about this:

Subject: [PATCH] rust: cpu: Add CpuId::current() to retrieve current CPU ID

Introduce `CpuId::current()`, a constructor that wraps the C function
`raw_smp_processor_id()` to retrieve the current CPU identifier without
guaranteeing stability.

This function should be used only when the caller can ensure that
the CPU ID won't change unexpectedly due to preemption or migration.

Suggested-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/helpers/cpu.c     |  8 ++++++++
 rust/helpers/helpers.c |  1 +
 rust/kernel/cpu.rs     | 10 ++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 rust/helpers/cpu.c

diff --git a/rust/helpers/cpu.c b/rust/helpers/cpu.c
new file mode 100644
index 000000000000..824e0adb19d4
--- /dev/null
+++ b/rust/helpers/cpu.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/smp.h>
+
+unsigned int rust_helper_raw_smp_processor_id(void)
+{
+	return raw_smp_processor_id();
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 0f1b5d115985..16fa9bca5949 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -13,6 +13,7 @@
 #include "build_assert.c"
 #include "build_bug.c"
 #include "clk.c"
+#include "cpu.c"
 #include "cpufreq.c"
 #include "cpumask.c"
 #include "cred.c"
diff --git a/rust/kernel/cpu.rs b/rust/kernel/cpu.rs
index fbc47d2814df..fd2240fe6e2d 100644
--- a/rust/kernel/cpu.rs
+++ b/rust/kernel/cpu.rs
@@ -99,6 +99,16 @@ pub fn from_u32(id: u32) -> Option<Self> {
     pub fn as_u32(&self) -> u32 {
         self.0
     }
+
+    /// Returns the ID of the CPU the code is currently running on.
+    ///
+    /// The returned value is considered unstable because it may change
+    /// unexpectedly due to preemption or CPU migration. It should only be
+    /// used when the context ensures that the task remains on the same CPU.
+    pub fn current() -> Self {
+        // SAFETY: raw_smp_processor_id() always returns a valid CPU ID.
+        unsafe { Self::from_u32_unchecked(bindings::raw_smp_processor_id()) }
+    }
 }
 
 impl From<CpuId> for u32 {

-- 
viresh
