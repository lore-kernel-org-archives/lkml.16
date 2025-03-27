Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5BA190692
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743089953; cv=none; b=AXOOzyVuGcD8YMiDolYo1THQyFp6WohceqTvwcMv/rMSRMnZOXpW7w9fSY5hlpsWXWUkwnGB1F90fTHvTUAT8agNpruCADJgwPW34Mbd9yjACGF85Ke5tklsR2DzZUDnTDlm+GKgMdeSmSJwU+cQ1UwtSiVeERMDBq9ofYbBptg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743089953; c=relaxed/simple;
	bh=iAOo3qQbFdHRPvpiwQ6URvgLoftj9WyyrxLOyXzy7dE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=asuRYsB/tumGoJecpnra5apU3vAe+tkwsXhx2p9Hq8keFAloUfO7TaQam4q9iZfywrQezqnZa2auLOxw5Qgs6ZMHMO3nGBGWPfWKRiuzWwAuI+ksuFF2HarxizVS5F1XS+kOhT869KWkbzI5WP7eoUWmlcRtiF3HXyreq/Ps6hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fiNAEZ/d; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fiNAEZ/d"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39129fc51f8so845953f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743089950; x=1743694750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ymoLsASUKMBlyvnyVSwfPY6l90pScenHxGprvSvqScE=;
        b=fiNAEZ/d9tALL/K9+gx5dOddzfLq5Ka6+AHb1oYBXgOqvuO+GmvaI5suqkj0y6nhWA
         rlPePQSuOl4Mgm3bIO8kWfEH1OhRa1SHZ9ZfyFveQeqo6XXylGeHbgLgkTafHw5f3sny
         QPUll3C09sHHs0p8HsKSZ5SlIMu4Ih76lzUMb6uAFTmZAAGyCRixOXoPD3PSHekIWqQX
         d4fRPi6GOaRiUWBIhhfPrTDZQ6Gyzmzrz8O/m7aA2ihMkEqM27raNKJYIcmkhv3oNrEg
         oeWQ6rY7ritNZzpPCQadUgqB42Ha3OyZaSRdhiTZ4vqtHsXQS24+Q+d0IG+bXr0wCnlv
         UdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743089950; x=1743694750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymoLsASUKMBlyvnyVSwfPY6l90pScenHxGprvSvqScE=;
        b=Qgdb4PUY6E9+cfmbMiLHrGt2C+MZagg9kiB9u8YMgy1Fo2ZylI14RBcuB6y58PV1xa
         5rzeE5cVqMPFiO8PM4wh4byvgw4vU7rAwgzytqCqG8D/mEVUgRx5kWbnlbbbF0SLiz2J
         tlHrTqq/y9Q7ao6hQjGCfSmHbpCRas0IL99x+o5eWXp7dp2Q29TZdFkHxqVKBAylq5Q3
         1vz9jwQRV9wgEob75YJWtPraHVmxqEO3iz1pCpFHcEstV72498SgC7yDu6GKDc4Bsuyh
         +kZB5eQnkpl/+O0dvEMEEuOPeDIaoOTLUbCr7bFk2StyOIkxfzqb6WHSaM3GcUJEZvLn
         JRQA==
X-Forwarded-Encrypted: i=1; AJvYcCWhg0KzaPJM5fGhVMhMQGI15ElkE9V8k+9qvzaQEQv60ZgeyJHXWruO/fkyyTY+rh+NMnm++T/5OYYK29g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAR9mMaqTRgXiB2HTiIeEFkCAcEC9N2ZLq9xCA2McHjIjYEH/O
	Y4jl91uuEyF4KiCKziEZ3nFfGe8UwOc6saxeh4o3HgLtUDJ++5BWqph8kBENSKE=
X-Gm-Gg: ASbGncvg6036l6MHG2ZvyIF/XwNHgf7i1LnaS8JGpcRKHC68+cwEwH0XJJ3VyI8U5/Q
	MZPt9OObjIjqsKKiQ5fqfNp+Gx+wIrbAXQaedXUIfWjHpcz135o6pNNFCDe/xCcaNuZ37MWUpBT
	T172oRdyWhQ1PU4wSbuhDMVxKfRO/zVe/9rxplczQBK2pHvcQa8Pak7tWw03X8Ad9YnOiSj8j7M
	UofHVpfFGXsmywtoiqkEW4bdwpj8aSfxaoxn7GIZWxzlFCPK0clPrm+35f6ynWcxCpvQen80ltB
	JTGFnRxZpP3bFPMEa41VI7nkRyCNNq902FUTM9sWd/GafTEHU0nb08wtFS9/7P0DQ38GHrEdmZ+
	qcsfA/VI1VLAU7J8tcbhP
X-Google-Smtp-Source: AGHT+IGyrq8BLj3GNTEbMeK2aMER+K+7T12e75iuTsRmZkET3cjw7uq2dfr/7idg5JtEdGKRe48sdg==
X-Received: by 2002:a05:6000:2a1:b0:391:466f:314e with SMTP id ffacd0b85a97d-39ad1741a73mr3848575f8f.16.1743089950131;
        Thu, 27 Mar 2025 08:39:10 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9ef16csm20195844f8f.86.2025.03.27.08.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 08:39:09 -0700 (PDT)
Message-ID: <8721c38b-3414-4635-871d-2bd142fd23ab@linaro.org>
Date: Thu, 27 Mar 2025 15:39:08 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/18] dt-bindings: clock: qcom: Update sc8280xp camcc
 bindings
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-2-895fafd62627@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-2-895fafd62627@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2025 09:52, Jagadeesh Kona wrote:
> Move SC8280XP camcc bindings from SM8450 to SA8775P camcc.
> SC8280XP camcc only requires the MMCX power domain, unlike
> SM8450 camcc which will now support both MMCX and MXC power
> domains.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>   Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml | 2 ++
>   Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml  | 2 --
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
> index 81623f59d11d73839e5c551411a52427e2f28415..127c369dd452608e5e7a52c7297b6b343d1c1bf8 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
> @@ -17,12 +17,14 @@ description: |
>     See also:
>       include/dt-bindings/clock/qcom,qcs8300-camcc.h
>       include/dt-bindings/clock/qcom,sa8775p-camcc.h
> +    include/dt-bindings/clock/qcom,sc8280xp-camcc.h
>   
>   properties:
>     compatible:
>       enum:
>         - qcom,qcs8300-camcc
>         - qcom,sa8775p-camcc
> +      - qcom,sc8280xp-camcc
>   
>     clocks:
>       items:
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index 9e79f8fec437b9aecb5103092f6ff2ad1cd42626..883f12e3d11fa16384108434f6de120162226a28 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -15,7 +15,6 @@ description: |
>     domains on SM8450.
>   
>     See also:
> -    include/dt-bindings/clock/qcom,sc8280xp-camcc.h
>       include/dt-bindings/clock/qcom,sm8450-camcc.h
>       include/dt-bindings/clock/qcom,sm8550-camcc.h
>       include/dt-bindings/clock/qcom,sm8650-camcc.h
> @@ -23,7 +22,6 @@ description: |
>   properties:
>     compatible:
>       enum:
> -      - qcom,sc8280xp-camcc
>         - qcom,sm8450-camcc
>         - qcom,sm8475-camcc
>         - qcom,sm8550-camcc
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
