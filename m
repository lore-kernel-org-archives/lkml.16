Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433E7213240
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 15:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748271712; cv=none; b=AcgNHpkhzCxHIvn7WVQKqxh2BkeeWhYyKY4gpro9YJmm8zDZa9R2S0P9iIdX5/BcfeUB0UgJ/+o4xtXZvrz/6J8B88p6Z2NuBat/ywl5WfHwv0ajVqZ8F/LyhGQqmVKnR88XM0WTrJqn21BYQFWdDQJRDHmqGhjnh2RE8VhFUsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748271712; c=relaxed/simple;
	bh=Q/2BsgKz24Vtl8wIJjkgERERw7Spq2sdcAdXYaotMo4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=moDSbtmL1dn/+T5Fb09eaReX1+dLw6kersBTVKefQ8tH311kbjC1YywLYMB1s6tDMqokMOv2+EUvyPxll1c91z3//xgQ0gQ/jq/bs71WSXsab5QsWq81eQgGy8xPIvKpgB9+bGofd0betEYFnvp9jWlhL3iTupJkU7dRNaNpUv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xyfCek5l; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xyfCek5l"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43ea256f039so18437315e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 08:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748271709; x=1748876509; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SQP6Td3kWKuKqRj2KRN0QM8NzsKBYR8G0PzCVMLQtO0=;
        b=xyfCek5lFvjMqll2gBHEc4LafERAqOh7SnvH4KLBQgPSAQFTOhtNbqI0SX4hZo7u96
         xgbQy5+7CWGo7wUy+jSRqEu2/u7Q2Gwy173jcqadFh4Z6XsrKrXX1BmH3PccBk5uGQ2+
         KEnjZ7orfy0gZiFGbso8nsnR2CJBAAujtTCtwfdFZZ0mqUhlSlzg+TGwcqfDJ7UWCH7S
         iAKkQt789pwFGTMSQQ9lhkdSWVjBdg6KKscPwYMRfdxhg+GwMge8l2u4C9B5sLqshPQL
         dBNZAu6wKQGbLswM/pKfEOoX39RSgd1nRkAjP1cNJBefH+Hc4a/v6GOaluL2HP+Wf5nj
         PQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748271709; x=1748876509;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQP6Td3kWKuKqRj2KRN0QM8NzsKBYR8G0PzCVMLQtO0=;
        b=El2res85+hd2qoSzmvrH5Nb+2bM/3VSuVSHocLq7NmWQ7hsfrAPFptgv0c/nB8S5lL
         ii5Z0/+7xFxSxxB9tuxejNaz9FpcWthQrkX0AqEEXVaOY7NHoVG0DeWPjn3C5yGqvob4
         QxWqlZ+6WgCFtFXsUFSbnDySeRU/YuzDV/51BmUfHY7fegI0SJKDV/CnYu/OoHkpDnls
         2JJxe/oj4otgj0xDCMX88qxSzEMJU8Ckr2Gf7QrT/Sb/d6D6L1dQ7vGMDLoMpCrqFHh8
         JLSOpMq5UV+mcSbeTeXjdhDs67o4kYo70AK5plYbNQLBI9y35jQFpUwDBieitLPWeLV6
         JrnA==
X-Forwarded-Encrypted: i=1; AJvYcCX4vk49gxMYPFIk2xvLaqRWWmQTgnGT8yXwVGFeZF8KnBbcN1z7qkBQhVHHMZt9p3iZcD3MfNGlVgKophE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ4MZqKneq8fx87OMJAKhiNnOvnO7BsoC8fMQQgf7ll4K7LjK5
	0J+YXnZAaljnEmLr3B+bhi+3yFI9Z1WpoeVlY/Il0Vn6JVHYM7MhwqaXKP2gYPKROjgSLw==
X-Google-Smtp-Source: AGHT+IG7bMDz+nyV21aR+cR9rz6T4gu5RRq0QfvbqOxOM4k37bGT04jZzRz8bA5euIEZI5NyPC9+hsM=
X-Received: from wmrn43.prod.google.com ([2002:a05:600c:502b:b0:43c:ef1f:48d3])
 (user=bqe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5396:b0:43c:f63c:babb
 with SMTP id 5b1f17b1804b1-44c91607264mr72968455e9.1.1748271708454; Mon, 26
 May 2025 08:01:48 -0700 (PDT)
Date: Mon, 26 May 2025 15:01:31 +0000
In-Reply-To: <20250526150141.3407433-1-bqe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250526150141.3407433-1-bqe@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250526150141.3407433-3-bqe@google.com>
Subject: [PATCH v9 2/5] rust: add bindings for bitops.h
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
2.49.0.1151.ga128411c76-goog

