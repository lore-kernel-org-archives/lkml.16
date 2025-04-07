Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3E035962
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033625; cv=none; b=V8szjGYWJQ+7XxjRFWwp+ITgdmPJl2k+fl9KkxDwJ6SLGTzgXgRoWM6c8mmJ1gKsqHZjX6il4r8MqkbpcmaNq9O891wogrA1B2bnnvwlf+uhtDo61DCtNikVeC/IqV2GOPaEfBuzxG86RxNp8Nv84Pvr8jmLiKuliSwM0xrJls0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033625; c=relaxed/simple;
	bh=pAkYNvMqS8fJ5dQrK5i7yQzJYe2HcRLPedTQphpp+oY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gA0PfdM7s2xDnmSrYdnl96Gv8MhVhf4LJl3f0R3aR4Tp4k2mRelS4arKsVOJtp9wUyYxVJ1xTVe7NSXIWkqGn0fRWXYBEpBiouNA0wjAlOqRVl9BsN0qhq5dGmYTrpiAfnCX1fVsEEmwDvAUIWzW9pK6J9EcApKNNXcfus41JA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8BtJADi; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8BtJADi"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso4432243b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 06:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744033623; x=1744638423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mTDE/yeK1SnACLA/vidAg6kwbYxIqcsn7vpXQLvJLss=;
        b=c8BtJADiN7N+5+FU9Uj7XHcYq0tMOhPwUJbgE6y7xO+dV8HR27uzk8yZ+ZLL+hRf0j
         3wV9sbdxmv5do7UvDb6cEO0a1DS4z8CEbRJuyMsTCDqgUNb0Kug9DGwKN4TTQ8eCBDnv
         L7Eo2ghV0icrUMPH4svWa30FChYsYM4SHLT+mCAW4Ck4vxpRmh3Z50JRi6bPUwU2xtmq
         uMEGuyZVo1VTDUjslcXZnQV4WsRJa1xAW91FXCjCHodcz5BXYHH4vwGhd/swNs7Iujwi
         Kn6rmCWMKOPC1wrHBefKNUZyP8NPqMoIqLWJhPDDU26PopVW/VxjMlqvQaOpKxBZtfPw
         3GvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744033623; x=1744638423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTDE/yeK1SnACLA/vidAg6kwbYxIqcsn7vpXQLvJLss=;
        b=OWhFkxEzVTIQltKDshdgEiUXvhptiNxj2NmrAPt94jLQ9Zgt+7dO7PE12Pm+nhxUYW
         zy7zZV/DYad++XxhvOtIH/xHbWqT7170NffADkVvo06Hy4JuATeWVBeZCdR7nGG4aABh
         eZX83eBaxJVTlb/utgfQZGzF3Jxm3K4e0P0Jf7Wpe80/y4Hl9CB36jhQJMvIWT7FZ9vz
         Us3Zxn1bLuqDygRW44PvdQNRc95KUP7gwsYVoiJu5GfvJHbgVpKBHj32GPvaGD5TWt6h
         uFQoXJPMdCDh9pcSP/B95GXJhnqEsTtm0rd3GqO3vDgZkkbrU5SSHtL/Wm7tRRf7LoMA
         9zGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW5s5IoEbKtj9oCh09PaKhi7hsaTkdMo7ZJbRdBXsCMIuGUQuln5x6udNXJmnwk7IvYx61EGlqUy5I9uE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0kcEXf+NijpW/b9yrsq+frD2zUrtJtw/HaBQcRqDVINEvsSEv
	sjwcClLSSDlYBfud6rJkyiWdAJGF1u/sUxsDvjUplaARsitpiLva
X-Gm-Gg: ASbGncvvga0TBXKI9HkVDAVR9cC10W9D8yPnS7hkrgUxKyN7JZUpWAwMGA+EB88UODk
	eWqoHMopotjXr6npTcO5fal2J87Acsx83W6VTfDFKCClcq/OqB/ZLS9MEruN+tIKSI9oCZahOBn
	Ra2aLaP/tcqETjv3G+lpWVZdUihhp4y5M6pXB1KvqWP+j2Th1jPaUudpb++S4+1pLPWI6UYaaYc
	Kl5kzErnBgPVvOFpJrMZx3NRZY++h/JXVY+cG19mdA4mM0ZEnU4thoRWqQVtP5r/0R9QTF99e6h
	8x3lgiu6TOPwG/sSB7SJq49gvK6wKRxsE3VB8DkBfEBP7k8nhgjg/xNk9STaZbGwSukqV28a
X-Google-Smtp-Source: AGHT+IGGH3bgtSM9CYU8MXHM50HQPZ2vzFujBzw6Wz/WrCQOl8JavRMCL9esAIAU8ZzWHfX43RZeNw==
X-Received: by 2002:a05:6a20:d50b:b0:1f5:79c4:5da2 with SMTP id adf61e73a8af0-201047368bbmr22762005637.31.1744033623304;
        Mon, 07 Apr 2025 06:47:03 -0700 (PDT)
Received: from localhost.localdomain ([202.43.239.100])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc35137csm7187016a12.44.2025.04.07.06.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:47:02 -0700 (PDT)
From: hupu <hupu.gm@gmail.com>
To: jstultz@google.com,
	linux-kernel@vger.kernel.org
Cc: juri.lelli@redhat.com,
	peterz@infradead.org,
	vschneid@redhat.com,
	mingo@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	hupu@transsion.com,
	hupu <hupu.gm@gmail.com>
Subject: [RFC 1/1] sched: Remove unreliable wake_cpu check in proxy_needs_return
Date: Mon,  7 Apr 2025 21:46:54 +0800
Message-ID: <20250407134654.92841-1-hupu.gm@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The (p->wake_cpu != cpu_of(rq)) check in proxy_needs_return() is unsafe
during early wakeup phase. When called via ttwu_runnable() path:

|-- try_to_wake_up
    |-- ttwu_runnable
        |-- proxy_needs_return    //we are here
    |-- select_task_rq
    |-- set_task_cpu              //set p->wake_cpu here
    |-- ttwu_queue

The p->wake_cpu at this point reflects the CPU where donor last ran before
blocking, not the target migration CPU. During blocking period:
1. CPU affinity may have been changed by other threads
2. Proxy migrations might have altered the effective wake_cpu
3. set_task_cpu() hasn't updated wake_cpu yet in this code path

This makes the wake_cpu vs current CPU comparison meaningless and potentially
dangerous. Rely on find_proxy_task()'s later migration logic to handle CPU
placement based on up-to-date affinity and scheduler state.

Signed-off-by: hupu <hupu.gm@gmail.com>
---
 kernel/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 3c4ef4c71cfd..ca4ca739eb85 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4047,7 +4047,7 @@ static inline bool proxy_needs_return(struct rq *rq, struct task_struct *p)
 
 	raw_spin_lock(&p->blocked_lock);
 	if (__get_task_blocked_on(p) && p->blocked_on_state & BO_NEEDS_RETURN) {
-		if (!task_current(rq, p) && (p->wake_cpu != cpu_of(rq))) {
+		if (!task_current(rq, p)) {
 			if (task_current_donor(rq, p)) {
 				put_prev_task(rq, p);
 				rq_set_donor(rq, rq->idle);
-- 
2.47.0

