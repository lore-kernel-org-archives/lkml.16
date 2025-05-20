Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D0510E4
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727763; cv=none; b=iNl+rygSJkU3fXfJVTxaYdfhVB4txOPt9LY7kqr1f8Pmj8VOzCseTzyalBP64B5NRyf6twR81l1X+DPJCpUGwltzY16WrVOkvYzfN/Ma5Zm1Yn98o0qNvtkn1DUsb5eli9GoyBxqk+oBLGlKuheu6tal/V8k2rgKhChBozu8wlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727763; c=relaxed/simple;
	bh=JxQcce5CzgGrxUke5MFD46a+ILFVw1NvhQrp7zT+cm8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XzrLCAms+uAy2F6vKEy+GrHoA1e/RmHwKcwHjF6JSOGj7WHZglyQMGf9yAfCC3SDChF39GGf8NoYTuyUoEytuXWDGjqq3UoUYc5gBH9QuU4kXav7Z9APC4EPKu1UwJ5WrDh+0/i5yLRCCfLg7Mm6+Iw25ndQVRTo8vDsz37FCkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YeZ7uwuQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YeZ7uwuQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-443a787bd14so21636525e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 00:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747727760; x=1748332560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0I2wRodR62pAK0bg8x/QhipVuGL+ClzHWobDCBX3tOg=;
        b=YeZ7uwuQDvnMBFh2DtAvLBmcaGQxnnexAw7EyFJeq4WwDwzqb7tAdwnh1JZE6B03J+
         8GIbsixbcfTvuHrFW43RRlY/j3kfceVGcaprkRTu0enOfsPBdHkG7Ww3WWTDjyZXzk+2
         8P+ioBiy0PIOuWXm27yjb9+Tm4yiSD+5PF+SuQRLKcZ1v6r23G7o9Pq2jViObIRt/y5A
         8s+7ZpfF7IxEWLcXRe+TDMvCyiwz6c5j86OLjRvz1/+udV16OgB9rqa/3V7ymH9MIWdX
         fVigNri/F46tN+cZRXxUyKRYnWgpq55lpr7hml9h5C7MkZdUM/e9G62QESMGzQYzAKUp
         1yAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747727760; x=1748332560;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0I2wRodR62pAK0bg8x/QhipVuGL+ClzHWobDCBX3tOg=;
        b=FYuthCdE9UrmwAakVdK0c4TX78pVSPMM0R3l9MEr//U0vbim3+cG6l37csTLBYqwJ9
         zX37BS+FR2Y1I+aAb+Y5bVeO6G8+19htG0YmXdlw9zxTdBz8nutuIkxL+rJSDGAFRG7G
         rmNfDu1aubBYTXV8cALx2ZBF0f4uWv48YXKRj79A37qcRKo4xts4CiWY2TZU1IXMiBFs
         Jda/wOoTCl/ePqVKwSMu4s4BRacmkfxCle1Ie9x7lZdSDqdsO+6e7DjCMgqa3EFPSAn2
         BgaD7WBhAY3MysowkC4P9u0LKfPP7JoZJ60suv2espSRRZId9yHFaH45ezVm78NLhlJQ
         q7Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVj77x1LMnsxmFgUY51KyEGF/Utjc3X3Z5KEh/SNvys6GrTUUp5won97gKFhwQ0es7k52u6F1nF0UCeGjg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaaB/Z29hlRFDzyeGUQgqWRsdoNfAKv5ZSg8gliizAscNid1FW
	lj7bXZqKtxtqIF3MGbrjUqfaBXv/KfS2y/LGdMf772SM3OsplOlVHZB6HJDyuAG8LZA=
X-Gm-Gg: ASbGncuGDnZ9CydbLZ9Xv2mlxfR3eEiO9c7o79sR6nMhSk0DJr76DXBtyZ8nzccIWyA
	T24+Fqnna/61MpeOpy1Dl+AXr8vHZD5C1n997mEO9JB3jgKeGe60GX+qjKN3mawLE9TZjbnuF5H
	IQ0H8YjYal7Z8Xk/V34KVLK1VDcP4UIvPDID+f2XOW2jgrZXi42R4EIZ5o+6Wy8NV4RYIhRHYit
	dYumWS0iVjkaxdrOg4pcBzWVFBfFGz1cxRrIdRlwE/s42SzA7D/HUP6ZmNBzBoxlSGanIvBZq7t
	kJqk6/htvJnD2qRMqff9tNDc8dyqehgzgCRwdPuFZXozyVx+DDupZw54pkE6sOh1LbB6lxeU3mt
	s4e0ch6RXFaA/foCbrVXL1+AqhfnP
X-Google-Smtp-Source: AGHT+IG+UutCJ5uoL03Fe0Oog6nZwJVbFVfmiiIGSvVYk/3U9fDVypCX1g+HKEERIxuujpy61L0fDg==
X-Received: by 2002:a05:600c:46c7:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-442fd93d0a1mr154292465e9.3.1747727759945;
        Tue, 20 May 2025 00:55:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f0556bsm20284135e9.12.2025.05.20.00.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:55:59 -0700 (PDT)
Message-ID: <c9ac6caa-2f8c-4b1f-b993-e8f402350df7@linaro.org>
Date: Tue, 20 May 2025 09:55:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 11/30] drm/msm/dpu: get rid of
 DPU_CTL_DSPP_SUB_BLOCK_FLUSH
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-11-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-11-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Continue migration to the MDSS-revision based checks and replace
> DPU_CTL_DSPP_SUB_BLOCK_FLUSH feature bit with the core_major_ver >= 7
> check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
>   3 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 6fed2cce082c476c1f7f8ee683f2a6f3eeaa5231..19a859e2a1f80c2321789af4ec7c5e299f0fb873 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -105,8 +105,7 @@
>   	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
>   
>   #define CTL_SC7280_MASK \
> -	(BIT(DPU_CTL_VM_CFG) | \
> -	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
> +	(BIT(DPU_CTL_VM_CFG))
>   
>   #define INTF_SC7180_MASK \
>   	(BIT(DPU_INTF_INPUT_CTRL) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 82f04de6300eca7d05ece3ac880c26f3a56505b9..1e5fc1d5873975189a1759212b8a6c6078de22f9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -133,13 +133,11 @@ enum {
>    * CTL sub-blocks
>    * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
>    * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
> - * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
>    * @DPU_CTL_MAX
>    */
>   enum {
>   	DPU_CTL_SPLIT_DISPLAY = 0x1,
>   	DPU_CTL_VM_CFG,
> -	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
>   	DPU_CTL_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 772df53bfc4fcc2ff976f66ef7339be1ae3da8f4..edb82c81b0a449b1a7273fc258961b9447be8d9d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -804,7 +804,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
>   	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
>   	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
>   	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
> -	if (c->caps->features & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
> +	if (mdss_ver->core_major_ver >= 7)
>   		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
>   	else
>   		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
