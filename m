Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF111A76DE
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 20:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750537960; cv=none; b=aHVdSPPeFC1WgNxTobdU66ONEoHItIvjy3J0FHOWAxKF7ffvAK7+XsafTGIWZz51npqQRQHX57UDfJPEH+3UdcYkwbCntdNL4evibclRIFzJw+DEeIWrqia46f2o8y5ulvBk1bXZdnKHl+siVzVg1Fx3JqulcFbE0GOnHAAhfgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750537960; c=relaxed/simple;
	bh=8F7sWAL3IvLguIKcqjTOoceIv+azFUyktD7ekfWINOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ErnX5bdvypifm0RKK3hkBLcf/go6qcWFlKYHhXML8GtyL8HKRUQnhbszXRaEIfgj818NjecWBnHdt+nFXA/q6UJ5ozHeRi/oW5So1JKdFhdDQaEMqLLbwQZyBA7+WYxaKCeSZi4ORFYJtVhe18vJbkQR3FlxnJOCpfPzX2ml08I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rvb/BsZg; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rvb/BsZg"
Message-ID: <aa17c037-d83d-4f02-b212-ca12e43df577@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750537956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XtNRg6J7lcifqtX0/mWzB0hj5jWuXhrummsApoFZgHM=;
	b=rvb/BsZgzb1iqKUzX+wQeiIUU8IGS+jnL+2IFktXcQsSZDx1vc3IDREVGmp9IWytT2z9lD
	QAguudIhZlmPyQ6g72Vh3RKtuVIv3JfKXzKEmmxyVhWXKJhZKj+bUNZav+CJsxYrR9yCWu
	oxtuISpnF/DlPHQRYdMFg7JIHph+Hxw=
Date: Sat, 21 Jun 2025 21:32:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [patch 11/13] ptp: Split out PTP_MASK_EN_SINGLE ioctl code
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org
References: <20250620130144.351492917@linutronix.de>
 <20250620131944.408020331@linutronix.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250620131944.408020331@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 20/06/2025 14:24, Thomas Gleixner wrote:
> Finish the ptp_ioctl() cleanup by splitting out the PTP_MASK_EN_SINGLE
> ioctl code and removing the remaining local variables and return
> statements.
> 
> No functional change intended.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>   drivers/ptp/ptp_chardev.c |   35 +++++++++++++++--------------------
>   1 file changed, 15 insertions(+), 20 deletions(-)
> 
> --- a/drivers/ptp/ptp_chardev.c
> +++ b/drivers/ptp/ptp_chardev.c
> @@ -448,22 +448,28 @@ static long ptp_mask_clear_all(struct ti
>   	return 0;
>   }
>   
> +static long ptp_mask_en_single(struct timestamp_event_queue *tsevq, void __user *arg)
> +{
> +	unsigned int channel;
> +
> +	if (copy_from_user(&channel, arg, sizeof(channel)))
> +		return -EFAULT;
> +	if (channel >= PTP_MAX_CHANNELS)
> +		return -EFAULT;
> +	set_bit(channel, tsevq->mask);
> +	return 0;
> +}
> +
>   long ptp_ioctl(struct posix_clock_context *pccontext, unsigned int cmd,
>   	       unsigned long arg)
>   {
> -	struct ptp_clock *ptp =
> -		container_of(pccontext->clk, struct ptp_clock, clock);
> -	struct timestamp_event_queue *tsevq;
> +	struct ptp_clock *ptp = container_of(pccontext->clk, struct ptp_clock, clock);
>   	void __user *argptr;
> -	unsigned int i;
> -	int err = 0;
>   
>   	if (in_compat_syscall() && cmd != PTP_ENABLE_PPS && cmd != PTP_ENABLE_PPS2)
>   		arg = (unsigned long)compat_ptr(arg);
>   	argptr = (void __force __user *)arg;
>   
> -	tsevq = pccontext->private_clkdata;
> -
>   	switch (cmd) {
>   	case PTP_CLOCK_GETCAPS:
>   	case PTP_CLOCK_GETCAPS2:
> @@ -513,22 +519,11 @@ long ptp_ioctl(struct posix_clock_contex
>   		return ptp_mask_clear_all(pccontext->private_clkdata);
>   
>   	case PTP_MASK_EN_SINGLE:
> -		if (copy_from_user(&i, (void __user *)arg, sizeof(i))) {
> -			err = -EFAULT;
> -			break;
> -		}
> -		if (i >= PTP_MAX_CHANNELS) {
> -			err = -EFAULT;
> -			break;
> -		}
> -		set_bit(i, tsevq->mask);
> -		break;
> +		return ptp_mask_en_single(pccontext->private_clkdata, argptr);
>   
>   	default:
> -		err = -ENOTTY;
> -		break;
> +		return -ENOTTY;
>   	}
> -	return err;
>   }
>   
>   __poll_t ptp_poll(struct posix_clock_context *pccontext, struct file *fp,
> 
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
