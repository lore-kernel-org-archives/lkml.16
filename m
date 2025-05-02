Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081E413B59B;
	Fri,  2 May 2025 00:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746146782; cv=none; b=P4CSfBql7dI0PR6jULR4RuzMChnkqGZIissp/SRvYje57GPYv10gYxSVjcNPj/RlY7GGxcIKOeL1swpXd/5grfC62LlcGIgTNxwBOf5MWbfcHlB7zl1LaDhhd6+SD8ivJJh4Xs5kZy1HzTaQMynMcKrCnSa18y8dksELMxXKuCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746146782; c=relaxed/simple;
	bh=ckp4BYh+0ltp4gB0E82uUFruWYJ9h26auPASRUlDD1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EUOLWmhHiEF9Gly6S37WlkCJb3rNCe6ORvLkvASFjd/7+iyfqJSCsCngHUrKryxH2p8XxhCQAPDBgsqBUqqjJOg6L732CmJrw50o6zD/OePQL+87hje6VztDaYkDIspzppRcXWcG9V5Fyv7nn/cBfenoVqLNGhmmt/tGROGik8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOjcEtyo; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOjcEtyo"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3014678689aso1294577a91.0;
        Thu, 01 May 2025 17:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746146780; x=1746751580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4RstIddaVEtOElaRmpn5euPEqZBshLgab0c4Ahx3ah0=;
        b=QOjcEtyoeFEI+YjEMQly6qgCk56+MNakI3CLo+2Ld/BIj8lHtNqlmsTxG5NtR2nXFX
         1TC27umrdpQ7MWbFQBOPRCd98KEsTDHgDyg+0hitALoaLTdMjPyh2RlK7MmeyRi6o3dn
         /eoa7k8TeDYU11wasCHKoLT62nIvygoX9hpBlZJJqrc/P3S8Ooruco6zyIy4Wr6jecS3
         ubwKC4ENWpui9hwso3tpDD8VOt0vPMxPlEbOkRbuv2cZmP2WtWxSBWd0FphQsYC41489
         c08odGSvFDOZf31RZicogp3mfnK5XTVTvfMN5+hOeaeYdTcBOr4JHSU4pVnpoWw3sdY6
         55eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746146780; x=1746751580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4RstIddaVEtOElaRmpn5euPEqZBshLgab0c4Ahx3ah0=;
        b=bYkTIt/DVuFm8Sp3xi1XWi0JHYnMFUPHxMIc9Ikje4B+0+eb13eHqFIWeGCFYRKARX
         UgnbDPKH330KAJe80srk+VEvicLWbWWTf90Kq9yq2eAq3+Rp/MjqLLauXzN14hipESOA
         L1WgVykf2OYK/H6Ma6QrJQ3NzUnz+mHf2obFUYx0ydLe1AkNBQdMK9mXrM5bwdCn4gHu
         v0Gm8UGyjTipnQO/ReF2oiXi77UIhUHbV4XS2n1RXwl9CRsjB227L3TK+2xx8aoqoBkd
         +xEZBIVKR4tLNsoQT6D5+5i/P1zDK6rfZWUTppeoj5QDRIsml36uxlhRuzwpxPY8MRop
         kICA==
X-Forwarded-Encrypted: i=1; AJvYcCWTjNFFMylXUUbh5ZUnw19q2pzAz6XCYKNdiE+lFXIWGuziDrPL0TFihwTM4HzIUKRgvPWCtYGvadI5mlA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3l5/mXBzYkmTIGBGVRDF8MSJ0CNOvWMxjesJjLrs6Q8m77/Fu
	YlRJvykCQBdPeMboEPtN7/TqDDCmenxPBGAsyWOOR4HhjX9eQ3BVKNgWW4m9
X-Gm-Gg: ASbGnct0Akmb/XYWd7rqrPoxqa/PQyv89tqx9EKFwnTVwK6eK18YPifCoU7d13s15ve
	xgyXho6v5YeMIxLPpkPfjgJ6NivPR4NxW34juzI91zko4jFQT8LaJfzxGAEZC7vDwRW1+OVbZtk
	yHO8KngRLlUqIX/tVY9zBN3DW3nHauzlvIcBia8tdi0tyNEGsRk2xrQ+50dYG5H5zIkB9fDO+5e
	5djArdW4eD5AtgfCNdVbEkwlcE8kBF0eEuvt3rkL0mIapCCwv5rJXSkO1RZsCWimHhg8TCgmFxW
	ezXjmzF7qiulAZ+/8ICQIyddrT8931J9ygHRqeXZCn6aW4CjJtOxFHAzqOKQ4NhIusRKf7bmYx9
	A/6Yh3Vgzr/D2hN+ESA==
X-Google-Smtp-Source: AGHT+IFTT/m2lfWUrCRjqd1HOHC25mow6B0tvkrcD2aAAAu4Fniz1kBsddCBXQQx68Q/KbaGlHpJXA==
X-Received: by 2002:a17:90a:c88f:b0:2ff:5357:1c7e with SMTP id 98e67ed59e1d1-30a4e5c1eb6mr1576092a91.20.1746146780026;
        Thu, 01 May 2025 17:46:20 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a476421aasm1561976a91.49.2025.05.01.17.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 17:46:19 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-kernel@vger.kernel.org,
	a.hindborg@samsung.com,
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
	linux@armlinux.org.uk
Subject: [PATCH v2] rust: time: Avoid 64-bit integer division on 32-bit architectures
Date: Fri,  2 May 2025 09:45:24 +0900
Message-ID: <20250502004524.230553-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid 64-bit integer division that 32-bit architectures don't
implement generally. This uses ktime_to_us() and ktime_to_ms()
instead.

The time abstraction needs i64 / u32 division so C's div_s64() can be
used but ktime_to_us() and ktime_to_ms() provide a simpler solution
for this time abstraction problem on 32-bit architectures.

32-bit ARM is the only 32-bit architecture currently supported by
Rust. Using the cfg attribute, only 32-bit architectures will call
ktime_to_us() and ktime_to_ms(), while the other 64-bit architectures
will continue to use the current code as-is to avoid the overhead.

One downside of calling the C's functions is that the as_micros/millis
methods can no longer be const fn. We stick with the simpler approach
unless there's a compelling need for a const fn.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Suggested-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
v2:
- fix the helper to call ktime_to_[us|ms]
- use cfg to avoid calling ktime_to_[us|ms] on 64-bit archs
- update the commit message
v1: https://lore.kernel.org/lkml/20250501015818.226376-1-fujita.tomonori@gmail.com/
---
 rust/helpers/helpers.c |  1 +
 rust/helpers/time.c    | 13 +++++++++++++
 rust/kernel/time.rs    | 26 ++++++++++++++++++++++----
 3 files changed, 36 insertions(+), 4 deletions(-)
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
index 000000000000..3d31473bce08
--- /dev/null
+++ b/rust/helpers/time.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/ktime.h>
+
+s64 rust_helper_ktime_to_us(const ktime_t kt)
+{
+	return ktime_to_us(kt);
+}
+
+s64 rust_helper_ktime_to_ms(const ktime_t kt)
+{
+	return ktime_to_ms(kt);
+}
diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index a8089a98da9e..b0a8f3c0ba49 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -228,13 +228,31 @@ pub const fn as_nanos(self) -> i64 {
     /// Return the smallest number of microseconds greater than or equal
     /// to the value in the [`Delta`].
     #[inline]
-    pub const fn as_micros_ceil(self) -> i64 {
-        self.as_nanos().saturating_add(NSEC_PER_USEC - 1) / NSEC_PER_USEC
+    pub fn as_micros_ceil(self) -> i64 {
+        #[cfg(CONFIG_64BIT)]
+        {
+            self.as_nanos().saturating_add(NSEC_PER_USEC - 1) / NSEC_PER_USEC
+        }
+
+        #[cfg(not(CONFIG_64BIT))]
+        // SAFETY: It is always safe to call `ktime_to_us()` with any value.
+        unsafe {
+            bindings::ktime_to_us(self.as_nanos().saturating_add(NSEC_PER_USEC - 1))
+        }
     }
 
     /// Return the number of milliseconds in the [`Delta`].
     #[inline]
-    pub const fn as_millis(self) -> i64 {
-        self.as_nanos() / NSEC_PER_MSEC
+    pub fn as_millis(self) -> i64 {
+        #[cfg(CONFIG_64BIT)]
+        {
+            self.as_nanos() / NSEC_PER_MSEC
+        }
+
+        #[cfg(not(CONFIG_64BIT))]
+        // SAFETY: It is always safe to call `ktime_to_ms()` with any value.
+        unsafe {
+            bindings::ktime_to_ms(self.as_nanos())
+        }
     }
 }

base-commit: 679185904972421c570a1c337a8266835045012d
-- 
2.43.0

