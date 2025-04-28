Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCEB26B96F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745845689; cv=none; b=G5FnA74Rd2ekdg4e9/sN2ttNZL/36STJEprbOY0B1w3nkWrtsDqH+YxQnY1oa/btSapCfehwcQQ/m15QOCikNBTwH4l1l8BEi2CjyIYvxwLf4C5fuxrS2d8UDEuZsohDShHFSkOeg9KJONbP3XnQw/DCifabcOY5KPFvFxaHWCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745845689; c=relaxed/simple;
	bh=mnAJ52ar/AYv9v6+Df6x52ikTOPL9XyTF25FkLX5Wyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T5L7eb9MLIhAfQYT1z8pKVh+nm2nwUQc6+CXO8i1ikvF+1kcQQOdYV4s+Gix/JnmrU18HOv9VdiCGPpe1JSg3AiX6sZ2wRzFcosop2MMmD8TmZXzGQlIkLCr5ru2/wp4jLNgNOTWKadGwSB+AoYJqjuVp0I5otaIJafhXDUHfI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i9eioiFL; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i9eioiFL"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54acb0a5444so397574e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 06:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745845686; x=1746450486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/rKI293OkNtSCRW2GiaUvxvB6LASuRfbVCog4wPqflw=;
        b=i9eioiFLmw5h43VogwenzwqeF/bl+PBt86aVZUAqn0Brir991RxjbXDmKTgOA/p1Dj
         r+b1igx2XOwhE3qDjgCNro5NTgwvkchw9Ayuc5qnqWWiBmYkkg4+qQ4XRZ0x+2MCU1cd
         bUv6Nbn8IGpKNFQReZ1NanNU2553S+Y42B/lIVm1CLgw1/mDcQEoYoQN1Xynq6nzBfui
         uKZM91ZpRTAJ6gkZhFSxKH6eKgvet8KtJnQXtUmV7nkst415gpUE05skRcOE9VwlN/h7
         8w390sWh3TeXzch1gSvCnhP6sXtOmapsNH+oPld5pQfDN2hh3tePQdTYXDRTNLUACJmp
         h9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745845686; x=1746450486;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rKI293OkNtSCRW2GiaUvxvB6LASuRfbVCog4wPqflw=;
        b=snO/XyxcYCZ23fTnVKJ1HCClC7z7D6U9Y2JpMMsCr4n8oWoSS63CF5LOxoSNwYnW73
         plMdHDWIe1gklVSzO8qI1HoXqauelayhKVrAkcpLaqFA8ZUwfT+9d7buiOstQZyiBlyb
         tBoufoV9OSPGIm7mQ++oiGPlWMgSTExrZEC0IG6zFVnbvufGsgcTsOUPkNmzsmHfajjl
         ExUQS49+OXU9AOMzuncHBbsN38W9bPN5g2kiRNClND1opXpnJlrbAYx5dils29Vn5zIQ
         1E1qW8Tnh4F/VYyQITTh+7g22ED7Pjyk48ouo562ISzIqAeJlm4JHp5wBsZzUnJ5j25n
         o67w==
X-Forwarded-Encrypted: i=1; AJvYcCWZKJGqSHZOaUiRUe7XrKPLs5gxkv3N+T/6lfsH25BeFzspyHBowr18FWxvqFx1SkTJdUESUIlGoWTqxMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAn7GLNNGyaWv3C0oiJ2S8OKPAQ/uly4hi+D2k05i9q748Dzf8
	7s9mza7JiOqHh+UZ/7XIRESjkA42lSA018YgXY7jog7aRhk9DnRg4g3fwr5u3E0=
X-Gm-Gg: ASbGncsVsna4Wm5AdPZpnNV7FaeFBYFJfFYED/Fx9selew/yX6WUhdNJ3ruaFZShNR2
	qJZYLL1Et8kwFbd5LfPKdevHIlG5WCyKLCXCjYROj+oy4suBQDzEZtBq8NGDZ4H3I+SR6ziqH/l
	XFNbEbYADBCDokJIRxWlEW+P1Z3VBs9qGqYTk3UMLRhWoXT7KkBcPY4olTzTi7oheIp9o68J+jQ
	WCRFsy6ZH2H6dTZXE9Y4WR2zFgEdXv1x2P/9KO07NmBTm9wIR3eLI3Pb3rVSDyjV1alQPOY7455
	YdlT+cr0Rb+QDbrGF9uFZKstwkMiOlk2BprO1Iuw69JmCTmTHjDqXCrjGyTxo9CrTRkuehb1NL1
	aEQH1PW8RneR1/vCrn9s=
X-Google-Smtp-Source: AGHT+IHigrHmgJYNc7nLQZKoFasjeKXtn3RhBxEwzQXSKbVJgPgq1Au5kKKLuo2iHhmAFvJw3wh3Ig==
X-Received: by 2002:a05:6512:6c4:b0:549:8932:a1be with SMTP id 2adb3069b0e04-54e8cc111edmr1038151e87.13.1745845685451;
        Mon, 28 Apr 2025 06:08:05 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb39f1esm1632907e87.58.2025.04.28.06.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 06:08:05 -0700 (PDT)
Message-ID: <b80d500b-6203-4d83-8396-3ba579abd980@linaro.org>
Date: Mon, 28 Apr 2025 16:08:03 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/10] dt-bindings: clock: Add Qualcomm QCS615 Camera
 clock controller
Content-Language: ru-RU
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250424-qcs615-mm-v7-clock-controllers-v8-0-bacad5b3659a@quicinc.com>
 <20250424-qcs615-mm-v7-clock-controllers-v8-2-bacad5b3659a@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250424-qcs615-mm-v7-clock-controllers-v8-2-bacad5b3659a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Taniya.

On 4/24/25 12:32, Taniya Das wrote:
> Add DT bindings for the Camera clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>   .../bindings/clock/qcom,qcs615-camcc.yaml          |  43 ++++++++
>   include/dt-bindings/clock/qcom,qcs615-camcc.h      | 110 +++++++++++++++++++++
>   2 files changed, 153 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs615-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs615-camcc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..2b811e66d406c16c70004bb3a9fce294422a5914
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,qcs615-camcc.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,qcs615-camcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Camera Clock & Reset Controller on QCS615
> +
> +maintainers:
> +  - Taniya Das <quic_tdas@quicinc.com>
> +
> +description: |
> +  Qualcomm camera clock control module provides the clocks, resets and power
> +  domains on QCS615.
> +
> +  See also: include/dt-bindings/clock/qcom,qcs615-camcc.h
> +
> +properties:
> +  compatible:
> +    const: qcom,qcs615-camcc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    clock-controller@ad00000 {
> +      compatible = "qcom,qcs615-camcc";
> +      reg = <0xad00000 0x10000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>;
> +
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +    };
> +...

Is there anything what prevents to add this clock controller dt bindings
description into qcom,sm6350-camcc.yaml ?

Apart of compatible values I barely see any difference between two of them.

--
Best wishes,
Vladimir
