Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F1C1A8F71;
	Sun,  6 Apr 2025 11:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743937712; cv=none; b=D0XOkkOvTYwy6YmfU9SU75spO8uQ9l99lhfjzmDKuWk/XIY5+aCO4Fp16Jq7tpSqoovl3uglse5jTwygzTp26Wt82pAilPNlxo5SeV45irirnrj/70IIOopHHmwrxG4PGWBhDa6GICBKT8Qsb/H07dd/rV9hwsj0rfYPtVN+D2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743937712; c=relaxed/simple;
	bh=6a2SqOzeUTikL1/knW0fkq98y/PJNGZ74paZcZmiTdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l9O4gu6MtbRrnlXsTxj6fCyVXhdcs71FLclHKzv/c7HRk9taCJW6t7zzMfLfj4fhHHh8LheQKgEpkFQKcAwNEdduEQHsrZPk5kOGUS7p58W4Ck5NVaRbZDHfarEJZEP2KPAArJjKGe+oduboES3YSbSkAYSPKDMJ3FNROoBacnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fb6Q0laT; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fb6Q0laT"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2295d78b433so31440655ad.2;
        Sun, 06 Apr 2025 04:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743937709; x=1744542509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAnlAjbRZrY9tqq/RwMiZo/ti1onLK9/fDvfoBU2v7M=;
        b=fb6Q0laT1Fm7x8wwjgs+cuRb0nr0V6fVxNYLDASHKwC/aABDomaw/mNRdBrjcDgzYY
         AV+sSqENZwgREeKMIOPQZfvYh3CdfGo09WdM/AzAwoSNEXqlNYXRzSAM/3XwQpVnScs/
         DrtPaJxVcVDXYahvrstSzcGnjpUmCcx6GlJb4G3qJ00hfiHofpiyAi5boQ87QwynAQb8
         skPwP7to93jt6M2mhSrrxMUBt2Ei8VlXjSjCKjk/1SS8x3fr5mEEmdmnFP1O2YJ7w7+k
         jgC6uKXx8mhtHEptM13uMd2xXRHbnE4d1l8wJH79NHuoaAc9q9ejiMdCPgjD7sn4LAUS
         p6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743937709; x=1744542509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qAnlAjbRZrY9tqq/RwMiZo/ti1onLK9/fDvfoBU2v7M=;
        b=lkiTL1vXjNb38FjXVA7DDHSLoloANBylyJbPUEojnx3XAQiVGBniIRSQ0miz00uY3o
         jOZJSDpd3ZkoVerak+TBvySONbCpJ3uEf7k98+qQJ904iYp6A4L+Qubu3pCVEfKKqZJH
         /oczFWCkP6A5msm6dpM724XNZit4ZR0sKxE2cVZ/JEg2uL9K8OOaRXXQEETFyv8OJRf6
         tygPb4L3Hh8MCppdSQQIIY55RvksCzEDSoIzRjF30GIYu4AoWf+m+LJbsjzX78ZKUGMk
         G9iqb5EJMnM1WA9kP3CEYTZLG8ghua92RDtwuUZWg2PCVbjwSLHPa4IkpvTUr14fngaO
         dkIw==
X-Forwarded-Encrypted: i=1; AJvYcCV0TpOyw1cnd7a5XrY9x5KrNzd03aL0/ZsQrBE6wrq0cg1ZOwvQzIcDhETvlJRUC3TXJnWMY1/xUCxo2/eGwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhnX2+InYxxUpOaHiBsTzvAwOPPTNRckpwXr3B1ykmr5EQotTg
	kTaLNMlqIdWKPQtbJMaOV8kIwzdxkGrfuNmdXEGHdXWFQg8NDViN9xJC21hQ
X-Gm-Gg: ASbGncsuQY6QWn0GZZ72UsCnQvQGMvDEgmEPwdVonl3emunXde9mUrU0vGywpLkaxhu
	uICh17c17jyztSKJp+nhQ6xX2Pyp8vfKPt03mZA15U2jaGQi5Es4zFBlUQ9evhXVDMEF3kAAbx0
	HEpzQZGPuIy6Skct8bRdUkW1vXGq99kNOg+x3E5k121VNmscuI/+dQ3Tj35WKqHquR5qbuFU2p7
	1FjSAugQsF3gHo04RruxWSbTzCmHmcS2kgtOKvb8cegswuFq4PFlPMwJTIkXP8yuWYwnki5JLKW
	fB9r10wtBuxf/akDfVw/Ukz1cpYfZg127VWFuQpqeG+6bZdILuqJBQ1LgulXcUdksGx7xl4fGBX
	0FwtymHsh3BUtnOzaYdIBEw==
X-Google-Smtp-Source: AGHT+IHGPUwgpSv2QCpVIqKwzkDIjaH35+jacop/mgxP8m+CIoBMk6VKXXKV7KOkPyaR5H1EbOlUAQ==
X-Received: by 2002:a17:902:e552:b0:21f:3e2d:7d42 with SMTP id d9443c01a7336-22a8a06a041mr121699845ad.23.1743937709469;
        Sun, 06 Apr 2025 04:08:29 -0700 (PDT)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785adb04sm62080215ad.15.2025.04.06.04.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 04:08:29 -0700 (PDT)
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
Subject: [PATCH v1 2/2] rust: task: add Rust version of might_sleep()
Date: Sun,  6 Apr 2025 20:07:18 +0900
Message-ID: <20250406110718.126146-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250406110718.126146-1-fujita.tomonori@gmail.com>
References: <20250406110718.126146-1-fujita.tomonori@gmail.com>
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
 rust/kernel/task.rs | 26 ++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

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
index 9e6f6854948d..1f0156b38ab5 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -380,3 +380,29 @@ fn eq(&self, other: &Kuid) -> bool {
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
+        // SAFETY: FFI call.
+        unsafe {
+            crate::bindings::__might_sleep_precision(
+                loc.file().as_ptr().cast(),
+                loc.file().len() as i32,
+                loc.line() as i32,
+            )
+        }
+    }
+
+    // SAFETY: FFI call.
+    unsafe { crate::bindings::might_resched() }
+}
-- 
2.43.0

