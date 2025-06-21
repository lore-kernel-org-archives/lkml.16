Received: from forward200d.mail.yandex.net (forward200d.mail.yandex.net [178.154.239.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39C12036ED;
	Sat, 21 Jun 2025 18:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750531999; cv=none; b=DdLCkttVagvYf92H2bdf2Vp3nkLPRokvaOK5wsy4M0t69Nyummqy2k8f7o7wB43zR5jWlR2u2uqLqwdsOC9h4ymPGDPIcW2qdsbno4xbjbSXQugitOrPKbAoCgF9x2x1mUXOjDNWAfd8u/4ivbg+QmV9el8QiLLMGOVW+pTYmkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750531999; c=relaxed/simple;
	bh=znL4Zc3S4t3FyzyWArcnH6Jx4XM0uFtnH/0Pcek5cQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m/EZiwKl+GiobymZnYNTBe2MHxtYioLIXPyptkpxNDqIvhx6jxb0/+jAacUccJ2mShPXu55VeXrKc+V6k7FXb0gvBbraeY5Qmo9rcSfQyuX6lJkzygzznTYJ+HXju6dRZcyFa4iJaUguv9LJM9r0spM8canBDE/DwH0qio0xIaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=Cd0G1E9K; arc=none smtp.client-ip=178.154.239.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="Cd0G1E9K"
Received: from forward100d.mail.yandex.net (forward100d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d100])
	by forward200d.mail.yandex.net (Yandex) with ESMTPS id EF48063526;
	Sat, 21 Jun 2025 21:45:28 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-91.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-91.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:3b23:0:640:a115:0])
	by forward100d.mail.yandex.net (Yandex) with ESMTPS id 926F060975;
	Sat, 21 Jun 2025 21:45:20 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-91.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id uiVAZ68LnCg0-S7mslwtW;
	Sat, 21 Jun 2025 21:45:18 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1750531519;
	bh=0ipQNjbd7rx7eDMk+d+z9kiN5etFmfMNR8/fpV+diMs=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=Cd0G1E9K1gU0MnD3tYM6s46ER3c4buatUv+AWJJzDR/BKeH6UTey00ALcc3FLEd4x
	 vybDW+tAJnJMtm+qZfy6iT0K5HPgf+eJ6zGmFZWknc2ogHXIM+94ARFPApD2Q6sBB1
	 mYxKpPz0wWQHj0yjm62QHbEmra0ChtMxCZq40A14=
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
Subject: [PATCH v5 1/3] rust: add C wrappers for `ww_mutex` inline functions
Date: Sat, 21 Jun 2025 21:44:52 +0300
Message-ID: <20250621184454.8354-2-work@onurozkan.dev>
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

Some of the kernel's `ww_mutex` functions are implemented as
`static inline`, so they are inaccessible from Rust as bindgen
can't generate code on them. This patch provides C function wrappers
around these inline implementations, so bindgen can see them and generate
the corresponding Rust code.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/helpers/helpers.c  |  3 ++-
 rust/helpers/ww_mutex.c | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/ww_mutex.c

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 0f1b5d115985..2f82774b34cf 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -27,9 +27,9 @@
 #include "mm.c"
 #include "mutex.c"
 #include "page.c"
-#include "platform.c"
 #include "pci.c"
 #include "pid_namespace.c"
+#include "platform.c"
 #include "rbtree.c"
 #include "rcu.c"
 #include "refcount.c"
@@ -43,4 +43,5 @@
 #include "vmalloc.c"
 #include "wait.c"
 #include "workqueue.c"
+#include "ww_mutex.c"
 #include "xarray.c"
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

