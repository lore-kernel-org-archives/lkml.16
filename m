Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0DC283FFE
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747151744; cv=none; b=ryXSMXhPhBDX4u276rZcNAgYHR1H88Bi9uJnmDLlgKAvTm8sRAxPVWo9mZBwqibDomocqh4TL+8XWScbFOTgNCwdZZLhAOOp545p/u/cmkJ5+luNti+0SOIuicapgpxlfALNrfBFl0nrWlit0tExTIWYtR/E08uOi/AKnjO5Ht4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747151744; c=relaxed/simple;
	bh=eGltrePgbEfScwAvIiVTApUMVHXzbSkcibEYr1Jy4jY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JLMQTp5qWUxYjZRa5bqRZHQBCb7WJah5Gn7uNCLmZ7sh2qdZQ1fyzslSHwpGmxPqneRWNPAc3wOFZpVo3vH2EzehAZdh4jr6mrlDxrF5t0cdmOPOy83ZDIAqBU4bR82PKBe+Iupn1qjXLhN3XsP67O91EHMJW/DVQr8AbVjjGNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cjy3iAsg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cjy3iAsg"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so43090205e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747151741; x=1747756541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hraPAlVA6BtCdVBhxio5JSA2L2Pxes4RZggz7DCbmcA=;
        b=cjy3iAsgVMZNDdD7qLx1w/w+Kvda0sBnV5TQCZFWm3hOx1v57GhDIjwsIrNaEuTYPc
         6JDJo5IH9ThCGQkExmQNvlRCRqzOJffpnY4/daapSB5JFYjYxfb6ZnsJqwW/redJChTI
         nHff/A6UwLy8CAZtfPsYlK5OR5Hy0DSeNy+yZTfUNHCxuqS5R6tmqFKYodfnUtsBKx1Q
         t+SbeWLLW9LdhbGbHlGt7oUBnt1o/pGgjkMcX+gu5edMIQgRvDo96PsS0YzNajItXC1j
         NV6mNVCmPDLmF8lAipiLwfF40QCb+aa+2F//MYg1IwEBGaevfxud0qTqQEP7Juba0awd
         c7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747151741; x=1747756541;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hraPAlVA6BtCdVBhxio5JSA2L2Pxes4RZggz7DCbmcA=;
        b=JBRsEIpsgA1djxaH4cuUfSd7tLOz/yFKIGnPXCO/0BFxy/6a+/LaiJjjZCcTe38HTd
         m+7hea6gVKLXaFBjGesGBKuhgg0lhEqSGifjGQXu2SJZE5gbzCUY5Dot8ynB3EffsGyc
         dFJsZgyzVf2SRzZHF/hQ4q0Lu/97YPVwmMfF7GssVKzGpPC3nMST30mEiNFAzDz+iW/U
         IN809fwp7v6gUjAASLI72iM/27oRj7XHOiF68vg7gSJuN6pi0UCm0rzv7EfDUjrUDdM8
         GUUN1e1+g0Og00XiaAktb0IG85LRD8EY2vAVKXGnU8yvzyeJxO42l59c0Yt9oXjjb7aS
         cTcw==
X-Forwarded-Encrypted: i=1; AJvYcCV3gkbt51YSsMCd7fr8ICTr15z2XbXQ278LJQdO74UvLE8oo5RcjzQG/9iOqXaLfpl5/6xJnfJ46Hb4848=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYeay1S4mc21Z42xTKSTaZIozsNHeohrlVdhHCZbV4+QJ/Erfu
	FpQRo/0oTVO1TMgy8GOAhNu3Fvgs27FnpDUgVHX3OU/42KzJvooGUjvBZlOHlm4=
X-Gm-Gg: ASbGncu/Y5/JA1tIFQQlP6e6mW/XobaWtdUbOVGm/KdS8jcRaNmcUP18FCnyi+gz4Yn
	zNvH6JjflRMNMLeqqZhvFcbQ7AQUB+IVvRoi+mSNOdaHk4MzZi6P57lzEp5pW2k63a753nk8FdW
	W34GG2ldd9HsrEisBoIUCCCFRRj/Ms10TMM0FDNGr5juPy6t168AT9jnC5CneEqSInfYJkpNodv
	K4KP8DZ31omCIy7JCxUOFubD3KMchx9Uld7qKbSrtCruCwNruSsb7o78EcQYup1qHwCyFnZJSoj
	FiqgPZsch2T8vj1cbSq8qY9TEsOJp70zC9N+hwkIdcuQOt+XzSDols3RkVi6A1ghAie0Zxc4jmW
	5xSYGZg7BxjB6IwW0R06Aj3U=
X-Google-Smtp-Source: AGHT+IEsyluhpdUeyif3Ngd/ehW9ch6ZNKiHvT0522EK1VSzg20AmctXdpF2lUykleTEOTSKiVXBbw==
X-Received: by 2002:a05:600c:4e48:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-442d6ddd1e1mr154860845e9.29.1747151737648;
        Tue, 13 May 2025 08:55:37 -0700 (PDT)
Received: from [10.61.1.139] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32835dsm217742585e9.6.2025.05.13.08.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 08:55:37 -0700 (PDT)
Message-ID: <919fa7f1-d198-429b-8f31-70f085a4c79f@linaro.org>
Date: Tue, 13 May 2025 17:55:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
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
 <b090cef6-5b9e-4149-872d-0316666f9e90@linaro.org>
 <714a719a-9e56-4158-a8ce-118b7ddb97b3@collabora.com>
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
In-Reply-To: <714a719a-9e56-4158-a8ce-118b7ddb97b3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/05/2025 16:26, Vignesh Raman wrote:
> Hi Neil,
> 
> On 13/05/25 15:25, neil.armstrong@linaro.org wrote:
>> Hi,
>>
>> On 13/05/2025 11:41, Vignesh Raman wrote:
>>> Hi,
>>>
>>> The Amlogic Meson G12B (A311D) SoC board (meson-g12b-a311d-khadas- vim3) fails to boot with the following logs,
>>>
>>> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76210200
>>>
>>> 02:58:27.819: Starting kernel ...
>>> 02:58:27.819: "Synchronous Abort" handler, esr 0x96000010, far 0x51000d8
>>> 02:58:27.819: "Synchronous Abort" handler, esr 0x96000010, far 0x51000c8
>>> 02:58:27.819: elr: 0000000001002a48 lr : 0000000001002c88 (reloc)
>>> 02:58:27.819: elr: 00000000f2f26a48 lr : 00000000f2f26c88
>>> 02:58:27.819: x0 : 00000000050fffc0 x1 : 0000000001004383
>>> 02:58:27.819: x2 : 00000000f2f6a358 x3 : 000000000000003f
>>> 02:58:27.819: x4 : 00000000f4fefffc x5 : 0000000000000010
>>> 02:58:27.819: x6 : 00000000f4e5b000 x7 : 00000000050fffa0
>>> 02:58:27.819: x8 : 0000000000000008 x9 : 0000000000000001
>>> 02:58:27.820: x10: 0000000000000010 x11: 0000000000000004
>>> 02:58:27.820: x12: 00000000f4fefc00 x13: 0000000000000000
>>> 02:58:27.820: x14: 00000000f4fefc00 x15: 0000000000000000
>>> 02:58:27.820: x16: 00000000f2f6d0e0 x17: 0000000000c0c0c0
>>> 02:58:27.820: x18: 00000000f0f21d90 x19: 00000000050fffc0
>>> 02:58:27.820: x20: 0000000000000000 x21: 000000007ffe9000
>>> 02:58:27.820: x22: 0000000000001710 x23: 00000000f0f0e8c0
>>> 02:58:27.820: x24: 0000000000000000 x25: 0000000000000000
>>> 02:58:27.820: x26: 0000000000000000 x27: 0000000000000000
>>> 02:58:27.820: x28: 00000000f0f4f790 x29: 00000000050fff60
>>> 02:58:27.820: Code: a9025bf5 f9001bf7 f9400641 36000141 (f9408663)
>>> 02:58:27.820: Resetting CPU ...
>>>
>>
>> Could you boot with earlycon enabled to at least have a clue of what's happening ?
> 
> There is a synchronous abort right after 'Starting kernel...'. Maybe this prevents any early console logs from appearing.
> 
> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76243455
> 
> 13:54:02.013: => setenv bootargs 'console=ttyAML0,115200n8 root=/dev/nfs rw nfsroot=192.168.201.1:/var/lib/lava/dispatcher/tmp/18641665/extract-nfsrootfs-h2fjsmdc,tcp,hard,v3 init=/init rootwait usbcore.quirks=0bda:8153:k earlycon=meson,0xff803000 keep_bootcon  ip=dhcp'
> 13:54:02.014: $ booti 0x1080000 - 0x1000000
> 13:54:02.014: => booti 0x1080000 - 0x1000000
> 13:54:02.014: Moving Image from 0x1080000 to 0x1200000, end=5160000
> 13:54:02.014: ## Flattened Device Tree blob at 01000000
> 13:54:02.014:    Booting using the fdt blob at 0x1000000
> 13:54:02.014: Working FDT set to 1000000
> 13:54:02.014: ERROR: reserving fdt memory region failed (addr=5000000 size=300000 flags=4)
> 13:54:02.014:    Loading Device Tree to 000000007ffe9000, end 000000007ffff57c ... OK
> 13:54:02.014: Working FDT set to 7ffe9000
> 13:54:02.014: Starting kernel ...
> 13:54:02.014: "Synchronous Abort" handler, esr 0x96000010, far 0x51000d8
> 13:54:02.014: "Synchronous Abort" handler, esr 0x96000010, far 0x51000c8
> 13:54:02.014: elr: 0000000001002a48 lr : 0000000001002c88 (reloc)
> 13:54:02.014: elr: 00000000f2f26a48 lr : 00000000f2f26c88
> 13:54:02.014: x0 : 00000000050fffc0 x1 : 0000000001004383
> 13:54:02.014: x2 : 00000000f2f6a358 x3 : 000000000000003f
> 13:54:02.014: x4 : 00000000f4fefffc x5 : 0000000000000010
> 13:54:02.014: x6 : 00000000f4e5b000 x7 : 00000000050fffa0
> 13:54:02.014: x8 : 0000000000000008 x9 : 0000000000000001
> 13:54:02.014: x10: 0000000000000010 x11: 0000000000000004
> 13:54:02.014: x12: 00000000f4fefc00 x13: 0000000000000000
> 13:54:02.014: x14: 00000000f4fefc00 x15: 0000000000000000
> 13:54:02.014: x16: 00000000f2f6d0e0 x17: 0000000000c0c0c0
> 13:54:02.014: x18: 00000000f0f21d90 x19: 00000000050fffc0
> 13:54:02.014: x20: 0000000000000000 x21: 000000007ffe9000
> 13:54:02.014: x22: 0000000000001710 x23: 00000000f0f0e8c0
> 13:54:02.014: x24: 0000000000000000 x25: 0000000000000000
> 13:54:02.014: x26: 0000000000000000 x27: 0000000000000000
> 13:54:02.014: x28: 00000000f0f566a0 x29: 00000000050fff60
> 13:54:02.014: Code: a9025bf5 f9001bf7 f9400641 36000141 (f9408663)
> 13:54:02.014: Resetting CPU ...

In fact, this is an U-boot fault, not Linux. I guess perhaps the Linux kernel is too big, can you check the size difference since v6.14 ?

> 
> Successful logs with v6.14-rc7,
> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76248143
> 
>>
>> BPI-M2S (A311D) is booting fine on v6.15-rc, see https://gitlab.com/ amlogic-foss/abcd-linux-test/-/jobs/10004997032
>>
>> But perhaps something specific to the VIM3 is breaking, do you change the kernel config for the DRM ?
> 
> Yes, we change the config. Please see the config used to build the kernel,
> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76243439/artifacts/file/artifacts/testing:arm64_config
> 
> Regards,
> Vignesh
> 
>>
>> Neil
>>
>>
>>> The board boots successfully in v6.14-rc7, but the issue appears starting from v6.15-rc1. These tests were run in drm-ci.
>>>
>>> On bisecting the kernel, the first bad commit identified by git biscet is,
>>>
>>> 59c35416f4246aee66b5f5523fdc950b83325d82 is the first bad commit
>>> commit 59c35416f4246aee66b5f5523fdc950b83325d82
>>> Merge: 472863ab2aca e988adcb5dee
>>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>>> Date:   Sat Mar 29 17:23:34 2025 -0700
>>>
>>>      Merge tag 'clk-for-linus' of git://git.kernel.org/pub/scm/linux/ kernel/git/clk/linux
>>>
>>> Please could you look into this issue. Thank you.
>>>
>>> Regards,
>>> Vignesh
>>
> 

