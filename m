Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440D4B641
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738236652; cv=none; b=DrTiK+BRXmlPWFcy488ug30QRHuwmxWe9eA/Mgg9g+6+vyh8L4uihALejsRj2HhZRGMVCYgw4BZskdNxyeX6jNvaDjvm91To0h2co4U8XnQzjLc+nf4c7JSgrIf5HwtG8b8zt0qzDwJhGaPWwXs7rwbw9U6lIPc4wMfGBfWXULk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738236652; c=relaxed/simple;
	bh=iJXSb4peF8tz5wpDk5j8EzDSWN5Hr8H6kTV8N6kIZTQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=OUbQImuy4WmZnxgZW7I15bJ54YwTPfYW3ia8SE0UhihBQrI4kFLlAMR0EhRiG3eozeZ+xasXyfxP1fxKpWKnCAO3JVQWRHxcOzPBMYIKNq5l2l4qir6NjftYstMRk7JXTnUuvbL+Nm0/Zzgr7fG92j+6M0qkIEZsQO2XbNYbZ1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g48vBn0h; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g48vBn0h"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43651b1ba8aso4467605e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 03:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738236648; x=1738841448; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jePf0gFxMzdZ+QDEvXG0/9t5XPufK33QfziCNz+QRro=;
        b=g48vBn0hg3Kiju+i5vnHS+dIEDIO3qu0FJ/x+wB5Hbu2CO778Z3wkwEbkTj4iuOVxv
         VYWE8TmEjEmodWonsQIR5FZE3eXyuFK6hacQ3KJxOC9hndIp4QqKI0oyYi+Q++3NzvMn
         7DYk58Gu3JasD8buw872e9p9L1UqHoGw35u75Ds2oA3uZcf16yfOQv6ZeiaVnpEc916k
         EWt8+aEcy2AQt88hc4b/bb2525zpQPS8KDvbjF2XSH6BfMhWGB5oo06TNzCmd3reYfOE
         y9Ve+9uph0BCh9KZmfSkfjkVAL7jo09fjjlnF9weiJegJk2r8QlU4x4YNJmGHscr4qYM
         5SVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738236648; x=1738841448;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jePf0gFxMzdZ+QDEvXG0/9t5XPufK33QfziCNz+QRro=;
        b=qX4new6jtw/FTEkc7ZucOgZGusyl5oE60lRACkP2NB5dJQ3npWROUxLY5R9xGjJ9nl
         M1hjBBnZ5WEuUw8puD/8r3YcbbkFT3UJL+V7/OhPRShhxUzRI/bfU/mZ/4d3cYvq85KB
         cyOQE6AM0CSaeXHtRtrzPCxaUbIm4UDK9f14NTM5PvoU3vBSJoyGIrE3+SyzvgEu9Upv
         D+UDmIX4iFcYAWPMVuzvtaNkr71EyJcvaPAvHA8DwrX7IHb0z3J6v1bPs/OR6LXFnDbi
         lEi/wISFnewcT8CAHVVdEfN0X5c6fvyPfqX/coknCxEXdgceYy9IU8y+/728SO7sPOYF
         cLMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKOGCu+1RWhbaBrQ3f5jcU60mtFg9/TXn85YJwc0QMnjZLBKX/T8A0gDqBvsuEiBLqTMA331+RpqvGZK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGSgSSXe7U7io9ti/WnYznIwh1fIEgIjWAH5Jx8GuBCCuaeTRj
	oztPnI1GO5m1K2NPqhdhi4B6AXVB+19+AitCXDg1kSSNP1At35kCh5qS+T+x1evu6Jo09tdriRd
	2kMh2iEIOWkovcQ==
X-Google-Smtp-Source: AGHT+IGycKi7cqKSTgaduRdwS9/y7R5LjsSaFzWis/4qgCooTsr7KUGUERvOPxvoocUems4PeC7lA8MCCbDA44g=
X-Received: from wmbay42.prod.google.com ([2002:a05:600c:1e2a:b0:436:e723:5be6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c88:b0:434:a802:43d with SMTP id 5b1f17b1804b1-438dc424e5cmr53358055e9.27.1738236648667;
 Thu, 30 Jan 2025 03:30:48 -0800 (PST)
Date: Thu, 30 Jan 2025 11:30:44 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAONim2cC/x3MMQqAMBAF0avI1gbWxIB4FbGI+qPbRNmAiOLdD
 ZavmHkoQwWZ+uohxSlZ9lTQ1BXNW0grjCzFZNl6bhybeU/LGdREBW6YaBH85Lhr2VOJDkWU6x8 O4/t+dUaImWAAAAA=
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2853; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=iJXSb4peF8tz5wpDk5j8EzDSWN5Hr8H6kTV8N6kIZTQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnm2Lms5DTl7IR5F4GtWcDY9gMKJZJPl+9mnjB6
 vLz2R44T1GJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ5ti5gAKCRAEWL7uWMY5
 RgY4EAC4PSLrAwMzBsR39fM5cBAQj+5atFou11ZIEcXvYd4kH0Q83XzqxmzckCU6xFSCz2AmkOv
 cDyEPkJM371IJ8zpNezijXSzzgtzYAT1A2jxHX97JccM01YCsz0pUJut9Yf8u4kDfa7TKXm4FJ3
 qNMRbCitO27cG6V55IgLT1k+BEu331I1236C1L7RqnPBPVu2jjQi1U/FIjhQ3I2lQWsGp0VZMN5
 GshK9lNXkAQFlepHW8NggIDgbCrqWKgRdR8vW42zEvgoe3FkVtLv+O3LPmt8jn+pcBW/vtSVh8s
 ncimy2va+Tsx5FOx+1/nkNr6906cwggap8xmiDJcQFs6OHJt6Z5tQ9QXbZE1Al01xfCOodUrXku
 EE73Y3GHI3rc34dUlWXSdomqlh2DdZ8prFouEgzMGT+ebqqhC+C0tVNGIY6dgvJmy7A4WxCvXgw
 JyT5aVPdWDv13jdtQWh2XC9I9lYTsc1DXBpgv7/9o+wzYNN24lG6bMZIWbloZCVFKELv3MpCchE
 0D5YYe1j1vHyb5DLHu940W4MAWk4A0QcjIK6yBeT/isausVIywGB6hi44ZM1E2GDblMr9eXIKJS
 Awcgogdo5aTA7ZPDpzUddJemsjRkZb/3kHEh0MRkDF2AE2EpXugiy3rfIuz7AaF6DTwfNhD3oy1 q4wJ5L3v1ePD3RA==
X-Mailer: b4 0.13.0
Message-ID: <20250130-condvar-freeze-v1-1-a91d5661d505@google.com>
Subject: [PATCH] rust: sync: add wait_interruptible_freezable
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Binder allows you to freeze a process where some of its threads are
blocked on the Binder driver. To make this work, we need to pass
TASK_FREEZABLE when going to sleep in the appropriate places. Thus, add
a new method wait_interruptible_freezable for the condition variable so
that sleeps where this is supported can be marked as such.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/sync/condvar.rs | 18 +++++++++++++++++-
 rust/kernel/task.rs         |  2 ++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
index 7df565038d7d..a256cd74bd4b 100644
--- a/rust/kernel/sync/condvar.rs
+++ b/rust/kernel/sync/condvar.rs
@@ -11,7 +11,9 @@
     init::PinInit,
     pin_init,
     str::CStr,
-    task::{MAX_SCHEDULE_TIMEOUT, TASK_INTERRUPTIBLE, TASK_NORMAL, TASK_UNINTERRUPTIBLE},
+    task::{
+        MAX_SCHEDULE_TIMEOUT, TASK_FREEZABLE, TASK_INTERRUPTIBLE, TASK_NORMAL, TASK_UNINTERRUPTIBLE,
+    },
     time::Jiffies,
     types::Opaque,
 };
@@ -159,6 +161,20 @@ pub fn wait_interruptible<T: ?Sized, B: Backend>(&self, guard: &mut Guard<'_, T,
         crate::current!().signal_pending()
     }
 
+    /// Releases the lock and waits for a notification in interruptible and freezable mode.
+    #[must_use = "wait returns if a signal is pending, so the caller must check the return value"]
+    pub fn wait_interruptible_freezable<T: ?Sized, B: Backend>(
+        &self,
+        guard: &mut Guard<'_, T, B>,
+    ) -> bool {
+        self.wait_internal(
+            TASK_INTERRUPTIBLE | TASK_FREEZABLE,
+            guard,
+            MAX_SCHEDULE_TIMEOUT,
+        );
+        crate::current!().signal_pending()
+    }
+
     /// Releases the lock and waits for a notification in interruptible mode.
     ///
     /// Atomically releases the given lock (whose ownership is proven by the guard) and puts the
diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 07bc22a7645c..ea43a3b8d9c5 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -23,6 +23,8 @@
 pub const TASK_INTERRUPTIBLE: c_int = bindings::TASK_INTERRUPTIBLE as c_int;
 /// Bitmask for tasks that are sleeping in an uninterruptible state.
 pub const TASK_UNINTERRUPTIBLE: c_int = bindings::TASK_UNINTERRUPTIBLE as c_int;
+/// Bitmask for tasks that are sleeping in a freezable state.
+pub const TASK_FREEZABLE: c_int = bindings::TASK_FREEZABLE as c_int;
 /// Convenience constant for waking up tasks regardless of whether they are in interruptible or
 /// uninterruptible sleep.
 pub const TASK_NORMAL: c_uint = bindings::TASK_NORMAL as c_uint;

---
base-commit: ceff0757f5dafb5be5205988171809c877b1d3e3
change-id: 20250130-condvar-freeze-f2ea5b308405

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

