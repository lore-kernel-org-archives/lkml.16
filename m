Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3A71EB1A7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743496837; cv=none; b=mZiHLvEtwgMUrnGNfDJYvRE2TAuBB+iqhGwHvsg4lHLRS9vx/8Se64KzyJf0y26mdKiFpC/a25ACQOq8utsodckK9jKi56/qFaD5qT65sm6rzgk0nNMwrnx+0k4K+pDKhgQwpbojyAGwRJMsz50POLM3ZXRg6H1APQe6DFjHW/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743496837; c=relaxed/simple;
	bh=XN7QInH4oZtUqk5DB14x/7ud6otDLi5WJCgAWF/KC5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ojRSvj3yr5VxQZezvtxzXTtaD9DlEviGCzkB4psgNgfyZSmaflF/rVml7TsksDvhcntoU8iH8Jo8LtjNKYN12WUWWESkmt8jaBJ5arcC2Vng4tzFn6spkKR8fX7ikukDENOdUOsA27KcmayHmiAPwByVnkkG+McKksjJJ0kjYxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hl70XH19; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hl70XH19"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3996af42857so4142321f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743496833; x=1744101633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QAK5bGqbHLPZStc3akH3qUwD0OFzOTA3rRJ3Mg3wBUA=;
        b=Hl70XH195giJugC0j9Qx0xVCTs/0bA5+lCaAiQXlOB3rW7MBuGl8ZCeZl4D5saOXUA
         ORekelsa61ABae4ohSM3cu248lAsZvzSExb6UXs3ltS0WJSOxWtMMhxUQIxMeVVbfmJQ
         67VCBh3iYb6EhgBj9YdxYyyzUGDDVVTmPqAKl8cdyxdBzmPrZ1ZnhhpJ4WHxSexg5FrQ
         jzdxNviHzRx14eXd1CxD91WYGuoq+/IElVG9y89uPoSvB5/cH0fULiHfRCrNBmtuxjnn
         /syoHW6tBLWFdyOhD1/oYbkT3UvBjPTdLt/RSdH2LdBPZwlmB96XtZLtdNflXFhttzNC
         onRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743496833; x=1744101633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QAK5bGqbHLPZStc3akH3qUwD0OFzOTA3rRJ3Mg3wBUA=;
        b=uhaj5YMQcyrc8Z3c7rSVW2dm/X93G/u7hbo9A6Gv9jXFNRIchr14q5wdRkm6bKUvUm
         64k2OrUltG/hqBLebJU7nN8DhWGjslK0YB8OjCCD/VuLQQQjOQHJ9/0uGWBd1E2EO3Wq
         uUcVrtlwCdPZdjeJdTxab/7Hh7DvIHoHOBedJa7ofe9zP0ubom4+DgLWbjdOuv1RKjUj
         H4Pz/b/ck7baUlnbX4F4mwjEwn1shsxTtrswv6AIGf+oXZl5/s94DNhqGEqtOzAUTuf7
         HsFMjDYFHlRL+aKoBEluQSl6oYHda25ECDa4lh6c+tBhHHfK/g4tbundJhqb/bOARYkD
         J3dw==
X-Forwarded-Encrypted: i=1; AJvYcCXOPLdAeQZM5yNG0Z2btW8gAVWR2LFiGXJQlJYAlWVCN2PHz/wqJLw/sc/RKo/FHM4eeSM+BTHNPlrO5Ok=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGMrqVAOdBk6S8t/H3TMw9QL3v3B6Cdsw0LaF54wRKhBeLntkA
	DUqtR73FRQrs50NeMGVJ3f3BPWECiyPI+gjscXlm6HhEroRU9g/f5d2q7v1iTpk=
X-Gm-Gg: ASbGncuNa5qKUvXArvqLhjwp4NnmNTbdg3O1YbTQJimDlLXEKju4wfx9fCBCRTTq0jx
	D/sWVzN7CvfsGJ23iqS2UPXXc7x9kHoQIhihhDVL2rxPTNr++uPYtFpESboqxbW5DSU0m+xCnXU
	cIiCYL6gisPJMsm2B5IJcac+bt00cIzjaiuq0n9cASNd/aXo464cNSKQKJxSMmkpQ+OVopnVxyu
	C2KXCEO3SUy43oc7s5zfbMsHz8VqUgUkmGDnhVaW8l6aKro1Y4r0cvlANwyKBLAjDtsWJKLTEJU
	X6sdNsUgZjwCxT9fyCMkjes7cl8jhyzBFsU7AhSN37d7nRSEWmpzO9EZ0Tm93VUO0HhfeRRuciP
	FrMJta8rQSUtHsynFyMuO
X-Google-Smtp-Source: AGHT+IGsGLZEWhtkiVdbEty9JUgRguBjdThHJUgiYsWeC0RRt/L2+R/RFctKxKdLxoC212I4HzJVSg==
X-Received: by 2002:a05:6000:4188:b0:39c:12ce:105c with SMTP id ffacd0b85a97d-39c12ce10f0mr5887061f8f.6.1743496832719;
        Tue, 01 Apr 2025 01:40:32 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6588dbsm13291530f8f.2.2025.04.01.01.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 01:40:32 -0700 (PDT)
Message-ID: <2d2e64cf-2bc9-403d-98ed-c9150d1973c4@linaro.org>
Date: Tue, 1 Apr 2025 09:40:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: csiphy-3ph: Make non-Gen2 PHY work
 again
To: Yassine Oudjana <y.oudjana@protonmail.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Depeng Shao <quic_depengs@quicinc.com>
Cc: Yassine Oudjana <yassine.oudjana@gmail.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250401083329.314863-1-y.oudjana@protonmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250401083329.314863-1-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2025 09:33, Yassine Oudjana wrote:
> Commit fbce0ca24c3a ("media: qcom: camss: csiphy-3ph: Move CSIPHY variables
> to data field inside csiphy struct") moved a version check that was
> previously guarded by a check for Gen2 to csiphy_init without moving the
> Gen2 check along with it. Since it was guarded by the Gen2 check, it was
> only handling versions that were Gen2 and returned -ENODEV for others since
> they shouldn't pass the Gen2 check to begin with.
> 
> Check if the CSIPHY is Gen2 before running this version check and assigning
> Gen2 lane regs array.
> 
> Fixes: fbce0ca24c3a ("media: qcom: camss: csiphy-3ph: Move CSIPHY variables to data field inside csiphy struct")
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index a6cc957b986e..17762aee6dba 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -700,6 +700,9 @@ static int csiphy_init(struct csiphy_device *csiphy)
>   	csiphy->regs = regs;
>   	regs->offset = 0x800;
>   
> +	if (!csiphy_is_gen2(csiphy->camss->res->version))
> +		return 0;
> +
>   	switch (csiphy->camss->res->version) {
>   	case CAMSS_845:
>   		regs->lane_regs = &lane_regs_sdm845[0];

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
