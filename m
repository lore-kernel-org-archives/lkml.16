Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39DB2BEC34
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 19:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749671332; cv=none; b=W2qkryQGB0HaRkMSgNgoDy/4jkljPmWitKKfNyNxW7PJbj30VJJIjYBX9j3K+9zJXE/E5PIkYs94y2kFZ05i6S3sdis3GCAlZ0ptxm8mD82NdY8Cd29hUWV3cwF2mT/UfuRM8Sk0dE1bopJ4fhkgtnoXZcwVgE126gldkESq0pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749671332; c=relaxed/simple;
	bh=gqaHPneF0cqITPOQdFItv4zvYDCtdzOKU/CmcGjJKsA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qxUnRvf1hq+EC4smVvisNshaJF7Lmdyhr32rsxVpOiNhBX5RzURCbsE4e10jonyHpehG90Am0jOseUQ8N2G6MvrIth3MeyjSazBMxWb2MAvkfcfnTeMxVw8Xq3AhxJmgXfHdf/eqDkfKLj3WqXGjxi/X2+T44KiuiVSB1gpSreg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LoqKnW6g; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LoqKnW6g"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-450d57a0641so810525e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749671328; x=1750276128; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SYYwk1F1uCOUeWpobWAgz88gmuHY7gm5QyDVjYMI/kk=;
        b=LoqKnW6gHJoVkOm4aDAbIFQqiQxOzd66pJyREvb2wVpji51b5xSQqdvnh3RGexUR6o
         RBbsLI0oODv28NH1HmzbMqqxCLK6KYfzNF15mm+PPAd1hr2FZlT10O/MUWWLbP9iHbRp
         qu3THBGbSV5DxlVkW9XBe2u488amxSgsqUsRmqmdIFFjExa+ppEZIH+g2ifvvR2ToPpD
         PfBDnEcNSeRj1d3tH3ZaJDJjuDb3yImlbVKhJb1n1ywAorHTLc8bR07Uc1vg9X/lvxhq
         5nrUztYdgiuNIqM5dkoMdds+iih4P4L3+zNVMuIFF4BDi8UnHW4iL877+mMtXwxG8nEE
         6Gcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749671328; x=1750276128;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SYYwk1F1uCOUeWpobWAgz88gmuHY7gm5QyDVjYMI/kk=;
        b=YEK6hZszdE0Oj0QexD/UR/0OS4+OKRGyOMi+1lOQL8RtpcksLsBpAH/JloYdkbMMOH
         q7uvHKTcC52p8ic3Mk0t4Y05b1r4uWql5fvHtaLYhMeW/PyPl8qWc3QHnz9KYV/PBwil
         hOuDNlFlsvF0yKXMLpQF9Yr9ewv2/oPPOlCYBN3HGlRFDwm1qHLxIi8ne/8WW+RjnF/e
         32QqcAi17EhXOMe/w/7pglCuEZ09iq+3Len9MoCpMQxr/V+IBpWa5ejuK5jggKnjczLc
         a4nPNhBvXNbktE6UQK9SyqqrTu0V9PbgO6OVCY1fYeZK0RrafcxRPa6NisJbahhUIiq2
         WMGw==
X-Forwarded-Encrypted: i=1; AJvYcCUU/zy7MNxY6co0NbsinfUxNjNEPhHBaPe7A7ux9lJfLrox6YCLF8qLBzZxn5bGC2S+umWxI9f47ZPx+5g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj/Q4D29Y3SHvi3my9K0hPpqOONWuiwprqAJcyDVb16zlgbT07
	BAKki5/dpgPJEhbrg0btdIc4xeBJXwzbpmEIGlavtCiVmSOxecKDdJwVwH3oI1EuaqNe5w==
X-Google-Smtp-Source: AGHT+IESvV7+EqqfJErcp2hEmTvLDACMxavbPF9yWE/a5KD+LEzBm8RxIqC+L8G6473prfPEI/uX2eI=
X-Received: from wmbfs22.prod.google.com ([2002:a05:600c:3f96:b0:442:f4a3:b8f5])
 (user=bqe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1d07:b0:43d:9f2:6274
 with SMTP id 5b1f17b1804b1-4532d2f2d85mr2420365e9.14.1749671328422; Wed, 11
 Jun 2025 12:48:48 -0700 (PDT)
Date: Wed, 11 Jun 2025 19:48:35 +0000
In-Reply-To: <20250611194840.877308-1-bqe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611194840.877308-1-bqe@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611194840.877308-3-bqe@google.com>
Subject: [PATCH v12 2/5] rust: add bindings for bitops.h
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
2.50.0.rc1.591.g9c95f17f64-goog

