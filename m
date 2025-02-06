Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E0A22D4C3
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834147; cv=none; b=h5VBA0QzuFluF/1OJwUFckz60Mj7MuSeRksoO/SQykBepcoQCuTMlKWfm/aQKNP8RdbZfvmq71SgC64W1F8bFUkkt9OWu6tU/a+0rI5shmtiIAo6FNzRN0emIm7D+9J9nizxW15aBsNiqt3xDYhoSR3LVuBXQ2ftnbDT+Xg0Fc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834147; c=relaxed/simple;
	bh=hNxUaqce8sjnkwzAQlWMlhW9DvX+XlFNHHx9DRtSdzs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jTb2IlJ/xD9Ud4ZrVShanZsF5BzCJ5ymT4aaLQpvZ/ieMW+AmJ1HTs+LbNhzqkwbzKBmRUU4T6EcS5GtAPU3/C6vrc4RGUTyWMSO1vIOAdp6DDaKXR5BsjkP4ipi8JSrrA1rH13olRqiqNtyQddLeToEvLB/KjAAi2rbzzBMD8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GJwe2eN9; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GJwe2eN9"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21c2f1b610dso17518845ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 01:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738834145; x=1739438945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2G2VXwMXVVwTjOULFIF4Y5hQffUd1BBYLZ5S5agX+0E=;
        b=GJwe2eN9R6OS5SV+yyTFO9EaC9rcaVkKbk1AbGKR/GRW0MAQtw/AP5VuDnq7I16ceR
         Gg2u92epq0vMtGdRboNkMm1AXjOKDdVqDloKntpGvuRWcPY+U7iK+/pjwxA2kkRz0r/O
         2tv39HFfoHKReiXN9HkQDCiL/pOFvl/aDR1cM/t+MFUZwRJ2BiiMxDMboDzaF+77mpU4
         IpY/yOdUD3lv4IRB7lEmagk+LAQ/ntV0Myk0j8bCBXKkuSROMa1Iwc4mLupSViXvG8Qp
         3gzTGMAp07WeYyhYh1hZbSgYYQvd3lIIKWPNw/S57tx0ruOy0NnVAsf8Lc2hBgNuXcVp
         bN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834145; x=1739438945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2G2VXwMXVVwTjOULFIF4Y5hQffUd1BBYLZ5S5agX+0E=;
        b=P+V2oReofAezmCxkJMUKml2WGxwfBjsZ6qRvJu7158sIBsdYO8+QOIbbSGOjmaTtxq
         d+R/g1FKnt6ioeFYpslnOFL/1Tge/ZIO7gh/cLmxNoY3MEU8VMFIBhfhNJdwIJJmOe6v
         UsGKRHR0FAGgOsYczupaaNiaNbVfv2QilxE8VMuP3LiqThptQvlPnIle5VXzxfrmKMUc
         YItnOXuVqOf1r+qUkYR29iKL3W99+bvO38egd5w7r2clWyyTNz5tfzlJKuTTAn4uRLLm
         7M/KRDZRJWsjoBEIwyc6bxiCINTlALlqQch4g76SufAlcubbUfTQT1+7ZFmaIE3JltT2
         LcgA==
X-Forwarded-Encrypted: i=1; AJvYcCXN0OrpzRtkQRI/Jc2J9N7/s/5qmMEZ2c0leUIgZe86/eh5WzLhCjcBaXw9mcuzuMCt8NVbteeF/oNstVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLjQwrEV81dJxZRYW04QnLUtduDbzxDz2hlaQU/hfOOPgz7c8h
	D3rx5wg8OMJkVrGcYvJ1JGQDPjzmSeCpBOiWxaO7GfOzU9VqIurtlWlQCmlFYkGQqWbmv7Gwb/I
	i
X-Gm-Gg: ASbGncufuKZwBITm1DicSN7+z+TADtYxWIIvTvNJJngw4TzJpsk7pq4AyFOX8DttdvY
	gFdyxh6Y0cpM+C+s85rG5ggCOmIHNGoxae/gWxvlrRpVfoxZBdDs45W7bN23lU9KQ1STHI1JNp4
	8m9OZRLWIiYdA55C1pRDpn18oZhrijCPcbt53Q0fW+LG5UufK6GugKJXndhM2QgfWUMUO5HYwuX
	1hlhcZ2Olp+N3Cd/huop6Wh06nDscAqLGTWXggeDaQZ7FOBHpWrv50N78RsAE5Pyt1kDY2piSRN
	BFynUq/jj2n32wwWDg==
X-Google-Smtp-Source: AGHT+IERZaH/yV6NhctlMcXLudgaGLxhDTf+gOxPascB2hUakJ8YcCEV+KZm6lvDnBVxg1aOgdZhiA==
X-Received: by 2002:a17:903:8c4:b0:215:a3fd:61f5 with SMTP id d9443c01a7336-21f17dde0c8mr99801325ad.5.1738834144997;
        Thu, 06 Feb 2025 01:29:04 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683ddc0sm8071205ad.123.2025.02.06.01.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 01:29:04 -0800 (PST)
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
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V8 03/14] rust: cpu: Add from_cpu()
Date: Thu,  6 Feb 2025 14:58:24 +0530
Message-Id: <35ef3767cb9e65cb4c95df7ed50c6f3f6190066e.1738832118.git.viresh.kumar@linaro.org>
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

This implements cpu::from_cpu(), which returns a reference to
Device for a CPU. The C struct is created at initialization time for
CPUs and is never freed and so ARef isn't returned from this function.

The new helper will be used by Rust based cpufreq drivers.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 MAINTAINERS                     |  1 +
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/cpu.rs              | 31 +++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 4 files changed, 34 insertions(+)
 create mode 100644 rust/kernel/cpu.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..ee6709599df5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6034,6 +6034,7 @@ F:	include/linux/cpuhotplug.h
 F:	include/linux/smpboot.h
 F:	kernel/cpu.c
 F:	kernel/smpboot.*
+F:	rust/kernel/cpu.rs
 
 CPU IDLE TIME MANAGEMENT FRAMEWORK
 M:	"Rafael J. Wysocki" <rafael@kernel.org>
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 55354e4dec14..fda1e0d8f376 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -10,6 +10,7 @@
 #include <linux/blk-mq.h>
 #include <linux/blk_types.h>
 #include <linux/blkdev.h>
+#include <linux/cpu.h>
 #include <linux/cred.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
diff --git a/rust/kernel/cpu.rs b/rust/kernel/cpu.rs
new file mode 100644
index 000000000000..3054165d3818
--- /dev/null
+++ b/rust/kernel/cpu.rs
@@ -0,0 +1,31 @@
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
+    // SAFETY: The pointer returned by `get_cpu_device()`, if not `NULL`, is a valid pointer to
+    // a `struct device` and is never freed by the C code.
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
index 496ed32b0911..415c500212dd 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -40,6 +40,7 @@
 pub mod block;
 #[doc(hidden)]
 pub mod build_assert;
+pub mod cpu;
 pub mod cred;
 pub mod device;
 pub mod device_id;
-- 
2.31.1.272.g89b43f80a514

