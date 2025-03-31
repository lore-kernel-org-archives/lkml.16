Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F3014D428
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 03:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743391703; cv=none; b=raORiC4Gm5xT34Y0Z5AC5jmMqeqoxye8MLF77iHZYxGEkvNN5sU/EgD9mZ3M6zTTduuRc6GHJWnhHuBNVB/lkDIo/XeHLdY2XHgzdzdm3Zkvr++sMD76fcuaZxzvc647DpOWUtsmEHF4auMM4eq/3WkU70mRGSg5dJtCQ3Hd2qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743391703; c=relaxed/simple;
	bh=/q906IFvb9J+A53LL7iWuLoLk5hze90Az41HqbZhHQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9zD05rbB0xXkWEvH3gsvjy/XQwQXWs6+cW0k5HdJwvapH4lnnhboq3Xq+ri2/FAMHqNTJvKGB8yHDQ3S8JE0cBhb4H13PMiVcquSIqSYgUShatjnd6TdueAHmjemhBLGXeb20Tcr+4MsqFPumKtS/hyhzwgGJq2POIFEMj5FE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=mZzc2bZG; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="mZzc2bZG"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1743391696; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=NADBr/d3flraf0wF9z+q9LSnttyURdpjOtRNoIb5bdQ=;
	b=mZzc2bZGwB1LLE0WaSqg/rr8URPPpl0dROVFFQgo1fr+vbERaw683glOqtTPTjbOnZNziT/zlsqIxOdY4mLZ+YPhZw0o7O0d4I2OVXUi8vSwIom7bjOBlXH3lDFp7af7cYyDRmyvK66mHtd28x2TSWkrInTfzR3KZa/bDsf0CQU=
Received: from 30.221.130.198(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WTP6l9M_1743391694 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 31 Mar 2025 11:28:15 +0800
Message-ID: <330276be-f9cb-4263-85f5-20fe2e10cf72@linux.alibaba.com>
Date: Mon, 31 Mar 2025 11:28:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
To: Sandeep Dhavale <dhavale@google.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-erofs mailing list <linux-erofs@lists.ozlabs.org>,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>
References: <20250331022011.645533-1-dhavale@google.com>
 <20250331022011.645533-2-dhavale@google.com>
 <45548d9e-4cfa-476d-9eaa-b338f994478c@linux.alibaba.com>
 <CAB=BE-S6Brg0e277mdY-d3ZwrGeUe3idz37_FJVaTesAFTGfnQ@mail.gmail.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <CAB=BE-S6Brg0e277mdY-d3ZwrGeUe3idz37_FJVaTesAFTGfnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/3/31 11:14, Sandeep Dhavale wrote:
> Hi Gao,
>> Do we really need to destroy workers on the last mount?
>> it could cause many unnecessary init/uninit cycles.
>>
>> Or your requirement is just to defer per-CPU workers to
>> the first mount?
>>
>> If your case is the latter, I guess you could just call
>> erofs_init_percpu_workers() in z_erofs_init_super().
>>
>>> +{
>>> +     if (atomic_dec_and_test(&erofs_mount_count))
>>
>> So in that case, we won't need erofs_mount_count anymore,
>> you could just add a pcpu_worker_initialized atomic bool
>> to control that.
>>
> Android devices go through suspend and resume cycles aggressively.
> 
> And currently long running traces showed that erofs_workers being
> created and destroyed without active erofs mount.
> Your suggestion is good and could work for devices which do not use
> erofs at all.

> But if erofs is used once (and unmounted later),> we will not destroy the percpu workers.

Is there a real use case in Android like this?  It
would be really useful to write down something in the
commit message.

> 
> Can you please expand a little bit more on your concern
>> it could cause many unnecessary init/uninit cycles.
> Did you mean on the cases where only one erofs fs
> is mounted at time? Just trying to see if there is a better
> way to address your concern.

My concern is that it could slow down the mount time (on
the single mount/unmount) if there are too many CPUs
(especially on the server side.. 96 CPUs or more...)

Or I guess if kworker CPU hotplug is not used at all
for Android if "suspend and resume" latency is really
important, could we just add a mode to always initialize
pcpu kworkers for all possible CPUs.

Thanks,
Gao Xiang
