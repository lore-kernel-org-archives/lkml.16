Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 158CE85270;
	Thu, 24 Apr 2025 14:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745506117; cv=none; b=K5ithW+51TsvKFb3NlmqEcfWYMB+AbMBTgv6U8dm1Qiktm4qTrRhWYZ/x9j9ndpxAXI4V3xkqQl1dX9kxCuqpxNrmDigW5f7qiPZg7GpIXhozokzdwAyxoI+C6UbUWAz3Ky0rNGiQ4sv4/wvI6GV4kmnZ9P8z45XvGJU2MKo5ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745506117; c=relaxed/simple;
	bh=rX3IZWDeprByq0QZiRxfSjsl9ybyzDy564vdk/3v6KM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version; b=PJHru+EgixmMX9xDe1otvtsLtAv6f2vH7TZsMxitB5/deWgQu62JGDFIMVcc5Cqj9LKCqd98HG7Hg2mrwMx8/PyTLMRgSJfA13hvm7A6cGwwUyIZ7CnhrA+CA/0SaHJAYfzgv6tfRTi+FneMNDasc7rCdGyNb/0tiRXribuLiuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from longsh.shanghai.nfschina.local (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPA id C645760497EAF;
	Thu, 24 Apr 2025 22:48:29 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: jstultz@google.com,
	tglx@linutronix.de,
	sboyd@kernel.org
Cc: Su Hui <suhui@nfschina.com>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH 2/3] alarmtimer: remove dead return value in clock2alarm()
Date: Thu, 24 Apr 2025 22:48:19 +0800
Message-Id: <20250424144819.24884-3-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250424144819.24884-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'clockid' only can be ALARM_REALTIME and ALARM_BOOTTIME. It's impossible
to return -1 and callers never check the value of -1.

Only alarm_clock_get_timespec(), alarm_clock_get_ktime(),
alarm_timer_create() and alarm_timer_nsleep() call clock2alarm(). These
callers using clockid_to_kclock() to get 'struct k_clock', this ensures
clock2alarm() never returns -1.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 kernel/time/alarmtimer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/time/alarmtimer.c b/kernel/time/alarmtimer.c
index 0ddccdff119a..e5450a77ada9 100644
--- a/kernel/time/alarmtimer.c
+++ b/kernel/time/alarmtimer.c
@@ -515,9 +515,9 @@ static enum alarmtimer_type clock2alarm(clockid_t clockid)
 {
 	if (clockid == CLOCK_REALTIME_ALARM)
 		return ALARM_REALTIME;
-	if (clockid == CLOCK_BOOTTIME_ALARM)
-		return ALARM_BOOTTIME;
-	return -1;
+
+	/* CLOCK_BOOTTIME_ALARM case */
+	return ALARM_BOOTTIME;
 }
 
 /**
-- 
2.30.2

