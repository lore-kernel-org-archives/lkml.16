Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C000822FE07
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 10:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021232; cv=none; b=GKkCEZ13FkE4so3ze0zsNhJPMM1Xl/Z0wpWfdhnppr8O5LuLI0Bl7P5zjQieI3YUozpjkRvok9jfEnFJvqPrThuB5WbcDmOpbdarZv1XgELY14/V0ozNGLQT11B1XvqOx7YPGdMzgXODvQsFvwO1Yq6QZBxfacat2W3JWDItWPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021232; c=relaxed/simple;
	bh=JFVMB2yW22lXmwWMWcPmfPT4MtEe/YQP2YeKvV+tCEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPIhSgdPKiGN6Gl8Qr71lTjKO+s6rN/wcHPeAeRKKSdtT7K7VBgHy2Afz9+r0MTsxA+MA5EfOnstCC9CG7gbTeUreue8BmHZhePbeOhCot+zi0FShx16H+QELQYZfsFTFK1/TpOwodCFKjkbGBcSA4aZczvoTJViTOlYBybYCdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iDmpOHgo; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iDmpOHgo"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3996af42857so3322005f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 03:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744021229; x=1744626029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ezQp2+U6ixHlt9GUKNzafIUfaIB4N3lwLkkdWaVaceI=;
        b=iDmpOHgold10PGwzlos/SaBDDmsBqEnI9/2trRkv4zQn6B4cmwv5swaH7VKmWxau30
         4Z9O2OwvTtbTnRmrrSI+ZuKjuA43G5AYwRboYjM580xPFGfo14z/gXdtCSqgRPsTpJ3H
         cOWyQiNsDk5IflFXHZaAszy9A7rWCKHfDA8ndCt6tOpYRLn0nUU9YOvTIaO+GRFAVvSy
         cg0lIia4YsEY78TaElZb8NKzHw+P7wkfqwDrcTtKsXDI56aTmgva2QMBE5UXPjiNS4VX
         jKsbYmSWLYyn6trnNEbCC0KlZweGl6by6AVLD8XNeusGjvRP4+tJOs4gHx/GdCHkoj9f
         CRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744021229; x=1744626029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ezQp2+U6ixHlt9GUKNzafIUfaIB4N3lwLkkdWaVaceI=;
        b=gJtPI1/Gt/yIXwBMBgst8/it1voAwBP6q306mk3xACocaG+K1uBY1fIHAlqpWAgAtk
         +CjaZRZThbciF2EtmqY8pQuqAWrefEsj3ouZTO8sUOyov48FuIA98uLB5bXRj13vpL8n
         dvsPeMAACFi3VDWgZJympEZphrjLKVdpYJQz498UDjD6L2CCQ5zjGGUw9G0ovLWfmLos
         URxsZV07UmZsV6jpDlFDNyd5FFWKomZyowvmuXyR4gvTXlVpXqQapJWl7uQvCiqruDDv
         pFdPlCUO5AhMchjFGlG4Qv4jlYzVuosvruRFuvcVtNNJHC02bP9JZhsB4Y5ebzbVX/7M
         jlvA==
X-Gm-Message-State: AOJu0Yzj/BFj1yua/kfBtzrzfwxzRlnfb8mA5c0Ag7ai55hzzIA7AI1x
	KugroMc+mHL/UXpRONQMUtbxrNJupuo36lpkIuS7kpkOcZfKvf3BUGMoGyymDHA=
X-Gm-Gg: ASbGncuuk/mxB4Zyuqh+J3p01+XsJtLvGDCBwRtknj+DWhjf0vJ+l7Oo/7ZbBWaeWkI
	8Q+HBBgs3dmmSRx7fpHXZpIcLpEatRFHHP+E1O8jJ+eR24sOD/Qp/FSDtiyPnVGCJ6sfiEfyHPv
	XB1OYjIDHD7/ZEESvb0epK7AvWXYtxNuE5q7uTdPWn94D1BuJ61b8VWxZ5Uo40vm51doa0ALoqE
	1w2EIz1CBrRfMBVHagImPQpYk3VJbTUnPf4FDcO4QLw4HKXFwdMaw4EjUQsYlYTSSls82JnjNz4
	CGpeHeqkfvQisCl4AnwlLJZ56W1mxO0LpLJeF+MGBTjBQXXaXd+UnuVCBgw0PStjEcBnWRO/p5U
	46fjaR4av9w==
X-Google-Smtp-Source: AGHT+IFBFVAvZvAQWJ5FKIazBfYYoIxt8b/d6GZyBtfy4dBPa0KMfqalT1E6OJFjYBvAIvbUjzNAlg==
X-Received: by 2002:a05:6000:400e:b0:39c:e0e:b6d1 with SMTP id ffacd0b85a97d-39c2e6112ddmr13566771f8f.12.1744021228977;
        Mon, 07 Apr 2025 03:20:28 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d6b1sm11734041f8f.62.2025.04.07.03.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 03:20:28 -0700 (PDT)
Message-ID: <b8dde6e9-5e84-4e4b-921c-4a2e2b3c05f5@linaro.org>
Date: Mon, 7 Apr 2025 11:20:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] media: qcom: camss: Add sa8775p camss TPG support
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com>
 <012b0381-a5d1-49bc-aa59-aae0d35aa034@linaro.org>
 <84fd283a-ca87-4689-8955-855f7275d6d1@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <84fd283a-ca87-4689-8955-855f7275d6d1@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2025 11:15, Wenmeng Liu wrote:
>>
>> Great to see this work.
>>
>> I think the TPG should be another type of PHY.
>>
>> ---
>> bod
> 
> Hi bryan,
> 
> Do you mean to handle TPG like CSIPHY and embed it into the CSIPHY driver?

I have some example code I can share with you, I'll dig it out.

---
bod
