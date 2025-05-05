Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F74207DF3
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746448036; cv=none; b=GiuHfHPdoeXb3xtHQABEji1WBw7kI+u3dwOm49/7mFiDNAF9WrXmHoerrxeuoxaBLBjk2WRXaDyxszGIa83YRyK0y15J5ESbIxHMdRH+rv6LUd0RtZBew4xA/96DNwLQtKO9nAdbW7eo8VKL8QWp6xll42v7138m/PylFWVwGUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746448036; c=relaxed/simple;
	bh=CdXqZfS379HfHgvUhjrczecr3wjqqbB6lHwHSC6JfLs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IPWE9DVXifEHWSdmo8ckMmklr9TOlVr/L5i3zJWT4nyePb2W22w4qGUlv1rujAhA3AKwcNBNQyb2sbGzxQ5Th0QK7b238Eq6+Od3tXK4dxE39tMY0oQLtx19PIv4nrzMomgkskShi81flMJDqhTTkPu8I8YKVoOEsJshJdttHg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Op9b2e3R; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Op9b2e3R"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so24039825e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746448030; x=1747052830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arGOTRxxQGxdufIP7mOjGnR0k9BV+lEtA30jWrv6jWI=;
        b=Op9b2e3Rn5JKk96C7Z7AJWSvXPY7OLZbNXmlL07a4he3MDTPi/FNik4ARM+pxWBkjh
         KjarWVpYoATYnKj60i4Gw4GQ4iSzo4MR1UK8DkYiLhVmwR+hJC1ieVcU1a2I1Xy47bmQ
         bMtettYEa+qRi8OJJhlBzBe04z1AHX6a7jYdPH0My9uAW2ITa05lqke5lG9eNulkJ8gg
         kvcLMD01y8L8tSyg6Y2W2Z99b9wTNg3GX8mpW348nUWsWTio+I9xWE7MRW2PDGi2Gifq
         sEKLDCg551mU0JQSBH1934rULvJ1TvSvxHN5cLnSQRCSt9JhxcHFH9BcTahmLIXvrATw
         kD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448030; x=1747052830;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=arGOTRxxQGxdufIP7mOjGnR0k9BV+lEtA30jWrv6jWI=;
        b=XWcPuNfrXcY+Pxgnq3ODh2I1RBYb7C9lUlOxunr+jwb9MBc0hNd4CVnNIV4ZiLsZ43
         F48Hy3UPKJcQgiVvK3tMtL67sn1Raw9ME0SMBa8axigJv8erg9EpKOoF/pB2pUMOokLq
         mTwiL3x06qiP9fzEC1CQAym9ZiwPk1Q3rH0hhSR9rlMX1/MPQcbUqI4q1s5GmzqYZIvZ
         QvpV2WXG1Mu75K4bT/gbtPn/RTG86uJbx4NNmVpc1mq37dgy/ESGbZ2fwyhgAMo4GgT6
         Y/LmV0KZSPjUp1uZgupfIfrjiqlRBNAg2NknqlcSlWHXpbZZRAHUi5oQiIAw600p5AcY
         OjPg==
X-Forwarded-Encrypted: i=1; AJvYcCXMP8UwUAzBReMYyRNWfK4FYjnbwDP6bO2TDcOIoffyu9bzou5jHYk2rYamHnnu/fQxFm809KJLm//CX3I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4hKxL5MR/qjzVDFJpoT0V+DADHm1b4MJsYdBeogiFQMKq5PSE
	SIf6MIRhNlwTlyL3fa+9/TJp/sQDfkwLCe5oJ+JXCuvXZbOo2LgRVMGnigQZpuI=
X-Gm-Gg: ASbGncunVvOpV6DUct1WXoxYJEntnHoItFpH5Z0vXbwKZBPSdqGz+e/ZuGd5OB6aCFL
	Ey3xgll0GNCMcd3nExYIBZyEa1nHNgDGf518x7OkEVrVJHo+fs8qBkXOufcV21Zeqs37tzHF0RU
	A+PBQPK3HAQ/GVHyT7zdIJv19NFsZ6ryMdtyJUhT9FJFIrfjGaMWiXETG+w4LSh2Y3aBZZeGQy0
	ttk60KILyBF+FIsH7C/qWcapMsXWxvSHXIiYFjkOVWYymwxudtrBlJg90rQfTp3tkiloKzjNT3G
	E4dX6BL6HfvqdmqqmmNMhCylpcygU2rJnsLw2jY83yqHUZfVBy+UysGC01sQmxXBVBElTp6aHfU
	zKIQnruC0Oysjy9wkRQ==
X-Google-Smtp-Source: AGHT+IFm2SyHRklCMik4gXiE1LX4P+NZ/5+Q1oS9l11EEYCjGjJr25WUs1UtRqMbm9RVF5FQ86htag==
X-Received: by 2002:a05:600c:a0e:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-441c48dbf8emr63030125e9.15.1746448030489;
        Mon, 05 May 2025 05:27:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3? ([2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a31695sm133485665e9.40.2025.05.05.05.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 05:27:10 -0700 (PDT)
Message-ID: <75104e42-282d-4a63-be0e-07a5c6fdf276@linaro.org>
Date: Mon, 5 May 2025 14:27:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250425203118.1444481-1-da@libre.computer>
 <20523c9e-f7de-4355-82ed-380ee03083f0@linaro.org>
 <CAFBinCBiVQqeYTmR3sj++E8CqQXSMsOzhafAV0JNgDVR9OU7ZA@mail.gmail.com>
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
In-Reply-To: <CAFBinCBiVQqeYTmR3sj++E8CqQXSMsOzhafAV0JNgDVR9OU7ZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/05/2025 23:03, Martin Blumenstingl wrote:
> On Mon, Apr 28, 2025 at 9:32 AM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> On 25/04/2025 22:31, Da Xue wrote:
>>> GXL I2C pins need internal pull-up enabled to operate if there
>>> is no external resistor. The pull-up is 60kohms per the datasheet.
>>>
>>> We should set the bias when i2c pinmux is enabled.
>>
>> So, yes in some cases when the on-board pull-up is missing, the on-pad
>> pull-up is required, but the whole idea was to only add the pull-up property
>> when needed.
>>
>> So I know the real motivation is again about the 40pin headers, where
>> some applications don't add a pull-up and still want to have i2c working.
> For SD/eMMC, SPI and UART we have pull up/down enabled in meson-gxl.dtsi.
> I can't recall if I have asked this before: what's the rule (of thumb)
> for having bias-pull-up/down vs. bias-disable in .dtsi files?
> 
> In the past I had to track down incorrect bias.
> It gets especially tricky when we don't have schematics and there's no
> u-boot sources available from the vendor (I know, the latter shouldn't
> be possible - but that's the world we live in unfortunately).
> It means that we can end up with one of four cases for the bias settings:
> - there's an actual resistor on the PCB (pulling the pin up/down)
> - hardware (SoC) default for the pin
> - vendor u-boot configures bias for the pin (but we don't know because
> we don't have the sources)
> - vendor Linux configures bias for the pin (at least we can dump the
> .dtb and hope that the bias setting is in there)
> 
> That's why I lean towards having sane defaults in the SoC.dtsi (it
> seems that rockchip does the same?).

Right, but in this case the biases needed for i2c is rather easy to figure out,
and the very weak 60kohms on the pad won't affect i2c if a proper PU is on
the PCB. So I'll pick this one, and yeah a similar one should be needed
for G12/SM1 and newer SoCs.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Neil

> 
> 
> Best regards,
> Martin

