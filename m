Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6824838B
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 00:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739146763; cv=none; b=W6BhNvhncfCm8VO1M+M0pkuWTI7xdyvA7bLulyPjlVOJPQl51L2LrtMGjUwvvUZHMxaZhCcjmNA/zD34HUyzK1c/E+dvjTDBaCq9cwY8jB0JRzBlLIY53n7v4UsfOgyC3xm5gFiOwPGFv1oYYsT/o03QTuX7993pJLOmtm4XnC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739146763; c=relaxed/simple;
	bh=vVQYZICLQa35cvMvtn5KGWQ2z4EYkeoAvyb48R4njI4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aFNaQUfF0vhowx0H7KFqoMjsjtKmazAaoAYqdEpL7r7dewktnThkaPPiRemDZEh2uFDFmWlgzNrtZAo076eJawmfh2M9TXz3Gl60URBJNyb1XQ2LSuXjICgvQsp5Zt+arCnGDArS2zRIfUZkUF4bypzPY5KUftst/TeO87Ts/kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io; spf=pass smtp.mailfrom=layalina.io; dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b=AXPgvWFe; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b="AXPgvWFe"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38dd011ff8bso1729325f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 16:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20230601.gappssmtp.com; s=20230601; t=1739146759; x=1739751559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mkJd+wZLlgLkGtTcq6zWa+FEi8obTrSXzaXr13YJz9k=;
        b=AXPgvWFeA+XA6UvsYhZ7Z8wkw9QIqJKruaoxqFW6o0AkITFLi8KWE8aUCNkudQpHoO
         uyQwU7648bC+Y26Rf43EiW9rOZxKaExhAxtpDGXz3v/IF1d9s5yNVg9iNoABegAotERu
         GswAq1q5S9ByYqGAsbtKJ1MPNvG/6w7sHRZpoyROF0d9opunX8lEE9w9XIqF6E2chTtq
         oyX/6tsw9498LufT+2SRnv6c7QwFEM8j8v793rOc2/vIAHxMZwgETgYwAFolwfLmXafs
         fkUBWm1E606jrVCO5qvxTUlw9G05NFMW9w5Wb7hOsGy6PBHNxy+HQvsa62r1vcymcbJv
         J//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739146759; x=1739751559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mkJd+wZLlgLkGtTcq6zWa+FEi8obTrSXzaXr13YJz9k=;
        b=qz3RPZVV47jB7xNHQdlSNp4HZjuPF65ImkXOAbYX3JWIDG3mh79WtZzsF23NukMCDR
         nwt+lappmrzY2hfMq/tYJFpThmezDKtx4NHXq4bSOVT0LRDRxwqh+ca8H12Reu0yuiHl
         +Egd4UhHtXdj0yaux3x3VkDQldFinLw6CvqQ2qGsFMpg21pjdK9cgAi2u1sg8B76IcOy
         tgJ/ESY6D7JP4qNo3uDlvNmRqWLU51WyVdqJ46qc0/L59gHRLCg10TBH8+oZkjD6g8R/
         0JMCqAlZWR2IV5cnPU83BKnhGWIoa8MrFFlRFfNMya3ub8S1ldLwInh0GxCw/BPZrrk9
         NQqg==
X-Forwarded-Encrypted: i=1; AJvYcCVsqQDHJVI6v6MsD8X+CQaQBkbK3G5tKBi/K7RO8r51YrjYzVBrTUgg8kB5LJPIV89O6k2mz5wgEfkBVsA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0xngWKVHJx62t+AVj7z6H8IND0J8/iHI7HWUkUhYruJ9j8yIN
	MVDw7K6kEpaYCCcwXw/A6+jYI+Z92K4+E7vEOP8iI8I7dg8ThlUCwqQIVGxAuwE=
X-Gm-Gg: ASbGncu84BiHVv7BA6yorriJgR2nFx9uFcwcmXM0deQHqDCRdteK6m+UuYB7U91VES0
	YfqLaoNgLZOxTmYrlcPd1M4EuIj3ku+VqE/aeySB8e4RnQIS3nWEk+usI+JfP2AukIuYmtH+RD4
	DIfcQxj95LCqKGKCpP4KLih7CvNfL8v5k4DWn2h1gJPz7TCddDMpXczMQbyiSirKBxbFoGlVe6A
	hg8QHL/crTvKjTMVZbYSwBMbGEgETKqGAYteifYPd9TUb2lnOAXUTxqWOkzsNiAf1hh+1e+cxS/
	MBNOmhkH0QqlGTmTLlPVH2EKUboix4vRcE1ztG/UCLPeyornrcadzJ6Rdy28yCqNqRou40w=
X-Google-Smtp-Source: AGHT+IHiHFxE+BpNdO7vTA3eZy0QqfZVIt2fTaFHGwKOsec5FhnbtFFo2sqg20Uw77A1ezKNYxCyIA==
X-Received: by 2002:a5d:5f83:0:b0:38d:b448:8ffc with SMTP id ffacd0b85a97d-38dc90eec01mr7890143f8f.27.1739146759601;
        Sun, 09 Feb 2025 16:19:19 -0800 (PST)
Received: from airbuntu.. (host109-154-33-115.range109-154.btcentralplus.com. [109.154.33.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc98844f6sm8260327f8f.42.2025.02.09.16.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 16:19:19 -0800 (PST)
From: Qais Yousef <qyousef@layalina.io>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>,
	Saravana Kannan <saravanak@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-kernel@vger.kernel.org,
	Qais Yousef <qyousef@layalina.io>
Subject: [PATCH] Kconfig.hz: Change default HZ to 1000
Date: Mon, 10 Feb 2025 00:19:15 +0000
Message-Id: <20250210001915.123424-1-qyousef@layalina.io>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The frequency at which TICK happens is very important from scheduler
perspective. There's a responsiveness trade-of that for interactive
systems the current default is set too low.

Having a slow TICK frequency can lead to the following shortcomings in
scheduler decisions:

1. Imprecise time slice
-----------------------

Preemption checks occur when a new task wakes up, on return from
interrupt or at TICK. If we have N tasks running on the same CPU then as
a worst case scenario these tasks will time slice every TICK regardless
of their actual slice size.

By default base_slice ends up being 3ms on many systems. But due to TICK
being 4ms by default, tasks will end up slicing every 4ms instead in
busy scenarios.  It also makes the effectiveness of reducing the
base_slice to a lower value like 2ms or 1ms pointless. It will allow new
waking tasks to preempt sooner.  But it will prevent timely cycling of
tasks in busy scenarios. Which is an important and frequent scenario.

2. Delayed load_balance()
-------------------------

Scheduler task placement decision at wake up can easily become stale as
more tasks wake up. load_balance() is the correction point to ensure the
system is loaded optimally. And in the case of HMP systems tasks are
migrated to a bigger CPU to meet their compute demand.

Newidle balance can help alleviate the problem. But the worst case
scenario is for the TICK to trigger the load_balance().

3. Delayed stats update
-----------------------

And subsequently delayed cpufreq updates and misfit detection (the need
to move a task from little CPU to a big CPU in HMP systems).

When a task is busy then as a worst case scenario the util signal will
update every TICK. Since util signal is the main driver for our
preferred governor - schedutil - and what drives EAS to decide if
a task fits a CPU or needs to migrate to a bigger CPU, these delays can
be detrimental to system responsiveness.

------------------------------------------------------------------------

Note that the worst case scenario is an important and defining
characteristic for interactive systems. It's all about the P90 and P95.
Responsiveness IMHO is no longer a characteristic of a desktop system.
Modern hardware and workloads are interactive generally and need better
latencies. To my knowledge even servers run mixed workloads and serve
a lot of users interactively.

On Android and Desktop systems etc 120Hz is a common screen
configuration. This gives tasks 8ms deadline to do their work. 4ms is
half this time which makes the burden on making very correct decision at
wake up stressed more than necessary. And it makes utilizing the system
effectively to maintain best perf/watt harder. As an example [1] tries
to fix our definition of DVFS headroom to be a function of TICK as it
defines our worst case scenario of updating stats. The larger TICK means
we have to be overly aggressive in going into higher frequencies if we
want to ensure perf is not impacted. But if the task didn't consume all
of its slice, we lost an opportunity to use a lower frequency and save
power. Lower TICK value allows us to be smarter about our resource
allocation to balance perf and power.

Generally workloads working with ever smaller deadlines is not unique to
UI pipeline. Everything is expected to finish work sooner and be more
responsive.

I believe HZ_250 was the default as a trade-off for battery power
devices that might not be happy with frequent TICKS potentially draining
the battery unnecessarily. But to my understanding the current state of
NOHZ should be good enough to alleviate these concerns. And recent
addition of RCU_LAZY further helps with keeping TICK quite in idle
scenarios.

As pointed out to me by Saravana though, the longer TICK did indirectly
help with timer coalescing which means it could hide issues with
drivers/tasks asking for frequent timers preventing entry to deeper idle
states (4ms is a high value to allow entry to deeper idle state for many
systems). But one can argue this is a problem with these drivers/tasks.
And if the coalescing behavior is desired we can make it intentional
rather than accidental.

The faster TICK might still result in higher power, but not due to TICK
activities. The system is more responsive (as intended) and it is
expected the residencies in higher freqs would be higher as they were
accidentally being stuck at lower freqs. The series in [1] attempts to
improve scheduler handling of responsiveness and give users/apps a way
to better provide their needs, including opting out of getting adequate
response (rampup_multiplier being 0 in the mentioned series).

Since the default behavior might end up on many unwary users, ensure it
matches what modern systems and workloads expect given that our NOHZ has
moved a long way to keep TICKS tamed in idle scenarios.

[1] https://lore.kernel.org/lkml/20240820163512.1096301-6-qyousef@layalina.io/

Signed-off-by: Qais Yousef <qyousef@layalina.io>
---
 kernel/Kconfig.hz | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/Kconfig.hz b/kernel/Kconfig.hz
index 38ef6d06888e..c742c9298af3 100644
--- a/kernel/Kconfig.hz
+++ b/kernel/Kconfig.hz
@@ -5,7 +5,7 @@
 
 choice
 	prompt "Timer frequency"
-	default HZ_250
+	default HZ_1000
 	help
 	 Allows the configuration of the timer frequency. It is customary
 	 to have the timer interrupt run at 1000 Hz but 100 Hz may be more
-- 
2.34.1

