Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B8033DF
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315005; cv=none; b=JPQ6MW324P3+B6mFoCIn4k+MFe+asFFZbVBCCOxIuO/s8pdF/ycaMnqoLydNwqxrJtlwQwHDDwepKs1CuAd6h/EnbbNLJslF2KB+BzQSBOWY4QdCcN/u/MRrXW3MQRZkF4PFOc6ZNJBwh+0gzGxRoC0nLBk9CcMJ9qTELMwULY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315005; c=relaxed/simple;
	bh=CtoTKRl6rcm+Kyu8j/4hENkSu9gJjRpE9Z4Ou7rhhiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNmjnp6k5k10M64IruAMhiBro3kc6p3gpe9mEfzXAAEHXhKNeVEmuBiJVJOj5lSdNXFmtlsvGvqnJTzfFTIbzfgi7Fr4FLV304tntvvBlBYGzVi69gYNPX+M8N6aFKT2wI95JOIP/yorodv3eoC8M7Ce2QNMNsyddRJEcOSe1L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hdLjLtow; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hdLjLtow"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3104ddb8051so9935521fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 06:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747315002; x=1747919802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HsRjF6iBA0jVUvpTn7ZmwcFOLlij9sfjwslA/3l3Yjg=;
        b=hdLjLtowdbwniYOIL5aB4OaKGQftH1kyFzXv0UbdorKUTTZGpL2Gu1rYxRQAWZwJZ4
         EYhLSegXn0YLAd9uPKYM6KW2QABpCl9PuDQn/nZjV07uUdIQ0TF3m9BuPtF3KwXaM7/2
         p/7fv25KrSAASto7mG9hF0NwbdfsAGEKFaknEebsk/kkiCMW6QD+lzGHJR0B++EP3Nab
         HQyF9wfcSYc79MWb/IiXnRh1jp8BIyppbK3wVjS3NBFL3lPhIPod7uvIdoogsLpTlYio
         jvf9VZJsYldDaC8//x1UViH1VALBB2qiQ2fetOFvJLtCc+5n5MhwO8SfvrWz+ZpUiomJ
         UEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747315002; x=1747919802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsRjF6iBA0jVUvpTn7ZmwcFOLlij9sfjwslA/3l3Yjg=;
        b=nznc7U3sCp6WfH7/7PfbdYb7Zbx4HqjvgjOXOUGuVNl4C16YKHKxCMhwJuGek9NHEW
         wQe86CFuZdad3jIRo11zi3stiM5qbIbDE7ZEk17z7Keu0YwGTvNTEyWbPzVbQ4QSkr3j
         rGHwvA9e+wzoi+ZqVoFQ54s0hyY/7QUOEIF3zvk2iJMkENU+y2zSVd6E0IoDsewboCOA
         GApARbG17Z03CQz7eXgsKRqzZLGIBlwE2wcY2oQ4YlbGVupTBCgEbG7cU9kmgKSuMo+o
         3HF7u42MTJfm+Zh+hhcLT5g4MAAq6Tiy0idhFGnOlaYlEhVhA6FWpXQA8Kbav8Yiz7Dx
         5VCg==
X-Forwarded-Encrypted: i=1; AJvYcCUwVHznmBlXENIwvvSaMetUb1msRuyH9peBt72WaJrquvcS1Giz6hFNjQYWosWNobH0FnePiUf9AY7J7z0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEdZaEL1br4O0tT12NdMLDwBxhnNYkcS8Loz/nmVeNing6FSUJ
	URjKLcN8ZHpNMsC80rXtFuQU85NSGuCf5Jo3ubP46jCcaNwqLa87heuFHZJHx2ir5DIR6r/3dXb
	j23U=
X-Gm-Gg: ASbGnctiklfPXGoQzNlBbNST9bkjstT/Zn7zaWNiT0g0sJdDMPYAK0D/zmcgVz4W5jK
	vKPjc8WVh8i5pTwRZ/A53E3M2QrvwVVTCpGu5RNDxwMXd4+ErWytdrDHNgxorRiXgjcPpJ+ZK/j
	qK7pOvgEj61SR5/A/0vPSawT3AJrBf6tHOuvhf7qXT+jk5EZtYUlehklLexRmL0qISV9ycQTFem
	b9G+vhdbSYXHU4oLcmPrqRzqJBNNnscV2Ea/kfK07UbWr7gvs2prahM0KggN4K+6QZLcyczd6NR
	lM1fq4+7N9SN9EQHPJWO/JzLzZIKB/iRq2FSqjIiCU4qmlpTRrQmlvG2yZNwAh8sIU2Fra2KrQc
	HTK3m2pLym63EM7Kb
X-Google-Smtp-Source: AGHT+IEJPKvWe72TF7EByB4gPExTJZy2vEZ4XGn1I+zI8Qjp4rqHO9xavu6r1HaPWrHK/wY0PTR48Q==
X-Received: by 2002:a05:6000:240a:b0:39c:30fc:20 with SMTP id ffacd0b85a97d-3a349922795mr6543267f8f.37.1747314991164;
        Thu, 15 May 2025 06:16:31 -0700 (PDT)
Received: from localhost (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35c12d134sm403876f8f.47.2025.05.15.06.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 06:16:30 -0700 (PDT)
Date: Thu, 15 May 2025 16:16:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: long.yunjian@zte.com.cn
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, peng.fan@nxp.com,
	justin.chen@broadcom.com, florian.fainelli@broadcom.com,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, fang.yumeng@zte.com.cn,
	mou.yi@zte.com.cn, ouyang.maochun@zte.com.cn, xu.lifeng1@zte.com.cn
Subject: Re: [PATCH] firmware: arm_scmi: Use dev_err_probe() simplify the code
Message-ID: <21435bc6-d4d7-4576-8ff6-266ce9507799@suswa.mountain>
References: <20250515203855146Sn9x-Uw9Teur35mOjn41C@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515203855146Sn9x-Uw9Teur35mOjn41C@zte.com.cn>

On Thu, May 15, 2025 at 08:38:55PM +0800, long.yunjian@zte.com.cn wrote:
> From: Yumeng Fang <fang.yumeng@zte.com.cn>
> 
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
> 
> Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>

When you're resending someone else's patch you need to add your own
Signed-off-by: line to the end of the list.

Please, could you resend a v2 patch with your signature?

> ---
>  drivers/firmware/arm_scmi/transports/mailbox.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
> index bd041c99b92b..816e79537935 100644
> --- a/drivers/firmware/arm_scmi/transports/mailbox.c
> +++ b/drivers/firmware/arm_scmi/transports/mailbox.c
> @@ -13,6 +13,7 @@
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +#include <linux/dev_printk.h>
> 
>  #include "../common.h"
> 
> @@ -215,10 +216,8 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
>  	smbox->chan = mbox_request_channel(cl, tx ? 0 : p2a_chan);
>  	if (IS_ERR(smbox->chan)) {
>  		ret = PTR_ERR(smbox->chan);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(cdev,
> -				"failed to request SCMI %s mailbox\n", desc);
> -		return ret;
> +		return dev_err_probe(cdev, ret,

It's probably better to get rid of the "ret = PTR_ERR(smbox->chan);"
assignment as well.  Then it's a one liner:

  	if (IS_ERR(smbox->chan))
		return dev_err_probe(cdev, PTR_ERR(smbox->chan),
				     "failed to request SCMI %s mailbox\n", desc);

Same for the others as well.

regards,
dan carpenter


