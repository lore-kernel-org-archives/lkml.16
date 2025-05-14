Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E54C27C877
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747240809; cv=none; b=OPEhRMQAEqoIMNhd87mx06zkrydhqblZVFqUaBCF09DOBhxIOccHkJDbHNbwC9+++KtbC36iXUi75nKjLmnHIBPOuEULKNbnTWAVuU/PPJitI2h8rrxoTgyshUvZlBfEjMNNsJtDtKhG+NKjR/rjOZ36qx37GEj1yDdX7GEsGrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747240809; c=relaxed/simple;
	bh=qsRC4rtpzeZl/HCQxJZ/jiHUAZWLUGs7TC++Y1ifxbs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HR0Jgu01f+0l+zqAkjUUU/uMmwpEemeeaJ0Ty50qyYZh/dGYEX45KBuzXg3pLCrbywDrzZNJMT70vz3u5FyZRUtfup0i2XS3PsrlHaRlxZD01i6O/CTPpqmMUACEPv2dYfPgVQRsmT8Scjq3etmb0sHu+5FBlgbfNqrfAWmebQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MNymLfdW; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MNymLfdW"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a0ebf39427so5898643f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747240806; x=1747845606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z8WZ1b2439ywq9jfEuQpDBO1suID2dCRujieJMdn7yE=;
        b=MNymLfdWywwCMD3mwZeiObXjVQ3vpq9Bh0G9RTErj3NGj5K4LQke9kKt8huzcg4/ws
         AOp9sKusNTzGnkfBzL8Jd3bGMftfuT1LtcFHDrgvB2FlEsPIpw0UmXPuYShlzcJ5IyeL
         u5JN+3wE2PPuReT5dUATNGZiD+bu2E48zXWaSqWYo6pDxMm53WIB4/5UETfYrJ3EfL3L
         SO2V3yDmc8nnlYesFtqv2f+ZlXRRf8JFMGKsN48OXJqdUfafBOdivq7g7t1rtZeJYHZG
         TF6hEjqT4k4d9TDJ89aq9qdr+giXtmK0vVeW8L2Ng8qGDs+AnV8BeFjdOmEIh/QplHqh
         kVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747240806; x=1747845606;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z8WZ1b2439ywq9jfEuQpDBO1suID2dCRujieJMdn7yE=;
        b=aicqAiIGkAwISPRDN9xCopiHwv6HsKNTW84wL0oeOunfHgt+gr6PHw0mSciXATsNec
         D3BU6DgWM0RdWNqM2pMH3/x5/x438/oYfPiFkXFC0PfAq6M4lIPcIcE6m/zt+CDv6v5I
         Hul5+Bbjf5bJwuKCKSeTzFPdLj4/k/sEKdj4CdxMbuBUbJyyIhA2vkADR8W84uux++Bo
         qWsGYM08J8CBkTt93vx3STplrFhWMJaNWfAKAR9S8VxOwEy0hy2RSWysYsYWyS/ZiaXj
         UbiAJgmAHI2AiRxpiYJ4iWr/r7Ch8I3fZSmco3BwsZ8+j5VuRKZpavylrxY7od4Trqai
         DNcw==
X-Gm-Message-State: AOJu0Yx51cCtGpf0pCSRWBgcd5RGZldMU6tZV+I15Sy6q4O/fq/3hAMU
	xcjc3yDbgWCuxHAqLOasQQG1kSVavyrFceZiWqz7NSxIJmgYobk6o0IwPAXtWys=
X-Gm-Gg: ASbGncuxcEho3o6g+nontConvsC6HgowRay9z9IMmvLU988SJfRh/1/mLSTG9AsaEC9
	XOauoxfSM+2i2Yd7ktPZ7bA+BAaQHG0raqFdAJRQr9Ku+0NPpN7dS2wFwVNqg7Lo1xJc8EVw66M
	T59eGDtON83uUk7TS4LI6rUwDk8cqV6oxTZolAhnp9xkB9KDNpA16bCbga5U4hMESTKNOMTxs84
	7l19uyyD6FBhmprpd6vOxWys9GZH3b6IaIKqIV5Ey2KSWgLCQH4HYJx7tG+2RNe7CMOuZUw7ub3
	LXHuPAXPYmTkG1n/z31SrBnsSxKkJFlmYlkSGhzQg2LWSvENQREEQWEhtTo6Wd8qfypLGqtMz74
	WQuhWfeSBxV3Er0Pw+Hic+G0=
X-Google-Smtp-Source: AGHT+IEPbAF4Q3bMuaTmqRM9qQbhF4Gz5x0v56o5JMbzAafCu6BVNra2bXvw9299wzIEP0EieOV7oA==
X-Received: by 2002:a05:6000:2088:b0:3a1:f5c6:2bd with SMTP id ffacd0b85a97d-3a3496c36d5mr3666848f8f.31.1747240805928;
        Wed, 14 May 2025 09:40:05 -0700 (PDT)
Received: from [10.61.1.139] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2ce36sm20542941f8f.71.2025.05.14.09.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 09:40:05 -0700 (PDT)
Message-ID: <43aac8b0-1fec-4b2a-8046-c26f96ca532e@linaro.org>
Date: Wed, 14 May 2025 18:40:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] phy: qcom: qmp-pcie: Update PHY settings for
 SA8775P
To: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
 quic_nayiluri@quicinc.com, quic_ramkri@quicinc.com,
 quic_nitegupt@quicinc.com, Mrinmay Sarkar <quic_msarkar@quicinc.com>
References: <20250514-update_phy-v2-0-d4f319221474@quicinc.com>
 <20250514-update_phy-v2-1-d4f319221474@quicinc.com>
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
In-Reply-To: <20250514-update_phy-v2-1-d4f319221474@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/05/2025 13:37, Mrinmay Sarkar wrote:
> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> 
> Make changes to update the PHY settings to align with the latest
> PCIe PHY Hardware Programming Guide for both PCIe controllers
> on the SA8775P platform.
> 
> Add the ln_shrd region for SA8775P, incorporating new register
> writes as specified in the updated Hardware Programming Guide.
> 
> Update pcs table for QCS8300, since both QCS8300 and SA8775P are
> closely related and share same pcs settings.
> 
> Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 89 ++++++++++++----------
>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h |  2 +
>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h      |  4 +
>   .../phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v5.h | 11 +++
>   drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
>   5 files changed, 66 insertions(+), 41 deletions(-

I think the subject should be "Update PHY settings for QCS8300 & SA8775P".

As my comment on patch 2, what's the relationship ? does those PHY settings fix
the "Gen4 stability issues" or are needed for the Gen4 equalization ?

Thanks,
Neil
