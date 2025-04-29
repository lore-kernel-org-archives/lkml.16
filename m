Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DA426C3B5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906757; cv=none; b=pUGlATEBuLSjLJb3KDQ818XuWOaZxizRpQBn7x7OKeTq8342V79JNNI7tH91vItq0KEDYMmRiFZcGpHePQw5asR5kRrG2ookM0PTl5oCW3LU0omrgxnAL3KnsJ2J5UOyQSywOscEDpuuucCAaSKEkeKcbTMC/9NDNU2zd9orj5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906757; c=relaxed/simple;
	bh=osey/MsMTgZ5rcmu+YckxKbf+eT/klV73D3B34U5ERw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oFdyjzBO8JW2+u7YmZ7yCx61Xr2OoSibgTfMwrkof2UDd5iDq7CxoVYYahsZ0tRrXwnurFB15W+hF1CvdJu6yMXK+OWH180GOZTimy02Unw45lFDmT8fMCLlr0nAnpUy5Ub26mBLrNaGuaub5mr3PWDkCK82KJXVmfzHhKeePfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rjVmOTkn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rjVmOTkn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A861BC4CEE3;
	Tue, 29 Apr 2025 06:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745906757;
	bh=osey/MsMTgZ5rcmu+YckxKbf+eT/klV73D3B34U5ERw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=rjVmOTknBYqZDyu4xqC3gzzRqAGU8STvlr8+VcbXcFQ4a15jcCELyRv2Odzws/AOR
	 j0L2DX8DpFvxGEKP+G2eSOQGqKx4isFxzv/aDaSjAerMwIVJSCjEgl2JibiRCr6zmw
	 hm9zXms6cTOHv2tnKugtP7YkgNFCUyrmeiWOqB5aC91lgCFm1GjNl/Zbfz4DvxV9tz
	 PQmteP3QxQSaMBOXINAkapuLYF5XKop15TrkPbfLTGLhg98rG/Y8t+kHoM7a7jd2DD
	 sbaaprAnCC13BfgAsJnX7LlgmODrS1fzQd9JnTY8H9nC3uDQx+23BemGL+gRZxpmSY
	 Bs10lG8HiaKvQ==
Message-ID: <aced334a-e542-42b9-ade4-00f6773c2d45@kernel.org>
Date: Tue, 29 Apr 2025 14:05:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-erofs@lists.ozlabs.org,
 Gao Xiang <xiang@kernel.org>, Yue Hu <zbestahu@gmail.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, hsiangkao@linux.alibaba.com,
 kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
To: Sandeep Dhavale <dhavale@google.com>
References: <20250423061023.131354-1-dhavale@google.com>
 <894ca2d3-e680-4395-9887-2b6060fc8096@kernel.org>
 <CAB=BE-Ru31S1Qq0Gmi9UXtaL6k4dcLdTUa-CJbmhuXb7a2dSeQ@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAB=BE-Ru31S1Qq0Gmi9UXtaL6k4dcLdTUa-CJbmhuXb7a2dSeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sandeep,

On 4/29/25 05:49, Sandeep Dhavale wrote:
> Hi Chao,
> 
>>
>> - mount #1                              - mount #2
>>  - z_erofs_init_pcpu_workers
>>   - atomic_xchg(, 1)
>>                                          - z_erofs_init_pcpu_workers
>>                                           - atomic_xchg(, 1)
>>                                           : return 0 since atomic variable is 1
>>                                           it will run w/o percpu workers and hotplug
>>   : update atomic variable to 1
>>   - erofs_init_percpu_workers
>>   : fail
>>   - atomic_set(, 0)
>>   : update atomic variable to 0 & fail the mount
>>
>> Can we add some logs to show we succeed/fail to initialize workers or
>> hotplugs? As for mount #2, it expects it will run w/ them, but finally
>> it may not. So we'd better have a simple way to know?
>>
>> Thanks,
>>
> What you have laid out as race, indeed can happen if
> erofs_init_percpu_workers() fails with ENOMEM. For me that is still
> not catastrophic as workqueue fallback is in place so the filesystem
> is still functional.  And at the next mount, the logic will be
> reattempted as the atomic variable is reset to 0 after failure.

Yeah, correct.

> 
> If you still think we need to have a log message, I will be happy to
> spin up the next revision with logging for ENOMEM.

I guess it will be good to add log for such case, thanks. :)

Thanks,

> 
> Thanks for the review!
> 
> Regards,
> Sandeep.

