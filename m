Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE7929CB32
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744631361; cv=none; b=YvqRBdom6igGrEhF5c4NkpFEaK0hFUiz31VGoeGls1yoyWDf51uEoPuAN7H6Pc8RY2JA3odrxV21H3HrwU3tmr1TVTBkRCDrhQCHwj7vooPz6EwHhtXoiwCCIA+r95PMQHMyjpfnMgC4GFjFgoZK1dq4pscloZuIEeAyDJu3i/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744631361; c=relaxed/simple;
	bh=aEusxvWhtxsSU6c6RiVQfSnOin9Z96cw15RbGNdbXV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WDyv/1C3iwQ0yTyAOKojuoPaQy85SHYeQNsVbk2eDNyAi+hv64IxzNs2mCuX1A0AMml0X41ZFT1olmTjAUcA1HcmmYEnwAcZXqJuXOiqBerxhy3KFTusNZrmdvWwP7BS9sHUC0SapHktoLdYpK3o+meOzaZCvom721Rc/19dBIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcCd0OFE; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcCd0OFE"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2279915e06eso42301385ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 04:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744631359; x=1745236159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SXO27tnNFypn90AJmN3DKAGd3jsvWoI9DoDd6wFIgYM=;
        b=LcCd0OFEL6vSoaG/i5rMbopGHy9xQRQ6sQ6LcwWfllV/2IDQH5k+5x98oM43P/9L3j
         RGhEGOSTZgMew9RonnFRDyKq1ZwbjK6sUg7GPd2GrWUj7FFROtPe2tROXRz1N+5xzinA
         c8MKFHj2saZZV3YGSIYP7vqDE3y1WjNbH5BBm9GcS9s2dtCmDW6V//mlEwHI8NgRcVmb
         xatAxdiPZdogOtBkN+GsQt9qe5IbHoit6j47bAkHAyB6EBXkE6qdWaaEySZzM1W2XyI2
         BKzzQSOcez2WdiXvg6fNVDgRl94SZwGk/0OM50aEnJidbbVASpLa9OexJ1jspnXwQXl0
         IYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744631359; x=1745236159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXO27tnNFypn90AJmN3DKAGd3jsvWoI9DoDd6wFIgYM=;
        b=FB1vF5mUnBzezdCdn4xTm4vPqmjGd9h7DM59MYumtPpFV91SdhX88KZtqwqBU9zYng
         +3MoS04soYw0qYoNZvTEDLLiqEIisb9OhkqtbzbalL50ceO7qFAg5vx+QVXM3EsLV7ts
         uan0ql2NFASgWQS8o5R2uf5MrxnWNqhAMZowDiqYoWCfwit+xWARbPw8ZflPJWOs7Kcs
         6RvJV9+52E40WrmdmfncLAr1+GB0KjxUviN+KUYXb6Dt2sDPrRxvyEtMbmnonRQEd7XW
         sGaOgbhYUD4ykkkRv/phzhawTBhZ1uXTgyit3KpHVcpR6eD/u5UNS1OEQZcE6vTBg4QN
         BtEA==
X-Gm-Message-State: AOJu0YznCDXsxsm6nJ2SzWYnteJ99NcgDcGxTS6j49Z4c5f4rXhrcG55
	vIYVau05RCMWmOs707v5YJoO815IIQgR9SKhKxJ2HhaEk1EW1TElYueTph2Y4dU=
X-Gm-Gg: ASbGncvW/CIdZlIdaM8zsZKExNJKs891qOU1n0+WexOeHj+e807/klyck3EDIfNE0FC
	iH8OwUwwIVH3IjobJCr003rxtDjxGWQIEqwNBVJeOWbMtB5HDjITS4PbLPXbFSOnu9QzQPg/5kz
	MxEIGz5e1pw24RQluJOrSmgs0Dw0lKdxGTk5Sr40NLN/KxB84ZrOw9XW0F1sksJTvymLB5x2bzo
	igVfNIwbA+J/Ndc0dFSDMPC26dP7OBH5TAZWxpnyUGO1zv6/nRG+gnWfDjfVDmqBHYCdPx9lfjQ
	XUo7yIRgaSTLs5WCLPDW+3/SdaRRyTsXnZC/kW7AVUFs3v32dZSD6d1K
X-Google-Smtp-Source: AGHT+IEJ/IcNRkURRpTkd5ss2SVZHjIYK8naKSC50UqfwCtbPIp08ao38/9r4dDcjxy0EJEMuMOpJw==
X-Received: by 2002:a17:902:d481:b0:223:fdac:2e4 with SMTP id d9443c01a7336-22bea4958f1mr142174595ad.1.1744631359031;
        Mon, 14 Apr 2025 04:49:19 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230e4adsm6624156b3a.142.2025.04.14.04.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 04:49:18 -0700 (PDT)
From: LiuJie Xie <xieliujie92@gmail.com>
X-Google-Original-From: LiuJie Xie <xieliujie@xiaomi.com>
To: mingo@redhat.com,
	peterz@infradead.org
Cc: linux-kernel@vger.kernel.org,
	xieliujie92@gmail.com,
	LiuJie Xie <xieliujie@xiaomi.com>
Subject: [PATCH] sched/rt: Update wait_time when doing migration.
Date: Mon, 14 Apr 2025 19:48:41 +0800
Message-ID: <20250414114841.2181865-1-xieliujie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: LiuJie Xie <xieliujie@xiaomi.com>

With __update_stats_wait_start() and __update_stats_wait_end(), we track
task's latency and the info can be seen in proc node '/proc/pid/sched'.
But it seems that we loss updating wait_time when rt task doing migration.
In update_stats_dequeue_fair() by calling update_stats_wait_end_fair(), the
fair sched class make this update work.

When a rt doing migration, we can see:
step1: wait_start=1503718063442 C:(__update_stats_wait_start<-ttwu_do_activate<-try_to_wake_up)
step2: wait_start=124844 C:(__update_stats_wait_start<-activate_task<-push_rt_task<-push_rt_tasks<-finish_task_switch)
step3: wait_start=124844 delta=1503718120473 C:(__update_stats_wait_end<-__schedule<-schedule)

In step2, the wait_start become very small after doing the below logic
and we will get a very big delta in step3.
void __update_stats_wait_start()
{
    prev_wait_start = schedstat_val(stats->wait_start);

    if (p && likely(wait_start > prev_wait_start))
            wait_start -= prev_wait_start;

    __schedstat_set(stats->wait_start, wait_start);
}

So, update_stats_dequeue_rt() should also update wait_time just like
fair to get the correct delta.

Signed-off-by: LiuJie Xie <xieliujie@xiaomi.com>
---
 kernel/sched/rt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index fa03ec3ed56a..a93d23b839ad 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1346,6 +1346,13 @@ update_stats_dequeue_rt(struct rt_rq *rt_rq, struct sched_rt_entity *rt_se,
 	if (rt_entity_is_task(rt_se))
 		p = rt_task_of(rt_se);
 
+	/*
+	 * Mark the end of the wait period if dequeueing a
+	 * waiting task:
+	 */
+	if (p && !task_on_cpu(task_rq(p), p))
+		update_stats_wait_end_rt(rt_rq, rt_se);
+
 	if ((flags & DEQUEUE_SLEEP) && p) {
 		unsigned int state;
 
-- 
2.43.0

