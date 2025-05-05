Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A291C1E260D
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 08:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746432013; cv=none; b=LduIS76f4AEXcjebuOIgt7Ao9+TxH27Uso/yrFWLHTLtoZoTvTCgv9fBC80dEIuqEl/OGc7Mk+hXkMq8vHRBJ4UHiJtqmH9wIjI/jF4zlVr1WO4gPK/XUZg8udqKIijo1+bDSZvJKghf1XC7BfOCFa9N7jKJAtC9swdho6U4EJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746432013; c=relaxed/simple;
	bh=A8UtNB0lJZVwOw8RbKz+nI+hjf5xw0t3exJaxERP1Eo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AEIin/RfmhTnK103xNN8fsVeWX4dgJBKmLRuPqPjgT7Ygj86s7Z5dyg76GzoGVEhL8mYqrO74FW+R/AnMYbjvHPYvm0zkDDTJJ5NsMpTjPMrG7SL51/UV2nMy6eosWZ4fE2LDKkkXtPT+WMciIHIOEMMJyaCGTsUVbdgbGFoYnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=qUFSbVlB; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="qUFSbVlB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1746432007;
	bh=A8UtNB0lJZVwOw8RbKz+nI+hjf5xw0t3exJaxERP1Eo=;
	h=From:Date:Subject:To:Cc:From;
	b=qUFSbVlBeeWEyVZsN8Gij5NvhF7Lo/f7YAWRcBt6dICkaUk0YQmKPWzkE09TuqzMA
	 aAHaz1V/RdS9lTqFcke2bgg7haPSZ5bn5wWGWmi7dTUDZ3PhGhasnFhRxki+oSnWX+
	 uCRJ6o83Ucy/58M0M+V/CzhpiRviZqAqcP2t0tXo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 05 May 2025 09:59:37 +0200
Subject: [PATCH v5] locking/mutex: Mark devm_mutex_init() as __must_check
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250505-must_check-devm_mutex_init-v5-1-92fa4b793c6e@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAOhvGGgC/33PzWrDMAzA8VcpPs/Dn7Hb096jlBAryixG0hE7X
 kfJu8/tGBus5CL46/ATurKEM2Fih92VzVgo0XmqYZ92DGI3vSKnvjZTQhkptOTjknILEeGN91j
 GdlwyXlqaKHPowHod+s4PyCrwPuNAlzt+PNWOlPJ5/rzfKvK2/Wbr2GKL5JJjIzDsXfDg1MsHU
 koJ4hKfJ8zsZhf141mhhNn0FBfchUY5CSY4bB56+q/nNz1dPWUsGul6gD0+9MyvZ4Tb9Ez913o
 XuooNTdD/vHVdvwCM5SpuuQEAAA==
X-Change-ID: 20241031-must_check-devm_mutex_init-cac583bda8fe
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>, 
 Will Deacon <will@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746432005; l=2993;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=A8UtNB0lJZVwOw8RbKz+nI+hjf5xw0t3exJaxERP1Eo=;
 b=pe6pxWBIiSGuzsdsD7O24W+Yd1l43xIyslhtyNp1IixG6z2jZKkMURlSxzBzKq+BSpXLUiDEO
 t6z0zdeSvK1CORoN2XdHfV8z8cSQxPM5hg+a9huglOiZRXNPWNLkIfq
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Even if it's not critical, the avoidance of checking the error code
from devm_mutex_init() call today diminishes the point of using the devm
variant of it. Tomorrow it may even leak something. Enforce all callers
checking the return value through the compiler.

As devm_mutex_init() itself is a macro, it can not be annotated
directly. Annotate __devm_mutex_init() instead.
Unfortunately __must_check/warn_unused_result don't propagate through
statement expression. So move the statement expression into the argument
list of the call to __devm_mutex_init() through a helper macro.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
Changes in v5:
- Pick up review tag from Andy
- Link to v4: https://lore.kernel.org/r/20250407-must_check-devm_mutex_init-v4-1-587bacc9f6b3@weissschuh.net

Changes in v4:
- Drop already applied leds-1202 driver patch
- Rebase on v6.15-rc1
- Link to v3: https://lore.kernel.org/r/20250208-must_check-devm_mutex_init-v3-0-245e417dcc9e@weissschuh.net

Changes in v3:
- Introduce and use helper macro __mutex_init_ret()
- Link to v2: https://lore.kernel.org/r/20250204-must_check-devm_mutex_init-v2-0-7b6271c4b7e6@weissschuh.net

Changes in v2:
- Rebase on 6.14-rc1
- Fix up leds-1202 driver
- Link to v1: https://lore.kernel.org/r/20241202-must_check-devm_mutex_init-v1-1-e60eb97b8c72@weissschuh.net
---
 include/linux/mutex.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/linux/mutex.h b/include/linux/mutex.h
index 2143d05116be1b0ac239951a9d5d0b90ad99062c..d9342341c13fc036dd9257537c85ff61f0f03da0 100644
--- a/include/linux/mutex.h
+++ b/include/linux/mutex.h
@@ -126,11 +126,11 @@ do {							\
 
 #ifdef CONFIG_DEBUG_MUTEXES
 
-int __devm_mutex_init(struct device *dev, struct mutex *lock);
+int __must_check __devm_mutex_init(struct device *dev, struct mutex *lock);
 
 #else
 
-static inline int __devm_mutex_init(struct device *dev, struct mutex *lock)
+static inline int __must_check __devm_mutex_init(struct device *dev, struct mutex *lock)
 {
 	/*
 	 * When CONFIG_DEBUG_MUTEXES is off mutex_destroy() is just a nop so
@@ -141,14 +141,17 @@ static inline int __devm_mutex_init(struct device *dev, struct mutex *lock)
 
 #endif
 
-#define devm_mutex_init(dev, mutex)			\
+#define __mutex_init_ret(mutex)				\
 ({							\
 	typeof(mutex) mutex_ = (mutex);			\
 							\
 	mutex_init(mutex_);				\
-	__devm_mutex_init(dev, mutex_);			\
+	mutex_;						\
 })
 
+#define devm_mutex_init(dev, mutex) \
+	__devm_mutex_init(dev, __mutex_init_ret(mutex))
+
 /*
  * See kernel/locking/mutex.c for detailed documentation of these APIs.
  * Also see Documentation/locking/mutex-design.rst.

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20241031-must_check-devm_mutex_init-cac583bda8fe

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

