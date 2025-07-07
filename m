Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB032980D0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 13:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751894614; cv=none; b=hZuhUbZJekdC1l8e+d8O9lC2AslDE7d96OwSe8BZITYo+BLoHUSb0WmVirZ7aRuimQ5H+slx+Bind3L0RUIDuLnSSlZFf+FpEDXv2K+E/eOHQEyddzdc2PID88B17OBfhoO04Lc1hrc3sC8iJNY7nw/dPPSwjSeDqruUK3J2hx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751894614; c=relaxed/simple;
	bh=9XfDpieyU8b2140bQho6t1DhMkVdpW1ldUV4ZihuTTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RoRHtht3tx145kJyegIJrrIqCIzuSOe/RAGpxAvDobrMxCitoYu8qyUR7mUvFHzj98xH/O8xLIeJXwSTX6F98EpDUAza/nt/KRlNWbz4elvhGgcOM1oojk8fgC0fgxxeSiNDeA2vIjD3ppQv0bCyhU5XCN0zylSvEBeP8lVVtHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gevcj9V9; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gevcj9V9"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so2922610f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 06:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751894610; x=1752499410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A1JkCspwJaFqJzSejsi2dTXNLAQ9s3FaAdM20lcOhVo=;
        b=Gevcj9V9EMw7bXaPKvYUKkie88kBByVNXW+lKU1EXPEP7LZnEfQUV3cn8x58bQVVwi
         DgvPnSK4Ricdtz+otQKqZyLyJ5TkD/C1qTC3MpneMBtyg2nhIg07TkqqxsG8eOLi9h/D
         nTQf2/HI/huOU+tN1ZB3FXviCoSl//+xlUS+96oCVHelxXpJE76qCWXJP7zxmA1Mzp2f
         dPjFXQJAWLFBcoWMt0XFh3iXIC+jYPUmceClcCnKCf79zK6AL36Sb8fUFUVQowvTuKu1
         akNZ5I/q+bfK3Vl+ju0teTttgLIrwM5838oQPUPhCAIxx8Y8ej81BimX9aQPl8nS8fnc
         Cf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751894610; x=1752499410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A1JkCspwJaFqJzSejsi2dTXNLAQ9s3FaAdM20lcOhVo=;
        b=F+qiX9E3LYUY2BO5WJedQ3fpFYa3IN/+hHrGiXFkPVYHdzU6TVfRDuf9+cJy/Y53ol
         HC8WhPVWs3AqFjTz2289oR+DMB4P8rdRcb3yeKilF7/vCJfhyaTD7kONS88FNQ2+oPO3
         Uc/0SHflUe2N/c8aMey9hhZLYJgZM1kYeDUCmHA8HovtBz9KLvr6VCHadtP4ae3yKJ8b
         15Svme3A4Y7/BUdZr+uCoCVpnraNw5Bw3plt1EIksroYDVAecurTlqy8BdrepjcqEazX
         ntJOoUWzJiBAjkV/As5tuMC24o/p/ShhExu6E/zEOt7ZmRxpFr53dGQoZIqcQHkZhxF/
         NZQA==
X-Forwarded-Encrypted: i=1; AJvYcCWBdPI55MBiCe6NNz9P7gQMka9IkJWUE7EcKHIo4j2N60NBF71AXqG2D0MVqDwWpfNBxarUQXM3frtzVco=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/+LHyBEdXMh+HIPqMX+gGi+jmyWO6DdPScEiW/d/o8z9ZLbTL
	w9EUiXbP3n21OgIPzXpnTmiTvdznlORA7U7RMYCD3xka0r/ZpLkE2eMRM6cYUJ2lDBs=
X-Gm-Gg: ASbGncv9s7LDAcAK/81xn3JUr/BASbBfI3TcWsJsg4iDgubLamWoLZ8rh/p9XSYFhPm
	IDaE1qcjtIvvav0tFDL/9boy/xfVOb6bUxCxmCQQELrQ1aXnTfIgtfkycAR2JNbmuMr/SSkpb1s
	r9JCoF0ZOZLM737j20z2GXGTMUF35lPJ4AhzbCuWrCHSGtoY7upiYS+BvLEzHE75pdd/Q/dEv+L
	O5mMp6UNkG90i13DwjKNnIIZUYxUQkR4E9izVAZQ+NwH1a0FBsHYEWaNN6Q+TSAynfTYyvfTofV
	az5cvJaehTWMG9ygdnbCeTpSu0lmCcDem7b0DoEPIgyNYhRQHlTNrrqPKQyNKJkPyvixDX9b3pa
	cYwX3ebF+OWNlaFb2IKsIzcS/qCzgyOM=
X-Google-Smtp-Source: AGHT+IHqvfoZlxqkZhFZeUbrhKra+ACvfYiFm+JNhrK5L5id15gKmlIVnrRthZyMexYFNceXyA6Kmg==
X-Received: by 2002:a5d:59c4:0:b0:3a3:6595:9209 with SMTP id ffacd0b85a97d-3b4970294afmr9707717f8f.36.1751894610045;
        Mon, 07 Jul 2025 06:23:30 -0700 (PDT)
Received: from [192.168.1.159] (p4fc3d4fa.dip0.t-ipconnect.de. [79.195.212.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9be0bacsm138744515e9.32.2025.07.07.06.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 06:23:29 -0700 (PDT)
Message-ID: <06760125-4800-4068-8936-dddf27c28d17@linaro.org>
Date: Mon, 7 Jul 2025 15:23:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pmdomain: qcom: rpmhpd: Add Milos power domains
To: Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20250707-sm7635-rpmhpd-v2-0-b4aa37acb065@fairphone.com>
 <20250707-sm7635-rpmhpd-v2-2-b4aa37acb065@fairphone.com>
Content-Language: en-US
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20250707-sm7635-rpmhpd-v2-2-b4aa37acb065@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/7/25 12:18, Luca Weiss wrote:
> Add the power domains exposed by RPMH in the Qualcomm Milos platform.

\o/ codenames!

> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   drivers/pmdomain/qcom/rpmhpd.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
> index 078323b85b5648e33dd89e08cf31bdc5ab76d553..e09552a469264f28952fc46c3ab8c125e87310da 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -217,6 +217,24 @@ static struct rpmhpd gmxc = {
>   	.res_name = "gmxc.lvl",
>   };
>   
> +/* Milos RPMH powerdomains */

I can't find any public docs telling us which SoC is Milos (the only 
relevant result is Bjorn's email asking you to use that name instead of 
SM7635). So for the sake of future generations could you reference both 
names in a comment somewhere? Or even the commit message would be enough 
tbh.

Off-topic here, but maybe it would be a good idea to add some Qualcomm 
platform docs to the kernel with a table of all the publicly known names 
for each SoC? This would also be really helpful even ignoring codenames 
just to know that SM8550 is Snapdragon 8 Gen 2 for example.

Kind regards,
Casey (she/they)

> +static struct rpmhpd *milos_rpmhpds[] = {
> +	[RPMHPD_CX] = &cx,
> +	[RPMHPD_CX_AO] = &cx_ao,
> +	[RPMHPD_EBI] = &ebi,
> +	[RPMHPD_GFX] = &gfx,
> +	[RPMHPD_LCX] = &lcx,
> +	[RPMHPD_LMX] = &lmx,
> +	[RPMHPD_MSS] = &mss,
> +	[RPMHPD_MX] = &mx,
> +	[RPMHPD_MX_AO] = &mx_ao,
> +};
> +
> +static const struct rpmhpd_desc milos_desc = {
> +	.rpmhpds = milos_rpmhpds,
> +	.num_pds = ARRAY_SIZE(milos_rpmhpds),
> +};
> +
>   /* SA8540P RPMH powerdomains */
>   static struct rpmhpd *sa8540p_rpmhpds[] = {
>   	[SC8280XP_CX] = &cx,
> @@ -723,6 +741,7 @@ static const struct rpmhpd_desc qcs615_desc = {
>   };
>   
>   static const struct of_device_id rpmhpd_match_table[] = {
> +	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },
>   	{ .compatible = "qcom,qcs615-rpmhpd", .data = &qcs615_desc },
>   	{ .compatible = "qcom,qcs8300-rpmhpd", .data = &qcs8300_desc },
>   	{ .compatible = "qcom,qdu1000-rpmhpd", .data = &qdu1000_desc },
> 
