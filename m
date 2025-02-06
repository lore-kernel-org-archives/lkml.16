Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B3222578D
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 07:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738828452; cv=none; b=gL3gBI9Z8797T5Y0Hjs9T1Q5OsOqtOdcnpCvK4vbt3ujNG3LUWGSOYV102kSBUmVIUXFz5AsUcx8J3cgNV1MwW4q0NiQmK+kPQmBJHwyp8Vt+qylz0VW+/Mt3rrsGbc2K6+BYS/QCBSoYTyBNND2i/USEk5BXQOnR5wUzlQ+/6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738828452; c=relaxed/simple;
	bh=Y9WC87bLe5NehjYOXZdbt0lMGSd6u5imi7raAGHmnlI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=puEyOeWY4ac7QuuVLeky+k3J9tF4uD2Ze4lyznU5qF1V/b/xRbulQHDxbRlwX0+uHAZiuNbRkhmQV275yCwBF16jWYwjMSBb/9iC48sMS3eQT8zBBawVTdCc6UgXBtFw8J/SWN8laIelKoXDeVwXHEMBHh87LvO9Slsuo9VK4N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f46bTA+f; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f46bTA+f"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43635796b48so2993085e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 23:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738828449; x=1739433249; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+U3GhEYNSJGMFlCgGumTWq6/ff6zdU5LVaoQovoEL0=;
        b=f46bTA+fgEP+fXkSL+GMzyFtvwYIT2yEc+poTM16ziYwTCale8LeTnOEqptd8WUDyi
         OyFkAZy3FwkV4OxCw02944vff23zQo1aoxcoREe8QCqRC2lc2DMGXf6j1P1ZgBntKo1l
         ALRKP+E7THxvvmqrpIBxPGAmzDkfHY3CBm8rq0Ig8MQFRjpeidatuJ7SzEitkKx3k4is
         KG4wxIviW4v/RSK2+SyenQ8yEWnPvuWg5G3BTjga/Mp3Wb4Icyop+FC4thTqUoHso24x
         vN6B2tdv5mzgX+HXIENkrUiY94BGfGKe1BhdecaQVblWNNR7TFvq+LfW7GJu/I1XevPy
         SawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738828449; x=1739433249;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q+U3GhEYNSJGMFlCgGumTWq6/ff6zdU5LVaoQovoEL0=;
        b=V2sbxr1cSN31FetfICUH13TWGXdf8r6Q9xuTrXJDhFl18MCN6MXlrWQ6BEVs6Xkgy/
         v5R5yZkN9IZ9em4Fk3xhuyr2CsYCzxUzbVwTxItRh53fccJg0Cwx2UK9Nh08lvsYN2RT
         eV8Az86Mp9r7WTB9hn0uNs8IaJzu5rsA/67xHn4/xDJdobHz243Y2bl/37wU4+IiWvVq
         cC0G0DFqF5OuTi8dZM5vCiH5rRVzt6CDkA7QwaE4W/lk3X7CP2zbQBpadsDdVO3ZoeIX
         5GOO27WWUAelF3VZyHZc5b0x40epTZ96xOaZ5ep54gPVY1+nSEAgbRjPUaJNTALHRcK8
         ZNNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMM2gTLa9fvNviI7V0PByYRq10Q8KTR6M+bj6d8whyCQRN3r3r4Nedjb6lNcwm2+4ZZSI4hlMs4UFwFiY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3FSVmb5tPDzejdkJN4nbHyLcBdMSyFsoZVXxJcJTQZOi38+zu
	120/4G/GXXkP2CKFo/VmEBH+Qen/0ySe2Rn2vdMo+lrszVTD7YO/tltOJuOYUm0=
X-Gm-Gg: ASbGnctB8LNicgTrNPpU+Jx/XwBWxI+X2lKteidrQnrI52fKYCyXf1ELxIAfYHH6N9v
	z3/WO2Kq0lXDTJzZDjkSVaunQhkm1gXM7VOdbKx9Ah8i5ajMzl2xUzsPtbG/C/NetqQsaMfIgA/
	IkUC1JbjBsHKwrxl5SjvVNj8G4yuowvO7uCXvGDrgMI1rB+KVjavQZOInptnCBaP279LrUi01m7
	8eWeRt8CEc794KwbZx9d8fHVRKrj78S3TLpDDUSopCfZPRmfNLIdCQdZIrSEHGY+ujpvUE7oD+Q
	xVRFG35SntFp9Db1P30ZHgXsw2phT1jQxGjgxloZzTbfeosBRtkEDZxMlUB1GU1pecjL
X-Google-Smtp-Source: AGHT+IGrzW1LdzySmLH3XUvU+ruX4SLesnotJf/9MZ7S4Ul1OkUGYV9PvZdjXAlQoh8a/JyV5GRRkQ==
X-Received: by 2002:a05:600c:4703:b0:436:185f:dfae with SMTP id 5b1f17b1804b1-43912d1510emr13458025e9.6.1738828448157;
        Wed, 05 Feb 2025 23:54:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6? ([2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc050d688sm522181f8f.24.2025.02.05.23.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 23:54:07 -0800 (PST)
Message-ID: <9db01455-f3e9-474b-b87a-30f934ff6a02@linaro.org>
Date: Thu, 6 Feb 2025 08:54:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 0/5] Driver for pre-DCP apple display controller.
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alyssa Ross <hi@alyssa.is>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Janne Grunau <j@jannau.net>, Nick Chan <towinchenmi@gmail.com>
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
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
In-Reply-To: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2025 23:10, Sasha Finkelstein via B4 Relay wrote:
> Hi.
> 
> This patch series adds support for a secondary display controller
> present on Apple M1/M2 chips and used to drive the display of the
> "touchbar" touch panel present on those.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---

LGTM should patches 1, 2, 3 & 5 go via drm-misc ?

Neil
