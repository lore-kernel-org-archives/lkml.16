Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1971023816A
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747817558; cv=none; b=nyqpnWJXi4Yd1oIxGk3PLzrzvSR4qDR1I9oVAPndNDGdkOly4fq95j047yJ6Lbzf3E0+E+t5q7aHQxhbrlCF4sgcc1lePRAA8tQLQiV1jNn3zS7WfZy9FDnHoUX5zOrzIpfGL9OuHUveKUEc3fv2kE2678YUHxBUeLcjnujiKHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747817558; c=relaxed/simple;
	bh=Z6w23Y6iX+Htod9eNEj1s53/r/s0DOCyv2cGdoxlsoI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AJeZBd3cwI1Cj1V2fbhF3D8uklTltHewe9nH2Xg7B0L5Smg9m7r3Yo9fsZjbIZWkIiXsxUULnGlBKR2YRaVyLueFjvD3QbE6sGfnBk4JFs59zrbm7NCJ+1izSvx8GztQqo31FwST2kX46FZ2qiiGiuHkxzXXC30umVo2RpRwncs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tyEaRKSO; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tyEaRKSO"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43eed325461so38719695e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747817555; x=1748422355; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7688IvtHFfD69ij1FSs0pybVArgEwND+LTvcGZpDC4Y=;
        b=tyEaRKSO3ouVPpWiW+721rawpxcI275BRy5DfvviihhyLo2vH99DoKv4r5GqlVnvvp
         jSGg0rKWqFlKkO6rb/lnZTcaudG/O5yW/8SZ3iC5pyAYbH5zmE/fFkOy8B6vL0h8gV5n
         6HrbVD9/2VoyNG2TgYLZnAjYMPI9Hz7g2b1dRV5qF5YpUtNpvgdo44tcRroSKyOnhoPJ
         Mq9qJqrTRI0rEeDEqgJQrsZXTZFzegHdTK9/ewzTblV/b2qi0EhHex7eZpEoOoNC4atr
         T+EpWjWlvtLdrPBIqPdprPChRDrnHtJ6uD5Jc2GLKjhB3VE5XIf6oq5chmifQLUQ46k/
         3DlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747817555; x=1748422355;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7688IvtHFfD69ij1FSs0pybVArgEwND+LTvcGZpDC4Y=;
        b=s5Gmz7zJY1XfBJ1e0n3Ko06oNAyNIFa2o2odUBEowCIYVHls0aIBaDLZFSkeAuc/28
         RYrMsfksPHqfNQEB3x7Nzixzqq6nstEgy3xMOERVGsXjLs5knucRPiYVCpJ3ERMdK3NG
         gArUK4SVxpcz0XG6j9Ewpe8tqBHffR3Tt33vALzJ0DC4XlPVFgTTqgU+BNaqfZK/XikT
         bMh29ZFABkFHx0RSfaDXRf9hW5TMYLhpVSwOs2x6Ksl1x0tGtwuodPr69xDcYChXm+Yc
         daqEGQY+pPAN8Vu867x34gnd6IN4n6og6mcpWUJ3zcBvhbf+eRhWyv9lvsrT4/rz6ScA
         5PVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5s1PV+k91n5zheixuawl3+4slPACg5nlBbXd3rXBF5DC3HiOcVDuUw6KQ6DtMr2ia5hwga6WOC1Nvsog=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZzvp63BTHWCu4Z3rPtOo7YUu/bkXl+temBgLfyyRsyPjxRa7r
	FVkFniOLK0bKMGN7kN5P9zG1NCT6XQPw4IYwDuF6wTLY9gIB/3weCTG5wGrphYZh7qEYpXoCbd3
	iGt+LsaQP5A==
X-Google-Smtp-Source: AGHT+IE2h7hG3T9klDifsN80rbMrvMOxDytpaySShlQZfDYypsrrpy7E3lg7ylgGHDkJ8EwN/+2oxIO+3rdN
X-Received: from wmbes14.prod.google.com ([2002:a05:600c:810e:b0:43b:c336:7b29])
 (user=dvyukov job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1785:b0:3a1:a96c:9b76
 with SMTP id ffacd0b85a97d-3a35ffd2904mr16203713f8f.38.1747817555499; Wed, 21
 May 2025 01:52:35 -0700 (PDT)
Date: Wed, 21 May 2025 10:47:48 +0200
In-Reply-To: <cover.1747817128.git.dvyukov@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1747817128.git.dvyukov@google.com>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Message-ID: <138c29bd5f5a0a22270c9384ecc721c40b7d8fbd.1747817128.git.dvyukov@google.com>
Subject: [PATCH v7 3/4] rseq: Make rseq work with protection keys
From: Dmitry Vyukov <dvyukov@google.com>
To: mathieu.desnoyers@efficios.com, peterz@infradead.org, boqun.feng@gmail.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, aruna.ramakrishna@oracle.com, 
	elver@google.com
Cc: Dmitry Vyukov <dvyukov@google.com>, "Paul E. McKenney" <paulmck@kernel.org>, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

If an application registers rseq, and ever switches to another pkey
protection (such that the rseq becomes inaccessible), then any
context switch will cause failure in __rseq_handle_notify_resume()
attempting to read/write struct rseq and/or rseq_cs. Since context
switches are asynchronous and are outside of the application control
(not part of the restricted code scope), temporarily switch to
pkey value that allows access to the 0 (default) PKEY.

Signed-off-by: Dmitry Vyukov <dvyukov@google.com>
Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
Cc: x86@kernel.org
Cc: linux-kernel@vger.kernel.org
Fixes: d7822b1e24f2 ("rseq: Introduce restartable sequences system call")

---
Changes in v7:
 - Added Mathieu's Reviewed-by

Changes in v6:
 - Added a comment to struct rseq with MPK rules

Changes in v4:
 - Added Fixes tag

Changes in v3:
 - simplify control flow to always enable access to 0 pkey

Changes in v2:
 - fixed typos and reworded the comment
---
 include/uapi/linux/rseq.h |  4 ++++
 kernel/rseq.c             | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/uapi/linux/rseq.h b/include/uapi/linux/rseq.h
index c233aae5eac90..019fd248cf749 100644
--- a/include/uapi/linux/rseq.h
+++ b/include/uapi/linux/rseq.h
@@ -58,6 +58,10 @@ struct rseq_cs {
  * contained within a single cache-line.
  *
  * A single struct rseq per thread is allowed.
+ *
+ * If struct rseq or struct rseq_cs is used with Memory Protection Keys,
+ * then the assigned pkey should either be accessible whenever these structs
+ * are registered/installed, or they should be protected with pkey 0.
  */
 struct rseq {
 	/*
diff --git a/kernel/rseq.c b/kernel/rseq.c
index b7a1ec327e811..88fc8cb789b3b 100644
--- a/kernel/rseq.c
+++ b/kernel/rseq.c
@@ -10,6 +10,7 @@
 
 #include <linux/sched.h>
 #include <linux/uaccess.h>
+#include <linux/pkeys.h>
 #include <linux/syscalls.h>
 #include <linux/rseq.h>
 #include <linux/types.h>
@@ -424,11 +425,19 @@ static int rseq_ip_fixup(struct pt_regs *regs)
 void __rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs)
 {
 	struct task_struct *t = current;
+	pkey_reg_t saved_pkey;
 	int ret, sig;
 
 	if (unlikely(t->flags & PF_EXITING))
 		return;
 
+	/*
+	 * Enable access to the default (0) pkey in case the thread has
+	 * currently disabled access to it and struct rseq/rseq_cs has
+	 * 0 pkey assigned (the only supported value for now).
+	 */
+	saved_pkey = enable_zero_pkey_val();
+
 	/*
 	 * regs is NULL if and only if the caller is in a syscall path.  Skip
 	 * fixup and leave rseq_cs as is so that rseq_sycall() will detect and
@@ -441,9 +450,11 @@ void __rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs)
 	}
 	if (unlikely(rseq_update_cpu_node_id(t)))
 		goto error;
+	write_pkey_val(saved_pkey);
 	return;
 
 error:
+	write_pkey_val(saved_pkey);
 	sig = ksig ? ksig->sig : 0;
 	force_sigsegv(sig);
 }
-- 
2.49.0.1143.g0be31eac6b-goog

