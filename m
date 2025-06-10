Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7F2298CDC
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561738; cv=none; b=eZr84ghEopJ5PQ5N/RVban+NOF4DSWK+Z4Ljhn23kjYnXQcp6oI46ykgAVTncaIzhgsIJjEGnYKdEa77JXv+pmKWY8Kdnxm5KxykfJhpPOFAz2FPvwRUR55PPqkyAR4NXhnS0yVKa/eQP8qlCVDGJin9H0yy//dQF87vdPUyJz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561738; c=relaxed/simple;
	bh=1trWxBrPAl76fxmsb+oeXOY/Ya77z6kO/+mfRMr7pEk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j4ziJOJSOfbfg6mqRpXYrxpab1qtAMUS2H4PnuVKsHIbIHD2kRXSMqoadv5FisOKMi73BSCx9dOn4o6ZaodgZK8SWkowxTLLQGYn+bckzqJR0RPijf/5YS7Gi+2dWPZ5kjTJRXFbT0UFXL2FHP6d9T3VNf9zzYNWodb2W/gpD40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jKH0vpCC; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jKH0vpCC"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2350fc2591dso44285085ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749561736; x=1750166536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klAB2ncfCtZERTrAyu2rbSFj1iTvAJjUvwJYS5sgM+0=;
        b=jKH0vpCCz1raMyiXndi0YUU1kk+gY6N0QddxJQcXVjSlJPaF3Kl8P4TMkDwBwhXOL+
         q5BBbgf7nwcEfUSz+wTQN6DbhNgn4hlPPxlonagpKqDYnsH9EZb0AdFXrIU2ClNBJMvc
         cPSDpn2NorLzXmwwE8u3zv02pKsYr5szWPHjXkdQVAq1JQyS2C6+GRJlZsd5RvsJevng
         5M4jKx82hQHNFM2YTY/UtFDULCTJxadoAqFUHMzALiKIatuMQIyHLv14Pn1SwiMs7TSL
         J6mbblxZE+Eh50BlJhv1fP8NzKzaVJcJdmc+VXdSxV7lZcqpwFbxkFjoUlIz5XF59fhy
         b4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561736; x=1750166536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=klAB2ncfCtZERTrAyu2rbSFj1iTvAJjUvwJYS5sgM+0=;
        b=W/GincvA8V6vOlTe1FRyP/wFrUonzqKdgoPYgSu5vS46fci9VOYfT0ZmcAMQk9GrkZ
         IJosQDPdEoYkDwVgY2a1btnDZVifmsjR1YR/JtmcSKZzgRYytCvAje0ipssHW79wxyPu
         j0sALCNdZzNJwMngIyPluo/mTe9hctkk9+5x1NIJGU3SPEdDa1odnMZqcN2jlQqhIXjy
         LTKUTN9gNJJkao6VqbNtF0S8pqrl5bHH0DB1i1759TtAAz6Jbeg1BY3kUIP0+8tlLyh5
         jmAeqykx1mSnQ+Wi5LLcVchIFN+AZtyBUEBe6VP34O2s5RBMqZFYWYTVjzU0DsgMsWWh
         MA5w==
X-Forwarded-Encrypted: i=1; AJvYcCURTY0AOodqSRptKArfrAJzV9mSoMkuEZIFXqj3p6EMss7O8UOlfAXZTEaJyBPMXr6QBegEnarPA/oFvFg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqu3zgIsIr9vH8N15L2Sbg8fp15aVpBuoGtTxiz1TfkaW8ntKo
	Z0U43FfcKLepzAh3oxzWxA7jt+ilphl1edGnupEmf7iiCoCJQB1Tk26TuFmRrorL0vs=
X-Gm-Gg: ASbGncvtElJeQqhDIgjUqO32C2QfUWQAaPLSIejl8Pq6qz+UdcvfL5sSgroG5q58uR6
	U0G3OBHnqhc99SrssPWCufA3jCAfeiIzW/Rfmv7Dprb4KpckiZo5g4HeZcimpSK601BHRZypc/c
	5qTNLNYiGVXJ2eL99sj/hEP99k6eu2lRKjZlUtnWue4H2KZKVQsvXX1wYgalOShYvwZyvGMN0dI
	sDUVVsjO0QSKItFDA2MbF8XyvVLuz/MFlj0xlgeA41kiouqRUHUMQ75+Z/iVZZqy4tPzePDqoF2
	1KBACDRWMth4cutUuuLSlDQRsHtWxhRe+Pqf8pyXsvDAmpfbCgeKknTu0EHOGzaO/NOsNFr5rQ=
	=
X-Google-Smtp-Source: AGHT+IEqVq8mQti3tRT+eBtluesPlLE/oLnB08dp/lHegWMkSJCFxjWNMm/J+IaFVS/OPUwi9sABqw==
X-Received: by 2002:a17:902:ccd0:b0:236:15b7:62e3 with SMTP id d9443c01a7336-23635bb9896mr50735745ad.9.1749561735859;
        Tue, 10 Jun 2025 06:22:15 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034061f3sm71537895ad.179.2025.06.10.06.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:22:15 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Boqun Feng <boqun.feng@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Yury Norov <yury.norov@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 3/3] rust: cpu: Add CpuId::current() to retrieve current CPU ID
Date: Tue, 10 Jun 2025 18:51:58 +0530
Message-Id: <a2e12436661fca452de5c417242328ed6f413511.1749554685.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1749554685.git.viresh.kumar@linaro.org>
References: <cover.1749554685.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce `CpuId::current()`, a constructor that wraps the C function
`raw_smp_processor_id()` to retrieve the current CPU identifier without
guaranteeing stability.

This function should be used only when the caller can ensure that
the CPU ID won't change unexpectedly due to preemption or migration.

Suggested-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 MAINTAINERS            |  1 +
 rust/helpers/cpu.c     |  8 ++++++++
 rust/helpers/helpers.c |  1 +
 rust/kernel/cpu.rs     | 10 ++++++++++
 4 files changed, 20 insertions(+)
 create mode 100644 rust/helpers/cpu.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa16..4255186784c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6254,6 +6254,7 @@ F:	include/linux/cpuhotplug.h
 F:	include/linux/smpboot.h
 F:	kernel/cpu.c
 F:	kernel/smpboot.*
+F:	rust/helper/cpu.c
 F:	rust/kernel/cpu.rs
 
 CPU IDLE TIME MANAGEMENT FRAMEWORK
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
index 7549594fad7f..a946c8a9d1a2 100644
--- a/rust/kernel/cpu.rs
+++ b/rust/kernel/cpu.rs
@@ -102,6 +102,16 @@ pub fn from_u32(id: u32) -> Option<Self> {
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
2.31.1.272.g89b43f80a514

