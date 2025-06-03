Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47BB5CDF1
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748956973; cv=none; b=SHC4iGip5hTOhcpKHeUMnWUewlcrTLL0fqOHNYONkB/kuQZckFatF9DDH3sbWNaZ8fILSM0XzjupEiF1XQdVlHQxoi4UOlrIO3cTkINX+JXZkI7qEjkWt47jtHz2e8kMAptYGExBcvoIH15yxVRHnRHNNDNhcoBuCqMmop1HXZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748956973; c=relaxed/simple;
	bh=S1oHPZ7gws5NN0CNhqDkGo3WqwE8z+Icusut02QCQqU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fDq8YtIxBAe83VcfDJi7xxWrlqSWRPv8RaADpC3Tpn2lHpSam3qawEApvxpFVqFvHhYu1J+oD9f85bNBRD6X7pkDjYE7k+aFQnPKrORAyfLw6XBENsOK4mujZjTkpQ5B+UGLA9jY/zXzZWZzvLHO2gBiWdqtdbkfH4uvFNFcKYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gh56Cndt; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gh56Cndt"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a3798794d3so4749797f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 06:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748956970; x=1749561770; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9o1OG5gJMnbyvyc0DC5kIEpva13qObOrgWmt6a2YYaM=;
        b=gh56CndtNQsmHG1BEDh91744ajyWIp8Hp8wMgFYBr0Lyot6UWJXpdg2X8nQwuSzuQs
         x8159Y/PT68fX6O7pol5TE5VT5UQiinJ3vbVMjSu3N6P9hdJ47TxtGz81agxBGWg6t/5
         Smoy81te9PW7r5i+/9xTS4QkEZUxmaRDBoSHOvOQgVgHepWkhuNoNnDAP4wvTWCKAX4L
         THN9ZSU5hRfBQ0YEvEmIvhcDL2ZLoav1xyxw6Je+p7eoMqfDnPIG+h0HYhDeZi5LrJ3c
         vOSt+S7geHgn7Nc3n+qH6fIXIh/IUfL/5I0eakQ3eaWIkDQD6fjLJgqalQOmXKA4Btbb
         nQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748956970; x=1749561770;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9o1OG5gJMnbyvyc0DC5kIEpva13qObOrgWmt6a2YYaM=;
        b=r4aToE7+lKNd430v0axx93C6ZUlumBzVugQyh9y4UIaGA14u5UQUDzkIHa7PTprW62
         lcMzZFy7aJ/hUPLQO9V2cDVRRHuVjUjEAtmGODmpgehn/VATqIPXI8YvTIqvyh475d9E
         /qXbyA+Xc0HO1N/9XI4+SDdozebvgAkSLkGswCxJcr12hkanilLwcmun2YL69znF3Gr0
         LMpvn+EhsxL+owoI/0Z6oi+VtEbic8585jaT6BS8xlFlJ8vXRa4v2ckiaQPlxbHiSwz8
         8/iHf2dQUhwizQhqjaj/vFnPgtKNb9cGMx+F7KzcUkiLMUB35EEThdD/G+6FVsQIjo9N
         14Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVskAWgcFMCFWJkV0stfF2V+xME6Omf/gN+cIZjhiuSHMUwNtZVONhMysT5aieDMKLLCqhgUGRL4VwpSXI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/iuRvFv2XG4Ut0sE8FHtU8Lo6Fjh045F/68AE7eXjISZJgLGX
	rQ8xbA/m6+tIZklvvyjc4BknpkxOkmGM2T/h9QxWkuqLSi7qXMP0gNRx94l9JLTEIgA=
X-Gm-Gg: ASbGncugWm5KE8Cy3ubQczCPBdO6JD0teCRVbfQxc3YD3QBAKQVGal5F+vVO1HNt+vj
	uz+X/wA8x0Ql4sIutkDMpgUaTWOJBKWEJwOwNZ7NStYBR8HrAL7Ptvobm6VEIW6b6hm0rjNbbm6
	g9ZLOWnwjYv7Jqm8qA2qjguHmpBUhu+zfVp9ogizyzabUpThng5y4k9B/JnZZfPlj9pNXSFNl9I
	LQpPZPZij5sQbAUHujB50ow+8Vdr+DlpZ+GVt+6YsPqo3ueYMtmBd68XjpFluBnBeeSqWbQpwNL
	Lhp9BHXMd4pzf5yyhXcXJovZ532lQIdPci8aIL5SZ5uL9clT8T0jgEnl/p1fQyS6Y+3b7WrqbtM
	vmGNdKfE2C36UsWQPC90TzP0pR/YuHQBT9Y70
X-Google-Smtp-Source: AGHT+IGwM1OzgbnP1nAlLY2AaZkYQUoZH8oN0rymNrDg+49LiXGRY5PKTqcJSZ1tfnP2AMJFUo1T8Q==
X-Received: by 2002:a05:6000:230d:b0:3a4:f8e9:cef2 with SMTP id ffacd0b85a97d-3a4fe39363cmr9636222f8f.36.1748956969885;
        Tue, 03 Jun 2025 06:22:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:563:3654:17de:c930? ([2a01:e0a:3d9:2080:563:3654:17de:c930])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972f3sm18588651f8f.69.2025.06.03.06.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 06:22:49 -0700 (PDT)
Message-ID: <d950d77a-2bc0-4f8d-88c0-3d4da9cc772e@linaro.org>
Date: Tue, 3 Jun 2025 15:22:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-gxm-rbox-pro: fix wifi node
 name
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250603-topic-amlogic-upstream-bindings-fixes-dts-round-3-v1-1-2d54a476757d@linaro.org>
 <366cdccf-571c-4f7f-ae26-2e529de5d5ec@kernel.org>
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
In-Reply-To: <366cdccf-571c-4f7f-ae26-2e529de5d5ec@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2025 11:50, Krzysztof Kozlowski wrote:
> On 03/06/2025 09:47, Neil Armstrong wrote:
>> This fixes the following error:
>> meson-gxm-rbox-pro.dtb: brcmf@1: $nodename:0: 'brcmf@1' does not match '^wifi(@.*)?$'
>> 	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
>>
> 
> I already sent it:
> https://lore.kernel.org/linux-arm-kernel/3c3c3652-be5f-4f54-a0b8-4829f9549116@linaro.org/
> 
> Can you pick that one instead?

Sorry I forgot, of course I'll pick yours.

Neil

> 
> Best regards,
> Krzysztof

