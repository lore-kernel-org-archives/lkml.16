Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4456229B0D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742636; cv=none; b=hAWXQ0jM29DVSj1rx32zKoOjfQx8h+F1eIxw667jMAbJhONK0USrKJ7CWSUlXF+WZQTB1dsYEzW7NqIBO4JxN+1Cii4C6nfYd0hOnB9YDJvzCGAmz9lZCKgeENywmxqtQ/Z9cQKom87bszaI/mrQTHX9M/fuVHPWiAcwFgK8xG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742636; c=relaxed/simple;
	bh=FVYnVUDMduA4Y8+sKVZj3RGNbZ8ksVKV5ShMVrm8jcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HowLNJMGqwomyDhBUA6lrX8G8FjZIsT12t9roHliLrueUbBEZe/8WIpGLz75PEHCOTBcV4OWFee+0n0XF2YbcaX1mxP+gx7rBZV6iFwAjRb6QpmgWmNHgnkoAkEO5qgfrbtNvHoybkzVntsISRRaQ7ce2ZrdtH5OEcmGzCXouzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=gIOj1guQ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="gIOj1guQ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2279915e06eso63889495ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1744742634; x=1745347434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7yEbMyZv/VL8HuDPq8WSsMMbhN4eHIf/sv4WTg+itVg=;
        b=gIOj1guQSpWIw58v3LFxcj9Ut70ynZTuTs1kafGct+gd4/LMPiw8hEntbUnJdB5OGV
         UNk7pwYpqD4hluRMfHOWWb4hbZ4cPQN56C6bHDSYwh9HsT7BvyYx4F894wP/cTId0xxa
         KePfUlU4oEmq5hUW46bSLtD+TAjLinH8AIdFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742634; x=1745347434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7yEbMyZv/VL8HuDPq8WSsMMbhN4eHIf/sv4WTg+itVg=;
        b=GkJb0HU4oXuW5/fojKQCsYbqG5gn6fVbhPTiFunHGSbDv2f4DP6Ik+hKIB1HjwWfK+
         siuB5LEu5jh3OhLfwhE6Q4hNWo19dO1z2GhX3eoGmXmCAvptrLpA+oA8GEmY0cuBxcQz
         5d+0KoQTHYgX9dFjYDRPuqO6PpK5t6ZWmHYaxqrjqt6a5puRwS2NUv0umo9EjMpZxPQR
         ZySNTEOlAWTavZ+J1s+DMkCRjSwusEN0rxlBu5aKEdZKTCJLTxr2PV5R168kyEhWulys
         OpYykCp/2RYhEZYbKUzX02bi9m5bjEv9y5VyzNw6YUEp64VWW0XVe3hIQgTv1oCtVQAd
         2MWw==
X-Forwarded-Encrypted: i=1; AJvYcCWSRih1hNneD8DlmBUzaIO8dobrzH2F021Q9CVCudHIUNqLn8dckbkvFtO2sWYfrNhyta8gQXjSXLy4X4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtvCh2jTZcWDi1GZHrIUtFaa53WnI4bWdl4AUxktGpk+V8ooWc
	oxF13MyFflD1/35vuoFlYhfegNSJkwOa7k+ku7EGsRneyGQN1bfMX6Mnd7VRjir6rhRyrhhOgy+
	a
X-Gm-Gg: ASbGncvfSQZzl0NzGp0fgYkKn2rzYZr6WuR+oQhXaRzqbpiae+WDzmLaSU7WoEE/fTV
	l9H+jm7EceyM7PqumIrI7oiEav9ME/Ku46WEzkUqhrORTpZUDBkqgv+bgObwyKIRhFcvhxsFcKC
	AO0OCkKJHVI1ZSgSEkOs24Lre01kzUucMfh0PWUX4ietJ1gk9H5Gg0TQ9ihooOkJieLu2Darh7j
	I2vxx/868gc2/oqn4FiqepCEkG9DvdiTGMC/5G7iOHAYkz9tRgdz8WkZarJNqhTBQk2JlpGfngd
	xL+Ej/Eb8+hCedQ8q6nUUTHbknCt1eS2eNnYHsXuTeKyW0hB
X-Google-Smtp-Source: AGHT+IFlyEEe10M3tiQQK/gnDe7kylydZtYnd+4UaSFlfTlsOBCdMQpC1N9f811S6WJxSBwGGBLNlg==
X-Received: by 2002:a17:902:ec89:b0:224:1074:6393 with SMTP id d9443c01a7336-22c31ada368mr2900575ad.43.1744742633927;
        Tue, 15 Apr 2025 11:43:53 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb7b5sm120514455ad.237.2025.04.15.11.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:43:53 -0700 (PDT)
From: Joe Damato <jdamato@fastly.com>
To: linux-fsdevel@vger.kernel.org
Cc: Joe Damato <jdamato@fastly.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC vfs/for-next 1/1] eventpoll: Set epoll timeout if it's in the future
Date: Tue, 15 Apr 2025 18:43:46 +0000
Message-ID: <20250415184346.39229-2-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415184346.39229-1-jdamato@fastly.com>
References: <20250415184346.39229-1-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid an edge case where epoll_wait arms a timer and calls schedule()
even if the timer will expire immediately.

For example: if the user has specified an epoll busy poll usecs which is
equal or larger than the epoll_wait/epoll_pwait2 timeout, it is
unnecessary to call schedule_hrtimeout_range; the busy poll usecs have
consumed the entire timeout duration so it is unnecessary to induce
scheduling latency by calling schedule() (via schedule_hrtimeout_range).

This can be measured using a simple bpftrace script:

tracepoint:sched:sched_switch
/ args->prev_pid == $1 /
{
  print(kstack());
  print(ustack());
}

Before this patch is applied:

  Testing an epoll_wait app with busy poll usecs set to 1000, and
  epoll_wait timeout set to 1ms using the script above shows:

     __traceiter_sched_switch+69
     __schedule+1495
     schedule+32
     schedule_hrtimeout_range+159
     do_epoll_wait+1424
     __x64_sys_epoll_wait+97
     do_syscall_64+95
     entry_SYSCALL_64_after_hwframe+118

     epoll_wait+82

  Which is unexpected; the busy poll usecs should have consumed the
  entire timeout and there should be no reason to arm a timer.

After this patch is applied: the same test scenario does not generate a
call to schedule() in the above edge case. If the busy poll usecs are
reduced (for example usecs: 100, epoll_wait timeout 1ms) the timer is
armed as expected.

Signed-off-by: Joe Damato <jdamato@fastly.com>
---
 fs/eventpoll.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index f9898e60dd8b..ca0c7e843da7 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -1980,6 +1980,14 @@ static int ep_autoremove_wake_function(struct wait_queue_entry *wq_entry,
 	return ret;
 }
 
+static int ep_schedule_timeout(ktime_t *to)
+{
+	if (to)
+		return ktime_after(*to, ktime_get());
+	else
+		return 1;
+}
+
 /**
  * ep_poll - Retrieves ready events, and delivers them to the caller-supplied
  *           event buffer.
@@ -2095,7 +2103,7 @@ static int ep_poll(struct eventpoll *ep, struct epoll_event __user *events,
 
 		write_unlock_irq(&ep->lock);
 
-		if (!eavail)
+		if (!eavail && ep_schedule_timeout(to))
 			timed_out = !schedule_hrtimeout_range(to, slack,
 							      HRTIMER_MODE_ABS);
 		__set_current_state(TASK_RUNNING);
-- 
2.43.0

