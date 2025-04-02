Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2122E3385
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743607367; cv=none; b=FGp5O1eG9wfahb2bHWdB5lvBt5aZ1y/N75mx5nDuu8YIVWp873DmCd6u/qNSWLfn4kGYNooRPy6r2qUp+gVC3KUWSsRTg9aGEYB5jmkqYwdK2LuohAQsyUuWgFaTpmY3ImggfrYvYQhHHQLqogMM2sMO10o5rLUvoxuwIJHhW84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743607367; c=relaxed/simple;
	bh=3Y99YLi0vRUddSPZnSmuZjqueccVv5vRDRozcI2VZjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O2KZ1/3SVWO4O2CHdeDfhIeMc22KH5lG2UfmMe08/6PoJL/pAx1gwyZlcR7/cP7khbCIvPvyuldr0fbCppFeQB6b2OowtDvxQIUBkbpccbFs6HxA2RLhXWlMGecSSIAOv4oZKwGVAFlKCy6NI4gORraS6j7se6mNOvL0ViMSNwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p8gGpW6K; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p8gGpW6K"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so54019655e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743607364; x=1744212164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iBqRC267cLlF1qxs/ldypQv5XB794Feq9Jx7xZZeR6M=;
        b=p8gGpW6KFqXJx4rQKahyyNtg4B3yg+3KR/NasjXHazoM5in4yc9BSP44w71rd51uHw
         qP098eGTsymXGvsN1DdY27XEpdEJoy6t+z+Vz4CIGSOQgzZKPYerrGCJ0NGc51a6NYxV
         edYRRAlf7vCEIEKr/diZhhQ6fgR9gA+PKtdCyuU8/XngpthWW496sayr377LKTuKZ2zu
         PMZZBpQhbQMVb0CPNphm/o2Roc+4L7AbVGWgRRPqUzvrPUzxi+U0aIN1GMJqaUa9tACY
         3WZKDUXQCzAICo/lDMQdYtvm/+lHBHOHOp2XfuQ+so6qyoF/eIHGkRvPAOfWGSH00nYH
         pnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607364; x=1744212164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iBqRC267cLlF1qxs/ldypQv5XB794Feq9Jx7xZZeR6M=;
        b=MODC80ahgKm5D6IBjsawf6uvPa92+3oW1b6b8fP8oHYEa4NxJSL6RiKMRnxKtXwgfV
         mVIc94kMjJV60ZDwt1juzstTPfxTsxx9FNsNlDQzowTo89OOuvMhCmg2biat7GZYQKPq
         vwRVHdt8OW2kWmxu9lvTz/It50Pn6AQcSftVS44QmgaVxY/xiA/dreUWH6dI26v0qFJe
         dsh9EEUIJAGviQuNJ6935nnyYpzowHmr52JdvM7Jry2KOpquuKiqYZ7SpexFXqqB4kVG
         4Zkk8d/vT6d7HhQeI3+JCc2Yu4CGzI0mU5ayV79f8DY5eep9PdGqGEhusLfIwAog+nJX
         lvuw==
X-Forwarded-Encrypted: i=1; AJvYcCXvYLDho6bFeF4Oh2/GNc2v521uGWHoJDAstoizv9ErOnUAE+CZxbCdjs1+zeD+FgHLq2NXUh2KM/9mxdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiLBVT50K1N1MWCg2TUZbnVM0f3U232yUmVR5bmSJtTeAab1Ro
	0RCicWWqILkEOgYLDXsfogdN+WzMJArkpTp3Y6DEXTQDprPqU5f/VLg+9vigAqU=
X-Gm-Gg: ASbGncu4GwRaSvIvUiar3lyUBP+qBBWR22j++Oo1vXr5+BBXZztxUCkFLCJ5mRqQlOh
	aFgfG9EiMoGPHoxvSuK9Ca5H84E8vT1rWN7HxNqXtlhBMysuc+xkrhlCem/GH5HWzJtoGOSr7o1
	/UFFB1MmKLEMT8D9Nc7BhQd4sItMBL0mtMmqTrPkQtFuA3Wc/ZY6wEPe5FUq4IQbkwbN032KCFS
	nc1BX5awZ2WpuwLQKxuT2Fgt6DZsK2UZVk90YvKjFt6OVYC6OrZ8UyJWVGHU3aMC3thd4xMNySW
	zAm7x6BL7D6dWMmV+MII+MhgRTdBZ4BDb61ZXIWTpzIb+BEE3kB+SA==
X-Google-Smtp-Source: AGHT+IHgmckXCfIJjyAgdgh7HICnvf/RXlS+ITSeKLvapKO6U8Xg3MjxSo581r6gfWjbctoGhQbwhQ==
X-Received: by 2002:a05:600c:314b:b0:43c:fe15:41cb with SMTP id 5b1f17b1804b1-43db6249672mr172386895e9.15.1743607363638;
        Wed, 02 Apr 2025 08:22:43 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb60eb012sm24047505e9.27.2025.04.02.08.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:22:43 -0700 (PDT)
Message-ID: <94ed8cf8-1e0d-412d-9f8f-959fe4b5b505@linaro.org>
Date: Wed, 2 Apr 2025 16:22:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/21] mtd: spinand: winbond: Add support for W35N01JW in
 single mode
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-16-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-16-45c1e074ad74@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/7/25 3:08 PM, Miquel Raynal wrote:
> Add support for the W35N series by describing the smaller (single die)
> chip. It has 1b/512B ECC support and its own OOB layout.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/spi/winbond.c | 54 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
> index 99b9f333eb3142999d8f73d43537f1ed9789c975..9b0369a077efadac8bd6be632f15b822d42a7227 100644
> --- a/drivers/mtd/nand/spi/winbond.c
> +++ b/drivers/mtd/nand/spi/winbond.c
> @@ -23,6 +23,16 @@
>   * "X4" in the core is equivalent to "quad output" in the datasheets.
>   */
>  
> +static SPINAND_OP_VARIANTS(read_cache_octal_variants,
> +		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));

strange to see octal variants name, but just single SPI ops defined. I
see you define octal in the next two patches. How about squashing all 3?

