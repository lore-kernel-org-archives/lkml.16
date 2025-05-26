Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E431474CC
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 16:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748275777; cv=none; b=ahlGz3ScFuADOLJSqzXxDu93Iq/3hvFbEZn6XYWNSSC2Lmr3MwEdvbACjahx6KRK5hJjX1TF6dVPsTYWjwY7xiQAXa8caiQtPAu/v84N8DwG3sc7etSMK3jIjXfZIk6nixoEjgNmZo4GjOpdV06eR1x0kyJvCDJ/zyZal9Xotss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748275777; c=relaxed/simple;
	bh=O7gwoSwLwrYbofmq2nMcMcYP2vlGWdWA/IukGP7dCpw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ld0mf1DrK60iHl0mJKOPiPDnVF6FEvKcUIAuz7QP0Lm0Anr/dgWgtLXi7k8TR9xWiu+6Y+rCehHF2h4EHBWWXnkj5PegkMpBcTipBbOPDN7f2OslMvLG2r7WS4qvmxLvk8uxuzDy8gCMhtUwSImt6xqpMDqgTlrzhVr+XWj8jGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZ0IgCa6; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZ0IgCa6"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-234477e3765so10071245ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748275775; x=1748880575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GaK97i1hckM+p++FUYHPcvRcogoa1z6MqyKl4267mk4=;
        b=ZZ0IgCa6KIoNw19ZI5ggRKbquZURFqP3r2OUaTsrhJAlxCUvxi1/7jkB8Ihv929iQl
         wfXu0LgdYryUi/CbYj1eiALlvyBR1PYpup/Vq5eO72NJ4l75G0igiB+DInhzhrS0JDQT
         5KgS+6XlhdXpsU9ngRw2yYpU4kxWshHbRNhR7SjTcLjohqBfpiQc+s+hLt5QUMDJYN/X
         YAhSa4fGW4R77s3pYZlnXt7sG/ZXHjebQCPAsMteivf0WfivJVk7C9HYfmRxuqrJzbym
         Y6AFchgiUExD9NReE8cAq5B4o3jkn1IdOx4CYEFGbtO8bCxtpZMnlZRZH0fvopyzdfI8
         Y0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748275775; x=1748880575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaK97i1hckM+p++FUYHPcvRcogoa1z6MqyKl4267mk4=;
        b=Lmw/aaMf2G13jJeu5VknQI7rzH0o/eRyxW3bSmuTQl4vA3aUsV7273Go1ZFiyGfJVo
         1FFTd/EiQ8yGw8L5Gba8safgXHvYKt4QQZZg6HXIvm3B667rYagPgdkvkn3OjgM+QDEa
         cMuHIT9vToxdy/ImVrYifJE8dZ4FABsuQ1OLh3rUD/5kHBYcqU6f9ZYXAbg654YZ3huk
         4rSeR3B4OV5WKmAAZ5rcZKOBt5PXmaMjkO8GD6HnMll+ZkZpli1mcLuLnuZ7WPC6r+pG
         MRUiO6LMld7bLi9OERzSuK41UiWb4IxAqMFbjgLtoxyEXiWjF1/fRsWRFWEkX7ajQoW0
         r36A==
X-Forwarded-Encrypted: i=1; AJvYcCWh2YgBE27lQP2B8/AAnvU1ehbPPuP+FJZiwsuAAEXZ1RQH84NVzv31OMryeJCpL1CBKmSnKbcrmb4AU6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAF0aLK+hVA/5TtF4O2rh/lyK2R48KX5+vWH9DZKLSzVfvq4uv
	8Vzan/fXO7eV5zY1VbC4e0dp3XJAvnlZGHaGp4thwpTUOhJ1Qxboq788
X-Gm-Gg: ASbGnctmp46UyRJFny8W9mmClpzqnCAq+rmg3j6SONICbzl3Vclu+3P+ZJUy1Ifvwyg
	ackrtJZXD5lFIrOM4qV747R2wFU56w86ScYIPKMlupkFs5W/5JTJBIj1psyS6E8mOf2HvSPRLsg
	sOlDxW7huI3N8wqbu2rjM/4s2P044mOndylz6JuuOM3vzcCDjtpyVq1id6S6LKRnJvFzwzW5lGi
	u6x/k2gIWd736cHjF3Hg6nooWCUbU2r49RmTr6QbXItfvmqf9jswZ8avTFxC7K3fWBjG+ddRMkj
	G0DtvmkaaYQXIRGOVpbhabBPhEiBL35o8GqINqkaMzzg8+zqX7yQlunKfweVHelukTZjOOiO30O
	Lzceks0E1
X-Google-Smtp-Source: AGHT+IFq+30P3nuTMIXrgPQIxeLjYe0Xtv7YuAft3zd9xq4wH6Z7ua1BeI8YL4YdNBGr8PTTqfSKxw==
X-Received: by 2002:a17:903:1249:b0:233:fdc6:3ce1 with SMTP id d9443c01a7336-23414f84e15mr135035035ad.27.1748275774688;
        Mon, 26 May 2025 09:09:34 -0700 (PDT)
Received: from CHINAMI-1168E6D.localdomain ([42.89.86.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23401ab6c69sm51708125ad.67.2025.05.26.09.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 09:09:34 -0700 (PDT)
From: Jony Lynn <1198715581lxf@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Cc: Jony Lynn <1198715581lxf@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] sched/smp: Fix redefinition of flush_smp_call_function_queue()
Date: Tue, 27 May 2025 00:08:42 +0800
Message-ID: <20250526160842.567434-1-1198715581lxf@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header file kernel/sched/smp.h currently defines
flush_smp_call_function_queue() unconditionally in the #else branch,
but lacks appropriate header guards, which causes multiple inclusion
and a redefinition error during compilation.

This patch adds a proper header guard to prevent multiple inclusion of
kernel/sched/smp.h and thus avoid the redefinition of
flush_smp_call_function_queue() when included multiple times in
different compilation units.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505262213.QsOaQU24-lkp@intel.com/

Signed-off-by: Jony Lynn <1198715581lxf@gmail.com>
---
 kernel/sched/smp.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/sched/smp.h b/kernel/sched/smp.h
index 21ac44428bb0..8f1483b79e60 100644
--- a/kernel/sched/smp.h
+++ b/kernel/sched/smp.h
@@ -4,6 +4,9 @@
  * and other internal parts of the core kernel:
  */
 
+#ifndef _KERNEL_SCHED_SMP_H
+#define _KERNEL_SCHED_SMP_H
+
 extern void sched_ttwu_pending(void *arg);
 
 extern bool call_function_single_prep_ipi(int cpu);
@@ -13,3 +16,5 @@ extern void flush_smp_call_function_queue(void);
 #else
 static inline void flush_smp_call_function_queue(void) { }
 #endif
+
+#endif
-- 
2.43.0

