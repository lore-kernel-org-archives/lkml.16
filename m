Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F1C1B043E
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 20:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750538205; cv=none; b=XmdRh/+cipUzh76BRf4S2qFkb1nmj/nuiyw5CUdwuxrWDCTkSAzmGRk1DscBoHjb1fpZcQpFV7F37vXEOLHe9I3IgMf5wmHop9WcMvME83i7Ql5XBt1KfeZafcFRbJoWrpK8KAu9LbObYA8BXYWSOTZgUyRwcmsm6PxxquQUl+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750538205; c=relaxed/simple;
	bh=IL4FMTqf/x+Br6L5l1f33GaS1KFdfsOZFdGiVZX9Cm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fJEVWM7W9VmeyReC1twgnnxAF9ZSsLVOXDCxqd/Eo7TTeTGstK1OMDgfq0jX0rjXpcDg6rGVC2+kXBu2TKr0a1l/FAXvIOvtJ2m4zvkyDy5wO4AX+nHMiSJKQjPlTNDVsMvicML1btGmfjro5Eb+mvWVkTfj1m7D8f86e6jhK4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XjEcP2HO; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XjEcP2HO"
Message-ID: <80052862-683c-4a53-b7a2-8d767a057022@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750538200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4z+b6jov035aId35pJXpy5WeiWjPI6mbrPX66w3Fa6k=;
	b=XjEcP2HO+F1ojbxigb47Q4fx3ECpX642YaFhkzBUi7HISvvrbRAxE55WkSd4Hw3+E0WMGe
	wc4iTtsLTmKCmPTiATf//ZgJJRTrBNBImE82D0aIj5Li0+jx5Ozw2nbehU9OGCEYCr/6nQ
	ekXN8q+X8h/muamq1rEwiB1lxiRlBdg=
Date: Sat, 21 Jun 2025 21:36:39 +0100
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250620131944.344887489@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 20/06/2025 14:24, Thomas Gleixner wrote:
> Continue the ptp_ioctl() cleanup by splitting out the PTP_MASK_CLEAR_ALL ioctl
> code into a helper function.
> 
> No functional change intended.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>   drivers/ptp/ptp_chardev.c |    9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> --- a/drivers/ptp/ptp_chardev.c
> +++ b/drivers/ptp/ptp_chardev.c
> @@ -442,6 +442,12 @@ static long ptp_pin_setfunc(struct ptp_c
>   		return ptp_set_pinfunc(ptp, pin_index, pd.func, pd.chan);
>   }
>   
> +static long ptp_mask_clear_all(struct timestamp_event_queue *tsevq)
> +{
> +	bitmap_clear(tsevq->mask, 0, PTP_MAX_CHANNELS);
> +	return 0;
> +}
> +
>   long ptp_ioctl(struct posix_clock_context *pccontext, unsigned int cmd,
>   	       unsigned long arg)
>   {
> @@ -504,8 +510,7 @@ long ptp_ioctl(struct posix_clock_contex
>   		return ptp_pin_setfunc(ptp, cmd, argptr);
>   
>   	case PTP_MASK_CLEAR_ALL:
> -		bitmap_clear(tsevq->mask, 0, PTP_MAX_CHANNELS);
> -		break;
> +		return ptp_mask_clear_all(pccontext->private_clkdata);
>   
>   	case PTP_MASK_EN_SINGLE:
>   		if (copy_from_user(&i, (void __user *)arg, sizeof(i))) {
> 

Not quite sure there is a benefit of having a function for this type,
apart from having one style. But it adds some LoC...


