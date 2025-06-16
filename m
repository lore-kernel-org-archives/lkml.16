Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68C42652BF;
	Mon, 16 Jun 2025 15:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750088174; cv=none; b=KLYgz/Guw8mg9/3I4Mk3oVdpGYFHDJbzsIUcViuXifFOF7LAqfOLXuClfYEhP+xXvZctpC8OAKrqPgRWYayDO+NiiEvsc6epXtfquTtzcTrQNWhrlt3klm30LBZQkGMRtWxZWcWC0xT1wjGFqvN9vEU2i0HbsZLJQrRwbHzddB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750088174; c=relaxed/simple;
	bh=E5LglV6rAiHuequJO+Q4Ddirros+24bPUuo2UeWy3vE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XnGHXY5QCxje8Vl78afzr4ZS6vPZJx2uLm4iO999AGhneYOpD0kS46lkBH55X5WfCTAoXdlVGVu0Xdo6VRSpSSYb5ipQCxzI+Qknj9zsI6yE4udUPe+r7DPg8KxoMxL6SU5yGbQZCKeXEU1rz0fLsa23Hu3cYEhasvR2QIG6KLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCBQL+ri; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCBQL+ri"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a4312b4849so55275841cf.1;
        Mon, 16 Jun 2025 08:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750088172; x=1750692972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RJaM7R24Tq+E1cluRMBVNRPC48DIpUAHPZ8QzeRruqs=;
        b=fCBQL+riRHvy7dHA3qsQGK8Vln12UI5drGs26OyY84Oe4wdnr+qYLx5ErJjvQfuWUB
         Q0D2/jiJGdTrcsG4dr3FP41zeVxRis1e0wrAxM3D2R2dt1pM/NuxEtqEqawxq29UbUhP
         Ry+TIOlyvxCIaBLQb0yB2JTNe4Lu2x0nEqKcivz9k+F34pIUxRa69PmlVV2g4TWkaGFE
         XXl9cFdgSgD1bJDwZhvw5CkJ4Un/IqKpl72AAibxHTAmDD3TciXhVVpkJp8KGqJSZL/V
         Acv/ZZp7dqPfBkwhnB0oYvT0f94hqyTjJVHW1hfhboYsOD+C5viGAdPVAKdh2hfEY491
         gJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750088172; x=1750692972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RJaM7R24Tq+E1cluRMBVNRPC48DIpUAHPZ8QzeRruqs=;
        b=f2LyZ16cZ1gBzNLJrulCvQcAQ9lNzNtZMqDMJYOVGrMXq3optq6LBj7sTygUHscoCM
         JpBqF4vW4tQTyvIZv0O3+2Cwsei3ohB5h2xVwYyBrGRQi+dTzABEV4aosFo+qQfkQbap
         K4yKRtzSd5l1AtK049jBIaor0QGy58A7SMb1vc8vB4xJuNIWFEQEuKcRPGG6fNoa5qU7
         /SMXeauu5Xtwc6wW6dtbiWsDA+B6eJXPMefVWbIBQjZbRJ1gl381o8x0NO2Syt4XLJ4U
         5ez9cR5SibGxk7AsXBBR5ENmF2xuUB2MRg+Pa82sYG3U1FSY0y2SaeAigsnB+FQKSfXx
         pBEA==
X-Forwarded-Encrypted: i=1; AJvYcCVbw4M+o/5zkIBPUW5SpPc60QOOUwSbsL2dc+K5NkiR7QzrBGchr2r4RYYkW9hJQ36d3oQb4g8CxPeYJEzB1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzNqk3gnYBtmo/fqn3V0RJJQisJXcBzyWNfQDxS6LSazDO7HbL
	GmXV1oZr8rnsK348W8aGkUZ9wMPmUKmEF4oXtBfb6ddBjyIoIUJlH/wV
X-Gm-Gg: ASbGncvgE1EQHUxTMiXiiekPgpTwMuAbZPX9x+xG816YShmAkkwOEj2qV0XrQnpssBw
	QlZKWuIh/QYMm/OsqO2MxR6v6wZG+AZGS9ezvziX1UGpGJkPegpOTCKPjzeP8TTU567Nvr5SffH
	GTUNA6qjbQNEkHDetFENAed/ufqs72vxBEoQ0Y3slmNkOS7mdAtDBx8qI01LMRu686lZR+l9PLL
	Q74u0PEblMob9o5Ncp+9hOIrt7OIAl4LUF3OKClQ3IQHsB1/rWIuoSL7G7fWd2TZDsHoYu4jWUQ
	e700vn0ljUDRIUFpWDKUlSbIzwhglQZEngTa2SmTnoL8HcfIG4/mhqmxChs+w2soWYugpwaZHE2
	vEHtgrRrL3PbbvL+nQTu0GROGDzjgJrgzuP1YZGg5SfDBwqTTT/kp
X-Google-Smtp-Source: AGHT+IHICHDr24Pjo41nr1xoI1/YFJxOlsC3+QgYJ5w/dJkVtAr+PqejrcmoffrH9Dx0BUKJp/aw8Q==
X-Received: by 2002:a05:622a:1a04:b0:4a1:3b18:598a with SMTP id d75a77b69052e-4a73c47e1bamr172454971cf.5.1750088171707;
        Mon, 16 Jun 2025 08:36:11 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a0fcd34sm50312731cf.0.2025.06.16.08.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:36:11 -0700 (PDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id AD4E5120006A;
	Mon, 16 Jun 2025 11:36:10 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Mon, 16 Jun 2025 11:36:10 -0400
X-ME-Sender: <xms:6jlQaDuEPGv2fxAe8BoWzbvfV4iYrPAC9I5IJLFFy7hnJpZae1SR8A>
    <xme:6jlQaEdr618-TUGJ1X8tROIWKcu9vrO5QZ_He9va85kYm9n1QqY6HNEkYQdL1XRBG
    yaCBd5hpgUYnrmqRQ>
X-ME-Received: <xmr:6jlQaGzPcsj4ncjtUKn9-Jw8KVAvfB7DJhCRoFm2o2kSJ0sD5HYwoo5pzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvieelhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvve
    fufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceo
    sghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpeegle
    ejiedthedvheeggfejveefjeejkefgveffieeujefhueeigfegueehgeeggfenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvg
    hsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheeh
    hedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
    dpnhgspghrtghpthhtohepvdegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehl
    ihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopehojhgvug
    grsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpth
    htohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohep
    sggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtoheprgdrhhhinh
    gusghorhhgsehsrghmshhunhhgrdgtohhm
X-ME-Proxy: <xmx:6jlQaCPFsKMczuI8YiGa8yh21eQXV3h7FlCTIylyMSAI2LsvNoFsSg>
    <xmx:6jlQaD8m6dXuyBqdbB80g1NwS-RJQfV9YT1mjtcgIw95GpuTz23WOA>
    <xmx:6jlQaCV_nPHMeeBAa1FWMokJ-mKq4yhDU1rQvT_ye5_GxJqsHqXbvg>
    <xmx:6jlQaEfyljgSy0sHiT0XSpGYX1R7W9VILQPoFsu6HTFqoFUxuDfPzA>
    <xmx:6jlQaBe_FaqzOSeLCP9e0piecUnTDBtz-V3B_qROrrWezxISgtxY4ObR>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jun 2025 11:36:10 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
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
	pmladek@suse.com,
	fujita.tomonori@gmail.com,
	mingo@kernel.org
Subject: [PATCH v3 2/2] rust: task: Add Rust version of might_sleep()
Date: Mon, 16 Jun 2025 08:36:04 -0700
Message-Id: <20250616153604.49418-3-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250616153604.49418-1-boqun.feng@gmail.com>
References: <20250616153604.49418-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add a helper function equivalent to the C's might_sleep(), which
serves as a debugging aid and a potential scheduling point.

Note that this function can only be used in a nonatomic context.

This will be used by Rust version of read_poll_timeout().

[boqun: Use file_from_location() to get a C string instead of changing
__might_sleep()]

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/helpers/task.c |  6 ++++++
 rust/kernel/task.rs | 22 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)

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
index 834368313088..518c42beaad1 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -400,3 +400,25 @@ fn eq(&self, other: &Kuid) -> bool {
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
+        let file = kernel::file_from_location(loc);
+
+        // SAFETY: `file.as_ptr()` is valid for reading and guaranteed to be nul-terminated.
+        unsafe { crate::bindings::__might_sleep(file.as_ptr().cast(), loc.line() as i32) }
+    }
+
+    // SAFETY: Always safe to call.
+    unsafe { crate::bindings::might_resched() }
+}
-- 
2.39.5 (Apple Git-154)

