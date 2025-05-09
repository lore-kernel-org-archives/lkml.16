Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B9C214A69
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 14:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800989; cv=none; b=iw0/Ez8gKUq7iNKmVV6VRiymT9cZxHpF1f76vYi9Lr4+jS9t3FMpxRcoeW3ca4fnw564ud6YdeOaovDOpoJ3iRfOXOCkLhtZTJQVL6WZM/CukGurRB08wIr2pDUqwP5BsH2HCmJW5V6JHzlYQn27zMZH8vdaF0JSuaoWSm/h9mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800989; c=relaxed/simple;
	bh=iJ4947yTbe7oV/S1JJJzetLD5S5DGg4/W0amQ81PWng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Erb1rbDrNSdD7LOplOusE/HVOQtCTaB4Ye8YGO0LR32/lXIv4lKiYzsZcDLXOXBjSOlwQjsyYcMuquszFj0gKdr0X04a59EHzzK//UJPqV6rYBIoZCBXS5DoKoE15avQ0VDygnhf4LAt96XHIsUOKvDNRRaIosiRGh1bR9GWwK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=seIv/MfT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="seIv/MfT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99DD3C4CEE4;
	Fri,  9 May 2025 14:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746800989;
	bh=iJ4947yTbe7oV/S1JJJzetLD5S5DGg4/W0amQ81PWng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=seIv/MfTQoVxKnaZ0XKA65kyb0xbYCgKYFJpiqtsKuDyT+P0R9shhvObHoUMF0sMM
	 vzAkq5G+n3l8gJXcaqk8cNAsFI7c9Q65+iH27+aVgs1aaf6QDeAWW/bX7pvcWKyNn5
	 pCo+6r0sGFjUtXoJomEjWer4kzeXkWUJgtMbBsucVTZtBc5Vf5LK3nwJoP2DoiSJv1
	 RAMWhDFtBxBBhF3SrsO+r4Nre9YKwRghnwb1vbpB/jdNMJoMpYJvwzzaIagHiidPG/
	 k07TQX83R70zeAI8/Opvu175jP4iwgeMFLQHt+ValL8FRtvWrQCfWHaOEe7QCe5IZF
	 KgktsKCKdyt1A==
Date: Fri, 9 May 2025 15:29:45 +0100
From: Lee Jones <lee@kernel.org>
To: linux@treblig.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: sm501: Remove unused sm501_find_clock
Message-ID: <20250509142945.GH2492385@google.com>
References: <20250508002227.204836-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508002227.204836-1-linux@treblig.org>

On Thu, 08 May 2025, linux@treblig.org wrote:

> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> sm501_find_clock() was added in 2007 as part of
> commit b6d6454fdb66 ("[PATCH] mfd: SM501 core driver")
> but hasn't been used.
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/mfd/sm501.c | 43 -------------------------------------------

Looks like you missed: include/linux/sm501.h.

>  1 file changed, 43 deletions(-)
> 
> diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
> index 7ee293b09f62..bdeea0047e1b 100644
> --- a/drivers/mfd/sm501.c
> +++ b/drivers/mfd/sm501.c
> @@ -631,49 +631,6 @@ unsigned long sm501_set_clock(struct device *dev,
>  
>  EXPORT_SYMBOL_GPL(sm501_set_clock);
>  
> -/* sm501_find_clock
> - *
> - * finds the closest available frequency for a given clock
> -*/
> -
> -unsigned long sm501_find_clock(struct device *dev,
> -			       int clksrc,
> -			       unsigned long req_freq)
> -{
> -	struct sm501_devdata *sm = dev_get_drvdata(dev);
> -	unsigned long sm501_freq; /* the frequency achieveable by the 501 */
> -	struct sm501_clock to;
> -
> -	switch (clksrc) {
> -	case SM501_CLOCK_P2XCLK:
> -		if (sm->rev >= 0xC0) {
> -			/* SM502 -> use the programmable PLL */
> -			sm501_freq = (sm501_calc_pll(2 * req_freq,
> -						     &to, 5) / 2);
> -		} else {
> -			sm501_freq = (sm501_select_clock(2 * req_freq,
> -							 &to, 5) / 2);
> -		}
> -		break;
> -
> -	case SM501_CLOCK_V2XCLK:
> -		sm501_freq = (sm501_select_clock(2 * req_freq, &to, 3) / 2);
> -		break;
> -
> -	case SM501_CLOCK_MCLK:
> -	case SM501_CLOCK_M1XCLK:
> -		sm501_freq = sm501_select_clock(req_freq, &to, 3);
> -		break;
> -
> -	default:
> -		sm501_freq = 0;		/* error */
> -	}
> -
> -	return sm501_freq;
> -}
> -
> -EXPORT_SYMBOL_GPL(sm501_find_clock);
> -
>  static struct sm501_device *to_sm_device(struct platform_device *pdev)
>  {
>  	return container_of(pdev, struct sm501_device, pdev);
> -- 
> 2.49.0
> 

-- 
Lee Jones [李琼斯]
