Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADE02BE7CB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369200; cv=none; b=fTLThDBpOlnVsJqhZwMsnOyEHIfgPbblsNPYyUcjkoJBr+GOHPa5hMobt/ATvtkvqrD2g9tZokIHYYJpCybyfOk0zrOkuQ6XY3dE600bBC07F3YqPdtY4eUmzb5qhzHx2w81bfZTlmHtztX6ZxcUJ+LK83Mf18RMNnAAXcm/3T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369200; c=relaxed/simple;
	bh=YfkEvdysLwoMmcnG/s03bKY53YATs71FlnrnNvf18rM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hrg4hgz3pvNLftsltZC9caS+vz/tRgKqHkICbQjn7dWgwXQP9pA+D1P9lHvNTM18BVm3/ZcPkplyq1ChK7GnQWCGEpdBSMNw1lZBQd+bpN22YqES3MxgYLX3EPWON02LtwBFuduzDWTmdK1JSe4Rxvg64Su+15UqXXcNDXkoeW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EYCOf8aO; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EYCOf8aO"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7370a2d1981so1413265b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744369199; x=1744973999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5O39+KsHhbO3NhJV0D2xQKPBr7meyvBFEMUfJdpqZjU=;
        b=EYCOf8aODVPPX0FhyvlNF0SbvElYhQcTGPVQu+VmwhlXimf7KyaYCjHb+TQpZAqOKa
         7D93GW/X+8CmOxCLxqSI4dzA8bNjDdvRvaUgbfdFbw7HikZfGY0a6q0J1CFEi2GMUC12
         aBCKFldhqhgMuQptseEFCcCVAlB+zHY/u5G5lB2ey2b3BKfnFatsH5U7Wp4jyrAOPwsN
         sjoIUNwWyaMPssPXg50UZW3tTOv5+L34UWJWGF4EOaCHfBP8PMQbuCEwgnn7wRWoG2Hb
         wNV8IhDfi6UDXVDqUhCm00CkseGCwrmfao4DhWa3ZPyAkM7oF0C4YAt6Vo7cuvOg1T7z
         Tu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744369199; x=1744973999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5O39+KsHhbO3NhJV0D2xQKPBr7meyvBFEMUfJdpqZjU=;
        b=sWpEYXbhwvv5hGCG6RiWOzic7wfpy2xR8X9ygNOqQk00Xtle6kKYVw5z7jB3kUyTz1
         KfJRW9UXO4SFjeh+2VLNvFNjDIqsATv3B4SgSi0UdamfYkA7ryWwfK/HVxjSTtfPnojb
         wdWPB9Ek1jxGKLifqkaltu7hdA5Fy5v/R4L0j3NXLMbyHSBojgSLOM3kwkR6rYHUvLhu
         hv2Qi8oDYmnpendwPSYX3hPf+/grqMtyUlFtvrohIsDZ1JSsLhX2k2JggDyz252u177L
         bVzt2gHKFsOZiG0ZfmKeRevJP7Iz91JSGe6OBJ0N6tvI5svzEiYW4UMCKnKiwpHYXZu2
         z8fg==
X-Forwarded-Encrypted: i=1; AJvYcCX60Rm3Tuh16k+Qk2CfsiIxpA+mDDZUaQ+5jZlQ97my8/yHvuEA7T/6mHTZoWHMPZrbPVQ4+2t5RxFhne0=@vger.kernel.org
X-Gm-Message-State: AOJu0YysXHjuqFEXnfJodYQ5smbqlTphXgSWtT0rp0ovhusRcP/l5ezO
	L4HGP3B3gn3gQBARoy90mIYhG8Pc/Da4iPBYzwTouea1GXFW/Jlb98h8d0XmOuw=
X-Gm-Gg: ASbGncvWBPJCZrIGkTlM9xQ4gGH+ieZgvxFcgQ5dvibmLvdBgaKGSbfGVhEAFtCAQyj
	EPiBf7b6IBv4L/nXLEYtz3PEgVoG+AB9cCrK9aTTRddr0sykicaQhHEZPPknLNiS9+qujuLn1gR
	AO6/PCdAbqWyQwuMs7356vT9AEB8xDsmIc5t7oBA3F9UIHuA+RH3jsFxr49+3CjBZ1NwapqZ2UM
	48RhCaudjgGJqeB/Hy0rMdDGavhARSraTmKwq8CMBJWTYEXSBQLCi8hTgb04bZDQAYSe9YvTLQd
	XhfLI4YX8LB8z5kl6mW12VOuKkYDJfcJm+vJ1ifgxA==
X-Google-Smtp-Source: AGHT+IFUZzi3or0+gmBFWhEoaT6J6YgEu6VDaT3zpSxk4MU/e2d8OAjpgFPpre9Wl18Dad1dznFhiQ==
X-Received: by 2002:a17:90b:5188:b0:301:98fc:9b51 with SMTP id 98e67ed59e1d1-3082365a310mr3170141a91.5.1744369198940;
        Fri, 11 Apr 2025 03:59:58 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df08f63bsm5260842a91.24.2025.04.11.03.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 03:59:58 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V9 16/17] rust: opp: Extend OPP abstractions with cpufreq support
Date: Fri, 11 Apr 2025 16:25:15 +0530
Message-Id: <e88fae38cb339ff88cb64fcd506ce767b458f310.1744366572.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1744366571.git.viresh.kumar@linaro.org>
References: <cover.1744366571.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the OPP abstractions to include support for interacting with the
cpufreq core, including the ability to retrieve frequency tables from
OPP table.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/kernel/opp.rs | 67 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
index 7bf612fa0cc5..a46ac28d4464 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -20,6 +20,12 @@
     types::{ARef, AlwaysRefCounted, Opaque},
 };
 
+#[cfg(CONFIG_CPU_FREQ)]
+use crate::cpufreq;
+
+#[cfg(CONFIG_CPU_FREQ)]
+use core::ops::Deref;
+
 use core::{marker::PhantomData, ptr};
 
 use macros::vtable;
@@ -497,6 +503,60 @@ extern "C" fn config_regulators(
     }
 }
 
+/// OPP frequency table.
+///
+/// A [`cpufreq::Table`] created from [`Table`].
+#[cfg(CONFIG_CPU_FREQ)]
+pub struct FreqTable {
+    dev: ARef<Device>,
+    ptr: *mut bindings::cpufreq_frequency_table,
+}
+
+#[cfg(CONFIG_CPU_FREQ)]
+impl FreqTable {
+    /// Creates a new instance of [`FreqTable`] from [`Table`].
+    fn new(table: &Table) -> Result<Self> {
+        let mut ptr: *mut bindings::cpufreq_frequency_table = ptr::null_mut();
+
+        // SAFETY: The requirements are satisfied by the existence of [`Device`] and its safety
+        // requirements.
+        to_result(unsafe {
+            bindings::dev_pm_opp_init_cpufreq_table(table.dev.as_raw(), &mut ptr)
+        })?;
+
+        Ok(Self {
+            dev: table.dev.clone(),
+            ptr,
+        })
+    }
+
+    // Returns a reference to the underlying [`cpufreq::Table`].
+    #[inline]
+    fn table(&self) -> &cpufreq::Table {
+        // SAFETY: The `ptr` is guaranteed by the C code to be valid.
+        unsafe { cpufreq::Table::from_raw(self.ptr) }
+    }
+}
+
+#[cfg(CONFIG_CPU_FREQ)]
+impl Deref for FreqTable {
+    type Target = cpufreq::Table;
+
+    #[inline]
+    fn deref(&self) -> &Self::Target {
+        self.table()
+    }
+}
+
+#[cfg(CONFIG_CPU_FREQ)]
+impl Drop for FreqTable {
+    fn drop(&mut self) {
+        // SAFETY: The pointer was created via `dev_pm_opp_init_cpufreq_table`, and is only freed
+        // here.
+        unsafe { bindings::dev_pm_opp_free_cpufreq_table(self.dev.as_raw(), &mut self.as_raw()) };
+    }
+}
+
 /// A reference-counted OPP table.
 ///
 /// Rust abstraction for the C `struct opp_table`.
@@ -752,6 +812,13 @@ pub fn adjust_voltage(
         })
     }
 
+    /// Creates [`FreqTable`] from [`Table`].
+    #[cfg(CONFIG_CPU_FREQ)]
+    #[inline]
+    pub fn cpufreq_table(&mut self) -> Result<FreqTable> {
+        FreqTable::new(self)
+    }
+
     /// Configures device with [`OPP`] matching the frequency value.
     #[inline]
     pub fn set_rate(&self, freq: Hertz) -> Result<()> {
-- 
2.31.1.272.g89b43f80a514

