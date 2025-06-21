Received: from forward102b.mail.yandex.net (forward102b.mail.yandex.net [178.154.239.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B21101EE;
	Sat, 21 Jun 2025 15:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750519351; cv=none; b=Gl0hX7K2syy9Ub7waNzu2Oy1dN/qEsaEBNzFZZr86FEERL/r5DLpDWVHafs7Y3T7ac5XxbOzTCSxryYpxGhewOIYCRUEcH4C0mIHX0cMaJ8XpqAwya6jzDdC6CF7ecKCqabK/SsD7mqtcq/ncMSHlb8hxOqZPVLJoATLyk7OXBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750519351; c=relaxed/simple;
	bh=7Lp59rNsPbydTS6B3+sgFgdCEpgsqeTBKtTqJF6iyAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sveEvEUHttUnyL42DBPKjt0GdnMKdOK7W/zrwhos8sFKKPr9qRNUFenmgSg7t5MN1tipVv7iT7AxsvBFYrYBzoKRCs2jEX/c4mKRygzX1zf+wfidfM0hsGCG0RZYfLL2yMKAWPIgdckKSXdcdX02tRvyfBORsUplqMVqJPhY99c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=SUfLyCew; arc=none smtp.client-ip=178.154.239.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="SUfLyCew"
Received: from mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net [IPv6:2a02:6b8:c23:2f3c:0:640:5ff5:0])
	by forward102b.mail.yandex.net (Yandex) with ESMTPS id C67C4609B2;
	Sat, 21 Jun 2025 18:22:18 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id pLScBAbLgmI0-w71e1y8x;
	Sat, 21 Jun 2025 18:22:17 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1750519337;
	bh=WHGANRH7wsHF0bZfk8XocJJcEhb3nNf/wmYuKEj1e6Q=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=SUfLyCewFsrnYcbtQQo2FwmOzrEGAKWAc8mni/jQhxp8sPlhMLjqBTAMgAEVJbyYM
	 GFVVsLQzUL6g3NP1aH5tz2xJgQ0Y0VXDAN7cXCnOomFaPy5Lp4EvP0zlWbZRc+/mRB
	 t0Vodddd7H6bAxBNVfomIVESZi5wEtWh6jjmrsUw=
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
Subject: [PATCH 1/3 v4] rust: add C wrappers for `ww_mutex` inline functions
Date: Sat, 21 Jun 2025 18:21:40 +0300
Message-ID: <20250621152142.25167-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some of the kernel's `ww_mutex` functions are implemented as
`static inline`, so they are inaccessible from Rust as bindgen
can't generate code on them. This patch provides C function wrappers
around these inline implementations, so bindgen can see them and generate
the corresponding Rust code.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/helpers/helpers.c  |  1 +
 rust/helpers/ww_mutex.c | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 rust/helpers/ww_mutex.c

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 0f1b5d115985..fd071cbe20a1 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -44,3 +44,4 @@
 #include "wait.c"
 #include "workqueue.c"
 #include "xarray.c"
+#include "ww_mutex.c"
diff --git a/rust/helpers/ww_mutex.c b/rust/helpers/ww_mutex.c
new file mode 100644
index 000000000000..61a487653394
--- /dev/null
+++ b/rust/helpers/ww_mutex.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/ww_mutex.h>
+
+void rust_helper_ww_mutex_init(struct ww_mutex *lock, struct ww_class *ww_class)
+{
+	ww_mutex_init(lock, ww_class);
+}
+
+void rust_helper_ww_acquire_init(struct ww_acquire_ctx *ctx, struct ww_class *ww_class)
+{
+	ww_acquire_init(ctx, ww_class);
+}
+
+void rust_helper_ww_acquire_done(struct ww_acquire_ctx *ctx)
+{
+	ww_acquire_done(ctx);
+}
+
+void rust_helper_ww_acquire_fini(struct ww_acquire_ctx *ctx)
+{
+	ww_acquire_fini(ctx);
+}
+
+void rust_helper_ww_mutex_lock_slow(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
+{
+	ww_mutex_lock_slow(lock, ctx);
+}
+
+int rust_helper_ww_mutex_lock_slow_interruptible(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
+{
+	return ww_mutex_lock_slow_interruptible(lock, ctx);
+}
+
+bool rust_helper_ww_mutex_is_locked(struct ww_mutex *lock)
+{
+	return ww_mutex_is_locked(lock);
+}
+
-- 
2.49.0

