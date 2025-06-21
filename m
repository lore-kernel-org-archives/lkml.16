Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A1326FA60
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 20:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750537534; cv=none; b=Lh4taTZUWRccnmWfvBeDWQ0rdAHqPlhLtXfWdzlaLIGlBCLYSOOD+ao47T+li7cmxZED5rcpgWBxX65TemrXDyQGHzo++rNgWVxi5gE2h5CRiWeEuXR0azxUFPlkRuumoFBqhGpCeurOLXTKK7ebjgpie+Qs9bOP7P8e7poRYI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750537534; c=relaxed/simple;
	bh=qvY0hpdxIdIjVB95CkSabIyYgt/+qqbupQulFr8eGBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e1bNfYfkLMZOPgkuslWgVXFUl8BkPQbKfJj7tdFwXsIriyp4MIUwRNyAF7CYNK0iMuQR1pjjKUmyX1FmFlVxwflzD+7T7vh+MxEzRtGmhKt/GUYLWxx9hg9jDjfv6R4Ckz2wxBQqUu6z8HMgh4LvLcE8EtEsOFOh5a5Hze3V4Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ipvmUzhs; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ipvmUzhs"
Message-ID: <36a40fe2-43ad-4fd9-8c3f-ec661ff4b7f1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750537527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DuIG/MQpIUp3xDBtFpD5odHACrwzzuTQ0EcjrdZ9AfE=;
	b=ipvmUzhsDAQcAKl8ReUIOB4Hm4EAK2veXwrJWIoFsuw8Zg8J8RltpzpxplpU4nAkXXJh70
	1jVCQLYfikUKhZdFOlmnc/bSJPOqMR2ukuRpBfpmNHSVEr4i7nMmLULvjW1l2LI3RbhHVy
	H1/YO0niY3o2emy41WaosulODpLRQgI=
Date: Sat, 21 Jun 2025 21:25:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [patch 04/13] ptp: Split out PTP_ENABLE_PPS ioctl code
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org
References: <20250620130144.351492917@linutronix.de>
 <20250620131943.967761848@linutronix.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250620131943.967761848@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 20/06/2025 14:24, Thomas Gleixner wrote:
> Continue the ptp_ioctl() cleanup by splitting out the PTP_ENABLE_PPS
> ioctl code into a helper function. Convert to a lock guard while at it.
> 
> No functional change intended.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>   drivers/ptp/ptp_chardev.c |   33 ++++++++++++++++-----------------
>   1 file changed, 16 insertions(+), 17 deletions(-)
> 
> --- a/drivers/ptp/ptp_chardev.c
> +++ b/drivers/ptp/ptp_chardev.c
> @@ -278,6 +278,18 @@ static long ptp_perout_request(struct pt
>   		return ops->enable(ops, &req, perout->period.sec || perout->period.nsec);
>   }
>   
> +static long ptp_enable_pps(struct ptp_clock *ptp, bool enable)
> +{
> +	struct ptp_clock_request req = { .type = PTP_CLK_REQ_PPS };
> +	struct ptp_clock_info *ops = ptp->info;
> +
> +	if (!capable(CAP_SYS_TIME))
> +		return -EPERM;
> +
> +	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &ptp->pincfg_mux)
> +		return ops->enable(ops, &req, enable);
> +}
> +
>   long ptp_ioctl(struct posix_clock_context *pccontext, unsigned int cmd,
>   	       unsigned long arg)
>   {
> @@ -290,13 +302,12 @@ long ptp_ioctl(struct posix_clock_contex
>   	struct ptp_sys_offset *sysoff = NULL;
>   	struct timestamp_event_queue *tsevq;
>   	struct ptp_system_timestamp sts;
> -	struct ptp_clock_request req;
>   	struct ptp_clock_time *pct;
>   	unsigned int i, pin_index;
>   	struct ptp_pin_desc pd;
>   	struct timespec64 ts;
> -	int enable, err = 0;
>   	void __user *argptr;
> +	int err = 0;
>   
>   	if (in_compat_syscall() && cmd != PTP_ENABLE_PPS && cmd != PTP_ENABLE_PPS2)
>   		arg = (unsigned long)compat_ptr(arg);
> @@ -323,21 +334,9 @@ long ptp_ioctl(struct posix_clock_contex
>   
>   	case PTP_ENABLE_PPS:
>   	case PTP_ENABLE_PPS2:
> -		if ((pccontext->fp->f_mode & FMODE_WRITE) == 0) {
> -			err = -EACCES;
> -			break;
> -		}
> -		memset(&req, 0, sizeof(req));
> -
> -		if (!capable(CAP_SYS_TIME))
> -			return -EPERM;
> -		req.type = PTP_CLK_REQ_PPS;
> -		enable = arg ? 1 : 0;
> -		if (mutex_lock_interruptible(&ptp->pincfg_mux))
> -			return -ERESTARTSYS;
> -		err = ops->enable(ops, &req, enable);
> -		mutex_unlock(&ptp->pincfg_mux);
> -		break;
> +		if ((pccontext->fp->f_mode & FMODE_WRITE) == 0)
> +			return -EACCES;
> +		return ptp_enable_pps(ptp, !!arg);
>   
>   	case PTP_SYS_OFFSET_PRECISE:
>   	case PTP_SYS_OFFSET_PRECISE2:
> 

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
