Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DE222D4CE
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 18:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746816750; cv=none; b=Y2hySdrNRNAUt8eEUbWOMyGadUC8GItWTWRJITeAMDXwgMzf3DSknOIsrj03kAupPtTpYK+hznE0X83HDafjGunps//CYn4sHz0pVkQkwWJbdOGJ/wBHFGAl+7q7XE+ycZS0J9neCxs/E47WlJBB4MU3P+Lmb67asqg239ClO8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746816750; c=relaxed/simple;
	bh=jKGp8MUBO3NCfO8hyqxEBHtx/Kan37BD/chEtj65acY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=C7TUDX6EVZB9FCf0EsX7nEfUIdaWH2w5LcaSbZPb7kqEq80ka3eX8rjzFf8XeDdZ+U+fUZ4+A7mKsuz8G11zrH84C4VHTemlL/BAMu0QWPjTObLak/8HpWlgb7B8f2Jb2XtSaBrq2qwn0Vt7Iqr6rr+VJGRVhjiQFbJbFlGdF/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oih4Arcw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oih4Arcw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso16238695e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 11:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746816746; x=1747421546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4o6noN2eJkk0XdQVCPgCv7nvhvbBSL+3pUlcAtD0d+w=;
        b=oih4ArcwCTz0noPPL6qr/QuO8XN2Lu4GBbH58Xqt2YF5l7BVWyWGHt5flCyf7bjNiz
         nPxDNLiTwOLeOEgIFJMwMYUPnlu8UuK71WEMH5RsupOhCRNZ9s9RZHevQCSEErHct1jX
         yTOfUHZF3lj1T4QdNtgje7gjDtEpVs9yL7hzC8iUb4Xhs5Q+HXa3Kzvy6ou/zyOWJitg
         KxnTBD+2jMDnkgBWeM49P2e9Li+/7MSzFF0c1qPl0+L4oaApH71/zx+GpeLBoWMJ4WAE
         F5rs3LTDsfP8+hj5F3Ys1N/F7EQZCnHqGiwjqfpjACNJ4QZ6mJ1ZRjCv46Hsc39xkyof
         kalg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746816746; x=1747421546;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4o6noN2eJkk0XdQVCPgCv7nvhvbBSL+3pUlcAtD0d+w=;
        b=QIG7jxMatzIjHlUmy632SjaNwJgxT8UL455FsiuzN2BVGsBkFzuXyI4FY4Co3/emlq
         Je0fxUdccZcQaKyb9eyw8aL2qjWt3/b5nZ/Szm/4gMWJ2I/j15QmZJlydnhqFFkcc+D5
         Jji23nibWyYkSc/uSlgaS/kN5xwfDn5MXRfTYJ1n88oYdrBp1L6fRvYY4qTmzvOTgfTk
         Bv0YzseGM73uQtP89vgbaMkqNRTa36RIweV8Eb+tdX61g+CHsBsa2UwHou8jWrSLT0yj
         8h8dJszJjJz5g3A1XQqGImTEDgfrK2nM3IZkM9oHQEfcPj0RW0FSAq/sLOzv3bITsJ+f
         uqHA==
X-Forwarded-Encrypted: i=1; AJvYcCXEUy8f/XY/UxPdWfR9i993ioYNXxAMnu1YqjPTwnTSUsIK9lHjasTwlR80TQ6JSujczPEqWbk0DoVrgDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwORFQUcpTjXuKzpFb3UKgYbaHKkA6HvNhrVrAiT8dCmVEVGl22
	tpRkVpLTcJhkCvXJrZrxs4qWjTgVmE4wSOR5e6TWcCZR1G2cuGgN1VNxLyxme2U=
X-Gm-Gg: ASbGnctKI37trEx0eLXdKGJChELW5p9722TQPiQNSXykQNJ8o075xqR27HgovqUVP48
	MlEzN9dxWQNYz5c2+pih4WVN3FK6wLvNKlrK5hhlkdeFCj23kE4kHhRbsLlBBKJUdqSMYcIE4zs
	GfiXehJe0S1DvZloqXz61LRORdIQAfbZ3HUH0HC8KKnzOIYt4R3EJO/5OVPuUdc0kG87TVhpgBk
	XzSrFGPDDhs+tuvGxFF12DenrNUBeYf2lTpBG7F7CeINo3iPPW8o/Ct9u5MmSrSfBSOji20swgR
	A2WuqH2S5+/Xu8ndP1JDN2cKclExytDtMQ/eWFHlEtk55UjOErqUj4VKiNiSST/GOF82XpjycHU
	88iXox1C0r5cnyUzxja6zckrksSnX
X-Google-Smtp-Source: AGHT+IEkES7QrrP7dWUS3r90TTqs9H9HF3Qrg1w8ITbxBVl4k60rc9jJMmKmLI9AOkx38FcFHuyvrw==
X-Received: by 2002:a05:6000:2088:b0:3a0:b448:e654 with SMTP id ffacd0b85a97d-3a1f64e7509mr3877389f8f.47.1746816746484;
        Fri, 09 May 2025 11:52:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:5929:59ab:840a:b8f9? ([2a01:e0a:3d9:2080:5929:59ab:840a:b8f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2ffsm4085907f8f.66.2025.05.09.11.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 11:52:26 -0700 (PDT)
Message-ID: <8ebe2bc3-dec0-4879-a61c-630b96bc4bec@linaro.org>
Date: Fri, 9 May 2025 20:52:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/meson: Use 1000ULL when operating with mode->clock
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: I Hsin Cheng <richard120310@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, khilman@baylibre.com,
 jbrunet@baylibre.com, christophe.jaillet@wanadoo.fr,
 skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250505184338.678540-1-richard120310@gmail.com>
 <6d2f35ee-1b33-40b6-b164-ab4480110e49@linaro.org>
 <CAFBinCDmHhF7=-dutXT6RE9hVzfN3akLicGkQKw=Arm8bq2NKQ@mail.gmail.com>
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
In-Reply-To: <CAFBinCDmHhF7=-dutXT6RE9hVzfN3akLicGkQKw=Arm8bq2NKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/05/2025 20:27, Martin Blumenstingl wrote:
> On Fri, May 9, 2025 at 5:35 PM <neil.armstrong@linaro.org> wrote:
>>
>> On 05/05/2025 20:43, I Hsin Cheng wrote:
>>> Coverity scan reported the usage of "mode->clock * 1000" may lead to
>>> integer overflow. Use "1000ULL" instead of "1000"
>>> when utilizing it to avoid potential integer overflow issue.
>>>
>>> Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1646759
>>> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
>>
>> Could you add a Fixes tag ?
> Fixes: 1017560164b6 ("drm/meson: use unsigned long long / Hz for
> frequency types")
> 
> Neil, can you add this while applying or do we need a v3?

Will add while applying.

Thanks,
Neil

> 
> 
> Best regards,
> Martin

