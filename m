Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B624155C87
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 06:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748585262; cv=none; b=qjUCnn0vaKQ8dPtCqW4qHIes6Ps3tFQgTd4pGci3FZFYk3R+VPA+RRwRcWQVBDPTqoVjTlxrhXpk5ZuWVVi7ZpNtLjRAWQsMAB6TTrTJ5ggZdIyQiuGiZLPaRAASPAlLGWEPXwPlX6Rl5ilBxvRwF2pjkRHlSPPKGKJ7Q+0XpZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748585262; c=relaxed/simple;
	bh=0ezBEjp79epj8jhOgJZKXBV0S7GBNEGVH03qpdwH8Kk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=aEOAzjCABKPsGlPN3wd2T+uzu4+uKt3yZ0GXD4CnvV13PU+OFRbc6GabypTMmySFCiHVSbwu36WOZgBRH7y+t8CZuSZzRrxK3JILGy5w8ziWpya7vsqvJLoSbMsmipIQXPm4IfJxYE8ezIh0rQwXuwXMPtTIBXHa5EKPqE8laMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kqom8CIR; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kqom8CIR"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-745fe311741so1835098b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748585260; x=1749190060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bLuVQkHtmA6DxhiRwJx5wPQR+HyJYHXTIZjx5bNIHaM=;
        b=Kqom8CIRew8IvgOZqCXdcGlgMpI2EbdohOIfTlvpR7VA+NeubkLjknEHBqIgLuzXWS
         wF4psxOZ3TsCkA8FOEJb9edXn1vFwfMHQyKX6MhHmLsp/wdpDqZxZWDYm3wL/x+KiCdV
         A9Gxvp+uSzRmRhYSEF37MdFrHh4RtKHsvkKwHusBjEdzLEPvnIo2aJDe7EtUnflwvdn2
         gT+y7egMebZodadgxJwbtP1ZUKR2mw/IgZ4gXaW3gos9IuNCU+OgSHhAVpBa27/yTqiY
         MKflWay377nVdCXYoi2YFoGOToYZJ/GxgQZt+o6fpq2XWuaxEKBYl2Er8y36qfm8Mf3m
         uZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748585260; x=1749190060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLuVQkHtmA6DxhiRwJx5wPQR+HyJYHXTIZjx5bNIHaM=;
        b=RZ/7+OeiDy/BA8RmiMudub7v/5r/gr7+XrX1zPMJdBaXs+0HrAuX6uJ0Qt9PwDv/7v
         v5GO4r7aVcLl2oekLkvEnEC0zfsiQ41GSpB6ZB2LN4DUcE/c3ZkjIf0svHebfnvq8BJC
         jZlHiffC1J/w8oBseitgk57nyfcgjn8LFXXXFWWRjs+usZx6MT55wfpUoaLXmaNhoEyk
         SXeCqrKUHZgG0/EUJfsFPRGR1gWZUnFmXS5DLYDwZlDzg21JzS79aHw0HAMu2pV21p2T
         PR3eLsGtOreT6maImglb7bC2IWNfvRYaUh37IZY96k4PG9SBZHC2mmb3RANPwaRsqLd3
         0Scw==
X-Forwarded-Encrypted: i=1; AJvYcCWNSTOZ4HPv2YXTuiYW8sG8pxrQTEuJJR7m1MaMsLdDzHv9XBhxoQBXmgvdsd0LPG4PiFUhtpmVTSTIAQU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4B34ueTVW8aNczPsY8O9SxyHoHbk7Dm1d5ii9nQ5SZ/fiHAxP
	B8Us73N8AWYgpUYoMXdKciWjlkXXiOEWBlV17YoeMi/vydQxjXvBD8W9
X-Gm-Gg: ASbGncubHro407uT5s12aGKEJRgTfNC2DYcgDzozWzFRcfj+HpOPGp+55FF9aSvSYtT
	ljJeFyFTkD2ygHkCMK14VjTSQLlsV9mviebufzfoMtQUZf390HO4iu/07HBwnTZ8AodJDk1W83L
	HxItyQDnTcjamkIO3hAg94woQLCSYoG0B7K1OEisTOqpB5qyFhHry/i+hAjwd4PzP1q0OHTBV/D
	fyepC7TWGKXO7THndFUvsCKLrOuGPE35H+p7nolaylnsgLtMXWrspZFTUMBcb7zO2og7Y2dvoo1
	b0SAcRq8Dzt3UHEeAgrvksEIqmXdbP+LbUD9APrlIf+ew2E0lLFxawYVOpHG/+7TM1N8NxaX3v4
	=
X-Google-Smtp-Source: AGHT+IEaavR28vRB+lQ86tlOsWeae5YSMTFxyo/EtIolK6SHlc0s9JAZDzmNT1PAyO3ZhcZ2zhlYQg==
X-Received: by 2002:a05:6a20:939e:b0:216:5f66:e309 with SMTP id adf61e73a8af0-21ad98c272bmr3809423637.41.1748585260149;
        Thu, 29 May 2025 23:07:40 -0700 (PDT)
Received: from localhost.localdomain ([39.144.44.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affcf9ffsm2365083b3a.135.2025.05.29.23.07.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 May 2025 23:07:39 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	mkoutny@suse.com,
	hannes@cmpxchg.org
Cc: juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	surenb@google.com,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>,
	Eric Dumazet <edumazet@google.com>
Subject: [PATCH] sched: Annotate sched_clock_irqtime with __read_mostly
Date: Fri, 30 May 2025 14:07:26 +0800
Message-Id: <20250530060726.67380-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Eric reported an issue [0] as follows,
: rebalance_domains() can attempt to change sched_balance_running
: more than 350,000 times per second on our servers.

: If sched_clock_irqtime and sched_balance_running share the
: same cache line, we see a very high cost on hosts with 480 threads
: dealing with many interrupts.

While the rebalance_domains() issue has been resolved [1], we should
proactively annotate sched_clock_irqtime with __read_mostly to prevent
potential cacheline false sharing. This optimization is particularly
justified since sched_clock_irqtime is only modified during TSC instability
events.

Link: https://lore.kernel.org/all/20250423174634.3009657-1-edumazet@google.com/ [0]
Link: https://lore.kernel.org/all/20250416035823.1846307-1-tim.c.chen@linux.intel.com/ [1]

Reported-by: Eric Dumazet <edumazet@google.com>
Debugged-by: Eric Dumazet <edumazet@google.com>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Reviewed-by: Michal Koutný <mkoutny@suse.com>
Cc: Eric Dumazet <edumazet@google.com>
---
 kernel/sched/cputime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 6dab4854c6c0..c499a42ceda4 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -22,7 +22,7 @@
  */
 DEFINE_PER_CPU(struct irqtime, cpu_irqtime);
 
-int sched_clock_irqtime;
+int __read_mostly sched_clock_irqtime;
 
 void enable_sched_clock_irqtime(void)
 {
-- 
2.43.5

