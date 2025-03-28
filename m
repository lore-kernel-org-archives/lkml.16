Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F12321148B;
	Fri, 28 Mar 2025 06:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743144973; cv=none; b=jgmuHB6UG3WkYHnnQhu86gnK4SZb/QCq0mOyiVBNdUOKd9y47qnx6HD5xhAegIoG5Ksp2zT/OMKVfAQKOH4iZTI8jK41YjN10V8yRd1fuCoseOwU2vIgams7zqIikxW6JqyEeMXLlUKWvulIG2ANhOKRvUdJbvL/4Ek6pevXanY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743144973; c=relaxed/simple;
	bh=girAeiU1nvHmPVe/HwSgH1EDdaLbZjRROtuzouEoOhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OLSw+KjI7xaVcxDLo+7Tf2Qh+lY161qWW36smJpVxWgoBeZvgOlVl9wMXx/LVT7LgVKDqOBRROTBYSx+L2ZIYaXitqbolBS3HjfA5lCdlsh9+q1PFUbnEbbqqDGe7eAPGNz0IKgNIPSwfkYY27WwvhuC9ia9gLONNRyj+T7gEGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=TMZ6eJOx; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="TMZ6eJOx"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1743144960; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=cp3kRT9T60cU89da3zU0tJ+qWmIruaivqUKPaXLnluw=;
	b=TMZ6eJOxgSu8OoxB/OWQgvcp4NKyM67aYJsXLIUwlReIjUslGzojzf8Iw1meIA7Vj5GubPPcHdUCpXcEXTXLeihXfaDFlzd3NwHIt3h2KXImGZJfA8l4bcx9peQ89596zNAE/FmeifVhXIBydcA3t0GQmRD5QbKeDL5tQhn8/Ts=
Received: from 30.74.129.60(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WTDUdpo_1743144959 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 28 Mar 2025 14:56:00 +0800
Message-ID: <c3a815ab-7c52-40fa-a06a-f838c00f19bf@linux.alibaba.com>
Date: Fri, 28 Mar 2025 14:55:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CVE-2023-53027: erofs: fix kvcalloc() misuse with __GFP_NOFAIL
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org,
 linux-cve-announce@vger.kernel.org
References: <2025032719-CVE-2023-53027-dc56@gregkh>
 <7e5c7a5e-8853-4a9d-983d-b51cb416e078@linux.alibaba.com>
 <2025032816-compress-balcony-e6f7@gregkh>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <2025032816-compress-balcony-e6f7@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/3/28 14:53, Greg Kroah-Hartman wrote:
> On Fri, Mar 28, 2025 at 02:43:04PM +0800, Gao Xiang wrote:
>> Hi,
>>
>> On 2025/3/28 00:44, Greg Kroah-Hartman wrote:
>>> Description
>>> ===========
>>>
>>> In the Linux kernel, the following vulnerability has been resolved:
>>>
>>> erofs: fix kvcalloc() misuse with __GFP_NOFAIL
>>>
>>> As reported by syzbot [1], kvcalloc() cannot work with  __GFP_NOFAIL.
>>> Let's use kcalloc() instead.
>>>
>>> [1] https://lore.kernel.org/r/0000000000007796bd05f1852ec2@google.com
>>>
>>> The Linux kernel CVE team has assigned CVE-2023-53027 to this issue.
>>
>> I think this CVE is invalid since it was then reverted by
>> upstream commit 647dd2c3f0e1 ("erofs: Revert "erofs: fix kvcalloc()
>> misuse with __GFP_NOFAIL"")
>>
>> since it's not the correct way to fix this.
> 
> Ah, that commit was not in the "normal" revert style, which is why we
> didn't notice that.

Yeah, that is somewhat awkward.. Anyway, backport this incorrect
fix due to a CVE just makes it worse.

> 
> I've now rejected this CVE id, thanks for letting us know!

Thanks!

Thanks,
Gao Xiang

> 
> greg k-h

