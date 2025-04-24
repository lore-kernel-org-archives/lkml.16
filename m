Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA13C502B1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745496153; cv=none; b=ApftnyV9moFr01sAtQ+dLBuVRnZ+AVizwzUNotRB/JINhjQ517odMje/v4KqX4bqgVlnzeDpqauJDYlmBbs6jpkrcDlAR1U/KRhviEeMCSd6FTIFzHBJpPSTKXyKksOUl/xhiAjb+NAtWEUQVgzPqdCOxvyDOYeCgYZxitKwavg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745496153; c=relaxed/simple;
	bh=wcbCfiAWSGpQ9pXedo4qXRwmPqPw8uGlsBveCmmZj9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YkEETWiiD9HIFuoqafYrf20IYbOh95tt9oAv68/7a6MZKlEsL3hni7ETVl4atq43ixG7q0EFkVA8A05Gw+lCwphE3IXM1gYulWLOU94nJFnSB97hC1uHZ8xjIo21Jz+M/UKbX3ZKiE1tguYDNKWA1YxyB9W4ByBoKi3VTVue7Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=fp+lPcCb; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="fp+lPcCb"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1745496141; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=gkOUV6sGAuQr29EThkOThv0b6KbqR66Yzqjl3hHT0Ss=;
	b=fp+lPcCbhh/b+XDsoMosddXr7mtItgkxCQEQ02Wcfbpj+lAZHQll526hZyaf1DzrpFpb3+8jkZYQD/bjIjOF5bmMKH5ii7V/XRHoF0HA/HCijpvrD3T43sDYDQHKstshEaNq8QgSThwVI/RPv4hd99F56rnNidDU3ltxaIq1NhI=
Received: from 30.134.100.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WXzKPyD_1745496140 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 24 Apr 2025 20:02:20 +0800
Message-ID: <b286966f-abf3-47a8-85a7-6856784a4c43@linux.alibaba.com>
Date: Thu, 24 Apr 2025 20:02:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
To: Sandeep Dhavale <dhavale@google.com>
Cc: linux-erofs@lists.ozlabs.org, Gao Xiang <xiang@kernel.org>,
 Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org
References: <20250423061023.131354-1-dhavale@google.com>
 <94c702b9-cad5-4727-a7f1-16de1827841e@linux.alibaba.com>
 <CAB=BE-SwcvC0sDXAVoK+C9V8Ags+1VanWY_n1hgg8k+UmKH+0A@mail.gmail.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <CAB=BE-SwcvC0sDXAVoK+C9V8Ags+1VanWY_n1hgg8k+UmKH+0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/4/24 14:04, Sandeep Dhavale wrote:
>> I could fix up this part manually if you don't have strong
>> opinion on this.
>>
> 
> Hi Gao,
> I don't have any objection to styling as it is subjective. I am ok
> with the fixup.

Ok, thanks for the confirmation!

Thanks,
Gao Xiang
