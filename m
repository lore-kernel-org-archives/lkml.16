Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2103224339A
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 14:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739112297; cv=none; b=tls6ny8Cw74OdqhcH9TZCs6pUShJ8XiWd84gaviOPhr2gbKAT5PYumSkbY3fItDqoYgsZFTQzmi+DqIMyXeDnbb2SHN67EH//q9XLpiSgPRKWljVbWx0+34h2xI8/5+LVwcYVsory9U5N65eci90DXMZgw/KtYveuJM5mPbBwg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739112297; c=relaxed/simple;
	bh=zy7inQn8IlL22OlQ3SOSyDR4h8QdypuUqFZ0yVIeMHo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QfQa/CmqlFMUL6S8VPNkOQ6ognl6mc9z0AMvob/389GYTkI3ZbD7Fu5jvnyskRtBS3QFYuLH7xYTLntZ50i/UOvthJ0tOQk4gDTN/mGZKGAL01JoKgH1LB0UZ/gRvY8RRW/FBLmgQDK35JAudjcWBUkvICiwkOaJb3D6KLJyOto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aTC35yCm; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aTC35yCm"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e45af17a2eso15144226d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 06:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739112293; x=1739717093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5QvikTKCFNL7WLcBiL2Nw7xhGaRFi+kZbVL6GI4dUg=;
        b=aTC35yCmfXuMRKr5srPrqM3aiYRh4Ofn7dODvHKotZyfNJgTFlHjTDjMOIVSWc40kw
         ++sXDjFaaJczlMeZpCTwN6Ku139sXTjdqITJUemb7FN+m7feWo7N2b/LR7oblshrqWDK
         u8YLBKB48aHHjqWUGKc7KKDAbwhlptL9A+cgAfG8UL+20rndsFHg3aHXny7kQavQJFsd
         EjjP7jmXBafO912RIjRz18jDR2wYk+CxC1MwIu9oRAMn2yKkNgUdQ3OXstVl67yP8p7L
         UWdPFpFsSosI5FW/CZOvdd9F8jv5GzMVN7QhhhscZWVydZSlE2kSsrsx4mUI93/15jUV
         iTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739112293; x=1739717093;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w5QvikTKCFNL7WLcBiL2Nw7xhGaRFi+kZbVL6GI4dUg=;
        b=akwy8ZGN1FpuRp6MIJ/8zeMiK1Fdi2hchOU/x1WaMdPy4x2d6APcM58PcgJGm6yHgs
         mdnNX7epVjPToR2uzXcEArCW8RQ99mRhmoC/PEZsxion0Md8phjJKP/+xNSyFlocKncR
         oCn/PoDhTfD4iJbTz0H7fRm1jvItgcR1ccAMfbPoZBFT/rXAWAX6FuPvaqpiLyIZFtdT
         e7ZzhPwhhwWlYlzJayeAy0eBWW0zFIYoRI4wp1E7EeI6K1OUFVaHmBkqVoPm3YRylVG4
         HV+k01EFwjNfj4gcdVKK6WNyP7ifvzRjvLI21PnHEXp80bfcF5YjIx/9UOZVRkIwa5/Y
         I1xA==
X-Forwarded-Encrypted: i=1; AJvYcCWKxooj5ZcgSpZbs6yQUy4+41a6J+fXGC5vytYV5V+BdS7qobEn3QtPck14qY17LZc8itl/PZH3lKLH/4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoxKD2Z5bR/IRDh/vlLcuEBRc0kjxsCo2vMyyWoO4Ql2uh2e35
	xI0RkbcPHJRASNzUqrGhI9wkYJEoE27u+f/oZDg+tNg8nmhA7qmVr7Tfac/vaJI=
X-Gm-Gg: ASbGncvnAtJhgfoLvSDe+1Wk9ABCvND9nwu9vLxnosnz2OeoUOfdyLZdL45ciSNP6Sa
	+RWLkt9T8I8SRsceQk/o6t5HnJbgSEtkTGKWUsIeL/9PxJfXoF5jfclh/HH5gt+JSz9Vg9qMWPy
	JXLN3tKnSk4EtmXn9pqnUZj7QGDwQzAKK/EXPKE8UEvac3tQn14PvhNRk6eZNjDEBm23JUumM6M
	/bCRlHV4gGdptPunxcWwDGm3zVW+Tfj78AL59LCHtkKx5DaFSxl1/HBtjY9M9lnoMRajqVvb+ZD
	RF9TKsZj79ULrSh5VqcuzufebWLJn3f1QshBnkuot/upPSmPF+JLMS7t34dfZTjM/7T7
X-Google-Smtp-Source: AGHT+IHSNH3EcOtRNo838aV35hz3kX1wpHeFZVgLNa9gNU5K5QGpwy99/u8FN8FkHYN4asPsNSwJKg==
X-Received: by 2002:a05:6214:1c09:b0:6d8:9be9:7d57 with SMTP id 6a1803df08f44-6e44570afe8mr189702836d6.37.1739112292975;
        Sun, 09 Feb 2025 06:44:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6e2e:988e:3133:72bd? ([2a01:e0a:982:cbb0:6e2e:988e:3133:72bd])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e44d545327sm21696666d6.33.2025.02.09.06.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 06:44:51 -0800 (PST)
Message-ID: <6aa71142-3b1d-476f-9c78-1207fbbed3f5@linaro.org>
Date: Sun, 9 Feb 2025 15:44:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <ba546075-cfc0-4b17-9129-f99054e2e1ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/2025 21:30, Konrad Dybcio wrote:
> On 7.02.2025 11:31 AM, Neil Armstrong wrote:
>> The PMUs shares the same per-cpu (PPI) interrupt, so declare the proper
>> interrupt partition maps and use the 4th interrupt cell to pass the
>> partition phandle for each ARM PMU node.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> 
>> @@ -5309,6 +5309,20 @@ intc: interrupt-controller@17100000 {
>>   			#size-cells = <2>;
>>   			ranges;
>>   
>> +			ppi-partitions {
>> +				ppi_cluster0: interrupt-partition-0 {
>> +					affinity = <&cpu0 &cpu1>;
>> +				};
>> +
>> +				ppi_cluster1: interrupt-partition-1 {
>> +					affinity = <&cpu2 &cpu3 &cpu4 &cpu5 &cpu6>;
>> +				};
>> +
>> +				ppi_cluster2: interrupt-partition-2 {
>> +					affinity = <&cpu7>;
>> +				};
> 
> I'm not sure this is accurate.
> 
> I *think* it's cores 0-1 and 2-7, but I can't find a concrete answer

Core 7 is a Cortex-X4, and has a dedicated PMU node, look at the cpu compatibles.

Neil

> 
> Konrad

