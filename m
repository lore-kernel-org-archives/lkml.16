Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C1230AADC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468319; cv=none; b=CJ6AX58tm5zkAu0ZfkMmFqsOOxATZP0oYNdE9XaGBngaV0U5uT5ECXWa5jX6zAVElTohaZ5TNSiPGrZBtxYCM9XTw78M+zK+ITpOo9QhQHOOtGgwOqUfiEofZs1MGY/8QQN+VYMUOdOes2ne4Iam54BKKuWmQCmN82y8lRIKdlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468319; c=relaxed/simple;
	bh=jmdo0wtlEM9OGtqiUmj8GSs9s2w3JeA5xOWYKMd/baE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SqYQqO2JfnHRIpG8/P13FHwAFbyINqqjAdl/de6E4u9EbRTDz8oJX3mXNwU8CuJHu8MqsfiwCWakqmq/+miE6hoiWrfZ+zU1XC6xwb/I310DmfrJg86grxULnVYsHt3y76dL29RgJWRXQwG/QjAKqhNATq566zzLokc2xTHsB0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iIjCKHzV; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iIjCKHzV"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450cfb79177so42045085e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 07:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751468314; x=1752073114; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JO+LYkjBSv6Ibw6vZ1z2UPxJ2+RcrEARZpMlMoEjCbw=;
        b=iIjCKHzVmgD9ddqjWVzRYA66hWINjAVkj+uAh5e+xoNYufqoojFWsAolb4Hh88lmOC
         6pVKTFkGAGwfPBrz2CNnmUoy4+FdK7pbrwdcqPqSgakMPgnljxc1t6XAcaHuNxfLVIiP
         WNszDQbv+Cr6HuqdtqxtX65GUBiEA/+1AV/sa37fntaTI7UznF8Deu1MLQfdGwEKw8P8
         VWea/7OVxY97m+HPrWqMxOzjxpcdufhTElopGmDQBAYKh89NKzZ8Va6tGw/GlzwIq6hr
         jpVAG0D7E6vbWN+Pguxiu/Qxkupnmk+zQjdz7lKnqxHKs5jD12Wu9cEa3rStz0RbcvwE
         9OJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751468314; x=1752073114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JO+LYkjBSv6Ibw6vZ1z2UPxJ2+RcrEARZpMlMoEjCbw=;
        b=WsC0rVc/a9CyFXe/+UAWE36Ah9nLS8dv4VXvcNFGdSFDg9EJn0m+gtFiAWrdiEN9Tj
         t1eQpyShxUomMqw0ncHYhjBi4qiPuwL7mJM+a2fgD3dj8ibsDVZM1Zusqn2jRftr+PCs
         VKrL8fNvT6lQ3WXqmWpjzy9asVwDEBkLigaUG/UrPZelzvFsMtmSFT+QgOGuYWGR+okE
         /8IOCj74YCZub8X+5eyCboge4baTDr+lsQxTUXyt7xaGwfhddgATI3mf7NU1gHqHlHJI
         HzZFN/m/wQPDefiEhIoVrWDHnJr7tlAM75xglhGuUMKb+bFENd4s5eNGgs157uHnLcVK
         MMTw==
X-Forwarded-Encrypted: i=1; AJvYcCX5uxFzg3F2hUd8PVDnDwJJQFoNCq/6lFUtGTj4hMEJYRyVlTvK2qHhxyP5ZfxvbN9282EmSygN+cksWpA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5F1XY7SvRwSD+WJ7oVWHVY0R8FXZQmUXAxPFF9f0arfXvmR0n
	Vvv75jWcPJKref2UZB7r5jbi7f/B56RBlAw6y6JGEwEoKfkRYM5IErsBAJEJ14ojqLc=
X-Gm-Gg: ASbGncuN41s+kpslCb29MWNJ8KzYNlA3MnzwUgwkcNzqhiTLPnk+mMP1b3nWy4vUk/b
	XkJ3VxfuaEFwlq25lRVoNHD6Bb0un9yIflpge4W7I//xjMBpWzaomFBQIeRRtjpXjumkesqDpGT
	V22im+vMf4gKmGFNxS5E+iRG5kaDvrd6T44uuP3OWL1lLhGLwSAFeiYunXMZSmOBoCt5ij3rH2p
	idfHHu92ymHk6fH28Q960IXAbjHY83yYRlbgJij7ObAC64hOWS/1a59lcdPFbHxev9C/PE+y49Y
	StStob5vIAUuspOmgDRLflWdGvKtJGc0/JZ+FBEYptmoEYLkNr34gif0Mh0itG+z5r1M1K9YJBv
	qnF7AGgmMSd1O9fG8ChgXkgVR/Kmx+qf1HOOcORw=
X-Google-Smtp-Source: AGHT+IG8IhnVjdqSTayA9JUM4Fr5GDQ3JacEz/LaBYGYa1zzNjcnf1n3rb9PZrhs50FB927OOVq7Hw==
X-Received: by 2002:a05:600c:6389:b0:450:d019:263 with SMTP id 5b1f17b1804b1-454a370c053mr34926805e9.18.1751468314016;
        Wed, 02 Jul 2025 07:58:34 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a99668c5sm582525e9.5.2025.07.02.07.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 07:58:33 -0700 (PDT)
Message-ID: <8e7e0b5b-28a0-49db-9acc-f3a4c7d90559@linaro.org>
Date: Wed, 2 Jul 2025 15:58:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Call correct power off callback in cleanup
 path
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250702134158.210966-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250702134158.210966-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/07/2025 14:41, Krzysztof Kozlowski wrote:
> Driver implements different callbacks for the power off controller
> (.power_off_controller):

The driver

> 
>   - iris_vpu_power_off_controller,
>   - iris_vpu33_power_off_controller,
> 
> The generic wrapper for handling power off - iris_vpu_power_off() -
> calls them via 'iris_platform_data->vpu_ops', so shall the cleanup code
> in iris_vpu_power_on().
> 
> This makes also sense if looking at caller of iris_vpu_power_on(), which
> unwinds also with the wrapper calling respective platfortm code (unwinds
> with iris_vpu_power_off()).

platfortm/s//platform

> Otherwise power off sequence on the newer VPU3.3 in error path is not
> complete.
> 
> Fixes: c69df5de4ac3 ("media: platform: qcom/iris: add power_off_controller to vpu_ops")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 268e45acaa7c..42a7c53ce48e 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -359,7 +359,7 @@ int iris_vpu_power_on(struct iris_core *core)
>   	return 0;
>   
>   err_power_off_ctrl:
> -	iris_vpu_power_off_controller(core);
> +	core->iris_platform_data->vpu_ops->power_off_controller(core);

Correct.

>   err_unvote_icc:
>   	iris_unset_icc_bw(core);
>   err:
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
