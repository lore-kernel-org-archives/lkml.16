Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3780B23B60F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750408207; cv=none; b=uB34zZhtRmFKdyQ+1a7q6zcMX1jYbrObQSdcMNDr0ssy8AQ7k/QLIG6JghAYxz3zXdyhAAtFsq+DFzYpFtI4moewJM1P2tSA/nZ3rf5x3lP7+L8O6frwtMTWDUoF+aXvOBsfPoOvxZRMVQ080bh6HlewbHuZAag8wkN9/R/aSVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750408207; c=relaxed/simple;
	bh=lnqMqBzS1FKlZOPzUsW3TXLk+wBzbvO82bAGVf2xS9U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DG6+sNjoadvTU3Qk7nzcBEEwH/LvzN+mJvNUTKdn4Mf/juuMRR2jjRVOSOlFiXDyVQ+e1Iw8lveNbgRy31Gv9y7RP+G6oDb3ms5boWlDLTNTHqDPauJwXNVf1fxfRon6VTUwcMKuiNKEtE1daS8GWEz5mbtKpq4a7eyeTcL0oYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OjI4FZfc; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OjI4FZfc"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so8697625e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750408203; x=1751013003; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3lbfDPzBbKTCWHqc3qmQbcXpBhO9J2Lovr7h5ajgkMg=;
        b=OjI4FZfcSIz+R/VFI3hmfUlzNQIfyFJzNS62/Mx5ZaErRYRoAclN4MqAs2edBJ8/LV
         g5dgENTCF0NUFkLKSG9jc2BVEDusm5eMB5Lsvtz7xagumpWh7hLLWXezv976JS6AFCO2
         kSBHhqy9YQCzN9VFuo36ieAxdOLFRH959Nso/BIhcWwiRri6dcd5vBzjc7fyPJcWhGgO
         PT9He1uXruArfusNvwpzZwblFd9NGe8t8m2T8fcjWzhc3J1d4PfxyD+S8kgn+O13XQcR
         ausLUPakO52Som/n0z6kROIprHwyMwv4XYTYR2d+JmmbsbmYSy1uwSw3uaGWvuVcQBHq
         rcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408203; x=1751013003;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3lbfDPzBbKTCWHqc3qmQbcXpBhO9J2Lovr7h5ajgkMg=;
        b=NErPHFB9OMakk6klIec11HPAE0iljt8jqJ+7iczufgQzgtvvUb9wf5OZv8Dnif2bom
         +2K/XzJAfuWtwT7IXKFh6L/J9EntHorSLjtJkgXF0c213E/d4BInOqnKkTAVX7WdvX2P
         tIbgb4iJ/b7Btmky/Q6dVwsT3NXhy3PqUEnuWlPwgA3QU19hnZW8pJZxyu+04yBgSSRL
         ZB3szE9KxtoRDTvxgoygUHrtijXn2zGvzU5B5+uTl3CxVk3/6vYqrmIhqsZjbDtu7iOp
         vhbgbHeaAruNXRHqr1ZQjcUZu4m1uH6raYtToPMZR8ZAby9CiG10L2wmXb7w2LBuIL0U
         nfEA==
X-Forwarded-Encrypted: i=1; AJvYcCX0nGAAC38Fx9gvJuKKdl24PLwjoZSYXKyEvEAxaZntuh0RyI8fznGSWLa9QkccHGghBEkjEOIN1zmoz8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOYZ35p8bqH/P67jxYNw2dmAPEhdlfoBwYIoSnnDRTT10knFiL
	OZVLKwlZL1+J9noSciRwkXSr1ZvOB+/lwNwpQBRoOCpdENN8H6zUBbcxxKax8lHgjdJLrw==
X-Google-Smtp-Source: AGHT+IEQ0lR4/25cndZlM2z4leSHkGtmPQj/mYAsjtoLLhKkf6tMO/1wnEXGzR2hR9fe/XfhBmpBb/o=
X-Received: from wmqa15.prod.google.com ([2002:a05:600c:348f:b0:453:910:1a18])
 (user=bqe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:10:b0:453:483b:6272
 with SMTP id 5b1f17b1804b1-453662c5af2mr8982195e9.7.1750408203621; Fri, 20
 Jun 2025 01:30:03 -0700 (PDT)
Date: Fri, 20 Jun 2025 08:29:47 +0000
In-Reply-To: <20250620082954.540955-1-bqe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250620082954.540955-1-bqe@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250620082954.540955-3-bqe@google.com>
Subject: [PATCH v13 2/5] rust: add bindings for bitops.h
From: Burak Emir <bqe@google.com>
To: Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>
Cc: Burak Emir <bqe@google.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	Carlos LLama <cmllamas@google.com>, Pekka Ristola <pekkarr@protonmail.com>, 
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
index f83386712a2d..8acc32a59ff5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4217,6 +4217,11 @@ F:	include/linux/bitops.h
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
index 000000000000..5d0861d29d3f
--- /dev/null
+++ b/rust/helpers/bitops.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bitops.h>
+
+void rust_helper___set_bit(unsigned long nr, unsigned long *addr)
+{
+	__set_bit(nr, addr);
+}
+
+void rust_helper___clear_bit(unsigned long nr, unsigned long *addr)
+{
+	__clear_bit(nr, addr);
+}
+
+void rust_helper_set_bit(unsigned long nr, volatile unsigned long *addr)
+{
+	set_bit(nr, addr);
+}
+
+void rust_helper_clear_bit(unsigned long nr, volatile unsigned long *addr)
+{
+	clear_bit(nr, addr);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index cb47c4708a3b..63dc1ffd31e1 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -9,6 +9,7 @@
 
 #include "auxiliary.c"
 #include "bitmap.c"
+#include "bitops.c"
 #include "blk.c"
 #include "bug.c"
 #include "build_assert.c"
-- 
2.50.0.rc2.761.g2dc52ea45b-goog

