Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA014C6D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744012024; cv=none; b=RBTl0mL4ZoVabniZjQRopNxtUlKnrvV4sWgNFg6D3PU5UakcKrUzcdav/3AgHiur69phOsQsNn/KnLP7fPEJqWxAAejDF8SG6gAagRxilMDFCmNksCwOBBemP5E3WbkJraA8Uc0EdakH62LKe5gn5F2+gQmzzJ37rZGE9112tBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744012024; c=relaxed/simple;
	bh=bq/xiqjLY6PvA77Xo83GEiRCbwDKYmoKwFshzi+cDZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tV5971TjrpAFH62FjqN9dRKIYOqgL+vh0HHryQvgT42RGVZrPtYZcAcvn4kgqeWUv1F7PiNxzkqRh6M+ryTwRwsmMJYyQX2fp3+y/oEL1oimt6CnWjkfGU3sW4E6TgLqT9785fj4wwJmSvYetpf+rzGXvKIgqV86FBAWUp4oqQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ZNQfv98/; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ZNQfv98/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1744012011;
	bh=bq/xiqjLY6PvA77Xo83GEiRCbwDKYmoKwFshzi+cDZI=;
	h=From:Date:Subject:To:Cc:From;
	b=ZNQfv98/j8ZxyMeldavFVDMkZ+2vdyhikXLXUUfWTbxQHugA++wba4z7kvNj8S8OE
	 h0XZIxKuIGkg2dauUY9w1A7xfPXeeHp3t/qLwbD4N1jGRjle+/XciGSCjB6DMQofRE
	 yJF0fGaBLOCyc17doME4rNT+aj+DioHukeXnLPv8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 07 Apr 2025 09:46:47 +0200
Subject: [PATCH v4] locking/mutex: Mark devm_mutex_init() as __must_check
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250407-must_check-devm_mutex_init-v4-1-587bacc9f6b3@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAOaC82cC/33NQQrCMBCF4atI1kaSNG2qK+8hUprpaAZpK00aF
 endjYogKN0M/LP43p15HAg92yzubMBInvouhV4uGLi6OyKnJjVTQmkpMsnb0YcKHMKJNxjbqh0
 DXivqKHCoIS8z29TlAVkCzgMe6PrCd/vUjnzoh9trK8rn982mM8dGySXHQqBdG1uCUdsLkvce3
 OhWHQb2tKP6eLlQQs96igtubKGMBG0NFn+97NsrZ70seUrnqKVpANb4403T9AD/oAhuaQEAAA=
 =
X-Change-ID: 20241031-must_check-devm_mutex_init-cac583bda8fe
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>, 
 Will Deacon <will@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744012010; l=2767;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=bq/xiqjLY6PvA77Xo83GEiRCbwDKYmoKwFshzi+cDZI=;
 b=XjJlX8MQ3YkbzeIY6mf+IghQWUVzAoywyGV6JLOsSb9MKwC+mFsO4P/3ebtklVXG5SqXsJLGR
 TSmkpQ5tuLaCpmuDYXbFp9DvGAbTgZUzmftuUXBVu8Rr2ZuU6lgzVm0
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
---
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

