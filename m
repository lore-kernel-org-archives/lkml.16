Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F8026B2C4
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747638521; cv=none; b=ks3L8eQjDX0ys7+Y9mKW9YJsJ+h6mPsxJYcbO5/3wGe16sqSDYyrnv5foKiJYFt+BqKxH7EHhrTPqBWnMMGEPt6rAUHGMRScTU3KhW2BED9xxgi+a6nV1icx1kKZ/LTOV8g9AyeGeps5/yJ+HXOxBzr8dmcIOdKwllp2hL0zOtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747638521; c=relaxed/simple;
	bh=QB1NDnIN2+10EfH7zVK4+js+l6z1NvQ0KLDj/lkYjH0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oXc0miy0HX/0tAXAweKU/BSjeRN1jGFb3uCRxPySQbqpsYaAFMPHOE4Q5NRAfQH+jGRhjAMuoDcJgzX6gca/twMiB1LWeryQYPWJh1X/c/egMu3/6bIyAAdZk7iGGDCvRF5xJhvs4arbVeVSt3Y7if5plOoM0GIVdSHyemIJQKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O+cGX1l+; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O+cGX1l+"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2322bace4ceso6032075ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 00:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747638519; x=1748243319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zV8iUMBX+j7TsKW8lH5BBlCVzlR9XbeiRbiHVvWBeLs=;
        b=O+cGX1l++cFgpf0MJm1qSDy7j8sY3gwFAhZiW6UaS2xgQSqUCvK6PNz+2/VXJCT0ch
         PzRG8QT+RhDAe1Ci4DPdXatS/MJ4v+/qqd+O/EfrFDdtsPsrwOljQwV+BSvK1BRzd7FT
         1oleRszUJDnkcHmZQOge1VvOLKkrM57M2Tbj/cJHQumD6rW6B8t3UKr4usLP3Z1oCVs/
         pdbp2OMQrW3hep+hrHwtp/BP3L9axskR1tUeCYcE43N0tVffVuK8keEt4mR8wD7mlepE
         mneUVrDBtRLUOPoi23YuJhlSuyozokCi4sOtLBXJb9pjPvIynnMX5Gff8PFl0tUgKTIu
         Cz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747638519; x=1748243319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zV8iUMBX+j7TsKW8lH5BBlCVzlR9XbeiRbiHVvWBeLs=;
        b=QcZs46JYOVzY+sQnuvnkdYf0lXIzsYOF0u1brffgqD4WOP+yoRWopoTgrT6JDKLHy9
         e62Wqk8TdpFO8iD+zdAqnWXD4wF8+W6ZPD2YJ5er0k3PkC6GaVBubnog42jKtGVWcyLN
         LmbB1CedDbMt6km5Apq/8PjlzedW2a9fIycqVNpkbuGg4finc2GRE7QkPdbRUID4rOR1
         jsZiprgaD7aXuTEjc6/F0lWHlUKxCAfAauNIZ3/W0bM9EP0rMEdG3DVP29C9v0lFMGBS
         8MsSr7hMqYyqF4mrG2b9NkfHjP8UjIL2vWIT4zQVWcGtzT5azz2fN6pe5NjPhQYHOhpt
         TH2g==
X-Forwarded-Encrypted: i=1; AJvYcCU8H59pusy9f1G9X5iqWfH1GIaFhKgYY+ha+YtAGNPoYwELgB1n7BRxl4Q8mYUhyhpxEHCQow0u8D7AyQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlgI+uGseBPhAVJnpNS8/dHVdfi34Ly47zJsEhbezXPjs+onRq
	qBTy8SNthTHsbgYuHfaxE9WC18/i6YW2vBjP40WUFhK7wRjWFIGM4iFbi03o/iDQ1po=
X-Gm-Gg: ASbGncuuELuUXnCIqf6sPXyeEBmgzKuD6bXOBndZphvk7m5TgTq4BpYxN7RoO7swMrK
	Mk8Fpslv6nkWW7HtTGERK/k2OesLNwA1gx2xispR4xwJF84/rAMVydj858D0ba7IJA2+DXf/woz
	hvoHExxeVRf8+mtat+goSlE1i0Ov3D3/RXgxsvrxhCTpKj13bqx3S//8XWE6r+u4e68tSZulM9x
	SK2RWpqJjT88y2bqIIpJmN1wT6yXOpWsuCglT5lpuVJqaaTMCvq0nqczvB18rbZYN2SjlguiyOJ
	O8vwt9hL3LyOVsZaKRpj7Q/Jkv8bQZDs6vDh+BHo9zh3UCa9DJhWCR+YEUmFlIM=
X-Google-Smtp-Source: AGHT+IHEjkPhd0v9dHUnrSumRKqtP+XO8qTwXgH5hnKDzbAp7zerm30lnT7DxIhX8VkHWyBQkdAPVw==
X-Received: by 2002:a17:903:18d:b0:224:c47:cbd with SMTP id d9443c01a7336-231d3257fc6mr161226955ad.0.1747638518855;
        Mon, 19 May 2025 00:08:38 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4eba368sm53296525ad.200.2025.05.19.00.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 00:08:38 -0700 (PDT)
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
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V12 14/15] rust: opp: Extend OPP abstractions with cpufreq support
Date: Mon, 19 May 2025 12:37:19 +0530
Message-Id: <f4a35fcc3c4f6b737bbd359854ea12f5a53bcb37.1747634382.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1747634382.git.viresh.kumar@linaro.org>
References: <cover.1747634382.git.viresh.kumar@linaro.org>
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
 rust/kernel/opp.rs | 70 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
index 7be6fd33d93f..1e5fd9887b3a 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -19,6 +19,69 @@
     types::{ARef, AlwaysRefCounted, Opaque},
 };
 
+#[cfg(CONFIG_CPU_FREQ)]
+/// Frequency table implementation.
+mod freq {
+    use super::*;
+    use crate::cpufreq;
+    use core::ops::Deref;
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
+        /// Returns a reference to the underlying [`cpufreq::Table`].
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
+
+#[cfg(CONFIG_CPU_FREQ)]
+pub use freq::FreqTable;
+
 use core::{marker::PhantomData, ptr};
 
 use macros::vtable;
@@ -753,6 +816,13 @@ pub fn adjust_voltage(
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

