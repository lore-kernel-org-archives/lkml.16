Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F76192D8E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 01:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743990984; cv=none; b=OEjpFqhKswafgf21NOkSkxjHNPiUYJltVE4yHysTXU+U1qEVh+cfWWzT2BCzSTfJi6HD7YCibNuLeHQXW6XmybmWJVAuxV3w1On1ylaX3SKj/7OLOGfBc6JWBOFnFs8uUfhJpFhg6RbpOTvYQQo6RjcMVwk50HY8+nYRslV9mEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743990984; c=relaxed/simple;
	bh=IY9wQv5QYjnton9xyExM6/6K7e+EX675+UCUIKuhgl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WaKQAQaf1O7tOa8ousskNTlV2ZXBK2NK3qbOOmiNLKi6fNSi1XfB45GGSF/AOFp9I02zJOfcQNqRraP5fEGHNOKn2Ln9Gyhkax9tQpm4OtobG80f4ZzKLWWJgETTSMs6D7F0EqtC5rgzwdIeb5j9G9REFY8RZYeeZtJtfI87P0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=eDeqSOmL; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="eDeqSOmL"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1743990972; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=QGLGkN5/shpcy+Bpvya57NlIVQgTS+fWZDBSKUbMNQ8=;
	b=eDeqSOmLt0TqqPc4fF2aECkyi71PDeHVtVrsXoizPBc2HoOSrvEGeYvr/mfnSmUR/KyY3xrPDQ/6eOf/slWkg/65v7gShXYSIzfMBmN3+YbASc4OXSTWq81EXUQAAIIreQSEFg9UnlNpiR+fQrAHiTOSboi+dJEFNv7Hx3nGEEU=
Received: from 30.74.144.125(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WVjWt1x_1743990971 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Apr 2025 09:56:11 +0800
Message-ID: <e4da515b-ccd9-4864-a61f-e198e640e6db@linux.alibaba.com>
Date: Mon, 7 Apr 2025 09:56:11 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] mfd: sprd-sc27xx: Fix wakeup source leaks on device
 unbind
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Karel Balej <balejk@matfyz.cz>, Lee Jones <lee@kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org
References: <20250406-mfd-device-wakekup-leak-v1-0-318e14bdba0a@linaro.org>
 <20250406-mfd-device-wakekup-leak-v1-8-318e14bdba0a@linaro.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250406-mfd-device-wakekup-leak-v1-8-318e14bdba0a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/4/7 03:50, Krzysztof Kozlowski wrote:
> Device can be unbound, so driver must also release memory for the wakeup
> source.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks. LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
>   drivers/mfd/sprd-sc27xx-spi.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/sprd-sc27xx-spi.c b/drivers/mfd/sprd-sc27xx-spi.c
> index 7186e2108108f0d779bfe72d476fa333194c23ca..d6b4350779e6aecfa19d9fa21b9174447d589e33 100644
> --- a/drivers/mfd/sprd-sc27xx-spi.c
> +++ b/drivers/mfd/sprd-sc27xx-spi.c
> @@ -210,7 +210,10 @@ static int sprd_pmic_probe(struct spi_device *spi)
>   		return ret;
>   	}
>   
> -	device_init_wakeup(&spi->dev, true);
> +	ret = devm_device_init_wakeup(&spi->dev);
> +	if (ret)
> +		return dev_err_probe(&spi->dev, ret, "Failed to init wakeup\n");
> +
>   	return 0;
>   }
>   
> 
