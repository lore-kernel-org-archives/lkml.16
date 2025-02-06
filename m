Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6138E15B10D
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738832538; cv=none; b=j7C18ufA1SuF+N+XZ9IRug75wNGCpD8l8dhr9rObcdsXK/FBOgSaRCeSjLASYcqxHqTmrIOfkMIsQu3B1+tm0FTh/8D8VBlqgCx4cOOKp5zpn3kbIkUEY152/V+v/TV5G5j0OO7xjwQa4AtOpx0MGMQK60hCwQBRFy7izhkN4uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738832538; c=relaxed/simple;
	bh=UAXyu6RSQTWRgiR0k2OETrZ560YXgX45bKcxld054/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kDKyqiwU5Dy15aKb/nOhjle/DJ4HHd0DhqvuyUiTm8g5RaqQ8N4+giv6NQnKkW8xAkRR4Qbn3mPXnmJsN6WbkwWQ+GVOtkTAQiEjMgfUglB40tNTCW0HcSTX38/WYMe4sfN0Vu710Cx0iPSxfknXZXJQcN/Y/GUfFh6uQJlX7p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jqjdhtwo; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jqjdhtwo"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43618283dedso6026865e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 01:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738832534; x=1739437334; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZPzy1Z8VbxCdd+MyKxJcvToGmvpLxSPc4zUEljsmwWY=;
        b=jqjdhtwogrIdhNoEmFMU5484Um0Td/Vy5MBmHm+kN7yfLHJAEJY6z1GR8UPZTE8hvw
         gKjPl/tuAGdH8l9kdFhgxfpWaoMRYxxH5NRZrJBDgWsKlJfP+W2jx2lYpbpiBdbvLDCY
         CCmrS05HGXTFoCSUp/BVwL4uGSyR8gbIb9jDP+hrbxHNt+8R5inm8C/7sgBsYZ06A7hO
         MDvp4y7EyjiT421hrX3SAjMLmWsQ74UDbjzismt/7Wos4iLsZpetE12OS6LNUzkd1iTq
         5+KbHlkZ3KTyKM+iY1rpDHSPQ7/jTio2wWdY+Fe1osEVLMfnzGZrSyIrDUjSrMkVuFn+
         ddDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738832534; x=1739437334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPzy1Z8VbxCdd+MyKxJcvToGmvpLxSPc4zUEljsmwWY=;
        b=EdlsbWy+xd5YqmsZqSuZtFXzkR1HoGWnxs1N6UJjaGpf0akV4DI5EVarrPXHw5FLt5
         obgT0cwuwmKnMZN9jJckuxmE1FvlGSuC3hit7Tq1tpyTbv7ScvgUAIsa5DzPDQU0I7EK
         t7Z/qUQphAEBtVGf/eHM+bFnUNHD/hSQcUOo3VfW8sKh5W4p/yurm0mvX1MjrXAQ3LUJ
         QTiLxmGG/lVEjRaDiOfdK8k19xHYdxRiwdkpegxspeOwDKCY75rEj528lulV2A+I3qAF
         oc0TC01xIJPt+0ZrqybG3sTGJSKTJuOhasHZkmt56SNqNGIqtvcxh/zSQ3CMBBgTupM8
         B2sg==
X-Gm-Message-State: AOJu0Yya4CcC2LIbbfS/hsTwV7HF/NgXucncwIJj2NSeQJs2oaYmEA8p
	1Rsi0AyXCQa68HLLfhB99Ul18LcLs0v1WBMabZerTC5RjSZzsutf/WBAiBJSTDg=
X-Gm-Gg: ASbGncsSFrmjYADAETws/F4+6Eo6peieE3cO8AXYxQkKpn743WzXcUqo0v9smn56tea
	SR0IbzNNXGZr1c/tqomxuIX3IeIPLOqZ2KzzYQ03LpPMq2LhdwUHm6VqpujSU88A3AKtiUHRHO1
	N3SSIixsE41yqvdNdRixfalIqbQ7QBVQx74ByQSvpdqSubL2HuGJqJXE/IbF46GqBwclrcQ+Nrb
	FqTIBUsI1VqKc5SClRmu0eLwqVHeeLmGVejBp+qv+2zD3hoEpiiZeyq+TyhFgwBIttpEyUMcP3w
	5kC01W0h51dAnG8M4deHQFjE
X-Google-Smtp-Source: AGHT+IHb4g4QZ/ozYPa6vvDOHmEuKFym5OBNx5m4o6Nj8tDENoav/RWlv4fqN6xllweSDexUwkeGoQ==
X-Received: by 2002:a05:6000:1a8b:b0:386:407c:40b9 with SMTP id ffacd0b85a97d-38db48d247amr4779823f8f.28.1738832534542;
        Thu, 06 Feb 2025 01:02:14 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf6e4a4bsm786590f8f.92.2025.02.06.01.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 01:02:13 -0800 (PST)
Message-ID: <1fa54c76-d82f-483b-b577-79322908fabc@linaro.org>
Date: Thu, 6 Feb 2025 09:02:11 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] firmware: add Exynos ACPM protocol driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 peter.griffin@linaro.org, daniel.lezcano@linaro.org,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
References: <20250116-gs101-acpm-v6-0-e3a2e1a3007c@linaro.org>
 <20250116-gs101-acpm-v6-2-e3a2e1a3007c@linaro.org>
 <f83ccdb0-4d22-441f-9311-d9a2c8cd3493@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <f83ccdb0-4d22-441f-9311-d9a2c8cd3493@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/5/25 4:52 PM, Krzysztof Kozlowski wrote:
>> +static const struct acpm_handle *acpm_get_by_phandle(struct device *dev)
> "by_phandle" takes the name of the property with phandle as an argument,
> because otherwise you do not have here phandle part at all in the
> interface (see syscon API).
> 

Indeed.

> Other option would be by actual phandle - see of_find_node_by_phandle().
> 
> I would propose in such case only acpm_get() or maybe better of_acpm_get()?
> 
>> +{

cut

>> +	np = of_parse_phandle(dev->of_node, "exynos,acpm_ipc", 0);
> You need bindings for this somewhere and fix the underscore->hyphen...
> and vendor prefix. It really would not be accepted that way so please
> post consumer bindings anywhere.

There's no consumer upstreamed yet, I don't know where I shall specify
it. How about keeping the function name and modify the declaration to

+static const struct acpm_handle *acpm_get_by_phandle(struct device_node
*np,
+						     const char *property)

This shall be in line with the syscon API and doesn't force me to
introduce bindings for the consumers now.

Thanks!
ta
