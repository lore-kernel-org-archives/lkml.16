Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2874C81
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745953132; cv=none; b=jCAiG4gEuIik2RSpnhyR9CNzd4v1KhNhZK0cFG7HM8y8Tp0OlKbqFU/pJH4m2uqww1PhjVARmSD8uUt5EtwcffsUNWyBYxuspjZNX/jFgrKi4jQSzh+Pl50F5LFXytZ6YsX13rgngAhvlANjX1GHDJuKePpSgEph9EmkmMiCrho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745953132; c=relaxed/simple;
	bh=8DWUkgowi58Q+C6KSwBRblI0nmvZQfHYlZ0o/INoJlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HcDH3pGmgl1oz/T+B0PN/7BCVc42TNchRgWdtbPlQCrFe6x9+rSsyOq564hSPwcoMMynRkbdOBfp9DceF6JfP1hcpYtkCNZQvPvTBK9i81GEpB7b0B8zzDzPkVn60S7SCre+pyJeKVQ++h6v0FsflFK9/k4tR8rGQDbhTLhYDo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=gM26QAy9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="gM26QAy9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso61124435e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1745953127; x=1746557927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mJ5gLIKdEnlHfp/ZM9aOKHXL04cwNu47lJLmXXaF2II=;
        b=gM26QAy9PFPVm0t2wYMjzl6cRHjV9vLdBez/1mkvChOBElSY8hLmeBOZFeBryMplf1
         3E61LQR9LXd/OJ+PGjeah+7n2elVhTl/B5NLh2Pfq3Kx3GaB4c9cmV1n56Moyyd5ohzq
         GuJnrOPXnJr98ci7GzaFY1cwUdIR+pmqML6fC/sbKFNWathDmCqpfW6axtX+iR5loYUa
         SS+HhnI/6Rka0V0zS3OyXOFOPDqdL+rYDa89p1hx69vopna0/fIdhpkz76KEk1z6pEJY
         zI3GmzTXngjzuKjQIuV2lK0aK47uWjXDWv5JNtVE4cpZghxFjkwu7pPfb9EF0aGpVjIh
         HyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745953127; x=1746557927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJ5gLIKdEnlHfp/ZM9aOKHXL04cwNu47lJLmXXaF2II=;
        b=oPtqWtsCE8D687eo6bfVar6Fr1Ct9jvJRHzTX96NzdASF5zkrjNWjga4f/3dmSNPSY
         GIj3Z3gJ1R6mQFXFMcGurK+7ZmnwbF4csdiB2jxNPF8/14flleE2dlMBTTU0d7zqj9Fq
         7kXO+mfUPgT0PRvL9B1MHE6gnF9KLkvRfNcj/qaxLHooCMicSHh+Vg5VBMUy/1F4Iix3
         BKF7lc7PkRwi9Nunz60XFKOdTvlvMHSJ5A9l1kfB5jHLQmjPwy/Q9WDTU5qDuO++QBmf
         CeaLFDUHOyjw2j05MsGlQvBIX9Iok/gFLUfe3DTRCVa6naPmQGx8G0LTqrp8dp5fr/Mb
         ScwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZzHlXOsqzC92uJpCtWibLK7GdrwDYZDzBQT/I9gj+Izq5KCogC6aXLiX5fRwsd5MKatzI0VxZ1NtlouU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCu0S4uneBBRpxghCfjXQf3ILiwiq8+6vYSFQ5NctzlyeerHbG
	bVwzhIalp5GJDs/RDai08Xwe5Med/t51YsMG8pdfeIutx2urs6kmFE+kJMfpJZ0=
X-Gm-Gg: ASbGnctRYWMZNszEEBPvvNHvCCcgW1UzWhimp9FxCgckQGoJAooRknqctyhOn6NZgsX
	hX6LaFRWnAbO+I8spFMnrX6JPZ3yKpCMfw9AZfidA0fQImzKy2Do9v/5H2LVxzA7ubEqJOLgmVJ
	+pitv7iF1ti/mopTmqtKkbe7yx9vbUaAc6cEPrGXH0cNw4EkwgYfpULwx5VmLifeOHWQzcD4s3W
	W73EKrD7DfcMN7uO43u2PslvffN73+aMZh3fhspp586LYsGVvDf4ictcLcfxIxCqDbWvGYfVwdu
	/e1MQtW9ZZtpO1RiBecF2O1J1xJ/dMNVt6u/Aq5XgJ1NyPNpt9ZQ02/vCarkuKxVxfRK3bevj2c
	8bpsG5JbvJ4SM0dAp6sYt3eVxQFij0uXXYCFihoAt
X-Google-Smtp-Source: AGHT+IEZMwWz0zdMJ9NDjk9O5Asf64JDL54V1y9NgXWNtSz5RkuH7RmJD1LO2QHqy0LDF2oJCsnupg==
X-Received: by 2002:a05:600c:540e:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-441b1f35c1dmr3839765e9.2.1745953127536;
        Tue, 29 Apr 2025 11:58:47 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a530a6e9sm165643035e9.16.2025.04.29.11.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:58:47 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>,
	Joe Damato <jdamato@fastly.com>,
	stable@vger.kernel.org
Subject: [PATCH] fs/eventpoll: fix endless busy loop after timeout has expired
Date: Tue, 29 Apr 2025 20:58:27 +0200
Message-ID: <20250429185827.3564438-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After commit 0a65bc27bd64 ("eventpoll: Set epoll timeout if it's in
the future"), the following program would immediately enter a busy
loop in the kernel:

```
int main() {
  int e = epoll_create1(0);
  struct epoll_event event = {.events = EPOLLIN};
  epoll_ctl(e, EPOLL_CTL_ADD, 0, &event);
  const struct timespec timeout = {.tv_nsec = 1};
  epoll_pwait2(e, &event, 1, &timeout, 0);
}
```

This happens because the given (non-zero) timeout of 1 nanosecond
usually expires before ep_poll() is entered and then
ep_schedule_timeout() returns false, but `timed_out` is never set
because the code line that sets it is skipped.  This quickly turns
into a soft lockup, RCU stalls and deadlocks, inflicting severe
headaches to the whole system.

When the timeout has expired, we don't need to schedule a hrtimer, but
we should set the `timed_out` variable.  Therefore, I suggest moving
the ep_schedule_timeout() check into the `timed_out` expression
instead of skipping it.

Fixes: 0a65bc27bd64 ("eventpoll: Set epoll timeout if it's in the future")
Cc: Joe Damato <jdamato@fastly.com>
Cc: stable@vger.kernel.org
Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/eventpoll.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index 4bc264b854c4..d4dbffdedd08 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -2111,9 +2111,10 @@ static int ep_poll(struct eventpoll *ep, struct epoll_event __user *events,
 
 		write_unlock_irq(&ep->lock);
 
-		if (!eavail && ep_schedule_timeout(to))
-			timed_out = !schedule_hrtimeout_range(to, slack,
-							      HRTIMER_MODE_ABS);
+		if (!eavail)
+			timed_out = !ep_schedule_timeout(to) ||
+				!schedule_hrtimeout_range(to, slack,
+							  HRTIMER_MODE_ABS);
 		__set_current_state(TASK_RUNNING);
 
 		/*
-- 
2.47.2

