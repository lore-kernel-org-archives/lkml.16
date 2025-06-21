Received: from forward101b.mail.yandex.net (forward101b.mail.yandex.net [178.154.239.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB4C101EE;
	Sat, 21 Jun 2025 15:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750519368; cv=none; b=V2mVDHw4q2qiV3BIpBP2dFFexW+DuDqOQlyjoT4GE60xS7rjENIKpa25tTvRRqGMgdG++dE3IbA6etwMFkEzsz3jN0vzZ7NinOVAvGY0s9DbL3LSirMnBm54sDeVHVQ+6qdUSpLAuOalPAkvRqksdiSUyNCsDohXm0J5z65C7i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750519368; c=relaxed/simple;
	bh=rPnRPasfareRqdn4LO0cOmMSsc+3KOt2FLwrDMLzYLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=REqckk8LkI6rYkUGUw7/JjLNZjKOga+aUqLmS97NJ09+ibsNAAZ7cyoIKACTX5jXlaBgviIFBduasAFSvyaOB/tIVdWHYBGH4r0yt35M2IBqassBhA+4UJ24QDkNxbqgRPa1N1ZVNPZC/dQYRUCK0/GJNNIj/loxFVwRqC1X1iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=c2nFovte; arc=none smtp.client-ip=178.154.239.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="c2nFovte"
Received: from mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net [IPv6:2a02:6b8:c23:2f3c:0:640:5ff5:0])
	by forward101b.mail.yandex.net (Yandex) with ESMTPS id 62B61608FE;
	Sat, 21 Jun 2025 18:22:37 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id pLScBAbLgmI0-RKrpW4gI;
	Sat, 21 Jun 2025 18:22:36 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1750519356;
	bh=sElkQwDeq9InCNMp9gocDAbLSGbd64SV/zL5bHrrnuU=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=c2nFovtevEn0/PXg9WfyTcR3KjKFDzF3WhQMH1bPa8hxtLaEHvFdbLm08CcdjF9Zy
	 lBDWPYAQ3q8bIKAG4cUktUMYfy2id+M6dpVmwJNmxw7PhAVhWoFOMEQA+cAa2e+3Cs
	 uynMFfdMH988KMlUIpWLT9LSrF5gCXUT8xCAEsrY=
Authentication-Results: mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	felipe_life@live.com,
	daniel@sedlak.dev,
	bjorn3_gh@protonmail.com,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH 3/3 v4] add KUnit coverage on Rust `ww_mutex` implementation
Date: Sat, 21 Jun 2025 18:21:42 +0300
Message-ID: <20250621152142.25167-3-work@onurozkan.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250621152142.25167-1-work@onurozkan.dev>
References: <20250621152142.25167-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds coverage around the core `ww_mutex` functionality

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/sync/lock/ww_mutex.rs | 116 ++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/rust/kernel/sync/lock/ww_mutex.rs b/rust/kernel/sync/lock/ww_mutex.rs
index 0f77e03304e4..30c6068f315d 100644
--- a/rust/kernel/sync/lock/ww_mutex.rs
+++ b/rust/kernel/sync/lock/ww_mutex.rs
@@ -11,6 +11,7 @@
 use crate::{bindings, str::CStr};
 use core::marker::PhantomData;
 use core::{cell::UnsafeCell, pin::Pin};
+use macros::kunit_tests;
 use pin_init::{pin_data, pin_init, pinned_drop, PinInit};
 
 /// Create static `WwClass` instances.
@@ -417,3 +418,118 @@ fn drop(&mut self) {
         unsafe { bindings::ww_mutex_unlock(self.mutex.as_ptr()) };
     }
 }
+
+#[kunit_tests(rust_kernel_ww_mutex)]
+mod tests {
+    use crate::alloc::KBox;
+    use crate::c_str;
+    use crate::prelude::*;
+    use pin_init::stack_pin_init;
+
+    use super::*;
+
+    // A simple coverage on `define_ww_class` macro.
+    define_ww_class!(TEST_WOUND_WAIT_CLASS, wound_wait, c_str!("test_wound_wait"));
+    define_ww_class!(TEST_WAIT_DIE_CLASS, wait_die, c_str!("test_wait_die"));
+
+    #[test]
+    fn test_ww_mutex_basic_lock_unlock() {
+        stack_pin_init!(let class = WwClass::new_wound_wait(c_str!("test_mutex_class")));
+
+        stack_pin_init!(let mutex = WwMutex::new(42, &class));
+
+        // Lock without context
+        let guard = mutex.lock(None).unwrap();
+        assert_eq!(*guard, 42);
+
+        // Drop the lock
+        drop(guard);
+
+        // Lock it again
+        let mut guard = mutex.lock(None).unwrap();
+        *guard = 100;
+        assert_eq!(*guard, 100);
+    }
+
+    #[test]
+    fn test_ww_mutex_trylock() {
+        stack_pin_init!(let class = WwClass::new_wound_wait(c_str!("trylock_class")));
+
+        stack_pin_init!(let mutex = WwMutex::new(123, &class));
+
+        // trylock on unlocked mutex should succeed
+        let guard = mutex.try_lock(None).unwrap();
+        assert_eq!(*guard, 123);
+        drop(guard);
+
+        // lock it first
+        let _guard1 = mutex.lock(None).unwrap();
+
+        // trylock should fail with EBUSY when already locked
+        let result = mutex.try_lock(None);
+        match result {
+            Err(e) => assert_eq!(e, EBUSY),
+            Ok(_) => panic!("Expected `EBUSY` but got success"),
+        }
+    }
+
+    #[test]
+    fn test_ww_mutex_is_locked() {
+        stack_pin_init!(let class = WwClass::new_wait_die(c_str!("locked_check_class")));
+
+        stack_pin_init!(let mutex = WwMutex::new("hello", &class));
+
+        // should not be locked initially
+        assert!(!mutex.is_locked());
+
+        let guard = mutex.lock(None).unwrap();
+        assert!(mutex.is_locked());
+
+        drop(guard);
+        assert!(!mutex.is_locked());
+    }
+
+    #[test]
+    fn test_ww_acquire_context() {
+        stack_pin_init!(let class = WwClass::new_wound_wait(c_str!("ctx_class")));
+
+        stack_pin_init!(let mutex1 = WwMutex::new(1, &class));
+        stack_pin_init!(let mutex2 = WwMutex::new(2, &class));
+
+        let mut ctx = KBox::pin_init(WwAcquireCtx::new(&class), GFP_KERNEL).unwrap();
+
+        // acquire multiple mutexes with same context
+        let guard1 = mutex1.lock(Some(&ctx)).unwrap();
+        let guard2 = mutex2.lock(Some(&ctx)).unwrap();
+
+        assert_eq!(*guard1, 1);
+        assert_eq!(*guard2, 2);
+
+        ctx.as_mut().done();
+
+        // we shouldn't be able to lock once it's `done`.
+        assert!(mutex1.lock(Some(&ctx)).is_err());
+        assert!(mutex2.lock(Some(&ctx)).is_err());
+    }
+
+    #[test]
+    fn test_with_global_classes() {
+        stack_pin_init!(let wound_wait_mutex = WwMutex::new(100, &TEST_WOUND_WAIT_CLASS));
+        stack_pin_init!(let wait_die_mutex = WwMutex::new(200, &TEST_WAIT_DIE_CLASS));
+
+        let ww_guard = wound_wait_mutex.lock(None).unwrap();
+        let wd_guard = wait_die_mutex.lock(None).unwrap();
+
+        assert_eq!(*ww_guard, 100);
+        assert_eq!(*wd_guard, 200);
+
+        assert!(wound_wait_mutex.is_locked());
+        assert!(wait_die_mutex.is_locked());
+
+        drop(ww_guard);
+        drop(wd_guard);
+
+        assert!(!wound_wait_mutex.is_locked());
+        assert!(!wait_die_mutex.is_locked());
+    }
+}
-- 
2.49.0

