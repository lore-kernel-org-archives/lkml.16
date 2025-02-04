Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75ECC20C02C
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 13:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738676612; cv=none; b=o2KLXNcdxHUtUQe7xlsE61MQq9lXMJ0Z2MkEEHaWaURpLz8545xbGcy39xdmeIEq7y+DNxDHHNg0ZzE5R1Z5CWAWtHDBptNywAiAeA3McmZfM28TlfhFFHJN15MNrOXNKVNkWeqFpvT+94mCnzp+StMnT6YoZteDTMZ4M3qyM6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738676612; c=relaxed/simple;
	bh=SgIoKwcZO83D0H1DH1airYR6aVHH761lIgQkOi1H3rY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rItTux4MgLO360sJyJV6AbL6sYA6sfKwbj7sX3pDyfAaqExEfdVfsUFe04CchkRvKBCEcT/qvqqAV0pHsqon1JLZKO7YXTF7gEUU8Tbb/GjNkcMNv6TMF31+zToodl4YuhBPfyC3Aq2pQzke7CdYGvLkrgz1PZP9wSl/JGPEsAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FqxrU7MJ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FqxrU7MJ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4361f371908so40314385e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 05:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738676609; x=1739281409; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MtQg1sWtwKSQAU12JMSyBjbXP2TUHrUrABd3N9c0DwU=;
        b=FqxrU7MJDhpQ0kvRSPXVHzhAkzSh4YKvx056RbX0yovYuN5ZKVZJ7l4CV6UYtunMGQ
         cQXpWlPhUPImNMGJYY2f49Au+y9+XlIqlp5AVooFJno51o+SaHCRrncNkb4c67+z8Uw8
         8L8+50lP/5hdjf9bgmNmTFycnAxFU0DCG3BSI69wx0YmA6GsuXjrVu2aURPoKbsed98v
         gphLCT1Yq5t7B0EoaVZxBnsYk7+Ug+KwoanCjIxVBcUq/8Pt1/dG7ACIfJ913I2Sp9LJ
         gXNupzU6lo4JBlMlxoQ6EmfeZGY1jiLGxB7Qg9cgI2zehkLiXMGBLA+jUXpKVfPSJUbw
         7wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738676609; x=1739281409;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MtQg1sWtwKSQAU12JMSyBjbXP2TUHrUrABd3N9c0DwU=;
        b=MXJGw2d4LH8WTNdx3DInPPO74GMumdV2lAn++rmhprxLxZoUK/Il9AYAxsmeAZlBFS
         b82bVQwScElNYgNbJYP1Tdzzqh7hndwsDobiXjPwCDuoJ/13nxBQWBujo0pnFrlOad6G
         70K4P273S0gvnbVrxjikhjHvYzCpv/E/qI6fOMsGCwYmDP7rKADtOhe6na+bJNBx7gPf
         kyhz4d570g295oJZH7Rrdjjm6bUJpUslSUm9/56WyZ7ypKdlaheMmMCR2gu7MA2CQlDO
         Tsz7N6EHW9cgD8s3VfkQXy4JbpHPQkSvOsTt3D1Id+vT//2FetexMGuygRlw+dLuuWM6
         dyXw==
X-Forwarded-Encrypted: i=1; AJvYcCVyF6SmODNobQqKLVotrL1MTWBleAI7o+aTtIRuoZre15FTVkDZNJHCLtuLfSYND6I7v7O9Qpgw2glKewk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZghnv4v0DjqkIFH1IKOST2YpZqpivXneMChXfF6nGotCVMaGx
	MToUlTki2OqzacW3wzQTGDpSUkhkb42ovD4WEhZ5Y17kOFEn1k7BY7J8z40uz2UuNdnpPZfrYS7
	WClMhGQ0YLXPE/w==
X-Google-Smtp-Source: AGHT+IGAQNTQ/HRjFqlJxD13mjiLL9qmpzklJ62h8rjWfkdUvqJO8WMyMLc2bexZNoP8PXBeYp42ZC0jFX2qsZg=
X-Received: from wmbfl22.prod.google.com ([2002:a05:600c:b96:b0:434:a2c3:d51b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:470c:b0:434:fddf:5bfa with SMTP id 5b1f17b1804b1-438dc3bb395mr227045875e9.2.1738676608768;
 Tue, 04 Feb 2025 05:43:28 -0800 (PST)
Date: Tue, 04 Feb 2025 13:43:25 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAH0ZomcC/3WMQQ7CIBBFr9LMWgxQadSV9zBdIAx0Ei3NYIjac
 Hexezc/eT95b4WMTJjh3K3AWChTmhvoXQdusnNEQb4xaKmNVL0ULs2+WBaBET8ogkZrbr08HqS BJi2MgV5b8Do2nig/E7+3flG/92+qKKGEPSlvhqGNNJeYUrzj3qUHjLXWL3AArietAAAA
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3388; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=SgIoKwcZO83D0H1DH1airYR6aVHH761lIgQkOi1H3rY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnohl+xh0SniBplYn2XOoZ+MDC9xdsph612fysW
 01tMPwTQY2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ6IZfgAKCRAEWL7uWMY5
 RirlD/wMbv1NW7IMb2YtaDqpbFSIK6JubKo5HI7cc8ZynyIBXXxZC6GA2YQzB0lpKoKqYYkuBnS
 oGz3JKDWf+Toti5JFD1F5InKYqB9+ibQbIhfdnAwsH0Co/KrmeIih2A4hzRCHGSLG3EvSWjIlBY
 d3AaIu4/Ea/p786fnUbrilEpAEU+axZnWyM0c0p6PejcKpcQBJ9/vd4z8ExBEn6leNVLMgMfb39
 v6VSUmsfoWyXGfsdhHLET84A+fRk/iltvtSS6xcJpUMfPGd2EwuKP4vTM9N5fXgrpe5caGAqhFq
 WwM2YM4/BkQFKvEsauEd6b9ozAyqLb6w+5sUZoqAuMO1HVogsldt9zFrDI+yAVFJ6TCBpN5XVuh
 W4t32aw8V6BBTs4H/9NBGNMaoaRReUUwSdqxTc0IoeNz2VDysvLOIGd3pCfJxSblLbd2DsLsyEr
 a7wA7zJHVsDHhladEJU4O8X+uyZOv+ntK2ZD8AO6Z+hlhGJr3PZvifWRj30TlaYSUSZ3zT9I1JR
 B6kTQwYZiBu/sFvaLJs08tcSy0b/WMTJZd2WoI7znRx2lwB/qIrWgnZTMxx7edTkE4Pww9t6UD8
 3MBEzFyjjBAXshRuqIXzStheAt2/YFH6iViROlSitc2n77A1SQqjUxdhLME1/XcARq2sarZNBQP QwIOJkvcDqIhWqQ==
X-Mailer: b4 0.13.0
Message-ID: <20250204-condvar-freeze-v2-1-804483096260@google.com>
Subject: [PATCH v2] rust: sync: add wait_interruptible_freezable
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
Changes in v2:
- Document that you must not hold locks when you call the method.
- Link to v1: https://lore.kernel.org/r/20250130-condvar-freeze-v1-1-a91d5661d505@google.com
---
 rust/kernel/sync/condvar.rs | 23 ++++++++++++++++++++++-
 rust/kernel/task.rs         |  2 ++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
index 7df565038d7d..1859e011e322 100644
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
@@ -159,6 +161,25 @@ pub fn wait_interruptible<T: ?Sized, B: Backend>(&self, guard: &mut Guard<'_, T,
         crate::current!().signal_pending()
     }
 
+    /// Releases the lock and waits for a notification in interruptible and freezable mode.
+    ///
+    /// The process is allowed to be frozen during this sleep. You must not hold any locks while
+    /// this operation is ongoing, and there is a lockdep assertion for this. Freezing a task that
+    /// holds a lock can trivially deadlock vs another task that needs that lock to complete before
+    /// it too can hit freezable.
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
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250130-condvar-freeze-f2ea5b308405

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

