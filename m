Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED2D1F1909
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 23:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743634874; cv=none; b=PGABgUS8/tlrTxhx1JoISCW1Vb2jTctRUMonNDe436YAj83DGtiZfKhV2mPAyjw15O6H2H6xtwXbtxChUr52q8Bch3RWf857+jTwTaVePSmLiSeazmsSn4+zuMbNoYTfgMz65PZFHBnI8a/dEcDFbyz7L/P1nxd5+4GeSQrQrnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743634874; c=relaxed/simple;
	bh=ae8HG5mamuJ6F6/+nBlRSOsXFultdkdpg9uOrzVgMHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j8Cv9BmJHwFiyg8kCiVFssx3xGcvs53sWNrt2OL6lI+vP1Zs11jk1GqVV3W3L2LHXYr4lsOWZWvOvmBcrEIfWDhZAvlivRL7Nfrtxk4ShP93byhi6jSLlm2MhidJLjRwPjjpvFjq+iMImqSB2iLDsePeQ6DIcjwBzdXO5oQ0slk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=erG22Kva; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="erG22Kva"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-399744f74e9so202450f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 16:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743634870; x=1744239670; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ssDdQ9pYXMHr5I5/Xw/ZAgexifJSDigD1EuzFV2qg4I=;
        b=erG22KvaPBOLtLLf9ql4HsTCgHMSvgtwC5lqQTS7vDTAZtUA7XmW4YPQXhRifwtjFx
         UfWucTf35UPuRjkjIAjAESMRevW9BQoUrFVETT7mErooVPKiTz96fNpyHacOQxjLptYE
         XvekRZ3LDy6uWyk9Yu3Snmw5b7KRvoVPCeybMTMJKFwS0Ii1NBZ9ov6dpAp6Mzb2KEg8
         r1vs4ROGb+fPxeqc6s0F28EYZIPzwR0Qoda3ZGcTzSIJXyNuGYbwKZRsHeuqI0ODNc4m
         KEnaf+m4NutpJYUUBIqvRRJt42sAuiNR+V45jFHP8OAtn0kHug28h70YT98Gqfg02tS8
         HSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743634870; x=1744239670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ssDdQ9pYXMHr5I5/Xw/ZAgexifJSDigD1EuzFV2qg4I=;
        b=HY6inMmNVa7K9t+YPekmBONUmaHQi3COhOzYMpK1ZzmJ2Dw5J2UXvtLmGbMqG+8ESy
         xE33yi/Lh88Lx/qGIc5hjrbWOqYUs5IOKXQMwk+l2L+OHhZPinHQop9xce6KtyNdG4lU
         zLB4yNcOr3CXwvhiudFLId4vRl2rizwEwJpyEsNEIInD9Pt6PEcw91bJU9OaxY3fnA2C
         Cf1cpYtG+nYUy0CDydkeVzXkbxiHxON3TAqCmnKrSXqP7qqL2oFwHdhzq5CVVw3BOXPb
         mWEDQuyHiO0ga5ev5dxxIlmSkvJjWfDyutI85DYyVRqlAId6RunlOfht0MJHY9DTa8Sc
         6TqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4gjMsMDvNZLpZyVJSYQz38R7OZ/+4rOjsnchG23Om2r4O9EYlcWPk5pBMD3N05CAku2wt0fyTPVeZTU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YychqSxcyRQG7dKW5grCnNQSxqkpDdQjJ08UJQwkqdCKmbJo0Nv
	E2UMdl0G/INcX+G/8+cCndACYcdfmXmsDN+VXAkhovhf0s3ojuasd9qh3cX0zaU=
X-Gm-Gg: ASbGncvwtQwY5ezR9TlT4v1W15Y2QkJkuC0KeAul5bE8aKj9VIjijN1qrASu51HDlqZ
	ffTsf1qgaAehDazLEvoJbdAm77Yyr0ObxIZEwWJSiApwbly1AHeoZx58ImZHPPQq5TbzD9UjYS6
	ibcnCDrx4YeNXkZeHNHfGAjEJ9Zedg3MhVo7eTvFpnbRKMB9VP15wocgldTZXFZQRT71Tg9nWPI
	zSlIbR58UqCBo4sTpXx56p7hv6uCcip4kwxoQylIrEXvOf4r/Ly0itkpTkimkfMeCmEgMFMsV+r
	bSfvLuXY9lNQkaGdF4gAoGZZdcMexDzuGdAMAZCgiMK0bQgllSwMlplEGtzwujeMFsj9yetL1xj
	GAzsxkagv
X-Google-Smtp-Source: AGHT+IHyj66xL8VsObpHLyziVGG93y/NYfcl9RGB6qeFeKmVhSfE7lLRhxrpfsHle94LdUZoXtf+eg==
X-Received: by 2002:a5d:64ed:0:b0:39c:1257:c7a2 with SMTP id ffacd0b85a97d-39c2f96b901mr215465f8f.58.1743634870250;
        Wed, 02 Apr 2025 16:01:10 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c300963e1sm127285f8f.4.2025.04.02.16.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 16:01:09 -0700 (PDT)
Message-ID: <c449fba0-476e-495b-abbd-65ba2d44d590@linaro.org>
Date: Thu, 3 Apr 2025 01:01:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add NXP Software Watchdog
 Timer
To: Krzysztof Kozlowski <krzk@kernel.org>, wim@linux-watchdog.org
Cc: linux@roeck-us.net, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, S32@nxp.com, ghennadi.procopciuc@nxp.com,
 thomas.fossati@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20250402154942.3645283-1-daniel.lezcano@linaro.org>
 <20250402154942.3645283-2-daniel.lezcano@linaro.org>
 <ffe49998-f809-458e-8eda-002d0c0fc32a@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <ffe49998-f809-458e-8eda-002d0c0fc32a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/04/2025 17:56, Krzysztof Kozlowski wrote:
> On 02/04/2025 17:49, Daniel Lezcano wrote:
>> Describe the Software Watchdog Timer available on the S32G platforms.
>>
>> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>> Cc: Thomas Fossati <thomas.fossati@linaro.org>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof

I ran the make dt_binding_check but inadvertently removed the "oneOf:" 
after :/



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
