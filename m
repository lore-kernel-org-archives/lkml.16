Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC191F5E6
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 20:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750537498; cv=none; b=OUv+bP2lERkk91YlqUN48aIQs+oW2kuCrerHGEJvIRpgi2OYchGXBDuIN957wd5e3EuYrS8Sif6sUeasNDIM8JT/hc63By4lLeCc/q5MOR52ducaoRf4XsSriICdZhSVw+cBwkcYWiAhN9rzJsF1NG119q2ZkEMvu/3lHd7LGKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750537498; c=relaxed/simple;
	bh=Hs73OMeA54qel9rX7pM0slV+VYdAq3yTVD0UBpiJMtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pD7oG+Pnkk7VRMyj1CMDP1+LFYyDskavrZ7c+f3JGeRYHOiWktgfXq7iG2a5wdAMLHm2n+gdid8bsP7E5sW3J/wGGapAH8TwUARxWZTd+jD/kUIPj2kr6c8P64hVUmnrMKPScYWxZPdLqc5TsVzhW9y7oAPtr7suzt2zhabUfew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=t4cKbNy4; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="t4cKbNy4"
Message-ID: <861942e6-d1e9-4e6a-8d4c-d8fa4584ed45@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750537494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FCpu3zZVtbUfg4KgBuBug2nmC/y5jdfXaJFDqT+pqV4=;
	b=t4cKbNy47/NNOiVxNMDExoy4pVQtXyGJIfkUby+hott78wEPvd4tH9hN/hp2VWJl9DIoJo
	bzcBZl1OnBRjEfHs4aQJRelOrVmm8pU2itUwLLL/C59gKReJqZiAOqmd795IxriwsPso0m
	DWOoDS5NlAwLbf5JIrkwHumhYKiVV0A=
Date: Sat, 21 Jun 2025 21:24:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [patch 03/13] ptp: Split out PTP_PEROUT_REQUEST ioctl code
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org
References: <20250620130144.351492917@linutronix.de>
 <20250620131943.905398183@linutronix.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250620131943.905398183@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 20/06/2025 14:24, Thomas Gleixner wrote:
> Continue the ptp_ioctl() cleanup by splitting out the PTP_PEROUT_REQUEST
> ioctl code into a helper function. Convert to a lock guard while at it.
> 
> No functional change intended.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>   drivers/ptp/ptp_chardev.c |  129 ++++++++++++++++++++--------------------------
>   1 file changed, 58 insertions(+), 71 deletions(-)
> 
> --- a/drivers/ptp/ptp_chardev.c
> +++ b/drivers/ptp/ptp_chardev.c
> @@ -223,6 +223,61 @@ static long ptp_extts_request(struct ptp
>   		return ops->enable(ops, &req, req.extts.flags & PTP_ENABLE_FEATURE ? 1 : 0);
>   }
>   
> +static long ptp_perout_request(struct ptp_clock *ptp, unsigned int cmd, void __user *arg)
> +{
> +	struct ptp_clock_request req = { .type = PTP_CLK_REQ_PEROUT };
> +	struct ptp_perout_request *perout = &req.perout;
> +	struct ptp_clock_info *ops = ptp->info;
> +
> +	if (copy_from_user(perout, arg, sizeof(*perout)))
> +		return -EFAULT;
> +
> +	if (cmd == PTP_PEROUT_REQUEST2) {
> +		if (perout->flags & ~PTP_PEROUT_VALID_FLAGS)
> +			return -EINVAL;
> +
> +		/*
> +		 * The "on" field has undefined meaning if
> +		 * PTP_PEROUT_DUTY_CYCLE isn't set, we must still treat it
> +		 * as reserved, which must be set to zero.
> +		 */
> +		if (!(perout->flags & PTP_PEROUT_DUTY_CYCLE) &&
> +		    !mem_is_zero(perout->rsv, sizeof(perout->rsv)))
> +			return -EINVAL;
> +
> +		if (perout->flags & PTP_PEROUT_DUTY_CYCLE) {
> +			/* The duty cycle must be subunitary. */
> +			if (perout->on.sec > perout->period.sec ||
> +			    (perout->on.sec == perout->period.sec &&
> +			     perout->on.nsec > perout->period.nsec))
> +				return -ERANGE;
> +		}
> +
> +		if (perout->flags & PTP_PEROUT_PHASE) {
> +			/*
> +			 * The phase should be specified modulo the period,
> +			 * therefore anything equal or larger than 1 period
> +			 * is invalid.
> +			 */
> +			if (perout->phase.sec > perout->period.sec ||
> +			    (perout->phase.sec == perout->period.sec &&
> +			     perout->phase.nsec >= perout->period.nsec))
> +				return -ERANGE;
> +		}
> +	} else {
> +		perout->flags &= PTP_PEROUT_V1_VALID_FLAGS;
> +		memset(perout->rsv, 0, sizeof(perout->rsv));
> +	}
> +
> +	if (perout->index >= ops->n_per_out)
> +		return -EINVAL;
> +	if (perout->flags & ~ops->supported_perout_flags)
> +		return -EOPNOTSUPP;
> +
> +	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &ptp->pincfg_mux)
> +		return ops->enable(ops, &req, perout->period.sec || perout->period.nsec);
> +}
> +
>   long ptp_ioctl(struct posix_clock_context *pccontext, unsigned int cmd,
>   	       unsigned long arg)
>   {
> @@ -262,77 +317,9 @@ long ptp_ioctl(struct posix_clock_contex
>   
>   	case PTP_PEROUT_REQUEST:
>   	case PTP_PEROUT_REQUEST2:
> -		if ((pccontext->fp->f_mode & FMODE_WRITE) == 0) {
> -			err = -EACCES;
> -			break;
> -		}
> -		memset(&req, 0, sizeof(req));
> -
> -		if (copy_from_user(&req.perout, (void __user *)arg,
> -				   sizeof(req.perout))) {
> -			err = -EFAULT;
> -			break;
> -		}
> -		if (cmd == PTP_PEROUT_REQUEST2) {
> -			struct ptp_perout_request *perout = &req.perout;
> -
> -			if (perout->flags & ~PTP_PEROUT_VALID_FLAGS) {
> -				err = -EINVAL;
> -				break;
> -			}
> -			/*
> -			 * The "on" field has undefined meaning if
> -			 * PTP_PEROUT_DUTY_CYCLE isn't set, we must still treat
> -			 * it as reserved, which must be set to zero.
> -			 */
> -			if (!(perout->flags & PTP_PEROUT_DUTY_CYCLE) &&
> -			    (perout->rsv[0] || perout->rsv[1] ||
> -			     perout->rsv[2] || perout->rsv[3])) {
> -				err = -EINVAL;
> -				break;
> -			}
> -			if (perout->flags & PTP_PEROUT_DUTY_CYCLE) {
> -				/* The duty cycle must be subunitary. */
> -				if (perout->on.sec > perout->period.sec ||
> -				    (perout->on.sec == perout->period.sec &&
> -				     perout->on.nsec > perout->period.nsec)) {
> -					err = -ERANGE;
> -					break;
> -				}
> -			}
> -			if (perout->flags & PTP_PEROUT_PHASE) {
> -				/*
> -				 * The phase should be specified modulo the
> -				 * period, therefore anything equal or larger
> -				 * than 1 period is invalid.
> -				 */
> -				if (perout->phase.sec > perout->period.sec ||
> -				    (perout->phase.sec == perout->period.sec &&
> -				     perout->phase.nsec >= perout->period.nsec)) {
> -					err = -ERANGE;
> -					break;
> -				}
> -			}
> -		} else if (cmd == PTP_PEROUT_REQUEST) {
> -			req.perout.flags &= PTP_PEROUT_V1_VALID_FLAGS;
> -			req.perout.rsv[0] = 0;
> -			req.perout.rsv[1] = 0;
> -			req.perout.rsv[2] = 0;
> -			req.perout.rsv[3] = 0;
> -		}
> -		if (req.perout.index >= ops->n_per_out) {
> -			err = -EINVAL;
> -			break;
> -		}
> -		if (req.perout.flags & ~ptp->info->supported_perout_flags)
> -			return -EOPNOTSUPP;
> -		req.type = PTP_CLK_REQ_PEROUT;
> -		enable = req.perout.period.sec || req.perout.period.nsec;
> -		if (mutex_lock_interruptible(&ptp->pincfg_mux))
> -			return -ERESTARTSYS;
> -		err = ops->enable(ops, &req, enable);
> -		mutex_unlock(&ptp->pincfg_mux);
> -		break;
> +		if ((pccontext->fp->f_mode & FMODE_WRITE) == 0)
> +			return -EACCES;
> +		return ptp_perout_request(ptp, cmd, argptr);
>   
>   	case PTP_ENABLE_PPS:
>   	case PTP_ENABLE_PPS2:
> 
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
