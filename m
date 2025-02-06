Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0532A22FE19
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834186; cv=none; b=iiP3KEaQSEgTVyBpR11qKRxx1lm1ZTgmn2P4xD2ouyk+0TPrZMJ++j5CK07xvFT4tkGgIdmbZxPsHGt38vUl2VXwSiiJwekHyrJOMdwYXdpOMms/gthIddgc2kU/lgdpQ6T2F3WqhFGog3gTk6Q7RaLF3oLIVVuVN7xHkL2tNz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834186; c=relaxed/simple;
	bh=6Nr6juVTcJnK5KJdfVIW7dgp4mA/0Bv/HaCQhKWQ1L8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D+pCovgCk/RcAMTaOVvW5gz4jYFxTzu2tiatgxDjoCzpTYZFfQwp9w00uRenj07blmOOR5OMYRXC/eEaIyTjV9oS9gC45ZvNVD/479UXkIM2/3l2EGzDzFmXW5wYJxgnvLAKnWtNSCBeOg9TZwoDiK32U/5+QLwEy0miSxBlIMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KvhZ2EcZ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KvhZ2EcZ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21f40deb941so2753995ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 01:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738834183; x=1739438983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7GVksBxvKvwIJslQZYHPVaVtikmNSrbgR1tm3RBWUA=;
        b=KvhZ2EcZwvUuhxtx2+tAV4tI4wJXGSUSnm+dMFMj6Q6RsEjGY0T3xNOGLZ+uo6gDdf
         M+kvhYUlQiKV8GOcJO1OME4oyes4pBQeJdgixCsVFjcU5VRcSL5lRzA/NToGRpWhvj2+
         fJTEQdyDSYTggC3PXegB9nuy6hF1Igm1pdkZK9Y/moSqGE0DrE9uVBXqj7G9SCIDg2uB
         NDFougi7F0n93TStKRtEqlGpgd76C2pjHH30efWxYAwe5BLwOO4gKk8TCubMkwmdvPSB
         R2Nhg+aEpJpqx5HVQN459D+0+k+4cvN8Hsi4vdaXctoCg5de7jFfYgq7PcdRbZbIL83D
         2PbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834183; x=1739438983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7GVksBxvKvwIJslQZYHPVaVtikmNSrbgR1tm3RBWUA=;
        b=uENp0Fzl2ze9und4QiNYfTmLL1Wl7V9vkfCnP4PL6YpOVIMdV30JFDoY3dVcmSz+pe
         mF1exP3HZj0XgNwE1/miEysWqpRxkkBjQn7yVhZ/0Bp4EqalPHKtXUSq3/rQvdZYV8Y0
         /nbP8fRtkMB1yPx89cDIwcseFSQyP6oxWcMC8fR6vwUm1GJuXqpI5elJGmidxpmSNmNU
         QcstPSLD2VPwEnMH+cc+shuzH9JdJnfmZ0pM7hkro2KZiJ+TzK8DYMHMaQB0YDg4eP2r
         07HsmdG+egK1pp6ieqoFco+MiXPDgx1rgHVc9InUD47dPylR4qJX1aP5ITRf0ByZWe4d
         xweA==
X-Forwarded-Encrypted: i=1; AJvYcCUpnTQ7PJ+1BBPn24mG2aBy5AtNQjQCAml9OwxkcJd0roYSZJ5d8yMqfl3Y0pIu+fZoCB41PXL5BSuANQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzMavI6uMZncfBQDm+SspruNLjdyHwRucgBq07SZ4hlYSo6/tH
	oBtsdaa621cpB52LkKjHVPb15aQLvpHQvv3820rzGroxT+ob/QQEnaaYcgWXcKg=
X-Gm-Gg: ASbGncutf0YP4WvcJbENVRi00sW1QmjWAU/0RgJW/5R228UsgULJ574gSyCctc+P18P
	ct82FCTIVyxT/vbQTc+LCIuRAS0s8HeCLPc4RXsOOSo4qaIgXqQUm7TMpaP4g1Uc9w+Z6Fu4LJc
	M6sv5QtW5NDxkI+kxPKeZoFAU0CRjfEmj+NFJB3yDTP+Uxu9AqU8zJky6iiBGGZjLQuvBQG0g/c
	KASgWsniGGS5/vW5ztbkt4TAgzh/p3BF4FlPoueHxo6kUnyLgM6WkfKj7/0T+uwHMlFyWo+5TOJ
	V/vHMLhCV1GemRqbqQ==
X-Google-Smtp-Source: AGHT+IGILzk1MC7IIM8lCYB+bVOwC6qPckXvdAEjdQCycRHBampUmw7KPycs3BkF8bGTuy8Qvqtp5g==
X-Received: by 2002:a17:902:f54b:b0:21f:1553:12b5 with SMTP id d9443c01a7336-21f17ec7bcemr112601805ad.36.1738834183178;
        Thu, 06 Feb 2025 01:29:43 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d5a5sm8089985ad.128.2025.02.06.01.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 01:29:42 -0800 (PST)
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
	Trevor Gross <tmgross@umich.edu>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V8 13/14] rust: Extend OPP bindings with CPU frequency table
Date: Thu,  6 Feb 2025 14:58:34 +0530
Message-Id: <5dc8ce40dd0e0ce7defb002e7f6e614d5d8a5c18.1738832119.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1738832118.git.viresh.kumar@linaro.org>
References: <cover.1738832118.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds bindings for CPUFreq core related API.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/kernel/opp.rs | 62 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
index 8028245e94aa..4030953c2001 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -16,6 +16,12 @@
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
@@ -337,6 +343,56 @@ extern "C" fn config_regulators(
     }
 }
 
+/// CPU Frequency table created from OPP entries.
+#[cfg(CONFIG_CPU_FREQ)]
+pub struct FreqTable {
+    dev: ARef<Device>,
+    table: cpufreq::Table,
+}
+
+#[cfg(CONFIG_CPU_FREQ)]
+impl FreqTable {
+    /// Creates new instance of [`FreqTable`] from raw pointer.
+    fn new(table: &Table) -> Result<Self> {
+        let mut ptr: *mut bindings::cpufreq_frequency_table = ptr::null_mut();
+
+        // SAFETY: The requirements are satisfied by the existence of `Device` and its safety
+        // requirements.
+        to_result(unsafe {
+            bindings::dev_pm_opp_init_cpufreq_table(table.dev.as_raw(), &mut ptr)
+        })?;
+        Ok(Self {
+            dev: table.dev.clone(),
+            // SAFETY: The `ptr` is guaranteed by the C code to be valid.
+            table: unsafe { cpufreq::Table::from_raw(ptr) },
+        })
+    }
+
+    /// Returns reference to the underlying [`cpufreq::Table`].
+    pub fn table(&self) -> &cpufreq::Table {
+        &self.table
+    }
+}
+
+#[cfg(CONFIG_CPU_FREQ)]
+impl Deref for FreqTable {
+    type Target = cpufreq::Table;
+
+    #[inline]
+    fn deref(&self) -> &Self::Target {
+        &self.table
+    }
+}
+
+#[cfg(CONFIG_CPU_FREQ)]
+impl Drop for FreqTable {
+    fn drop(&mut self) {
+        // SAFETY: The requirements are satisfied by the existence of `Device` and its safety
+        // requirements.
+        unsafe { bindings::dev_pm_opp_free_cpufreq_table(self.dev.as_raw(), &mut self.as_raw()) };
+    }
+}
+
 /// Operating performance point (OPP) table.
 ///
 /// Wraps the kernel's `struct opp_table`.
@@ -540,6 +596,12 @@ pub fn adjust_voltage(
         })
     }
 
+    /// Create cpufreq table from OPP table.
+    #[cfg(CONFIG_CPU_FREQ)]
+    pub fn to_cpufreq_table(&mut self) -> Result<FreqTable> {
+        FreqTable::new(self)
+    }
+
     /// Sets a matching OPP based on frequency.
     pub fn set_rate(&self, freq: usize) -> Result<()> {
         // SAFETY: The requirements are satisfied by the existence of `Device` and its safety
-- 
2.31.1.272.g89b43f80a514

