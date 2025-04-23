Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9781A317A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415860; cv=none; b=HPLkavBmmpidqAXOPmw1KnS31tAmpPyJCRRi1sWD8WRBU6tv0SXTbw2jiUNegehumzwNyrkjdZXowgj2FskAClfQhG+28VabrhlTdtQDNCYwKeMEBLutL75lWSaNg1pBzhLfmBzFJBMrD+mexgVL2Q7VcQ/pPBJl0Z4QYx6tkEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415860; c=relaxed/simple;
	bh=8ekZMtIrG3hU4vwbhNsYrbbNwF7snpHGbqgyDejMHYc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hL7rXWIwLuIbdGDJDBUgNxhQTNXzdZq/UKi2/wbkOZaAKimMVVsboKwmhsvjYdCafSSznIkagxyZNAc4rRwaBNMw8rGknXn0EIGTSM6ES30tJasmgbGjcGlk3/efquOwKqfQsxbV6P+iqZ5btPwxEyl4oN/Bcg7HhYfoopAlg+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F8e66Sz4; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F8e66Sz4"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43f405810b4so35445985e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745415857; x=1746020657; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6jrbZeo7zB+X6sIpszh897DyY2l159fzVAdckqJoJCc=;
        b=F8e66Sz44d5+1cIVIcaDswO1z+PXCOiYpCeEHMBdYvigGFPzZsTk6AXwdI9xhgA0C4
         36I9Lnt4yN8qtwuwQKlLNZ9hd1Bg2meyk9SUp6TYQiuaUF2aBu3FQNU3Ol7ltgfK0VMU
         on3EJMcf6LtfVJAzdOPAWR78t+2+f2KB/KUNsuVm0rV5jWnr4zJk7TuyfIaUcyupDAPU
         a1dZ3W7g7QY0ZnMEYRax5/xi41WaOV+ntGp7whDwSNerLX0lm2mCf4DMsnlV/FJC4GQt
         oLu4A/ecNusErJYcEFOmvdwxXM7NrZwrQfHEFX3dbzjO1yRJCksyMIgaTiveSOD5Etxy
         7ZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415857; x=1746020657;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6jrbZeo7zB+X6sIpszh897DyY2l159fzVAdckqJoJCc=;
        b=YDOkITXSVy61nGs4urfsbunA10Sy+IhmsUsBj8SdWslT4RE2tn5BiDWw7OJxJN5D7j
         wp1WBO0UB/oqeKVb6HFmgwX/ZOjL9Cm8IQTy8BDo2CWiv0E80fFmtyDoqLgloQHYMglm
         WOrTAJiZsL/KbrWMws0XDgpy93YFIYu3B4nYifaZ3VrV8VDABWbzuIwMGjObvSh5Wcj9
         TG9sFdWtGULtBxD9XeTTgLnK85MEI2LWp3Fc4KatbSiRlkveAYIten4Rrv1rk6sTEAWZ
         +kQ/0WJh+6jfr5H9HNNIvuCgWBhdwKPA1ZyEh6bQWD+OqceOYY18dGabQMCzexEurlaT
         oAcA==
X-Forwarded-Encrypted: i=1; AJvYcCU5RLEcKhHoY83fOr8WaJx+qKELW3M3IzKnBdN9PFJU4TpEDlwJ1ZGpRYgcfUt0GICv9948Mz4g9HDkOOY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp86kLXUmQi1BbsbhOOMTucCVeozLGMWo9lIFwYuT/ZENk+eVr
	ZuP9UVMJtIdQ7dR5/H1wJQ97DHo+iYUNerGQU07aE9Eg+6JSDeqa5JiHM+0G/1pXGg==
X-Google-Smtp-Source: AGHT+IG9zS2zXm18UXzm/NCjL3c/pfzyEtXjETKoz+v6m8QVLX2AmL5XL4LIXOArqr6rZm9jMS9bCIc=
X-Received: from wmga20.prod.google.com ([2002:a05:600c:2d54:b0:43b:bf16:d6be])
 (user=bqe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c07:b0:43c:f6c6:578c
 with SMTP id 5b1f17b1804b1-4406aba5a1amr197432405e9.15.1745415857158; Wed, 23
 Apr 2025 06:44:17 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:43:34 +0000
In-Reply-To: <20250423134344.3888205-2-bqe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423134344.3888205-2-bqe@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250423134344.3888205-4-bqe@google.com>
Subject: [PATCH v7 2/5] rust: add bindings for bitops.h
From: Burak Emir <bqe@google.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Burak Emir <bqe@google.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Makes atomic set_bit and clear_bit inline functions as well as the
non-atomic variants __set_bit and __clear_bit available to Rust.
Adds a new MAINTAINERS section BITOPS API BINDINGS [RUST].

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Suggested-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Burak Emir <bqe@google.com>
---
 MAINTAINERS            |  5 +++++
 rust/helpers/bitops.c  | 23 +++++++++++++++++++++++
 rust/helpers/helpers.c |  1 +
 3 files changed, 29 insertions(+)
 create mode 100644 rust/helpers/bitops.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b11eb9ebc53d..1f162f64eded 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4149,6 +4149,11 @@ F:	include/linux/bitops.h
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
index aa0c0c2cdee2..aaf0f735d1c2 100644
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
2.49.0.805.g082f7c87e0-goog

