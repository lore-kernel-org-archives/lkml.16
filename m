Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9532C1A9B23
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917822; cv=none; b=fRa5Le5yvxX+gtpdejkdrU1dA26/6gIwfI6T6MTnwAPzjbjLZD7aTP8+UC9cYSq+BhduItKDoPyggJdp3bSMAPn/vquGJGfIzzvLeH6Ei3woNSXswILgqhNaLNcmq8B+PxYNAK6cWijwZA0xdeT7DujQw+fHWSrIUaInjfGCx6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917822; c=relaxed/simple;
	bh=YIBEhofxjPTUn+Oq6AQXg6MiuyagERd6Hg7YHL0SJiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e1QU94UvGVfI9EBroHFG/qJ7Po0+xnpczIu7GKom0NC/cdgb/3yEMYXdU6a7NwWSVWm52KjJHxc7vxqfEEMpHpFfW6TgkmOfhqkzl6AqVk0/jL/vvPrIsGvySkB0/NwYO3S3jDn5W6X99FBiYgKdI8fjHvL85Uw15ubwaY4b2ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UTXXTxyB; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UTXXTxyB"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab78bcb4b19so85005566b.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 00:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738917819; x=1739522619; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ipzi2jibs7foQeLu4B8qNjjz2VAtT5g93gnFmfdZ7qw=;
        b=UTXXTxyB7uT1JZhER4npHFjdqYQRg9C3gNkZcve23Su4worc0qkL+7fXGHX/tkyKbx
         cUB8oKdTJoIfHLSGF1E7XXGi7ycmPEfCUEcBMaxn28O1MvABAPE8vFV1CuleoKLxlJ+8
         sqo0OFZIOxG7t1OOJfLaXAcJHrGpsbGdW2V4736hBwpcTXBoLlIv2HqZswL5TQD/ODM7
         9bvPm0g+Fmbw4AdiR/4V+/M/JAhJs/9mdbqW1jT4Y26dzFPze6LRw3Cjr3vIqC4dYklu
         66ittgabk+KZGBRKN5WqQ3PY57GgJynIfEy9F8yM+ZuFvZXO8WwP5OYYc+TdSR1El0id
         AjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738917819; x=1739522619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ipzi2jibs7foQeLu4B8qNjjz2VAtT5g93gnFmfdZ7qw=;
        b=nR0SQL9wsB+mip0lltZqczgrAKXLYmP7aDovloWubz1Ev5RlflDhVo35GbC1KYUnfj
         deEJGJTVgPzM+t9CDEHG8QBc1g2dB7vWY3i/y+2gAQSDMfB+B6goyHrF3eJFBjg9i4zz
         cePUK4WtAEKBYYskYkEFcZWs1oGkFJ0iiTMUi8l3LWirujNLXtnMt1YoNon9cPkZ8/ly
         Jj4JHs6kkSIef1kmqT9v+B4ayyCbZyDtAoptN+rLaaEoO0q4UfdDyg0glRttKhxmFbxX
         raTtVsRdyPvF5ymR1Vzp1T+Lpy39MQDiesRyjkbMRjbSkchOc0MXfGuspZWKIoBTg8U5
         4Ouw==
X-Forwarded-Encrypted: i=1; AJvYcCWkZkk/qryHCqTczw2SkrGc5O4jniZYW2BvDFP1u3Mw2F7GuDcpYUY05lLcvE1FKY/kPTYZUpgNqbtwxHc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGZzWv3J+g5X4ca1nRwl32u/5ab5wptM1jRIVH8C+oVa9IrI+3
	cKyBb8rHkw8aEC/emkpx5NeWEWoPcRaZrkQ8I8SGuuUB1eF+5HsZSE66Aajaon8=
X-Gm-Gg: ASbGncsWGXaATjzPzPDcDDtC+irDv88AFVdu7LNG+zIv+0gAbduoJiXHAwXxYAZwwOQ
	Iyhppq/jVaIJjMUmoLTOqYv39kMFjFAqwEihWU+qT+e9N1v987NKvxCWMb8G9V25sXFaZ/Rpu+Y
	x97dzW00E0q3ipDsuHiss5bqgOUpZ/AGfYlJY+UOYOicN9bQ0sZT01fXGVGgxElJBpTYOGF3iS0
	tIcg+1czVYwF5C9sBrnZ2wrtFcAMNHHObF92q1A9itSDKcSzK99++w3q61C6AQjU9WfYv52R5FK
	0FOAJ4zwTn/SruAxVCW4ulVY
X-Google-Smtp-Source: AGHT+IHv3cra1E8iRWLEr2rfyznvTIzUFVPqQMOPw/+8Fybs+K5tsjgq8x8NGSqaDxiiGMRBPVYUGw==
X-Received: by 2002:a17:907:96a9:b0:aa6:873b:ed8a with SMTP id a640c23a62f3a-ab789c739c4mr276480566b.47.1738917818657;
        Fri, 07 Feb 2025 00:43:38 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.251])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f842a5sm229093066b.43.2025.02.07.00.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 00:43:37 -0800 (PST)
Message-ID: <41c4d4ac-5f71-40b1-86b9-ae8ee33db538@linaro.org>
Date: Fri, 7 Feb 2025 08:43:36 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mtd: spi-nor: macronix: Add support for Macronix NOR
 Flash
To: Cheng Ming Lin <linchengming884@gmail.com>, pratyush@kernel.org,
 mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250207081846.362919-1-linchengming884@gmail.com>
 <20250207081846.362919-3-linchengming884@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250207081846.362919-3-linchengming884@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/7/25 8:18 AM, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> Due to incorrect values in the 4-BAIT table for these two flash IDs,
> it is necessary to add these two flash IDs with fixups.
> 
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
