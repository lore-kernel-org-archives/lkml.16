Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7B5801
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750389317; cv=none; b=fH4yC1+YeMxgVghxTtjsEO/WQNdwrktjeMqgLapXxg5SRnbIpbVKhGQMRujaYGDDR50M56u+rFYO4Eic5l4AZQH2cNPL+DlsseeGUvBB1Ci45s6YiOAVlf2yzDcfl/pZEkbWCXfyQDP9AY4c2rgI/yoU9VabHqttgiXNBvmmXto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750389317; c=relaxed/simple;
	bh=qGw6QsVkDorN/WcsEMO4MKMspWLeMtrQB/HDWuaMiF4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nce4J6V45sPuMKAR1JcapesPchylhvyOAqGsSNtp7+njwM5AQVF94IDGFSkpQ0K4uoVuYD3NopY/dfGcjF5AQknmotZmDxtETWAHUBeCta5mY0WKm/zL13Dt+foJ8QiRd3SghTQTwLJMxemPjjWbCqTkJL49AeKf2GUCnEd8vXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dM2F/IEd; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dM2F/IEd"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b31e076f714so984126a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750389315; x=1750994115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TTV2xrvG0Z1mVglMumMG6IGCfJ/cF65U85wOLttNrPE=;
        b=dM2F/IEdQMqDirk7cNaQ6AOcQVRHLHpaPmdYdzHf6HT7YLBFV5laP1MQKfzbTrvhsw
         XQpAZwel8/8LQMXoqXDhacOg+Rr8JhZVGZ8hapwnnk5IKGiSVpK1faXB2O12DYewO8FD
         8wl2xAHjomfNmRfb6/HSlAEjUvNqIaQfGKAFeHfTY6zvB5i1uk1xHTyOjNfsAeB1BK7q
         9AxlVd/pflFWOOhboXpuzKpJA3ria7tkNG30Yfl0kVLgExQ23IyTt++xN3muKBxslwXx
         r9uu9PaOx0hLMOtVFRKHF0Wizw8Xv4222Y5A8kPW+o1It5nyE0uKYeLFidHj9T970DPW
         Il+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750389315; x=1750994115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTV2xrvG0Z1mVglMumMG6IGCfJ/cF65U85wOLttNrPE=;
        b=PkB9QeFm+u4doINN5Td+Xswlt0WVkTw2+rzsudMxiUfE+Okvkdx66EVVBxvVWVfysK
         77jKuLvVHu43pS3N6RNVdU6N0UflZ44eLnqDMVHc/fRqQq85I2mQPxDfe3tuk6CbI5CN
         IiN/6eRJLXUVlpHZLBrYXSKmNccqcZ+hG7sIyZmiqKrS9ueRkO9kmuiEHW0CpH7oRg4G
         iHNAmx2GunSA8hH2yCet+6PSWFosV33mdUYRipgWvIL9DjLdNi57801KmhfB6grtLw9J
         4gK5q3LmnAke84zK2mhZWEHBArloEceqBPr4Rw7D6mlOXKzEBCjdzEw3edoTm+MFGJVz
         bErg==
X-Gm-Message-State: AOJu0YyzFAVOG6dg8l1DKGmUr9JXd+fGudLw1jnhTpz3H7dngKjL4s10
	53JhPUmeIwCISHauVX4Hai+V2GnQrA2+Kq2/wq4xJubBiLVOuNPZovEb
X-Gm-Gg: ASbGncsZWPQUjKqlIzkATovh4ipuGGhDD+mlAYmZqt+fCtLVaYQyuZecIDIJc2f32Zp
	LtfLiiF7r0S4W1f7ah0wZQWpY06g+YXEazrsLFAF+RvVM3233tSgnJvV5RyrIvL/XzeRPfiEVuH
	85w1iBycFcYKj4LWo951P3BYLe7beTq/SR1eeL27PwZvApL797G8BabbP/G70kOydQ4tvKMfdMA
	uSHNZAttYehOFb0EuTjDgFHaVjqXvvt4V6+WfplPjoh0HWrmn1VqcVxn5Zd255nKtW9rEA/2KQ2
	5yzY+wisuFubG0g4bshdpgT6Ilm2TeumMFQPj6sTcoMBryyurvxUUc1eyXopHFXctwoDkk7u9jY
	=
X-Google-Smtp-Source: AGHT+IF9RIpEAJdPDiXTGxJSZJUHaziLjzG4Os/4Rce9JK1QXiw3TMZ+I0P2/At5wq591wTb5XKhqw==
X-Received: by 2002:a17:90b:2710:b0:313:d361:73d7 with SMTP id 98e67ed59e1d1-3159f51ab2emr1294866a91.13.1750389315452;
        Thu, 19 Jun 2025 20:15:15 -0700 (PDT)
Received: from localhost.localdomain ([119.147.10.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86103e5sm6486555ad.120.2025.06.19.20.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 20:15:14 -0700 (PDT)
From: Olice Zou <zoucaox@gmail.com>
X-Google-Original-From: Olice Zou <olicezou@tencent.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com
Cc: linux-kernel@vger.kernel.org,
	zoucaox@gmail.com,
	Olice Zou <olicezou@tencent.com>
Subject: [PATCH] sched/stats: TASK_IDLE task bypass the block_starts time
Date: Fri, 20 Jun 2025 11:14:50 +0800
Message-Id: <20250620031450.581290-1-olicezou@tencent.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For TASK_IDLE task, we not should record the block_starts, it is
not real TASK_UNINTERRUPTIBLE task.

It is easy to find this problem in a idle machine as followe:

bpftrace -e 'tracepoint:sched:sched_stat_blocked {  \
    if (args->delay > 1000000)  \
    {  \
	printf("%s %d\n", args->comm, args->delay);  \
	print(kstack());  \
    }  \
}

rcu_preempt 3881764
        __update_stats_enqueue_sleeper+604
        __update_stats_enqueue_sleeper+604
        enqueue_entity+1014
        enqueue_task_fair+156
        activate_task+109
        ttwu_do_activate+111
        try_to_wake_up+615
        wake_up_process+25
        process_timeout+22
        call_timer_fn+44
        run_timer_softirq+1100
        handle_softirqs+178
        irq_exit_rcu+113
        sysvec_apic_timer_interrupt+132
        asm_sysvec_apic_timer_interrupt+31
        pv_native_safe_halt+15
        arch_cpu_idle+13
        default_idle_call+48
        do_idle+516
        cpu_startup_entry+49
        start_secondary+280
        secondary_startup_64_no_verify+404

Signed-off-by: Olice Zou <olicezou@tencent.com>
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index a85539df75a5..e473e3244dda 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1285,7 +1285,7 @@ update_stats_dequeue_fair(struct cfs_rq *cfs_rq, struct sched_entity *se, int fl
 		if (state & TASK_INTERRUPTIBLE)
 			__schedstat_set(tsk->stats.sleep_start,
 				      rq_clock(rq_of(cfs_rq)));
-		if (state & TASK_UNINTERRUPTIBLE)
+		if (state != TASK_IDLE && (state & TASK_UNINTERRUPTIBLE))
 			__schedstat_set(tsk->stats.block_start,
 				      rq_clock(rq_of(cfs_rq)));
 	}
-- 
2.25.1

