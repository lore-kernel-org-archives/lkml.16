Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613D91E480
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 05:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747200510; cv=none; b=XSwjiEHQJP/2SnfiU3ujiSE/a8cvX9e4CIkyWtSHDpd8MzkjMIb94IpSp+aDh/nc7qnMNua1f1YcXg0wlciG2SJCGquPT9mzwH540gqJYf3mek2e/SJe/ak3yt1Ewj/pNt4Lp+99VPGkKbVwmOcxIWe1GdODdZcbfZ7IgHq+U3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747200510; c=relaxed/simple;
	bh=JkeFk5JvtELodwEn2MQCcvDJk93HA88o+taJ9J75Wvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z9QLSEgxnkpLqeFVJU6VK8nJhklj+y4QGQa0FoKg87asQQHTpZAhsjMraCYASgT+FOclRKI+WsJlNZl+n9ySe7jEzxMaT8IARYoi79LoI/3eZEtXG+CnbEQbbQSBlz3ugMgEG5crLiAe0VHGz3CBxbUwZvCjDxeZJKDHwjExr4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dVihJdk+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dVihJdk+"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso65212055e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 22:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747200506; x=1747805306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fu+kToH5ynZZEiBVPI1+qje7yD+2OfrJbW9noNa4CNg=;
        b=dVihJdk+ifDgF3QyP8rRJJzBytMIYTapriOYoM6ZnyTuWmSF9CQhG4Y58jNjQKeI7f
         XvjQ3XBLfV3pq2TG9L7oFn91xIfnX5ijcey5ajzes8LcebC0CPRlziYwkdp+E2Ya7P2U
         OivLsOZeUx6v+eTBFXLwSIaZwi1gU/AjeKeqc6k87HbEnID4mlPTdGvpg874bzXh1XXP
         npceKV8lSYqFWgdu0afboQMPVWMfoFOwN02kNhOKp+kifGZWOsPMFWDHJkdC5uXaFLAQ
         RAlNBR1BOF3Q/2bSLJIZda0z7LqT3SkqFqwiYt4lE4ROWzDyNpYP25K5hgUby7suEnti
         jaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747200506; x=1747805306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fu+kToH5ynZZEiBVPI1+qje7yD+2OfrJbW9noNa4CNg=;
        b=E3xyUMyCJ34Dbd+v/JlkqshF3r1AGukC2MtQ+RmeKi6cWmWB94i6MtEd9fYydfOTdf
         6eunyi+aXuS+ZW7NglxWVoFkl1ZhqGgZZBLp7BnwGlMu5XQ7daCikU7B77JWtudhxWRK
         iANwEsXa7ueqVmZUrd4GgbNwD7UP+iV3Cif372cVmLznB7A8YesO0bw3W103VtcaTQu6
         vorA1Edzw0w/kX8IF3jHTjBcDv1/5eFCOIAomFiCjlBqWf6QFPBnWEKXykG6QKXtEq3d
         e4q0midG0u/7jBn9J01Z+UrGE88kn/FW/NJRaR6Ng4WFSFsQDGpF7hkOdqdvCVOUN/rr
         aQRg==
X-Forwarded-Encrypted: i=1; AJvYcCWcmkPjhBYJ8wAle0DwOnOnq3UOUCqKaC8ghUKkh1dYqtYfaflJWdf2yKOQ+AY2G1lMFcqaNs7sAjiv8bo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkFphsMjJuDnIb6jzMt++4fvIlPiNOPPqKuP0guKkPSyG8B4i0
	6vLsBbFbziZQ7/+aiCCx4xG3NQ3u48hcxh08NME1kHpNOJXymAWP2D91r9m9bTg=
X-Gm-Gg: ASbGnctbwQFhgg1Q5j80hP16ARAJV63Qo+rwodDkI4LOVhm6kPexjkmltEx7n4VYixX
	eHi1g2csRtqrj97m0WJKgVVhsI7E6q/rElzPfxFSDTiPkCcQ3WxBJSH0z0hopn0TEdR5vr0FTS0
	uXJ9ssu6Ja4ZGAZMMzUdHt0vgM1BMSk9soL/vB/yKTPgzlTBRv9Wba9UDf3O9Ii0R4DvvuLIT3a
	jlrLKUWpcvkDy0ndenzRnRb+FqCrDrbkJsFVIHZC74t5Fcj9hGjVPJcgCUL/Mn7S8myKnvMsn+e
	mlZrkFoMXQCzReYa9hKosKuQVTN6lTrUeTlfnBeNjK+Zs4DHYoAxN08ga4TH2Re3jc3oWzhc+fw
	chBhiIIOd5hjV
X-Google-Smtp-Source: AGHT+IGR8fcXwr8UrIba7uq3uRKgiVAoO7flrB6Ax66vVZKivN1s8Mt+EFttdNMqYIyUx78KHccYtQ==
X-Received: by 2002:a05:6000:381:b0:3a2:229:2a4d with SMTP id ffacd0b85a97d-3a3496a49fdmr1286717f8f.22.1747200505555;
        Tue, 13 May 2025 22:28:25 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2e9sm18279823f8f.75.2025.05.13.22.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 22:28:25 -0700 (PDT)
Message-ID: <017682c3-76c6-47fc-81f2-1da2a22a9d34@linaro.org>
Date: Wed, 14 May 2025 06:28:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: media: camss: Add supplies for
 qcom,sa8775p-camss binding
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <20250514-rb8_camera-v1-0-bf4a39e304e9@quicinc.com>
 <20250514-rb8_camera-v1-1-bf4a39e304e9@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250514-rb8_camera-v1-1-bf4a39e304e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 03:40, Wenmeng Liu wrote:
> Add supplies bindings for qcom,sa8775p-camss.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   .../devicetree/bindings/media/qcom,sa8775p-camss.yaml       | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> index 083e1193c474265edb445dd30717360de57ff986..aba46c0bc11faa062199f563602494bd2f62367c 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> @@ -125,6 +125,14 @@ properties:
>       items:
>         - const: top
>   
> +  vdda-phy-supply:
> +    description:
> +      Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>   
> @@ -164,6 +172,8 @@ required:
>     - iommus
>     - power-domains
>     - power-domain-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
>   
>   additionalProperties: false
>   
> @@ -343,6 +353,9 @@ examples:
>               power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>               power-domain-names = "top";
>   
> +            vdda-phy-supply = <&vreg_l4a_0p88>;
> +            vdda-pll-supply = <&vreg_l1c_1p2>;
> +
>               ports {
>                   #address-cells = <1>;
>                   #size-cells = <0>;
> 

You can drop this from your next submission.

We are fixing the PHY schema to give a 1:1 relationship between PHYs and 
their associated rails.

---
bod
