Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDF018AE2
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747914249; cv=none; b=EaPXMN8684BiZSstBj07oMUcZzZJjGOqdFvGKtkpS3CfXfIF8h8zz2bSBBGx4089IkzWDntsIcLo92TllUv0ZdFdnxcSObUfqM8KPPnmnj+lWo+PQeLTZgzNmsbnklE9PLSlqIuDZ6xOZE++iNKix26NgafgQ8pkCn7oUCoE3M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747914249; c=relaxed/simple;
	bh=aA051IGnY08mz30U8sUC3vYQeiRwXUoCUsJa4T5HHjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ScKRLTGTDnewwygr60EQdeRDt87VRbKLmtzMgOGIx9SOb3U95tTy6LbywECacjA/hRUYVYeAPHm047M02iF8mXR6GzE5OeNQbGPVXBSMEfMjRFHVWBiuR4jwgaZXphO0m0FQg1m42Bpda22gbQKhd4lRpIV2ALe6MKrye56r/Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bvUuqtym; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bvUuqtym"
Message-ID: <a129d146-755f-4559-9851-2babf173148a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747914243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9K4Mk1ZusyhH3AFdGbF1d/JqWLRIFqMLTBosEzyOIT8=;
	b=bvUuqtymL/u1DI5qRvRxxjROerO9e4d/mHFls73iXCNkzvNXFX3PsaJSAqPDweXOmrXsV9
	XqK8M/E+8N9wZrONAo73I1uU+xDeu/Tg93zqQ2vcdiklOzvqJGQkZ+TgG/JvugnQL+E2uJ
	WLmMO6+nAt+mckoO4L4Hjux+t+9DfOM=
Date: Thu, 22 May 2025 19:43:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [External] Re: [PATCH 2/7] sched/fair: prepare throttle path for
 task based throttle
To: Aaron Lu <ziqianlu@bytedance.com>
Cc: Valentin Schneider <vschneid@redhat.com>, Ben Segall
 <bsegall@google.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Josh Don <joshdon@google.com>,
 Ingo Molnar <mingo@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Xi Wang <xii@google.com>,
 linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 Chuyi Zhou <zhouchuyi@bytedance.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 Florian Bezdeka <florian.bezdeka@siemens.com>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-3-ziqianlu@bytedance.com>
 <871cf7c1-951c-4ddd-9800-db96e050c6d9@linux.dev>
 <20250521092155.GA24746@bytedance>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chengming Zhou <chengming.zhou@linux.dev>
In-Reply-To: <20250521092155.GA24746@bytedance>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2025/5/21 17:21, Aaron Lu wrote:
> On Wed, May 21, 2025 at 05:01:58PM +0800, Chengming Zhou wrote:
>> On 2025/5/20 18:41, Aaron Lu wrote:
>>> From: Valentin Schneider <vschneid@redhat.com>
>>>
>>> In current throttle model, when a cfs_rq is throttled, its entity will
>>> be dequeued from cpu's rq, making tasks attached to it not able to run,
>>> thus achiveing the throttle target.
>>>
>>> This has a drawback though: assume a task is a reader of percpu_rwsem
>>> and is waiting. When it gets wakeup, it can not run till its task group's
>>> next period comes, which can be a relatively long time. Waiting writer
>>> will have to wait longer due to this and it also makes further reader
>>> build up and eventually trigger task hung.
>>>
>>> To improve this situation, change the throttle model to task based, i.e.
>>> when a cfs_rq is throttled, record its throttled status but do not remove
>>> it from cpu's rq. Instead, for tasks that belong to this cfs_rq, when
>>> they get picked, add a task work to them so that when they return
>>> to user, they can be dequeued. In this way, tasks throttled will not
>>> hold any kernel resources.
>>>
>>> To avoid breaking bisect, preserve the current throttle behavior by
>>> still dequeuing throttled hierarchy from rq and because of this, no task
>>> can have that throttle task work added yet. The throttle model will
>>> switch to task based in a later patch.
>>>
>>> Suggested-by: Chengming Zhou <chengming.zhou@linux.dev> # tag on pick
>>> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
>>> Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
>>
>> I'm wondering how about put 02-04 patches together, since it's strange
>> to setup task work in this patch but without changing throttle_cfs_rq(),
> 
> Do you mean 02-05?
> Because the actual change to throttle_cfs_rq() happens in patch5 :)

Ah, right.

> 
>> which makes the reviewing process a bit confused? WDYT?
> 
> Yes, I agree it looks a bit confused.
> 
> The point is to not break bisect while make review easier; if merging
> all task based throttle related patches together, that would be to put
> patch 02-05 together, which seems too big?

Yeah, a big patch but complete, instead of changing a bit on the same
function in each patch. Anyway, it's your call :-)

Thanks!

> 
> Thanks,
> Aaron
> 
