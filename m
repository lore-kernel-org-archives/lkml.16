Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E4179CD
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746609616; cv=none; b=P1bWTDgRbzZ905x9a+paHngWol6riFv4GSDTTHgmyV9zfQkM2Him8yT5MQzHeKDzW9XJ3D46KeW9VASvFuBfrkG2+O9NZNx/C6RPixGXfUQBIMgew676BRg+ve8uKNM0T4Z3Vx62b/ok58A9EGZnnhxe7Zic4M+3kTKUcdWemIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746609616; c=relaxed/simple;
	bh=0IfhmpCW/CyAYeO02o6DSgjDR85Ki9ApcScPfaeTPzg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bsP0KqKVzBTK5XzPLeH24Aw3O1iHsXvC/RIwqkaJsKvEh8GT3CLdANiB65eDoMWhDoj8aB2psZWo3OcQdqUptx01NC1nuwq/tkk/fbgvtiLjBMRyTBGvCYwGJ+PNZomlgNCWmFJ1M2/8FU8wQvvPkYH7gcxG+raBynKI2QRd/XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p16AwptU; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p16AwptU"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso4839344f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 02:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746609613; x=1747214413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1njWSRf45ZDmLxqO2qReL+xw32Jj+Gkcqkwi1/z3DHU=;
        b=p16AwptUGqrojQKPpXy1X0owBWaC2eBfD4KqlmoGiNWLKmxMMDCxHAFuF1RxaZexCp
         qLM84Cb/F4kQ7egvLMtsagatJ3bd6Z5kKck/qjyZPDRhL/tBkKgOICbB1ZKbWZQrVoBf
         i45Lh+qF7MSrLHU7TqAfzX33HjJwb4Zhyq4m34ZCSohHJpP7sqlGt6qECAPYB81t7exE
         QcZe0FyU7rBL9PobJ/GYIUmFCpkSkS7A8+L2jWC/JIc4jwLDlCki4ukYoOop9EHeHotc
         99RjDTMIspHiPYBUsq5XVNOKqfeurFS2rk4M5IRk/EfbOa5vhxViD2r8Rfh71rx8FvOZ
         Wjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746609613; x=1747214413;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1njWSRf45ZDmLxqO2qReL+xw32Jj+Gkcqkwi1/z3DHU=;
        b=VftWLWHAm9CQNHjTHOiHEB04RXTN4r96QkPjJB6yiLEUlDgIIO2VExB63xA24QbtFc
         XEJIto+seStvwF56QRGT13yOf/f/GYymgRSzzcJJcKGxVL8jWtoHhsICmZoFVc+jTS5i
         uFN+V4NvpkuT4ws/SSmB3FEgqcdtwNC9gGyrDvf4u3sWFAQE/xazgg2+BVJpWdj+uzxA
         qRL8RlG+wYndvb27KJJjOE9yIBUK8YxPJ1rRJ1QKCmgmEmpj6ijd8Z3CwB6DhtEgTN02
         TD8PDU5rA0sYOO5kRfWszNlj6K7sXEHg21au80giniYjQ1X3HcLs6rJDX1Pe1FTbBCM6
         N6Lw==
X-Forwarded-Encrypted: i=1; AJvYcCWzwB7ioh0xrA1pvxQpD0F5KM0jfT803tufRRnV2WCuRHEXSlRPOAhycdACRXc75VEcA8wQUCGs2nwfPm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoNEjA4OHZ6MMWkVd5op27A15yQzuE14byiEI21NBSUGPYZ6Vs
	/2uu6keJzaQJpURm/pHdr3bV8o8V9YnrCtDBsnkvdHE/kqgFr5GxrVduzELxAJA=
X-Gm-Gg: ASbGncvwtaZ4RPibFxVkMxsxdyFj8lcFWc1NDKn0oyzHwyhYbbrMPNERvQVeRf6txf6
	VETSVuYJSvmbh0IJ3kdbmCBQJzEZQVKgTB7RPEzLixdwxdpXmheSrbtTOhKVjNS1W0FgEi/eTn7
	ni4gl4btU1jNaN/y0NtZVDdQwzWyJMWxKbl0OW12A+bIoabWIFDlEUndfsEehkA5A4pjhxe2p20
	2W1FYz31K6/br8z2pR39awIroRQ6MrK72SdbtBHlIpZExVW4qufQXZji2IzAVWtJDBAEN0Z8E4A
	/YUk2SkHGbIOsGAIB5XD2DzmdehVicPqhuUNkAZXD3mvDKDdMC9e2kwZrCpWvlWlR6US8XUW7Y1
	2Z4vAOPHmHFT+ioHCmw==
X-Google-Smtp-Source: AGHT+IEAm8WnYpaJaFCnAIQh6i1JbL41eserYkboKFbrFiqBYvdjFP6g92MFdos53ZjJs0xJJl0nzA==
X-Received: by 2002:a05:6000:420a:b0:39e:e3fa:a66b with SMTP id ffacd0b85a97d-3a0b49bbe3amr2133655f8f.34.1746609613081;
        Wed, 07 May 2025 02:20:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:784f:3312:6406:12a9? ([2a01:e0a:3d9:2080:784f:3312:6406:12a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0ad661602sm4745706f8f.61.2025.05.07.02.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 02:20:12 -0700 (PDT)
Message-ID: <b651623f-f102-4fa3-9a21-df9f8c7d4d7f@linaro.org>
Date: Wed, 7 May 2025 11:20:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 0/2] input: convert dlg,da7280.txt to dt-schema &
 update MAINTAINERS
To: Support Opensource <support.opensource@diasemi.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Roy Im <roy.im.opensource@diasemi.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 kernel test robot <lkp@intel.com>
References: <20250306-topic-misc-da7280-convert-v4-0-2972c4e81cb5@linaro.org>
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
In-Reply-To: <20250306-topic-misc-da7280-convert-v4-0-2972c4e81cb5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 06/03/2025 11:56, Neil Armstrong wrote:
> Convert the Dialog Semiconductor DA7280 Low Power High-Definition
> Haptic Driver bindings to dt-schema. and update the corresponding
> MAINTAINERS entry.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v4:
> - Rebase on next-20250306
> - Link to v3: https://lore.kernel.org/r/20241211-topic-misc-da7280-convert-v3-0-4df87ac08881@linaro.org
> 
> Changes in v3:
> - Add conor's review
> - Also fix the MAINTAINERS entry
> - Link to v2: https://lore.kernel.org/r/20241206-topic-misc-da7280-convert-v2-1-1c3539f75604@linaro.org
> 
> Changes in v2:
> - Switched to flag instead of boolean
> - Switched the array to unit32_t, because this is how it was defined in the txt, DT and driver
> - Link to v1: https://lore.kernel.org/r/20241204-topic-misc-da7280-convert-v1-1-0f89971beca9@linaro.org
> 
> ---
> Neil Armstrong (2):
>        dt-bindings: input: convert dlg,da7280.txt to dt-schema
>        MAINTAINERS: update dlg,da72??.txt to yaml
> 
>   .../devicetree/bindings/input/dlg,da7280.txt       | 108 ---------
>   .../devicetree/bindings/input/dlg,da7280.yaml      | 248 +++++++++++++++++++++
>   MAINTAINERS                                        |   2 +-
>   3 files changed, 249 insertions(+), 109 deletions(-)
> ---
> base-commit: 565351ae7e0cee80e9b5ed84452a5b13644ffc4d
> change-id: 20241204-topic-misc-da7280-convert-20efaad588ca
> 
> Best regards,

Gentle ping.

Thanks,
Neil
