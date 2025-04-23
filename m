Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B915B195B1A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415858; cv=none; b=bzn+SK31TCirzCR1k9+qqe/zSyiLvgLY26htOimEURN2cOGu7SUUNV9eVX5YlREUIaioUCp4WNRnwnAN9u6Y4XhuBaHdKJJhoAt8hkE30gmJ2ToCHCir9TEbscExrMqjPI08Xxe0EVlu0HO7kKXEq0JbyTXVExuChtkdg3HH948=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415858; c=relaxed/simple;
	bh=yIzxX0tP9e0JLmagsZ1eMyHw7tAe7CyG3pSIZakoVB8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Nb/bFRhQ3+8P5SJgaPKioly+z7eaZeWIfSocQtTwlfG2DuJPooL+4DB0sBNAf7U1R0SsUE1tE0kH8bTOuYCzm06tCSAYy9Oz1Y/UIk1rWwzvu9CeWXZyZCXEXPZ/NMu1F7tEj+T7O+AjVrGJIYNM/Xz/oudM8Akt+7GnadWZgLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JqMPznQ5; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JqMPznQ5"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-39ee4b91d1cso443959f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745415855; x=1746020655; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1A99eSFUrFSGG4Bz7Jobdz4l0qm1fXeNjUFJwd6iyuI=;
        b=JqMPznQ5BQndRrmxm/0zsbsybSPovI3zlj3uRJpOQSOeyvLafMKfNwgeM0bEFDf4S1
         SjwqX/fQ972LBhdrJogR9z7XcAkTd+ENRCJuIUunUPBJaAuM2F2BCFjmAiAcHRttbsg0
         HKEJsfbNAPpjtL5l/WrfaLxro2BoXDHaKpDSrS1J0MHYQjm2QCWhW/ewc9LmrHpfkw85
         puydUh1xDRQ8qfq1zPKaAxZpu8k+hC8L6Kopi9uMT/uu05ztoxF0HMHTMNIAefIAxfxE
         N3oKclou8zpqoPW7EVqbhmc92LbOnvW/PEbgYBllssAIM5izz728AkfCtWXE1Y6jqFrV
         oJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415855; x=1746020655;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1A99eSFUrFSGG4Bz7Jobdz4l0qm1fXeNjUFJwd6iyuI=;
        b=o2iwb9lakMsOtZfKSObxx+LSZ7BrDGRBykbskIEjwMepE4WpT2hCEbQPg2V1obQi15
         cJIeg21sFndirhytxdpPm18KCrD+Z4YldRat7PgSdPsHnkbopi3ajjDzfRdoX6qQ5IXt
         yQHAOIwKyyauUXQTNBA3H1dBowAzComo0Dyt5icWc70CtJtZLIjXWKfx0TbGKwWnYwEn
         WLZU8MkUMpal4d5qJE0LJ+0TEEzrr/YDKi0BWHa+a6b8K+IrEijHdgFhFIh0fdYcwOHw
         4ZKdEgB2WZCWhyUn7tOhL8UBXCFZpM4pMH+mDKfr0bEMaQGl6LzvXTgy8Ykjbp6TOXav
         i4Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWBTbylwXbRhSgGu/WFySR145/rbS94HJPeEKe9+nIRXUp7CAaT23TVa8wgtjKt0CgY9SfQsJ8ONxJTNIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSCQn1ScSswhdVyz/4quRlPXxpfXsN2l1YkYE+8sCwLHgYJY2I
	L/3RguLUgC35iFvwfYTMn4r9c258MVXcW4Ox/jofJV3lSPUl7YmW77EwB7z5zDW2/g==
X-Google-Smtp-Source: AGHT+IExriZUSDPN8q5d2JMXs3ZHtyHv81PF2eu9U05mRYtvnV31LLQuXxobwHvEkXUV2OBWSji3sRo=
X-Received: from wrbgv2.prod.google.com ([2002:a05:6000:4602:b0:39a:bed5:1512])
 (user=bqe job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:6d87:0:b0:391:1218:d5f4
 with SMTP id ffacd0b85a97d-3a067258559mr2721090f8f.23.1745415854992; Wed, 23
 Apr 2025 06:44:14 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:43:33 +0000
In-Reply-To: <20250423134344.3888205-2-bqe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423134344.3888205-2-bqe@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250423134344.3888205-3-bqe@google.com>
Subject: [PATCH v7 1/5] rust: add bindings for bitmap.h
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
index a5584c5020ac..b11eb9ebc53d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4132,6 +4132,7 @@ F:	tools/lib/find_bit.c
 BITMAP API BINDINGS [RUST]
 M:	Yury Norov <yury.norov@gmail.com>
 S:	Maintained
+F:	rust/helpers/bitmap.c
 F:	rust/helpers/cpumask.c
 
 BITOPS API
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index ab37e1d35c70..b6bf3b039c1b 100644
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
index 0aea103c16be..aa0c0c2cdee2 100644
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
2.49.0.805.g082f7c87e0-goog

