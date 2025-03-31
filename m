Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C744526ACD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 03:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743392907; cv=none; b=SJcjbUk74HKiSYezwyvEdMxG4e1WT5YcDPtm5x+3/YVj0+uUVVoS6ZVH6iqz+JjwxF74x2CGjUYHuhFj81VLlFEXkVIaZvdyODa//oqpYvg6H7SLEDMb8ecBhOedpFXYwg6K4+r7wk0f0fCYcuk4SIdqRyGnocQyPG/XJdV+4Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743392907; c=relaxed/simple;
	bh=0VKRG3sPTHCNswUJ2CH75/nkqRx3tSrvLuZQ+az30JY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KDLMf9Q6EQEmhX47wqkUSH0iFJdxInVb6oJUgIgBPWxPhW4hl65yYluqRpS7qpUGYj1Mjbw24/Gr993ilZDsg1kqpv2clEzBDX/jEssKYcVno8WpzofnrJSkme1jqxfX0MDHEp6ihg11Mh78W3l2SfausKZ44dUM0vY/BZckiek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=QUaOMl2I; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="QUaOMl2I"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1743392902; h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
	bh=/1tccYnotOw1v33dWO3ti6U/9fTCRiTM35LlXUw0cOo=;
	b=QUaOMl2IuVBrumBmRsdbBLH4oHK0+3EbJUwSaGhm6BMFN9HVhTQaf7lRInS3mBcssggJL8rv5KWpLYx3oDV9W4jN9dSLTXqoTAtfVLnhstmLkIj5APKlXEWTnqNMx8YtEyYt7tXOLGRwMvRpRkJwYknFas6etF5rUrT0GOzO5gM=
Received: from 30.221.130.198(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WTPC6p8_1743392901 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 31 Mar 2025 11:48:21 +0800
Message-ID: <4492c013-4e59-425a-859f-5f8b30fb922d@linux.alibaba.com>
Date: Mon, 31 Mar 2025 11:48:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Sandeep Dhavale <dhavale@google.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-erofs mailing list <linux-erofs@lists.ozlabs.org>,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>
References: <20250331022011.645533-1-dhavale@google.com>
 <20250331022011.645533-2-dhavale@google.com>
 <45548d9e-4cfa-476d-9eaa-b338f994478c@linux.alibaba.com>
 <CAB=BE-S6Brg0e277mdY-d3ZwrGeUe3idz37_FJVaTesAFTGfnQ@mail.gmail.com>
 <330276be-f9cb-4263-85f5-20fe2e10cf72@linux.alibaba.com>
In-Reply-To: <330276be-f9cb-4263-85f5-20fe2e10cf72@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/3/31 11:28, Gao Xiang wrote:
> 
> 
> On 2025/3/31 11:14, Sandeep Dhavale wrote:
>> Hi Gao,
>>> Do we really need to destroy workers on the last mount?
>>> it could cause many unnecessary init/uninit cycles.
>>>
>>> Or your requirement is just to defer per-CPU workers to
>>> the first mount?
>>>
>>> If your case is the latter, I guess you could just call
>>> erofs_init_percpu_workers() in z_erofs_init_super().
>>>
>>>> +{
>>>> +     if (atomic_dec_and_test(&erofs_mount_count))
>>>
>>> So in that case, we won't need erofs_mount_count anymore,
>>> you could just add a pcpu_worker_initialized atomic bool
>>> to control that.
>>>
>> Android devices go through suspend and resume cycles aggressively.
>>
>> And currently long running traces showed that erofs_workers being
>> created and destroyed without active erofs mount.
>> Your suggestion is good and could work for devices which do not use
>> erofs at all.
> 
>> But if erofs is used once (and unmounted later),> we will not destroy the percpu workers.
> 
> Is there a real use case in Android like this?  It
> would be really useful to write down something in the
> commit message.
> 
>>
>> Can you please expand a little bit more on your concern
>>> it could cause many unnecessary init/uninit cycles.
>> Did you mean on the cases where only one erofs fs
>> is mounted at time? Just trying to see if there is a better
>> way to address your concern.
> 
> My concern is that it could slow down the mount time (on
> the single mount/unmount) if there are too many CPUs
> (especially on the server side.. 96 CPUs or more...)
> 
> Or I guess if kworker CPU hotplug is not used at all
> for Android if "suspend and resume" latency is really
> important, could we just add a mode to always initialize
> pcpu kworkers for all possible CPUs.

Ok, ignore this part after more thinking.

Thanks,
Gao Xiang
