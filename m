Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D32926BDA1
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739283874; cv=none; b=SOTQuPXBiQrFTW8kVZS2FfjOrULseRTUdXtJasD00CuoC2/99BGBU0CS/sY0THLh6QxIuYibYPFlGufRDJOFywgFqpbvVf03CBjCfUE2ugC4Hc4eBSv14Cnku+slvG1+5IisQXpUcbR8EgEehTg6bxGso2bfpmJY8JLRHmWirZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739283874; c=relaxed/simple;
	bh=zASL2YVV2m9r+5tWN/D62Og2nqeUN5SaME0hGKtnc9E=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=b0jiPdTmxkTlaLCoFQ6Uqskz6Z6/BUzSrsihU6ehbVpPde25B/0cjScRUpOeDDYExeDuFraM0pBUR2N3EHA8PA6qZuwC5uiRFnktqVH7bpNr4z7cW/g4IE+i/fyBjZVvrR1sMBmJbvLeZP4Q7AGMGCd6DhmmZBJkWeNxzG8b3Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CHaFOPJ1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CHaFOPJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739283870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OLKcZ8ehntBYYijdMXfIqJ/bLvKrxEZCUuqRqxomY5g=;
	b=CHaFOPJ1AL4ezdNmlZb/Nm2UwNSTBLkq9uA53XY13bftoK+5ChpVkL5I8YrrkMFOX4Ju17
	h+2z+Im/SA3Zk9TS3/0VeIAMB4M9J8MPvkRuR0SD4pUeDuTxUj6YhypOs3GvWpqydzHk0a
	ldx8+KF15sJJKARluj1zbI9ZFPlkdIM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-1lfh_jCHO8WJkegWw_EF5A-1; Tue, 11 Feb 2025 09:24:29 -0500
X-MC-Unique: 1lfh_jCHO8WJkegWw_EF5A-1
X-Mimecast-MFC-AGG-ID: 1lfh_jCHO8WJkegWw_EF5A
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c04f385c69so288558685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:24:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739283868; x=1739888668;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OLKcZ8ehntBYYijdMXfIqJ/bLvKrxEZCUuqRqxomY5g=;
        b=JR14RFubSwpRcoAUg3RfmannskHC+SvpXLihnIFDK3WKxYyrVBdIRlC6OeHuP05bWC
         6CxL4UH7q/MNmcODBjOfJvC3R4AHyQA7gIomjGvDcWauXMGM/Bo4lgeCkBSkMZ1761AK
         F3scD3Z0zrAMgeCDF1khHGHvlAsqDeBqNXNyTBMjoh+Rw30/ocnK8ckULk+jU5k0Oyso
         iS17Ie4VwTVjelwWD+QKIf+fvn1aR8GEgE70Gkg71uT+iFXyTnRdkaODmgmq9K1LKeyZ
         00HWWryl1X0vq7apl7cAI/P6lrvjzLzlyk+Bg4x777WZmJHIU6t3Pxb9k9gm3RxKcQU3
         ZY7w==
X-Forwarded-Encrypted: i=1; AJvYcCUee/Nqq4BK1UIHSi1wN5oGxdFAZTOHFbpFIih0XTL1rw12nUgOccjFErF8qSI63qqPQZaTL1SQXmvmmFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwovkrM2qfsLjDMctfH/RFQJ4pag3hSRiuDNh2ZY9xd+j4QbcIz
	4rzcUVpEwkr0aOkPbPxMYDnNvPQeMQKx/3+yVBPt8dfONPD9icknwjU93QGbghccwS474B4TSuT
	2BOQJZcSRjRHI9/0X1z6BbcidKGEtkKefaNE2lUc4cjZlEUEirbuOm+l7PNaB5JAk8hvPVUq2
X-Gm-Gg: ASbGnctSo15J2vqLQzIJN5huFT6SWcmZE6dmtWOu09nBp/waW+2qZa95WbFv65nOKex
	/e9sU/zQ6/lgMMQlvvmVFU1S6zUSbqtM88S5RBCoya/z+a403KSsaqtGzXvPf/fAZX1iC+IjRj9
	K79oKQ0W5h40aA3BewDxl13cbTyietpWp05nMymWI2WKFZmcJKBqoGibv14jd7fosNI3Yy5tndS
	fY3BJYsb32FlbRxodA4wsaaTc31CW6hls5stze2xMcVvYrJCW2EL1ayhhzh10A8iJwiVBKvf2Z+
	lADWl5mWssGtie9EhyKveZ2Q8qfvCfA4fZzF63oz3fVudWuD
X-Received: by 2002:a05:620a:c4f:b0:7b6:edd0:d754 with SMTP id af79cd13be357-7c047ba6251mr2787102985a.9.1739283867602;
        Tue, 11 Feb 2025 06:24:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFq5cClEqWrNlR75NBGUMr23a/x5tzsZn48zpigG4+ycvMuSykXUooGLUXOMwYkHDjIwlYNuA==
X-Received: by 2002:a05:620a:c4f:b0:7b6:edd0:d754 with SMTP id af79cd13be357-7c047ba6251mr2787099885a.9.1739283867320;
        Tue, 11 Feb 2025 06:24:27 -0800 (PST)
Received: from ?IPV6:2601:188:c100:5710:627d:9ff:fe85:9ade? ([2601:188:c100:5710:627d:9ff:fe85:9ade])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041ded12asm679392385a.5.2025.02.11.06.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 06:24:26 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <ffd19f47-dbbb-4b04-82f7-d858b2d0ed64@redhat.com>
Date: Tue, 11 Feb 2025 09:24:25 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/isolation: Make use of more than one housekeeping
 cpu
To: Phil Auld <pauld@redhat.com>, linux-kernel@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Juri Lelli
 <juri.lelli@redhat.com>, Frederic Weisbecker <frederic@kernel.org>
References: <20250211140104.420739-1-pauld@redhat.com>
 <20250211141437.GA349314@pauld.westford.csb>
Content-Language: en-US
In-Reply-To: <20250211141437.GA349314@pauld.westford.csb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/11/25 9:14 AM, Phil Auld wrote:
> Oops, sorry... meant "[PATCH]"
>
> On Tue, Feb 11, 2025 at 02:01:04PM +0000 Phil Auld wrote:
>> The exising code uses housekeeping_any_cpu() to select a cpu for
>> a given housekeeping task. However, this often ends up calling
>> cpumask_any_and() which is defined as cpumask_first_and() which has
>> the effect of alyways using the first cpu among those available.
>>
>> The same applies when multiple NUMA nodes are involved. In that
>> case the first cpu in the local node is chosen which does provide
>> a bit of spreading but with multiple HK cpus per node the same
>> issues arise.
>>
>> Spread the HK work out by having housekeeping_any_cpu() and
>> sched_numa_find_closest() use cpumask_any_and_distribute()
>> instead of cpumask_any_and().
>>
>> Signed-off-by: Phil Auld <pauld@redhat.com>
>> Cc: Peter Zijlstra <peterz@infradead.org>
>> Cc: Juri Lelli <juri.lelli@redhat.com>
>> Cc: Frederic Weisbecker <frederic@kernel.org>
>> Cc: Waiman Long <longman@redhat.com>
>> Cc: linux-kernel@vger.kernel.org
>> ---
>>   kernel/sched/isolation.c | 2 +-
>>   kernel/sched/topology.c  | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
>> index 81bc8b329ef1..93b038d48900 100644
>> --- a/kernel/sched/isolation.c
>> +++ b/kernel/sched/isolation.c
>> @@ -40,7 +40,7 @@ int housekeeping_any_cpu(enum hk_type type)
>>   			if (cpu < nr_cpu_ids)
>>   				return cpu;
>>   
>> -			cpu = cpumask_any_and(housekeeping.cpumasks[type], cpu_online_mask);
>> +			cpu = cpumask_any_and_distribute(housekeeping.cpumasks[type], cpu_online_mask);
>>   			if (likely(cpu < nr_cpu_ids))
>>   				return cpu;
>>   			/*
>> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
>> index c49aea8c1025..94133f843485 100644
>> --- a/kernel/sched/topology.c
>> +++ b/kernel/sched/topology.c
>> @@ -2101,7 +2101,7 @@ int sched_numa_find_closest(const struct cpumask *cpus, int cpu)
>>   	for (i = 0; i < sched_domains_numa_levels; i++) {
>>   		if (!masks[i][j])
>>   			break;
>> -		cpu = cpumask_any_and(cpus, masks[i][j]);
>> +		cpu = cpumask_any_and_distribute(cpus, masks[i][j]);
>>   		if (cpu < nr_cpu_ids) {
>>   			found = cpu;
>>   			break;
>> -- 
>> 2.47.1
>>
>>
LGTM

Reviewed-by: Waiman Long <longman@redhat.com>

