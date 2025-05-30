Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595693FE4
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 13:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748611546; cv=none; b=m2ALVD4rAht0SFj4dyjB5GYssfSNfzZYZo5Y7igHJbAzUhzudqljuxm+8XL7bCiRmCzltbxJIJzl71FPtNCe/5DK9dpeKGsZaYdbtTxmqN2Pc5OILhafvKTg1Vc3BGMZQozFuO1LOY5Cyue3E/MStXAHLqpAq/9+ytOxjjW8zmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748611546; c=relaxed/simple;
	bh=PgxKpmwUXFEHD62wBJ1kOQYT5echnoyGtaLah7i4Xn4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MWvV9uivaXMfKzlm+cOO0Z59I4qyrCe+Renx7dK89UJwYW9Ob/aq8iW5MU+c8/lEVpf+T6NchaEEmYtxHPqwDpAGEonyyGwvUd74XBXHnyjISkWi82AtBJvhxLlElUnqyU59tmepgiCYor2/mNLOJN3RNRLFoXu+wqBo2Nfk1IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MzQxbtLB; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MzQxbtLB"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso606275e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 06:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748611542; x=1749216342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KVWYls6nDQ73R20I/E86TcuwkZJGt1DZr9U8c6qpiXA=;
        b=MzQxbtLBPw12rLUIoOvKbkmBFOh7rE+gCf+cB9gE8jeefrCk6RKebYT5Uyd5hAsf/j
         zzjIXu7fT7mFrg+IpRlFqgO2jBwS0//nXJwuasSBjHras8Qu8wHS+R1NGe6idIU3Z+a1
         +cRk7NlUQ3HX/dkXJyUboOqMdL9tPhVOPbpNSnABBDWw/g+jh/4ihCXPtTUdMZdNa8ML
         3SWTFeYNUgUbzycX/cdLzR/nfqCmgkehrS3Ah/iL6FfR201RA4VmopWCSM6L2t2lgRug
         /JTU7dgHXXyKaTlmYyJYm449QyzLkwj3MQ4HkVyWX4QN4NairkEeHC8hro3zXOKu1oAa
         n26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748611542; x=1749216342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVWYls6nDQ73R20I/E86TcuwkZJGt1DZr9U8c6qpiXA=;
        b=Inwa7e7E3plQpB9L0eYXskYyaCY+NSzN7P/pCdKA0h1vdmACFZdXSbZQRcA3PiTwJU
         2OGX0C4fXQIiIg9vPHZJvNGRD5yzuXVVmK5VdjKgBq3SQD4nOTWQLFttoG+zUOgaFoqW
         y6+nn49bofHYmOPyeEKK6hABdgT1q7Q7edRi2t/u+Vzeryh4l/GDaRv6QXYryq7USpYr
         /6eKjD/gVPZl/SgLbpQfeQqA3vq+sQB2C+p/Jzw2Ud/RCKwz+5lg2WmNC8zU28S+YKxE
         832ZH7TNuaYEDS+D0jdg+7mPgxa7MAHtWtF7Na30TvX/xBZeJXFF1MpAorTforsXeUOl
         fhdw==
X-Gm-Message-State: AOJu0YzJWiNgjBhPWqYDCjHKNN6aHo8iKbZkrlUXaZCBiuu3youI5eAn
	6hKnH8NLlf/8Xq13H3Vg7n+lHv84qB34Q0R4GRNuSMZQTBt1Aa5Cv/9HT3vqNex6OQg=
X-Gm-Gg: ASbGncvdkJiGAXTd4ByscimmLNuc3b9W6AHvwhDTOJv8RQeDhNgqCMkvUrE2ecRf1Z0
	7C1kuGZDEAzq2RM+ZmxQ7meBfbUlk+ytwlj0NEYeWEGO9a7AcJarJG+IToHg7565DRpu4AO08vK
	ReOmP66nSsOLhBDIh8BQ5PdEChW1janucNka9xci1zoT6tgI81mD5KVrqTdmC4GHtAhAF7S7HNs
	Bv05nlrYFXIQSuxkuA5uEpfG/PtwOxiInqKrd8h1XfriLPWJCrAVcjga0Stwsd8iY0TygASHMtX
	lAqTKzCLwu/hh1+Vmf5Wpd4AzOv8q+ykzEaRzL4a94RF
X-Google-Smtp-Source: AGHT+IFMDODFq8YfSUMILS9AIMysrQxARbcNqQQhkXacaq+QWyeYkvOmhljmx2uNzVHpXM/pMfqpsg==
X-Received: by 2002:a05:600c:1c8d:b0:43b:c0fa:f9c4 with SMTP id 5b1f17b1804b1-450d7bae255mr7676065e9.4.1748611542464;
        Fri, 30 May 2025 06:25:42 -0700 (PDT)
Received: from localhost ([193.86.92.181])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450d6358fc9sm20975115e9.1.2025.05.30.06.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 06:25:42 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org (open list:HIGH-RESOLUTION TIMERS, TIMER WHEEL, CLOCKEVENTS),
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH] timers/migration: remove an unneeded call to find_first_bit()
Date: Fri, 30 May 2025 15:25:39 +0200
Message-ID: <20250530132539.234792-1-ptesarik@suse.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use simple bit arithmetic to extract the least significant bit from the
active bitmask, because the bit position is not needed, only the bit
itself.

No functional change.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 kernel/time/timer_migration.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
index 2f6330831f08..0f40727b6cac 100644
--- a/kernel/time/timer_migration.c
+++ b/kernel/time/timer_migration.c
@@ -1277,12 +1277,12 @@ static bool tmigr_inactive_up(struct tmigr_group *group,
 			 * group is idle!
 			 */
 			if (!childstate.active) {
-				unsigned long new_migr_bit, active = newstate.active;
+				u8 active = newstate.active;
 
-				new_migr_bit = find_first_bit(&active, BIT_CNT);
+				if (active) {
+					u8 lsbit = active & -active;
 
-				if (new_migr_bit != BIT_CNT) {
-					newstate.migrator = BIT(new_migr_bit);
+					newstate.migrator = lsbit;
 				} else {
 					newstate.migrator = TMIGR_NONE;
 
-- 
2.49.0

