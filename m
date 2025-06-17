Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0742949F4
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152700; cv=none; b=rsnIpIzkvjIvnV9PJgb4nhI+plyAPXTUfNWYzSw9Gyd+d1li8SkiDg8oq/PJG1geRD2ZfLgyM6JThp+5tDjpsDOV5lZSZPak1yDsPfKjabHVcfNPORyP7vRURaoCjnSaAYt3N2Co+NlFP4nvICJ/2RyGQ+CKdBdsprW9ArGKWWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152700; c=relaxed/simple;
	bh=6UO/ytmtnes9CZqnBjrQNp0eXOpSAraUErrzaw7pEaU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Otiktn9yqFZkKy7hcTi3WHp5YGPpOJbwLj4yGAOeJTKSG2+c9UHNU1OKUMjMHPHw443UbX74dyxseHh7IPLGUmeeiAX+tVUjZpuav4HIwcfCiiM9G2iP1+vlPUTd/0PSkXOKw+RZQXiTxz3umId2lAo0uKK5aWnl7JrfdTRKvoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XKBE6wxG; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XKBE6wxG"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453426170b6so15693995e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750152696; x=1750757496; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vazgg8MBBoKJAnc66Ha3O1o73O9xFvjsj3CSjHEZTB0=;
        b=XKBE6wxGezbJ1qYkhx2BjTQKrizghrbi8QPb/B3JvChUaF3nlkAyP2iAvHLDrOJzPU
         pYdVf2FzMYUscEndOcqk/+QyOUS2Nag3M29Yt+UeOyT6aR+zUZ053/n2qVQcTTDVF+gG
         mnwMrrESbZV54c/kUyJKVh1Lz5cqoy3aTTe09UjZE4jWe1dSqdeRdkxnOveTqXbIk/iC
         7eX4CJb4elCQHQmOITNQ8wIdSTM7xwvK6cSjFnsYH5rK9ADr97RolCaYwxicuv3bivwX
         r3JNzgiROCyxBxCP0PYWh4DQAIYyXnlHscjDgDwucDKxseFnrRbF4HYAu3921I0JMNe4
         wHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152696; x=1750757496;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vazgg8MBBoKJAnc66Ha3O1o73O9xFvjsj3CSjHEZTB0=;
        b=KzbaDUgolk6/pfZQ+L9Y7SLE94KTFT+MQNamAuudXL9Qinvfxx7pBcJcxi7W1AkvzM
         IkzzynxiRxQ5dfUYlXLB4OTzVoSqC2XbwFGzDqWPu3T+/EZDoqTyIWZnS+NK2exQn0YV
         OhfNea1P3yNouV1L45h+fPQVpZ5MiE1NzF2CwS1JIvRUVnZIcZVuecjWmErveAeMXQoE
         Pme8/VhGvC7f1VFDnVlh52Ua4V4MJNUHqHNo0IJH0HYzcSD1ZUqKuGW34ixyzdKjesPS
         GztdUZWtbd/ut2KZBKZQbYYdm4L6ueBAQ4Lc58Dfw9wb8K2BomUnvjOcgyiFggwgIEiz
         Bg0g==
X-Forwarded-Encrypted: i=1; AJvYcCUAsmUu9jX5QmZxc9zOKZybeGfMuCkCdcMdIM8WmzF06G9yvTW+VE0Oa2LitYoBIdDUyZzH7+XkStcPNPE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe+RrJMFQ6dVKlSwjsrEtkuWE3Bmt/7YkgoLhLa7dd3SmU4jiD
	URgSgh5io8O6FCzADguR7CDgGm7lW25LLVbBPkOniajsLlrFB2jk9B1RWcycbV5PWlo=
X-Gm-Gg: ASbGncv+OR6Stv49TDf9XQlOjwX5ijkrr0j6HV31yCsFbC+3O5OHNn6A4or8RUgn44U
	gwgds86xZGrgbz8iXPTu0Ot/V3x0nfww5+MjzVr8AC2Ui2IHYlJGnx964nspzrkbRjXXezrQkWV
	JkA6KuyDOPImSaW9jj6+4AB0c+iJ5ZcIQuJs1p30q5hbIdLQlisWIEn8/G16zfXd6ilrOH57/a3
	d3q0x6E92U0KcJnwydUxSYMgOeGIfZbl8vFLX9u0NFeQhaoFLLdhbOiG/Ntaw1gEXpClDapZ5+b
	wlmP4T3ABci2liNcu33sVvxlX1+CQk68NbaZy6JV3zM6dkTiFPtHCb19XDR9N1GlK+cD/MYctxc
	AJhMQjpyuGSquPothyJEWLebjivAMN4I76RPehw6yjhwMzHR46Q==
X-Google-Smtp-Source: AGHT+IHnkTMalr/l7z/gjX0Vxp3eTn0RvdP8sEl4pN/4V5YFWj81Jh87iSjRIoA3+uUkg9tC20g/fA==
X-Received: by 2002:a05:600c:4eca:b0:453:ec2:c7b2 with SMTP id 5b1f17b1804b1-4533c8ef254mr122607865e9.7.1750152695562;
        Tue, 17 Jun 2025 02:31:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3819:3250:4f73:db31? ([2a01:e0a:3d9:2080:3819:3250:4f73:db31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2618f0sm167835855e9.37.2025.06.17.02.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:31:35 -0700 (PDT)
Message-ID: <0f2b8934-9b3d-4913-b734-b4fe7f0c7d0a@linaro.org>
Date: Tue, 17 Jun 2025 11:31:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/5] dt-bindings: phy: rockchip-inno-csi-dphy: add rk3588
 variant
To: michael.riesch@collabora.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
 <20250616-rk3588-csi-dphy-v1-2-84eb3b2a736c@collabora.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250616-rk3588-csi-dphy-v1-2-84eb3b2a736c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/06/2025 10:54, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The Rockchip RK3588 variant of the CSI-2 DPHY features two reset lines.
> Add the variant and allow for the additional reset.

No names for the new resets on the RK3588 ?

Neil

> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>   .../bindings/phy/rockchip-inno-csi-dphy.yaml       | 60 ++++++++++++++++++++--
>   1 file changed, 55 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> index 5ac994b3c0aa..6755738b13ee 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> @@ -21,6 +21,7 @@ properties:
>         - rockchip,rk3326-csi-dphy
>         - rockchip,rk3368-csi-dphy
>         - rockchip,rk3568-csi-dphy
> +      - rockchip,rk3588-csi-dphy
>   
>     reg:
>       maxItems: 1
> @@ -39,18 +40,49 @@ properties:
>       maxItems: 1
>   
>     resets:
> -    items:
> -      - description: exclusive PHY reset line
> +    minItems: 1
> +    maxItems: 2
>   
>     reset-names:
> -    items:
> -      - const: apb
> +    minItems: 1
> +    maxItems: 2
>   
>     rockchip,grf:
>       $ref: /schemas/types.yaml#/definitions/phandle
>       description:
>         Some additional phy settings are access through GRF regs.
>   
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,px30-csi-dphy
> +              - rockchip,rk1808-csi-dphy
> +              - rockchip,rk3326-csi-dphy
> +              - rockchip,rk3368-csi-dphy
> +              - rockchip,rk3568-csi-dphy
> +    then:
> +      properties:
> +        resets:
> +          items:
> +            - description: exclusive PHY reset line
> +
> +        reset-names:
> +          items:
> +            - const: apb
> +
> +      required:
> +        - reset-names
> +    else:
> +      properties:
> +        resets:
> +          minItems: 2
> +
> +        reset-names:
> +          minItems: 2
> +
>   required:
>     - compatible
>     - reg
> @@ -59,7 +91,6 @@ required:
>     - '#phy-cells'
>     - power-domains
>     - resets
> -  - reset-names
>     - rockchip,grf
>   
>   additionalProperties: false
> @@ -78,3 +109,22 @@ examples:
>           reset-names = "apb";
>           rockchip,grf = <&grf>;
>       };
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        csi_dphy0: phy@fedc0000 {
> +            compatible = "rockchip,rk3588-csi-dphy";
> +            reg = <0x0 0xfedc0000 0x0 0x8000>;
> +            clocks = <&cru PCLK_CSIPHY0>;
> +            clock-names = "pclk";
> +            #phy-cells = <0>;
> +            resets = <&cru SRST_CSIPHY0>, <&cru SRST_P_CSIPHY0>;
> +            rockchip,grf = <&csidphy0_grf>;
> +            status = "disabled";
> +        };
> +    };
> 

