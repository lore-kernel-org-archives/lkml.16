Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB481B3925
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 11:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751888053; cv=none; b=r+Dn2mr91iiSqniO60kJVQiEK5QvVvCubw+dksLS8ZFiQNB1y5I11X9h+5hf7oTTZdhew4kcfyl5JH/u+VWqn0xTgv9USyT+jX7TiDq7BGyoT6xtlENqkYwnNl9iSwNI8V3xEF7si5+FhOtus6pBL7NRiQmha8bO9i6gubYPNIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751888053; c=relaxed/simple;
	bh=sAKjPTfUXAQ4QYfeaWo7JF8OM0oDpt770C7K8MvIvAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t/X8VvxSmnFJXp/2xH6/I955fMow/SJ7fukJRHE/WNWCXyWptdxQOh8erH/KBTaMGDCBXnCZLCqErtlb7lkZxRwQBT1Ap3lRItDMj3Xt0/+HsAL7i684Sxp6WkHstZGxUxm0TBZmPo4FJpxuk0IkQyi5YSoVjk+pV2gqvOodkB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=kqygEfno; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="kqygEfno"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751888041; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=uBdpiyc+2d429rDFYCZo5jGAK67BFk1kVNL8eKXs99c=;
	b=kqygEfnowQiFyHHQFpjmXBq/zf30wnaP5U/XX6jdzJNJAuWUGEKkw/M3PHmpHitWuar4iTkpjeVMrofQjlEdnBi57mhWdpLSDZK/uRqJXmyos7+5KYL02l36mdzlbyElRBrZsfGqvDn1AN3dJd9bt7d+pPXZ1NOxP5NyaGdsimE=
Received: from 30.170.233.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0Wi7a3Js_1751888039 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Jul 2025 19:34:00 +0800
Message-ID: <f2b5d473-7ca0-4800-bcd7-0049fcd9b717@linux.alibaba.com>
Date: Mon, 7 Jul 2025 19:33:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] erofs: fix to add missing tracepoint in erofs_readahead()
To: Chao Yu <chao@kernel.org>, xiang@kernel.org
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>
References: <20250707084832.2725677-1-chao@kernel.org>
 <c911e159-d216-4b0f-865b-f4524e6f8f0f@linux.alibaba.com>
 <0b45c2d9-a610-4839-baa6-75041a6c37d5@kernel.org>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <0b45c2d9-a610-4839-baa6-75041a6c37d5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/7/7 19:22, Chao Yu wrote:
> On 7/7/25 18:17, Gao Xiang wrote:
>>
>>
>> On 2025/7/7 16:48, Chao Yu wrote:
>>> Commit 771c994ea51f ("erofs: convert all uncompressed cases to iomap")
>>> converts to use iomap interface, it removed trace_erofs_readahead()
>>> tracepoint in the meantime, let's add it back.
>>>
>>> Fixes: 771c994ea51f ("erofs: convert all uncompressed cases to iomap")
>>
>> Thanks Chao, btw, should we add tracepoint to erofs_read_folio() too?
> 
> Xiang, I guess it is useful for debug if we can add it, let me figure out
> a patch for that?

Yes, it's up to you if you'd like to submit anothe patch for this.

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang
