Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 6376C1DFE09;
	Wed, 30 Apr 2025 07:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745997592; cv=none; b=YOFreC2W3kCa0lwQT06ryF84V0+aPPPTirIZdJOJ6xR+HAvK1xoUCVDIi3tB4wf2Aux4nvjx881Q6eCZC36cDwjE+8uXAnsVHsMEEQ2MZoGheJBoKHAqAoSY/dLH436fG2jGT2pdXfJhTHSfAUjEAAvmJuz0cjkNGTlCSEY1Jfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745997592; c=relaxed/simple;
	bh=asyKUuyUZ9C0o/uQdF7lBLo5mFr0FF/pBL+vIGX9a8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type; b=Wx2Lxz9Yj+xkKI8LNy3Vwo3IfQx6pZ+mHiSeBRG0POcqO31y6fB12COW0Orpj5OyyYkWrMkfLY7ut8+9572gL+vODTwwpSMmZ6zpYj+pQm/FZSMz5bcoQxXmwt6R06LKGBxHCb8DiYmVUeMGaitjinisAQATQNfqo6gLN9tOrlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from [172.30.20.101] (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id D376F602DF0D9;
	Wed, 30 Apr 2025 15:19:42 +0800 (CST)
Message-ID: <6608ee51-0dd9-45d9-ac17-a4e9b736ceb3@nfschina.com>
Date: Wed, 30 Apr 2025 15:19:42 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] alarmtimer: switch some
 spin_{lock,unlock}_irqsave() to guard()
To: Thomas Gleixner <tglx@linutronix.de>, jstultz@google.com, sboyd@kernel.org
Cc: dan.carpenter@linaro.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Content-Language: en-US
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <87v7qmp1t1.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/4/30 15:04, Thomas Gleixner wrote:
> On Wed, Apr 30 2025 at 11:27, Su Hui wrote:
>> -	spin_lock_irqsave(&rtcdev_lock, flags);
>> -	if (!IS_ERR(pdev) && !rtcdev) {
>> -		if (!try_module_get(rtc->owner)) {
>> +	scoped_guard(spinlock_irqsave, &rtcdev_lock) {
>> +		if (!IS_ERR(pdev) && !rtcdev) {
>> +			if (!try_module_get(rtc->owner)) {
>> +				ret = -1;
>> +				break;
> This really reads odd and relies on the internals of scoped_guard(). I
> actually had to look at the scoped_guard() implementation to validate
> it.
>
> The whole thing can be simplified to:
>
>   	scoped_guard(spinlock_irqsave, &rtcdev_lock) {
> 		if (!IS_ERR(pdev) && !rtcdev && try_module_get(rtc->owner)) {
>   			rtcdev = rtc;
>   			/* hold a reference so it doesn't go away */
>   			get_device(dev);
>                          pdev = NULL;
> 		} else {
>   			ret = -1;
> 		}
>
> No?
Yes, it's simpler and better.
> No need to resend. I fixed it up already.

Thanks a lot :).

Su Hui

