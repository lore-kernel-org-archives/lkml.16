Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3908618DB18
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 06:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743660086; cv=none; b=GYmIqE+fcTbFKOv1LryEW3YwwDi8+BFG5ESpy8nTLcfhEG4CcqU5Noih93Xmcyu5buLVWvxDaOmgfq320mR8q+hA1yi7CYGHiISEc/nSSS09qSPnY4B+RNi0POeLRHj908M4Y+kN3uA3hUyXLNT85gSBJ3C68uWV8vebsZ8LKLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743660086; c=relaxed/simple;
	bh=3VNlg/PP+atprsGouNKJAz+WQdiTN8KB/c4wk3w/Qxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o4Xv6DvHsPrdPoJ0qn6ndRp2gDojV2ubs+wnELHzApX5PyZBVjT+bh3SB1qpgRwxuuDjLicoVxZDoJK0GjRmR8Cgvc4Ss3Kqz696MMMlYLacLByFBpgiaznUAhr1khfmMC8094ePPOp9j5RuH5yIA3cKSqEcilWJx3K00N6xGXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mq/orJOl; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mq/orJOl"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-391324ef4a0so72418f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 23:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743660082; x=1744264882; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dRHAmQsM6XOxoFPEQiHDdopymSY7CBe0glByBdY3dac=;
        b=mq/orJOl+7a3k+T7Xc1h1Sbgml56Rj25DSxyk95xGGbhucpDs6trZ5lsc8FOqufIn8
         VULgLWtLfjrDGxV6+HZ/cufNPIfvOWmIOHrCZF/NkmjzFTYXYVmLW4ce+oEamGnzNTfW
         2R793stKCQyTY6sC3NhXPbVL+MI67HZoJsHJ3SuxVP+SbySZUIM38WGFbp2MrNmfj5I/
         X/AZYPtV/ONK4M7VXwo46lkjI/wLpPDf/NbFBlV1hhony58U4GgM35S+qbwaZbV54UAb
         ZEoJ4E6uW0v0FAOjchxkFGP5d9lvJrta7ghuBmWXk6qyQIz8FD66iu6bCsRDY7TURv0A
         zz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743660082; x=1744264882;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRHAmQsM6XOxoFPEQiHDdopymSY7CBe0glByBdY3dac=;
        b=C+hltjDCz1wlCmvdxcg00/fSa5c2oiQwKoXxOVupqiRR0bJJNytATbWClHFRWn0CfR
         thRxICsem80P816cU7QiexOzPVqJ48X9kwWU7Ipmy48Kx9syArvl5+rtV81Cz5GiobPv
         3Eno1khwp71RF8QVstYMiYG0TVNW0p5TRCRbp70TiuLdGSMFldjfin8lC5JoVdO4981R
         VLHfiT6S3995Nwn+zHONX7xkVmaqAOe6qQh9vl4mzOk6h9890hVjv6niYhSpBs+lxZZX
         2FZLK8JYmaQ7ToQlEO6tn22EbOJwXQ4n8EOcZSieT1a+9IM+EVe5KNBHn3rfkNtK/DKs
         u2PA==
X-Forwarded-Encrypted: i=1; AJvYcCWrS7ZiLtPO+iujyYiDpeH4bGrGCMopfhKz0ZtE384VyzBLvvvQDSszXssETm+RWMgzd94E38984Q+bmHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHKw+y30EzgQm29+nZR79sXO6Wv1Ry24JcEY0LCkZ+0cSyfvwT
	jvK27zP80J1eRFaaEFS/jYNgh0/ysblyz3TAoQJx7u1V98lrBjXvG5gbYk/8tMg=
X-Gm-Gg: ASbGncsPveDmG1qQfUNC9vZORXHy72wJUSBVngOxVQAHR6bpDZ4HEuHVbbu609AxwpC
	Xwc4DuIJACNrfTsfdHarruEp+T9Ddk/5llTlf4GQxw4lCE74X1kd+RdvDUCJRFVIgHW8Zc/dsGN
	UcmjQn+SbDCKakjH7KCE1WXOPXEckQC6jnjWzqP7LQ8Q3cAJQKmyLJI97o5GulHLsVb7chGBFzc
	i7ak+UhIRX9gp3VSN65PgezPAr3yvFAAB8B30aEQ77jVoSXsMJ99VJTzmkd6G0hisf3ZpUCEyFI
	V7AIuaXYo2gEev17x4NmFecX2UETmBV5T9POiDaLnkv7GTkEhaKRvFK1aeSM41s=
X-Google-Smtp-Source: AGHT+IFPxsfEGFVkJPpZgN1LeGs/Qh2Hk/Du3/u6gg4DGXY2x6WEAQgJbKxMiroZsBSry9lMWWMzrA==
X-Received: by 2002:a5d:5f8f:0:b0:39c:dfc:f496 with SMTP id ffacd0b85a97d-39c12113f29mr5307799f8f.8.1743660082374;
        Wed, 02 Apr 2025 23:01:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096861sm835732f8f.14.2025.04.02.23.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 23:01:21 -0700 (PDT)
Message-ID: <2e2c30f9-a9f5-475f-8acb-b84c2776ba5f@linaro.org>
Date: Thu, 3 Apr 2025 08:01:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/10] Amlogic C3 ISP support
To: Keke Li <keke.li@amlogic.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com
References: <20250311-c3isp-v7-0-c3551bed9005@amlogic.com>
 <174361329012.494853.7010939852362232231@ping.linuxembedded.co.uk>
 <ae77936c-e9a7-432f-89a0-b4b7574690ea@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ae77936c-e9a7-432f-89a0-b4b7574690ea@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/04/2025 03:58, Keke Li wrote:
> Hi Kieran
> 
> Thanks for your reply.
> 
> On 2025/4/3 01:01, Kieran Bingham wrote:
>> [ EXTERNAL EMAIL ]
>>
>> Hi all,
>>
>> Quoting Keke Li via B4 Relay (2025-03-11 09:11:10)
>>> The Amlogic C3 platform integrates an ISP capable of supporting
>>> multi-camera, multi-exposure high dynamic range (HDR) imaging with up to
>>> 14-bit raw RGB Bayer data.
>>>
>>> Capturing images on the C3 involves operating the CSI2 receiver and PHY,
>>> an adapter layer that integrates the inline processing from the PHY to
>>> the ISP, and the ISP driver itself.
>>>
>>> This implementation consists of several distinct module drivers and
>>> is expected to support different platforms in the future.
>>>
>> There is a corresponding series for libcamera based on this kernel
>> support.
>>
>> I chased to see what's needed to get this ISP driver merged, and saw
>> that the CI couldn't apply the patches. Does this need to be resent on a
>> specific base to support the CI?
>>
>> (https://patchwork.linuxtv.org/project/linux-media/list/?series=14706)
>>
>> https://patchwork.linuxtv.org/project/linux-media/patch/20250311-c3isp-v7-10-c3551bed9005@amlogic.com/
>> shows the CI failure : "Failed to cherry-pick patch series "
> 
> This patch series is based on "linux-next specific files for 20250307".
> I am preparing the next version.

Please kindly trim the replies from unnecessary context. It makes it
much easier to find new content.

Why quoting entire 10k lines message below?

Best regards,
Krzysztof
