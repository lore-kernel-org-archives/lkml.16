Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B392222AF
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898595; cv=none; b=h2HHDKuQB3vcWMcJhEC33iq5U4InNFjWh28mFP3ZpH7R61lHhOTQC/hBF4Vb+JsmII57Vf9tj7IOr+iSU8q2WbQOnIRavWKc09o4Vv3PcrIzyPEp0iuRN2XPP+eUWxnZPufrbiH4uzl8YXCejDrVjLPGDVp7lLAv24LtCubbGlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898595; c=relaxed/simple;
	bh=+W5ZcdVBC8wnQHb6cdslYN7V09ylGS82Z5oEceUSFN8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TdUbX55X5PjqYWkVyQFnMP8IJ3Mv4OwNArTLI2mHFDFB++ogV+aD+vPy/nhhGJsmPxnZz5Fp5uhw8cXq/2JayXKnjKQ3gusVIyu0goayi7DFCVCjo+Ei9lhbjG1fAoWx6CaaM4O5/vAYYFjC6ht9MBg0JNQEw2dpI4mrz5tPr88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NEH4+g3D; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NEH4+g3D"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf257158fso58401855e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 00:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747898592; x=1748503392; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DKcV9YJnik1heDPbiDZhe+461Bkk9PUXYS1vSVg0MNo=;
        b=NEH4+g3DT/oJJF+a/Q7qVqn4vRrUKsQPGWqZniHg2/HnEhjvEN/gcN4hROMF4jo5Kq
         7LuZDD4CZS11qzdQqVnum2RwW4ytWihhcxXeSLmBO0F8k0EclUwc3vFhYS4CyBs3/eMx
         Ddgb5b1fygzSMuTJ3zZ6x+DUBLjShSTWmcAj4JWHJAnfZtYBR6hB4h6lb7g938v7A+mW
         ShM+AUPjh26+srM0gnUIVOWESamhLqKLLU1+665Nvc3HFVjs7/+NdK1JM5j+ypP4yfaF
         PWfK5HFnb6KfrbWjrsTDEnylxb8v/T8K3oXeuhmxUQoqK8eWXp8t5P2A+8cO6iyetm+b
         rXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747898592; x=1748503392;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DKcV9YJnik1heDPbiDZhe+461Bkk9PUXYS1vSVg0MNo=;
        b=P2WiYKYKb0pofvATs0vA/WsosjUIcTxKlCbR2kizs9IcDTdFWUJfa+B1eatGOHV9du
         1OlJqf0Q08sG2lFvorzongrHDwik3dXbPG3q1lv1RUpHBqFOdTlyV+g0iPLX6ayRn7Vv
         axEFa+QRTLjiMghjl73sv7ivE3JBtc4bxtIk1kR9WdR8kib6C2M2Y005WdFby4noRvwV
         RhteVqY25JgIGFU9Pim7i/uXKmD1l2oQ+/L3e4RkbcgBcPCdp87H4rGfF9fC2Kjmov8e
         mN7c0LODhH29VSqZD7pvkXzaurU9wRwWTwe7Bu8uqBxMp1GeVHSts0W0Tv2k3tYyF5ZS
         oDTw==
X-Gm-Message-State: AOJu0YyElVv+3VZt1ntiPpfwZ8J8kQeSl2PyETEJXkfg9L2QepKcKmLs
	XFadpy/0aGjqaV6YQz0w9mbNeTvyY+jLK5WFYOVwy4NgkjQ6XpV+kxEYV0r4ImjNBPk=
X-Gm-Gg: ASbGncvaYe5c2CGCt2qPdZFwzPe7+7yb1dtdd1chCjUli2IuyV9DnxxEaHaGy3a42k7
	jDd3OORjDYZElCRH0tBQUtXdm9bntw/SWI3AePAQomkIsn9peLDUsAKyoKiQdzbTbyCditnxmkZ
	fFJvZg8On4L9YJL4wMFnFoROy6pK02a0AUSFHyuAzXDsgm1ixt/fUOhcK1PlQMiN8xRy2uMqAL7
	MtkJXV4aC3fEmw8Ty0vmV/8jkTvPl/peKmihoXogAh4mOJB7P45FB3lrEPb0tP6XAatEQbUaJwc
	pcYrtVZR/h14KZVILv2fefncCOXEvM25ExnyTUbgltgVRcRsO4MJrw2SzpasfxtihCWbZsZoyU4
	slADL6xwMGXUsKTPc3a7cbflBD/QQ
X-Google-Smtp-Source: AGHT+IHts0eteY4PlR1SQN/PyYMswWNwfgjzZcpYKjCK25ZDntVHx3kCGx8YLO7OAaDj+8ppdM5vmg==
X-Received: by 2002:a05:600c:548d:b0:442:f44f:678 with SMTP id 5b1f17b1804b1-442ff03c63emr240517275e9.31.1747898591652;
        Thu, 22 May 2025 00:23:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5? ([2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3dd94f1sm97174725e9.35.2025.05.22.00.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 00:23:11 -0700 (PDT)
Message-ID: <fa65b2bf-b76e-428a-8110-325a6191752e@linaro.org>
Date: Thu, 22 May 2025 09:23:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/5] phy: qcom: apq8064-sata: extract UNI PLL register
 defines
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-phy@lists.infradead.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com>
 <20250520-fd-hdmi-phy-v4-2-fcbaa652ad75@oss.qualcomm.com>
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
In-Reply-To: <20250520-fd-hdmi-phy-v4-2-fcbaa652ad75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 22:44, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> The "uni" PLL is shared between several PHYS: APQ8064's SATA,
> MSM8974/APQ8084 HDMI, MSM8916 DSI, MSM8974/APQ8084 DSI.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-apq8064-sata.c | 23 +-------------------
>   drivers/phy/qualcomm/phy-qcom-uniphy.h       | 32 ++++++++++++++++++++++++++++
>   2 files changed, 33 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
> index cae290a6e19fcb7fd68fe6cd0229b9b00d47131c..dd9929429f9a0e2f265180e8d3f390451d91adde 100644
> --- a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
> +++ b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
> @@ -15,28 +15,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/phy/phy.h>
>   
> -/* PHY registers */
> -#define UNIPHY_PLL_REFCLK_CFG		0x000
> -#define UNIPHY_PLL_PWRGEN_CFG		0x014
> -#define UNIPHY_PLL_GLB_CFG		0x020
> -#define UNIPHY_PLL_SDM_CFG0		0x038
> -#define UNIPHY_PLL_SDM_CFG1		0x03C
> -#define UNIPHY_PLL_SDM_CFG2		0x040
> -#define UNIPHY_PLL_SDM_CFG3		0x044
> -#define UNIPHY_PLL_SDM_CFG4		0x048
> -#define UNIPHY_PLL_SSC_CFG0		0x04C
> -#define UNIPHY_PLL_SSC_CFG1		0x050
> -#define UNIPHY_PLL_SSC_CFG2		0x054
> -#define UNIPHY_PLL_SSC_CFG3		0x058
> -#define UNIPHY_PLL_LKDET_CFG0		0x05C
> -#define UNIPHY_PLL_LKDET_CFG1		0x060
> -#define UNIPHY_PLL_LKDET_CFG2		0x064
> -#define UNIPHY_PLL_CAL_CFG0		0x06C
> -#define UNIPHY_PLL_CAL_CFG8		0x08C
> -#define UNIPHY_PLL_CAL_CFG9		0x090
> -#define UNIPHY_PLL_CAL_CFG10		0x094
> -#define UNIPHY_PLL_CAL_CFG11		0x098
> -#define UNIPHY_PLL_STATUS		0x0C0
> +#include "phy-qcom-uniphy.h"
>   
>   #define SATA_PHY_SER_CTRL		0x100
>   #define SATA_PHY_TX_DRIV_CTRL0		0x104
> diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy.h b/drivers/phy/qualcomm/phy-qcom-uniphy.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..e5b79a4dc270f25d8979f51bf4acd6c76998032e
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-uniphy.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2014, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef PHY_QCOM_UNIPHY_H
> +#define PHY_QCOM_UNIPHY_H
> +
> +/* PHY registers */
> +#define UNIPHY_PLL_REFCLK_CFG		0x000
> +#define UNIPHY_PLL_PWRGEN_CFG		0x014
> +#define UNIPHY_PLL_GLB_CFG		0x020
> +#define UNIPHY_PLL_SDM_CFG0		0x038
> +#define UNIPHY_PLL_SDM_CFG1		0x03c
> +#define UNIPHY_PLL_SDM_CFG2		0x040
> +#define UNIPHY_PLL_SDM_CFG3		0x044
> +#define UNIPHY_PLL_SDM_CFG4		0x048
> +#define UNIPHY_PLL_SSC_CFG0		0x04c
> +#define UNIPHY_PLL_SSC_CFG1		0x050
> +#define UNIPHY_PLL_SSC_CFG2		0x054
> +#define UNIPHY_PLL_SSC_CFG3		0x058
> +#define UNIPHY_PLL_LKDET_CFG0		0x05c
> +#define UNIPHY_PLL_LKDET_CFG1		0x060
> +#define UNIPHY_PLL_LKDET_CFG2		0x064
> +#define UNIPHY_PLL_CAL_CFG0		0x06c
> +#define UNIPHY_PLL_CAL_CFG8		0x08c
> +#define UNIPHY_PLL_CAL_CFG9		0x090
> +#define UNIPHY_PLL_CAL_CFG10		0x094
> +#define UNIPHY_PLL_CAL_CFG11		0x098
> +#define UNIPHY_PLL_STATUS		0x0c0
> +
> +#endif
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
