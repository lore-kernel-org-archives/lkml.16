Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9C817CA1B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409112; cv=none; b=cTAtBoIZl0kgneCdiK2HTMtfD5vCISYgHxZfdMKm7nVglYDpZn8B5J/Zu6WrgddZRe2Wdrr/V5ek0RfS+VofekkWO0kLKFas1SA5xPeSa8J0/I7JLk1Db5w5Qne+BgT4TnnQ1PBaHy4VV8eObjYzP5kWvR/fwEScJmbvQF/uKWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409112; c=relaxed/simple;
	bh=7czGx19+Ue/FYjTju2NXhPJvzgtJl1O+BJtmO/KaSwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L6U9O3ubLnx4BCDFSWSn7qRz4dTNZD8V6CC/QamjgG3y1FvQvPpjpb47ZJQvVu3zO5DXNvWSxmgh4DfjSeCeSU87guNhyuZdJ8Z6LT5k85n9+ohuMIgW9K2TSZfH4XLOXSOOZJmK0Yxr0GkEJ+6imPVKmJiy+QwTvpDLL4lVRpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iml7BNKx; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iml7BNKx"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3996af42857so3368098f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 01:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743409109; x=1744013909; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R3znnsuY9dskTAhbds49XMwfp61S6Bya9zKCMQ1uerI=;
        b=Iml7BNKxPBjoFpdfonxjuVFiATR4LNX7INqwE+UAAYdEe7EQSPatNOw14HJF3W3g+O
         TJqhj7sFr0GmaLEP3qirv8kv8RCsuzw/gqXQW6H/+Wt5ol+HaS+k/KgcurL6DDZFTpl/
         BepKxvkPTLRpiSC8FcpofaSayIfwQSsfmrEQP1DqpRk4ud4L1nCy4r9uAI19H4DMaDJ7
         RwVQs6UFF34hFSp4QDB5gmIdalZFKG4ZoHpPk8+Wa1ZAzrSC+KvGCAdrIiqdzYaoa15q
         jBcyfeBIfilJriQkrF/kp1Ho/ggIBhWIzLaVsTK3dHjtdzQHDkYX2Wx1CIgiXVo/gevs
         gsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743409109; x=1744013909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3znnsuY9dskTAhbds49XMwfp61S6Bya9zKCMQ1uerI=;
        b=KNVtxy2YFVU6NIDvAy4RuxrN9GP/od/eNmkc4OjHCXCyKVemnydXIUAiZ7KIiWRi8O
         0NTrGTQzIn4bBp6umkjsGWd8rCZDiWdAr5rDpnTr8g+31w4abxS9ryyrQPhzquzP4UtV
         QM56K7TcjmOJf8K+lxTXPg/mZagXwu+BLH6EEaavbLciSvH3nqQ46xznqWeOE+G577Xd
         gIAcISAnutdyxAxeqdnKBc2CwucIksjtLsPxaVO35mO0H7xGpdML9eqeQSbdbgDMV2Lu
         Ct0tvjhtDA7tnM3vf30GwuWeK9rs5B50Mq4efwjbKBH25Bb7NJq+yyMUlH1c3IqXN5j5
         K9Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVgo+woy8yAm/EO+mwFwRByLEVOHdWZ/0HX5sDTbdaC09nxV2sesSPk8jcEdYxErCQBZ+UlgdrL4VsyFYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0P2knbK077jyiUfGPJZb9alLQLfQviAckpXEePU396OcOMyZW
	k91B/tIjlc4EVG0H3S7ZmZUZfhrgs2KXo/n8PocGwMedUFbhC6JvzGbmwS9BXAk=
X-Gm-Gg: ASbGncsfpgmHlvyffsuRV/JD+SuEzlKRkdPRx5sEjjYh7dpWXct0sEwyiYKewu2xNwp
	EHfKO826gDcNDuhea4lG/U+bPkJdUXmLqBglIROhw7kmaePwNebvJ4WdczbdVrTeRvHxY31PfnI
	iEdaKrWbt3ZhKms94Pk4FY6Fv4kxesBEEIlje1cfI0JonR/fpTpjY9KpqNOYDw4D/jSNPBy5B1Z
	DyI77LK2zHODfEEp1KPGNP2UfyyI4FOkWx7uvi5IL4lY2sWYhGzbQ/2xN2ogaq+odx6PYppiKdc
	zwAPTy+TRkvPsIumqY8hUeDUUgogFdYmuY2kGeZTSbZzRLa7G8zILbrGu0SqSWshJWllmO+7FCX
	lRUa/12W7
X-Google-Smtp-Source: AGHT+IHLcLbL4s9+Xu8fSEA3SNUb2QL3vBVWN0CnlLGjFlAuBAAgrW4sXB1cYcumCEVCYdoZzh11Dw==
X-Received: by 2002:a05:6000:2cf:b0:38d:d166:d44 with SMTP id ffacd0b85a97d-39c0c13b00amr11109382f8f.23.1743409108903;
        Mon, 31 Mar 2025 01:18:28 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d8fbc10e1sm113721755e9.12.2025.03.31.01.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 01:18:28 -0700 (PDT)
Message-ID: <fdcbe997-6ffb-4166-92fe-b31b6e12391f@linaro.org>
Date: Mon, 31 Mar 2025 10:18:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add NXP Software Watchdog
 Timer
To: Rob Herring <robh@kernel.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, linux@roeck-us.net,
 Thomas Fossati <thomas.fossati@linaro.org>, linux-watchdog@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, wim@linux-watchdog.org, S32@nxp.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250328151516.2219971-1-daniel.lezcano@linaro.org>
 <174321222207.2172829.15350189767926637719.robh@kernel.org>
 <20250329171215.GA2298924-robh@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250329171215.GA2298924-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/03/2025 18:12, Rob Herring wrote:
> On Fri, Mar 28, 2025 at 08:37:03PM -0500, Rob Herring (Arm) wrote:
>>
>> On Fri, 28 Mar 2025 16:15:13 +0100, Daniel Lezcano wrote:
>>> Describe the Software Watchdog Timer available on the S32G platforms.
>>>
>>> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>>> Cc: Thomas Fossati <thomas.fossati@linaro.org>
>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>> ---
>>>   .../bindings/watchdog/nxp,s32g-wdt.yaml       | 46 +++++++++++++++++++
>>>   1 file changed, 46 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,s32g-wdt.yaml
>>>
>>
>> My bot found errors running 'make dt_binding_check' on your patch:
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> Documentation/devicetree/bindings/watchdog/nxp,s32g-wdt.example.dts:18.29-23.11: Warning (unit_address_format): /example-0/watchdog@0x40100000: unit name should not have leading "0x"
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/watchdog/nxp,s32g-wdt.example.dtb: watchdog@0x40100000: 'timeout-sec' does not match any of the regexes: 'pinctrl-[0-9]+'
>> 	from schema $id: http://devicetree.org/schemas/watchdog/nxp,s32g-wdt.yaml#
> 
> You need unevaluatedProperties instead of additionalProperties.

Thanks!

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
