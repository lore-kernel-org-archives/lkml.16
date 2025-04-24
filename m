Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEC12918DC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513466; cv=none; b=TLzeFUcGxT3tWUOeC7z3V6JvKqT1M9FaQR/t38z2RS14MFiQJ8IDHQwozkoPliTMw3Kv7Kj10X0lXDZz0Q3nAHoncHja6KlReO0/ivlmWAafX645oRRdVgmMpFx5944qPlOOoB+C2+j4oIWGZ4VCnytGYpP/5D6NtHtWImkefTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513466; c=relaxed/simple;
	bh=j0DoxpKjCJhhU+yir274VL1deTlL0JGM8AR24S7KyNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gYcmf6eUGanmyhrN22aX/upBX/vI+hL8d3IzRjAJC8UCIslWrYiJL92NVDNyobq/fpoPw0lZcFRwUPd7izre2dbKRCB17Sa+D5XTTkmnfFmxB26R7cJJGR20mvDbeoi2DjJAvteiZL4hDgz6IC7QDjy3DenrlzzVYk4T3SxKZkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=dF4pnKU1; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="dF4pnKU1"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3fa6c54cdb2so1197297b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1745513464; x=1746118264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VH64OM6I6nosuLY4RSxIBPH85WXV+oEeTJ6j2dq97QM=;
        b=dF4pnKU1O7aWBqtFZRkV3P9THmkTIMUrFhSezKUKutrt/Hh4qb1eJCG9jnud0eKiCu
         pkLlIfLUN5WzcmDEY61TDEYd0/aLKAJ8+pjUt6ojKiVpPPvSTnsVVUsAF9PDtz3iVm8q
         /Rir2VL9LmQ4nCCeUkmJrAFOfa+DBUXvMy6Xzwe6FoEfivEnXn6/Iy08Dye0ZIjDMx7x
         K3ZlRM61N5m5e/hpNCyikEUCVJ2ARn6HyHFSsGn0mb+bSSCErDPpQinWxbfOUllXG9uT
         oXfn/ywnoSDdcGyPNBf8eBMOOraqGamLWdOTJn095uAYK/O0XeVKJLGqXIhs4aRyaG2x
         7svQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513464; x=1746118264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VH64OM6I6nosuLY4RSxIBPH85WXV+oEeTJ6j2dq97QM=;
        b=ssBgtKcpy+XNjv+oYEKjfCIj30e1zp9ZO8xcUo06sDtaIT3LhpDvGaCwzvYsmIqgxc
         88a89meUu/yxyq8M+itftk/AExZVxXkSQXOtcekfZ9LJ/H0b0Z5sWlWAmxnoyu9JqNvS
         kk9CoTEJUjnQU2P5FgN8YtQkjQsdzDSjIP8DNgifah1aJ3kVOYReAjqEnliyhhhL6mk5
         JXjTknKTmoV1NmDShuGbg6WuzAwK5GOkl4rye5CAsQNOYZCRgFBiNUIGRlhBH2x06KjP
         5EkBBPIO0kdlJn+pomWjlp+1KtLKuvAbQ0VOdmgc6P+4ANCcX2NTzQqjDCCoUaptgElt
         HsEQ==
X-Gm-Message-State: AOJu0Yxh/cc469fbxI2R2VpHonN5QYx47HL18Dsuf+J5KjYCVFsHJV35
	ZPSXW4tvtTizDYflCJzmj2u2jEk/Q0WFfBQ8sw0USJssSPUk5WeNpUHZOTTJsSxNYi0U9bXedpk
	H
X-Gm-Gg: ASbGnctAfMGmfVzB9IOCwKFHdUqwT5wY7rXhSvnlklT8AD7bwKnBYVNKcSEtBb6LC42
	rf6AsGA9aLACHex6qHu94fKE/EcP9mWBrAioGIt6B3padQM/JkNeM0m1eJzs21zklvs1sSGC1Hy
	p8uhaMNlfM5LXiZmEbLJKJpyeItnvmEuBK7pVO2PLXMf9xij+O3QgZ+50n+8s6S1uh/YrdLHo+n
	sqPTaHkWj9qOZOEmglFsqqBRxSN6EXuebMfCW4y/4nimr8Hzm9PsZ5KHOCrjV4m9e/kS1JXHtaO
	8rMpPbKQYxoSquPb3CedXyJQGoEL6kYfCms=
X-Google-Smtp-Source: AGHT+IHEXQA1OTb7rMWfEAZZ0DvXP5Khkqdlv7WV286ube6xvxznKifB3RDkqvSozgqpVp+14zNUjw==
X-Received: by 2002:a05:6808:6a89:b0:3f8:f8c6:5500 with SMTP id 5614622812f47-401f1254c03mr56299b6e.34.1745513463964;
        Thu, 24 Apr 2025 09:51:03 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:af2e:7abf:8abe:2726])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-401ec8b0484sm306647b6e.4.2025.04.24.09.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:51:02 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Rik van Riel <riel@surriel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Corey Minyard <corey@minyard.net>,
	Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 20/23] ipmi:ssif: Fix a shutdown race
Date: Thu, 24 Apr 2025 11:49:57 -0500
Message-ID: <20250424165020.627193-21-corey@minyard.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424165020.627193-1-corey@minyard.net>
References: <20250424165020.627193-1-corey@minyard.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was possible for the SSIF thread to stop and quit before the
kthread_stop() call because ssif->stopping was set before the
stop.  So only exit the SSIF thread is kthread_should_stop()
returns true.

There is no need to wake the thread, as the wait will be interrupted
by kthread_stop().

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_ssif.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
index 506d9988721e..b016fabaac68 100644
--- a/drivers/char/ipmi/ipmi_ssif.c
+++ b/drivers/char/ipmi/ipmi_ssif.c
@@ -481,8 +481,6 @@ static int ipmi_ssif_thread(void *data)
 		/* Wait for something to do */
 		result = wait_for_completion_interruptible(
 						&ssif_info->wake_thread);
-		if (ssif_info->stopping)
-			break;
 		if (result == -ERESTARTSYS)
 			continue;
 		init_completion(&ssif_info->wake_thread);
@@ -1270,10 +1268,8 @@ static void shutdown_ssif(void *send_info)
 	ssif_info->stopping = true;
 	del_timer_sync(&ssif_info->watch_timer);
 	del_timer_sync(&ssif_info->retry_timer);
-	if (ssif_info->thread) {
-		complete(&ssif_info->wake_thread);
+	if (ssif_info->thread)
 		kthread_stop(ssif_info->thread);
-	}
 }
 
 static void ssif_remove(struct i2c_client *client)
-- 
2.43.0

