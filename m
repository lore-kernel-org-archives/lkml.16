Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9338D270EDD
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 20:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750539550; cv=none; b=PD3lHN/JjOzhhqsh/r0X/V8AO7W/37ahhWPNmFor0uqauk4teMdAxyJWH4bIqJy4i2EDzeA/Sf+unQiw5SylujCz8tWYKPdW1dS99Ji3uX5OKwtciMxI1/Ys07KGFs+0OD6XPo6J+J+HqpKm4np/nBU4luKxesQZuFZ6U0ii3Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750539550; c=relaxed/simple;
	bh=ca4d+gxAKuvrnYls+U6GGBbjws4awsx2KxQlPDlv/mk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GWteb6PQ37NYSvAmfYllJ5UniVFFsfgse9g6onlwJxlV74tMhj+tC/9SFp/C+82XiSIO8qjR3iC7vQH668nwr95PWOjo7CL+MK9FHFlng5Ofaowo86SlNMgOkWMteGtkRZMC6cMnAOsaA9Pa5c3wSymYJxU2+0uZWnEifkAaiSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xFoNDCfh; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xFoNDCfh"
Message-ID: <93b666e9-c9da-419e-bc9c-bf909b5fe2db@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750539543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GrezwRxn27vhw+tVfzftQm3l7p3ugozLQ4Dt+cwCRNE=;
	b=xFoNDCfh0hNxSd67miZmIYDu/A0vpwUY0zNirynWzWS6KJmGA4/CtKjzLMqyA+OFCcsQrd
	0vbWy8M2Z9WecLEqrrYbmXhq7MFljru5G4wIpv0HvcCJW98LPbM2NPPZstCAsULVD479RU
	Xeb862UreWT6oZq3YXeLw/xUL1uQJPg=
Date: Sat, 21 Jun 2025 21:59:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [patch 10/13] ptp: Split out PTP_MASK_CLEAR_ALL ioctl code
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org
References: <20250620130144.351492917@linutronix.de>
 <20250620131944.344887489@linutronix.de>
 <80052862-683c-4a53-b7a2-8d767a057022@linux.dev> <877c14q0yc.ffs@tglx>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <877c14q0yc.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 21/06/2025 21:44, Thomas Gleixner wrote:
> On Sat, Jun 21 2025 at 21:36, Vadim Fedorenko wrote:
>> On 20/06/2025 14:24, Thomas Gleixner wrote:
>>> Continue the ptp_ioctl() cleanup by splitting out the PTP_MASK_CLEAR_ALL ioctl
>>> code into a helper function.
>>>    	case PTP_MASK_CLEAR_ALL:
>>> -		bitmap_clear(tsevq->mask, 0, PTP_MAX_CHANNELS);
>>> -		break;
>>> +		return ptp_mask_clear_all(pccontext->private_clkdata);
>>>    
>>>    	case PTP_MASK_EN_SINGLE:
>>>    		if (copy_from_user(&i, (void __user *)arg, sizeof(i))) {
>>>
>>
>> Not quite sure there is a benefit of having a function for this type,
>> apart from having one style. But it adds some LoC...
> 
> Sure it's debatable benefit, but it makes the code more consistent and
> does not introduce this oddball in the middle of the other function
> calls.

Fair.

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
