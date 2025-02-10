Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF201BBBDD
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739179644; cv=none; b=jRc1nCjzxm7gWLTbeSAXj4sgG6kWtsosmr6pc49DhUbJw1SDpea7yu9tr1ygC9eLf/xwy+AZyKi+MEIcSho+naSsSeAqShEq4MQhTJDVjT07xN2QNQOQixVCZTate+5ipug6Xx9m8G1Jv7w+2yqXcsA29ts1YEeKPri/OIhSqas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739179644; c=relaxed/simple;
	bh=3MeWMlxsI0USpPCXnmmfBynj4CtpNkuyJ1X5PGVcWjo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VQdL6TV3JwU5+HH2hTPPU/sLWWRUBdMOvPIoOU9kH9lZplxPelZLLIYxLULZj4uv/gLPiaLZKoV7ihwygZle+KLXfRElfaFcSgRHxmsOJd5UewquLl6aSMECSUUPQeRxLauqBjxj7N0BqIfQDOgrm7gnwiItqoweqtxZOX2Axic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jZ8rtC4S; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jZ8rtC4S"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43690d4605dso27431785e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 01:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739179641; x=1739784441; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Q2+Q0+PNrsCfkXgLk2DXYgaQAPJ2h1usonU//uuPZk=;
        b=jZ8rtC4SIX7nR4yQm0NbDbXYjZmVyUjGPYehDygCPsA1IonxYMz2QO8kDtZ55jcaMf
         ahVTFqDz38DrhfK/SYlH8wRYVpEGmne+HOmPYbpBqpBTXVG+V7r3ZuG2BFqHapJfu6P/
         yrMELFKQyAO07PRn3nTU23//v5wEiFyl+YqT95SXZPdUC0gb/9k7f1vQYNt5iygFEQwW
         P7RiuSOO6Qh3GA1c3nHY01FK/ZBiJ/65+EqXIvmJ6ACDdQzwsCOScaTBc7WTcWdol4NJ
         k2TvAVc3vxZkOGbtUgom8HUdAoBqcH/PRclvFEN/lXlCr1h2n/83yYMc3XRIgpFAfKRa
         3giQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179641; x=1739784441;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5Q2+Q0+PNrsCfkXgLk2DXYgaQAPJ2h1usonU//uuPZk=;
        b=d9REAHa7zmXFMlZ9ZV7eFuX5bHjFVX3oLxgUZVE4MtaLLNPXJYH7QjnAHfD+MVZj4o
         o9rcid8PsNO7XYdIWNf/h4Yju2oILr3RQ7OwPqOgYby6UK/R8oDE+YJZbdgyS8QPHbob
         3XWikAwGIBxO5PR+UbWz8lp/trdV5fw/I7Di9vFhT3NcLgwYc38D81KZxkbkK0zwpQ6h
         y++5Upf/t+qWCa6+jryikcj9E+eEP2Q8q4RPVqzCXXzI6FFbLLDCjIKOc09N/vb+g0s3
         GIdAaJXWWS8lwPJG1QFBMVN+gkz5jxSLCH/hgsgaEygTbrF9oSsN77d9RbGl+9zf1U6w
         YVRA==
X-Forwarded-Encrypted: i=1; AJvYcCW6us6VHcoPR986VMCPXO6CjwD+Ns6MNWcBGY9eaZ3VGHfdFa8eGkX1Iav1kE4+mbEuBX1P+42C3PPzhSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpHpmfqn1kbilEZuJbpOmMgGoqhKzFGS76xJJeN7J8wrUy9DVK
	zoHm3TVDUm3rUnLLrWDwuo4RsHV6TqSpG7v/sR5yzXp1e0EvB40PtOGntEIwJ4g=
X-Gm-Gg: ASbGncuMkIqAEZwJHr2hPElt629xt1nIQHjwp4e4iaRGixngKDl6L7D6dexbQWgpFzW
	TyKuL//DocF8w6XkrP6a4HI6v5I55g3ukDxKL5RaimIDxsxLysRliT4ZYfud5IQ8UNAL465ISen
	ALImNIs7Qx5675tTMCdXGH+tUH7xQ6fm/RaJL3YEFkUMWUsYXc194ht9+Xw6OCNEiZkMuE37625
	Q37+lFoTK9M2pMKRei8ZN0/3Yk5p/YIioVtL6vxRKwoA/uMXry/cbulx/SlCFObHQhgW438oOSG
	9Zxiy2CsnSWzc2/jRA5Ox6ekK0E4dqyWS1q8HJRMk8JDNACajjwesY21yHcSe2sN4bmF
X-Google-Smtp-Source: AGHT+IG9gcIE0E7FoMh9ojaKHy1cLvCjSIQqq5pv5YmXQQgVQ1By6LPvbUC/eubd3iVX/ofP6aEpzA==
X-Received: by 2002:a5d:5f83:0:b0:38b:ed1c:a70d with SMTP id ffacd0b85a97d-38dc891fbdcmr7609963f8f.0.1739179640815;
        Mon, 10 Feb 2025 01:27:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8235:1ea0:1a75:c4d5? ([2a01:e0a:982:cbb0:8235:1ea0:1a75:c4d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d7d4sm177079745e9.10.2025.02.10.01.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 01:27:20 -0800 (PST)
Message-ID: <5b782e14-5262-49f9-938b-b8c9b8935f6a@linaro.org>
Date: Mon, 10 Feb 2025 10:27:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8650: switch to interrupt-cells 4
 to add PPI partitions
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250207-topic-sm8650-pmu-ppi-partition-v1-0-dd3ba17b3eea@linaro.org>
 <20250207-topic-sm8650-pmu-ppi-partition-v1-1-dd3ba17b3eea@linaro.org>
 <efcc2cee-1d8b-45d1-aa9a-4e7afc19d857@oss.qualcomm.com>
 <57c82928-5275-4f6c-b6d0-935dd5080f9b@linaro.org>
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
In-Reply-To: <57c82928-5275-4f6c-b6d0-935dd5080f9b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2025 15:45, Neil Armstrong wrote:
> On 07/02/2025 21:23, Konrad Dybcio wrote:
>> On 7.02.2025 11:31 AM, Neil Armstrong wrote:
>>> The ARM PMUs shares the same per-cpu (PPI) interrupt, so we need to switch
>>> to interrupt-cells = <4> in the GIC node to allow adding an interrupt
>>> partition map phandle as the 4th cell value for GIC_PPI interrupts.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>
>> If I'm reading the core right, we can leave the fourth cell
>> uninitialized where it makes no sense
> 
> It's not what dtbs_check thinks !

And if you don't specify the 4th cell, dtc is not happy at all:

arch/arm64/boot/dts/qcom/sm8650.dtsi:5302.4-27: Warning (interrupts_property): /soc@0/timer@17420000/frame@1742d000:#interrupt-cells: size is (12), expected multiple of 16
arch/arm64/boot/dts/qcom/sm8650.dtsi:5302.4-27: Warning (interrupts_property): /soc@0/rsc@17a00000:#interrupt-cells: size is (36), expected multiple of 16
arch/arm64/boot/dts/qcom/sm8650.dtsi:5302.4-27: Warning (interrupts_property): /soc@0/mmc@8804000:#interrupt-cells: size is (24), expected multiple of 16
...
for a good reason, if you specify 4 cells and you specify multiple interrupts the
DT code will split the interrupts entry by interrupts-cells + 1.

Remember we pass the DT in the DTB format without all the verbosity of DTS,
the properly is only a bunch of u32 blobs we can extract with the help
of the -cells properties of the providers.

Neil

> 
>>
>> Konrad
> 

