Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDC52248B0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 19:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744831467; cv=none; b=PRWjxQt2ZbU93H1u1gG3N13WEV09w+IthPg+7p0AGOG7im8ftC9Dn4BvlbTUkuQjp36Do7wcOsqplI/lgnZEF7BxW5dhOKIBzecysD8JsPqOQOLS3lhBHQ/3pIP/Q1jngMT53rYMTSAoLO9Kv9ClyJ5qGpLUDDerqP0bCoCIxmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744831467; c=relaxed/simple;
	bh=L1QpL+dJg+mvC89uNW9F0Wau2KS/B5UiT7wTtGlO8ks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lURAZU84CI9sOg2Kj4ppljBfxezwtO0LSYSUPwIpuud97r4W48SMjcHKl9yB+8+HB20JGN2WKRK5GDWLAREE60NAwEoUH3ORei/jvHtmnSp5JRfBYJyKmdpi2bd4mps2q0G7plpuyvk/vV5+91bkhtOQKMe42u4EWQGWthcTEoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nhYGLM6g; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nhYGLM6g"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-400b948600aso17594b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744831463; x=1745436263; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OVWtjKl7iqOi18r6l4CQzpfIdcd44V0fOP6BaJjZNMU=;
        b=nhYGLM6gcJcCl+oQB7bN27zSlNCtr/ulhx77MXw+Cfl5JQuZr5qX+gprtsDvobHw1y
         KHbxm7Lt0zl0fVl6/iZ4WC5PmqZBKZmDCwKNR2SGsLqyJ37SqcqPFxwLx7+UlhvdFMhZ
         nRBF3f8SHdTnYtM0IGAjx8+qghmJ5LdJuOzKj9tZXs31rm4/WLE/RR3Lkejd0QdGBBu9
         vGw52Q4evc/RCUtq+7Fa3qvXSO1S7ajeEmLRWJwNAfjno8IHA4WvsMzwRxKaEtutSy2E
         C8pkWQssm0VoGUj5VntrM8QLtR788neZASlnYzwgQsB2YYzNaoL0lLriJd0dTzxP6/q4
         7jUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744831463; x=1745436263;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OVWtjKl7iqOi18r6l4CQzpfIdcd44V0fOP6BaJjZNMU=;
        b=tRfFIpP7ngFrwhR1tEZmHUYdPTc9s8JqjmaDYpy7Igyisupdv20aWbP6cB2Nf5nI41
         16B7GaLt3dmjLnSAgcvijkFH8CX3TI+Okpcr+hIQ3deNAe5RzA4sOw4Revqb7tnfwb9i
         Kuv+wSehjmi6pLtKBl90wwEt9OxcLp+IAHJYaFg42jfGgs9Oj4veP4JAOrWfa/DylkqC
         b3XAbaqYzOom7/B5mtbcw+6cRged3xIwhFSN+Wqa2bS41IigFMoghwuEkwdbBX0yVkwh
         uZ1UabkSTvZcXDAEg1tquHToL2x8jUpdkPxdDEqz0wtG5jlELTaXB357oBXy9hYJmdcP
         4Mzg==
X-Forwarded-Encrypted: i=1; AJvYcCXBvzaOji76iR3YUbz5mYKUm3r75pjXecIDSp5+6n55/Hn1ht384yvPj1SnlMQgRE5tVnU6x5evmpQiRi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrwdWDeYSbHpGkK2o8zq8Nw+Ot2/yHkNgb7LaVHJVOtMJjvXy4
	Vt8mx+xqV5I0aKufETNv+GHtcVp4Mq8I4TmLOEAQwju0T3jvtum3oSghJWpif3I=
X-Gm-Gg: ASbGnct0JANui3XlK7ujzW8g/7OwSiJafCna9/PhXH7BSoZjhutsFSO6Qsy4GlrJypb
	9AWnrIMup8gZbcztdof6www3Nxj1ObMcL/9qPfDh0lQhfVxdgtQ1R4JL7wPlh9/WQYzvXbMERc6
	60OkOpbsGjlrc/UakkAzbjTnSY1CgYtX6t/0UBezK7WxOXJiKP6cdZrdoTuxh88gGFB2TKeNDyX
	IvDFcquP1ThE35AsRY+iM2Oyleus8X0oaFwC4mVom0p06iUSe+N29e39P+tkckjt4xRYkzycl1z
	4T0+zVEbjzZ8D/D4Z2UqO0nUlgar8rYiiuLKqjGyy9zE1WyXP1lWduM0l8/7JzPZA94Ve/D4A1+
	4zus3i7dcsXFU6/DrOtrUwdBprIgs
X-Google-Smtp-Source: AGHT+IF0mpnDIyAnn6ZeAXKJmpAUqrHnVA/Xnwlkcpkjjq8eHzK67t5vDdKrA4mdat/Ij0oR7736Lw==
X-Received: by 2002:a05:6808:3094:b0:3f6:7cd2:8187 with SMTP id 5614622812f47-400b01e17e9mr2050247b6e.20.1744831463701;
        Wed, 16 Apr 2025 12:24:23 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:58f0:670c:6b15:7fd3? ([2600:8803:e7e4:1d00:58f0:670c:6b15:7fd3])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-400763bab7bsm2809388b6e.45.2025.04.16.12.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 12:24:23 -0700 (PDT)
Message-ID: <dbc60881-39e9-45a6-b535-1672c5f8cb6b@baylibre.com>
Date: Wed, 16 Apr 2025 14:24:22 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Add driver for AD3530R and AD3531R DACs
To: Kim Seer Paller <kimseer.paller@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <noname.nuno@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250412-togreg-v4-0-cb9e5309b99d@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250412-togreg-v4-0-cb9e5309b99d@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/12/25 12:57 AM, Kim Seer Paller wrote:
> The AD3530/AD3530R (8-channel) and AD3531/AD3531R (4-channel) are
> low-power, 16-bit, buffered voltage output DACs with software-
> programmable gain controls, providing full-scale output spans of 2.5V or
> 5V for reference voltages of 2.5V. These devices operate from a single
> 2.7V to 5.5V supply and are guaranteed monotonic by design. The "R"
> variants include a 2.5V, 5ppm/°C internal reference, which is disabled
> by default.
> 
> Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>
> ---
I made a few comments on the driver, but still good enough for:

Reviewed-by: David Lechner <dlechner@baylibre.com>
