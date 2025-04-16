Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF9D237194
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744794369; cv=none; b=dRdITUuDFcfETnl4aJvZkAauOCyrBqr18lJdLx0f9LjdSS32HdW2bpwpYmnyF97zgSyodw4AxLABSp6OSoi0/kDwHRtELEVUce9vyibYF0FeCbJ3UnuFbCywaNiDquQMfGUHPWU/B/oALT3iwDCzekF2LJfLnmV51DrRT1hMZCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744794369; c=relaxed/simple;
	bh=9B5JzTJnRURRtgera9TkmNPYzdsGr4dVs3IXiFL/m50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iwCc4YDyiusyj2v2s//xW274u11YUdQhRKtB8BoNg5B8KG09Ykzzn6Y965LrEtvAYHSN1ts8rieFaPiC8p63R1GHLKcDq9PXhS5iSOepJPhDhRO2rtXcDBi4DQGxDnkFtMjHvsxxht3jQ1AsKieah4AWyzqOB1DjHA2ffSagDPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sMz6psoz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sMz6psoz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82F8C4CEE2;
	Wed, 16 Apr 2025 09:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744794369;
	bh=9B5JzTJnRURRtgera9TkmNPYzdsGr4dVs3IXiFL/m50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sMz6psozFOGAfcM3y/Ke+PbPMjPmjrnT6hwQofkxpyckeSSG51goZOCUmor+fL1om
	 +M0/pnpmBo0sWbHep6of/bncFPJLO6LpQgcBz8yqkCE08ZeCsLowYWAxYDq5jUiHhj
	 nbz7vGBN4RgPBPO5CA4SBGkIPp+ILAPu/XV8aS71yFU0bgTZ5QWoQfFrz2CsQGsbwr
	 oDWFGmjIADgswpKFXAGicGwktk4JqGOQuMv0rHH6fhzQkjm73OHCFjlZ5RvFMwo4B5
	 oPpI448VX0JqP8NKX6t1n/gAdVjOF5QoybcM0PV7xoelnfFlN+oD+18YAbNn7mXDcl
	 ekbFTOfMqLUvg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 08/10] treewide, timers: Rename __init_timer_on_stack() => __timer_init_on_stack()
Date: Wed, 16 Apr 2025 11:05:42 +0200
Message-ID: <20250416090544.3311613-9-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250416090544.3311613-1-mingo@kernel.org>
References: <20250416090544.3311613-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move this API to the canonical __timer_*() namespace.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 include/linux/timer.h     | 6 +++---
 include/linux/workqueue.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/timer.h b/include/linux/timer.h
index 5fcfeecfbcb2..fedd9f3d5dbc 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -94,7 +94,7 @@ static inline void timer_init_key_on_stack(struct timer_list *timer,
 		timer_init_key((_timer), (_fn), (_flags), #_timer, &__key);\
 	} while (0)
 
-#define __init_timer_on_stack(_timer, _fn, _flags)			\
+#define __timer_init_on_stack(_timer, _fn, _flags)			\
 	do {								\
 		static struct lock_class_key __key;			\
 		timer_init_key_on_stack((_timer), (_fn), (_flags),	\
@@ -103,7 +103,7 @@ static inline void timer_init_key_on_stack(struct timer_list *timer,
 #else
 #define __timer_init(_timer, _fn, _flags)				\
 	timer_init_key((_timer), (_fn), (_flags), NULL, NULL)
-#define __init_timer_on_stack(_timer, _fn, _flags)			\
+#define __timer_init_on_stack(_timer, _fn, _flags)			\
 	timer_init_key_on_stack((_timer), (_fn), (_flags), NULL, NULL)
 #endif
 
@@ -121,7 +121,7 @@ static inline void timer_init_key_on_stack(struct timer_list *timer,
 	__timer_init((timer), (callback), (flags))
 
 #define timer_setup_on_stack(timer, callback, flags)		\
-	__init_timer_on_stack((timer), (callback), (flags))
+	__timer_init_on_stack((timer), (callback), (flags))
 
 #ifdef CONFIG_DEBUG_OBJECTS_TIMERS
 extern void timer_destroy_on_stack(struct timer_list *timer);
diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index 985f69f8fb99..c84da78878d9 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -324,7 +324,7 @@ static inline unsigned int work_static(struct work_struct *work) { return 0; }
 #define __INIT_DELAYED_WORK_ONSTACK(_work, _func, _tflags)		\
 	do {								\
 		INIT_WORK_ONSTACK(&(_work)->work, (_func));		\
-		__init_timer_on_stack(&(_work)->timer,			\
+		__timer_init_on_stack(&(_work)->timer,			\
 				      delayed_work_timer_fn,		\
 				      (_tflags) | TIMER_IRQSAFE);	\
 	} while (0)
-- 
2.45.2

