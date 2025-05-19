Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72162269AFB
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747638493; cv=none; b=o3Ugbrc4iyXhr/R5JC+1GF/rS7s9a+p7JEAIaJAYGansx3lgO9dXbGNcIrqwnDVzcc4STar5QSiCcBKgitdfpCti/GyRj77pFgAuDcJ5/DRFfQ8CJYMdS/cKvHFxklAEyv+xk4hJPkLZ9rPb+6hGi9OjC4177dUoHhKNql726BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747638493; c=relaxed/simple;
	bh=juOq7g4rijYkdxYFdOONMCnI1QPlZoKOeRbFNRc5CdA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lfQKLGiWl68clIgHDhoLeW6hxoLk+sErWwUI2m/+7o79YXr05X0kXuadjO4ly7bYPoAs2Jey/qa1h3VwxpZbW6G/HJoRr2CzYOI6S8ad873QoMJU2RECHUc8LBP0CpAtVxONqVb2rnslX/PKyXWZZ17XZbLTf6LMc9PAakm6Wpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wPZjBqtt; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wPZjBqtt"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30dfd9e7fa8so5058070a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 00:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747638490; x=1748243290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4r3X/jvGTdLizcE+YYmP7gaggu0BT8JGhgAP9zX20zQ=;
        b=wPZjBqttr+hHHhBIqnTEXaCYP6p1mVG29YFLK8j2tQ50zoHy4GnQUg5PtnJNT1PaKV
         zdDvuE8FhAIO6DomX7fSaiLE+EgRdnx1tz+t5mnaaTG4046YN8/c5lFQvtvA4Mborz3Q
         QY84k+DhIFRu3mtaM7wm8OeAp6SbdKZnvwkrHs6aofpvWkrrNIMbp7agIW+ePo4imshD
         33nw7pjAGEWD+IXsM46daodfEJvDyvXg4apXuL+qsBbC+50RBNXfdleODe+Ah77FBFCO
         SL4Oayuis4AZWnG6AhoA9swQ4GGp8zUeqhis2sVhYmcoaSOidJy4uEM64VUYIHIxEg7R
         F/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747638490; x=1748243290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4r3X/jvGTdLizcE+YYmP7gaggu0BT8JGhgAP9zX20zQ=;
        b=G/XlU6/9EVIEyLwST+WlZBlSHHbbPGcc9DGu4oxtFLHlIcj7JC3VpZ03YJ/CpLSF/9
         Xejh9r5G02I1Q+XwcDEpmNx5Mg3tEU00hkKrujurk/xL35ts5/x8MQrhAbdVpT/SVXy3
         F72AV9F6/hrp5XnneocUf1gwN8m/jriUve6J37X2tQ0jxh8kyi8c4PGJpbxNUt/gZPHp
         EApR6Ct9rkRo9sdqbt/0+bavg82qxrKFVJnfigfpM+T5y6h8PImcNQCmyU2iEq21IAsR
         QGMDwM1OAwsB1YVJf1UmRiqkHPWKZTcjViVJBxVM+Gr1CT3LOwCHawmzw9jfjNx1vGBG
         uEFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkHYce51G3PSHInHcN24IPaPs930J1mHZV7XXOoYSj4wzaKpwVl6MIAWBoFVhtZuQxDjT7qDo93KjKspc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5/ehNVx4bmSxytru0EJU6qemWTm6Q7auwXm284EH0Eip0uZua
	5QL5nwNvltC51Xb7xGt9u3c1/GBYmzt3n418gCUdwnQGSaPZoiT+LNabjwFmPp+1uno=
X-Gm-Gg: ASbGncvrhuLm1o+r8uXhScFHeChFprLt7IhppONjVVKcQ6yPUxWq+dS2NFJJxMBu+NS
	lBePOoPHlaqlAzqgYokI9YinL0RRuhJT1enGqIYvU6tnn27Nuu+S3h7jKKOel8V9fNctbcYVOPw
	32mYZvGnTJ2h3810nslUu092ymN/xXCnTD4zmTQepJgOwVr4VfC2I0ROKCuE8gQkGKAVtMvyIq4
	K+IUPFUVBx5nEcXkWbMNBJJI7tn1XzuMoTGplbktJH9G6JgMaAdji/9LoH62U+tCLZKRvF6R+sk
	Yokw8h37h1GqFHHU7+mR4Rlah9uS7wquJue/NfOP4cEDoRQs4DJD+++YdwMQNfI=
X-Google-Smtp-Source: AGHT+IEwnItI1adJ5eNRnfUIiONeAwIaER/7UxHP7sLjQh/2fUqJp7LQ0oLpGHM32/z5QPdXw+IjVA==
X-Received: by 2002:a17:90b:3b8f:b0:2ff:6608:78cd with SMTP id 98e67ed59e1d1-30e830fbe31mr19285978a91.9.1747638490516;
        Mon, 19 May 2025 00:08:10 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d4aa777sm5971781a91.21.2025.05.19.00.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 00:08:09 -0700 (PDT)
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
	Andrew Ballance <andrewjballance@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V12 07/15] rust: cpu: Add from_cpu()
Date: Mon, 19 May 2025 12:37:12 +0530
Message-Id: <19bc845f59e0a7a6bbc5c23353d04f96f23aaed9.1747634382.git.viresh.kumar@linaro.org>
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
index 3fd7c17cbc06..de0a840fcc99 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -43,6 +43,7 @@
 #[doc(hidden)]
 pub mod build_assert;
 pub mod clk;
+pub mod cpu;
 pub mod cpumask;
 pub mod cred;
 pub mod device;
-- 
2.31.1.272.g89b43f80a514

