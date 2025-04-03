Received: from smtp125.iad3b.emailsrvr.com (smtp125.iad3b.emailsrvr.com [146.20.161.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A241A23BA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 17:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743702422; cv=none; b=ITbAX3v2jRZSg7SFtW6TM8Fnd1DJcXZI1EQNxJOKk/A9vJy7djjW89JTm6puhqDgzRLv4pDs4XJ1spM3oL6JYNedIhKThCzz87JWLmGbIEST/dFljDIs7iA56+TWAtggbgNoKWLThokgUX0TUhl1xB5emeX+KWIc+U+IJs0qYFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743702422; c=relaxed/simple;
	bh=COtoD7jolTlfF8j7ress8ZnIElwqO7FuKlwpdurDr54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K4C8xYaaX0tSgebNPXmYXzzGrvIa8JJX22lxNYN7RmbPtnnBqjqQ07eiZsxlYKpFDDCB3zjaDpa6DuVlYb1qO8Hpwi6JMUNHQLFFIkyuHpIC/8owsX1Ye/PGvp+HE8vS3CQcYtw+ckhcZuZ43EOuykvKQMt4PyBeITo0AfW6LVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=efszDDvy; arc=none smtp.client-ip=146.20.161.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="efszDDvy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1743701319;
	bh=COtoD7jolTlfF8j7ress8ZnIElwqO7FuKlwpdurDr54=;
	h=Date:Subject:To:From:From;
	b=efszDDvyg7I1XSldU2MfL3/qyi5me1c/9uw1kqlgw3ueA/KJi+TG6o62LC3S9Ok5+
	 ZFCQz5qcrAhBuIIHKyv3RcJI54I7mfSpSo+jBmxanqmBLHTGFuBmqr//WcC10pG2Gr
	 I/oJy3wpPJuUiT+UDarud981ZNyVzkxNt2zIp9JI=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp16.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 5646DC0087;
	Thu,  3 Apr 2025 13:28:39 -0400 (EDT)
Message-ID: <8f607a2b-3d99-4f3e-b370-b7e4793ad27c@mev.co.uk>
Date: Thu, 3 Apr 2025 18:28:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Staging: comedi: Add DMA preparation before
 mite_dma_arm().
To: Wentao Liang <vulab@iscas.ac.cn>, hsweeten@visionengravers.com
Cc: linux-kernel@vger.kernel.org
References: <20250403163535.2494-1-vulab@iscas.ac.cn>
Content-Language: en-GB
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
In-Reply-To: <20250403163535.2494-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Classification-ID: 79b49608-5320-4be6-bcce-d25a9e60ac07-1-1

On 2025-04-03 17:35, Wentao Liang wrote:
> The ni_tio_input_inttrig() calls mite_dma_arm() without calling
> mite_prep_dma() first. A proper implementation can be found in
> ni_cdo_inttrig() in ni_mio_common.c.
> 
> Add mite_prep_dma() before mite_dma_arm().
> 
> Fixes: cb7859a90af1 ("Staging: comedi: add National Instruments infrastructure")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>   drivers/comedi/drivers/ni_tiocmd.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/comedi/drivers/ni_tiocmd.c b/drivers/comedi/drivers/ni_tiocmd.c
> index ab6d9e8269f3..b943836ccf1a 100644
> --- a/drivers/comedi/drivers/ni_tiocmd.c
> +++ b/drivers/comedi/drivers/ni_tiocmd.c
> @@ -84,9 +84,10 @@ static int ni_tio_input_inttrig(struct comedi_device *dev,
>   		return -EINVAL;
>   
>   	spin_lock_irqsave(&counter->lock, flags);
> -	if (counter->mite_chan)
> +	if (counter->mite_chan) {
> +		mite_prep_dma(counter->mite_chan, 32, 32);
>   		mite_dma_arm(counter->mite_chan);
> -	else
> +	} else
>   		ret = -EIO;
>   	spin_unlock_irqrestore(&counter->lock, flags);
>   	if (ret < 0)

mite_prep_dma() will get called by ni_tio_input_cmd() at some arbitrary 
time before ni_tio_input_inttrig() is called. (ni_tio_input_cmd() sets 
up the software trigger function pointer that is called during 
processing of a subsequent INSN_INTTRIG comedi instruction from 
user-space. Also, the last two parameters of mite_prep_dma() are not 
always 32 and 32 - it depends on the hardware, as can be seen in the 
switch statement in ni_tio_input_cmd().

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-

