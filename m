Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CA61F0E25
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739264136; cv=none; b=N+3rEVMPxAA456GaDB+OtzGH1ZUMC7YvTvLcuzB/NoIDGv+vqlvCNosSY6rRZKOAfFIBYIkMbD/8BeZQ1h3igKPnSJwByJV8ujvUXXZUQKKL3gAiGtELE3iGvk4bdiw+nm1VOrXG5o5SssruBoO9dP3fYQhSnYbUGmjIyDA3z5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739264136; c=relaxed/simple;
	bh=so3608nuzu2Z4wPWCdEL2Kh4q3DiMgLd3JHw50uJwm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VpqI/J65FUIDgzRN8X+JlPo9sAvtkXP5gy1s+Ukpo8NlFuH4iGv0BizO4exfFPIDF6kKYrlz0oilS+gnxWnY1MmQN3IhhcAYDOO+5r9GfZslQt25RKghRqDsUGvU0mJ6L8OF7BvVZhZH/+XGuEuOFUNFTZA2zL/cnF1TwwpgEWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ipt3mM2B; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ipt3mM2B"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38dcf8009f0so1846262f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739264133; x=1739868933; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2ATS9kH3JOXqCDIar73OnrkF9ilRSB+64NK3pHta400=;
        b=Ipt3mM2BzfG8lgSS2kohFvQxHtDPdXzQ2CpG+8Igq/BwRimRwi9w2TdVQwBbOeIy6Y
         oRAbXfvKqfNB3noJUdnOCxO01Rk34EM6tzSDhbrHkXANNvpx8hYEbGI/2Z9n6ZuRL3HG
         keuAlx4Nr/UzoGmyiK+Dc6GUu4SzzkloKAYHomVTVzGYZavF+S1pqqj/bQf+3wrh+NTR
         9MwfN0kdza2HsFy1jzBD1bvpB4eUqqvdw/yamDgg3igrDsHgyYBT285oI3c+fY5uiEEf
         XGBuMeKysdiRYtyHvbgvTY4S3DSvxQeEaOSTKZEdO3vLV6AyM1TiQt+LEip1B7cxsY5u
         ychA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739264133; x=1739868933;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ATS9kH3JOXqCDIar73OnrkF9ilRSB+64NK3pHta400=;
        b=DjPfUk0u4J2KGCGBJx8ZDGVp5tOlasx7iT7a3b0M07MNzTzM9VQh8LWaBa5qDMArbV
         uOdnfewDa1tjKXrbd2JjWLbnLR9FWMClQlxTI5uey0eBiEFmWqNUGcsNdghgY5YKBOvb
         e44MqmDgqjLJISG6r8/NSVHgZ2eHqN5TkcA1p6ld2ZMfJGTfr9wXDBfVxcuos8ofJ0vN
         EPpdkESvY0muW/n5DAEH40xlbgLFm52se5d4y6ow8QNg7DEHAL/K98z/gGNg5Dj/ocYB
         9wQBpgC8R/2MlINcjWSQ3CCNtEQDeSVno5YrU8MaL5loBJNeUVLCkU1F1JQTSRk6auc8
         AdyA==
X-Forwarded-Encrypted: i=1; AJvYcCXElJh9AtnKR1g6dqB8WeopZqEokarAlq1b80e3hueypMLCCyZC4ov0yISVbseSHf/ORI1Iw4GBD4Dw890=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG7Dgc5UDCCpXSUyfHnFpxIx6FhlW9LAIJT/WQ0YgAxwpGnr3r
	vHz7pkXWGIZzdloilltQIBXtD2+0GEfqZtcH+prt1jUQPgphxhD97hsGncI2Els=
X-Gm-Gg: ASbGncvlwdweU/awOgk6cEc+/c5gMzW4a0+hhKQgww/R5xLFJpQPvuoGTtlIVqlE2I7
	LkrCgfXRNIytTfO7Zui1k2kD/Tk/bpQY41ilM4WV19bO9SP/UK6kqeyWIUH1wu+kkIP/enSCnhj
	KlOn8zuIjoBe+QwokexCW5gF+Lx+K7Kn9kbYJeuRGJNeuTybHlZ19nKmWXqe2oN4pT2G72ZU7YS
	HdMLZPKLSGLSHMkysTu4pXC/SAV4bYtc5y1eyFbDSBvUvx0pswxWikbfuem/PKLDHA0Ecp4Pc20
	A86xhrD4x0Pk59Y7e+fFU3iDQ4SNHkVOypGFRfYeoYT9YtZRKuX/ib8=
X-Google-Smtp-Source: AGHT+IGlpUgTYtIiheMDAuizrYUdnfwTiXvy3+Z24hKU84ausw4miBggLrIYHvGUHbl0rw2KWztuoA==
X-Received: by 2002:a05:6000:1865:b0:385:e105:d884 with SMTP id ffacd0b85a97d-38dc9371e85mr13413888f8f.46.1739264132995;
        Tue, 11 Feb 2025 00:55:32 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dd187360asm9452225f8f.43.2025.02.11.00.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 00:55:32 -0800 (PST)
Message-ID: <bdd94f9c-e751-4a16-848c-bb83cf1be569@linaro.org>
Date: Tue, 11 Feb 2025 09:55:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: thermal: Correct indentation and style in
 DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20250107131027.246608-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250107131027.246608-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/01/2025 14:10, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied, thanks

   -- D.

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
