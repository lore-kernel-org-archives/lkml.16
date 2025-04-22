Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4BF1A5B86
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745305139; cv=none; b=nf96qK26yfY2IK+WXBfYrfE1NTJ005D3lK1EwNYA2V6IsaU0GEPl8+xZBwmvNUF5iaEpJRvafzn540JReWpHs98qzKnaWMntWduYAhfWFhshxjgPEBjpw9ISL9jBJWuY/Mp3VDEsPPfc+tuurlrwKKGfxNpPSv/5O7NXfREKdSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745305139; c=relaxed/simple;
	bh=Zl/rHjQPYoFedXIJt6pPIlPvjvilC8CB38FGZiHgqGo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LaR4tWsrtyPFDRyamom5dX/ItdGWSqt29Clym10uWoi/QtaPtvqae6oXt1TvgHAQIlFHpn4nqjG4XsMW+0bjTHe2dTPwzr74A1YZONtcOVBuqDErDFPd4V+ZpooJs7nsW6gvGyGUOEFcEPOX3AlT1FilHEGbvTdu98DYY5Q7zpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jWni3Z+X; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jWni3Z+X"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso3721632f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 23:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745305135; x=1745909935; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xd3/3q1AYSo/JYqDVTQPa8vVX/K5QL5ZbX5wE8VPDqY=;
        b=jWni3Z+Xj38s1rJMTdQHy6G7c+W1Sr1JMcFZovRYgha5BXZYEy+p2bd2QYFQyxJjkm
         z6duTEq3fHWNaOJAgvfX3AR9bAPYBiNc7Mt/WXaytW8GgBSBuFGyPJMQO1A9uQ+QdKAa
         aoIKYodZjBJ24pr11UW49cCnsv1Eawo4xL85IGKaUD6uZtOkNBdluivGKmZBNjXN2I1q
         lwPcwKihg5wcfmfK5VKNcWajv0gauRj0OZipbGHZHGwprOC3QArmHxm+T4y3pLGii/Sz
         Ci2peTN7LARceUxmIYNaAUNtVUyNmZ0SpFB2JRGXYPDOGth71XmGJXji+aSZA4VeHAVY
         lHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745305135; x=1745909935;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xd3/3q1AYSo/JYqDVTQPa8vVX/K5QL5ZbX5wE8VPDqY=;
        b=D+p2WPnn94SNKetIPLCjdIp2kTQg39VyIxWJRTiZ/fGvyBNfrhdyG/99qBn6DeUFYA
         ZoHLoheI6IJQ/vXubn42bsFfroJs7JRVF3OpVtYZ6pGYnFgmBSU/SOwZWlqWE+FuP/K/
         hZukqWSX1RR7kk9hJOfe722ebikEeGKSSYDANsfwJf2o4LK47L5W49JDH/FjjOd+ewww
         bskydbi/qJJdcyAfLxYaexP6+XmNuarWYbm8iVi3Ay8yQwUP8fbjCt4Fx+hnOLQJ6G9s
         6WHrMxbfiQrM2PWpEEbx5zJIQcbGX3PwJe/ymfET5raBx3dfJvd+Whjzn3CTqCQfepSC
         PMAw==
X-Forwarded-Encrypted: i=1; AJvYcCWTrOd/Gx6qjMjdEdw8nhfe9uZ6z26jCOH9XltK2VQQJKtBuMRuvbn02Z1IG9l98BURfvwT44znfVpIBfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK02c4nyLpJbU/jPOoM0mO/IvfD8aX1XATX1Xwn06GTPvxt945
	fT9CQcLUt+aKkztj/qfzVrwWVCMHkDaGzaHW+vUbI1D77YUVZjPkHja5l0wmD38=
X-Gm-Gg: ASbGncuN84l9N9pGmVSn3gM6kLuF88hr4b9JpAhmhEnpMbcYRSpBgbkNBx/CPuugknS
	6t8r2mgvfBM33s8QSMhhpN0dE00c5JW0/7txKxqBQ3hdi63c2KHQ03wk9cqX9+6O5ImDG71RJw5
	82HPAWffU1MCx50BD4W3+56eFuH9LJ1NGmCkIY9mpiJHlBJoq+5LCJ8IHuqgH9MaaDVvQbq6IyO
	DrHbe3lhkTvuWuwfUmtHTSaZFttG2bcx84Dx6RZtg89UhG/jzfH92B1ckc3vuucNBPXB0ibs+E5
	Dt1EhwFGtPIUuDtqflwlgjnl1Lw0W42iR9EPBGGonP18Ym0fuKjjcdDGzeIc0Y6u1s6IjfQFM0i
	JCZw9e+LvbuxEhzy8fA==
X-Google-Smtp-Source: AGHT+IHbDFXF+5+LP6/HjCP1JYYnUemqwmt6GGZ6W0Gq5gWqraVlFDfoGiHhFNvQf1N0siWjoeAirw==
X-Received: by 2002:a05:6000:184f:b0:39b:f44b:e176 with SMTP id ffacd0b85a97d-39ef9466f36mr12081694f8f.24.1745305135539;
        Mon, 21 Apr 2025 23:58:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f? ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43d07csm14396780f8f.58.2025.04.21.23.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 23:58:55 -0700 (PDT)
Message-ID: <5c0e86f4-b40b-4f43-a97d-a166f41737a4@linaro.org>
Date: Tue, 22 Apr 2025 08:58:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 0/4] dts: amlogic: fix FCLK{3,4} clocks for new PWM
 controller binding
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: jbrunet@baylibre.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 christianshewitt@gmail.com
References: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/04/2025 18:47, Martin Blumenstingl wrote:
> Christian has reported Bluetooth issues on some of his boards, for
> example on a (GXBB) WeTek Play 2:
>    # dmesg | grep -i blue
>    Bluetooth: Core ver 2.22
>    NET: Registered PF_BLUETOOTH protocol family
>    Bluetooth: HCI device and connection manager initialized
>    Bluetooth: HCI socket layer initialized
>    Bluetooth: L2CAP socket layer initialized
>    Bluetooth: SCO socket layer initialized
>    Bluetooth: HCI UART driver ver 2.3
>    Bluetooth: HCI UART protocol H4 registered
>    Bluetooth: HCI UART protocol Three-wire (H5) registered
>    Bluetooth: HCI UART protocol Broadcom registered
>    Bluetooth: HCI UART protocol QCA registered
>    Bluetooth: HCI UART protocol AML registered
>    Bluetooth: null: hu 0000000023fa9791
>    Bluetooth: hci0: hu 0000000023fa9791
>    Bluetooth: hci0: hu 0000000023fa9791 skb 000000003f7acf2f
>    Bluetooth: hci0: command 0x0c03 tx timeout
>    Bluetooth: hci0: BCM: Reset failed (-110)
>    Bluetooth: hci0: hu 0000000023fa9791
>    Bluetooth: hci0: hu 0000000023fa9791
> 
> It turns out there's a typo in the references to the untested/unknown
> clock input that made it into the already applied series
> "dts: amlogic: switch to the new PWM controller binding" [0]
> 
> The original goal was to skip this input. This can be achieved by
> specifying a clock input as <0> (which this series does). When using
> <> (note the lack of 0) the clock is completely ignored when parsing
> the .dtb, resulting in a shift in index of the FCLK DIV4 / DIV3 inputs.
> This then results in the PWM controller driver calculating the
> frequencies for a different clock compared to what the actual hardware
> uses.
> 
> Neil, please apply this as a fix for the next 6.15-rc.
> 
> 
> [0] https://lore.kernel.org/linux-amlogic/20241227212514.1376682-1-martin.blumenstingl@googlemail.com/
> 
> 
> Martin Blumenstingl (4):
>    ARM: dts: amlogic: meson8: fix reference to unknown/untested PWM clock
>    ARM: dts: amlogic: meson8b: fix reference to unknown/untested PWM
>      clock
>    arm64: dts: amlogic: gx: fix reference to unknown/untested PWM clock
>    arm64: dts: amlogic: g12: fix reference to unknown/untested PWM clock
> 
>   arch/arm/boot/dts/amlogic/meson8.dtsi             | 6 +++---
>   arch/arm/boot/dts/amlogic/meson8b.dtsi            | 6 +++---
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 +++---
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi       | 6 +++---
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 6 +++---
>   5 files changed, 15 insertions(+), 15 deletions(-)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
