Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C74237186
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797588; cv=none; b=GonWE8nPk34EzolDDK6qa19oDRyyf4Yh2ABIE8iTuxtwcnpAqECg+3nIcgvbPSsxP/Y0faUGwlCup0lOY3NPl4cuHiNsQvmouXeFDJLoH7Sawex/O5h/S4Ko6ErOcdOxZBchZp82pP9K/0EQEVeH0KBVWDtDWS8WckaMCpqLwkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797588; c=relaxed/simple;
	bh=/KqlifPlITcri+NQjH9NT/zBN4DYYrCOXYlB0R4bEE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MlaiEUYFazPg9GLFoXPqNNdSKgQ7+FGE8YG3blMusCWsoHDKaHlqYEy50N8kbGL9unP05dAShy/rfft5NQC9BLNpYGhGRX/owE7DoGXw+sebQ8RA/RS6kSC/I+bPV0+YOByUtRoH4FlcGra8iGviLX3DyZvZSrDQJdvcgHIkPdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ohdYXI03; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ohdYXI03"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-224100e9a5cso74854035ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744797586; x=1745402386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JEYp1SEbpoVNrf3LCVsspSC8TThhLaOuKiPfCmCBrCE=;
        b=ohdYXI03XDnmwCDoBfeuwXBEDDAL95kC40N+9cJUZwQcjuM33qX74PA70LK+tMDQay
         BN9q3GprWzmrAN/zlj4PDEKYXKs/Slkb8B4Jw1rn4cq+uW2tS1qQi4tnkpke7qc1T9P9
         yjOQ9P5YwYJvDn420WWWxiEWWcpo+CsalPwxt5rBmaauOX5qYH6d3kp6iOPbRrP3FbsK
         x8YJtjlpjdJvtScB76T9tx8BZ/4hpG2Uav7VzwWriyv1L3kNVKzZ+BOnEr0SdykJsL6r
         4JUPRRFlFP+mdJyMmIM51uWSNH6o9Y+XKCQOkvF91zypXsm0Q4u4gsLdzgzg5xScez/2
         AFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744797586; x=1745402386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEYp1SEbpoVNrf3LCVsspSC8TThhLaOuKiPfCmCBrCE=;
        b=oTLRLqZCo46N2xYV9GxwwiTZSR87cZN9Pvgw3gbEQ6APHoDNsNfIgxYoL2MEcvXo6d
         3K9iwAZd06iHSs2Ivnw6ehD03WYH0l2gmp455uNrVnFh4xQ1Cw82fCtqpoM6jEran0Dg
         O4UghG87ngCSOKbavt2rAiGMOfYjMRZIRd4DIlnT+eehagM2vwu6irTdpHrC3+RDuDoD
         61La85NO/LtLLa3Ne51O/tJi2cDopJy8L/674EqcgCCIrjlR042GoRLGWCSc4VaRsv1A
         0XBEFMTzkdoC+FOdstHqtJ0+w5JSN8TxxMfnd4eqAh6obGYgnOCg5TwUe/YWhaS/op5L
         gp+g==
X-Forwarded-Encrypted: i=1; AJvYcCWhGTHv2Qcng7Vr2Q5h4tCmv6a6bGzf0l3APQALC7i6Ddm2i/ZCTD421/4fU5kazlZPZZqC7Jjh4CSHrsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuOIbzbftqcidwLNns/a6Yh8fud+3209N5coj1N9Y9B2Oly7y1
	HlXKUD8r53wTFYyxYb/nPgVqtw1NtQVCiLgkNv59dm7GCNORMNsyz3lCxtD74u4=
X-Gm-Gg: ASbGncuai2nlvy+mwRkWfzca4WoBdncaXEcrxapXOEnELDeJnmQeqW29efHPD7ZhbT2
	iZERmt0eihQPAHx1gYAOkym8QY7FxW4FFLijtZJa+bjPS6UpG5rFc6bdtYdqCgDnKcuc6nVL5MO
	tD2Usc+s4KUfJnC2l2FqtDhoado2LDL9vRUTvsmSPj0Wd+MArEXrk444Gvw1zqBP7UQPG4EHmOY
	gQBtT+dkjzBe8SWRYghSAh00oi7IAq0x5/ctXfE8sKx4gV43cAdb850S91EBAe/YPdWnqdm7u3x
	OiQWV74jCi23AbYpL60XXwNjkMTU9RySFjjo/Xge8w==
X-Google-Smtp-Source: AGHT+IFlrDH8XoDOr95CMioGMAxmNZhKw0qCNMj4btmrvguVmdoyuIky5agyncMrdkwVuUZ7fBvXGQ==
X-Received: by 2002:a17:902:e806:b0:220:e63c:5b13 with SMTP id d9443c01a7336-22c35982038mr16198835ad.46.1744797585891;
        Wed, 16 Apr 2025 02:59:45 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef0fbasm9958505ad.19.2025.04.16.02.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 02:59:45 -0700 (PDT)
Date: Wed, 16 Apr 2025 15:29:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V10 14/15] rust: opp: Extend OPP abstractions with
 cpufreq support
Message-ID: <20250416095943.f3jxy55bamekscst@vireshk-i7>
References: <cover.1744783509.git.viresh.kumar@linaro.org>
 <a940d1b1a02d99fdc80ba8d0526c35a776854cb3.1744783509.git.viresh.kumar@linaro.org>
 <Z_9v24SghlIhT62r@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_9v24SghlIhT62r@pollux>

On 16-04-25, 10:52, Danilo Krummrich wrote:
> This config is needed quite often, it probably makes sense to move this code in
> its own Rust module, i.e.:
> 
> 	#[cfg(CONFIG_CPU_FREQ)]
> 	pub mod freq;

Like this ?

diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
index 734be8b6d0ef..f4cabe859c43 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -20,10 +20,67 @@
 };

 #[cfg(CONFIG_CPU_FREQ)]
-use crate::cpufreq;
+// Frequency table implementation.
+mod freq {
+    use crate::cpufreq;
+    use core::ops::Deref;
+    use super::*;
+
+    /// OPP frequency table.
+    ///
+    /// A [`cpufreq::Table`] created from [`Table`].
+    pub struct FreqTable {
+        dev: ARef<Device>,
+        ptr: *mut bindings::cpufreq_frequency_table,
+    }
+
+    impl FreqTable {
+        /// Creates a new instance of [`FreqTable`] from [`Table`].
+        pub(crate) fn new(table: &Table) -> Result<Self> {
+            let mut ptr: *mut bindings::cpufreq_frequency_table = ptr::null_mut();
+
+            // SAFETY: The requirements are satisfied by the existence of [`Device`] and its safety
+            // requirements.
+            to_result(unsafe {
+                bindings::dev_pm_opp_init_cpufreq_table(table.dev.as_raw(), &mut ptr)
+            })?;
+
+            Ok(Self {
+                dev: table.dev.clone(),
+                ptr,
+            })
+        }
+
+        // Returns a reference to the underlying [`cpufreq::Table`].
+        #[inline]
+        fn table(&self) -> &cpufreq::Table {
+            // SAFETY: The `ptr` is guaranteed by the C code to be valid.
+            unsafe { cpufreq::Table::from_raw(self.ptr) }
+        }
+    }
+
+    impl Deref for FreqTable {
+        type Target = cpufreq::Table;
+
+        #[inline]
+        fn deref(&self) -> &Self::Target {
+            self.table()
+        }
+    }
+
+    impl Drop for FreqTable {
+        fn drop(&mut self) {
+            // SAFETY: The pointer was created via `dev_pm_opp_init_cpufreq_table`, and is only
+            // freed here.
+            unsafe {
+                bindings::dev_pm_opp_free_cpufreq_table(self.dev.as_raw(), &mut self.as_raw())
+            };
+        }
+    }
+}

 #[cfg(CONFIG_CPU_FREQ)]
-use core::ops::Deref;
+pub use freq::FreqTable;

 use core::{marker::PhantomData, ptr};

@@ -502,60 +559,6 @@ extern "C" fn config_regulators(
     }
 }

-/// OPP frequency table.
-///
-/// A [`cpufreq::Table`] created from [`Table`].
-#[cfg(CONFIG_CPU_FREQ)]
-pub struct FreqTable {
-    dev: ARef<Device>,
-    ptr: *mut bindings::cpufreq_frequency_table,
-}
-
-#[cfg(CONFIG_CPU_FREQ)]
-impl FreqTable {
-    /// Creates a new instance of [`FreqTable`] from [`Table`].
-    fn new(table: &Table) -> Result<Self> {
-        let mut ptr: *mut bindings::cpufreq_frequency_table = ptr::null_mut();
-
-        // SAFETY: The requirements are satisfied by the existence of [`Device`] and its safety
-        // requirements.
-        to_result(unsafe {
-            bindings::dev_pm_opp_init_cpufreq_table(table.dev.as_raw(), &mut ptr)
-        })?;
-
-        Ok(Self {
-            dev: table.dev.clone(),
-            ptr,
-        })
-    }
-
-    // Returns a reference to the underlying [`cpufreq::Table`].
-    #[inline]
-    fn table(&self) -> &cpufreq::Table {
-        // SAFETY: The `ptr` is guaranteed by the C code to be valid.
-        unsafe { cpufreq::Table::from_raw(self.ptr) }
-    }
-}
-
-#[cfg(CONFIG_CPU_FREQ)]
-impl Deref for FreqTable {
-    type Target = cpufreq::Table;
-
-    #[inline]
-    fn deref(&self) -> &Self::Target {
-        self.table()
-    }
-}
-
-#[cfg(CONFIG_CPU_FREQ)]
-impl Drop for FreqTable {
-    fn drop(&mut self) {
-        // SAFETY: The pointer was created via `dev_pm_opp_init_cpufreq_table`, and is only freed
-        // here.
-        unsafe { bindings::dev_pm_opp_free_cpufreq_table(self.dev.as_raw(), &mut self.as_raw()) };
-    }
-}
-
 /// A reference-counted OPP table.
 ///
 /// Rust abstraction for the C `struct opp_table`.

-- 
viresh
