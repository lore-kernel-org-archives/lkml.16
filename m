Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A20D19DF75
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743092194; cv=none; b=agnth1Ktn3tCPdkPP64RhV9WZqBrFYx8xFW/V8TbI2eWTESQl4TjDXSlE/JUol43DT9wJg6dbdMKSlQZ/f8lgIoswcpG1ZCHSvhbpxvjCPY5r8xhcxX+3EXaFB669eljBHO4/E9ZgCMhNHN240UJynYs7O5Ss2bt/7RzTw2YCbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743092194; c=relaxed/simple;
	bh=DJ3l8AAi2y7Bjf4lrz1BPuSe4xV+NNoCmhCPbhBoqQ8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dQhjHBMtTSHZ8jMR2GHTxa0W/Y6rPEVDfioZzX5NOJp+9o80OTTS4Oaf0Fh/BokYNkKDWOZq4DuZVBBZhlhI8x9MD+o4paGiz1fbAmvUD3OPbG8vkiXuGjKPaUvYd7bAlRZXdVggZgLwg3wPHqmPbc5JT0oFm4L4pdv87aZqqqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IsDtpLxm; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IsDtpLxm"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so7760515e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743092190; x=1743696990; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jVCo02UsJU/zo7xiESrCiw99iEGW/CKOsPYB+kkzIkg=;
        b=IsDtpLxmRX32FBSrluyrZ/lSJBccbTliO/VnOKxvAZql3CggedE2GYObMUs4XkBaoK
         Q2rw06zKCLoZpVG7IWkoWIP1S2z+h6N4JzMAHZzta9kPMdK4FhJO+CAZ1qwJJQSN4S9e
         8ReWPCpbV90vXJCOcgFsSW3i6iF4kU+vCG61zqirNXOOi83/OhaOA59BhD+7UFYnDOTW
         Rkzxg1qzjadXaWMwKIL93MYcBwajYz3PD+pWtwCxRMaT1yyyAkRWSg6/7kiXqOhQDSh+
         AcANeFRrEkvHd+NWr9oiVBxpUhndaqGUnYq2BRId7zWM3c2jxiojBTpWIUqdU4p1zN0y
         vAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092190; x=1743696990;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jVCo02UsJU/zo7xiESrCiw99iEGW/CKOsPYB+kkzIkg=;
        b=a+CXTkuFn4GyYkf8Ije8aEc4ilFloy5bSTs11kGUnPN6t7j4HUPi1eiIA0iQCyRjzM
         8f3D+2GN5hepF6wpco9G0TvDoMmovoTbDNSzHSPSlrRBXE5iqED3AincfO2NR7JAQRy7
         M6vCSarAcU4SD0GsnFdol/6SiWVnDtZzqcBE98yeZ9Mhso42W7wa3Mdi/DfcZm8hhbGb
         ccwn+ZPAkJJpiP8S8OvWxf2FvSdelwImBRbq6JmFZVJ0OnyL/1kE5Poyz2ZewlxSo8te
         k1N1EFMsGq94tqqD9cnvCZ1Tr1H1kGF3a09LdR5lzrH+OyhnDveH4lPX77zUhaKvHHws
         dZRg==
X-Forwarded-Encrypted: i=1; AJvYcCX4BZufwvF1Xz/Yh1g5unAj693CRRJh4MyMRa+pNlCE5EHxucT7HADOpZzFcVH1Ui11YZ0Z/ie12vSfYT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT3ugQ27fyq5JgML6Wejz8eUNIwTapuy1pIxFHYXAl7zbgRPRl
	9U54bNvFRALkAVDkuV6JubY9ohS8YXp0P28XbO41aYKJQInQYQre/uTqYkx6fearBA==
X-Google-Smtp-Source: AGHT+IGoBjiRSejFmjP8iJ0SeXPa1D6aN89hHsn49x8IJBqor4vNKOZKwZX15/zupbqFCYQzdph1j2g=
X-Received: from wmgg20.prod.google.com ([2002:a05:600d:14:b0:43d:50b6:b62b])
 (user=bqe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3489:b0:43d:36c:f24
 with SMTP id 5b1f17b1804b1-43d84fbbc7dmr47731695e9.13.1743092190794; Thu, 27
 Mar 2025 09:16:30 -0700 (PDT)
Date: Thu, 27 Mar 2025 16:16:11 +0000
In-Reply-To: <20250327161617.117748-1-bqe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250327161617.117748-1-bqe@google.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250327161617.117748-2-bqe@google.com>
Subject: [PATCH v6 1/4] rust: add bindings for bitmap.h
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

Makes the bitmap_copy_and_extend inline function available to Rust.
Adds F: to existing MAINTAINERS section BITMAP API BINDINGS [RUST].

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Suggested-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Burak Emir <bqe@google.com>
---
 MAINTAINERS                     | 1 +
 rust/bindings/bindings_helper.h | 1 +
 rust/helpers/bitmap.c           | 9 +++++++++
 rust/helpers/helpers.c          | 1 +
 4 files changed, 12 insertions(+)
 create mode 100644 rust/helpers/bitmap.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 1cd25139cc58..fcc56f7d7f16 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4031,6 +4031,7 @@ F:	tools/lib/find_bit.c
 BITMAP API BINDINGS [RUST]
 M:	Yury Norov <yury.norov@gmail.com>
 S:	Maintained
+F:	rust/helpers/bitmap.c
 F:	rust/helpers/cpumask.c
 
 BITOPS API
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 2396ca1cf8fb..1d96fb915917 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -7,6 +7,7 @@
  */
 
 #include <kunit/test.h>
+#include <linux/bitmap.h>
 #include <linux/blk-mq.h>
 #include <linux/blk_types.h>
 #include <linux/blkdev.h>
diff --git a/rust/helpers/bitmap.c b/rust/helpers/bitmap.c
new file mode 100644
index 000000000000..a50e2f082e47
--- /dev/null
+++ b/rust/helpers/bitmap.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bitmap.h>
+
+void rust_helper_bitmap_copy_and_extend(unsigned long *to, const unsigned long *from,
+		unsigned int count, unsigned int size)
+{
+	bitmap_copy_and_extend(to, from, count, size);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index e1c21eba9b15..d4a60f1d6cc4 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -7,6 +7,7 @@
  * Sorted alphabetically.
  */
 
+#include "bitmap.c"
 #include "blk.c"
 #include "bug.c"
 #include "build_assert.c"
-- 
2.49.0.395.g12beb8f557-goog

