Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410111EB5E5
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130141; cv=none; b=UwjBp4FoFxJ0ZsO0jw5JMPP2ovdZvCiJD3cT6aaFD4K2yTdCoM0jeK1yepEvYZNPkhlXzEgHjKrveSHUneSGvW+caayLQLbzj+oFRk46WXM4OqaDjnEsY1NwEGHHK0jYUVnNVj3OSM8fAOfShtzK3LSmJ7Rya8o3ePSDW6tTsE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130141; c=relaxed/simple;
	bh=6r+wIPDzJ9Sa2sxcUMF0gAex/x93ghfmoHosvyP/w3A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bh8eTNroLRJU/wdGi18c+s4iDM830suREmXrMww9plnH1fEITYkmzNJNmSpRF2HFcE+MYfMGm8Szt/+8SJAL47Q3Wz5ZGNtnpENxcnjLTrA2x1vyIbvJm7nVQ7PxOCiFM4Q2HcJ4AI6W5UeF0ZrtW1BuCHEJSW6vC3bjaWXqTmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y/Ub+Ozl; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y/Ub+Ozl"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-441c99459e9so36397985e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747130137; x=1747734937; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2a2UHdYAk58d8k4bpqZnst1+U78+dixXgzNfhERVMo=;
        b=Y/Ub+Ozl6H6hpvvqlWOXdiughwx+8wL6VjV+ixoHMo5wf6T2Hiy9ui4XM/YBNE7Dav
         a5mXLNt2pBuH91vljmBvxWS6eh2+zdH1/OJr2QoL18G/9NAjvdhIyX1AEyUq0beQ+Ium
         BAMdom5yOGxjdhYGN4MclZKxTEiShpXPm0xMWolUJabZ69cQT0X6CdiNYhGmzjcMDXJk
         78aweP76QdcRARP7H4RaCqqpWB1dAnfpzPn4vKln75UP5stEduPWy6NTLJi9q8YKXowy
         ubhIQJVG7gQHNFF68211tMjlzGkfVGutKJt4pJrxSv6wTbTfDpsm5LdAPbZyWZxbejnk
         sz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130137; x=1747734937;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B2a2UHdYAk58d8k4bpqZnst1+U78+dixXgzNfhERVMo=;
        b=QLOQBob8U5kI/FszrzW79W/nMHpsJ/QUnDnPwYAPThUhJslHvXbiiCect9MRTTKQcT
         BmDotezWNcXd1kACjojLS1tjF0iI2ppBffZpazbKXang5LG7swSKJ3oN4G3RTfLArbmy
         ICF1PmhrAHIiPQtraKBaiHicmgkMunqaO/qdHcxckhrY8LQq3sxkZiEIKlpSb/0Htg9D
         N63aOjSxVskerGPbPL3k0w0QS6IPWwjkYEv/afSt3IY0qD7+6igs3F4KtDzZmScQJ8D/
         UeHA3WKzx5bn2WFQG9VeNxGo4Uu10vvw1DY3bgA9kDOrVkuZxIjDw+oxXrFAHaMuy02p
         MSNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3QoCwC+qOwkFtF0DbV62zHrSRqnf2T44PB1V9vBvN8UP5ckTw87oONRKmbFV23qfWJPwsJI6dDfj83j8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9n8GWQcvAtHJurxhtPGfI1roz3DqyDOcD+NzJYrCbSN36Lywf
	biPXLxUIgqMiJUBw9MH3v4e0DCwBM6EMP7hDrOBSwTZAbz1/4R2pz0IISNmU9A0=
X-Gm-Gg: ASbGncs9rajq1KBXZPXx2lpQB7x0IWIQ/EbJsDFBKZawt3LiXvOMUICCk7NU3p8s832
	h+m34N/FMVRI9dfZoeB17O8ai6dFMU4U2E5wMbg6tXcNpPIk8VDcyN7eJEx23fs8CRNv7ZsVhyW
	Fk0NUSmvu9FBaAtg7kFBHyXYFPbI7SAmeEhIF6Yke0ZrqKtj66zu0VlVAWrieucVbosOqxlpZ1V
	F+4sDuucHcE757R5p0H9zlq/B7JeqXvZfknX6TMJ9GYLpA1hyigO//iTb6txrITzhZdwn57Q8oe
	U19earvDDDs7GuJnTW40dbIGWHAbQklG77iMyM3V1zYaOtq06m9puaf3qqqwpOhLGb4sZFzCIBC
	aG35MZhgTrAUu
X-Google-Smtp-Source: AGHT+IHLCcNUV1+oQboYgA3SkbfN85gAOCapDtK/POQGga3hETjWJtXjQgemjr2/TZaqn6DWWyppTA==
X-Received: by 2002:a05:600c:6090:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-442d6d18bfamr148650455e9.5.1747130137461;
        Tue, 13 May 2025 02:55:37 -0700 (PDT)
Received: from [10.61.1.139] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32835dsm205893815e9.6.2025.05.13.02.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 02:55:37 -0700 (PDT)
Message-ID: <b090cef6-5b9e-4149-872d-0316666f9e90@linaro.org>
Date: Tue, 13 May 2025 11:55:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: amlogic: Synchronous Abort with v6.15-rc6
To: Vignesh Raman <vignesh.raman@collabora.com>,
 linux-amlogic <linux-amlogic@lists.infradead.org>
Cc: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, sboyd@kernel.org,
 daniels <daniels@collabora.com>, Daniel Stone <daniel@fooishbar.org>,
 lumag@kernel.org, robdclark <robdclark@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <eb9281cc-de91-48a4-bbd6-f67ddc67a9dd@collabora.com>
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
In-Reply-To: <eb9281cc-de91-48a4-bbd6-f67ddc67a9dd@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 13/05/2025 11:41, Vignesh Raman wrote:
> Hi,
> 
> The Amlogic Meson G12B (A311D) SoC board (meson-g12b-a311d-khadas-vim3) fails to boot with the following logs,
> 
> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76210200
> 
> 02:58:27.819: Starting kernel ...
> 02:58:27.819: "Synchronous Abort" handler, esr 0x96000010, far 0x51000d8
> 02:58:27.819: "Synchronous Abort" handler, esr 0x96000010, far 0x51000c8
> 02:58:27.819: elr: 0000000001002a48 lr : 0000000001002c88 (reloc)
> 02:58:27.819: elr: 00000000f2f26a48 lr : 00000000f2f26c88
> 02:58:27.819: x0 : 00000000050fffc0 x1 : 0000000001004383
> 02:58:27.819: x2 : 00000000f2f6a358 x3 : 000000000000003f
> 02:58:27.819: x4 : 00000000f4fefffc x5 : 0000000000000010
> 02:58:27.819: x6 : 00000000f4e5b000 x7 : 00000000050fffa0
> 02:58:27.819: x8 : 0000000000000008 x9 : 0000000000000001
> 02:58:27.820: x10: 0000000000000010 x11: 0000000000000004
> 02:58:27.820: x12: 00000000f4fefc00 x13: 0000000000000000
> 02:58:27.820: x14: 00000000f4fefc00 x15: 0000000000000000
> 02:58:27.820: x16: 00000000f2f6d0e0 x17: 0000000000c0c0c0
> 02:58:27.820: x18: 00000000f0f21d90 x19: 00000000050fffc0
> 02:58:27.820: x20: 0000000000000000 x21: 000000007ffe9000
> 02:58:27.820: x22: 0000000000001710 x23: 00000000f0f0e8c0
> 02:58:27.820: x24: 0000000000000000 x25: 0000000000000000
> 02:58:27.820: x26: 0000000000000000 x27: 0000000000000000
> 02:58:27.820: x28: 00000000f0f4f790 x29: 00000000050fff60
> 02:58:27.820: Code: a9025bf5 f9001bf7 f9400641 36000141 (f9408663)
> 02:58:27.820: Resetting CPU ...
> 

Could you boot with earlycon enabled to at least have a clue of what's happening ?

BPI-M2S (A311D) is booting fine on v6.15-rc, see https://gitlab.com/amlogic-foss/abcd-linux-test/-/jobs/10004997032

But perhaps something specific to the VIM3 is breaking, do you change the kernel config for the DRM ?

Neil


> The board boots successfully in v6.14-rc7, but the issue appears starting from v6.15-rc1. These tests were run in drm-ci.
> 
> On bisecting the kernel, the first bad commit identified by git biscet is,
> 
> 59c35416f4246aee66b5f5523fdc950b83325d82 is the first bad commit
> commit 59c35416f4246aee66b5f5523fdc950b83325d82
> Merge: 472863ab2aca e988adcb5dee
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sat Mar 29 17:23:34 2025 -0700
> 
>      Merge tag 'clk-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux
> 
> Please could you look into this issue. Thank you.
> 
> Regards,
> Vignesh

