Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AF52036EC
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751280920; cv=none; b=p46rwCnHyqIhsAZRIuFNe1jClbJ0TEf1Y9I0kTCW7yez0x3hrBqRjvgkrPxB3umrwYQ1Ips3TfktO22CKv76geVND/R6+YSHqyM3hUPG4TBwLgGc5oxnkKh3APQYigx7OCozEtbrc7bgLDnTq++L45cgR8DMp7u5gBatiaK7N1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751280920; c=relaxed/simple;
	bh=cU3hB3HvxWPPOyXc7mO1dY4bHCVH6ZLM8RWYvoDFkFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VjZMg/jsddm43hiuBNE932882qRZEu8zFeB59mVkh7KVICBwXKp1UWejaHGkChlXyVC60Y/oEOlrD7ltmPEVIfm/t5zRBQr3AnGjHFKGvAABqa+CttQVGELzT5BOkbihKDrF56+IcojhQ3bHLJozi8EuEDmK22qIWAGcNO/si80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Kz2mS8zt; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Kz2mS8zt"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751280906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fuC92GbE8iZEOmaA2/M5DrfKRialcl1L1OJy8YTaHqU=;
	b=Kz2mS8ztjz3MyrBgXoD+3JnKqFIwCtT/zItH/oKUJLR0HMpfJJXfiXE40Nah2gxzgIiKOj
	N5N29qdHokHSHSjngAhb0v4ddu7ciFuEJaP+74e7+hd9DDy0OCoaVaYO5qjIq0skApvNUU
	aP+c9B2LH5SajpfFYW5bs/hx0TOpOSQ=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: timer: Replace deprecated strcpy() with strscpy()
Date: Mon, 30 Jun 2025 12:54:18 +0200
Message-ID: <20250630105420.1448-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() is deprecated; use strscpy() instead.

No functional changes intended.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/core/timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index 1de4b90fd4d1..776c48a420c6 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -1195,7 +1195,7 @@ static int snd_timer_register_system(void)
 	err = snd_timer_global_new("system", SNDRV_TIMER_GLOBAL_SYSTEM, &timer);
 	if (err < 0)
 		return err;
-	strcpy(timer->name, "system timer");
+	strscpy(timer->name, "system timer");
 	timer->hw = snd_timer_system;
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (priv == NULL) {
-- 
2.49.0

