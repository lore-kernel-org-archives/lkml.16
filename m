Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E33A21505C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 10:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746614616; cv=none; b=ZzeAlUqLrf6+K/+VHOuaScEDgBURAn9JmQIULx61IfV1a5fQX6/+biLGOK50fWyqR53L3WVRsO9Rnxd9TLXlt+evBaft/wEwYxx5LeRvUgvY0Vjh7lMhnPZL2rbBV9aC4LWLF9Tbk3D+1ZCrunduiVNfzS/UdLC1UAZd9CjB3h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746614616; c=relaxed/simple;
	bh=Qo/ZrceoQTXto2/HZEMEwY9kyey3PehYg+COl4yhazc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L6GGMCmCQtg9Zd0qe6RoLUCwEKZTj/75iOv6f0pIqiArqr5aXbyN8X39frRawvxZVdlPOCWGwqrJWbjMlTHW5GWPe3G3WoINPY5SIrlGeXBTPs1fpbSn2FToHGq+j0T7McUf4sPgM4ghT/ebqntceZJjSdq4trJvoqIkbM5W8+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=P7sLMU/h; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="P7sLMU/h"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746614605; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=jZyeNUllhEjWwZXWgeTBRRxB9T75NXtWWR44tfcSckE=;
	b=P7sLMU/hKClolkviU21p+2v7Ma1g3Lf5jW/gC+aLpGszbUJY1b0KijLYqve3AueEhwDAh0I9RiPP7HvWQPvgtUnfOr38PpJjfQGIQ3VULbC9piv8vdzKHAv1i0lmGA4I+jFJTX+w7TsmLC6DbiV137a/IgRJusxoAbV6Emyqbg8=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WZpa-8q_1746614604 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 07 May 2025 18:43:25 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <ioworker0@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: Feng Tang <feng.tang@linux.alibaba.com>
Subject: [PATCH RFC 3/3] kernel/watchdog: add option to dump system info when system is locked up
Date: Wed,  7 May 2025 18:43:22 +0800
Message-Id: <20250507104322.30700-4-feng.tang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250507104322.30700-1-feng.tang@linux.alibaba.com>
References: <20250507104322.30700-1-feng.tang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernel panic code utilizes sys_show_info() to dump needed system
information to help debugging. Similarly, add this debug option for
software/hardware lockup cases, and 'lockup_print' is the knob to
control what information should be printed out.

Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
 kernel/watchdog.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 9fa2af9dbf2c..60afcb0247ab 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -52,6 +52,14 @@ static int __read_mostly watchdog_hardlockup_available;
 struct cpumask watchdog_cpumask __read_mostly;
 unsigned long *watchdog_cpumask_bits = cpumask_bits(&watchdog_cpumask);
 
+/*
+ * A bitmask to control what kinds of system info to be printed when a
+ * software/hardware lockup is detected, it could be task, memory, lock etc.
+ * Refer panic.h for details of bit definition.
+ */
+unsigned long lockup_print;
+core_param(lockup_print, lockup_print, ulong, 0644);
+
 #ifdef CONFIG_HARDLOCKUP_DETECTOR
 
 # ifdef CONFIG_SMP
@@ -212,6 +220,7 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 				clear_bit_unlock(0, &hard_lockup_nmi_warn);
 		}
 
+		sys_show_info(lockup_print);
 		if (hardlockup_panic)
 			nmi_panic(regs, "Hard LOCKUP");
 
@@ -774,6 +783,8 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
 		}
 
 		add_taint(TAINT_SOFTLOCKUP, LOCKDEP_STILL_OK);
+
+		sys_show_info(lockup_print);
 		if (softlockup_panic)
 			panic("softlockup: hung tasks");
 	}
-- 
2.39.5 (Apple Git-154)

