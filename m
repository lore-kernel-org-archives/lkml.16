Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2B6259C8D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745220193; cv=none; b=ebDPUXLRz+cx3Y4zxcvs4yQl1Md5Gqq4Y9fUlA80tn7OoAla+DMSLd64dRMuu4orHBWmNcesDSSb8ITaJOvGVuKJTrceD8air/2Pfzc2yrmThSxU1kPMrWeJyEj6qtHXXNeph88lEtPHpUv7w2r7d5s5sofSLCSuTa65WuvFCUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745220193; c=relaxed/simple;
	bh=FXN7MqRrTtWb3HqWkB4bVWXQmRagu7xa10NZ2Fw72s8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EAvJsl3EjdGZLdHfq2sM/sujEpfw2NWyO7wV+sEgKrR3x+lJoFvZQ/DhujfpuckVxOOdK7d2VEFQ49NlDKkIs8hBplCMSgql0EkRTfHWfPscWaWggItRfjU5dcNbpZTDxPNyRRyGv8/NfkXk6umFyR26gaDJN3Hpw8qyZqC+rOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qf3q1yQd; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qf3q1yQd"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2254e0b4b79so55295115ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 00:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745220190; x=1745824990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8I9rp3cxJf7RfTSYMTTz5L7zI5/p8FTKb0IR9cJ6SsU=;
        b=Qf3q1yQdG3zOTxzKwSb/7kSsynDOuFd7KyStFoald5YZ9HEYBQjsujcoUb63oiBfQi
         lIF+xvFkh9oBKAfpOiHrdx77rdkcHBv9Xz64SUXQbqYCD4fh9LDBlrR69FJ0puI7F1AZ
         kV0n4Wkb5JNE4ggOM7f5W/rPowm9C652x+wxICsk3uyiihUgkJJHNIM2BVGx7Ysi5ZO1
         hxUMvmJD8C/Kcyky262ts2R/JInlnG2X2f5YD5A4YbYnDpaujnL7BmfnxlXXb9xI70j5
         gif2VDwjLTV9MMgA8BF2XYh1c8I1UpbiUVQ9Yypy/m0U4yjUtQIW4C472YzcTmkAQxfB
         /V5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745220190; x=1745824990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8I9rp3cxJf7RfTSYMTTz5L7zI5/p8FTKb0IR9cJ6SsU=;
        b=ejMa3WPFP9UGEVcYZ542Fwfcad2oX8WpChMe30mQ88rHP6V9FZn/6bKeDngHzzGHvS
         0PdRLxEwcqLRuJioi09AokLIZGx2UTDd/3IaF2aX/lg/M4p6+BShRPsntTWfsXazkr/u
         jyWzvSmLZmM9JVaeIT0kNWYxbxXZO2uEJZdABDpynsvZ9DksLHxQCN6CEEfaTT8lpZ+8
         zxLGb8etKD7A22GIpkB5oO3kwNuW4K6y+Iubx/jlPR66ZeBsPLCQIMBtOT2BKUTrs7Cs
         jIkP+LQxf0f0qQ5VPg+dexqUQ8ayJftHDDaROLGh4/D2T1PmMfCWCSuBt2HePDZvHaLO
         T86A==
X-Forwarded-Encrypted: i=1; AJvYcCX0TFUGu1ZSE8/3f1Slkr1bFVOsXY+S1D4CO+Jn2XYjIdD8MohusIlql+2NtxOKhyRIRze5xXt44ri38EA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaRSJvb8td9ccbjE7RpGpGaqqtjKADRdkSx5k4AJDgVZFiG4xh
	3Ah70c6bqhjn5k7wLY+ok5CsfTlXySZ3SN5VDUaWiI7FmiJ1SLD/KoIEERqeIVE=
X-Gm-Gg: ASbGncsoPnQFCJocHBDhiJJ+AglU22BZP/I0XqZUS4RLh32nILVKRZCAsToweQHiYI3
	KIHIVq0vrbTYexOllGjAy++6KO2Z27WjSzkK0H8p03RofFjikJHNFX66zT6fagnpzil2tm/0k89
	kmBeyyS0Y2oi75ztcAsXdPbP6S1attotFuUnIYRZemHSU2bdycxXxfZ3riKmNZmqK9njUdgJQu6
	V17tgJ5kRJPSuUkQJgJrGXptGq6s75nofIk8mCSiOEBQZJ+tNsdJLCJuFuEmIrhhFxr0Stcjvmo
	L5GRiMyuBmAXn1M0AkHpbKM2bZpsIdCsXCcXsVUTow==
X-Google-Smtp-Source: AGHT+IHFViiSqvN/JjpJph9siMmkqqAkklZQddDpCT/0uxRK48dl3jb0Ucb0eHxYFvXN2Sctr5P1hQ==
X-Received: by 2002:a17:902:c40f:b0:227:e74a:a05a with SMTP id d9443c01a7336-22c5361d29emr158103045ad.44.1745220190470;
        Mon, 21 Apr 2025 00:23:10 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf5589sm59396595ad.102.2025.04.21.00.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 00:23:09 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
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
	linux-kernel@vger.kernel.org
Subject: [PATCH V11 07/15] rust: cpu: Add from_cpu()
Date: Mon, 21 Apr 2025 12:52:14 +0530
Message-Id: <cf7c84e4fcd5ef0430d11e02cd727120ba94a248.1745218975.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1745218975.git.viresh.kumar@linaro.org>
References: <cover.1745218975.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This implements cpu::from_cpu(), which returns a reference to
Device for a CPU. The C struct is created at initialization time for
CPUs and is never freed and so ARef isn't returned from this function.

The new helper will be used by Rust based cpufreq drivers.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 MAINTAINERS                     |  1 +
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/cpu.rs              | 30 ++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 4 files changed, 33 insertions(+)
 create mode 100644 rust/kernel/cpu.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 12cde55579a0..475abf72869c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6155,6 +6155,7 @@ F:	include/linux/cpuhotplug.h
 F:	include/linux/smpboot.h
 F:	kernel/cpu.c
 F:	kernel/smpboot.*
+F:	rust/kernel/cpu.rs
 
 CPU IDLE TIME MANAGEMENT FRAMEWORK
 M:	"Rafael J. Wysocki" <rafael@kernel.org>
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index f53d6e1a21f2..ac92c67d2c38 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -11,6 +11,7 @@
 #include <linux/blk_types.h>
 #include <linux/blkdev.h>
 #include <linux/clk.h>
+#include <linux/cpu.h>
 #include <linux/cpumask.h>
 #include <linux/cred.h>
 #include <linux/device/faux.h>
diff --git a/rust/kernel/cpu.rs b/rust/kernel/cpu.rs
new file mode 100644
index 000000000000..10c5c3b25873
--- /dev/null
+++ b/rust/kernel/cpu.rs
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Generic CPU definitions.
+//!
+//! C header: [`include/linux/cpu.h`](srctree/include/linux/cpu.h)
+
+use crate::{bindings, device::Device, error::Result, prelude::ENODEV};
+
+/// Creates a new instance of CPU's device.
+///
+/// # Safety
+///
+/// Reference counting is not implemented for the CPU device in the C code. When a CPU is
+/// hot-unplugged, the corresponding CPU device is unregistered, but its associated memory
+/// is not freed.
+///
+/// Callers must ensure that the CPU device is not used after it has been unregistered.
+/// This can be achieved, for example, by registering a CPU hotplug notifier and removing
+/// any references to the CPU device within the notifier's callback.
+pub unsafe fn from_cpu(cpu: u32) -> Result<&'static Device> {
+    // SAFETY: It is safe to call `get_cpu_device()` for any CPU.
+    let ptr = unsafe { bindings::get_cpu_device(cpu) };
+    if ptr.is_null() {
+        return Err(ENODEV);
+    }
+
+    // SAFETY: The pointer returned by `get_cpu_device()`, if not `NULL`, is a valid pointer to
+    // a `struct device` and is never freed by the C code.
+    Ok(unsafe { Device::as_ref(ptr) })
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f4dcfefe94be..db372f806875 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -44,6 +44,7 @@
 pub mod build_assert;
 #[cfg(CONFIG_COMMON_CLK)]
 pub mod clk;
+pub mod cpu;
 pub mod cpumask;
 pub mod cred;
 pub mod device;
-- 
2.31.1.272.g89b43f80a514

