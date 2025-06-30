Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024391F0985
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 18:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751309256; cv=none; b=YCFUF0WPOg3ISAdPPbVNkDfFxJMdMw6K++o8donmNg9rAnlifh5i9bsoO10BjhqlcFJEGgk8elaRUAN+LzabCV1ugZW1iMkiWRr1bgwSV6McwmHkqnGH05i3Gl5lzY9pzai325yhSvtvIHPL+tRsqoZ1vjbL6jkfl3G4hUhtcWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751309256; c=relaxed/simple;
	bh=9cK6Eq4nefv/GghvD5HJZDoT7MsabKRb3dFtA7O/Kv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=juCwbFZZzQN9C0kaBSv9o3j2MITSGePp6KAbFEqht2AppE/4JQ7PtovSfmFXp14Tshm436YwMqkuyhjCfb1TT/FVyfloKurD9Xw+MctxHhvbXlUkT0s05cjiDQfpbMeWVuTv6CZN+uXKXMICiFPrnVYK8nA1LvCqgIbCqY79d58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqQsoEFo; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqQsoEFo"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a522224582so2509408f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751309253; x=1751914053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bWCDZE0FTIR1xBnsspCUs5W2BaZP5zicVS/tsUtWrIE=;
        b=dqQsoEFoa82EpqIFpgtn3aQm1tPlXr6oDbuuzngBefn04unAG3zXdGZ+3niZ9PWBNH
         8jl4L9BjQXHCj01HZm5xHbeEE3g0s/NpCpmLqw5RA5Ci6inJIETsWI48fTCtefPUydLa
         R0b6Yj4nHSnsmx33TmCfmsyzdXtVGtsguSu0J9dG6q44mK5g0nyEZMmZdB3/jXsE4BLh
         GXHnuTMks6Tqk1rMacCd9Hd3+b4IpxKPk7iTDdoMquTEyO97Lt/2jWA0eBjE01gVV98x
         Mlp7P8ewrGx4DGYPCsoa79/0YZI5a9WOREN7XpYxv/lznUMOba+tKeoQ81Pt4HuxS6Xx
         MvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751309253; x=1751914053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWCDZE0FTIR1xBnsspCUs5W2BaZP5zicVS/tsUtWrIE=;
        b=f1+qw+DNhQTA/M8xXyIQFJPgYEgrqyLw/sJYhIGiRQY60BIztkUg8YcbxrJTLEMYzV
         eK8eMsEruoSB015Kvr2H+asIKYXQDyaL/Gy1yvnLCXp/T7iS//gtLEQImV7HKLe9Iv/3
         arhQnJuZleGrfDwg2vJeWg0rLqP+nGVd6pn9EZP+Dv+CPdg9vSkvdEL9KqxpMVq9y5kH
         qADGMl0KKBE4mrBcuVOw4j7v/vHKBj2iH7uy5WIyHvaduFT61AwCUQAaFlTULxTIq7/4
         JRzE1pm5DocAbdCVPWnESatU5d4nnL1FdjbCVLzI15pwDABFnAZqRzm/FNsMkYDY5R2o
         WOTg==
X-Forwarded-Encrypted: i=1; AJvYcCXUuYUp3Ez9tNnNSFwUrkXrqGww9D8IGofVy0D8LmO3e/M3WP8cFTI7rAEc/o9jmzAFhJwk8Cewi+wHbQc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbgVNkGYTxcXQ1+QEUpV0/D4ZUXrzGYBtvs/TFQJntrVth9coF
	M5iAoNiJk4xMrhcG5WJGRyR7Re1aCImfBwgfJErYq8lr1RG9ZGzg7CkW
X-Gm-Gg: ASbGnctGA+qkyObfHcZHETdYTIYemeCnnV7mcBsvHQnlUlu4n1jp5Cb9eWyww50Bk7g
	IWKAhQSgaDqLuv1r+ZAiPZPKe+yKBhPKpYwwYM7BfNdT93Yw6n8XPYLNEH9AKxkWe8a7XG68neZ
	+dIiv/MTdHVbTohAdBC4BIlr9M3NHVcxe8LcWfu8SLuHNuWyC793pSJvi0xYzGu/vSL8Z7JVpk4
	+zpC8ZSco9HdrXIGkeINScyHv/2TBR1Go9EQBm+ACAPPOdztMpudZZQfI9XmGa9JY2XTsbsL3O5
	X2bQHvWgUCDhRZZQhVSqvfo4JWj9bCOb92jCadAVl4nTWMWdPb5dvyHvih9d6RPPfJdSTb9Tdqc
	ji0TA8g==
X-Google-Smtp-Source: AGHT+IFO2osZbMXuKWxvWyX9Foircyi48OTYoE9MHLpj0kcKgEMymDAzwhFfHneslieiNv0usMhi0w==
X-Received: by 2002:a05:6000:648:b0:3a8:30b8:cb93 with SMTP id ffacd0b85a97d-3a8ffccac71mr11268712f8f.32.1751309253100;
        Mon, 30 Jun 2025 11:47:33 -0700 (PDT)
Received: from cachyos.customer.ask4.lan ([89.26.177.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa751sm205862f8f.25.2025.06.30.11.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 11:47:32 -0700 (PDT)
From: Marcos Garcia <magazo2005@gmail.com>
To: tj@kernel.org,
	void@manifault.com,
	mingo@redhat.com,
	peterz@infradead.org
Cc: arighi@nvidia.com,
	changwoo@igalia.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Garcia <magazo2005@gmail.com>
Subject: [PATCH sched/ext v2] sched/ext: Implement cgroup idle state notification
Date: Mon, 30 Jun 2025 20:47:09 +0200
Message-ID: <20250630184709.3831581-1-magazo2005@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add scx_group_set_idle() to notify BPF schedulers when task groups become
idle or active. This enables schedulers to:
- Optimize resource allocation for inactive cgroups
- Implement power-saving policies
- Improve load balancing decisions

The implementation safely invokes the BPF scheduler's cgroup_set_idle
callback under RCU protection. The callback is optional - schedulers
not needing this notification can omit it.

Signed-off-by: Marcos Garcia <magazo2005@gmail.com>
---
 kernel/sched/ext.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index b498d867ba21..7cecc0ca700d 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -4258,7 +4258,13 @@ void scx_group_set_weight(struct task_group *tg, unsigned long weight)
 
 void scx_group_set_idle(struct task_group *tg, bool idle)
 {
-	/* TODO: Implement ops->cgroup_set_idle() */
+	struct sched_ext_ops *ops;
+
+	rcu_read_lock();
+	ops = rcu_dereference(ext_ops);
+	if (ops && ops->cgroup_set_idle)
+		ops->cgroup_set_idle(tg, idle);
+	rcu_read_unlock();
 }
 
 static void scx_cgroup_lock(void)
-- 
2.50.0

