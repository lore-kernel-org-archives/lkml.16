Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C08C188735
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750696298; cv=none; b=XwORPOWL+Hw3Lu7gyAEmsZBtomxyPWQDNzJNFeH7JeyHiqUWLhX/P9nKOjwmD2HQPCVL+00S1yYYOchuhxM5xGR8wX3HzO+qX5dzonwSkrZw1/WQBzaXHRiEFLTMls0vEyjMyQwVhvVOu/RNf9WXdUJXW/OWGL2Zr/S45/9FNes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750696298; c=relaxed/simple;
	bh=8KsekKS5aRcVIvVUBtntQtfWkhVyoUlhEiE174K9srA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NTO8CFJpN/RopgTzAqaOR4dsJHQVoRN6LxVpPBHGPW0OiIglBiWnGNxWZE2Kfud/UmrTNyOpfJuMT4maumiT7tNYUTw+w+zjKcwC7THHhQaIKbEvq8c4mRZhuQdVESkL+LpQjHxNX1QJblwRZSeq4wcsS4XLpTcfyghPmfuwh3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qHnlrAH6; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qHnlrAH6"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso2471564f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750696294; x=1751301094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0j8AmL2vgCPrh67szF4XCY9cmGpFOza5ajW2zlzTb44=;
        b=qHnlrAH65AWvyLf+ffRGDHFQlQ8UXXXXodW7rITXKEKgsBWRUUJ01Pt101tLfNdNgz
         druRmSX5U+bCqNoLkySpbRnNjBEvGhtqWEA6sZgE3faNVC1MOopFIt7aJgpedENnbgA+
         vLhT/oF+iV4NNJl7ZENbUwAqvYWH3iddwhnanR5l4wIgKj8vv6iI+GCZR6dQ89GS88lQ
         4HUQJcYLu1l64TswOFIPMbymXvof9EgYaCIw8NBp8I3/Eqx4VOXqXjnURJXJZOFsUk3g
         05y1QuuzYM81dH5UL1YrQufYoHDEwKgH0zffz4y/y13dXfC9GgNjUFU4R5cTo53tNQSx
         Q+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750696294; x=1751301094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0j8AmL2vgCPrh67szF4XCY9cmGpFOza5ajW2zlzTb44=;
        b=hzwoePU9YAn+p7Q57kh4mKmQeJ1NavWNYXtQY5eJWuQJNMuy5fONq8EHN6xCSUuur9
         UskcMnt6poTLbKsosg5+fpJt6KvqhNv2iw8wrQIfKDCOpW1NGQLyj5bkr7DpTyhmZbEe
         jQ2VPuWV9Sl5lIUn9nG0K5641HD5wh6uOkqLpVRSrLTSIJZjVHuHboyje0hAT/qIjYfq
         o30ZgIOiOriY7qDrnxeiVGhEyifmKwoCuYEXVg02UnJ0wKiJGazKmatrYBWnaLSSY3Rl
         nBn9E5r1bCwIUVgKiXIg+Qwb94wATfhPUnH/fLYifNmWNUIYzHWt4xd32WJtLDRbgMv3
         EfuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZZzylIVW4GI5POD+MfTRx9DtBrHbgqnDDX2fn9ytn8aYyhwDSgdEcB3dc6eMaIYKu3IyhE6GkMJLDzUM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Hjl197QK5x3ajS6FRtU0L73hsuQM8p7/gz0nNZlJ9PR+Qhbb
	9+vZkELwedl+7Nq7H5dtgYqc3+SMkSUgO2I9UiWQpwcGgGGX60lPNsY669psV9RxnZY=
X-Gm-Gg: ASbGncuzlslAaxeFlUw3ikOR2V8pcm/5YVpk39bZXH1Oe15gVYvaNBpRoxc2V/m29sp
	E9gRuaLZkt7p3F+I9LMtJVbDN6I4j1dX2uSutPeHOnkrkIyM6cPM+geWQLh9ySDXy8xiIvJBnwi
	V1+gsw5nOdreUvOSBPGGcB02l9HPedyQvfu582s28uYAgw0E1HKyq060AsLCWcmPtqSmbZD3QVB
	LREl0I+P1GQqevSVQfkIVZKS45MUbttKfm3/ijwMz3F2O7siBLOYWNHTKdyxOPomKPGRGe7hvGI
	9E42nCzoXlagZ76DtDtgbyVbUmi/jyK8ZK/QBcryA2w35l5g7fyeEjiAYSahBSeMC4fJRSXNP80
	=
X-Google-Smtp-Source: AGHT+IFtp9SY06hL7tr/NWr3bIhdcZjACNg+h+Rg5V3jKzfHdcvWGYIa/oooWJLbVLfw9PBe9ecQTg==
X-Received: by 2002:adf:9dc8:0:b0:3a3:63d3:369a with SMTP id ffacd0b85a97d-3a6d130ace1mr9778129f8f.25.1750696293870;
        Mon, 23 Jun 2025 09:31:33 -0700 (PDT)
Received: from [192.168.1.159] ([213.240.182.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1187cf0sm9786922f8f.71.2025.06.23.09.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 09:31:33 -0700 (PDT)
Message-ID: <48c87af4-7d42-4283-b407-697b78d5b913@linaro.org>
Date: Mon, 23 Jun 2025 18:31:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: rectify file entry in QUALCOMM SMB CHARGER
 DRIVER
To: Lukas Bulwahn <lbulwahn@redhat.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20250623081240.149446-1-lukas.bulwahn@redhat.com>
Content-Language: en-US
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20250623081240.149446-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/23/25 10:12, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 4deeea4b0741  ("MAINTAINERS: add myself as smbx charger driver
> maintainer") adds the section QUALCOMM SMB CHARGER DRIVER in MAINTAINERS,
> including a file entry pointing to qcom_smbx_charger.c. Within the same
> patch series, the commit 5ec53bcc7fce ("power: supply: pmi8998_charger:
> rename to qcom_smbx") renames qcom_pmi8998_charger.c to qcom_smbx.c and not
> to qcom_smbx_charger.c, though. Note that the commit message clearly
> indicates the intentional removal of the "_charger" suffix.
> 
> Refer to the intended file.

oh dear, thanks for catching this!

> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Acked-by: Casey connolly <casey.connolly@linaro.org>

> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 41f13ccef4c8..c76ea415c56f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20612,7 +20612,7 @@ M:	Casey Connolly <casey.connolly@linaro.org>
>   L:	linux-arm-msm@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
> -F:	drivers/power/supply/qcom_smbx_charger.c
> +F:	drivers/power/supply/qcom_smbx.c
>   
>   QUALCOMM QSEECOM DRIVER
>   M:	Maximilian Luz <luzmaximilian@gmail.com>

-- 
Casey (she/they)

