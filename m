Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6259818D65E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705084; cv=none; b=S7Vk0lSTLLkGv1fzbEu4i3ERcJlicjOeB+Jf1Hs//yJQ9oWMiAi9tKfU9WhAt6DwxMLy6amtaZa3nfiCHy/bjP9PRNKtClHgEFDnX/uZ6I3rdQrImdhuTQnCfkQP1mzjcxZbePFEXOJfVT8x/Vp4vj/LGEElympLIH4pfZaOxUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705084; c=relaxed/simple;
	bh=aNw1qEcSdgkM/iAxlZgi9SL+WfRPwqneqwPkmwf/s5Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PFQXLQC9uP4+SSEZOQmeS7Mj3lkmwhJ4epmJnhbk4cH9t80h+Ia7y7nKHgt62B2+NTeSUmM8qK63SJWo/Tres72aDDwdbobbxldnodiDLpQWKDMe2CXVxAUqR8mTQ1SYtmtp+jDnGPfhajRnpJViQ4xBIqqGMz6YznxLLl8o52w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G5XirDri; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G5XirDri"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3995ff6b066so2812046f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705080; x=1745309880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9R0bq6Xay7hUWOWZTLdriMvdW3Bm293BXWhekm88cU=;
        b=G5XirDriqb4rlvnHDChsELtPljCDb08HtHrlm5yQvMhQZ2+lxdvk2l3DMB9ot8R0Rl
         iJ4++VSn3i7KMvo8LjxMXoH8uKEI2Rx1khLN3pmYOH+9wMLiLTzvZ0J1RehF/KcT7A95
         Y4tB5sgzKdGInVqtqFeeF6pode0My07DaeRWnqc7TtjcZzxYHf7G7qs5Ap1hOzU31igC
         F6NRUK93grHHFBN6S4ssI7XpRl6wAazUBe63NeT+zC8Y2TPS/Xbaaq8DN2fD4uKyLRG9
         SsxcyWpradDdf4cEjrI/f+kC8wJsBW+FoRd4d05U0yLG1pM1uUmiF9k863ISYbvSvCkc
         da5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705080; x=1745309880;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S9R0bq6Xay7hUWOWZTLdriMvdW3Bm293BXWhekm88cU=;
        b=b65XO/fdrxmNF14r9AgHnmPI9A84kW+L8KxTeC28skVlYnKKQ8xyOB7tZdbbPWTREb
         H9pb6dSc4ysKtUtiinlGYJDz3phmHRAm3uhhDxpHq1HlLbwIE5Uzhmgy5GDDPkmWoaqy
         CX13Zx0b/3SQH3Mcv4peizi16pUifpFemXH/3lSOAQ+K0l80+/HVeYffTqVLkTJIOlTP
         tTB+RFyk7TNutV1W2yHlB39LIVtxBhRXQ/JZ/KCa7iid+lPeFJMcn/eIB60+UAu0Zuyx
         clo2af4qzvuFxTQSwnhfl82ZcZxhkAlepu1cs/zbZlcyPm7SSjk4EdetFoq2egHqH9wZ
         Cw5A==
X-Forwarded-Encrypted: i=1; AJvYcCX0SaXhyVTzPvBEgoVdARl7f9dJnH3tFXOph1U5xjLumeAoh97h84P58NO1a1KcQi8c0xrGLqQu00woBXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVGD32Qwn+xD2/FcEo5d8VXggOjHltuaN62mwQ++RtGD28L3Tm
	Njjq95il6z8FU/J03/QMQG/B33TeEqVjQBSBxHXirfEnMnePTxnHGgFYHOmTFblQsHE2gia1Hgx
	6
X-Gm-Gg: ASbGncuU17y1hhin/CkRTMDTAQXx6MvCqFU22kAERzE3QNEz19BLzMXfzZvJ7JBRwmP
	OU6PTuiGkbrWS5H81x+aS4Mrk4qDbGqaAxmsfbB67nYsooOMlgfy870DgrSgyIzm0spRzNGT5N8
	vI+Ms+52y/Hb0gBfPnvccrCgr8NJj12PFaRiHbH3imAp4o3/b93W5aM6RGcIyH6LTpXnb8SIqU3
	UrYH/dUpxq1LCdjQgtJvREt9RsdjnK0sF6sarjWlIIMYZKMJrmSg3WKlY+812FZSaRxavSqZWUU
	alT8L/9a1hSwH/AoxeFqF3H2SyGbGXahDP7qvroBS4na8QlmHMVru83UAWnLRzm4ddqVuOibKY2
	FUe9rkhS7VnmRSrPGsCPzLFZb3Ke7
X-Google-Smtp-Source: AGHT+IGlH94Rv73ba2D5G22X7lVH9eT2jkQiPunHZHRgDARM4xIe1+hQwGc/DsRp941ZCmPOdb90Sg==
X-Received: by 2002:a5d:5c84:0:b0:39c:13fd:ea9c with SMTP id ffacd0b85a97d-39eaaec7b70mr10629699f8f.47.1744705079656;
        Tue, 15 Apr 2025 01:17:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ac71:de35:af4b:b8fb? ([2a01:e0a:3d9:2080:ac71:de35:af4b:b8fb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963c15sm13754713f8f.13.2025.04.15.01.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 01:17:59 -0700 (PDT)
Message-ID: <d80e2553-e5b9-4b79-b96e-f7092ac8d707@linaro.org>
Date: Tue, 15 Apr 2025 10:17:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] interconnect: qcom: sm8650: enable QoS configuration
To: Georgi Djakov <djakov@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250407-topic-sm8650-upstream-icc-qos-v1-1-93b33f99a455@linaro.org>
 <b9f90b0c-cae5-4dc3-817a-183b49f947b9@kernel.org>
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
In-Reply-To: <b9f90b0c-cae5-4dc3-817a-183b49f947b9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/04/2025 19:08, Georgi Djakov wrote:
> On 7.04.25 18:16, Neil Armstrong wrote:
>> Enable QoS configuration for master ports with predefined values
>> for priority and urgency forwarding.
>>
> 
> Hi Neil,
> 
> Thanks for the patch! It looks fine, but i noticed that there should be also
> QoS configuration for the qnm_apss_noc node, but it's missing from the driver.
> Do you know if skipping it was intentional?

The qnm_apss_noc node is not present in the upstream driver, I wanted to add it
in a second time. Or I can do it first as you prefer

Neil

> 
> Thanks,
> Georgi
> 
> 
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/interconnect/qcom/sm8650.c | 327 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 327 insertions(+)
>>
> 

