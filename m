Received: from mail-qt1-f202.google.com (mail-qt1-f202.google.com [209.85.160.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147CD20E328
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600680; cv=none; b=rg8vFKRXjl6JTv/Wob35xtrcXX8SFPdV1bdjLpPwp5lcojgv1MqFOFIzKaL46oEUSyIJR3OdMJHJaCXj8YZ/htyH9aeMxJ7ttmcZxbXXQE1iURpCO7HxY1wb1yg+g3qUljEvNhInelGMyGvuPRMp2VnNqOZhDFhTFJl7FE5J9TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600680; c=relaxed/simple;
	bh=yF7LQDhBMogiJgmpGQRpJ19sEkFmBcIG7FiCXcGrn4o=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JnVet2uddeJ7kDNn5lM5IBrrJRABN9u1/xBXOMxqZS4URoF8C5QG52/mHZCyGUu6MO64atWAyU/fLOYTr8PcQu6soHcxy4uhCvI5NqfirstPnp1YyNhgTZ8FpGsxCjV1lEOKcVPnEVkIsWqut33JqLXczND+TZ1c7zAsMUobOUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edumazet.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VKD8P0bt; arc=none smtp.client-ip=209.85.160.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edumazet.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VKD8P0bt"
Received: by mail-qt1-f202.google.com with SMTP id d75a77b69052e-476a8aff693so155636701cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 06:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743600678; x=1744205478; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9RmVxeIETvRh1wXmJ7aAweKDY6rQw3N9ywL0sW+KKOg=;
        b=VKD8P0bt7DTGvwI2/UI9aosveu1tlU9zsoa7+9x4rJqle+t8FrwrFE1x9ca5U8fMRA
         c0CnIMfwTAjUh7dXR50ulbV/8lLKgyDAU7rLk6xtKURBfpLbluH4VC4i244/ClvwMR+m
         spbBU5BBttp+Xt3pWz2h3Yg/sIVC4oBUtpe62jSdyuZD7hRgZycDklOQr+o7qcfU660w
         Zj8mYyGERZMeQs549xylQ6Zy3Z6b4TgT7Cj+UHy5KsvcTUNX+aP1/VLUyLTB5naeoBOT
         wRZZAE8MTcXhpCalAiAcDO1MOWRV8AlROSL9FUzrrPxA5o4/O9WRolTMDUmtLUVLcF7t
         rpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743600678; x=1744205478;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9RmVxeIETvRh1wXmJ7aAweKDY6rQw3N9ywL0sW+KKOg=;
        b=xSQ8XttcpYpoMW/wqmrobsdFVLi4eQqf3Jof8nK7w/cdXqCVDSdI2tYADsU4ubkO8I
         3G0i84PnAMRmASCfwqbD/27W/XKDqHOG86eBFda2h92tAe2CPxXchqjmwWXyPp1AnUVD
         WABO8r3gUHWHz+T0grxXfCdD/jNQrqx7ATd1dwPVPnyzpRnZp80g0Z0TdvN7y6xf8sln
         jrWMuQWfjz7T5PlusifMptVSgg5/oQmrxtY3aVMKFXfed0MJ+WuOD4FjSDmvJwp1+DO4
         XP0lJIjcZz5218y9krlriTk41gA5KoMhfKLtkF1+QrefUB/wKkIW5qGAWIB/KbFuIVka
         Tcuw==
X-Gm-Message-State: AOJu0YztRbHg5SlgZG7uMeVFhAdQs8tEIBsQziI8IM8k1dVZhRSWxLlm
	cXveMjdf43GAy9FFDP53BWeBefNM93J+z9brFH+5H+f2nQLqdiEpqsQq86FU51Dl1yfxbpsMUMA
	ewDvBF2ITlw==
X-Google-Smtp-Source: AGHT+IHjB7Bx6/FFNgdVxgoEbeZcgksOimq/wqJG0z6i4BHDMUWZamerMJrztSykieI5AJKYf7YIWK2RHnzqrw==
X-Received: from qtbhh8.prod.google.com ([2002:a05:622a:6188:b0:476:8f8b:91a1])
 (user=edumazet job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:347:b0:476:8412:9275 with SMTP id d75a77b69052e-477ed728721mr297381961cf.35.1743600677832;
 Wed, 02 Apr 2025 06:31:17 -0700 (PDT)
Date: Wed,  2 Apr 2025 13:31:14 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402133114.253901-1-edumazet@google.com>
Subject: [PATCH] posix-timers: remove init_posix_timers()
From: Eric Dumazet <edumazet@google.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Eric Dumazet <eric.dumazet@gmail.com>, 
	Eric Dumazet <edumazet@google.com>
Content-Type: text/plain; charset="UTF-8"

Move posix_timers_cache initialization to posixtimer_init()

Also move the variable to the __timer_data variable to avoid
potential false sharing, since it never was marked as __read_mostly.

Signed-off-by: Eric Dumazet <edumazet@google.com>
---
 kernel/time/posix-timers.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/kernel/time/posix-timers.c b/kernel/time/posix-timers.c
index 6222112533a7b902bb986ac2347a5bcc35625fa6..2053b1a4c9e4bfd792368035553b654593bc7b33 100644
--- a/kernel/time/posix-timers.c
+++ b/kernel/time/posix-timers.c
@@ -30,8 +30,6 @@
 #include "timekeeping.h"
 #include "posix-timers.h"
 
-static struct kmem_cache *posix_timers_cache;
-
 /*
  * Timers are managed in a hash table for lockless lookup. The hash key is
  * constructed from current::signal and the timer ID and the timer is
@@ -49,10 +47,12 @@ struct timer_hash_bucket {
 static struct {
 	struct timer_hash_bucket	*buckets;
 	unsigned long			mask;
-} __timer_data __ro_after_init __aligned(2*sizeof(long));
+	struct kmem_cache		*cache;
+} __timer_data __ro_after_init __aligned(4*sizeof(long));
 
-#define timer_buckets	(__timer_data.buckets)
-#define timer_hashmask	(__timer_data.mask)
+#define timer_buckets		(__timer_data.buckets)
+#define timer_hashmask		(__timer_data.mask)
+#define posix_timers_cache	(__timer_data.cache)
 
 static const struct k_clock * const posix_clocks[];
 static const struct k_clock *clockid_to_kclock(const clockid_t id);
@@ -283,14 +283,6 @@ static int posix_get_hrtimer_res(clockid_t which_clock, struct timespec64 *tp)
 	return 0;
 }
 
-static __init int init_posix_timers(void)
-{
-	posix_timers_cache = kmem_cache_create("posix_timers_cache", sizeof(struct k_itimer),
-					       __alignof__(struct k_itimer), SLAB_ACCOUNT, NULL);
-	return 0;
-}
-__initcall(init_posix_timers);
-
 /*
  * The siginfo si_overrun field and the return value of timer_getoverrun(2)
  * are of type int. Clamp the overrun value to INT_MAX
@@ -1556,6 +1548,11 @@ static int __init posixtimer_init(void)
 	unsigned long i, size;
 	unsigned int shift;
 
+	posix_timers_cache = kmem_cache_create("posix_timers_cache",
+					       sizeof(struct k_itimer),
+					       __alignof__(struct k_itimer),
+					       SLAB_ACCOUNT, NULL);
+
 	if (IS_ENABLED(CONFIG_BASE_SMALL))
 		size = 512;
 	else
-- 
2.49.0.472.ge94155a9ec-goog

