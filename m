Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CB126ACB
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 08:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739002199; cv=none; b=TqSEOiD8II93vaPKsgFDD76mR5eqnjIEseU37edQl6Qz82HPMvoXAXj2gjvN36GIQfpSPJ8s7LKJmM3nHgwZY9bZQF6nDfjPvXCEZAs1zB7pZ4wAGRHghcbO9xoMxC20hialTtOwkshC/NyC3SmVMKrs1gCz1kydYmaQK+w2OOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739002199; c=relaxed/simple;
	bh=ZbZqSVUUawaGpCB3tOwPjwcWYFzFuxq9IG7a+VObaes=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BZyF7NZorcS7HC1NS0J3Uh8MhcGlsgWHX/w8z5PqZ3nKLgB7lYlZPPp99yxJk1RWaokRJg0wHjDOIWIS3TjQfMAdkloy0rqCyLnFmmQD8Chb4bySAYGF+leqopSz5kKFg4P7PE2yjM/5CSpR2jCxCYqr6VtKl+04p4xBXG4YiCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+BHlhJ3; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+BHlhJ3"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-2fa19e1d027so3077108a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 00:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739002197; x=1739606997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VF34/bNN53EBkpK4Krlego1JxrAsM9ACsTK9X3t2sgI=;
        b=G+BHlhJ3qRbbXAgbJcRNZxCCCygTekvLRlq6+bC1FNHxQ01tSMZt/E4y4bLDhrLv2L
         l2gLQPuutmw/+3O65LgHU9ckgFUNrOn2QN10Eo92fZWV9WUOkhifgbWphN5O/Lfk34hs
         Sxj5Y72mlqKmluvZ3OEHK74t+5Os2DCeI0jh2WYghjdGX0KME+wzKGm5HfS1is7fdDJU
         ivFJKVB+2qGAkHwDXXvNB6PNYAXlxmKmZF0/sk5wKmLzznEajte0gQ508+1Uh6fzRZXQ
         Ex9YE8TX2pMjxN+zsxDsdVtI4me6af6W5zr6uuyPjALIBQGRJlrIcGV3RLRyk83SWsDz
         XpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739002197; x=1739606997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VF34/bNN53EBkpK4Krlego1JxrAsM9ACsTK9X3t2sgI=;
        b=hyBbXfvMYBt/QkcY48zjoaRg6QcqfCW1fn9jKPiRniHltwQmzRXYsfC4ofMEblSBGE
         UCWT4r0KErqXQcRqUSLiNH+FNsMrN/praDr65EGT7o9vzmS/dzzmjpePFa3ZPLq3aHN6
         wrdxM/eXGwr+cKT4sAHWZCNWXIITUcKGz6G7fyllgdYMZVV0TIhEPvH3K0Qv7aIUfndC
         B6VhFhpeL6zaHXGig6b/gEjCfDeIelDpNIC9QpzpI8kI4i4d4Zr10Lqf76c2wnE7g/ox
         vnH13Lzp7W42zA39GCawpyNgfQ4XALVCC4bWIusAszX/2m/DyrLdzyOlehczRZXXpYKJ
         5T1g==
X-Gm-Message-State: AOJu0Yyi8Wl0Ovl8zcEMA0bYbyrjA2etk+/BAswpXKbxhSf+A43kJ2W1
	MJB2m8I69qxQOuN4WTHsQ8bSIn3m2g3BKucEvNIAlaHJ2gUCMmix
X-Gm-Gg: ASbGncve4rdxZsk/nkGMI5sWguTH3gd/A5SqqyH2X9X36VQoN6NDfpxU3aSeWHfyKwX
	P5z1fVAa9paE5x1ujnP1cJXGhQDYAotP6L6lqQqU7asfcdPHTyvnnb9JmfbtjDY9FK+RO4rqVl4
	bp5DlKW24UD01gzIDzDX5VOyi6WdDelsEPRyG46Mne8GtPzmmQKa6fNaR1KtuDBBw9qAV71Lgwh
	mgwi7vymgplTIrACYxxobTFByYmXM45TDGveaJPdfvYFwVphD9iOSsDHIRmHrxPPcG1l0c+5yhX
	5stfGiGPY8C/lR185pUkxWASpAC0RosU/Dc=
X-Google-Smtp-Source: AGHT+IGgyof1+XSZNJbTtFWgUlk1aYEvUPuvTIYqR7O17W3u1f+u+pcGI0i2ufAdLfM62BBrTDP3og==
X-Received: by 2002:a17:90a:da87:b0:2ee:ad18:b30d with SMTP id 98e67ed59e1d1-2fa23f436bbmr7740454a91.6.1739002197402;
        Sat, 08 Feb 2025 00:09:57 -0800 (PST)
Received: from localhost.localdomain ([114.67.205.189])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa274407f5sm2718013a91.15.2025.02.08.00.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 00:09:56 -0800 (PST)
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
Subject: [PATCH V2] sched: Cancel the slice protection of the idle entity
Date: Sat,  8 Feb 2025 16:08:52 +0800
Message-Id: <20250208080850.16300-1-15645113830zzh@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A wakeup non-idle entity should preempt idle entity at any time,
but because of the slice protection of the idle entity, the non-idle
entity has to wait, so just cancel it.

This patch is aimed at minimizing the impact of SCHED_IDLE on
SCHED_NORMAL. For example, a task with SCHED_IDLE policy that sleeps for
1s and then runs for 3 ms, running cyclictest on the same cpu, has a
maximum latency of 3 ms, which is caused by the slice protection of the
idle entity. It is unreasonable. With this patch, the cyclictest latency
under the same conditions is basically the same on the cpu with idle
processes and on empty cpu.

Fixes: 63304558ba5d ("sched/eevdf: Curb wakeup-preemption")
Signed-off-by: zihan zhou <15645113830zzh@gmail.com>
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
Tested-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 1e78caa21436..41e1c18a8e6a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8762,8 +8762,17 @@ static void check_preempt_wakeup_fair(struct rq *rq, struct task_struct *p, int
 	 * Preempt an idle entity in favor of a non-idle entity (and don't preempt
 	 * in the inverse case).
 	 */
-	if (cse_is_idle && !pse_is_idle)
+	if (cse_is_idle && !pse_is_idle) {
+		/*
+		 * When non-idle entity preempt an idle entity,
+		 * don't give idle entity slice protection.
+		 */
+		if (se->vlag == se->deadline)
+			se->vlag = se->deadline + 1;
+
 		goto preempt;
+	}
+
 	if (cse_is_idle != pse_is_idle)
 		return;
 
-- 
2.33.0

