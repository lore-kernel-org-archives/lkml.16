Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B4D1E1DF2;
	Thu, 27 Mar 2025 22:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743115988; cv=none; b=SNtTGgRF4VNrOMjod/sTd/2/7e2zBu472OySwJtgNpUPKao6Uc5AhlH9BfgzObe8JendCUxw4bvt0CR9MblUBwBHga8GNayxlF+/7vy8lVkK3RJtqlKl53Qlh4zQ2f/38nRyBLju77xCyQxjAqHglIMOtQQ4mGOIs+bwxFG3sKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743115988; c=relaxed/simple;
	bh=MjMFqqUF8Sk25abtgLHH9c5rnnjpuReSHwuy0I2B57U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D8C11Vq4YcYSqiU0K9pEOIsrz2sQoqDIqBJjJE35S7LePtW/FrsQCUKxogUPHV6FTHnM/nUlF1w4yPuZrSQGZFwa0NlUlJhZV5arJqgwOBQCGF7FnmY4O2x653lZkp8hqUILyjbzi2BPwxDCRQWQrEM7I2N8C9GypniPIeVn8wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLwfvewg; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLwfvewg"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2264aefc45dso43019535ad.0;
        Thu, 27 Mar 2025 15:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743115985; x=1743720785; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+HmM1LlyTcG4dXbOEe8qSUpj5+YXdikXd/DNYgDcwLM=;
        b=FLwfvewgocXcIstrE2uw860wMG9mU2Wr0xBIGlldz59FBvK+irjpWCQ0ASIvmaBLW3
         x6GIRJGEefJ1aTaJ6jOw8ayKtyaTg6h0+LjWMlMJ07rkP5BB6O8hUIccXFB7vgUFVubQ
         Uza8I223icpiLERjSFgA91OLZWA3Ne6wITGRN36kJtkO4xJce+QmoPOG8wPb8eeC6Cnk
         5a1VoL8iS4eiK49rXZDebAcIA5RIWUvd6AY2+furnMr7cMA9hIvWuHx+2fQZz+JLbwmu
         w3mDDPrZSqLCnDSuzY+uBn5GduDJ03/QZ/do7KzCurJL9ta+9ORtnc84jWbavNwCzeOY
         Kd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743115985; x=1743720785;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HmM1LlyTcG4dXbOEe8qSUpj5+YXdikXd/DNYgDcwLM=;
        b=FCO8c/TkzfXrKIdYY1oiEsWMgs0/W9nZlM6Dg9aMVMNgIfX50tYusbE5TuL5yrGemG
         tpfLG7EgN5jAdiBdX858ENS98wNS3B3NnVKmjT/wQzOrawNyzE1VctbAK9kxiezvc35U
         D6R97l/jSLouItQgu/tVUBegCBv4Pm/MbyS+l8QfrYFKCWl5mp8M9ySe/dhDXyLp9dNF
         q1f9r6Ez6qLse9hs3XYKGyg9Kj53jyIOv0p7l6BydK9uI9mJV7Qbn3opfLxAsEGuAKVV
         aEuI5CeZt9B18AzPlJlK1SeH3+kVpvg0Cc6bR5RkLnbD7Bz+dq51gK8nkN6Yhrd9SfzL
         bqSA==
X-Forwarded-Encrypted: i=1; AJvYcCVV2hkofNFqwFqCs8b7z3+1voN9MAgRiTKpfpe+XDc1BQx+Zq8T9JW3jJ+aaeImpJozUdmq+2DbmvHYLDB6@vger.kernel.org, AJvYcCXfL0XiJheqFpIejVurcfcHliDEHyFbSKsotGzaeMKi0V/wY/Tz+tvcA6PVLP2pxS8Jgxr1FGg+E8k1@vger.kernel.org, AJvYcCXhASpxG6zZqhVFdEsoR8GabeG1ahYwiX3p672YlMzP9LivlpAFm48t6pMafGWgwwU/7KxCtEeUA8G9114=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy57XHFW54V2cFqI6w4LXhL9nhPKDdcOVcUipoh6MQ9KbYSgIUk
	Rzk+g5gRE5ye43aUMNd3tEkvPh/JPOBSn38tqihoge7+vsrWsQLV
X-Gm-Gg: ASbGncviM2Lb97Za8jpGlNl5p6mLvsul4APBCRazA5Avku490k+mRgvHIUn0VRUupGk
	Mn3I628E9PUjRvyUqECzwaQBup1SbWgXXbsOhG4TtEdfXzcmX9IzYtJP6AAvW9AacCWInxCC7+p
	fYuYmtj2B6d1R+QvNPZDBhzzobsu6oFfisq6Fw9/OhUebxtVZxc1kgslxvR87ICe4AeuFJXMcf4
	KzTXAsBuMcbGK5YLArumFHtrWaNfK8Ldc5tAe4CEq1AQyQweN2muPVHxDCkeZJWTjUau58b7nH7
	wzIdnxX/OhPVpz3ie5tDT5PV2E0z5EUApJOQFC6BrRwcvUVflmnb+/IIPzqqNw7GxQg02KmAcUZ
	0bXSqTQXOiPqdW2+gaw==
X-Google-Smtp-Source: AGHT+IE/eeQSC6WT/sCntwOSqiCInLUz+ljJ+Gmpf3nC4JGzjGpVdKxmmohmeBSIwjlCEWUb2Q0VAg==
X-Received: by 2002:a17:902:cec3:b0:224:26f5:9c1e with SMTP id d9443c01a7336-228047fbbaemr84744135ad.2.1743115984592;
        Thu, 27 Mar 2025 15:53:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec6949sm5419515ad.13.2025.03.27.15.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 15:53:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b93159ed-247e-4cdf-81c0-f32b85d4fbbf@roeck-us.net>
Date: Thu, 27 Mar 2025 15:53:02 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] dt-bindings:Add SQ52206 to ina2xx devicetree
 bindings
To: Wenliang Yan <wenliang202407@163.com>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 christophe.jaillet@wanadoo.fr
References: <20250327131841.15013-1-wenliang202407@163.com>
 <20250327131841.15013-5-wenliang202407@163.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250327131841.15013-5-wenliang202407@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/27/25 06:18, Wenliang Yan wrote:
> Add the sq52206 compatible to the ina2xx.yaml
> 
> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
> ---
> 
> Add the meaning of 'shunt-gain' in SQ52206.
> 
> v5->v6:add content to meet the update requirements of the ina2xx.yaml
> 
>   Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> index bc03781342c0..8cd672e6bf62 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> @@ -19,6 +19,7 @@ description: |
>   properties:
>     compatible:
>       enum:
> +      - silergy,sq52206
>         - silergy,sy24655
>         - ti,ina209
>         - ti,ina219
> @@ -58,6 +59,9 @@ properties:
>         shunt voltage, and a value of 4 maps to ADCRANGE=0 such that a wider
>         voltage range is used.
>   
> +      For SQ52206,the shunt-gain value 1 mapps to ADCRANGE=10/11, the value 2
> +      mapps to ADCRANGE=01, and the value 4 mapps to ADCRANGE=00.
> +
>         The default value is device dependent, and is defined by the reset value
>         of PGA/ADCRANGE in the respective configuration registers.
>       $ref: /schemas/types.yaml#/definitions/uint32
> @@ -97,6 +101,7 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - silergy,sy24655

silergy,sq52206 ?

>                 - silergy,sy24655
>                 - ti,ina209
>                 - ti,ina219

