Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E2B191499
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 19:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738180392; cv=none; b=nAlxDN78+TbmLPuLCvFvhVMdtiqcJdqAlbv37MzpHveJSbScSpmjiUu3UMNHdem/olqCMtAOdgyihc7HKYW62pveSl4/KM5bklfK7reaBwqH7B30GHsTLZTdTLij4LvB9IxjHZhLeid9EpRv31oAmb+EUCx2sltnXY/HW/d3AC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738180392; c=relaxed/simple;
	bh=wNpLHO6Ho0iQWCKLMbBlQJLflykh3AtzSgS+lNMlW8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=H2lDmXYOYEex1RCR9qLy5kHv3W8H9QJVWaigM51mwNx3oAAuU5gh6cpnlU0iKPggHN6XF30XWrKJ2Ir24IlYzxwIR7D4G8rQFtfi+VQ1KytY23r8af2dNQ+xg2psOBA+boZnzE7D9PIj/sU8r6bEuFemeIZbcLm3An3jOwcAFZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=euasFr3N; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="euasFr3N"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361d5730caso9365e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 11:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738180389; x=1738785189; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=69bY3eJoWzqDBqayYS229iYz/tosSXS8kwQKC+R29ho=;
        b=euasFr3NUqvQYNqAzZt90VC/gkXxRBRbSNCpWstrP39jsYtJukQcJiIxNtU/mn+v2A
         8chE/PRA9K/yPn6Zh3X3yUuFu57HRar00uTjWJ9vq85znR6om9CM8rox/v5eoXwKs3SW
         9PiwWIDihe2HH4y9YVkIvcM9M+uoLtDEngfo9BI3mu/s6nUcXPBMIm1SB6cFXKGl1zLD
         vz3HNJG/wZ1e0m4T2bRA0IFDj8L8jyeFzEr9NoZsRVPLMNjZ2yx7/HX6ZfajrLfIvLZm
         UtSWw/44l6eCcDw1aEt3PgW5QyO2iF7z5cE7+cRAovL+ZynVvKOB1qw0R2EyMkpUMrlu
         n3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738180389; x=1738785189;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69bY3eJoWzqDBqayYS229iYz/tosSXS8kwQKC+R29ho=;
        b=bZSYEDaXtt5hQDKz0d5gJpNGbB5mk5C7tbHRcRUCLjZ654vgX8q0xsppXN+ILy4Quz
         veac/eQmXjDigrsm7O7hqxZ1/C2NOhaGEtw4uYU2V94z8NNjyU3ybnNUYvGe5JBtuTn+
         lPJEs2nuSvkouCOB7Sms8LGP40YBZcIduzZwHHlPXUd2oeOLKtXO/Yl1QbtPCtgOoZi2
         ssXkydE5wacUjB2fkZAMKDQLd23L7P3W+0Xs96bSAvvRlEmgXQc8TWbIZybnOyeD0rwp
         nXzp8KmhxGWUyWxpXQ1FFOPppPfL58PuZzaxT5A8hzjY65vwQYy+cdsklTBZgxdIG14f
         bSfw==
X-Gm-Message-State: AOJu0YywURpcEaKqDSLPS1ez4eyybugJPaiAkbTsReRqlaeO5HzBCZK6
	Sf+yyG1kWHnUqIli/co1jbjNyWsa1a4j36rC09Xgr9Y5PzelGqojJoEXkSKP+A==
X-Gm-Gg: ASbGncugzWGTposrZAxIrQb5vbKJ58FKyQCz54V5ACKReIcno58pn+hXUHBpDQErw7s
	S1kEUwHLswrVlmqRn2ascCqOdSMEVu/IwbwFGI+/9tbZqN4AfGN0zX2PRhmrFXQ5wnB2Cs59Arj
	FA2nT5fyTcmLlusiw4IJcY0E8NJeltoLRHzuY6IGQVKCI5Ybzw62P+JOdBF2E7vyA1BTw95/Qg3
	dhn2XFoa/VtDkIWdEKnYgvWtXjDPVvb9daWb0w4Gsy7SZgHNLskELG7v50JLmEYjTvxwil2O7Yi
	vh4r
X-Google-Smtp-Source: AGHT+IGP88Z0aixfukwbUkUN0PH6Zz1sF0YG4/z9z72ukmaA7BYBGjslWf1hzNeXSWRK0JN4vsvqTw==
X-Received: by 2002:a05:600c:2295:b0:434:c967:e4b5 with SMTP id 5b1f17b1804b1-438e1bf536fmr158025e9.1.1738180389038;
        Wed, 29 Jan 2025 11:53:09 -0800 (PST)
Received: from localhost ([2a00:79e0:9d:4:524e:3286:ba64:f255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1885besm17686399f8f.49.2025.01.29.11.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 11:53:08 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Wed, 29 Jan 2025 20:53:03 +0100
Subject: [PATCH] sched: Clarify wake_up_q()'s write to task->wake_q.next
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-sched-wakeup-prettier-v1-1-2f51f5f663fa@google.com>
X-B4-Tracking: v=1; b=H4sIAB6HmmcC/x2MSwqAMBDFriKzdkAH/F5FXJT2qYOg0voD8e4Wl
 yEkDwV4RaA2ecjj1KDrEiFPE7KTWUawusgkmRRZLg0HO8HxZWYcG28e+67wbKWuSnG1A0CxjWL
 Q+/92/ft+Cr5QrmcAAAA=
X-Change-ID: 20250129-sched-wakeup-prettier-c28762d8deee
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738180384; l=1295;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=wNpLHO6Ho0iQWCKLMbBlQJLflykh3AtzSgS+lNMlW8o=;
 b=cJ9E/3jov7vnCKDj9LQZUmS93eFMMeIM7tue5IpikIhTJlef4+6YIi7gZUNfWFjONzAgXtGtV
 TTtZLv5soRSCVXtfCT5uWab/cO3xQANsQtNZhiLnorN0clww88IO2fT
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

Clarify that wake_up_q() does an atomic write to task->wake_q.next, after
which a concurrent __wake_q_add() can immediately overwrite
task->wake_q.next again.

Signed-off-by: Jann Horn <jannh@google.com>
---
a minor change; I figured we should at least be using WRITE_ONCE() here,
and I might as well change the comments a little bit while I'm touching
this
---
 kernel/sched/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 9142a0394d46605e96e10cef97cce02d741f6c93..ce64652858703826dca510479f563a28c2fb2405 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1063,9 +1063,10 @@ void wake_up_q(struct wake_q_head *head)
 		struct task_struct *task;
 
 		task = container_of(node, struct task_struct, wake_q);
-		/* Task can safely be re-inserted now: */
 		node = node->next;
-		task->wake_q.next = NULL;
+		/* pairs with cmpxchg_relaxed() in __wake_q_add() */
+		WRITE_ONCE(task->wake_q.next, NULL);
+		/* Task can safely be re-inserted now. */
 
 		/*
 		 * wake_up_process() executes a full barrier, which pairs with

---
base-commit: 05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
change-id: 20250129-sched-wakeup-prettier-c28762d8deee

-- 
Jann Horn <jannh@google.com>

