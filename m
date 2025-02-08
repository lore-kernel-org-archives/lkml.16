Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166D72556E
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 07:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739000997; cv=none; b=ujI7dWLqA789uON6zeptj3MkGmM0EGtiTYtuQ7wStxGFh99ZAcKFzVJ3rYtYoBfuD83ocMSdZVoXIdo9NeGDEjAqAz/01jl1jhawYRzz0C60n0rExqy7lfvQmwRE0AMRWUFlbegySoTDk7b+glMXz0iZ1W3JhgzuvrmXhhtfLNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739000997; c=relaxed/simple;
	bh=14dx4Ib2roQK/kmlXOQIwgStPD6JfyVnOEl4jU3S6pA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pE64A+MbQwJVK4RTvUOoxfqL0FbEQkjwWtaZ5C60rF1oXc5IKzdG+XOB6g4hmTjeohXQlzokG9+J2u4e+2mKxdcECXGid0zpV7okxQk5d157uuxFlWPHOTlVLhA8NHzvgC1XqL6tR5iBCWdfMdV1M0GIwMLgeMi9sgB3IjccWbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXKxQ37u; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXKxQ37u"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-21f61b01630so15267995ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 23:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739000995; x=1739605795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PZFZWrR6UNXy8s39BqYm+zor8l3xHF9vd8yJ0FgyX/A=;
        b=DXKxQ37u1AiLIKT3H5VO0eakJV4vVZsqWBeIZC3mubOehsNVMpbpHdH9KkU4OEDLZ1
         bFm/SMuiA4N9cBrvVE2M76QajIXTUcS5wWnthrTWZzIORJHtR9JUBQIj9s5neYN8UZpx
         zQJCiW/bVmQwgxs9a7nmvQ4ZtwmUraKVs8ZjLCsfMBe/w4VzbFLYJTiKCPdTa+MCgt4U
         hHtwOjL35THZLvdvfeRDAmKR8uevF6ybulfK6+8LIajUZYAPKZYIeMCIdW+C9ccqlGQ7
         eMYdrTnL/HO2ofxYQTHp4E04DeripdXQ2LuCZqWy54S4rjuTK4ZMdV5gxc0BlI/uL8H0
         /9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739000995; x=1739605795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZFZWrR6UNXy8s39BqYm+zor8l3xHF9vd8yJ0FgyX/A=;
        b=AZdu/hhIb9jBzCHdqqMWJk/biyNzoJ35uRRQVDTy+Ml9LIDvT+lDl4uHJKDm7mGeoI
         m67snPv6MoeHCGkyAvtTwGaz/hxjf/r0d7VF+VJADgNXS7tip+KY5xKEKsjjkzq39LUf
         kWsN0anUXroFBptroKJUdC2NTmb1s5CkcvYVktZ5D5lbMKNglz5qBEVIHQAAv8+2wcPk
         4V/hKI3VxwyZXsOlSpSzqws7MwwBuYoPAXYy1Jkg5yKTqnjqL48JIV/Np1C4unnhk+sL
         kn4DKxwW0aX092EfOLTxiZNO+IMANhUOhEIB+F0ej50U2pY8E7e+e7rpu57Y1P2dVT3M
         MT1w==
X-Gm-Message-State: AOJu0YyyQNMuRz5JujDWKs8d+hY9Q2BgeYyTfCmNTl0UzneSAZXFp++p
	1OUYTjnQEn3PhDF8r9tYrQtD9avf0Brj9k60qf3yYmyw+erXTNlV
X-Gm-Gg: ASbGncs6ZeLqd++0nX9CY7XT15VFNbYIriwsGGy0RCT0QHLwPzn4Azy3luI/wjwKIEc
	K3Eel0oAcmRYrHQ2LfSNOQZ8C2z8RkJOSPS5RNhtuy8V06h0tQjK8xMz9pYzZ4mnK9NuMuEfn2H
	3Zl4wm7sNNuuXg4U1oSAgskg6y9nxfQokfap5vtdydcYx/h5fCzwKVAkckNzMA+NmI6EoV8ExMg
	vXAKAfTTQE9viLYdffw+pPOKF+A66czcCGwLYvrnRQ8l53pQHWRSqLpeUJT4F+z6pUsYYPJHvrd
	UcjSDjfmkV7ewjg/TYU+7RfCWkb7HBOJtS4=
X-Google-Smtp-Source: AGHT+IEF1Lq6cnieB1XUIqppnQ3AcrvKfdEYFMbBogbetbwY19d2nOlHfgH6RfAf0V4fnP9scldgqw==
X-Received: by 2002:a17:902:e842:b0:21f:6022:c269 with SMTP id d9443c01a7336-21f6022c48fmr47761295ad.9.1739000995215;
        Fri, 07 Feb 2025 23:49:55 -0800 (PST)
Received: from localhost.localdomain ([114.67.205.189])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650cf70sm42162875ad.8.2025.02.07.23.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 23:49:54 -0800 (PST)
From: zihan zhou <15645113830zzh@gmail.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com
Cc: linux-kernel@vger.kernel.org,
	zihan zhou <15645113830zzh@gmail.com>
Subject: [PATCH V3 0/2] sched: Reduce the default slice to avoid tasks getting an extra tick
Date: Sat,  8 Feb 2025 15:48:23 +0800
Message-Id: <20250208074821.11832-1-15645113830zzh@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The old default value for slice is 0.75 msec * (1 + ilog(ncpus)) which
means that we have a default slice of
0.75 for 1 cpu
1.50 up to 3 cpus
2.25 up to 7 cpus
3.00 for 8 cpus and above.

For HZ=250 and HZ=100, because of the tick accuracy, the runtime of
tasks is far higher than their slice.
For HZ=1000 with 8 cpus or more, the accuracy of tick is already
satisfactory, but there is still an issue that tasks will get an extra
tick because the tick often arrives a little faster than expected. In
this
case, the task can only wait until the next tick to consider that it has
reached its deadline, and will run 1ms longer.

vruntime + sysctl_sched_base_slice =     deadline
        |-----------|-----------|-----------|-----------|
             1ms          1ms         1ms         1ms
                   ^           ^           ^           ^
                 tick1       tick2       tick3       tick4(nearly 4ms)

There are two reasons for tick error: clockevent precision and the
CONFIG_IRQ_TIME_ACCOUNTING/CONFIG_PARAVIRT_TIME_ACCOUNTING.
with CONFIG_IRQ_TIME_ACCOUNTING every tick will be less than 1ms, but
even
without it, because of clockevent precision, tick still often less than
1ms.

In order to make scheduling more precise, we changed 0.75 to 0.70,
Using 0.70 instead of 0.75 should not change much for other configs
and would fix this issue:
0.70 for 1 cpu
1.40 up to 3 cpus
2.10 up to 7 cpus
2.8 for 8 cpus and above.

This does not guarantee that tasks can run the slice time accurately
every
time, but occasionally running an extra tick has little impact.

Changes from v1:
  - update sysctl_sched_base_slice with debugfs, limit its value and
    update normalized_sysctl_sched_base_slice.

Changes from v2:
  - move the explanation from the code comments to commit message.
  - add the reviewed-by, thanks!
  - change the function sched_update_scaling to
    sched_update_scaling_or_slice, to fix some build error.

zihan zhou (2):
  sched/fair: reduce the default slice.
  sched/debug: update sysctl_sched_base_slice with debugfs, change the
    function sched_update_scaling to sched_update_scaling_or_slice.

---
 kernel/sched/debug.c | 52 +++++++++++++++++++++++++++++++++++++++++---
 kernel/sched/fair.c  | 14 +++++-------
 kernel/sched/sched.h |  4 ++--
 3 files changed, 57 insertions(+), 13 deletions(-)

-- 
2.33.0

