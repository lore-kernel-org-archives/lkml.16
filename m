Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2F02206A6
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750089118; cv=none; b=m4cX3/liBjXlfa3Q+5RW4N/2Wv4AJffCnkvIuv7EnBWjCjBFOQHfAH0Yco/RBi3U/93yXf98bk7RoEEE8FasylA/QXmYCTRw9T8FX1joijQKzCijPny8amtV8TnzaUCjztltipzRiBnZveXWrGCfc7QP0SAkifMqbBBXLFfB8Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750089118; c=relaxed/simple;
	bh=PV+hjbr1UcOA60DQPHguMD3wEZU4n+jwNG7/rCy7Fvw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gMxPr1STUs9sliEOWKk9kJxPBl45d5AGSXmKo+SYEgKdf89fXNdBbKtfRnz0FTZIvDdlUsfSr61TGet+KlN/+QWEuzGCU95z5tw2Pm/LOaPHJ5RqI2fpIfugQ6vLu5/WmBnV10LcOmmAb7vJtxoU1RtUgZtlYCKiqRuo/YP4e/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qP9peBEB; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qP9peBEB"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so4057973f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750089114; x=1750693914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3aIxTq8eP0LU6Js9V3eNq8kd450CZ0HrFoXlpXX77I=;
        b=qP9peBEBMe1KGRcqA2zIdj2HsKSyRbSk1mQcq3XOsTitKUjwVzCxGmucxHdWzHgdTI
         p7/dFsvy1ra2khZuSe7SJrEqxKDiU4/h7spvC3cZJKWqQir8XLr+/ywX+8INSPxvnkvy
         rzg4ezYwFahht/d1la+m16dI8mUcKLZMXBOvKFuqPvXNltFNvZreUTY+8EKuFs38Yodw
         /kKdddJWIUmhFEuiv0sfvIbivbKvUsTh/DnpjPUxquFpuGDKp7sl6OdQH0AiyPXw0v3V
         HbQRhoQwUcZLbcsyP6FSFf/78d+bNxWAggB9XCUy96/lts+UGCKDEC9NwbtZh5RFxYYQ
         zD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750089114; x=1750693914;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B3aIxTq8eP0LU6Js9V3eNq8kd450CZ0HrFoXlpXX77I=;
        b=U7IC8Et8HH7JH2oURLx+uc+Y6y6nMFRaJFqzz79Z47KKEsqtrsDrpE39D+3RasY4nm
         DdHtvwk27C7lgHW4qddb7wWg33GVNrp576tNmI4av0JmWtD1EAJgVZnFDV6ldsscGHI0
         HJ9/NBaIpv3fDWf/Lo4GQ2P7ZoC4v0+NxcawkDCWIJ2IlBKhdMfvR7hickKV9Y2N6Jts
         iCmnEsos9dEoD4hCrxLoKSDgnJ6pU3MwMUCXG8Jbtc1neMd4nd1G+jFwRw9wZVSoNuL1
         wUbhlznEAdg7Jy9h0SsdNLCyDSTbJ74PRpZxC/bbVXsBs6e+eE9T4rmycG9yLt2qFuRG
         o2xA==
X-Forwarded-Encrypted: i=1; AJvYcCUwyw9ukg9vkLBr/VuJphQra94mvffRCtHOPZh7VD1nnJTJjZ8L1yo6IaD5P4mPOXPVJQRHs8Wz2qyqrp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjaBPtKmWm9Hqel3dYDzcJfiPPrOKvz8OYu1BHVVFVVMWAnPl0
	bkLzKcb4x981tUJ1J7atJSJbAlnMrwV+Q4iEGq7hwLG0VSvKw68Ob6OZuTHMxQbbjvA=
X-Gm-Gg: ASbGncvBGuf7S31BYykQlI8A0P4i56H2BREwNsrwiubPahSrZpG00vpMOBW8NsGJgdx
	IZNssL+gCj//Pz9lY9XGMFuXPYlsshjebGheq60cR74kgziU2O+uca3VGQkFgX/JAzNaDLncHYq
	BE2V/1iFROsEP7qoJRF3TAwYeFd9TiT0l1VLAx9pCt9kLRk6vRHnxWJlqq95OVCtO7BMgYA6vXK
	0KNEcdN/vAVeLkwD7SXCKSkQqtaXXIs1/gWdgd13oMcvxD+iVpe6aH+hPIWHpejQ+wWtHyryjG8
	KAXPkOaaT49xiqMsv8aMA3I1zOMMJ5u6lGz6IVp1Vhf02IjjqnGtqTsFk9gNuf78RrSnIBMAtI7
	ZEtxN0/dP8qgX+lGOJosLPmNAC72G5WZwJ+u+
X-Google-Smtp-Source: AGHT+IEj5cUnxUUFo+d8zqbumS2ayHNMbIjK7THuy3PbiLsuMDqskV06eRRHi2zveWUbvuEPOUaqXQ==
X-Received: by 2002:a05:6000:4818:b0:3a5:2e59:833a with SMTP id ffacd0b85a97d-3a57238b9fcmr8023602f8f.1.1750089114107;
        Mon, 16 Jun 2025 08:51:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:6c7:97de:65a8:488a? ([2a01:e0a:3d9:2080:6c7:97de:65a8:488a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e224795sm150088105e9.7.2025.06.16.08.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 08:51:53 -0700 (PDT)
Message-ID: <786e3337-4c14-4281-932e-6a93aac53cf8@linaro.org>
Date: Mon, 16 Jun 2025 17:51:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 00/28] interconnect: qcom: icc-rpmh: use NULL-terminated
 arrays and drop static IDs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250616-rework-icc-v1-0-bc1326294d71@oss.qualcomm.com>
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
In-Reply-To: <20250616-rework-icc-v1-0-bc1326294d71@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/06/2025 02:28, Dmitry Baryshkov wrote:
> Qualcomm interconnect code has been using .num_foo fields together with
> the arrays embedded in the structure, which results in hard-to-notice
> mistakes if .num_foo gets omitted or incorrect.
> 
> Rework RPMh interconnect code to use NULL-terminated arrays for the
> dynamic IDs case (as now all the arrays contain only pointers) and,
> while we are at it, rework all the drivers to use dynamic IDs and drop
> static IDs code.
> 
> This series touches only RPMh interconnect drivers. Corresponding series
> for RPM drivers will follow up shortly.

Can you specify on which base thie patchset applies ?

I tried v6.15, v6.16-rc1, v6.16-rc2, next-20250613 & next-20250616 and they all fail to
apply on patch 5.

Thanks,
Neil

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (28):
>        interconnect: qcom: sc8280xp: specify num_links for qnm_a1noc_cfg
>        interconnect: qcom: sc8180x: specify num_nodes
>        interconnect: qcom: rpmh: make nodes a NULL_terminated array
>        interconnect: qcom: rpmh: make link_nodes a NULL_terminated array
>        interconnect: qcom: sc7280: convert to dynamic IDs
>        interconnect: qcom: sc8180x: convert to dynamic IDs
>        interconnect: qcom: sc8280xp: convert to dynamic IDs
>        interconnect: qcom: sdm845: convert to dynamic IDs
>        interconnect: qcom: sm8250: convert to dynamic IDs
>        interconnect: qcom: x1e80100: convert to dynamic IDs
>        interconnect: qcom: qcs615: convert to dynamic IDs
>        interconnect: qcom: qcs8300: convert to dynamic IDs
>        interconnect: qcom: qdu1000: convert to dynamic IDs
>        interconnect: qcom: sar2130p: convert to dynamic IDs
>        interconnect: qcom: sc7180: convert to dynamic IDs
>        interconnect: qcom: sdm670: convert to dynamic IDs
>        interconnect: qcom: sdx55: convert to dynamic IDs
>        interconnect: qcom: sdx65: convert to dynamic IDs
>        interconnect: qcom: sdx75: convert to dynamic IDs
>        interconnect: qcom: sm6350: convert to dynamic IDs
>        interconnect: qcom: sm7150: convert to dynamic IDs
>        interconnect: qcom: sm8150: convert to dynamic IDs
>        interconnect: qcom: sm8350: convert to dynamic IDs
>        interconnect: qcom: sm8450: convert to dynamic IDs
>        interconnect: qcom: sm8550: convert to dynamic IDs
>        interconnect: qcom: sm8650: convert to dynamic IDs
>        interconnect: qcom: sm8750: convert to dynamic IDs
>        interconnect: qcom: icc-rpmh: drop support for non-dynamic IDS
> 
>   drivers/interconnect/qcom/bcm-voter.c |    4 +-
>   drivers/interconnect/qcom/icc-rpmh.c  |   20 +-
>   drivers/interconnect/qcom/icc-rpmh.h  |   13 +-
>   drivers/interconnect/qcom/qcs615.c    |  713 ++++++++-----------
>   drivers/interconnect/qcom/qcs615.h    |  128 ----
>   drivers/interconnect/qcom/qcs8300.c   |  911 +++++++++++-------------
>   drivers/interconnect/qcom/qcs8300.h   |  177 -----
>   drivers/interconnect/qcom/qdu1000.c   |  470 ++++++------
>   drivers/interconnect/qcom/qdu1000.h   |   95 ---
>   drivers/interconnect/qcom/sa8775p.c   |  493 ++++++-------
>   drivers/interconnect/qcom/sar2130p.c  |  795 ++++++++-------------
>   drivers/interconnect/qcom/sc7180.c    |  892 +++++++++++------------
>   drivers/interconnect/qcom/sc7180.h    |  149 ----
>   drivers/interconnect/qcom/sc7280.c    |  840 ++++++++++------------
>   drivers/interconnect/qcom/sc7280.h    |  154 ----
>   drivers/interconnect/qcom/sc8180x.c   | 1013 +++++++++++++-------------
>   drivers/interconnect/qcom/sc8180x.h   |  179 -----
>   drivers/interconnect/qcom/sc8280xp.c  | 1257 ++++++++++++++++-----------------
>   drivers/interconnect/qcom/sc8280xp.h  |  209 ------
>   drivers/interconnect/qcom/sdm670.c    |  712 +++++++++----------
>   drivers/interconnect/qcom/sdm670.h    |  128 ----
>   drivers/interconnect/qcom/sdm845.c    |  986 ++++++++++++--------------
>   drivers/interconnect/qcom/sdm845.h    |  140 ----
>   drivers/interconnect/qcom/sdx55.c     |  611 ++++++++--------
>   drivers/interconnect/qcom/sdx55.h     |   70 --
>   drivers/interconnect/qcom/sdx65.c     |  577 +++++++--------
>   drivers/interconnect/qcom/sdx65.h     |   65 --
>   drivers/interconnect/qcom/sdx75.c     |  498 ++++++-------
>   drivers/interconnect/qcom/sdx75.h     |   97 ---
>   drivers/interconnect/qcom/sm6350.c    |  838 +++++++++++-----------
>   drivers/interconnect/qcom/sm6350.h    |  139 ----
>   drivers/interconnect/qcom/sm7150.c    |  860 +++++++++++-----------
>   drivers/interconnect/qcom/sm7150.h    |  140 ----
>   drivers/interconnect/qcom/sm8150.c    |  930 ++++++++++++------------
>   drivers/interconnect/qcom/sm8150.h    |  152 ----
>   drivers/interconnect/qcom/sm8250.c    |  977 ++++++++++++-------------
>   drivers/interconnect/qcom/sm8250.h    |  168 -----
>   drivers/interconnect/qcom/sm8350.c    |  901 ++++++++++++-----------
>   drivers/interconnect/qcom/sm8350.h    |  158 -----
>   drivers/interconnect/qcom/sm8450.c    |  823 ++++++++++-----------
>   drivers/interconnect/qcom/sm8450.h    |  169 -----
>   drivers/interconnect/qcom/sm8550.c    |  683 ++++++++----------
>   drivers/interconnect/qcom/sm8550.h    |  138 ----
>   drivers/interconnect/qcom/sm8650.c    |  713 ++++++++-----------
>   drivers/interconnect/qcom/sm8650.h    |  144 ----
>   drivers/interconnect/qcom/sm8750.c    |  779 ++++++++------------
>   drivers/interconnect/qcom/x1e80100.c  |  819 ++++++++++-----------
>   drivers/interconnect/qcom/x1e80100.h  |  192 -----
>   48 files changed, 8655 insertions(+), 13464 deletions(-)
> ---
> base-commit: 410f15dcfe222c06f0d6379adec630061e88dc72
> change-id: 20250613-rework-icc-0d3b7276a798
> 
> Best regards,

