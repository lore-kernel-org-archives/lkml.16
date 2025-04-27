Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 46DFF250C1B;
	Sun, 27 Apr 2025 11:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745753745; cv=none; b=gQqJLHMjKL4dl1nX2n8DZUGJn6lK2hgmqCOznT+M6UlPYWfF4SzHG/vVm/rAbwTk1aDBcFNI5nEbGxEkwumbC6bEhVDpCa7fZsVONOrgFBkMTZpxCX62SWJaqvqvG8iBVU5suIoKLr+E/RMiZoH7tlpq6EmQirvZsNKDQxmDeeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745753745; c=relaxed/simple;
	bh=zxQTEz/XdBY5l0leyKw4SwbwYncF+kiPd4MampvnMsw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version; b=J5pQaQJAITCkp6T2pGWjeMwqI0eWhaRkuGZiy6AxjjJtVh6Hg/oqzfXWaRc+rLFmeqBcSFJO4qdkPVEOkGbH0DtNpvQ7JPioDDfcGfs8/jWPcBJIT5qLUbPuCXhmuUL34q9MMe3N96fQiby86XawcYwMf3F6zLoriHELuNIF5pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from longsh.shanghai.nfschina.local (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id EB8556019643E;
	Sun, 27 Apr 2025 19:35:38 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: jstultz@google.com,
	tglx@linutronix.de,
	sboyd@kernel.org
Cc: Su Hui <suhui@nfschina.com>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2 2/3] alarmtimer: remove dead return value in clock2alarm()
Date: Sun, 27 Apr 2025 19:35:29 +0800
Message-Id: <20250427113529.1473800-3-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250427113529.1473800-1-suhui@nfschina.com>
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
v2:
 - No Change.
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

