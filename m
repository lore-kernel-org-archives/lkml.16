Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E4F225A2C
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747311648; cv=none; b=GynoCVcTApDortxN4LLv4AzErznQPdJJJYXyQhsEddbdQrzbaM03qOj4fKVbRKvRPOom5prhi4COgpNAcAieonbTchJ0w8P5S3RbPXY1yaG9w8jbLuKciozQMiOqom+jhs6tbGdgLnpfCuEFqhA76ABT9jGIe4xVEYOcVXz6mPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747311648; c=relaxed/simple;
	bh=ySi+0M+CVuWfwFeLu3PPC0j4nsW75CVo4AF4TCbTxnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B3jbhubRp9YdTEGfC0X4iZ5HWiTujlFWN5zODEXOjYCGrnaUF1dTxIPnqQZoH+1ddBavrGLmEO+/PDT1Zth3U6ZXxZ/vEuupW2Jc6NwJHlVLNQI0Tn/7otMM1qG7VELmxYxK8HNYWyMQWkthT+jbLznZiEfzDtLS+ahS8A2ODFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vkwlCqZ0; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vkwlCqZ0"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso9302375e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 05:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747311645; x=1747916445; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UYYmwpP0MAwsA931NniE7DuDU5H48aT0XrSHju++1ic=;
        b=vkwlCqZ0SwyVN+cPtAK9kv43zZeGM4qFKReGHN7DGwZd7emjYjPH1vUi8xhrbRCcAw
         kJ6Q4FsCxiwN/HMxHllvoG4N532uzrQQnYf3ubwNePu6lqcMxgjxrA3KEcq3TSudUtW9
         E5Hpvls5kJA3DfCmjyES1anB5cVdKL7JbvZzdn4iqVUuWibMPnqFcBtMoGzqOsfscvAT
         an0nxyeZ4ogjVTZKCbU7T7J6xyu1WwqKLjcI8UXRTruBHPslrHRNILhZZqMiQEW+HLvY
         EoqE8Mg32OKjtoEWCzdmDazHkkWymizXLq7/Y/U6L69aTTthnV/gDj3QDFY8z7r09lzK
         QLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747311645; x=1747916445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYYmwpP0MAwsA931NniE7DuDU5H48aT0XrSHju++1ic=;
        b=Xpacq7q8ZctFO+4iF2FtA7A4xr/woq3uM+PQGwMd0QAo2mdvhYfYtFpR3x0XItmTaX
         LaqzYiJZt5OcA6lwnvy5V9Ke1zUz+o2gncwHYwRjLW59u9udP4SnKRD4zNwqeh3jchkE
         ogZwpkmY5EhBDiqu2faUbezzFLzxXt/4bZdoHup9VAFO40dWXjqHm8zoyLgOqZcosoUU
         CMlWxMFZEQ2Xz+7iOlTAVCwWUiJknuZ+2EaR1Pu2+vn3BnUyWniEr83oW5jxjbXVCwKt
         tB+/SbzxI1WSzm8ZxwCNuTVLKMehYtf9hcRSLh5MTPIskJ1u7u17Pn+RAMfj/4sjQVUJ
         c5pA==
X-Forwarded-Encrypted: i=1; AJvYcCWUcbQh/ZiQihpbVhnGpT2duJpHj/9cECm9wnsSJekXqGZZBQ4q/X2NaIkZMep11QxEEPU04y8zSax6UEg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4BsN+WOvmPg6Z+8vcNGDRW2iCYYNWDyHqKbGR7utHbVN9b9Cb
	oOa71QfTv2bzhcBWFYPmZbPAqFz8Qyz/+/FnsRhVta4VIPBgBLtWkRCuCl3w0JI=
X-Gm-Gg: ASbGncuozwgoMAqHdu8hllPtJUJSb5fLvIjZW1CI0HUY+kzwNiiGxQP1LYaqgKBSQ7b
	2wAtAfu9WqKKGlOcqUeyU8GbNGZkCULZ8ZgI9FPorSrUWDjnheebvAp892kzthghtVP5Nc6F9ML
	W1OjLisjwFd9g9wOT93Br3AQyc5jqFbk1tNAxFuSWeJ9MA0jPC75FJ+I289gAG8r9StUFSIeYXW
	EImaGCgiYE2ZwTHWf9kwQz/cx4AkHFRIuc9dIes/1sAEGCPVEFFNBQ8BEN8WQOUBjgOvGJE8kQD
	poLjumrzNFbpZOrggzYrq4j2lSJfT2iSnqMyNziaQBCi2UvNfEFyZdmJ8lcSkDVx2e8tqF3/Uj1
	vTJJqLDQ1
X-Google-Smtp-Source: AGHT+IFf5pIVLw9OgzawdBaBFW6KZvXprzzPf2JHeKzZZEBmezUo1iUF8T/ujeptaHHKPw8LeA0tyA==
X-Received: by 2002:a05:600c:3e88:b0:43c:fb95:c76f with SMTP id 5b1f17b1804b1-442f20e33b0mr74335285e9.9.1747311644763;
        Thu, 15 May 2025 05:20:44 -0700 (PDT)
Received: from [10.61.2.175] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde01sm22985463f8f.15.2025.05.15.05.20.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 05:20:44 -0700 (PDT)
Message-ID: <586c877d-0d0a-48bf-9c55-97bd24e86638@linaro.org>
Date: Thu, 15 May 2025 13:20:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/14] spi: spi-fsl-dspi: Enable modified transfer
 protocol
To: Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org,
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org,
 linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Andra-Teodora Ilie
 <andra.ilie@nxp.com>, Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-10-32bfcd2fea11@linaro.org>
 <aB6pa9m0emX2vMH8@finisterre.sirena.org.uk>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aB6pa9m0emX2vMH8@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/05/2025 02:18, Mark Brown wrote:
> On Fri, May 09, 2025 at 12:05:57PM +0100, James Clark wrote:
>> From: Andra-Teodora Ilie <andra.ilie@nxp.com>
>>
>> Set MTFE bit in MCR register for frequencies higher than 25MHz.
> 
> Is this a bug fix?

Not this one as it's only supported for s32g which isn't enabled until 
later. The commit message is lacking though so I will elaborate.

For the other bug fixes it looks like they are, so I'll put them at the 
beginning and add fixes tags.

Thanks
James
