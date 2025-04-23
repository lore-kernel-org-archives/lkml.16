Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A90524466A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745443678; cv=none; b=U2p8IbmdsjyHm+qJzxOGAXXo2+76WodzDMS7UEqXRpqT0aOtKVUIp/q6Mdhd/STY1xdb7EsypZvcZ/KNBCzqt4ObQrxEFcutg+Eul40sY7+AfPA6jGxm+hx45tYiNvk08WkPEXkeHfhKYXm5j+ucmY+g26O6ahOIwMaL3SLO9Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745443678; c=relaxed/simple;
	bh=UoXx4tGES9OMPPM7oZI7K3CxI/4ypR1vyn2KvyB5orQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h/bo108G0ppy90i1lUvOFEoTAg8UszYW2B3+Dk/ezDDaVLb9NloPy99T5vcwk91LveHKpwAEAce9VMMZGiDgy/jD8A55jHUCFNQR9RuRF17aHDmFBMi/TMAW0ZzyRlAfKHJNLVD7BGpaV0EUyMTPNpXS2ErZtvATdRDFrXCLD4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XLR4irnJ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XLR4irnJ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so2285215e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745443675; x=1746048475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aNVqL+OZswouyUq3SbRuMHrYu0xbf+/3y1/IN5N3DtQ=;
        b=XLR4irnJGnxyNuZJ6qrJIHxW9ByjG7kEGsip2cYdSXNLY0bXFDqhrI4MuyNbs5zx0z
         mGebB66qlTp3hbnLAnc7vTXRRJQraZ2WVouJ1ZnAHEcXIZpMcMWeLSC4WSWOEZwTzdWu
         HiungUpCZQeqT1kf2uKx57pHtX8GHgu9ZpWpR4cthVo9sfWANysDKCpZsfBqh2A6jsy1
         w+U93jdT9XL4IxBs0eOE57A1OqzaZjI8t7g2vptWdR3Q8Cd1eySulhKwksIq2VGIb+0Y
         v3BqZBoI/i65YLZQy06t2wa+kBT65uzU8ufl2IAEr8Ch9y62rmKK8N57eJEVg6MSUhVr
         LR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745443675; x=1746048475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aNVqL+OZswouyUq3SbRuMHrYu0xbf+/3y1/IN5N3DtQ=;
        b=UN5zMTLtwfuPzsOzGi8krnlJ9mngwkPfbmL3PNi36WqR4ZY4SYie2h8sQUO32L7vCg
         sJPNwvQqns+rBbz9Tphs101GBSVtG5TKKHXuQzoTZ09wQuw9scUWX6hxX5DbCYLiGebf
         /tQcxKqMIw51nMq2msRKFCryuGxidPXCQ5nGeNJxXB3gefbQTHGaNLDmGI+ioxaz1VEn
         jqBLYd2eMmEP2FsDG/aH4IrNE7qb/Q7LkfODGgO4zZNsmtYqVXp1SYRYI+Ozn59jjJ6D
         OLR3dtbKl7FSOri2/ykuBzcTb+TcwdALIcryguoNkmrUYFYGp3MUCMDiXhDWiIo+CxHw
         eI2w==
X-Forwarded-Encrypted: i=1; AJvYcCXp6S/8y6HTz7fsj4ldt+cvVpr6JYfLPMWQVQjiyU0KEWoQyJyq/UJ+c9lHkCai9PKzeyTjBxaRavKfePI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5uHFAa59ifLeKNibxItJ25o/iGjLssFrGaGIG3KlO8VN0d/dE
	GZN5vJ9O2C9Diqzj9+wgGrdbCN5RNnvL9OtRdc9DmCkTXFagKUh9MAbfWzbNOWk=
X-Gm-Gg: ASbGncvVTMHQJ3h/XqlynwTSagj6a5R7RZml8lmYbwSTECMZcrd3ltBhmYi/rHh4z2o
	VXCBHFH0+6URcQ43ytsxkI0JE0OPz79NJIKFkzZdAa8n8kq3AoBA14UMaMKpWYdFlyAHGyCcCiG
	5tONPLgrqGI/cCZJN0KHtnowsQU4llYna8CByMbDHDirgGiIP6UJ0orD0QUM3ym+0Q0sZOf96Df
	xRgKKZ4xnxLvReIE6hPqjH+zrqKmBSQ5d/bhbIgJiufMzzRAtdPv7gDU5vPgK06jHXJuB5dZ1x7
	c9wxcpH3NA/VUIZ3AJI8hKXdHYLIy0Si1GETgh7AhO2O/ipliQ5pyj51IMwuGo6PaY2L8k2pccx
	anG5zh0GgCcuuj8pf
X-Google-Smtp-Source: AGHT+IHqb57GnB8kDuXYgg2wy9NjvC9CrGI7gkJ4N6LcFpbnWl0SOhTR/Fqxf+gYXyCBGmhSP7sFMw==
X-Received: by 2002:a05:600c:4ec8:b0:43d:a90:9f1 with SMTP id 5b1f17b1804b1-4409bd051e3mr1119865e9.6.1745443675342;
        Wed, 23 Apr 2025 14:27:55 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493377sm20389750f8f.62.2025.04.23.14.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 14:27:54 -0700 (PDT)
Message-ID: <198b6f8a-8502-4b57-a1ba-77bb585aae65@linaro.org>
Date: Wed, 23 Apr 2025 22:27:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] media: iris: fix the order of compat strings
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250424-qcs8300_iris-v4-0-6e66ed4f6b71@quicinc.com>
 <20250424-qcs8300_iris-v4-2-6e66ed4f6b71@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250424-qcs8300_iris-v4-2-6e66ed4f6b71@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/04/2025 20:33, Vikash Garodia wrote:
> Fix the order of compatible strings to make it in alpha numeric order.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_probe.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 7cd8650fbe9c09598670530103e3d5edf32953e7..fa3b9c9b1493e4165f8c6d9c1cc0b76d3dfa9b7b 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -335,16 +335,16 @@ static const struct dev_pm_ops iris_pm_ops = {
>   };
>   
>   static const struct of_device_id iris_dt_match[] = {
> +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
> +	{
> +		.compatible = "qcom,sm8250-venus",
> +		.data = &sm8250_data,
> +	},
> +#endif
>   	{
>   		.compatible = "qcom,sm8550-iris",
>   		.data = &sm8550_data,
>   	},
> -#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
> -		{
> -			.compatible = "qcom,sm8250-venus",
> -			.data = &sm8250_data,
> -		},
> -#endif
>   	{
>   		.compatible = "qcom,sm8650-iris",
>   		.data = &sm8650_data,
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
