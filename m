Received: from forward200a.mail.yandex.net (forward200a.mail.yandex.net [178.154.239.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5482586EC;
	Sat, 21 Jun 2025 18:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750532015; cv=none; b=k6gkzSVpGWeFrbnDxWR0zmkzd/wKvS0YVvAxsI1fGw8e/3/UbWY4O362cYP7jIlqQNbaxoSY8MRcJTpQu9znQsQ+Mm6I9tGrNlRv0B8dPQxGygkTyDfkrIV2x+fk/M8F/tYTkF6I6kDlMbBI4gjADXCpb+jwug18AN9S6vzYMAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750532015; c=relaxed/simple;
	bh=yVVnEH9fmkzK+0YZ+K9vNjzUCtTtl03sbReclJYtVa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l+UzNwhacOsX6AJHu165EDpG3lS6E917ZORtJ0ln7HhLFeU1an7eF9GIF5YklL7APvSPJV1x+tQYaftJ3Mo89xSiiqKELui8x4M7rw+UcVEJ/6uMYqiVG9vweAHbfrbUv0FyzzBgpa23JClAk6G6KAOpbGj/vZCMdFO0TIxSfig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=fElG/WuA; arc=none smtp.client-ip=178.154.239.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="fElG/WuA"
Received: from forward101a.mail.yandex.net (forward101a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d101])
	by forward200a.mail.yandex.net (Yandex) with ESMTPS id C61A360FAB;
	Sat, 21 Jun 2025 21:45:36 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-91.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-91.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:3b23:0:640:a115:0])
	by forward101a.mail.yandex.net (Yandex) with ESMTPS id 87BCF60AAC;
	Sat, 21 Jun 2025 21:45:28 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-91.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id uiVAZ68LnCg0-NWzhbek5;
	Sat, 21 Jun 2025 21:45:27 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1750531528;
	bh=hHGbALiWPmJEfMV3qXWuFzW80cAnKcktMEEA4gLoXME=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=fElG/WuA/5xkVQxqFufU2FP8ePAWR8cRE8DiDyHm0Alxn4xBd0xFepTNG7ptE5/bn
	 VNFxFCrkKEm0DpdU7feUSA5gYbdEWFDugM2dFi5MU6hK2NJhaQQZmk4Hj8CmV7NuX1
	 Ns66VfWDW6KaJ0aQYF4363Mr/eSvLLueZ0o1Y8d8=
Authentication-Results: mail-nwsmtp-smtp-production-main-91.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
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
Subject: [PATCH v5 3/3] add KUnit coverage on Rust `ww_mutex` implementation
Date: Sat, 21 Jun 2025 21:44:54 +0300
Message-ID: <20250621184454.8354-4-work@onurozkan.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250621184454.8354-1-work@onurozkan.dev>
References: <20250621184454.8354-1-work@onurozkan.dev>
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
 rust/kernel/sync/lock/ww_mutex.rs | 120 ++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/rust/kernel/sync/lock/ww_mutex.rs b/rust/kernel/sync/lock/ww_mutex.rs
index dcb23941813c..98ee5bee9188 100644
--- a/rust/kernel/sync/lock/ww_mutex.rs
+++ b/rust/kernel/sync/lock/ww_mutex.rs
@@ -419,3 +419,123 @@ fn drop(&mut self) {
         unsafe { bindings::ww_mutex_unlock(self.mutex.as_ptr()) };
     }
 }
+
+#[kunit_tests(rust_kernel_ww_mutex)]
+mod tests {
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
+    fn test_ww_mutex_basic_lock_unlock() -> Result {
+        stack_pin_init!(let class = WwClass::new_wound_wait(c_str!("test_mutex_class")));
+
+        stack_pin_init!(let mutex = WwMutex::new(42, &class));
+
+        // Lock without context
+        let guard = mutex.lock(None)?;
+        assert_eq!(*guard, 42);
+
+        // Drop the lock
+        drop(guard);
+
+        // Lock it again
+        let mut guard = mutex.lock(None)?;
+        *guard = 100;
+        assert_eq!(*guard, 100);
+
+        Ok(())
+    }
+
+    #[test]
+    fn test_ww_mutex_trylock() -> Result {
+        stack_pin_init!(let class = WwClass::new_wound_wait(c_str!("trylock_class")));
+
+        stack_pin_init!(let mutex = WwMutex::new(123, &class));
+
+        // trylock on unlocked mutex should succeed
+        let guard = mutex.try_lock(None)?;
+        assert_eq!(*guard, 123);
+        drop(guard);
+
+        // lock it first
+        let _guard1 = mutex.lock(None)?;
+
+        // trylock should fail when already locked
+        assert!(mutex.try_lock(None).is_err());
+
+        Ok(())
+    }
+
+    #[test]
+    fn test_ww_mutex_is_locked() -> Result {
+        stack_pin_init!(let class = WwClass::new_wait_die(c_str!("locked_check_class")));
+
+        stack_pin_init!(let mutex = WwMutex::new("hello", &class));
+
+        // should not be locked initially
+        assert!(!mutex.is_locked());
+
+        let guard = mutex.lock(None)?;
+        assert!(mutex.is_locked());
+
+        drop(guard);
+        assert!(!mutex.is_locked());
+
+        Ok(())
+    }
+
+    #[test]
+    fn test_ww_acquire_context() -> Result {
+        stack_pin_init!(let class = WwClass::new_wound_wait(c_str!("ctx_class")));
+
+        stack_pin_init!(let mutex1 = WwMutex::new(1, &class));
+        stack_pin_init!(let mutex2 = WwMutex::new(2, &class));
+
+        let mut ctx = KBox::pin_init(WwAcquireCtx::new(&class), GFP_KERNEL)?;
+
+        // acquire multiple mutexes with same context
+        let guard1 = mutex1.lock(Some(&ctx))?;
+        let guard2 = mutex2.lock(Some(&ctx))?;
+
+        assert_eq!(*guard1, 1);
+        assert_eq!(*guard2, 2);
+
+        ctx.as_mut().done();
+
+        // we shouldn't be able to lock once it's `done`.
+        assert!(mutex1.lock(Some(&ctx)).is_err());
+        assert!(mutex2.lock(Some(&ctx)).is_err());
+
+        Ok(())
+    }
+
+    #[test]
+    fn test_with_global_classes() -> Result {
+        stack_pin_init!(let wound_wait_mutex = WwMutex::new(100, &TEST_WOUND_WAIT_CLASS));
+        stack_pin_init!(let wait_die_mutex = WwMutex::new(200, &TEST_WAIT_DIE_CLASS));
+
+        let ww_guard = wound_wait_mutex.lock(None)?;
+        let wd_guard = wait_die_mutex.lock(None)?;
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
+
+        Ok(())
+    }
+}
-- 
2.49.0

