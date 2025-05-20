Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E98025D201
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747725956; cv=none; b=OpzobuQwXPFZAGuODwncEV1XMBwAX836rwlZT3+locVbOs1HxtZmLb/I5u5e7cRZJdAAXPvfXTWEoKXMBt9yni0qeHF8ntD+tpaA1hRlvn9oBQjiiXEfYUWdQ1nlc8dlKaAj77ZdzpcvA3xRenhAFgMtu9FupW0ctWmPD4WXLxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747725956; c=relaxed/simple;
	bh=sezTVwik7anavTJqHdaomUlHJ50jVkhWmv+lR5aPHHw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kKzzIvb7sud+pfOWf1uJzYaS0bFHiV4CMBJ/UIYTt05pulT9OERHy6Ni3ed/hSgEepNnoY+hPOlk+xRd1XoDDLpckHOz6JfY6fAk6zG+vE1TIK0B2+j27IxUOevKUPiUE12rqOpiVf9dx5s8Br16YX5BK0dbcvXVVxvO94vWZT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CMRqbnsr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CMRqbnsr"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-443a787bd14so21409175e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 00:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747725953; x=1748330753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UP5sbw/o/th42O3rAuhXBR1VcsVlw4tZ0UyWVZPqQrY=;
        b=CMRqbnsreyhhT7/C1aPYzqK3tModhvKs6BQnQgNWpI/F6BYl0I3KthcR0JHBySYPsw
         TpNJJj+uMdL2XJungrmcTOVMDxLqkZ8mJ2xkY5G6LNgnUSG3GYjU9uc3XddVssU1wEuF
         YWfBKk8AUxfD3VjSOn1XTrP6wHgIEEPygIr5nECzBsHSOv2/vwc5YzzcJ6m69EbgRYC1
         R7JKuEouPksrDmTtEk4+32HjiCvNrWusJP7uehEcHEketvrUqbWmRIt1grSX/KoaaI0I
         VY/S5K7yvUsqI1hZkRFEvhbX6R6aYxhDyNbfgDZ9qFLdWqMwyiXF17TYs7B1RcAUq6as
         bGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747725953; x=1748330753;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UP5sbw/o/th42O3rAuhXBR1VcsVlw4tZ0UyWVZPqQrY=;
        b=WSVcgRz01Xn1pc9Ym0YC9SuacbPzboTB/3BZ7PU2FXiGZFgIXOoGc4B5ECLEJDWwtp
         V+GD9v61JJf0Qm8O23LdIxPboCTwmjglkJWMq2PFmWoxfurSPr1QqgjzdNyrFZzZDcz7
         oY3JVN+DOrejwiAgOdPTHBDKGGa4iZbu3CJjUHNwns6UGsix0qFi9JGTFKmVjcVGScpj
         VZJK6pSuV005LVRmhWW/gQ6PPyuEomHUAx2aWdOQwWC2ABcPTIw2e8aEH1YMikRbaRsP
         IKcS/f3rlOmtbv5W4bez/jStgQRhFPaRs1AY7aulcec4KrOEDTuA46NFkyZCXvQ8T2IT
         bGnw==
X-Forwarded-Encrypted: i=1; AJvYcCWZNFvVuTqV8RZjhkq5Q25DPWO1O/oKrG9/o+derzaffBb6EQS14urpvI21mTRzZ+ivvkOcUYFosmYAkXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIOtuLn8/rOaCdPbGzk7H3afeG8DeAdvCAqaY2j4t4xrobdc0T
	yBqkQg4x2IWWPOx9dqvVJmm390JqPmYDYQerLnNGM2yGRKZoaXOQjO5P1fVBZLDRgwg=
X-Gm-Gg: ASbGncu6tEtuanoRoUNgbS3p01AVBjCaO3OPuHkQ0VnQLop/weOqQ7Cz2jqg4jn+Rj9
	4H9p0GT4/gDRog+Ut1l9clLGQd6qDw6NUFSqNHqPcIM/gG18uBV0wrqf/jrjkjeg0It0C/8eM1T
	a5MhvS0LO9hMxxqHc5JuioGLjuiH1/X1ABUAEXAC6wkc12YOxFAveeiPPpyNXGYikSbPW9XYUwU
	pMPtefjdFjoxUB6bSYvCDoDf8aDVMkD7eRuqVcDsl/+6Kfs2cc14lf8YqaxWfgW1lPDYyuVlYQU
	+AJGRxbUPx7hwK/7iNRZY3BkM4+o1Q7Ra+8LlGhsMLxVGfBaDsKXuX0wHJ2UWOGH6p0oCXLYd2q
	gcxFIrjoVYgD9Oxi7pxhlJJUmRlI7
X-Google-Smtp-Source: AGHT+IGX1ouqdPz6YkedzAISFSFYo/jA67bLEFX97CJnnDf9kq6Edax1FsWtb5/PdGMGY7Uc5FvEng==
X-Received: by 2002:a05:600c:5012:b0:440:69f5:f179 with SMTP id 5b1f17b1804b1-442f84d5511mr184356115e9.7.1747725952828;
        Tue, 20 May 2025 00:25:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3dd99absm19162985e9.37.2025.05.20.00.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:25:52 -0700 (PDT)
Message-ID: <1527272e-fe7a-435d-a279-3ff73c245200@linaro.org>
Date: Tue, 20 May 2025 09:25:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sa8775p: Remove max link speed
 property for PCIe EP
To: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
 quic_vbadigan@quicinc.com, quic_nayiluri@quicinc.com,
 quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
 Mrinmay Sarkar <quic_msarkar@quicinc.com>
References: <20250514-update_phy-v2-0-d4f319221474@quicinc.com>
 <20250514-update_phy-v2-2-d4f319221474@quicinc.com>
 <8ba99df8-012b-4883-af6a-970dd9f877f6@linaro.org>
 <f5e1510f-3496-4f5e-b093-623d3b4be428@oss.qualcomm.com>
 <CAMyL0qPH2r8oXOrNp3jF-nBJCRCZzJr8rYrHn+Yp0MHR0Wy-vw@mail.gmail.com>
 <bpc4tsp4kghqohoxm42qls7gzd5me7xrpodmazyhpvjjlkkay2@paoq5zygczdd>
 <CAMyL0qNQWN1ORReZu3wrw_Ex+nAmAJxhTMCt4Jw6PyEN4tEtGQ@mail.gmail.com>
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
In-Reply-To: <CAMyL0qNQWN1ORReZu3wrw_Ex+nAmAJxhTMCt4Jw6PyEN4tEtGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/05/2025 14:16, Mrinmay Sarkar wrote:
> On Sat, May 17, 2025 at 3:33 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Fri, May 16, 2025 at 03:59:02PM +0530, Mrinmay Sarkar wrote:
>>> On Fri, May 16, 2025 at 2:30 PM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 5/14/25 6:38 PM, neil.armstrong@linaro.org wrote:
>>>>> On 14/05/2025 13:37, Mrinmay Sarkar wrote:
>>>>>> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
>>>>>>
>>>>>> The maximum link speed was previously restricted to Gen3 due to the
>>>>>> absence of Gen4 equalization support in the driver.
>>>>>>
>>>>>> Add change to remove max link speed property, Since Gen4 equalization
>>>>>> support has already been added into the driver.
>>>>>
>>>>> Which driver, PHY or Controller ?
>>>>
>>>> Controller, see
>>>>
>>>> 09483959e34d ("PCI: dwc: Add support for configuring lane equalization presets")
>>>
>>> Yes, this patch is helping to solve gen4 stability issue.
>>>>
>>>> and commits around it
>>>>
>>>> does this change depends on the patch 1 PHY settings update ?
>>>>
>>>> That I'm curious about too, but I would guesstimate no
>>>>
>>> this change doesn't depends on the patch 1 PHY settings update
>>
>> Then what has changed, as previously it was documented to have stability
>> issues.
>>
> Actually this controller change is solving the stability issue with
> gen4: "PCI: qcom: Add equalization settings for 16.0 GT/s"
> https://lore.kernel.org/linux-pci/20240911-pci-qcom-gen4-stability-v7-3-743f5c1fd027@linaro.org/

Ok so those patches should be send separately and will reduce maintainers work
by trying to figure out if there's a dependency.

Neil

> 
> Thanks,
> Mrinmay
>> --
>> With best wishes
>> Dmitry

