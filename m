Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7970222599
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745614471; cv=none; b=EUTZU1Exuea9Ei3ba3ZgeqAaT0vLV9HdBvkenjFibG0xO990Zp+X2FwVRNiKht1GBuXcKlTsceJt56KsuI/RRxGj0k7zC+KX6FStkXMK6TYkqwF2LYVHi3gN5aonCC69z+we1lC29kiZ3hbLgiJwXF3Jn7Hze/zcSDk9LLn87VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745614471; c=relaxed/simple;
	bh=y3QBxpLU4EegLlWms8FmmishWO2g4sGgxJbSZbHeDM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PjJynFq//MTIwv9HIOYNOXFSvL0wBmp4CmtCCVi993w12uHVb710BTkWAhw5cAELYqL4wogJdbEswIdCalG6Fy8EVxU5DcDVgVLIzHfmFC10zhdhVD2f8COXItUzkSeW92T09wIdeJEojgCHEXnDAtziw9BIqv+vbKgA23/WhgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M2amKR2/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M2amKR2/"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so25791955e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745614468; x=1746219268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+TU5UixLb/Lcz1sIttj/596FCniYJ8zob+CBmECF494=;
        b=M2amKR2/F6tGJtpCFjAacP/xaUCa+t2COOY1AgwNL/nGUd58vxX+eRU6lCLGakqssF
         9szup/CHN7Fj4vCh2V4dZeg5iiJLs3SxzDTrrxIS+GRYIAjsK3UCydRkvSEXNeIWEBeR
         4tTmw1JVm9NC45hg6vqbgbZNBAL2h3HhWmN+WgTQSy/a85hU7i0V/HPnwYJEPBjZYO9O
         qM+oWpVslVJiMugLazGgBL9x0qRgXvJVR6ewPWSGj8eWXafk+F89U3PKOznmHZWklM+3
         +zRuwDRYGS3YNeFz/o4ndd25WePCKNoUIaV7KwEie5ICrLHcy6XmyLBHXfbg6LlYLmtx
         yrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745614468; x=1746219268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+TU5UixLb/Lcz1sIttj/596FCniYJ8zob+CBmECF494=;
        b=BYZRVzNcaFAZZSyghvDd7N70O/j0QT0SfEs8nKoSU8aUwJZUQa1j7RpM+w3U+0JJpi
         jqjU/lxIhOGXS81VoABu/E/FjU8UgXDv2BCSI4EPDHc8MfUPlgsSM4zq78wlPXHEQSGU
         oLK540G0l+1M7a3Yvwecqpgy9O4+MKr2lVEQx6mgI+qwaRUROrmo5cSakirVYxuNH/XD
         pqtgwrnIx2pzqHwlAdnwDHaPCxdm3ZnxdClkRMYl5RP+zaacBUJE1ftfmRTWLRo0Mo8z
         XpCeqG2Ydr2pGinY5t9iweKBt+Ilexgefz359oOb5/9rqHBWHRQz3Vcos4MahMaE5rMC
         l5Ew==
X-Forwarded-Encrypted: i=1; AJvYcCV0+I1iMRwORvDeWbjOqGqUJI8XsuPpwehSl5o5DsgFeTfU3gLkWTVGa+yo5NHJ9f+hNkqSx+q1mLk3YYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgIR4a5b96PcI1PCA17/9REkZ2wBKSBdu2h+z9dosazcrls95C
	WFYSsOxceok6nJujyZb2m47cRw3DRuidwUNduxWhz58nfbAjytb/0ATW3YwwAVo=
X-Gm-Gg: ASbGncsIKKp9/YQJd+MWwo/sUNRabOyOPlBBEsODbN2rG/JDQ3Xtdz2hi3kT2r46+W3
	pTYl+PFcuepIaKks4bMR1V3kcuCP7ArXRiXhLAFu146Uxi35WGYYpAHnj7ZVhu6TCIajuIYly2+
	oiJ90k6+oEbE4wqSYsQTW81wrfQ5hz9SmU4Y4oWnS4Tv8CjUA+fvoRvs2DdbWeDkUNM4Wm2YEZz
	Yz/aJ55EspaMfxaZ7hyINlWJqHgJ5xDhrtFdPQHM/gt1ioJRh76voBwgMDDnuJqK5Yr7cQ36Nh7
	vsTVEfn/dYVIObkIE8blo0i5SdgR2D80PcneQbH2PoNFa9Bx/W7klKtRWk+TuRzz38uPZhJ53U6
	rJFWDAhVIv+GTQBAV
X-Google-Smtp-Source: AGHT+IFu4YvGwElh13buW6VpxKA/vVcb7uSB1tVZ6DbnzGwHpLhmj5iIZ9UFBDGGBhtShow69ZiPXA==
X-Received: by 2002:a05:6000:18a2:b0:39e:f51d:9cf9 with SMTP id ffacd0b85a97d-3a07ab89b29mr499207f8f.48.1745614468026;
        Fri, 25 Apr 2025 13:54:28 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d86f7sm67390805e9.32.2025.04.25.13.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 13:54:27 -0700 (PDT)
Message-ID: <a3c4c98a-45f6-4900-972d-379096e8244f@linaro.org>
Date: Fri, 25 Apr 2025 21:54:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: qcom: camss: x1e80100: Fixup x1e csiphy
 supply names
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, loic.poulain@oss.qualcomm.com,
 vladimir.zapolskiy@linaro.org, krzk@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250425-b4-media-committers-25-04-25-camss-supplies-v2-0-8c12450b2934@linaro.org>
 <20250425-b4-media-committers-25-04-25-camss-supplies-v2-2-8c12450b2934@linaro.org>
 <ukwt7mxabaq2om6is6smvwedo4nweugbauapeuzhbzj6jsbwk4@5eiksknb2bf4>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ukwt7mxabaq2om6is6smvwedo4nweugbauapeuzhbzj6jsbwk4@5eiksknb2bf4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/04/2025 18:27, Dmitry Baryshkov wrote:
>>   static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>>   	/* CSIPHY0 */
>>   	{
>> -		.regulators = { "vdd-csiphy-0p8-supply",
>> -				"vdd-csiphy-1p2-supply" },
>> +		.regulators = { "vdd-csiphy0-0p8",
>> +				"vdd-csiphy0-1p2" },
> This is an ABI break. Please mention in the cover message why we are
> allowing it.

Not an ABI break as we have no upstream consumer of this just yet.

I'll V3 this to make clear though.

---
bod
