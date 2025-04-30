Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id D7BD213957E;
	Wed, 30 Apr 2025 03:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745983666; cv=none; b=o+MeOHTSIIcuGoNG4jeSXdKUCr5r+LyF/y5slO/RdyK6km8k8n8KbS+V387bsp/SDkq35sFB0Fanxe9KKdNIH5MNn83k7J/ILkmTZfw+Eh7C0zkOTBhtLeLbMhkys9/p4dCd9leXV7afMvb3kBU09FjX8rHKjso5smMsH+niBFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745983666; c=relaxed/simple;
	bh=DBWerTwqEx3+VzSJhVgjUMjx2RYqZbTNcI7cSBo+KPY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version; b=PuVT3Mf5hcgq3FbFWTpDbLOoQ+EhvvSWjeEBnReXj3cn2V1GyPK14PbYf0QN2GclH7yj7CLJwzTz4XikfkXjY6WRTWBngk0eDBLLGMRKDNuAimabl+q3ZF2/c2zox6Rm9YEqJwUqhxgCX479liitzS1qARc+20zkzGnwRbhPnU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from longsh.shanghai.nfschina.local (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 824576018E584;
	Wed, 30 Apr 2025 11:27:39 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: jstultz@google.com,
	tglx@linutronix.de,
	sboyd@kernel.org
Cc: Su Hui <suhui@nfschina.com>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v3 2/3] alarmtimer: remove dead return value in clock2alarm()
Date: Wed, 30 Apr 2025 11:27:33 +0800
Message-Id: <20250430032734.2079290-3-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250430032734.2079290-1-suhui@nfschina.com>
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

Remove the impossible -1 return value, and add a warn to be aware of any
misuse of this function.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
v3:
 - Add WARN_ON_ONCE to notice any misuse of this function.

v2:
 - No Change.

 kernel/time/alarmtimer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/time/alarmtimer.c b/kernel/time/alarmtimer.c
index 0ddccdff119a..621d39666e29 100644
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
+	WARN_ON_ONCE(clockid != CLOCK_BOOTTIME_ALARM);
+	return ALARM_BOOTTIME;
 }
 
 /**
-- 
2.30.2

