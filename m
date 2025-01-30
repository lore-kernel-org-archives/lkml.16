Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852611D88DB
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 14:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738248538; cv=none; b=gl+54gJy6no6T0CeZpLpIV31diq+DHofDkRP1iAnRZAmqwfUTo1m3v5ZyoXW+RV+aF6aFADmsla0TPWbrxpBRGw4pNzwbtm/Tij0AQp6z5EBLXrqY3PdGt9fcQ8X+3NipIeFAcXgMTBInz5rvd6I7WKOIgHfvUCZchXwpY5JKNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738248538; c=relaxed/simple;
	bh=Kt0XJObGrmBNX0HhGdBjn1x0uZJZsk+T50h0TT+dGI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bb4n75HBoYaXtRYT31THOjt6SNync/uHaBMInt0CgOWYhhm5mOrlwTDzxY9zIO+R6gjFspAMXouqMEH9ylQShP1qidaEEQe8W2kTkhaAXOCM6DX7q0aBM7VbSnq9R5JZH3zXnivlbxzjwuOelt+lNSvq5kfDWrLKgJSi15Rd8UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fg6Pr6Qo; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fg6Pr6Qo"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ee51f8c47dso1184352a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738248537; x=1738853337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sFKqgCIH5/zAG3VfGJ3yVJ+6cVWrj7dNfkKGqdjmR84=;
        b=Fg6Pr6Qo/OeeurAwvrUSYNAdEUEYcwQz90Z9Gtoy2tI7rTzbaSPi1rnFaL+Ku4SG54
         14W42kHX8Sp90eKgjpXZaexMLucuDwJRqoyfwH0+39mgafF/AWqEu0bqoE418gnOgx2h
         gL+g4fkHPFvUehSwRcVZmCU0HwjvW0fEEfZS3i6voKeSR1THr0piaJ6PM8jTR7GBQY7D
         8ib88N3NPH0WgQNPLi0W1ejJSuZ/LcMHKQClLt/BQESihdDtwG8c+MMHsrU5FexQeJdq
         ljNIQigzDhePc6dU6EB6n+jNXSIwRYN14lIYwwPzI4LiZJvjYA+r+pe7KT86Iy5LSSJX
         /oug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738248537; x=1738853337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFKqgCIH5/zAG3VfGJ3yVJ+6cVWrj7dNfkKGqdjmR84=;
        b=lcDpxA+PrBFnEIybwli9Xqgb0Xny3wD97IUUKX6ZrVa2PB0BcKMsr0GUpmOsU1kUqu
         G2by+N8C0JHNRCzt9ZayfIA3WHdNuU+lDcwNz5JA7Oahm93oTAFdY35Q2KtJeEaXOiOL
         GpKghD9axX8Mft8wAX4/YZLgYngkzZ0pQDS/cMmjaQgAOKEwjCJ9zP+/8CaVnjpoKDJz
         I+pOryaZGlL2CdQ9J2ZDtCw+K05B+xqdQYSSAOwi5+8PWhKkKn1rFvNBzAZzXLKcAgHU
         G5Co5ICJPoJwSCQGcpYjbjBUnFwLXUY1EJT6qMRQ2VjzJZ30qE1fJ1YWOusVumw0z3il
         wysQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwXS7C5oMZrGAs5zBYmlNR7rHoJKY6Gr/wl3gqgzm7axWkru0PGjzw4HK3giurkIhtNhWBUm96fy8RakE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXS3kcGkr1am2NfsycX2VrLfRPUxVHyMP6lBFC+ZKDrLD+jEp+
	WSDuRJ5wlk2f46MQ4EQnCynF8K2A/wnElWVSsDW9yXpSrvTa9I27
X-Gm-Gg: ASbGncs6QWC0+bQrw4clyK/1DpGzjZdj2rFfvoK9TSaS71HN2+yXD9m+RYXrytMz1NZ
	8lO0o8nWWhOA3dx22dhllSYsvX4mpdQvaK19IWYNPLyJMMRoMFDCWPdf6719oXDMQmhkNzZz8bZ
	kizyQdi8tj6wvpqn9nH/lSepVPl4OQwbmvfXeheZgmjJ+qwirKd8Oc5Tb5+ae9wsoESW2/j4fEa
	mo5ZnttbT6fhqqALnVIkZk7CWYAoTrseiryyRm1GeUBRwQNboueUNQUhH0ceNwajlZ0ewvKdxuc
	Uc92hc7sEtAjJrZIzbWq
X-Google-Smtp-Source: AGHT+IHSnQ6ABRxUSecC4Bp1Nzo2VHey4XchWfAtcOlOl+BvDEvsUHjiRzC2C5ejiNEChyZBUikKrg==
X-Received: by 2002:a05:6a00:884:b0:725:b12e:604c with SMTP id d2e1a72fcca58-72fd0bc6a3cmr10760958b3a.4.1738248536699;
        Thu, 30 Jan 2025 06:48:56 -0800 (PST)
Received: from eleanor-wkdl.. ([140.116.96.205])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba495sm1533965b3a.104.2025.01.30.06.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 06:48:56 -0800 (PST)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: frederic@kernel.org,
	akpm@linux-foundation.org,
	vbabka@suse.cz
Cc: jserv@ccns.ncku.edu.tw,
	visitorckw@gmail.com,
	linux-kernel@vger.kernel.org,
	Yu-Chun Lin <eleanor15x@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] kthread: Fix return value on kzalloc() failure in kthread_affine_preferred()
Date: Thu, 30 Jan 2025 22:48:49 +0800
Message-ID: <20250130144849.1249084-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kthread_affine_preferred() incorrectly returns 0 instead of -ENOMEM
when kzalloc() fails. Return 'ret' to ensure the correct error code is
propagated.

Fixes: 4d13f4304fa4 ("kthread: Implement preferred affinity")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501301528.t0cZVbnq-lkp@intel.com/
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
 kernel/kthread.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index 4005b13ebd7f..5dc5b0d7238e 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -859,7 +859,7 @@ int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
 	struct kthread *kthread = to_kthread(p);
 	cpumask_var_t affinity;
 	unsigned long flags;
-	int ret;
+	int ret = 0;
 
 	if (!wait_task_inactive(p, TASK_UNINTERRUPTIBLE) || kthread->started) {
 		WARN_ON(1);
@@ -892,7 +892,7 @@ int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
 out:
 	free_cpumask_var(affinity);
 
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.43.0

