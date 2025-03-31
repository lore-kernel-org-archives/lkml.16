Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE3E18E02A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 06:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743403330; cv=none; b=Tuwwz/Qjdp23cMqQU6GbTh8uSWKAxXV6QL3RH5XEZl7KrfCgroWRKuUz+gfx34pp+S5xZfkx/y4RE7/WSa8PTSWS9pJL6PL7NeBHjaVFiHtPQE3ZD4XNoHeJ539ARhZjOWrqaelYfccr7T9FRPw3ZeucKOf7X55vPGzDI9e5jG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743403330; c=relaxed/simple;
	bh=+2rhNhl4SB84aYUqvJfZumo57DfkJ75LYelGCFBJ7Bc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QwHCvsu8WH40GV5pMDAF+RIkidMxiCH56d10JLrOCF3PntysOdlp7c2oNzQbDdCYtgnXumwwc4RIsKx+QqBCYYmATcfTwn1ark4nqVi5VxzmsQMF5kLqAkm7mR8tBCbtSmRGRQal5rT5lJ+lN5af7Uwgwjugseg5M4yqt1fzdfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tSurU/6I; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tSurU/6I"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38f2f391864so2379961f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 23:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743403325; x=1744008125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSZWvc98awNxNS7sUp2CK9I3oZgb0IYq+6Zaom/DnwM=;
        b=tSurU/6IpnpamumyLYHJjLYEtuQv8MUAl5iapyedqqKHiOuznymvN8a2hU3y/Vlc3w
         oWSRN8/6Apu6OOkM8Sy0lKHVFKKNHB5hzGQ/2L05cKkNhSRqCnc5UeGTn4kAAU4WoZq7
         PqbKOobLEzh6wKe7ssxAA941RrXSE9T4qQ+9UWnEw/r0O2iHxzzoezxY4WGnUhRi7+aM
         QowigQ2v3C90GJj2zp0lbKzDqLtAd5YT/QwNnlwkAllkUeYCpQ+H9k6L1Gjow14piL10
         vAwSwcgEV8b+iLgZl4nz/vL/rWIoPv+/KsBGmIGRgC2o9zrWGshx49eoSbNUzKPUqnNA
         NkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743403325; x=1744008125;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pSZWvc98awNxNS7sUp2CK9I3oZgb0IYq+6Zaom/DnwM=;
        b=j5TqoivGswpAvzQQ+oEi8gRpWcoA3zyAdiijmrDbNqh4mHbjhNlry3siGijQKovc+Y
         eL+nUN5bIBSA9Y2h1x4ti/YEu9Dpnsg3dS7xViM7WYY9LJeG88OdxTsxtHGwGtW2WUOO
         6XXENxVT0nN3PGJI2JigXiuac5GjjfKk6b+pqGAM5RqBQfgJc+effHg1pasQNBsWo92X
         l8eBKxazWG2ikzcUswzgikBmhVIJviAOFTEsIo+4nPghwisUm2S28AXpBzGUhlBmFIVf
         c+L5u98bw4LauIvmtsITNxZBMck6DJda5IJ5HgRjSeyJjtTyZOacaL1s1J44dSvukIt3
         BIXg==
X-Forwarded-Encrypted: i=1; AJvYcCWDRQIzqZg2i/O67pHsqH37jqcneZzPIdkbW/8mqKeiTmmeUD9EMeUIGmDE8KryZhgfUZSOxW75u8Q5IOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYcGb1sTLYUry5tSXswUs9hX87xK+vxr3m/kWXlfJwSch+w1/X
	2pU/GC8qcJZ69h38w+LNVhtQDD6+RTRosHrMHhKo1d/nDWfKeRRX1kOjarfNa/I=
X-Gm-Gg: ASbGncvAkSpRe9wSwSGq6q/zze6YyH7iE3drKxvOEtyoywYjKM4YazO9/xyJwWja74Z
	AC9rQKV8hc7Yy9h+8OZVadqOyS9qyBndPx1oyC+CZR2pAA9nTR3G8j3LKE8ZG0LX9uU0lLubkZv
	Fgt2PuKu5/6g07b1eRhj90iBKLxG9gv+Bzv8NCCggjgJNZ28pBvBkePf8J7lAqL/vyR8IcZ0dNn
	ienRKv41OQoE6N1frVfXn0L2ZhkyaGYVMOa1W136wYRx2fUlozh/uSSMAt4PN6UiPyBUxBmB9eO
	FqJmZNwqVyf8S3rKWgzhLy1ESI6u8K03n7DVMLUzh2iubk+HejzWkCuOnvMV2RIvtRVpvoRNp3m
	VYygvQtE5HoPR6k+8Zd1zCjz1pus=
X-Google-Smtp-Source: AGHT+IFaaiFJvSkuFgpzRjmFl4ky713HsFznh//e5XklchpgjCOz6VUhATdj7MkI4kwAKPb/DPGB1g==
X-Received: by 2002:a05:6000:178c:b0:391:29f:4f87 with SMTP id ffacd0b85a97d-39c1211c8f4mr5516473f8f.49.1743403325590;
        Sun, 30 Mar 2025 23:42:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:143:2e3d:45f1:fd2? ([2a01:e0a:3d9:2080:143:2e3d:45f1:fd2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fccf0a9sm111590335e9.17.2025.03.30.23.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 23:42:05 -0700 (PDT)
Message-ID: <04c47466-b1a3-4eb2-8f28-95faa29ff45f@linaro.org>
Date: Mon, 31 Mar 2025 08:42:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/7] dts: amlogic: enable UART RX and TX pull up by
 default
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, jbrunet@baylibre.com, khilman@baylibre.com,
 christianshewitt@gmail.com
References: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/03/2025 19:58, Martin Blumenstingl wrote:
> On the LibreELEC forum there have been reports that Odroid-C2 does not
> boot when UART is left disconnected [0]. It turns out that this can be
> solved by enabling the SoCs pull-up resistor on the UART RX and TX
> pads [1].
> It's not clear whether that specific Odroid-C2 board has a broken
> resistor, the resistor is not populated (either by accident or on
> purpose) or if there's another reason.
> 
> Testing on an SM1 X96-Air shows that pull-ups being enabled on UART
> RX and TX is actually the default (either set in vendor u-boot or an
> actual hardware default).
> 
> This series enables the UART RX and TX pull up resistors in the
> default pin configuration on all supported SoCs.
> 
> Testing has been done on:
> - GXBB Odroid-C1 on u-boot by a user in the LibreELEC forums [2]
> - Meson8b Odroid-C1 on Linux (with vendor u-boot)
> - SM1 X96-Air on Linux (with vendor u-boot)
> 
> Please include this early so the various CI systems can test these
> patches.
> 
> 
> [0] https://forum.libreelec.tv/thread/28586-odroid-c2-gxbb-s905-and-le-11-06-or-12-does-not-boot/?postID=195481#post195481
> [1] https://forum.libreelec.tv/thread/28586-odroid-c2-gxbb-s905-and-le-11-06-or-12-does-not-boot/?postID=195667#post195667
> [2] https://forum.libreelec.tv/thread/28586-odroid-c2-gxbb-s905-and-le-11-06-or-12-does-not-boot/?postID=195674#post195674
> 
> 
> Martin Blumenstingl (7):
>    ARM: dts: amlogic: meson8: enable UART RX and TX pull up by default
>    ARM: dts: amlogic: meson8b: enable UART RX and TX pull up by default
>    arm64: dts: amlogic: gxbb: enable UART RX and TX pull up by default
>    arm64: dts: amlogic: gxl: enable UART RX and TX pull up by default
>    arm64: dts: amlogic: g12: enable UART RX and TX pull up by default
>    arm64: dts: amlogic: axg: enable UART RX and TX pull up by default
>    arm64: dts: amlogic: a1: enable UART RX and TX pull up by default
> 
>   arch/arm/boot/dts/amlogic/meson8.dtsi             |  4 ++--
>   arch/arm/boot/dts/amlogic/meson8b.dtsi            |  4 ++--
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi         |  1 +
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 12 ++++++------
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 10 +++++-----
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi       | 10 +++++-----
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 12 ++++++------
>   7 files changed, 27 insertions(+), 26 deletions(-)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

I'll apply them now so they can be tested on -next for this whole cycle.

Thanks,
Neil
