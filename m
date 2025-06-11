Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F752D543C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749632468; cv=none; b=QW7rNkhlYeLwwQyVAJqAFfvPSVyrrXXK00QqJCxyZFWaeqYyHtkR092mGfy9NNy6Ick+nT6kRTMnRigfvhhT4qJ5xUknEL6hE66iuIa4E+qOqkMASe3/C+hso/W18nKcvTA6U8C50PF70zZ7KvipURblodyY4cIM40kK5pD+rns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749632468; c=relaxed/simple;
	bh=v3DyRzczkE2UVZWBbNgYtQeA5CY37lCJpmkA1PO1XPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TXFMhKbHZPIToId3Vpp2K5yzl5thyNJG/I8BzS8MXeUQvDQhgnwqRuj9ZaBGG3gs4cA/bCtIJKgkkfRVCc07uxviLFtPdXVZAVcaxYnHvmcV5HHlfs5L8xpgycjiWaljam4LZGcXl0K5SAWvX/13aUxhM1oLMK0Qkh72gcYnRX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MPNoHuW4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MPNoHuW4"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so5586185e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749632465; x=1750237265; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XJm40I/c8bMbSQ2gLkckcPV2BT9XiCMqMdBOXz+J4DM=;
        b=MPNoHuW4k3h6zH/5aIrFagUtBQMZMtkjigXSGuBpGqsN73XwyMonHbniRGAw1GUP4Y
         KfGANXWqt/R7MWnP0TvB1tyqv+mXPZXhO8AZaTUh6EjFeUcmWikBfK/LRTa0e6pVG9CI
         yiSNdr9u6o46RvuMIlp4VxFVDdUoY0DTkGSrceJAgEQthFCFYm88wo5jI+Zf4DIk3krd
         giVfDUar+ZE2LQVKPEqJUTLEqIGE1FKwjCZQrjn0aOfwgBJ22StwRUnSWwtgycEwqTq3
         vSjYnoIZYODXPOfLfD0KcMwS9GoHMcaREKozexWIi4t0jtPgiAbZZW7Pq5jeoWez6Jwj
         9kHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749632465; x=1750237265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJm40I/c8bMbSQ2gLkckcPV2BT9XiCMqMdBOXz+J4DM=;
        b=IkYt3rPjxAfvUMSGTkvd+TaZI9MLHwj0s/VYCvq2Fksz1e80RBoniA4PDlmaqyzdX9
         o0FvJmiHA02ZDgWtxUdH8tyuAcJRt2ug+VIF9PomhUNbREKWju+N5O4dXN+lAEuHpcNQ
         m21x/q39pLqQHCU9TfCjIyW9OnfTIzSlfYBm1LRSnBBXMWqA02s/4mEe1/FpJZTB7/m7
         p+oEWQ5tINeuRZszeOWAsd9Jv4UiY5XwsKqi5mf+iHW5eTqeIMJnp9ztQPS2hVtCXBlk
         mMV79KY93laKaN90a0iRMr7vm/N3hG35OlDh9m0S6Yz8uFRz25DifLcXfqLov5fCDZaE
         QQmw==
X-Forwarded-Encrypted: i=1; AJvYcCUIspIhERERkLpaDtL/FBPFN/WplIM3ghtumVuCJ95i1BogtPvQDurWnDZic0J434x5+OALVNANA3DnL5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxgOq6iTyP6LPb/AfNsiyC/kNCOkqc8JenIEMFUNqKfYjalhbT
	Uztx3mtfCbtDW3tMr/cI2QyE8etPT+vcyIUFefNNfE0eJXzyHCCe09C5N1NWisofK8A=
X-Gm-Gg: ASbGncsRVLN8HLyAfSgWhxuolzOIxs0m8GFV+aKfGfVo7zYZpc6HoTYCPk0kLsL9mYc
	dukjJtB3YAYxw/lR/z9STMC13dajkxydfebasdznUL9uPuTup39lr0wTYHFgKx+XgbauBvIXtFl
	3f9LAvOw3YjDk0piUMhoQln2FurlcCxUfFTyD82cDbKixdO4U6Z6wrbd64FREHTKeU2p3K0aIJ8
	SFvOMmfGStM/vURcTp802JQB6k74dK0G46Rnkh7QyLH742Tcx/z+6bjsrymrGydUAjZQu+HvUIQ
	j1H/M9vYBoKuEgPK3HCbVehOIYN5ON4YCmNQPjc9MCXRC0SMXyvjWsVOe0UU8j5YBGSsH37rxW3
	LS14srLU2B6mCcIg/jx8VMxXltZRQ75NrMx8oZQ==
X-Google-Smtp-Source: AGHT+IExzgwdr8TfxBDCEu+Ey1NeulxA8+khs0xDE+znUJY2X/I7uK4IKHUPwG64Q7l/cfcNMl/rlw==
X-Received: by 2002:a05:600c:a108:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-45324204ce6mr15992715e9.12.1749632465041;
        Wed, 11 Jun 2025 02:01:05 -0700 (PDT)
Received: from ?IPV6:2a01:170:117e:fc:1a1e:c277:1c68:9459? ([2a01:170:117e:fc:1a1e:c277:1c68:9459])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532517266dsm14793785e9.18.2025.06.11.02.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 02:01:04 -0700 (PDT)
Message-ID: <4929c09d-ea3e-4dab-a440-a7d806793d9f@linaro.org>
Date: Wed, 11 Jun 2025 11:01:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: power: supply: qcom,pmi8998: Add missing
 power-supply ref
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
 Jakob Hauser <jahau@rocketmail.com>, David Heidelberg <david@ixit.cz>,
 Dmitry Osipenko <digetx@gmail.com>, Tobias Schrammm <t.schramm@manjaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250604-dt-bindings-psy-monitored-battery-v1-0-7f755ff75218@linaro.org>
 <20250604-dt-bindings-psy-monitored-battery-v1-3-7f755ff75218@linaro.org>
Content-Language: en-US
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20250604-dt-bindings-psy-monitored-battery-v1-3-7f755ff75218@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/4/25 10:18, Krzysztof Kozlowski wrote:
> Reference the common power supply schema to bring the definition of
> monitored-battery property.  Drop also the obvious description because
> it is duplicating what is in power-supply.yaml.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Casey Connolly <casey.connolly@linaro.org>> ---
>   .../devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml     | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml b/Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
> index 90c7dc7632c58dc5cbfb3abcde8e730882bfd936..70f5cd6eaeabe822babf567d92b1d7f9124f3680 100644
> --- a/Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
> @@ -38,9 +38,7 @@ properties:
>         - const: usbin_i
>         - const: usbin_v
>   
> -  monitored-battery:
> -    description: phandle to the simple-battery node
> -    $ref: /schemas/types.yaml#/definitions/phandle
> +  monitored-battery: true
>   
>   required:
>     - compatible
> @@ -51,6 +49,9 @@ required:
>     - io-channel-names
>     - monitored-battery
>   
> +allOf:
> +  - $ref: power-supply.yaml#
> +
>   additionalProperties: false
>   
>   examples:
> 

-- 
Casey (she/they)

