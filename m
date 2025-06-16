Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BB92E4273
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750075823; cv=none; b=rvMXEsLZ6Xqr7w43Kd0JuzVU1GLLz4rIWsBt9PKzSGj3h2hXnLh1sPWrbV5AEzGMIOV90UHMKr9qD9OG5ONYTii8elJivNs/GhJ1k1MgpU/t7O2AiaUJWaHDfXM+401lXqRYp4nhsAfhrQVHgHK1sBZJz3aRqV2wC6OqVHCvtfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750075823; c=relaxed/simple;
	bh=6vI7v/Uw09jCTAoV+8WRR9vLtYrHstIgL/HeuKi2mGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UtCC61ap/FYOAG/7JmQh3y5e+StEXDv5dfSCzwBd2rYk9gxNsQkPBxk3avu2veFeq+5QLDUlihSTWfvaI4fydj+aePb+gA/gw5lWPKlGztYjFITjFPNMDcZOLHu6jGRP+BGXahVtu5tsVmvtFQR2FaxbdDtGTZYtGpm6F8X7tzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJKRNXPr; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJKRNXPr"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b26f5f47ba1so3534775a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750075821; x=1750680621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4O8dFv6FsOraro36+bASC0sfaFtIVtlKR5mBBimvev4=;
        b=QJKRNXPr6OF/C1woqBXjYDDc57XeXV3rZblCNsJFRrJlKwMQCFK7p0R7hmW1MFZ2Ds
         GYvtluQ8G6RPJvYDvorQ38pqg/2T6Fmt1LcqCDEDBZCxwwz/OqbSoq9Am1XWs9aM+MVd
         GLGrHiX1j0tcmndKkewDrjLKxMSQvb6ziCYh1nnZ2BCIZNOgNyL3zEheCwOEiQxpy85p
         JQCyQ551NUQ1XJeDxZr7MT8l6H0bWFvMFvrQ+UDBotxUTFlRex45E/j8dSoi5n0TW6Fw
         7VyI7ILvffUkzdfU8e6MMGAPfc/0aJFjA21xKDKPYzmYhWIjjK+zeSb7rOmV3sixmDjS
         p0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750075821; x=1750680621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4O8dFv6FsOraro36+bASC0sfaFtIVtlKR5mBBimvev4=;
        b=VkSapl75f1TWeOMPSsVVKN8JlqZG644LFc75GmWMlIDa/HhNzPHkko8dXARBiqYxgE
         Vgf73SBrL4eWeGt0sUJGC4dmxZyfkPtTvIEbW78hXEMYorf+VfWgiwVnlXg1wmwa7YjD
         PcKoNG/4vhBUISWCs0las0/0Rhjw4yFyy1YMUVnZBCGyfUKWU6Gmg2BMHUoA6KIlBoz1
         7zup9DOaj/LoUuUkpmCJkDI9/vNutICGUlGIRvzjrw14X1iO6Emotxc4U+Bjx4+xX86B
         kALWjniG2dw8dKm5m+Z1MR0jscY+Vgc9htOU+Wci8VOx1Afg0z/pZKh0s0hP2+Q+BTLT
         rPBg==
X-Gm-Message-State: AOJu0YwrgNHM2EU/pLmDY2gc5DuylPsCiFjDOtEsnAVn3+7zjeH27FPn
	2s5dIvGHDBjuVzPjH0KTpyAeitoyFV1oyr0GpRGlOt4CgYAPPfOun8NhXVMjwzQD
X-Gm-Gg: ASbGnctVpbJ6O1U8z5g75pCSG17T0DgZmdEgi/7J6+9zAkohxIcZLNXuxffwTPm2JgZ
	qw31Ab4G8rhNgsd85cW30BiGSzdbJ4/9HqA7Ux56Q3m14muzOkmfz86QK2qn1xcAhxNx3MIfxYO
	hn5vVC+XTKbPDa9urHKN/jN+sHTzmXA7TWG2OBT42zWYo2frr4mnogu/l98bH5AzRgCWPMc5TCA
	x1wBthYJUNwINBMVGYgcibd5VXq4JoaO8SmvqsNNQEf+6gdPkA1M+2F2CIxOd3fwcos7Q7D4ldp
	jY9aM6SKdZw2upwtP21BSc+XqSzaCh4Yyv4s6OpCjGn21SCGySLDidCyzW65rjOeaow6
X-Google-Smtp-Source: AGHT+IEpESch8M84oRjEp7kPfl7U6ciMOvuDMWjLYzUSC222JvsvJtFLaQvNPSTkzU76hqA3GoKfow==
X-Received: by 2002:a05:6a21:e545:b0:201:8a13:f392 with SMTP id adf61e73a8af0-21fbd55a60emr12396526637.20.1750075821478;
        Mon, 16 Jun 2025 05:10:21 -0700 (PDT)
Received: from [10.238.54.38] ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d252esm6613952b3a.163.2025.06.16.05.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 05:10:20 -0700 (PDT)
Message-ID: <0911287d-b936-4a3d-af24-76c351393b5b@gmail.com>
Date: Mon, 16 Jun 2025 20:10:18 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/rt: Update wait_time when doing migration.
To: mingo@redhat.com, peterz@infradead.org
Cc: linux-kernel@vger.kernel.org, LiuJie Xie <xieliujie@xiaomi.com>
References: <20250414114841.2181865-1-xieliujie@xiaomi.com>
Content-Language: en-US
From: xieliujie <xieliujie92@gmail.com>
In-Reply-To: <20250414114841.2181865-1-xieliujie@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[ping]

在 2025/4/14 19:48, LiuJie Xie 写道:
> From: LiuJie Xie <xieliujie@xiaomi.com>
> 
> With __update_stats_wait_start() and __update_stats_wait_end(), we track
> task's latency and the info can be seen in proc node '/proc/pid/sched'.
> But it seems that we loss updating wait_time when rt task doing migration.
> In update_stats_dequeue_fair() by calling update_stats_wait_end_fair(), the
> fair sched class make this update work.
> 
> When a rt doing migration, we can see:
> step1: wait_start=1503718063442 C:(__update_stats_wait_start<-ttwu_do_activate<-try_to_wake_up)
> step2: wait_start=124844 C:(__update_stats_wait_start<-activate_task<-push_rt_task<-push_rt_tasks<-finish_task_switch)
> step3: wait_start=124844 delta=1503718120473 C:(__update_stats_wait_end<-__schedule<-schedule)
> 
> In step2, the wait_start become very small after doing the below logic
> and we will get a very big delta in step3.
> void __update_stats_wait_start()
> {
>      prev_wait_start = schedstat_val(stats->wait_start);
> 
>      if (p && likely(wait_start > prev_wait_start))
>              wait_start -= prev_wait_start;
> 
>      __schedstat_set(stats->wait_start, wait_start);
> }
> 
> So, update_stats_dequeue_rt() should also update wait_time just like
> fair to get the correct delta.
> 
> Signed-off-by: LiuJie Xie <xieliujie@xiaomi.com>
> ---
>   kernel/sched/rt.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index fa03ec3ed56a..a93d23b839ad 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -1346,6 +1346,13 @@ update_stats_dequeue_rt(struct rt_rq *rt_rq, struct sched_rt_entity *rt_se,
>   	if (rt_entity_is_task(rt_se))
>   		p = rt_task_of(rt_se);
>   
> +	/*
> +	 * Mark the end of the wait period if dequeueing a
> +	 * waiting task:
> +	 */
> +	if (p && !task_on_cpu(task_rq(p), p))
> +		update_stats_wait_end_rt(rt_rq, rt_se);
> +
>   	if ((flags & DEQUEUE_SLEEP) && p) {
>   		unsigned int state;
>   

