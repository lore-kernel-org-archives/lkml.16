Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6919C33987
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738218144; cv=none; b=C3Hqrvr3VBVVV51ITXS9VTvy7AXMMMH1PQF/UZngMpPA+5INLk88xC6qTZPdQuPn5ASmP7AfYBIv4WDpd/V8kO+EggmTltlNh6HKG1tCVcT69Dsx+B51Is1iBCeXagI0G+HY98OJcC0zxcZQAx2OaQhsRIV5Hs7S7i61U/UXJaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738218144; c=relaxed/simple;
	bh=1MX2rrLGvDie6tq5jpZxvn4X2d015bpLk/dACYtmmk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ns+Oce+BE4jOG+LS0FS9FNSwrxU09R0peOs+DM97o74uEOgveWocbdpqKGhJiUOg5FhzIRFa0rVwqy4NPzW5Pr+k+QKQkJcGBiBFhw4v88oh3JP0C2lqKfOFbYZBs2tqu/3Od0qSPCZ0pZnxkDOxKshFiChxmZnByrQgCsfYuak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=TujmvX77; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="TujmvX77"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RFSj2VtyaOI9nXRS3Pcyw7B6NnB5qRrjdlQp4YyOtzM=; b=TujmvX77ouFqmvshzF329GfiwH
	XJ3HR+WshorO0AZGl/26SY2ZLvNK/BX+2SXpdXtQs0g4FGR8r+2w/jc90BpGGDqBKE+JPrKfbpURz
	iGZlkaR5b8HnybYepdsn95HuWGtBZcxmq2z7xcIGM6IS9BZT7SC0c8vTyfGzMWK+7RGcJavYDTY4A
	gbF3JMbd+BJ3GPxhGJi6kzv5L01HiwH71A/z5YdwWH/tNeIAiLq0d0Xex/RhKRdawT1lxrBBanTST
	wXJlQ3LiQf9T1k+8MvXOU34dagIa31mcm46onugEoX6dNrjC/JWRSGRFrGGyroBCtY0hr4XRHcTEL
	j49ugRPg==;
Received: from [58.29.143.236] (helo=[192.168.1.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1tdNwG-000ut5-6v; Thu, 30 Jan 2025 07:22:14 +0100
Message-ID: <fe75af77-f832-4edd-bd33-40e047f89210@igalia.com>
Date: Thu, 30 Jan 2025 15:22:08 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] sched_ext: Add an event, SELECT_CPU_FALLBACK
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
References: <20250126101614.232388-1-changwoo@igalia.com>
 <20250126101614.232388-4-changwoo@igalia.com>
 <Z5fmJHcuKG4hfDbJ@slm.duckdns.org>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <Z5fmJHcuKG4hfDbJ@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 25. 1. 28. 05:01, Tejun Heo wrote:
> Hello,
> 
> On Sun, Jan 26, 2025 at 07:16:06PM +0900, Changwoo Min wrote:
> ...
>>   struct scx_event_stats {
>> +	/*
>> +	 * If ops.select_cpu() returns a CPU which can't be used by the task,
>> +	 * the core scheduler code silently picks a fallback CPU.
>> +	 */
>> +	u64		SELECT_CPU_FALLBACK;
> 
> As C has one global namespace, we're gonna have to prefix these. Hopefully,
> something not too long. SCX_EV_?

Sure, I will add SCX_EV_ as a prefix for all events.

> 
>> @@ -3663,6 +3668,10 @@ static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flag
>>   		cpu = SCX_CALL_OP_TASK_RET(SCX_KF_ENQUEUE | SCX_KF_SELECT_CPU,
>>   					   select_cpu, p, prev_cpu, wake_flags);
>>   		*ddsp_taskp = NULL;
>> +
>> +		if (unlikely(!is_cpu_allowed(p, cpu)))
>> +			__scx_add_event(SELECT_CPU_FALLBACK, 1);
> 
> This is trying to guess what select_task_rq() is going to do and then count
> that as an event, which doesn't seem great. Can't we just record the picked
> CPU here into a field in p->scx and then compare that against cpu_of(rq) in
> enqueue_task_scx()? That way, we can reliably count events where CPU
> selection was modified by the fallback logic regardless of why or how that
> happens.

That sounds good. I will add a field (say, selected_cpu?) to struct 
sched_ext_entity.

Regards,
Changwoo Min
