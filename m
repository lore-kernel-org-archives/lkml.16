Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4611D213245
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751021976; cv=none; b=TwefqXJkaehHTEGq9iFFds0OcPFKmEEeERFvwxC2MSHQaGJ5ZRcvc1U+3KGhTr02B+KIU5FYUhJJ8Ts0EURTqhbdOgxDqUycl8yJOHdHdTp2EIFgfyJKpN/iXVcqrID+nf9aCoD1YbCf4lG0c2LxndeDQmRqa7nqXHLy01+ccgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751021976; c=relaxed/simple;
	bh=39gN++uwgGwGLSo2gokp672iTbncWZeBhi5bw8aVGIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OFauIqt0s8fGm8P4vF5786LEiJ233/u5gCCRMB7dg2xZHLq7hUQD0Pz/uVNhKuoj1SmBimIUGTaxTNqBKcUAAG4cZzb5uHlAcfvg9zrPZS1cuIm3D/bMrMc1MNJkabNF/uz44yjGDCwxvlZAhNwM2qEQXQ3dd1xxwtSP4TTuOuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XHxE/uur; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XHxE/uur"
Message-ID: <99debaac-3768-45f5-b7e0-ec89704e39eb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751021962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JjguqjJZC4qCc9HtUNpoE0e/vnTdVxVLwPIy2Ll+L7w=;
	b=XHxE/uur93hLzj36h+LmCV8eehMuMM7Cq6rRf3AJmJ4uIK9hPJcLBSXXD/LJM61yoo9xcp
	O23Yiuv8UkhzT5JrwnUQ2mqaF9qidQBtUCpHllOE1yZkBSbrHJJlpJeaQA9AQx+bK9f05R
	AZZsSv9TQ0NrHWHJH8aUizEQbuRMxY4=
Date: Fri, 27 Jun 2025 11:59:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2] ptp: add Alibaba CIPU PTP clock driver
To: Andrew Lunn <andrew@lunn.ch>, Wen Gu <guwen@linux.alibaba.com>
Cc: richardcochran@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 xuanzhuo@linux.alibaba.com, dust.li@linux.alibaba.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627072921.52754-1-guwen@linux.alibaba.com>
 <0b0d3dad-3fe2-4b3a-a018-35a3603f8c10@lunn.ch>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <0b0d3dad-3fe2-4b3a-a018-35a3603f8c10@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 27/06/2025 08:57, Andrew Lunn wrote:

>> +static int ptp_cipu_enable(struct ptp_clock_info *info,
>> +			   struct ptp_clock_request *request, int on)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static int ptp_cipu_settime(struct ptp_clock_info *p,
>> +			    const struct timespec64 *ts)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static int ptp_cipu_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static int ptp_cipu_adjtime(struct ptp_clock_info *ptp, s64 delta)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
> 
> I've not looked at the core. Are these actually required? Or if they
> are missing, does the core default to -EOPNOTSUPP?
> 

I was going to say that these are not needed because posix clocks do
check if callbacks are assigned and return -EOPNOTSUPP if they are not.
That's why ptp_clock_* functions do call these callbacks without checks.
