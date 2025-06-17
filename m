Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F2324E4AF;
	Tue, 17 Jun 2025 14:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171357; cv=none; b=B8+nLZcrY7xi1zgOJ+I7NcF0chcwXbKmnYNa2ji/374bKc8YrS25fbxLva/e0QpjrSbP06BZ6LZHNFEXSLAVVpMM1BCThSHKNPPCKripK1B9Hp5DvsrG567FOBiMeebSC5+loid0wpSSlL7KuwNnnUC2RrbOY2vBYxSqq9cqV2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171357; c=relaxed/simple;
	bh=8F3Gej9CQvM5OpILI6AI+BRXx8mI3MbC8tMra4NwCTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gmkFXJJlqBN4tsFLu9SSCuIm4y4pdDJlNgXSiKRLig2PCrtfgxapGmvg1A7zVZschaLSqokHV1csuwUHfJ0oVjVLGOQStWGLKH+yJQqf22My28mGkE4nT5EwyeynQfFbSe5v1oEk6KlTe7uAhFGOjWx3jEqPDrfCRbRpW/zvST0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUcj26EG; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUcj26EG"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b3192eab3c9so3800078a12.3;
        Tue, 17 Jun 2025 07:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750171353; x=1750776153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aviX3nO2T2fNDcaXkbjG6JoePALe4g3/UdTCpFXe6Nw=;
        b=HUcj26EGUTfil+9CpPc8BOSz6fl0IpgtqDXk2wrohcSjBIrufstH03l4MzvLW3OXuj
         wgE3PFUxtxHM99ngSlj20aU7r1VG5oTnsEKJX2hpa/0xMoWHRTeWzOnBkwQrh1mHCx3Y
         9zm1BzD9OZIGYY6J35+6vlLYfY3rD23/DX/8RK3AiFsVLD1GhP5s/g7TK/L1UoUfsPiD
         rgKDc3U4562Yp6g89ZwvQlX+ZqxkkTgve8hMiHI2s3EFM5zaOIYpAaYzVIkqRRkA0Ezx
         /eP7iFvLjuW6ReiXlen7VvEWAWdHsa/vOzdrM8aXPonX0Lo60iEMFmZbrVZYQF4wKOfe
         kS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171353; x=1750776153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aviX3nO2T2fNDcaXkbjG6JoePALe4g3/UdTCpFXe6Nw=;
        b=ATOAAP35vx4kdt6nPkX/e3d0FuIqHaaFxLyPMAaZMYmIMfmxC+GC95lf7IGb3grVOW
         goyIpmC1F67KafB7D+M6kB9YfzOuI5u7jYm+c2DC4jbxPal63cvWTlelRcyNyo5b5wkl
         /65IMA9FWmFTNbqvT3DFtu0/TPe7I3bKMuI0zdtaSSt1GissnVNxvy8Um1qgF09+qylq
         af7rB02tlguSCYZ5Y4mr6aXv6RfOqmpUX06dI89gd/BLBVYnHi+oBgGmGVHgZWnBrHmT
         JIAaxwew5jK1eKBpfXLh/5F3wuEhQ2jFP1rahx6P5VyqvvS36XjOw/rRHWoGKmI2ODE3
         nzPA==
X-Forwarded-Encrypted: i=1; AJvYcCW+WY4X+w9o1qT2OnQZmTNmUsF1zbhCMUmmWEDHFEb7V83s7wEyZgkS5fdZ693J3yWauIZd7y+Itf7WkN5wxx4=@vger.kernel.org, AJvYcCXSlYCgfBySuB1Tod5nZT4B7+ND9CUo2SaCdpzpNgEbpuJhZ1ID9In1VjWZy5TqPbd9TMfv0fwqAbmEph0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKRaM2TbxueMDbqOjegUV2RFxkfryPgP6M5IpYEch3vrK37nlN
	Ku59Yq5eGGqpHbw0mfUsC/HiFBtRQR9aMK4iEUnZc4/7zaAb33R8SNyp
X-Gm-Gg: ASbGncteJxY2MaUmUMwjpDJ3mBGSdud4CEfK5Y8PdoNnED7w9LRvrKecGRJySbOqpNa
	WrZr2iLNUOJmuRD/TVD9Gv10X6KzOjJv4zhN1LVogsU0YgHfrPtGTjXbvD8kwhsgVWCy7PjADhc
	Dd55QGKXQF8pmZo/ige7BvA5fPe6Ols5NYvHlEMkO0g8zlnfG5yV/KfqxEytr97nAzsCS9BCDCT
	uQFTiBQAAS0+dcMi1pkx6/TNNy0z3WhxwjvxBPzQQRB7TLnRfLRceoyApZStx6Wh6BZxL4z+3kQ
	YY1T42ol8Tjv0vpF+laDTR+wFvi8LfPXAFDlUPNOKfKQxMev4Lpc1DMi0kzXohMzxO2xEaWdfqu
	LbHzP4/+FgOao+4caI0tcWktzx9TSAT0/89k=
X-Google-Smtp-Source: AGHT+IHXaySx6R1AWkUSP4opgLvhnfsHJyH2iUuHDkUiwQvxjfSFdAllWb1EJTDv9UqjGHvuDj1nRg==
X-Received: by 2002:a17:90b:4cd1:b0:313:1a8c:c2c6 with SMTP id 98e67ed59e1d1-313f1ce5ca1mr26235185a91.16.1750171352919;
        Tue, 17 Jun 2025 07:42:32 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1c5feebsm12029828a91.41.2025.06.17.07.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:42:32 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	ojeda@kernel.org
Cc: aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	lyude@redhat.com,
	rust-for-linux@vger.kernel.org,
	sboyd@kernel.org,
	tglx@linutronix.de,
	tmgross@umich.edu,
	Fiona Behrens <me@kloenk.dev>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v1 2/2] rust: time: Add wrapper for fsleep() function
Date: Tue, 17 Jun 2025 23:41:55 +0900
Message-ID: <20250617144155.3903431-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617144155.3903431-1-fujita.tomonori@gmail.com>
References: <20250617144155.3903431-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a wrapper for fsleep(), flexible sleep functions in
include/linux/delay.h which typically deals with hardware delays.

The kernel supports several sleep functions to handle various lengths
of delay. This adds fsleep(), automatically chooses the best sleep
method based on a duration.

fsleep() can only be used in a nonatomic context. This requirement is
not checked by these abstractions, but it is intended that klint [1]
or a similar tool will be used to check it in the future.

Link: https://rust-for-linux.com/klint [1]
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Fiona Behrens <me@kloenk.dev>
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/time.c       |  6 +++++
 rust/kernel/time.rs       |  1 +
 rust/kernel/time/delay.rs | 49 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 rust/kernel/time/delay.rs

diff --git a/rust/helpers/time.c b/rust/helpers/time.c
index 08755db43fc2..a318e9fa4408 100644
--- a/rust/helpers/time.c
+++ b/rust/helpers/time.c
@@ -1,8 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <linux/delay.h>
 #include <linux/ktime.h>
 #include <linux/timekeeping.h>
 
+void rust_helper_fsleep(unsigned long usecs)
+{
+	fsleep(usecs);
+}
+
 ktime_t rust_helper_ktime_get_real(void)
 {
 	return ktime_get_real();
diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 445877039395..cbe8949ce074 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -26,6 +26,7 @@
 
 use core::marker::PhantomData;
 
+pub mod delay;
 pub mod hrtimer;
 
 /// The number of nanoseconds per microsecond.
diff --git a/rust/kernel/time/delay.rs b/rust/kernel/time/delay.rs
new file mode 100644
index 000000000000..a2fcc15ebfd4
--- /dev/null
+++ b/rust/kernel/time/delay.rs
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Delay and sleep primitives.
+//!
+//! This module contains the kernel APIs related to delay and sleep that
+//! have been ported or wrapped for usage by Rust code in the kernel.
+//!
+//! C header: [`include/linux/delay.h`](srctree/include/linux/delay.h).
+
+use super::Delta;
+use crate::prelude::*;
+
+/// Sleeps for a given duration at least.
+///
+/// Equivalent to the C side [`fsleep()`], flexible sleep function,
+/// which automatically chooses the best sleep method based on a duration.
+///
+/// `delta` must be within `[0, i32::MAX]` microseconds;
+/// otherwise, it is erroneous behavior. That is, it is considered a bug
+/// to call this function with an out-of-range value, in which case the function
+/// will sleep for at least the maximum value in the range and may warn
+/// in the future.
+///
+/// The behavior above differs from the C side [`fsleep()`] for which out-of-range
+/// values mean "infinite timeout" instead.
+///
+/// This function can only be used in a nonatomic context.
+///
+/// [`fsleep()`]: https://docs.kernel.org/timers/delay_sleep_functions.html#c.fsleep
+pub fn fsleep(delta: Delta) {
+    // The maximum value is set to `i32::MAX` microseconds to prevent integer
+    // overflow inside fsleep, which could lead to unintentional infinite sleep.
+    const MAX_DELTA: Delta = Delta::from_micros(i32::MAX as i64);
+
+    let delta = if (Delta::ZERO..=MAX_DELTA).contains(&delta) {
+        delta
+    } else {
+        // TODO: Add WARN_ONCE() when it's supported.
+        MAX_DELTA
+    };
+
+    // SAFETY: It is always safe to call `fsleep()` with any duration.
+    unsafe {
+        // Convert the duration to microseconds and round up to preserve
+        // the guarantee; `fsleep()` sleeps for at least the provided duration,
+        // but that it may sleep for longer under some circumstances.
+        bindings::fsleep(delta.into_micros_ceil() as c_ulong)
+    }
+}
-- 
2.43.0

