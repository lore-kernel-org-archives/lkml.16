Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B13E1FDE09
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749287826; cv=none; b=m+WdUy4vsbo/ryZ1y8IJHAEoFZtF8c/pGZrA2ZjPU3gGVJVTOom+11/thxwGi8FbMlk1AkSfs309wReN1NIOr6SaX4dDTSwuXEMezp3p5lIT/9pSk/+D4u7trTmB60SLUSeaCr81zkgzQat+8TjcNhb6oH5wicRUrRP5o6m69Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749287826; c=relaxed/simple;
	bh=eeiSOCGD1Qf0WEJDz2vodAFCYclFaLExwW+hwWMLokI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=orCrd5pTJikbkzlBNWU5pY0BLvfb3S2YoICU8fIOK4yWcqGu+JGZujO5oiYw5CGPxeb8Vd3Y7qEsYS0ZqqUVrRLvsL9pzAohAI+NfGfuCCW2Z6XUV+52rkdA/cwLx4XIogg2pEJezd5cgGhbfqv/qJ71/1fyKyF+V1RC84cDntI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NaGkKhYZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NaGkKhYZ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso26416955e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 02:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749287823; x=1749892623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=64ZjZfRA6hvF+wvTtcr61AIc5qhdm0mhnYYGvLYBTAc=;
        b=NaGkKhYZOpB8njkfofHiE6yVtjAYwzixHav/S9McBw7Dkh+lEeYQMGHUHgVWswTLwV
         J1Bz95qglpgE6DlaVKhx31/n4eZxFfWootyqPNAGCGoijOe8ErkWUmI9GhW/HUxCavju
         7oH0/XV05iOBr9kbKdYDBI8siUMBJ7drDzYfTy5Y57VK9JTh/pE22qvgIQbdKhpZKTQu
         VtAUrB3iuvvJK500oZ1QOWK0l5H+cunhP8IezZcNYO/dna2+OL8JxFI2RVj0g0uWoZTj
         Lyvu7Ec8+tpwpPjrZZMS1shfM1pgF/dVMsz62GWhKK4ALcKqN+smYGLq6Ot9FGAlwBB4
         knmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749287823; x=1749892623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=64ZjZfRA6hvF+wvTtcr61AIc5qhdm0mhnYYGvLYBTAc=;
        b=X80f+UQSX2fZPo01/nYmd7qu1btdTctOnBg7wEZ5783USqxvOZEbbzvuOZK7sn4Iv4
         YbB10UV81CfUFMI9ag5HYJXCSB4D6/Vxq6Kt0+qBBBG93+W6xpuctkqT8FmnzjD/UKrk
         v8H88NOUIkzpsJWC9AhzajXKl1OVrESElhsLAJXnuJl4GLNF0XrH5BReoNfVW9OPIWe4
         TvQMgYVyAIRaK3DqBGCQf3fqL965BgBtbfl1SObm8ukS+m4HXSxylGx9ZI4eeh6rgPSH
         2U/BXuezcF8fxE5gsf0zbLD4cTULpfIQTzJwMhv3Hng+rYyTHIpJtRLRXYafnwp4XfYx
         SWKw==
X-Forwarded-Encrypted: i=1; AJvYcCVQzUd/sFxHYK44SddUg9+t8AWm1Mxliz09MauYx3g3WFhYfJtu2klyqcTqdgbNZQSK9fldc/HP6E4dzJU=@vger.kernel.org
X-Gm-Message-State: AOJu0YztEVGfEnytN5bHlZtUgAUngFHO6b/q1TbFSrIj7jCVSGll1x0x
	MpVdS/thCNf+aPcn28rjySN8qtyP3n2ZkNbFmAO88UarNLnshAzCQchBpB5WNDC55sc=
X-Gm-Gg: ASbGncv6iA5VhfABdIwKhrwxL6O0MqYntDj+cMBvhU4YTVzqkt9+gFzJHeDqqoPb6G1
	o8CZ1MRymSM0qBgH2xK4Vs++50aakClo9iYl4h8lwB4SoRfknj98es6woercDVNPh6mK0UIrVkS
	ogi2NV1gP0AEWfGCJF0NDU7cxG7KAIcvIi3CuXHfH3Mth5ZfN7zr04Hg4LEKI/SBRQtgnZUegMp
	JHRD03EiZu5L5+tH+e6XDOHlT/3Ao4+tajh3UQgBXxOtt36MYeaOFxSBJHqTOgQZ2pEC5jfaa1J
	neyUwZP3xlsa0sQv/oUHVMKccTtBa/2hFlTl0xgpckVwaslzjZSNW4E2gtmXvD37O1U18eE/tIr
	Vard6/xrWBUhz11HA
X-Google-Smtp-Source: AGHT+IEeHEg+Hg4x2iy77C3/j05y23jbIyhzffYAMnvjZeeaQdFPQuoxmXUZU55UnAxgWdjFJ4co/g==
X-Received: by 2002:a05:600c:c178:b0:442:dcdc:41c8 with SMTP id 5b1f17b1804b1-4520147f531mr53614315e9.19.1749287822790;
        Sat, 07 Jun 2025 02:17:02 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e055ff5sm50162105e9.8.2025.06.07.02.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 02:17:02 -0700 (PDT)
Message-ID: <6e3646d8-24be-41c2-9aab-d4397ab3afb3@linaro.org>
Date: Sat, 7 Jun 2025 10:17:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3] media: venus: protect against spurious interrupts
 during probe
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org
Cc: hans.verkuil@cisco.com, stanimir.varbanov@linaro.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250606152522.4123158-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250606152522.4123158-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2025 16:25, Jorge Ramirez-Ortiz wrote:
> Make sure the interrupt handler is initialized before the interrupt is
> registered.
> 
> If the IRQ is registered before hfi_create(), it's possible that an
> interrupt fires before the handler setup is complete, leading to a NULL
> dereference.
> 
> This error condition has been observed during system boot on Rb3Gen2.
> 
> Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>   v3:
>      Added Fixes tag
>   v2:
>      Fix authorship
>      Fix spelling mistake
>   
>   drivers/media/platform/qcom/venus/core.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index d305d74bb152..5bd99d0aafe4 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -424,13 +424,13 @@ static int venus_probe(struct platform_device *pdev)
>   	INIT_DELAYED_WORK(&core->work, venus_sys_error_handler);
>   	init_waitqueue_head(&core->sys_err_done);
>   
> -	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
> -					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> -					"venus", core);
> +	ret = hfi_create(core, &venus_core_ops);
>   	if (ret)
>   		goto err_core_put;
>   
> -	ret = hfi_create(core, &venus_core_ops);
> +	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
> +					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +					"venus", core);
>   	if (ret)
>   		goto err_core_put;
>   
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
