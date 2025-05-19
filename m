Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1DB289820
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747671458; cv=none; b=Rpl5InhOVlx1c5DwuaMggmBSly7D7+duSR2LWj4+ABr+FJi8UtGOQtO0+/ewkvabCkxOxKTPqSeJ42E6oGcdz7WUd8lRuLYRnPmur0SF+G59WaaAGhWaYklPuSoOkf9j3xv1u8Ke+IlxuW+iV2lXgRr+hg9tECY6QxfXEY55MAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747671458; c=relaxed/simple;
	bh=9OXo2mm4zTvrDpEWPXsdwUcmAvEmqVu3gp27qTaR1DA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ly6puZB1MDpIUKVNuGj5ziz8leS7778E/jl+d+UcK/eODpvs5+DbA/VX8vNfC/mkWkO/4PLnJLFZEIaFEFIKjN62ScGehIl6xwjjMSxuOwvsgnr0RMfSofKLDSULe3imUNHPij+QdiU9kYnJJRW+0mp2iTohlJxsQPZoFe41atE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vdYjXcTD; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vdYjXcTD"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-442ffaa7dbeso4019665e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747671454; x=1748276254; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xi3xovkHr/TA/Q9MkIz3HdK8OZ1bO8szRf5CN1p75gk=;
        b=vdYjXcTDDISeVsfBvQTVFrw8dCJH31nmCkVZOhA02GrxuIYxGZJ0jxbPIoEIxxmyey
         VGw7lyGicVNsi9gTU69xcew4pQKtyQy/C8piB5f9x1z+d0Xw9dbIKpqlmqFkk7qXfpcb
         IBEZCfQolmlYcoAdxDQrIW/rqrutw2ulEs1hck2iiCL/3CbvnoOZ7osCzETzTE8zw4zG
         O3NMyVI9TIu83npYJvYbG/8wECMVk9pHrCD/Nbjgqa+1hyK4whGjfVBSVELXfcC51pKw
         QM1mWKt0JXI4Peo1adCVRmDLyDwLmO+Tn4L2tyUvfJ5L8U5lYcj2xUlzvcnHhYWaf82M
         OsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747671454; x=1748276254;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xi3xovkHr/TA/Q9MkIz3HdK8OZ1bO8szRf5CN1p75gk=;
        b=UlqjezIxaU4jO4Dk3oiUA+0v5zBDoVsR+Qp8qMRzaQt3ThMJYCUep6OVkF9LN4ren3
         PiaLu7pnqPEMk4ZOEcEf04g/iiBA08YRD8+HXtv8hpFDR9B6VcYHMyGMZoEDjkXjeo+c
         ibfvwdm0TNGKDOeeyZAMkRX9DdUuzYw1h2H9tUI9jPygEZTCb7pYsxNhDZO49d1Ib6ys
         Ol0Xpi5EtiD2LdxqAXb8FrqQd9+EmgzX3wLMXD8DweyNY5jTMCfmCGENpqYgZrmrql3q
         p3O+HTdcMo/hyvEn68yZASFWh6aCGAV9xmEx8/XiarxDtBZ1QhHmCtG2D+dNs3S+e6DL
         5QPw==
X-Forwarded-Encrypted: i=1; AJvYcCXJ3iW3nIkSH2mStEoadXt+E1xmqIGYm6bHzy/snAr6coF3DP7Sp7V2+/qEDP0RAv0k8aYwwklVA4eMsmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUtJvAjJkDIM+rwwKqD7wTC3yar66rFnUkF4QWRmbe58DueMfp
	wstQ7ha7m2fnl+XRNpJHkyAnD3k6rLBtrwaps+Iegb9RXsuh6zaMGaXC1MavPQlTWMQQ4A==
X-Google-Smtp-Source: AGHT+IEDywwP0TbHb8rwq4xsvkZ8rXPn0wk9YIEpc/zYAcY8JgnR07Gpr6ugUtORaX2FrzcOWh/6rQc=
X-Received: from wmbay27.prod.google.com ([2002:a05:600c:1e1b:b0:442:dd0d:556b])
 (user=bqe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4688:b0:43d:2230:300f
 with SMTP id 5b1f17b1804b1-442fd5a160amr147107165e9.0.1747671453952; Mon, 19
 May 2025 09:17:33 -0700 (PDT)
Date: Mon, 19 May 2025 16:17:02 +0000
In-Reply-To: <20250519161712.2609395-1-bqe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250519161712.2609395-1-bqe@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519161712.2609395-3-bqe@google.com>
Subject: [PATCH v8 2/5] rust: add bindings for bitops.h
From: Burak Emir <bqe@google.com>
To: Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>
Cc: Burak Emir <bqe@google.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Makes atomic set_bit and clear_bit inline functions as well as the
non-atomic variants __set_bit and __clear_bit available to Rust.
Adds a new MAINTAINERS section BITOPS API BINDINGS [RUST].

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Suggested-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Burak Emir <bqe@google.com>
Acked-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 MAINTAINERS            |  5 +++++
 rust/helpers/bitops.c  | 23 +++++++++++++++++++++++
 rust/helpers/helpers.c |  1 +
 3 files changed, 29 insertions(+)
 create mode 100644 rust/helpers/bitops.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 86cae0ca5287..04d6727e944c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4141,6 +4141,11 @@ F:	include/linux/bitops.h
 F:	lib/test_bitops.c
 F:	tools/*/bitops*
 
+BITOPS API BINDINGS [RUST]
+M:	Yury Norov <yury.norov@gmail.com>
+S:	Maintained
+F:	rust/helpers/bitops.c
+
 BLINKM RGB LED DRIVER
 M:	Jan-Simon Moeller <jansimon.moeller@gmx.de>
 S:	Maintained
diff --git a/rust/helpers/bitops.c b/rust/helpers/bitops.c
new file mode 100644
index 000000000000..1fe9e3b23a39
--- /dev/null
+++ b/rust/helpers/bitops.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bitops.h>
+
+void rust_helper___set_bit(unsigned int nr, unsigned long *addr)
+{
+	__set_bit(nr, addr);
+}
+
+void rust_helper___clear_bit(unsigned int nr, unsigned long *addr)
+{
+	__clear_bit(nr, addr);
+}
+
+void rust_helper_set_bit(unsigned int nr, volatile unsigned long *addr)
+{
+	set_bit(nr, addr);
+}
+
+void rust_helper_clear_bit(unsigned int nr, volatile unsigned long *addr)
+{
+	clear_bit(nr, addr);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 92721d165e35..4de8ac390241 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -8,6 +8,7 @@
  */
 
 #include "bitmap.c"
+#include "bitops.c"
 #include "blk.c"
 #include "bug.c"
 #include "build_assert.c"
-- 
2.49.0.1101.gccaa498523-goog

