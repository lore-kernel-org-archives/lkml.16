Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7991552F5
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738909698; cv=none; b=Yr+gNOq4nNa9KswjWfLdyYU9+DBjEenISh+Y1/khZOffIcYWmB2zJa0Pf+rqFIb1b+YOO7TjNmHKCQ10dRSkFJkLyvlUfz0ruNSz0myFkHGc6OWgJCoe/HaEus4OL7SHD9ktH7MaLJ9GRk7NLT/9m2Igh0DMaJJ/I9+98TxQIKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738909698; c=relaxed/simple;
	bh=lYWhFvuV1qciqW9BNvk+T24o7MhzyOdEN6qRDw0hU1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d6Mx5+kRcAxgkKQcywsNztWQsO0cCwk5cUFan6IOgXhWShFXclxUBC++2f8D2ucvZWe8H1hd9U+WDIff5gdLGp8kb4lwMh0ro01J5GPe6TYY7jWoCwNXPMXaY4IfVdRuGqfPfiXCVd7f7FkTAGmwzKNBjPqldXqfelCApmTFYaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=CG4e8Z+q; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="CG4e8Z+q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jb2l+oVbEpj/B+oQuY8QRQ8MFzZ4zeFis1BLttJBF9s=; b=CG4e8Z+qXX87bmmoXiwTcBS2Vp
	FnIHKiPPaLCWQYisJlXJcY3IzD77kMLWx3zgRvZ9AMQJb3BTc8vo2+s+gz3zxRb0WaKUgHAI1jvqn
	LbNQ2O4MjOeA0p/hZrHE0hWimZ+T/HFYFC4nCCKVAD9g0E9rTn3BwP+8kUW5XI748I9QtnRvWr5ri
	CIhWK6R8biADNYKZxdkD+5D1NlVY81lQ/Bk199v+tNkv3jokXgTs32rNqJenls8R/3AfYj9tM0GnH
	qWJvR5qUN87sIkG+yZcHGxU5yvEwZ1E/pPK+l7JPP4MBklU7ENXHuZ7gYQq5W2oPbT6KyizwLVHSq
	DBw5Jb/Q==;
Received: from [58.29.143.236] (helo=[192.168.1.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1tgHqK-005gUB-1p; Fri, 07 Feb 2025 07:28:06 +0100
Message-ID: <612ce321-893a-468c-bbda-0220edab5036@igalia.com>
Date: Fri, 7 Feb 2025 15:28:01 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] sched_ext: Add an event, SCX_EV_ENQ_SLICE_DFL
To: Andrea Righi <arighi@nvidia.com>
Cc: tj@kernel.org, void@manifault.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
References: <20250207031338.393045-1-changwoo@igalia.com>
 <20250207031338.393045-2-changwoo@igalia.com> <Z6WlegLUWJjLD7eZ@gpd3>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <Z6WlegLUWJjLD7eZ@gpd3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrea,

On 25. 2. 7. 15:17, Andrea Righi wrote:
> Hi Changwoo,
> 
> On Fri, Feb 07, 2025 at 12:13:37PM +0900, Changwoo Min wrote:
>> Add a core event, SCX_EV_ENQ_SLICE_DFL, which represents how many
>> tasks have been enqueued (or pick_task-ed) with a default time slice
>> (SCX_SLICE_DFL).
>>
>> Scheduling a task with SCX_SLICE_DFL unintentionally would be a source
>> of latency spikes because SCX_SLICE_DFL is relatively long (20 msec).
>> Thus, soaring the SCX_EV_ENQ_SLICE_DFL value would be a sign of BPF
>> scheduler bugs, causing latency spikes.
>>
>> __scx_add_event() is used since the caller holds an rq lock,
>> so the preemption has already been disabled.
> 
> We may want to consider select_task_rq_scx() as well, when ops.select_cpu()
> is not implemented (or during rq_bypass).
> 
> In this case, if scx_select_cpu_dfl() finds an idle CPU, we implicitly
> dispatch the task to the local DSQ with SCX_SLICE_DFL.

You are right. I will add it too.

Thanks!
-- Changwoo
