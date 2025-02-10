Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FEC17591
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739183449; cv=none; b=WZjTm0m9ato5kFy1/R4OmJ64gcBrvZ363SNbSIM2Yu6D3LPeAVzJgkJBqT+734xyU6sCf45iCsT/rNUNazhrnEztb8l6rBjem1V1yDEaDKIoG7N1nMZRPQSJTZ3BUPOxdb2AlznssRd9S/TEyge84B1Rm5+uH4rcAxOqlX/V5YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739183449; c=relaxed/simple;
	bh=9pjUKJOuSDqVDp6p2I40//S0ECRAIlGzSwl0sztV2Q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lQ31VhhRRVDRTZgBeOGOvfpTms5bLL4bcPy/Qmy0koQQrmkSexKVaeppLUqI1xLPzlMBxkWJpI2CnfM7vJiq9WYUtquOsT7NF4XcdmE9oZJ609AF0HZn9nzdFM/tv5SZXopmG/ht1Ypas/DHVafTWPf2WTiZIXSTIM+o38NWz9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imDF4h7y; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imDF4h7y"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21f74c4e586so25831745ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739183447; x=1739788247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jK2z+3W93YJTqVLKR8QxqcKHwGpafs0J+lhmxl8g/Co=;
        b=imDF4h7y3xTau15BMmlmrAzVrsWP1odJWs1/2BX36PUxGjdwmMI3pa45rqLUHSLeyR
         yEdIJywtkV4BlNtZTy9XvxrdonAGchEl7zNEJRZP6iHJJcyztbSQvW0e16uCEH+xFVfs
         wYO9f+ezfF/xyw/hl+zj4KQBpBYocDBXtm2orVFhtMWLs94tDVnExsuf5KgG9RcDDl6d
         f1mV+p+8eymhm9YS/UBEEzKVlYOkGeMT11NIt6cegK9q0Bv/dVO6LIURX66Qvp+yfBEs
         VxKePVCZ6XFLJnqLcd5iQaBxj5bhZ7Yl+MbsaRnV2SUPKiJlyDb4olUt5nVUZlB9u8TE
         HOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739183447; x=1739788247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jK2z+3W93YJTqVLKR8QxqcKHwGpafs0J+lhmxl8g/Co=;
        b=RvjnNAA9vdemRlzQDtNyAs/HDhey19OFbEut2c+bVu+Nn/e+u70J+EJdoE49HTmPeG
         eI8okmPo6kUUPd4Zma/94Voh74tWzg8BBxQfoqq33YRKICNy0ignESSptOmGzqpdhHbc
         wu+8XsS64NLsj1NDv1XQsMe3rVQemgTR+EazIDg/PuQio0Om857vwFNmA7ncOoygT1KK
         QmhRqDxHnxSMwUOG6daoEtx63O/7IlryRLLZLIotZ+LIzRwWqou9XncS7+ARfQlXffp9
         /jIzg6LlkN1NrXNJMVbvJ+8su1hB1ZLl+3MOiWSXl2TYY3qtyz8igYBotvhtxOBjjoTT
         hhuw==
X-Forwarded-Encrypted: i=1; AJvYcCUpW1LKtPho3O7YNqF5rRkD3qEo2hLLD9abX3PSYecIAe3daxg1WqQd74DMF+mgvAz2wmx8djkn6+NOric=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCLcjNv5/Z1eVqvL5mEKXjg2AaA9+zVjSuwXqBovpUAJpuyIF+
	AozHkHG5pTBYVa0YBs4pB04ErAyDvZJwl6dR7E/Yr3KXZeQzRabq
X-Gm-Gg: ASbGncuWKJdtK+HOMzz/b1KHX3XZdXFr5p4U91YI9uI5pkHxHjt5Q6fXidrW1WnHrbt
	HXu0bI1NJMLpPDd4ISfZer4m8ISMQixVCb/XRAwWVJmaicRz9mdf4WkjKdhFF5vwcX0fkU5AWIP
	D7nXMRaSdaw6j72ZT+XoaLBvxEt45qvYtMP++XWj9sj+j/j9Cief14LAX4J9osqODQqrtpE6Y/E
	DOOe2RrNwM92uv2lSYDgljZfoj/Qu054biiA4rUF/nk896rWSNgYEr/tdOdC9HKoO5++tQmihhu
	45VNfqKjPAeAb1KrLEMwo8GQ1qd2V6v3jrE=
X-Google-Smtp-Source: AGHT+IEn+BoKGykAvJNVQpRVzvJGhHbexDYEwxOwlMOHsnic1NQSpayoDxRXI6TxQXXkZV3KTx7Wew==
X-Received: by 2002:a17:902:d4c6:b0:21f:53a5:19de with SMTP id d9443c01a7336-21f53a52947mr189925345ad.25.1739183447095;
        Mon, 10 Feb 2025 02:30:47 -0800 (PST)
Received: from vaxr-BM6660-BM6360.. ([2001:288:7001:2703:83e6:5a50:60c5:d373])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36560ee5sm74783415ad.96.2025.02.10.02.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:30:46 -0800 (PST)
From: I Hsin Cheng <richard120310@gmail.com>
To: peterz@infradead.org
Cc: mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	linux-kernel@vger.kernel.org,
	nysal@linux.ibm.com,
	jserv@ccns.ncku.edu.tw,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH v2 RESEND] sched/fair: Refactor can_migrate_task() to elimate looping
Date: Mon, 10 Feb 2025 18:30:18 +0800
Message-ID: <20250210103019.283824-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function "can_migrate_task()" utilize "for_each_cpu_and" with a
"if" statement inside to find the destination cpu. It's the same logic
to find the first set bit of the result of the bitwise-AND of
"env->dst_grpmask", "env->cpus" and "p->cpus_ptr".

Refactor it by using "cpumask_first_and_and()" to perform bitwise-AND
for "env->dst_grpmask", "env->cpus" and "p->cpus_ptr" and pick the first
cpu within the intersection as the destination cpu, so we can elimate
the need of looping and multiple times of branch.

After the refactoring this part of the code can speed up from ~115ns to
~54ns, according to the test below.

Ran the test for 5 times and the result is showned in the following
table, and the test script is paste in next section.

-------------------------------------------------------
|Old method|  130|  118|  115|  109|  106|  avg ~115ns|
-------------------------------------------------------
|New method|   58|   55|   54|   48|   55|  avg  ~54ns|
-------------------------------------------------------

Also compare code generation before and after the change using
script/bloat-o-meter, result shown below

$ ./scripts/bloat-o-meter fair_old.o fair_new.o 
add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-85 (-85)
Function                                     old     new   delta
can_migrate_task                             519     434     -85
Total: Before=45778, After=45693, chg -0.19%


Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
v1 -> v2:
- Use cpumask_first_and_and()
- Remove additional cpumask
- Compare code generation with bloat-o-meter

Test is done on Linux 6.9.0-0-generic x86_64 with
Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz

Test is executed in the form of kernel module.

Test script:

int init_module(void)
{
    struct cpumask cur_mask, custom_mask;
    struct task_struct *p = current;
    int cpu, cpu1 = nr_cpu_ids, cpu2 = nr_cpu_ids;
    unsigned tmp = 0;

    cpumask_copy(&cur_mask, cpu_online_mask);
    /* Self-implemented function, didn't paste here because the length */
    generate_random_cpumask(&custom_mask);

    ktime_t start_1 = ktime_get();
    for_each_cpu_and(cpu, &cur_mask, &custom_mask) {
        if (cpumask_test_cpu(cpu, p->cpus_ptr)) {
            /* imitate load balance operation */
            tmp |= 0x01010101;
            cpu1 = cpu;
            break;
        }
    }
    ktime_t end_1 = ktime_get();

    ktime_t start_2 = ktime_get();
    cpu = cpumask_first_and_and(&cur_mask, &custom_mask, p->cpus_ptr);

    if (cpu < nr_cpu_ids) {
        /* imitate load balance operation */
        tmp |= 0x01010101;
        cpu2 = cpu;
    }
    ktime_t end_2 = ktime_get();

    if (cpu1 != cpu2) {
        pr_err("Failed Assertion, cpu1 = %d, cpu2 = %d\n", cpu1, cpu2);
        return 0;
    }

    pr_info("Old method spend time : %lld\n", ktime_to_ns(end_1 - start_1));
    pr_info("New method spend time : %lld\n", ktime_to_ns(end_2 - start_2));

    return 0;
}
---
 kernel/sched/fair.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 2d16c8545..d49960d50 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9404,12 +9404,11 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
 			return 0;
 
 		/* Prevent to re-select dst_cpu via env's CPUs: */
-		for_each_cpu_and(cpu, env->dst_grpmask, env->cpus) {
-			if (cpumask_test_cpu(cpu, p->cpus_ptr)) {
-				env->flags |= LBF_DST_PINNED;
-				env->new_dst_cpu = cpu;
-				break;
-			}
+		cpu = cpumask_first_and_and(env->dst_grpmask, env->cpus, p->cpus_ptr);
+
+		if (cpu < nr_cpu_ids) {
+			env->flags |= LBF_DST_PINNED;
+			env->new_dst_cpu = cpu;
 		}
 
 		return 0;
-- 
2.43.0

