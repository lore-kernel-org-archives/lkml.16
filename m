Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CED22153D3;
	Tue,  4 Feb 2025 16:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738687581; cv=none; b=gSYoTaZLjPnMdbTld2xuChs8NDHOKYmRF83GqpKcLFUwIEKrHnYaKe0ilKJtZ8C9Jvd0cOTYrl0MdvJtE6fttgHzIVOdmZJNf0T8BHeZfe4tboIjDEpehL8LKkyA93TfXzD1oaoxdd/Iuzr9v39xGjrZ+OdAwitiDk/fFkaF1tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738687581; c=relaxed/simple;
	bh=6WoYhyQuV8rFp7jubI4neBJnEuNk7Olf5CohNrIqXqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YvwmpaaiWkDOmny+ajYkyuQS3MioW1iS76XQHKQBIgeEKxSPD9vPr7Gy5qBe6u3APSrNw4JYn3clquISYSf0xyRRqJDti5BCqmN/8apoT7ksrlIpqo1kBHZA58LoIDNSQ2WhfJvHXstStUw9Kn6dnUe3qDphNHXPsjV6dEq7/tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLvqAXp0; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLvqAXp0"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa67ac42819so872132666b.0;
        Tue, 04 Feb 2025 08:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738687578; x=1739292378; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bAIs5I+VFr2GejFoX2T/rQp94SdXPfytTAWpFTw7jK8=;
        b=bLvqAXp0vs9/quTgg+YsMTjn2hIkdaWlKUpvKzScNJpTU9wk/Bq+GpggyI2cWzkQDA
         3MWp6k06vlenvmH3rMV+1QVK1bQ9XTAoSgdw0j/5scc3/RtFWG8kbq4soe5poesl0s1w
         EVshxKE7PbFhwKrE1Da5fd+kJs9Zlyyz4lam9yZ1a+mCaMFCbdKFsU2CRkdYrCQhvgLx
         gy7jJXMwL2Q9JbWN+MP0lc/AWJ/Qx9Cg0kuwUAohFG+sbdtKVh9tJTZiz8C7Q3qA8uNk
         HmLBUohfbZQeaXsdlPS4LaDeWQnxX19bst8LeCJKv3x4mqgp/igdylADUhjdosD3/AIf
         oLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738687578; x=1739292378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bAIs5I+VFr2GejFoX2T/rQp94SdXPfytTAWpFTw7jK8=;
        b=qXB2Whqk/hNicRn5XX/7A7ZxLRJ4PHI2njpnGMFrn1+HifZ6YEaGGmAKCryXpchdZr
         SxNUFhrcuayentSAsTNiHHE//TXsuyQC8J14u2Wltcwqu9razpJFLcjOACG7wg9PhLYO
         oI20BROKCjWmJIgGCegbd5cNgyaLOQfDunY2084TtzTryfrlKELh5uSDzWERKqBJTbKm
         er35akQNGzD6gAru4QcO/rjrfWcEiKtdXCMEqzhWtxsnYC9oRo9l2QcIsVwS1rLdbif2
         gxCvFa7fRhuWiiPk/mFnzxAlVkBUHEjeJHQvEk9CkVwFVw7aUe6yGSBwVjRvckrh17qW
         mvhg==
X-Forwarded-Encrypted: i=1; AJvYcCVJg/tONUr6gfEnZpNtM5GNXKaWsLvVROeis3cmxQGXAt7/8YudY5f67rDa6W3bgIJByxIss53S+IhVArw=@vger.kernel.org, AJvYcCVkeWpJpaeRZJwekUKiLUhMhbUFrjHWERvuE2kLqk16OWsmS3sXalfQastPWAW52Nvg5wXIrpFz4mUAo0c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzddchrc17eJWHmqEWN1lT04j5uW2/YLkA8Z2yXwYvD+HzGiZFB
	9Lv/qx1WsWbhKelnOjSS9GRvg97hPMRrcu+OzmY48c6JrcLzu7HF
X-Gm-Gg: ASbGncuao6miNG6V7LfsS29IXJ0BCsl4NUQRhZRLxAxKrd2+vYZLzkRlEzNUXzXeYT4
	LRhoRfONoo9PeDkwI5PhyiyY+DZF7pOBq1CuXzM7aD8+EI2XfaxEn4Kq7v1w+d/qLsrjggdTkrL
	Z+F29LisDRJH08nme7Ace0FjGC9jSz2oBbXYfG5oSjDWBIkXl5nZW2QYur9smQ4psu+O6padkkF
	cY8pK/1OFFxSx0Q9rVN5aqV1fL3H5DlSiHiBOt22+HGe2/OOqbLPu0PsNKea/ew6v8ls5b4t1HA
	FclBH/6fR3VuTkRuws0P8s4xCCH+n81sSA7Pnks/JsJz
X-Google-Smtp-Source: AGHT+IE79frgfLC8a4Bx1mxN3BZ+cxcioNpM5kWchbXny/5nm0Akp5DFdF7cYUim9dZdQ3f/v6TBQw==
X-Received: by 2002:a17:907:940a:b0:ab7:53af:3eb1 with SMTP id a640c23a62f3a-ab753af45ecmr249487866b.36.1738687577334;
        Tue, 04 Feb 2025 08:46:17 -0800 (PST)
Received: from [192.168.1.130] ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ff269sm945268766b.118.2025.02.04.08.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 08:46:16 -0800 (PST)
Message-ID: <1e228234-96eb-4482-bc35-343ed42af746@gmail.com>
Date: Tue, 4 Feb 2025 18:46:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] ASoC: SOF: imx: merge imx8 and imx8ulp drivers
To: Frank Li <Frank.li@nxp.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Iuliana Prodan <iuliana.prodan@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 imx@lists.linux.dev
References: <20250203171808.4108-1-laurentiumihalcea111@gmail.com>
 <20250203171808.4108-9-laurentiumihalcea111@gmail.com>
 <Z6EhvHXeNJPW1Cwh@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <Z6EhvHXeNJPW1Cwh@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


(snip)

>>  IMX_SOF_DEV_DESC(imx8, sof_imx8_machs, &imx8_chip_info, &sof_imx8_ops, imx_ops_init);
>>  IMX_SOF_DEV_DESC(imx8x, sof_imx8_machs, &imx8x_chip_info, &sof_imx8_ops, imx_ops_init);
>>  IMX_SOF_DEV_DESC(imx8m, sof_imx8_machs, &imx8m_chip_info, &sof_imx8_ops, imx_ops_init);
>> +IMX_SOF_DEV_DESC(imx8ulp, sof_imx8_machs, &imx8ulp_chip_info, &sof_imx8_ops, imx_ops_init);
>>
>>  static const struct of_device_id sof_of_imx8_ids[] = {
>>  	{
>> @@ -339,6 +448,10 @@ static const struct of_device_id sof_of_imx8_ids[] = {
>>  		.compatible = "fsl,imx8mp-dsp",
>>  		.data = &IMX_SOF_DEV_DESC_NAME(imx8m),
>>  	},
>> +	{
>> +		.compatible = "fsl,imx8ulp-dsp",
>> +		.data = &IMX_SOF_DEV_DESC_NAME(imx8ulp),
>> +	},
> Can you put imx8ulp_dai into driver data to avoid of_device_is_compatible()
> logic?
>
> Frank

should be able to add it to "struct imx_chip_info"

