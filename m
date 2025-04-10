Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70162147F8;
	Thu, 10 Apr 2025 22:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744325850; cv=none; b=QOlYbJtWcXwi6R7VxXb3DYg9Ow2qx9lUAJ5Wt6m8AdaB4XP+oKI5pOAuTG2FQphshDGnHaFyaGWEMMS/SltVlm2sHJkxO5mx/0AhPcV4ONO4nXi1hXG3u8V4qDb3x9qUQAf4pFq65VDPm7P9r60BDi80SpLIkTJUpc0PlwrFC38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744325850; c=relaxed/simple;
	bh=uUChC6aPedVbKyzSDiXONrNtk2WsfGQ3jMuQEgpC1ZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KZHqB0O1u10+9eKaMWGxdvR6+wjF/zQlch+SF0OSuzu/Xr5jN6ayq17qJ9a3L7X5eWYdig1pPAbv3cUH67BqZnIJwXZZ3VtcYR2fm0zF6uZ1FpiTDsqXuLoFKnCvo44W9Lp7DTl1fA5VgGRJZdLegQus/kuYhF/CBfE0jbtKLG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndRhp6F8; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndRhp6F8"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736c277331eso2397075b3a.1;
        Thu, 10 Apr 2025 15:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744325848; x=1744930648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDaI71ukgOzKfgXg3PENYNxKpxCB71oqs08Zj0uR+HI=;
        b=ndRhp6F83OnallbAjHVtjCNRvcRjm+/uRVYFwo5CvMJ2K2O3z0l4HiAfM4WHHrjOk1
         d3YCKk3ZpHVdcSMKgFfeWMx+1IllGDtUfmIq6W2fhsEFZ328iHpJ+GzZbs0pn7i0lIlf
         APZnNkeAXfAkFfzoJ1f+oUduNewDAcp/zf9Y3Zlr935qEfUooKHbBb3QpM29At1fwYpQ
         zf8QI6LHvCgegyOCCnRW/bk/ji10KuCNpH22/qtzl3gsYDYgQ6Imywjoxc9UMkkBXKnm
         t5S3TjLB1TRXXvDGgc3iIerEWhn1cmw1AiLqBs/xqSTd6B6PK3FJHBZWWyYnQCN7jY7Z
         hMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744325848; x=1744930648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDaI71ukgOzKfgXg3PENYNxKpxCB71oqs08Zj0uR+HI=;
        b=AN3CktsFGD3B0YZkOQTUB/Aa4dTUV+xrpUC2E56L3hRw6zODx0BHi7I7txYcmiOn1K
         8PKRaexeZbxbJaxxvV0J8aD49Cyhr4T+R6Xez2ysWxzGsNIAw+ELu5KD9roxPU85yTPB
         MQfcI2mBtovtNGfo292s18meokXf1TAP7kfChP+PinOT2W8Xo8qJmPUfc7fDMb35LqyK
         qvHPldS98hUr9mXH6eE4U3BC00WyZOAMs69Pun1pvXYxV/t8l5+OPn0KRt6Uf3L7tUmg
         i2XlgbKtlMAP0i9Mb6a9mDXbEf4r6EGJ/PBRHI+hPcfkdbj5cQVNlwrG2j94EuIjmurq
         BRFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR2xzg3+bM8T8swlmFD2GYDuXceHsVobqB99l0eCsGpsmSqYlzhzX74xRhI45NoeKYFBzlYwFlGSOp1MmYSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz9fEdONGigUZr/LJ/GcAH2dHXNrRT8M2XHb99mduAwUiP5oiE
	jY+UDIJpU712ieAGBA0BlvlvU7Yb6CSLxStYebAFYCHD/NM//0QpF9e+To73
X-Gm-Gg: ASbGncv+PSfATE7exmBvUVoUVC9RVq46rSeGtpnsCgAVkOdXKl3JxA1FE5m5+OvWKMk
	kHOPpBVJornC7oQeOdHE19GLNULvLtiLFuSN5Or4OhsCCe0jdtVJIvABEkbnhQ+hrAWpllsDNMx
	+jcGxx9XO/H0oJV0WDBWzSPRttgv4CqHF/L3HuX+OT/m4xkiVc49lzMeWUUXv/xSAVAUCPLB0H3
	hcVCKqPaIpKqntk/lfLUe5u1jdWADhKNIfVW2Vt4qWPCo85bub2EMhqbdNU0AthYchIKOnHdOaJ
	QEBgHWBYuUYvJl/EUisL0VAX9A2gkD5jxDRXxaWVkP6T2LPTELFEV9Ai5S61da5ZaTenBm9mkF9
	9xd5Br66TdUKmx2KCKw==
X-Google-Smtp-Source: AGHT+IH8q3ZGmd1kwt5qEP9Rbm+ZNhvGO6seXqKH5UCkW/KlOVFiqskOAizEDU0ptgB5pG/CXKDGBA==
X-Received: by 2002:a05:6a00:2e29:b0:736:bced:f4cf with SMTP id d2e1a72fcca58-73bd0a0df56mr1042450b3a.0.1744325847824;
        Thu, 10 Apr 2025 15:57:27 -0700 (PDT)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a2d3a5e5sm3583310a12.54.2025.04.10.15.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 15:57:27 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: boqun.feng@gmail.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	pmladek@suse.com
Subject: [PATCH v2 2/2] rust: task: add Rust version of might_sleep()
Date: Fri, 11 Apr 2025 07:56:23 +0900
Message-ID: <20250410225623.152616-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410225623.152616-1-fujita.tomonori@gmail.com>
References: <20250410225623.152616-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a helper function equivalent to the C's might_sleep(), which
serves as a debugging aid and a potential scheduling point.

Note that this function can only be used in a nonatomic context.

This will be used by Rust version of read_poll_timeout().

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/task.c |  6 ++++++
 rust/kernel/task.rs | 28 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/rust/helpers/task.c b/rust/helpers/task.c
index 31c33ea2dce6..2c85bbc2727e 100644
--- a/rust/helpers/task.c
+++ b/rust/helpers/task.c
@@ -1,7 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <linux/kernel.h>
 #include <linux/sched/task.h>
 
+void rust_helper_might_resched(void)
+{
+	might_resched();
+}
+
 struct task_struct *rust_helper_get_current(void)
 {
 	return current;
diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 9e6f6854948d..bb1102f6cc02 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -380,3 +380,31 @@ fn eq(&self, other: &Kuid) -> bool {
 }
 
 impl Eq for Kuid {}
+
+/// Annotation for functions that can sleep.
+///
+/// Equivalent to the C side [`might_sleep()`], this function serves as
+/// a debugging aid and a potential scheduling point.
+///
+/// This function can only be used in a nonatomic context.
+#[track_caller]
+#[inline]
+pub fn might_sleep() {
+    #[cfg(CONFIG_DEBUG_ATOMIC_SLEEP)]
+    {
+        let loc = core::panic::Location::caller();
+        let file = loc.file();
+
+        // SAFETY: `file.as_ptr()` is valid for reading for `file.len()` bytes.
+        unsafe {
+            crate::bindings::__might_sleep_precision(
+                file.as_ptr().cast(),
+                file.len() as i32,
+                loc.line() as i32,
+            )
+        }
+    }
+
+    // SAFETY: Always safe to call.
+    unsafe { crate::bindings::might_resched() }
+}
-- 
2.43.0

