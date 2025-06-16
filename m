Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E171DA53
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059028; cv=none; b=sxkQDVQYfNvmcn81HGvZUkQ74XfKO9svrH1e7HVCTpS7UqJmFFWMuhfQIFZQlSf9vbIYQnfVVTcNFMi7uKxMTIfuodMDn98CmLuGfsH9MkI8Fok4okhyrLL8rRb/yEB2cFB3S2aTarRr/oVElC4QoVYnenW4wGFDCaAMPrqRvjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059028; c=relaxed/simple;
	bh=pORw2nHLabEfQe1PMaZrWgMUSxiudeH7gfLb/k2mU70=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=F/evFOonrItVHYLzow8ByqHEDXzbsHogbrFn8H6mSA6larfSWag2k4SQMbJO7VkKDjXUA+E3W4jE6o7lZZyGXzbPom93w+RqNX4/LJ9BikyiBw2Sj1tOUmKaHgtcZuteKb+DA3EXZI1P8rRAsEdfOuz/E8ViTJbCOdLW+q+tQRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rqBcBmIa; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rqBcBmIa"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a361b8a664so4227705f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750059025; x=1750663825; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4g4ohSAiRV+zTDawEcZfrTruxPOBshWISquGhuBGvo=;
        b=rqBcBmIaqC+CN0rkEdH1xVMZY51w2K+NBuo4a6cfG09A5vg5j1z0OkOiZO44dX3Jqw
         58bYbv1vST53GF2sKz+Ty10gHWYHAih1au21yjK8ff1888hHyfcfxfzHiNOMpW0oTUri
         l80Nzf/c+kk6jmwcaxB45nNeckDqjw0dpRvONSgsqLHestXdMN5CG+KY/MsJ29wOvCuc
         vR64JXiN0Pd91ZSOUyhCghQLlsmBkVeSW3l5gbqnF2HRKPy96UMYbCLPD4MDOUGV55tV
         cvrfc6Ah725VX3g566rlE071q1bRvRoPtfz9GjUtI5WMzIIq7a731+j3mMZISZ9pFPze
         RFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059025; x=1750663825;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u4g4ohSAiRV+zTDawEcZfrTruxPOBshWISquGhuBGvo=;
        b=QJ9lurKDz6P+MNxE2IciXJMHZ/8EPyhmkL1EBLWicu45YPX5IUhjKLY3RweReaJqk8
         Y6jmSV/Wlb9KJFEuCXmVkmB4eaHdNg+5Jcj79mE/kBAybstmWZ/B3E4e8terq7YcAAK6
         X5ZhamhMWuKfwC3X39jVTTagwhjkBwUX5WW4AUUN2gIJEA6alObiDycWxT1Mh//dx4dq
         F404KrKeSd1UWF4A/EJUSodkSszPiuPV2ars2ClSDDWxOhzc8hm4/42KTBFyLEKWxFmD
         xRmuRXKtxi5ItfN6UQKLwBZsLXP3yUiJLOAsp+aOPUi7x8nxKCN8pKA53jtShdUcSl2C
         9YBw==
X-Forwarded-Encrypted: i=1; AJvYcCV7BFDS5XlF4Ea+SuyBiGP4DkUBRPAeqHiDZx5dUc8LRBZ3htyPxw8uLesGX6xy9fGWCAgumItyavlzeIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLwqOCXmcJTmryJKB4lP4MPdyXzg0TsvXTaBvOdVLarIVo24H6
	Y1FF9GzCt3bDDNdy0jxCWeqNgiwX2fLxCy3M9pcuu/qd5ZsGC5OCsANw8J9QHEDz+W8=
X-Gm-Gg: ASbGncsv8sEsem5ee65FK9gwHGigdM/VOn2hUZAvX3szjXNMAkKL8rcaP7SiRF9X2ft
	de9fkTYKAfas1lNBk2V2oNeaJZ+mP+NcIr+QdBDytUwpxlpZTFkh4zwLA9raY+UCv2uehNURHVz
	5gJY+HDBWXfvjhNBjbgpstDYC4x761nH006lln+UwMhliq40lVZp67fnu81R/gPkV8O9XFfJESl
	g2bPgylM3zofNsb3C2saVXw6GfOlNy7OY2F4Cwwezg/3GXUid1Bfj4HKe+OK8QWobXR3QVUo127
	R1De1uv9PmVkYjXDgGSMf+so2zm6ocO9dBjW9cZbudkr+niV7TF3TuLfgMAmw3bKEjdK2o2SyP+
	JeBGmp71x6M41vWhliJRD08tS/YpMFSe6dad2
X-Google-Smtp-Source: AGHT+IEwjEpuiWh57LayRsqK5pKmU9wpWm982Uem9pS1nRTdbkNJ7pz2QlqFMoGeW71phckBOrBYIQ==
X-Received: by 2002:a05:6000:430c:b0:3a4:f787:9b58 with SMTP id ffacd0b85a97d-3a572e9c412mr7428081f8f.58.1750059024717;
        Mon, 16 Jun 2025 00:30:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:6c7:97de:65a8:488a? ([2a01:e0a:3d9:2080:6c7:97de:65a8:488a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b48564sm10089367f8f.82.2025.06.16.00.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 00:30:24 -0700 (PDT)
Message-ID: <4f703259-c27f-403e-8ebf-2358a3b90b6d@linaro.org>
Date: Mon, 16 Jun 2025 09:30:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] phy: qcom: qmp-combo: Add missing PLL (VCO) configuration
 on SM8750
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Melody Olvera <melody.olvera@oss.qualcomm.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250616062541.7167-2-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250616062541.7167-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/06/2025 08:25, Krzysztof Kozlowski wrote:
> Add missing DP PHY status and VCO clock configuration registers to fix
> configuring the VCO rate on SM8750.  Without proper VCO rate setting, it
> works on after-reset half of rate which is not enough for DP over USB to
> work as seen on logs:
> 
>    [drm:msm_dp_ctrl_link_train_1_2] *ERROR* max v_level reached
>    [drm:msm_dp_ctrl_link_train_1_2] *ERROR* link training #1 on phy 0 failed. ret=-11
> 
> Fixes: c4364048baf4 ("phy: qcom: qmp-combo: Add new PHY sequences for SM8750")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 8b9710a9654a..f07d097b129f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -228,6 +228,9 @@ static const unsigned int qmp_v8_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
>   	[QPHY_COM_CMN_STATUS]		= QSERDES_V8_COM_CMN_STATUS,
>   	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN,
>   
> +	[QPHY_DP_PHY_STATUS]		= QSERDES_V6_DP_PHY_STATUS,
> +	[QPHY_DP_PHY_VCO_DIV]		= QSERDES_V6_DP_PHY_VCO_DIV,
> +
>   	[QPHY_TX_TX_POL_INV]		= QSERDES_V8_TX_TX_POL_INV,
>   	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V8_TX_TX_DRV_LVL,
>   	[QPHY_TX_TX_EMP_POST1_LVL]	= QSERDES_V8_TX_TX_EMP_POST1_LVL,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
