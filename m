Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007DB28AAE5
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548061; cv=none; b=SBG5GUyPHoLWIIKY5ykc0IwPZXVlmOkC9B+rzpNfX3gLGXzzCZAAY3NtVua9FVnEDZkLzrXQbBv7Si/weAYyJITl/bzfXBsjpw2QgoCItQrm7S9Fb9/KeemCqHcPCnKzsKKXWfw6qQRhL63aj21TJYEpil9F5QBm2ko1RyFGn7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548061; c=relaxed/simple;
	bh=I1K9tWbjDdnJVLwMOtJQ8wqurk7EW2N8ZkjWa+a8L44=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=N3s+TodB9JlakPTPIJ/ifBPCHR4M9P0j7ciAGkQ5whLdw/BsLediUoMQv3sRZsAxbAMBgzCT+03sfVx0zd7NSZX4rEDAHZsOW1RD7TOdxImXTENwQVZDBWNYwscIbNQL5d9KmqtM7LxlI904VMczrD5hoRpL2nz79TODsguQGWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pXIjezdV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pXIjezdV"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so63763705e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749548057; x=1750152857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2sgAb1XNW7IcbUYG5Vl92Yrpvf31sMblVDDnz2uwCdM=;
        b=pXIjezdV6M6plzz0/iPNRsy58Mu6zGYhkIfc6X/ZBubfdYOHqsOK6LtZNuQD+Gblph
         IXECnlWpzsBha7Xsf0sFMZdKUZZen9g7fPHhDGKm9ARNL+fnEbPLMV2a6PKRpiK+zhGc
         cgPW8BjUzUYJWouVLxiv1eRCduRB1S/rNFa0Q3kSpIPPadU5oD+02hWWfBXJnK4LkSRz
         DBgOdmLE2M3cOea3rR1Vr3q9r7O+cvB4tDzJ7IuLH/yK4aLDsVd+pn5JoDNCiWPGyhdb
         f2fv0H1+VMI8Po0Kbu3ONoF0aDlOg1ofXJo9H0af5o0Tgt9ZrhTgphcTNYsjcI6ZiwYK
         thSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548057; x=1750152857;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2sgAb1XNW7IcbUYG5Vl92Yrpvf31sMblVDDnz2uwCdM=;
        b=GqIvI/WIeou/Jsg/HLfODEhFUz/Fs6XdH/K0iIxMYWo3aE/QPPF7yva9jiS0js1MtS
         eM1bSET+ATBGy9Ou/DKCT5YjaS9L/7M9xWFQsvQG+bw8bXrIecEy83zpdKkKlYvI+MPr
         BH/lDOuna6n1MkqD+yDvfj/GzLd6euejyahL0xJctsZa6RuKXVC+S+g1gHnXzZ2Z0BzK
         MPJ1AuNgSQQ9/FUetKMDG5uTWIj/MSWin+m3U3ilTCxra0dSR/dPnJxpZE3pzxkRPXP1
         SpurScOI7F9yWTtYeXQI7UKuwBDv3doRIgKFuBWwAwDtAsDTyyYJe7b42UruLuy4USnv
         tVTg==
X-Gm-Message-State: AOJu0YwPl963si+tprcZ/aGgZdxMuj+3yU8AU8TgCUGNTP2AvqETRU5K
	LKWyplLhI29oKqNBaEoozqrWPZfXdN/JkF7m17UtvE2YmAVvGDgtqDXYObwNlIGfB/g=
X-Gm-Gg: ASbGncuOFRzuInejHaCLLbvKCzTOCImYiruPoXQSOYkqp4HAM1PEIQwjoaNk4QBhd0n
	NxudR6untFYS9c16HKrTuQaATCHFwXp/8X228SUsv5GmW1/57hKsDF4erEejkSunVepBlPSnB4d
	ULYUR8cyPL+KPw4A2DaQWTCO/2fRgEeL9R9ypb6ae/wiB9xotcWlctOcePN9aWjB+xsh0rAKviW
	oVFIIuk5bNrYOYDBRGTWphVZ+bRuPQqFIk3EwcUjraDlNtzGYjAEh06t0B4J3BMaWL8D0fL+CBK
	ytwGp5KooKJoa+ee5gS1IZOb4wr4g8kglQq+M7elFbsZKlK99+5YoUftHorn0dzP/TBv1VpE3XX
	BqZBoU30qjN4DzlF+HThy4JFIB5Ui+20K9EAl
X-Google-Smtp-Source: AGHT+IFH0HuMjwqMdNYVSnjDPrZbsV6mlwKgIbS1lF2FMgN1dbTtzO2vCD3SgrqFOHSyP+hq+BtSTQ==
X-Received: by 2002:a5d:588a:0:b0:3a5:2e9c:edb with SMTP id ffacd0b85a97d-3a531cde0cbmr13358935f8f.47.1749548057284;
        Tue, 10 Jun 2025 02:34:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14? ([2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452fba4621csm123988285e9.13.2025.06.10.02.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 02:34:16 -0700 (PDT)
Message-ID: <7f5b7a49-28a0-4923-bbf4-8b0afdefe571@linaro.org>
Date: Tue, 10 Jun 2025 11:34:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/2] Flattening USB controller on SM8450 QRD
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250610091805.2997546-1-krishna.kurapati@oss.qualcomm.com>
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
In-Reply-To: <20250610091805.2997546-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2025 11:18, Krishna Kurapati wrote:
> Flatten USB Controller node on SM8450 QRD to move away from legacy USB
> Qualcomm glue driver and make use of new one. The series has been tested
> with driver changes [1] to enable runtime suspend/resume during cable
> disconnect/connect scenarios.
> 
> I was testing on SM8450 QRD and hence flattened usb node on that platform
> only. If the community suggests to flatten all platforms of sm8450, I can
> do a compile test for the ones I can't get hands on and send a follow up
> series.

I can test on an SM8450 HDK, so please flatten for all the boards and CC me

Neil

> 
> [1]: https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/
> 
> Krishna Kurapati (2):
>    arm64: dts: qcom: sm8450-qrd: add pmic glink node
>    arm64: dts: qcom: sm8450-qrd: Flatten usb controller node
> 
>   arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 110 +++++++++++++++++++++++-
>   1 file changed, 108 insertions(+), 2 deletions(-)
> 

