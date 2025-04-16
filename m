Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA632223707
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744829928; cv=none; b=AIKAGgj9nSEJVnPiYhxj3Pl7UPm4cA5LChKupgFsBmBBP2bYeJfHppNrjkAJ2rWJxLRRTBacx4SL5FYtVgP0mQwIXRxQ/BcykZtKWBWQar1zDN93azd3pZz9a+Dnuqvhmy8lYKeCiFad+TvjwxvRbOh70VCKhaL0yLvuTreGyDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744829928; c=relaxed/simple;
	bh=NV2T/d30uMUYCMSEQrN+qGxUfWVBYywQA3pZxGO0KM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AFowXmXCodqK6j5mIGOoXrXvedbUfg+pgMoDhkvsfHPvic6s5h0mvquW8Nzh5uMt2T37evEeCxknc5+111DubtqFbjNPDTp9c1OGaBZi2TxtUs03HOgs9qfMyuMPioA7uzUGjG3x268wA9tTDRMNyHK6ppn1Bo5gKv+huaDkqvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=vs2cjXa8; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="vs2cjXa8"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2295d78b45cso474645ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1744829923; x=1745434723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MX73opmKqNRlFQa1u/fhWDcEoVHRwt6HMlJzJmD+odo=;
        b=vs2cjXa8xn4cjaZGH576ef8jpDwJAhcYDq/wc7ncBhW0h+oXMvsyfC9WsxCDvdPm+s
         x6dxyQChtzbfu6JQoIm2YatPZ80KQ6UMUHf76DwjblUK6KRgcowqEIDP3JgYjiqDCRDN
         o97STGofmC1QUk0ber/CV0hEDOdOVCGWJJd+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744829923; x=1745434723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MX73opmKqNRlFQa1u/fhWDcEoVHRwt6HMlJzJmD+odo=;
        b=nhNcgPzQ3+4J3p/D28Cr0/9dYjPLQg4LGtpAAxycSY+6P5cX3q3CD/y7tOCXhIg4HI
         qNeRUhFFafKNYumF34lShIVGIwbf4RMEbmIQHgspfWotFUxMBUYfWTPqYQOtY2RKbp5r
         5oEvO4rrxNyX1dDZFnRss+5SByPR9CCFn0bDm0DIwJ4Nnr1a60rH89Y9enw6oDEepjDc
         PAGXoLNmdy9+gF9DcuO140Tb1BKcm+Bi2OteIdHnk8npnUaH8s6qusjqTQD48bB9LWik
         uGeMnCC1UEbH6V/xxcLMkEunNHmyT/OHHMbm9wAWRohzUS2hhzOrg1uV7EwqchAu5/xH
         +xpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO48KKPSaPADpI9KRjU5MENcwsO2AR8MLMeBOCAYTjQ43EPOMGKTGpqx02wvAvzrMv+UfpB8f7yHxcQ0s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6WSmX4Fvr4E7BBUGvcMDqflvjUOqgyl7UCrO2vDl3wYV7A+tH
	p5URv5QjNHahPC6P9Orr3ZsHgnFhYpa5KoN+4r89Cz5UCJhj6d79eH7TkohddLw=
X-Gm-Gg: ASbGncslwTzRHuS3cl7EO1LyzEqePBHsR7YsFeill2XBuz7N496RvX2huYyGqm35uZX
	bcm4V0awYEsgg3xbVK5rOpviEDu6Dhu16ZOz+B/ah8aa9qRV4J4nrS1pPeLSmaDvgEizjQTSYRU
	1SyxSDX7rSg1A3ItiPIsiDQD/MGGuDFH2nRqjbo3Irz4aESb7tqK1ZPQXCYaYqzg0g1G7g61Q1z
	08NiS0Nfau1hniW/has7psBhqhOJpEDuYzB83uW3/g6nWU13CrTkSgyN3GY/6Vuak7L519ArMRR
	c7isRBXnEu4oSR0UXWUsCiIn+A0kKgN+WCT3X0v6POf3BSn2
X-Google-Smtp-Source: AGHT+IF+JrK09M013V8S/Bwyq8dJiFjoIV5fFBaSZEN4bgsctgbYf5KCkq1hNreYBTGPUyYHjWyOww==
X-Received: by 2002:a17:902:e94f:b0:220:cb6c:2e30 with SMTP id d9443c01a7336-22c359a39ccmr48032375ad.49.1744829922962;
        Wed, 16 Apr 2025 11:58:42 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2334468sm10746797b3a.169.2025.04.16.11.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 11:58:42 -0700 (PDT)
From: Joe Damato <jdamato@fastly.com>
To: linux-fsdevel@vger.kernel.org
Cc: jack@suse.cz,
	brauner@kernel.org,
	Joe Damato <jdamato@fastly.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Sridhar Samudrala <sridhar.samudrala@intel.com>,
	Alexander Duyck <alexander.h.duyck@intel.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH vfs/vfs.fixes v2] eventpoll: Set epoll timeout if it's in the future
Date: Wed, 16 Apr 2025 18:58:25 +0000
Message-ID: <20250416185826.26375-1-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
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

Fixes: bf3b9f6372c4 ("epoll: Add busy poll support to epoll with socket fds.")
Signed-off-by: Joe Damato <jdamato@fastly.com>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 v2: 
   - No longer an RFC and rebased on vfs/vfs.fixes
   - Added Jan's Reviewed-by
   - Added Fixes tag
   - No functional changes from the RFC

 rfcv1: https://lore.kernel.org/linux-fsdevel/20250415184346.39229-1-jdamato@fastly.com/

 fs/eventpoll.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index 100376863a44..4bc264b854c4 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -1996,6 +1996,14 @@ static int ep_try_send_events(struct eventpoll *ep,
 	return res;
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
@@ -2103,7 +2111,7 @@ static int ep_poll(struct eventpoll *ep, struct epoll_event __user *events,
 
 		write_unlock_irq(&ep->lock);
 
-		if (!eavail)
+		if (!eavail && ep_schedule_timeout(to))
 			timed_out = !schedule_hrtimeout_range(to, slack,
 							      HRTIMER_MODE_ABS);
 		__set_current_state(TASK_RUNNING);

base-commit: a681b7c17dd21d5aa0da391ceb27a2007ba970a4
-- 
2.43.0

