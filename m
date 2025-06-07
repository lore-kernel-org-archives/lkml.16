Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBD41E5B88
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 11:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749296982; cv=none; b=rf6iax93SpYg+fFeM34jfeZdDhkHgHaAKK89xAgUrvNdBgVDzn8LpUzpGRi8kkjX6rRe5pOMao1ykwfuh6C4kJsCYJ++J0l/2KW5ph2vngQICjECZVgy/TcEbkuH2fZOtH4zw+XxmmvRaCKCeN8Pk4s3vD4EvQ0Q2PqHISIrhtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749296982; c=relaxed/simple;
	bh=5Fy/HFXDmE7xeCUuBX1Uw9xVBswmm+agA0GE8yM60wc=;
	h=Message-ID:From:Date:Subject:MIME-Version:Content-Type:To:Cc; b=IXvfQ8KObREpdEIShbv9ROY5/5fo9Ze6MXrJB9qBrfNJhFJK6UlC0DK8b2UYD3SLlMtG46WJ3xGDXUguhGVjfsfVZN5xB9Pj5B3KOrpFYUrFUN/qw5R8hx7b5tXaf/LZc04Xwi4HZ4POyBeOlpRRPKTp3HQarN0QvJwkLEnrNas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=we4h0w/3; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="we4h0w/3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1749296965; bh=v96TxaxWIvNkQLDVDR9h9XbFFfjcJNJoTnaNNILiFoQ=;
	h=From:Date:Subject:To:Cc;
	b=we4h0w/3z9oumA40c5XCxjDPJ9kFp50y3TpwFIYiyGmaCBJANqTH0qSlNRzGgCnWi
	 tW13pMgjb9oHgcfPsUijlhyf6ezlcp565s9zUt8n6qJmWyDlRrRie5SyJWGu3bLmGP
	 /aTdcf0nSmTntCUmRCoCwlUk4EeixDqdT1+Pv2p4=
Received: from [127.0.1.1] ([112.48.46.129])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id A81B84AA; Sat, 07 Jun 2025 19:42:01 +0800
X-QQ-mid: xmsmtpt1749296521tbjidpmiw
Message-ID: <tencent_92F5880EDEB07D078301A561B64F06F9AC0A@qq.com>
X-QQ-XMAILINFO: NpGC5fiO82KYFa5nHI7UUw/i9awG7qSRfnO5gxraIA3U3peqGTu/18vohAJpDN
	 IMX7o39Rwu8cdeCae0rA3TXWt2odyQGnLGYnmU05UGUEDLqehBMYaMYFTg7StfE4uKRVNUWheel+
	 81VQ2H046z3QXvFBomHYlmF756dWVsWBqHzugVOzxheBXwnDKXyklza3RihKztvYN59dWkHYNBte
	 VVsN6bsDrTARXHBBfv0OfuHzwHuKa8VlZf1a2ZdpOnMAHHgs/GAhmGuN5sOqqqE9wWskIsfUZWsP
	 uClguZ0TpE/5cEMB9Bx7QtYmJd24P5vaSHFpridW4Xa5qkeN2/kUR/bex7SjZhOJhXoWQosT2jMT
	 IUcadoCt+ybs1dFegCXZ3rUcl1c0b8ABStb/+MMfnjo1Mkz5rp+XjSUj+3JmTKe/hdk1nkbwIbbB
	 18oVC9cxBLIAxEtcPGpBj18/dJtkyoCJz5bQomwi26ScJA/ioRVeL5n8Q5yEJbLG/02n9XFnImxE
	 9DHedhyaSakEcEQTqut7+1VJYRivuxcHY/D2FecnyI5/qFYrfMD3D7yTUXnunXeFCvJYro3ohU73
	 +AuXDrVySIPCXLEh0JC1mqsJjbzKv5Aa6XoEPwWhY89wLw2+VY9tla1N8ekWvx4GdrHrDcljGjYv
	 1V7yJK8oOlUAaaAZypMpfjSVi0zBa0+lSu2J98IPpqqXTf3ltvyqI/FlylnXr9UMwtBgjnRtULwl
	 AnwuGTCrkAws/svcflpErC5tnSfNRavDXlzCFG/75TQjMLzdX5l4UUy+/XgiFWl9CiZC+IgSPkfC
	 HNurUaOAQca9/qpMy2a9cy/zxMnQvrR1I/zUrUJLfcTVZVxTDMNspT6asrrYHQ4/oTctTzekNM3t
	 77n5MWjQpxDdnWMWIpztI3qbRcJOjARA/r2460UeQRwrmVxMlSv/YBcqIWUgqhEPMKXoWsAt/nRk
	 JGkNsJUw3qpxwgaAxhCAFRurEDMlPwXmx/ufmlRXaXvsE12Pg9szyZ3aBrzns5a0ghw+KKQp00kh
	 d3GtUa+W9hxs08171qimz9D51B9BV6iK256HUARTTi+ULwXYT7YaHyvSNQVzW5YUluDv7EGN+kXT
	 KJT5q6hH3NJe1Bh5RbFQg9417dwjfu/juqqQ2d
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Liya Huang <1425075683@qq.com>
Date: Sat, 07 Jun 2025 19:41:58 +0800
Subject: [PATCH] posix-timers: omit posix_cpu_timers_init_group when
 CONFIG_POSIX_TIMERS is disabled
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-OQ-MSGID: <20250607-posix_cpu_timers_init_group-v1-1-14935adc71c9@qq.com>
X-B4-Tracking: v=1; b=H4sIAIUlRGgC/x3MQQqDMBAF0KvIrBuI0bbaqxQJYif2L5qEGS2Ce
 HeDy7d5OykLWOlV7ST8hyLFgvpW0fQd48wGn2Jy1t3twz5NTorNT3n1C34s6hGx+FnSmo1tmz5
 wVwfXjFSGLBywXft7OI4TS1V4RW0AAAA=
X-Change-ID: 20250607-posix_cpu_timers_init_group-0439fe81f23a
To: linux-kernel@vger.kernel.org
Cc: Liya Huang <1425075683@qq.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749296521; l=1635;
 i=1425075683@qq.com; s=20250415; h=from:subject:message-id;
 bh=5Fy/HFXDmE7xeCUuBX1Uw9xVBswmm+agA0GE8yM60wc=;
 b=t0XYdVWY/c0WPsd5FiCp3FlMj9CyJrPgUQlRpX12kk1my0mCJNbqgVngb0saEVKDG6XBSxAMm
 phusDDuHYOeBcrCEYqfb1I1Hss4k2G4ZMLG/oKPsPOyDZ9u9piv0efw
X-Developer-Key: i=1425075683@qq.com; a=ed25519;
 pk=nSnzeGGcMXBimuyIWYIZpZRN8DboZqwr67IqWALwrGs=

    When POSIX timers are disabled (CONFIG_POSIX_TIMERS=n), the helper
    function posix_cpu_timers_init_group() is effectively a no-op—but it
    still consumes valuable code space. To avoid generating an empty stub,
    we should conditionally compile this function out entirely when POSIX
    timers support is turned off.

This logic was originally introduced in commit b18b6a9cef7f ("timers:
    Omit POSIX timer stuff from task_struct when disabled"), but was
    dropped in commit 244d49e30653 ("posix-cpu-timers: Move state tracking
     to struct posix_cputimers")

---
Signed-off-by: Liya Huang <1425075683@qq.com>
---
 kernel/fork.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/fork.c b/kernel/fork.c
index 168681fc4b25a9fddcb90ce155c027551455f4ee..9632e863c17b44424fadc40b2445034ec5cd20d6 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1883,6 +1883,7 @@ void __cleanup_sighand(struct sighand_struct *sighand)
 	}
 }
 
+#ifdef CONFIG_POSIX_TIMERS
 /*
  * Initialize POSIX timer handling for a thread group.
  */
@@ -1894,6 +1895,9 @@ static void posix_cpu_timers_init_group(struct signal_struct *sig)
 	cpu_limit = READ_ONCE(sig->rlim[RLIMIT_CPU].rlim_cur);
 	posix_cputimers_group_init(pct, cpu_limit);
 }
+#else
+static inline void posix_cpu_timers_init_group(struct signal_struct *sig) { }
+#endif
 
 static int copy_signal(unsigned long clone_flags, struct task_struct *tsk)
 {

---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250607-posix_cpu_timers_init_group-0439fe81f23a

Best regards,
-- 
Liya Huang <1425075683@qq.com>

