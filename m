Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10548209681
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597874; cv=none; b=sTnAjmQG/3dxbk8TW4+J0mJ06WFpDTSiQ4ZH8UaLPp3P2plAWmQODClAFe3OzOlFiMfmk7xl8bXlGa556ruLNEfUGvfrexuIaCHtrl9TUHiGnXmtIJcnH9QMNddJ184wKBwflMaluLqcFdzVphq2EKTopIJfmXciaWwKQhY0mJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597874; c=relaxed/simple;
	bh=lMaK/K+RDFxOAFU0o9DWEGPlrM4YR72RaKYYPFOFA1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V4CjvM00b4yr0xDiXI3BUojbSJFcK+tDIusiSIePnnQw5lhy+RClhG/Z+8+GVoqjLZzGd8OcyHtYqjC2bHFb1aMrOCNznz+ajd3wf3YG0gn2j6sUvjbUBMuUPudNNB9+FzqVbfcSqwx2b8YxAND5El+E9lAzLwB0nyk+GssdV8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=lBesa8WJ; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="lBesa8WJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jfJqV6xJvqeZcbd6dJyII4Jk4SeOCxHX5F5W/AfHLCQ=; b=lBesa8WJm0pR1UCfiVG4AYFaLQ
	7Vcv362rhttqDtSAIwfikWpoTO3UjzCMI52yvj0jXKIYKKLTrHBWnZMN2rvXDstYMRGP9i0dosS+5
	q5UYqizX0MQHp2fIzFNzl0xDIi6i+Swlth/LmBejis4hvImvcvsRJCWonYK8zEEmcm40xhktRV7e2
	5fIB0PvVtjpbJMrQRb5Na5pqKQKr9hNOZzv9GAYuXz1Q1sFApdT5BosfrgkPNwj1NJqqqwkIBcflD
	aHq6JLZOzTSFkvRK7o/wgyMnMXKvm/dJn5tMFFZ6g3b/okvTqYDRThjmTvdc48j6W4OkEbDABa6jm
	dmH341bA==;
Received: from [58.29.143.236] (helo=[192.168.1.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1teyiz-0036H0-M3; Mon, 03 Feb 2025 16:51:07 +0100
Message-ID: <e1a028d8-3be2-4bea-961a-855de4626999@igalia.com>
Date: Tue, 4 Feb 2025 00:51:02 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/11] sched_ext: Add an event, SCX_EV_BYPASS_DISPATCH
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
References: <20250131070938.95551-1-changwoo@igalia.com>
 <20250131070938.95551-8-changwoo@igalia.com>
 <Z5-sgoiOGTJvB8e5@slm.duckdns.org>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <Z5-sgoiOGTJvB8e5@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 25. 2. 3. 02:33, Tejun Heo wrote:
> Hello,
> 
> On Fri, Jan 31, 2025 at 04:09:34PM +0900, Changwoo Min wrote:
> ...
>> @@ -2869,11 +2874,17 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
>>   	}
>>   
>>   	/* if there already are tasks to run, nothing to do */
>> -	if (rq->scx.local_dsq.nr)
>> +	if (rq->scx.local_dsq.nr) {
>> +		if (scx_rq_bypassing(rq))
>> +			__scx_add_event(SCX_EV_BYPASS_DISPATCH, 1);
>>   		goto has_tasks;
>> +	}
>>   
>> -	if (consume_global_dsq(rq))
>> +	if (consume_global_dsq(rq)) {
>> +		if (scx_rq_bypassing(rq))
>> +			__scx_add_event(SCX_EV_BYPASS_DISPATCH, 1);
> 
> Hmm... Wouldn't it be easier to count it from select_task_rq_scx() and
> do_enqueue_task()? The latter already has scx_rq_bypassing() condition and
> the former one can easily cache bypassing test result and use that in the
> else block.

That makes sense. I will change the code as you suggested.

> 
>> @@ -2899,10 +2910,16 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
>>   			rq->scx.flags |= SCX_RQ_BAL_KEEP;
>>   			goto has_tasks;
>>   		}
>> -		if (rq->scx.local_dsq.nr)
>> +		if (rq->scx.local_dsq.nr) {
>> +			if (scx_rq_bypassing(rq))
>> +				__scx_add_event(SCX_EV_BYPASS_DISPATCH, 1);
>>   			goto has_tasks;
>> -		if (consume_global_dsq(rq))
>> +		}
>> +		if (consume_global_dsq(rq)) {
>> +			if (scx_rq_bypassing(rq))
>> +				__scx_add_event(SCX_EV_BYPASS_DISPATCH, 1);
>>   			goto has_tasks;
>> +		}
> 
> The above can happen while bypass mode is being turned on but once on
> control doesn't even reach here, right?

You are right. I will clean this up.

Regards,
Changwoo Min
