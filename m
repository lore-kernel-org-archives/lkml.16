Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0425D2B9BB
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 21:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738705868; cv=none; b=na7GgqM1OwFbiqX6k5fM9FhI8qg++KFGYE9HBbYBDvH362r5ZI1c6Mb6TN8YB/eUE5evsJA425mKERrW1loEwzEgccyEmREroVnc0DRmh3qmjz1pRHSuIeppvF3Uq+iex4XEJrf6nFpPCVxiCtdwmIKojfdZnZAj41MUCD2m8TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738705868; c=relaxed/simple;
	bh=BLeKoGeLNsNMhd1coglg57y/v+PHncPIYOSj88oZLkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YS08Wlu7aDcArQbfnGYYL11B0pjVMYHQ/FDod2+OWSaU1C28f863cPnvHE6t0bEfSTj1MHVey1+PejbS9kxEGYwcFn+B7AWc5C7xYDHk+na4HlU84HE/Kv063VPFscoXzHJpRLXeLU5mdBhV0uKbabX4KfBklotLLNecR15MHg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lMLBIR2B; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lMLBIR2B"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514FmAVQ022131
	for <linux-kernel@vger.kernel.org>; Tue, 4 Feb 2025 15:51:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=b1RzSsEKe66AujfiZFZmfoJSdJLzI93zD82n+g9csGk=; b=
	lMLBIR2Brp57Xzy2ID9hGo/07qluiSfZHEBlh2jcG40YQO8BxZSIR2HOXCceC19y
	yjLLZ2IqvR5Tt59qBGB27OCaq4m2nRVkIESyL3VW/MZEvvvK0l3rsjsLPJ99IL6H
	iGEnefdaXabUqlKm5/uEVbW0i9yTV6fkqLewmd4B8k24mxWtkJm4HeHwvf45cpLb
	G0slL7yIwPctbm1eS/pqbr1OiAuQhkJlylDOZtYN17iDPmcCj8UDIv3XTFTmls9a
	KPGJHN6xMs8W1m/Swx/T+fUVj4WbyQhK9KtotbNoADPRnhzZPp5sMIxL4etQSe8C
	4PckdjJ7en01c5vEeGMK6A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 44hgwm3pen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 15:51:03 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 4 Feb
 2025 21:51:01 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 4 Feb 2025 21:51:01 +0000
Received: from [141.131.145.81] (ftrev.ad.cirrus.com [141.131.145.81])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 235B7820248;
	Tue,  4 Feb 2025 21:51:01 +0000 (UTC)
Message-ID: <fa2b3961-8e5d-4d56-9abe-c79a91f961f9@opensource.cirrus.com>
Date: Tue, 4 Feb 2025 15:51:00 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] firmware: cs_dsp: Check for valid num_regs in
 cs_dsp_wseq_multi_write()
To: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: Simon Trimmer <simont@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>
References: <20250131195639.1784933-1-ftreven@opensource.cirrus.com>
 <20250131195639.1784933-3-ftreven@opensource.cirrus.com>
 <Z6HmjEBIOfQYomXc@opensource.cirrus.com>
From: Fredrik Treven <ftreven@opensource.cirrus.com>
Content-Language: en-US
In-Reply-To: <Z6HmjEBIOfQYomXc@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EPv800ZC c=1 sm=1 tr=0 ts=67a28bc7 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=BfB9XW8-RVDWc0RkeQkA:9 a=QEXdDO2ut3YA:10
 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-ORIG-GUID: md0DEQn7mM1D1qiQrBzjikmPI6mUmwCI
X-Proofpoint-GUID: md0DEQn7mM1D1qiQrBzjikmPI6mUmwCI
X-Proofpoint-Spam-Reason: safe

On 2/4/25 04:06, Charles Keepax wrote:
> On Fri, Jan 31, 2025 at 01:56:33PM -0600, Fred Treven wrote:
>> If a value of 0 or below is passed into cs_dsp_wseq_multi_write()
>> the function will never enter its for loop.
>>
>> Verify that num_regs passed into the function is valid
>> and throw a user-visible error if not.
>>
>> Signed-off-by: Fred Treven <ftreven@opensource.cirrus.com>
>> ---
>>   drivers/firmware/cirrus/cs_dsp.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
>> index 56315b0b5583..aacf6960d1ea 100644
>> --- a/drivers/firmware/cirrus/cs_dsp.c
>> +++ b/drivers/firmware/cirrus/cs_dsp.c
>> @@ -3743,6 +3743,11 @@ int cs_dsp_wseq_multi_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq,
>>   {
>>   	int i, ret;
>>   
>> +	if (num_regs <= 0) {
>> +		cs_dsp_err(dsp, "Invalid number of regs: %d\n", num_regs);
>> +		return -EINVAL;
>> +	}
>> +
> 
> This feels a little defensive, do we really need to check for
> this? Normally num_regs is going to come from an ARRAY_SIZE or
> something.
> 
> Thanks,
> Charles

I see your point. The reason I wanted to add this, though, was because I fell
into the trap myself by mistakenly swapping the op_code input and the num_regs
input.

It then became very difficult to track down the mistake because there was no
condition to catch it in place.

If you feel strongly that I should drop this patch then I am okay with doing so.

Best regards,
Fred
