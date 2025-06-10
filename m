Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3CA21883F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749531219; cv=none; b=g7H1LKJb1Fw5rBEB1koY5hvBs9ovGc3z/IquimJ3lYEzMRbIcv7U11RBZ71TCnY/29Eygl4dNN5RlU/t9PWIys0ZIqdfhFFxRonBV2Spk3dunVdWvqdY6Yur1p/WPLxn00nJ7OQzIjoQ6lyKFrfURIOyWG7K/vaetfxCCxsC82s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749531219; c=relaxed/simple;
	bh=ntrwLd7DiChheiek1acOeN2aaBmuFDekejGtbIrfXV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nkXhtI1x/M1iR2Ac9JCoDqCcZ1cl0ZWM3JIK+ksTw3zaZtEq2mFA0HEnC5ZHE5xP1hAEUFdacCuvvP7dYAnaxSzUWr5FL2uL0nYFHWdwSheuCCSTWtD6OaiF/o6zD6gRh4tvWAy0ySVHKieWGlwZx0+2vWzkQlmZwoTO//TzmCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YNrrguQ1; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YNrrguQ1"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234c5b57557so46085435ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 21:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749531217; x=1750136017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dTwTABo1wEfKsdA0QXhxKUfxxZtjZaw9y6waPC0Ywhg=;
        b=YNrrguQ1QPnlOESJg4TE2wnfBY5nqmDBR6iN1zhKzXvX5nbC97aQAjGW4Tc/XGhbJB
         sCWhstYEuSu/R1Jjiip2sqDHsJ5E0ppTfc83CYR3VtM1mcLNZ1EFSE8OUb3Ygo4tOmLi
         P6496FA9zp9pdaIYPCf6CX3KjAnm4NVIBvwbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749531217; x=1750136017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dTwTABo1wEfKsdA0QXhxKUfxxZtjZaw9y6waPC0Ywhg=;
        b=nMTyMxkURwAebfmggZ11G0XFw6ErwNzYgAZM8An0m/zI1INfaZxuLRAEyaixsW+4ot
         McPSqTdK4g53MBbD3p0rKwq7EtZIsq/KqMhEQnCLfKJ3nIpcdZOIfkbB4kZwUSlRQZcV
         oet7w7xrXsDslcqgzKEp5LcvOirGyDiWdfIEtkFQvmYn/5vx7ryLJRsL3ABT1aTp/CYS
         IwwAYgUbxTv/S2KdyYZWBVxAauQkCGH3b1VG+7uztvEp9OOaG+Qb2NcMVMkJ3C8GaJDQ
         xTqu8FSjrHL281zwnaXisTy7taHrrEQFRrFJS89hp7hu1e5wTXcPqg0Y4kwgElKSpCF8
         dedQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe9fHkHjY59HgQYIu0W3nW+ye5bDEkw8EwZyOvwPNX1iqiWtNJEPF7w4YXek0GdEc6V+Uaq69QcqBMSKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFPFWt7tXuahrH4QMW1gUwmJaGsRu20QPKzoBnHmOqLI1x7zds
	PCyWxn7Na77ov3RhlxhS62+jymDLUThuOtdeBlhc7N32L+F2Y4PLC7d2LQySwJJhLg==
X-Gm-Gg: ASbGncsAVK+7rIGakCPUNYuoyGGW9izAfyUcUxvAEB6ssiNt1F45ajRa2a+0rL6ktdy
	NSFfcuY/PQXUjElojmU9E6EiTgXUFb1bYky9Gyy8zdsPHSLBcZRJ8rRZYwgky20LtGoWU3fNNcV
	n2xsns2Ldl35++/eY4PloTHi7p4gLkjOK3GQVq3ayjkgZToPySJhy5awVad3IUd4s9iWhhsp0BJ
	5d9pCE7v/HaZOqvnR6qaegCqTrVR7Eep7+azw60UJN0kolqSJD4KdjKy45nxfHr0vJS4jHq9t4k
	P6WwlrngAVBhcfLK8UhuRUDbiI6G9BS0tLQJia8AElYNwuthPePgI1Jf5CzNIA5ykmiow3RIe9L
	EOY7dU3BQITqlrolc13TnOAU=
X-Google-Smtp-Source: AGHT+IGeWGyPOn+cNc2ZblDjH7E+UFhg2i8jzNL9EVxXbxCLhGSVXCrWVSYqBS0Ya6OBoPOAb951Iw==
X-Received: by 2002:a17:902:db10:b0:235:91a:2c with SMTP id d9443c01a7336-23601d82d3fmr196518145ad.42.1749531217009;
        Mon, 09 Jun 2025 21:53:37 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:ca42:1883:8c66:702e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23611fde09fsm47634705ad.187.2025.06.09.21.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 21:53:36 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Tomasz Figa <tfiga@chromium.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2 1/2] sched/wait: Add wait_event_state_exclusive()
Date: Tue, 10 Jun 2025 13:52:28 +0900
Message-ID: <20250610045321.4030262-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allows exclusive waits with a custom @state.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---

v2: switched to wait_event_state_exclusive()

 include/linux/wait.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/wait.h b/include/linux/wait.h
index 327894f022cf..9ebb0d2e422a 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -968,6 +968,18 @@ extern int do_wait_intr_irq(wait_queue_head_t *, wait_queue_entry_t *);
 		      state, 0, timeout,					\
 		      __ret = schedule_timeout(__ret))
 
+#define __wait_event_state_exclusive(wq, condition, state)			\
+	___wait_event(wq, condition, state, 1, 0, schedule())
+
+#define wait_event_state_exclusive(wq, condition, state)			\
+({										\
+	int __ret = 0;								\
+	might_sleep();								\
+	if (!(condition))							\
+		__ret = __wait_event_state_exclusive(wq, condition, state);	\
+	__ret;									\
+})
+
 #define __wait_event_killable_timeout(wq_head, condition, timeout)		\
 	___wait_event(wq_head, ___wait_cond_timeout(condition),			\
 		      TASK_KILLABLE, 0, timeout,				\
-- 
2.50.0.rc1.591.g9c95f17f64-goog

