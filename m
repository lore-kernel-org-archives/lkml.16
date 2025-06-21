Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE901C3039
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 20:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750537832; cv=none; b=cl8r4u11/NuIPkltnmkE8qdjyyh4EVyOZ+psHaBuIDju8mDNdMRi7MgADlo55Kuv11HkITLybskZXkKM5S40tn+sQH06CM2V2/0w5xRT+SUwYKdgPZMWNW5xB3rbwBhJYchoiSp+DRB7/6pjASyRSlgeE9k3scuukUx60PEuRM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750537832; c=relaxed/simple;
	bh=WRK6Gv/OVq3gOLgu2R4/1o7eH8PGR+XxBgpIKEqya6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GQzfKXRadHtMchphoaSjR6z8CqkMJD7TBv5mDvCwcGh6XXZk5KghF73MereVGYfyiW8IbRaoJNEw/uCSQnLt2PuuzR0KuCsOF0J9goYWtFUDN9eOK/x/TWBpbu30ai5NEQMp7WbHbZ9qdElpmyz3ij88eGLWzeE3+XPMXeXC9o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mqij93iD; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mqij93iD"
Message-ID: <391a6a04-bdb2-4a42-852e-624509cfc23b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750537826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d8k1PyrOdwKsltb1eXjagcOmBVnEwwukiPzxo9S/pGs=;
	b=mqij93iDQSWpOIvOe88u1+tXwxBe4WgLIqk5JbTrxJPD0PCYP7IE5oSgyTL4Zw+YxlZiRz
	zedxZNK1zys3nzSDwXwn53ZkA8MYi01+E9w3mcaIG9wHTD6uWLKvRpkgS4k7cGtl9xGhP4
	qXvQpj62ZvCAQv2wd/+J1iT8lvOE7dw=
Date: Sat, 21 Jun 2025 21:30:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [patch 09/13] ptp: Split out PTP_PIN_SETFUNC ioctl code
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org
References: <20250620130144.351492917@linutronix.de>
 <20250620131944.281928614@linutronix.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250620131944.281928614@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 20/06/2025 14:24, Thomas Gleixner wrote:
> Continue the ptp_ioctl() cleanup by splitting out the PTP_PIN_SETFUNC ioctl
> code into a helper function. Convert to lock guard while at it.
> 
> No functional change intended.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>   drivers/ptp/ptp_chardev.c |   60 +++++++++++++++++++---------------------------
>   1 file changed, 26 insertions(+), 34 deletions(-)
> 
> --- a/drivers/ptp/ptp_chardev.c
> +++ b/drivers/ptp/ptp_chardev.c
> @@ -420,16 +420,36 @@ static long ptp_pin_getfunc(struct ptp_c
>   	return copy_to_user(arg, &pd, sizeof(pd)) ? -EFAULT : 0;
>   }
>   
> +static long ptp_pin_setfunc(struct ptp_clock *ptp, unsigned int cmd, void __user *arg)
> +{
> +	struct ptp_clock_info *ops = ptp->info;
> +	struct ptp_pin_desc pd;
> +	unsigned int pin_index;
> +
> +	if (copy_from_user(&pd, arg, sizeof(pd)))
> +		return -EFAULT;
> +
> +	if (cmd == PTP_PIN_SETFUNC2 && !mem_is_zero(pd.rsv, sizeof(pd.rsv)))
> +		return -EINVAL;
> +	else
> +		memset(pd.rsv, 0, sizeof(pd.rsv));
> +
> +	if (pd.index >= ops->n_pins)
> +		return -EINVAL;
> +
> +	pin_index = array_index_nospec(pd.index, ops->n_pins);
> +	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &ptp->pincfg_mux)
> +		return ptp_set_pinfunc(ptp, pin_index, pd.func, pd.chan);
> +}
> +
>   long ptp_ioctl(struct posix_clock_context *pccontext, unsigned int cmd,
>   	       unsigned long arg)
>   {
>   	struct ptp_clock *ptp =
>   		container_of(pccontext->clk, struct ptp_clock, clock);
> -	struct ptp_clock_info *ops = ptp->info;
>   	struct timestamp_event_queue *tsevq;
> -	unsigned int i, pin_index;
> -	struct ptp_pin_desc pd;
>   	void __user *argptr;
> +	unsigned int i;
>   	int err = 0;
>   
>   	if (in_compat_syscall() && cmd != PTP_ENABLE_PPS && cmd != PTP_ENABLE_PPS2)
> @@ -479,37 +499,9 @@ long ptp_ioctl(struct posix_clock_contex
>   
>   	case PTP_PIN_SETFUNC:
>   	case PTP_PIN_SETFUNC2:
> -		if ((pccontext->fp->f_mode & FMODE_WRITE) == 0) {
> -			err = -EACCES;
> -			break;
> -		}
> -		if (copy_from_user(&pd, (void __user *)arg, sizeof(pd))) {
> -			err = -EFAULT;
> -			break;
> -		}
> -		if ((pd.rsv[0] || pd.rsv[1] || pd.rsv[2]
> -				|| pd.rsv[3] || pd.rsv[4])
> -			&& cmd == PTP_PIN_SETFUNC2) {
> -			err = -EINVAL;
> -			break;
> -		} else if (cmd == PTP_PIN_SETFUNC) {
> -			pd.rsv[0] = 0;
> -			pd.rsv[1] = 0;
> -			pd.rsv[2] = 0;
> -			pd.rsv[3] = 0;
> -			pd.rsv[4] = 0;
> -		}
> -		pin_index = pd.index;
> -		if (pin_index >= ops->n_pins) {
> -			err = -EINVAL;
> -			break;
> -		}
> -		pin_index = array_index_nospec(pin_index, ops->n_pins);
> -		if (mutex_lock_interruptible(&ptp->pincfg_mux))
> -			return -ERESTARTSYS;
> -		err = ptp_set_pinfunc(ptp, pin_index, pd.func, pd.chan);
> -		mutex_unlock(&ptp->pincfg_mux);
> -		break;
> +		if ((pccontext->fp->f_mode & FMODE_WRITE) == 0)
> +			return -EACCES;
> +		return ptp_pin_setfunc(ptp, cmd, argptr);
>   
>   	case PTP_MASK_CLEAR_ALL:
>   		bitmap_clear(tsevq->mask, 0, PTP_MAX_CHANNELS);
> 
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
