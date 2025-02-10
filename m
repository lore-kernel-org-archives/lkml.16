Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C8D204867
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739201406; cv=none; b=bfk6q0hA5o3n0ffockgInp2JKZLCwTxTZ+kO2lQbp70y4UjTESILbXreP36wf17+59lLcVdEoIaBJU3iuwfr7A8c8KmRar4qywii1yMSo5DQ/H9TI620pppREJILs4ilI27jUul7P+z2QqfjQAQK7RlP6QrCwNptK1rT6D+w0vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739201406; c=relaxed/simple;
	bh=4qPsTyM7S0OrB97J730InqTzIotwhmnwysD77t14frc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GVujcm6MyjoEN3gauVdZo6696hKqt20Xmz5mJs20iS69dU4DeFQADT/2fiW6/U2w1z3cdD/OjxcXjnKR3QdQaO323WCHLz4DmREb6nQu9Y/cMNZfUAXhUuL7tmMBMmzSxFRWO2xOPw3xH2Ehkjzy3I50STWkAtzqq2kB3bALIQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F55MHd23; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F55MHd23"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38dc9f3cc80so1145144f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739201403; x=1739806203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RED244TxH8WfCAyA10V/+W+on+8NQvcPoRPty8P2K8k=;
        b=F55MHd23ei+gCL0kBQ6LUG0nZtzb8FKScJtqPI16z+wfYXkMM7QDfJJvm0xecPRb5f
         sxH+OspSoEZcWD1EakGEuyMLQryuxdr8u4GuL4L1zksAYjC1qr0ezRpnuXYinN+9f4TV
         YfxCR2feipG4dcvxk7xZTR7yMuTMeBA77sZDscq199ePzaRvfVwIwYNQe29cnDbnkpRH
         UGIsj1l51If5TWZgYrkNjVP9ZV/1CJFpu16Nwfa7I6ztVAtFlGhD530Z53/V6mRx9FRq
         Gwh5s0hSP6l7qc/PNs80mbwGLH/lNN8fI5cd+jy28cbLiQA7N5OOHGCe5NK+RnCX9McA
         MTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739201403; x=1739806203;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RED244TxH8WfCAyA10V/+W+on+8NQvcPoRPty8P2K8k=;
        b=NAhKEfllo49DR2VuuRyypRcZlKJmdBcq1TXZESVjr9HE32sgjn7lzdt16TBm2ya2M3
         6v8VsfS6GyrMbi6nxQh2jKTP7t0yDgXrodxKgxezvLD6gPCwkCuKufKqvnhpGTqgCFSl
         XAYea6lN6oPuUZDIQ1WdmNyevQgYKehOqAUKPGM+4tlIPrTIRj9aLqwEM5ksk0I136SH
         HSrMc18FqWL/esur5iuIQOeMKhbiOZ5WG+d1Ay67Vc3QLDykIXpG2+6ocXZ6PfkZueUS
         bLUC4Y3UAQHz/HtWKNeDArYhqL8rd+crN/CwIaD1hbRSkVVMYxQJ+Dd3m5qkVBUjNJZ+
         8viA==
X-Forwarded-Encrypted: i=1; AJvYcCUaw1n5tWwg6cgR4C6e4uza1+camL0Wd+VQ0AmB72TSM8gfCiQhTD6MAl628ksYYNGTb5r0eBK641mO00Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBlBs0R3JOPPguMKt3vxwNPWF54pLlvUMN/d4POY0DHo7dh6Mo
	gqy4ZF0NQ5Qs38q7AGTk4cIxVvSuGpWb76xbKJ+5RWyhYA7rmG8/so0fzieWZN0=
X-Gm-Gg: ASbGncsnbVLUG/8VD1g0WsEHJE1MBEx+2p3jSLPFitIls2YzB1u6UbXSIYNM/VrMxie
	jhfN1bJOpNJkR8WhvMDxZxB9rXAJYc7XaHoZgE+GF+f0qr5BHAnz+5jqTY2WXHx4VO3xSmUSReG
	88Sg4dNF5WQ0Tp6LKxvHzgd8MygP8I4EScNNUvju+kq+rVWaOcPhOV3Q9bVY5fjCDLcs7O606kw
	1tDUXo0aKKVmG1iR5j9l3mVTA+Qy9hxqxg6NzKQqBNc8AQGAxe05oMI04eNXHaPd8ueaavjQQab
	ew03qA4pytBdhIvjlcL0TablwMWDwKPaVgcFqm6ASpTjns8Z08mSYHG3rwyKWEaFWNpO
X-Google-Smtp-Source: AGHT+IEa64AtUhH1mqwnMh7k3QHns8LbS/CkpAaB+2gplp1+gWpRg6+6LndRqVPwwYLHwYzAQZgGWw==
X-Received: by 2002:a05:6000:1acf:b0:38d:d8b2:cf14 with SMTP id ffacd0b85a97d-38dd8b2d3a8mr5501510f8f.30.1739201402693;
        Mon, 10 Feb 2025 07:30:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8235:1ea0:1a75:c4d5? ([2a01:e0a:982:cbb0:8235:1ea0:1a75:c4d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfc8a4asm150018915e9.32.2025.02.10.07.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 07:30:02 -0800 (PST)
Message-ID: <a2fbae9e-d1cc-44a7-86b7-9e15aa0490b1@linaro.org>
Date: Mon, 10 Feb 2025 16:30:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: add PPI interrupt
 partitions for the ARM PMUs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250207-topic-sm8650-pmu-ppi-partition-v1-0-dd3ba17b3eea@linaro.org>
 <20250207-topic-sm8650-pmu-ppi-partition-v1-2-dd3ba17b3eea@linaro.org>
 <ba546075-cfc0-4b17-9129-f99054e2e1ae@oss.qualcomm.com>
 <6aa71142-3b1d-476f-9c78-1207fbbed3f5@linaro.org>
 <bbbd36a1-d67c-404c-b749-eefcf493ed7f@oss.qualcomm.com>
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
In-Reply-To: <bbbd36a1-d67c-404c-b749-eefcf493ed7f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/02/2025 16:23, Konrad Dybcio wrote:
> On 9.02.2025 3:44 PM, Neil Armstrong wrote:
>> On 07/02/2025 21:30, Konrad Dybcio wrote:
>>> On 7.02.2025 11:31 AM, Neil Armstrong wrote:
>>>> The PMUs shares the same per-cpu (PPI) interrupt, so declare the proper
>>>> interrupt partition maps and use the 4th interrupt cell to pass the
>>>> partition phandle for each ARM PMU node.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>
>>>> @@ -5309,6 +5309,20 @@ intc: interrupt-controller@17100000 {
>>>>                #size-cells = <2>;
>>>>                ranges;
>>>>    +            ppi-partitions {
>>>> +                ppi_cluster0: interrupt-partition-0 {
>>>> +                    affinity = <&cpu0 &cpu1>;
>>>> +                };
>>>> +
>>>> +                ppi_cluster1: interrupt-partition-1 {
>>>> +                    affinity = <&cpu2 &cpu3 &cpu4 &cpu5 &cpu6>;
>>>> +                };
>>>> +
>>>> +                ppi_cluster2: interrupt-partition-2 {
>>>> +                    affinity = <&cpu7>;
>>>> +                };
>>>
>>> I'm not sure this is accurate.
>>>
>>> I *think* it's cores 0-1 and 2-7, but I can't find a concrete answer
>>
>> Core 7 is a Cortex-X4, and has a dedicated PMU node, look at the cpu compatibles.
> 
> Look at what these compatibles do in code. Nothing special for the X.

So you suggest to revert Rob's change ?

https://lore.kernel.org/all/20240417204247.3216703-1-robh@kernel.org/

So what I understood is that yes the code is the same, but the perf
attributes are not necessarily the same between heterogeneous cores,
so each instance here would load the attributes for each core type
correctly instead of only using the ones from the first core

Again, other SoCs uses this same scheme so I wonder what's the issue here ?

Neil

> 
> Konrad

