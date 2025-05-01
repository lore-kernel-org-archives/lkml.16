Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E54B35893;
	Thu,  1 May 2025 01:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746064716; cv=none; b=WzC7LsYfG+knPw30NFUo7/3KpQ7GGGE0TwF32jS6SKCfxxoEWjrr6pqZCnwGiN8NZ79X0YS4STD5HtwT69PE+1B8R5O1VOVjZmYLSaGlF5yxM5aUHEeV37d8ISW/yMo4WkDFv2GMf5dPRU/s7en19zQw408GKU87wb3gEEmgbKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746064716; c=relaxed/simple;
	bh=58Mw4Mgy5Lw8zwl4hrtuAwNYbFkwzUDGKfPeXfOthcs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VBgIMZG2KdyNQrQ+2rb80DLQrjw0A0WrHk3WwRydgbtDy5JWPutDViJ4M/58W0oldq4FRL7XS6kWgNwGSJg4QUirf6meUDV5eNG3TiL+DdP/lJNPJXlfOaUeUpxm+SCbSe2jOlOK5ZE6RvgyoEeczArwh1uqScd2WshBSnuzrp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHvJYapr; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHvJYapr"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736b98acaadso499431b3a.1;
        Wed, 30 Apr 2025 18:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746064713; x=1746669513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ch97n5XALhY0tN6phWrpbON+THybZhdH+0oi8/ViNDA=;
        b=LHvJYapr/7TGz4RZhkvnl8PX752EjJ15jm9e+MUfWVuC71HfDBBLrmFjD7kLOKXUH2
         v1XZCcVWgSjgz9U6mpYVOfRvZv7I4vOKkUrJwMc21GIrSjNHZDMHVMpmOjvcyOWz8iiP
         dDBWcV+Bzw2HwJ5OwWBx8yLAzt22m2LJ6eC+oxftnRsMZ2zEEL9vJwDMqHzxgkhyRb1K
         H6Vrp7qds6z2U54Y70cc/o4Yarp23MLYv4hnwsUDIZJ/s62mb9R9zKS7t6MDdI5pkCuX
         jrwt59Hqf+lo+YF/L2rPf8hiHGAiiK/wnqA8nInTbkPBV5sanMCAN7qmLtOMCvOAthvO
         Cttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746064713; x=1746669513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ch97n5XALhY0tN6phWrpbON+THybZhdH+0oi8/ViNDA=;
        b=UfYyPX8/4ew0icpIO7VoTl8ZiiNrRu08QprnPr2qzk2iLRsNbUaaAqcjdGEpDFH+pn
         rXc+aZ40KMcCnxz5268fchUmNCy2+OAArm4u1jMdiRWuHwo2GQq6UXmKUj9yOlCGZd2k
         edwN7N1swUXvay0z1rNFH6pKsk3Z21J7Xp6L//RdO4mV/t2W7Hb0TtgITqxViWC9g1ZX
         3mgS2IahRhlE7K264pwR+VbbqP3HUr6g91EJas2uwI40IZ6MK5w6Vek+Pd9fQjRDV12J
         HndiMeidC8z4fWEuKbVQuYsKgObyFdrQOZxBx9klyBCuUp60r3k4c/f0hoY2utPAVxss
         WlBw==
X-Gm-Message-State: AOJu0Yya9RfE/IaVv1Vi12pmSo4C3iqQTFLFgw9q91uWKGf8MaPLnftD
	JmN+c7Vv/Yf2b3vC5AbGNaXqnCPf9S49BeAMStCZF2IrlSY2I2386AiwQasy
X-Gm-Gg: ASbGncs0E+G+SUSUnaumf1CxJ7wzd11WDzhikb1v67j2CVOHWeqGGq/W9NriX00Ywoh
	97kjnj3QvegnHMfNS7qkYfq98uaZrd70xVjwvOhocB1w7o8rTWaB9ANhszR/ZkTliJ58yMWbBgT
	peWC4+0fuiwDQDVe7FyXOMiQ16nwC3ls11xBA7IBXqKJWPwQLQbGp4r3Bsulg8uudSNU8uAdFG9
	ngZOarsY2r4MacyJZHfbLYg8BnKgjq66OitSGjHFMX+qbsLxs+tOL2W0o5oTERwqcoxvJYWPdb/
	QRpP3LniNrLi0RKmScW288vXpppOTicONqLFJIHCddgwOxduHjynRlaNlB8SiYEL/JB7EkoRfWq
	OI5N6M3YfRPsghBsw08LMK+H2nOCd
X-Google-Smtp-Source: AGHT+IHQjXDzs7wJcnk6gZjEJ81KaQC8moIvMcFsuq5WUzmeTCbV9Hn2MLC5dKt6PwqdvuMJlNX6WQ==
X-Received: by 2002:a05:6a00:130d:b0:736:3be3:3d77 with SMTP id d2e1a72fcca58-74038a84f32mr8064055b3a.16.1746064713411;
        Wed, 30 Apr 2025 18:58:33 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740398f97e6sm2441652b3a.36.2025.04.30.18.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 18:58:33 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	a.hindborg@samsung.com,
	boqun.feng@gmail.com,
	frederic@kernel.org,
	lyude@redhat.com,
	tglx@linutronix.de,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	aliceryhl@google.com,
	tmgross@umich.edu,
	chrisi.schrefl@gmail.com,
	arnd@arndb.de,
	linux@armlinux.org.uk
Subject: [PATCH v1] rust: time: Avoid 64-bit integer division
Date: Thu,  1 May 2025 10:58:18 +0900
Message-ID: <20250501015818.226376-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid 64-bit integer division that 32-bit architectures don't
implement generally. This uses ktime_to_ms() and ktime_to_us()
instead.

The timer abstraction needs i64 / u32 division so C's div_s64() can be
used but ktime_to_ms() and ktime_to_us() provide a simpler solution
for this timer abstraction problem. On some architectures, there is
room to optimize the implementation of them, but such optimization can
be done if and when it becomes necessary.

One downside of calling the C's functions is that the as_micros/millis
methods can no longer be const fn. We stick with the simpler approach
unless there's a compelling need for a const fn.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/helpers.c |  1 +
 rust/helpers/time.c    | 13 +++++++++++++
 rust/kernel/time.rs    | 10 ++++++----
 3 files changed, 20 insertions(+), 4 deletions(-)
 create mode 100644 rust/helpers/time.c

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 1e7c84df7252..2ac088de050f 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -34,6 +34,7 @@
 #include "spinlock.c"
 #include "sync.c"
 #include "task.c"
+#include "time.c"
 #include "uaccess.c"
 #include "vmalloc.c"
 #include "wait.c"
diff --git a/rust/helpers/time.c b/rust/helpers/time.c
new file mode 100644
index 000000000000..0a5d1773a07c
--- /dev/null
+++ b/rust/helpers/time.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/ktime.h>
+
+s64 rust_helper_ktime_to_us(const ktime_t kt)
+{
+	return ktime_divns(kt, NSEC_PER_USEC);
+}
+
+s64 rust_helper_ktime_to_ms(const ktime_t kt)
+{
+	return ktime_divns(kt, NSEC_PER_MSEC);
+}
diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index a8089a98da9e..e3008f6324ea 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -228,13 +228,15 @@ pub const fn as_nanos(self) -> i64 {
     /// Return the smallest number of microseconds greater than or equal
     /// to the value in the [`Delta`].
     #[inline]
-    pub const fn as_micros_ceil(self) -> i64 {
-        self.as_nanos().saturating_add(NSEC_PER_USEC - 1) / NSEC_PER_USEC
+    pub fn as_micros_ceil(self) -> i64 {
+        // SAFETY: It is always safe to call `ktime_to_us()` with any value.
+        unsafe { bindings::ktime_to_us(self.as_nanos().saturating_add(NSEC_PER_USEC - 1)) }
     }
 
     /// Return the number of milliseconds in the [`Delta`].
     #[inline]
-    pub const fn as_millis(self) -> i64 {
-        self.as_nanos() / NSEC_PER_MSEC
+    pub fn as_millis(self) -> i64 {
+        // SAFETY: It is always safe to call `ktime_to_ms()` with any value.
+        unsafe { bindings::ktime_to_ms(self.nanos) }
     }
 }

base-commit: 679185904972421c570a1c337a8266835045012d
-- 
2.43.0

