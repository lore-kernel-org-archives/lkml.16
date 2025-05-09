Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B637A274FF1
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746778537; cv=none; b=PVWBoAcJ5o1+awCaGvomg0uOvoU+qtkcEeyWsvgUW2Ff90JlPZATA0IZFf63kz63M8jT/ik/NDfRCQxvEGoOKIaiGJrDr4wE6EduaMeON6KhEvLQsiqw3bdCNIJffidpa8njRY0RAF+hk8dmS/vCZbGEHg2Z95XcnvyVYdAAh2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746778537; c=relaxed/simple;
	bh=53k1bb+mJ3qsL4kzwOxYKtUrGTD3Qs5J+gmDVo+8V2s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VeEYEcpuyK572oJ/KKkMEITdJLAxlqDJJ8l1FpW7v6EG2dedRVkGOTPmHzrQtrurrRvk2e+tTa6rqCHMcUm22FrbureFxkJE4AGl2dAjPAd0Y6bxmDhUCUy5cD46qdL/Kr6bvHUXPn6Jdsoxnqzh6N2AwsjSDuJeAo+VyPPvbic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UloKp+yD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UloKp+yD"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a1fa0d8884so169812f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 01:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746778532; x=1747383332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQqNQfb98CXyg7DS4T6FEcP7L7We2XHuPfj9eq1OXqI=;
        b=UloKp+yDpHj6pNUrnzML6DiuchXNKRPVM8WEPgUcSWoT7VQrJfbU+5X1LyqUqokvX9
         5RneEMNe4MfrvdrdHvUtsRcxQbgP+L7+7T7cs5EM7NGu2TtAcXNEGc3oU2bpdzRTwrE6
         9q9YRbWK9z7c+lodS5PqD4logms3Whh5Zrhw/MzbC9mDlnW7c+2MkfOW48c42q3v+ybj
         IsqJwotUzK5jcPsWroBGlsjegxnb8+B3orzEoxiduhvSoQWY7dEXzlg/QRGLq6EiWuCf
         CKaZtwNEju+aEz/qSR8vXhSWFAH5/H/JzNv3UgYSeYUp5b2yeGkL8BPrjZ7/M1pZpQOX
         AfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746778532; x=1747383332;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xQqNQfb98CXyg7DS4T6FEcP7L7We2XHuPfj9eq1OXqI=;
        b=JpAfG7MDCjTV00dT/9feXrqrssyH9EtEG7EJj/irxyQs4xAmf51dYuLvAc1ctynq1Q
         X7+7ic+XwCQ1K6kSI7nIycVWcrhOMaN06IZgK5qlPFNNAAQ5HvmR5b1cQZHTlHBx+6hT
         HvMQaqBZIfwLfZFsTSUHsmwyn8lbjks9R7RXyc8B3U9mEgQUc22AVPcyV/Vnauk6qWhi
         LA3BIOancEae/WJOoqK9xugzuS/gmcNzbAXEXRyoWMv/RNPKon64t6y0sNn/upA/O3rg
         R3VtrRlOCJUv7e0xkeARzMZh7kIcdOdAPL4o6/paRMb7IskPhg7tMFv5SroIc1vPT9tC
         Uwiw==
X-Forwarded-Encrypted: i=1; AJvYcCWxTv0Blc10LoVTc/naHaFPx5jMP4W1peAxDHZHNEX2K6mZ9VOLlqZS35VrqnS9aKgwYFDzvEjDs5rZ81E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuPPCXmhqT5KIxmRo1+nqDmt1XZZfEHIKRcKYBuOU4czRgCIJ2
	Z68Hdp6W7rV9QaGkGfgJW9lRsUiqj+y2q1d9dc14UOpbJ9+SQbeyIYfebUabvE4=
X-Gm-Gg: ASbGncsBRNJxVYvHROgcg3joXxGqc4mvwha9oA3OuHjfqZbS5Sew5MR6cWOFRAgpB/l
	glvYL4ZDGZzCIxYObsYkHAx2TNRZJGKd7vwQGSLKe+bg2jq+c1+evpYzJSwhg500D7+8v2PpULh
	PZ3yl2J25p2+BwupAguM2V1JU3oTbtUFXfM14/NF+BhBtZ6+ZlpLTHCw+dpDp/ZIUytk1ITLwHQ
	DxmoBngwmH4tX9RgQBeS2WFR4LSRI6Bx3CirGG6P+gh7tqVmWzH7Z5Op7Qj4GOxARrdOfG2Gync
	LYODAktlhf1/s4swlIEFfwrX9BKWRRPba2b3ft2TzPJLyiP/sISslvinkzDRxTJP71KaMDyQUy4
	ZeoZEe6HT2ZSnUQY=
X-Google-Smtp-Source: AGHT+IGhiVJNvcqMrU0InQH4JUkP6DSb7hRhPfn50K3Ki6unViIuhRpR4yC9R8MjSnwi8i9+guCQmQ==
X-Received: by 2002:adf:8b53:0:b0:3a0:b1de:1be0 with SMTP id ffacd0b85a97d-3a1f6466002mr1603705f8f.31.1746778531887;
        Fri, 09 May 2025 01:15:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:22d7:71a:9f62:f7e2? ([2a01:e0a:3d9:2080:22d7:71a:9f62:f7e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f3afdsm2524877f8f.60.2025.05.09.01.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 01:15:31 -0700 (PDT)
Message-ID: <d6ae53f7-0250-4247-8109-4c3729f0cefa@linaro.org>
Date: Fri, 9 May 2025 10:15:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: visionox-rm69299: support the variant
 found in the SHIFT6mq
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>,
 Caleb Connolly <caleb@connolly.tech>
References: <20250507-topic-misc-shift6-panel-v1-0-64e8e98ff285@linaro.org>
 <20250507-topic-misc-shift6-panel-v1-2-64e8e98ff285@linaro.org>
 <0e87c261-08f9-4a4a-9916-0487a6dbc737@quicinc.com>
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
In-Reply-To: <0e87c261-08f9-4a4a-9916-0487a6dbc737@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 08/05/2025 23:57, Jessica Zhang wrote:
> 
> 
> On 5/7/2025 2:43 AM, neil.armstrong@linaro.org wrote:
>> From: Caleb Connolly <caleb@connolly.tech>
>>
>> Add support for another variant of the rm69299 panel. This panel is
>> 1080x2160 and is found in the shift-axolotl (SHIFT6mq).
>>
>> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
>> [narmstrong: removed cosmetic changes, fixed to apply, use enums to select mode]
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/panel/panel-visionox-rm69299.c | 221 ++++++++++++++++++++++---
>>   1 file changed, 195 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
>> index be3a9797fbced5222b313cf83f8078b919e2c219..26a79ab517723f23b7dc333235b81de264b5f30a 100644
>> --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
>> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
>> @@ -5,6 +5,7 @@
>>   #include <linux/delay.h>
>>   #include <linux/module.h>
>> +#include <linux/property.h>
>>   #include <linux/mod_devicetable.h>
>>   #include <linux/gpio/consumer.h>
>>   #include <linux/regulator/consumer.h>
>> @@ -15,11 +16,17 @@
>>   #include <drm/drm_modes.h>
>>   #include <drm/drm_panel.h>
>> +enum visionox_rm69299_modes {
>> +    VISIONOX_RM69299_MODE_1080X2248_60HZ = 0,
>> +    VISIONOX_RM69299_MODE_1080X2160_60HZ
>> +};
>> +
>>   struct visionox_rm69299 {
>>       struct drm_panel panel;
>>       struct regulator_bulk_data supplies[2];
>>       struct gpio_desc *reset_gpio;
>>       struct mipi_dsi_device *dsi;
>> +    enum visionox_rm69299_modes mode;
>>   };
>>   static inline struct visionox_rm69299 *panel_to_ctx(struct drm_panel *panel)
>> @@ -81,10 +88,123 @@ static int visionox_rm69299_unprepare(struct drm_panel *panel)
>>       return ret;
>>   }
>> +#define VISIONOX_RM69299_SHIFT_INIT_SEQ_LEN 432
>> +
>> +static const u8 visionox_rm69299_1080x2248_60hz_init_seq[VISIONOX_RM69299_SHIFT_INIT_SEQ_LEN][2] = {
> 
> Hi Neil,
> 
> I see this being used for the 1080x2160 mode, but the name here seems to imply that this is the init sequence for 1080x2248. Was that intended?

You're right, it's from the original changeset, I'll fix this.

> 
>> +    { 0xFE, 0x40 }, { 0x05, 0x04 }, { 0x06, 0x08 }, { 0x08, 0x04 },
>> +    { 0x09, 0x08 }, { 0x0A, 0x07 }, { 0x0B, 0xCC }, { 0x0C, 0x07 },
>> +    { 0x0D, 0x90 }, { 0x0F, 0x87 }, { 0x20, 0x8D }, { 0x21, 0x8D },
>> +    { 0x24, 0x05 }, { 0x26, 0x05 }, { 0x28, 0x05 }, { 0x2A, 0x05 },
>> +    { 0x2D, 0x28 }, { 0x2F, 0x28 }, { 0x30, 0x32 }, { 0x31, 0x32 },
>> +    { 0x37, 0x80 }, { 0x38, 0x30 }, { 0x39, 0xA8 }, { 0x46, 0x48 },
>> +    { 0x47, 0x48 }, { 0x6B, 0x10 }, { 0x6F, 0x02 }, { 0x74, 0x2B },
>> +    { 0x80, 0x1A }, { 0xFE, 0x40 }, { 0x93, 0x10 }, { 0x16, 0x00 },
>> +    { 0x85, 0x07 }, { 0x84, 0x01 }, { 0x86, 0x0F }, { 0x87, 0x05 },
>> +    { 0x8C, 0x00 }, { 0x88, 0x2E }, { 0x89, 0x2E }, { 0x8B, 0x09 },
>> +    { 0x95, 0x00 }, { 0x91, 0x00 }, { 0x90, 0x00 }, { 0x8D, 0xD0 },
>> +    { 0x8A, 0x03 }, { 0xFE, 0xA0 }, { 0x13, 0x00 }, { 0x33, 0x00 },
>> +    { 0x0B, 0x33 }, { 0x36, 0x1E }, { 0x31, 0x88 }, { 0x32, 0x88 },
>> +    { 0x37, 0xF1 }, { 0xFE, 0x50 }, { 0x00, 0x00 }, { 0x01, 0x00 },
>> +    { 0x02, 0x00 }, { 0x03, 0xE9 }, { 0x04, 0x00 }, { 0x05, 0xF6 },
>> +    { 0x06, 0x01 }, { 0x07, 0x2C }, { 0x08, 0x01 }, { 0x09, 0x62 },
>> +    { 0x0A, 0x01 }, { 0x0B, 0x98 }, { 0x0C, 0x01 }, { 0x0D, 0xBF },
>> +    { 0x0E, 0x01 }, { 0x0F, 0xF6 }, { 0x10, 0x02 }, { 0x11, 0x24 },
>> +    { 0x12, 0x02 }, { 0x13, 0x4E }, { 0x14, 0x02 }, { 0x15, 0x70 },
>> +    { 0x16, 0x02 }, { 0x17, 0xAF }, { 0x18, 0x02 }, { 0x19, 0xE2 },
>> +    { 0x1A, 0x03 }, { 0x1B, 0x1F }, { 0x1C, 0x03 }, { 0x1D, 0x52 },
>> +    { 0x1E, 0x03 }, { 0x1F, 0x82 }, { 0x20, 0x03 }, { 0x21, 0xB6 },
>> +    { 0x22, 0x03 }, { 0x23, 0xF0 }, { 0x24, 0x04 }, { 0x25, 0x1F },
>> +    { 0x26, 0x04 }, { 0x27, 0x37 }, { 0x28, 0x04 }, { 0x29, 0x59 },
>> +    { 0x2A, 0x04 }, { 0x2B, 0x68 }, { 0x30, 0x04 }, { 0x31, 0x85 },
>> +    { 0x32, 0x04 }, { 0x33, 0xA2 }, { 0x34, 0x04 }, { 0x35, 0xBC },
>> +    { 0x36, 0x04 }, { 0x37, 0xD8 }, { 0x38, 0x04 }, { 0x39, 0xF4 },
>> +    { 0x3A, 0x05 }, { 0x3B, 0x0E }, { 0x40, 0x05 }, { 0x41, 0x13 },
>> +    { 0x42, 0x05 }, { 0x43, 0x1F }, { 0x44, 0x05 }, { 0x45, 0x1F },
>> +    { 0x46, 0x00 }, { 0x47, 0x00 }, { 0x48, 0x01 }, { 0x49, 0x43 },
>> +    { 0x4A, 0x01 }, { 0x4B, 0x4C }, { 0x4C, 0x01 }, { 0x4D, 0x6F },
>> +    { 0x4E, 0x01 }, { 0x4F, 0x92 }, { 0x50, 0x01 }, { 0x51, 0xB5 },
>> +    { 0x52, 0x01 }, { 0x53, 0xD4 }, { 0x58, 0x02 }, { 0x59, 0x06 },
>> +    { 0x5A, 0x02 }, { 0x5B, 0x33 }, { 0x5C, 0x02 }, { 0x5D, 0x59 },
>> +    { 0x5E, 0x02 }, { 0x5F, 0x7D }, { 0x60, 0x02 }, { 0x61, 0xBD },
>> +    { 0x62, 0x02 }, { 0x63, 0xF7 }, { 0x64, 0x03 }, { 0x65, 0x31 },
>> +    { 0x66, 0x03 }, { 0x67, 0x63 }, { 0x68, 0x03 }, { 0x69, 0x9D },
>> +    { 0x6A, 0x03 }, { 0x6B, 0xD2 }, { 0x6C, 0x04 }, { 0x6D, 0x05 },
>> +    { 0x6E, 0x04 }, { 0x6F, 0x38 }, { 0x70, 0x04 }, { 0x71, 0x51 },
>> +    { 0x72, 0x04 }, { 0x73, 0x70 }, { 0x74, 0x04 }, { 0x75, 0x85 },
>> +    { 0x76, 0x04 }, { 0x77, 0xA1 }, { 0x78, 0x04 }, { 0x79, 0xC0 },
>> +    { 0x7A, 0x04 }, { 0x7B, 0xD8 }, { 0x7C, 0x04 }, { 0x7D, 0xF2 },
>> +    { 0x7E, 0x05 }, { 0x7F, 0x10 }, { 0x80, 0x05 }, { 0x81, 0x21 },
>> +    { 0x82, 0x05 }, { 0x83, 0x2E }, { 0x84, 0x05 }, { 0x85, 0x3A },
>> +    { 0x86, 0x05 }, { 0x87, 0x3E }, { 0x88, 0x00 }, { 0x89, 0x00 },
>> +    { 0x8A, 0x01 }, { 0x8B, 0x86 }, { 0x8C, 0x01 }, { 0x8D, 0x8F },
>> +    { 0x8E, 0x01 }, { 0x8F, 0xB3 }, { 0x90, 0x01 }, { 0x91, 0xD7 },
>> +    { 0x92, 0x01 }, { 0x93, 0xFB }, { 0x94, 0x02 }, { 0x95, 0x18 },
>> +    { 0x96, 0x02 }, { 0x97, 0x4F }, { 0x98, 0x02 }, { 0x99, 0x7E },
>> +    { 0x9A, 0x02 }, { 0x9B, 0xA6 }, { 0x9C, 0x02 }, { 0x9D, 0xCF },
>> +    { 0x9E, 0x03 }, { 0x9F, 0x14 }, { 0xA4, 0x03 }, { 0xA5, 0x52 },
>> +    { 0xA6, 0x03 }, { 0xA7, 0x93 }, { 0xAC, 0x03 }, { 0xAD, 0xCF },
>> +    { 0xAE, 0x04 }, { 0xAF, 0x08 }, { 0xB0, 0x04 }, { 0xB1, 0x42 },
>> +    { 0xB2, 0x04 }, { 0xB3, 0x7F }, { 0xB4, 0x04 }, { 0xB5, 0xB4 },
>> +    { 0xB6, 0x04 }, { 0xB7, 0xCC }, { 0xB8, 0x04 }, { 0xB9, 0xF2 },
>> +    { 0xBA, 0x05 }, { 0xBB, 0x0C }, { 0xBC, 0x05 }, { 0xBD, 0x26 },
>> +    { 0xBE, 0x05 }, { 0xBF, 0x4B }, { 0xC0, 0x05 }, { 0xC1, 0x64 },
>> +    { 0xC2, 0x05 }, { 0xC3, 0x83 }, { 0xC4, 0x05 }, { 0xC5, 0xA1 },
>> +    { 0xC6, 0x05 }, { 0xC7, 0xBA }, { 0xC8, 0x05 }, { 0xC9, 0xC4 },
>> +    { 0xCA, 0x05 }, { 0xCB, 0xD5 }, { 0xCC, 0x05 }, { 0xCD, 0xD5 },
>> +    { 0xCE, 0x00 }, { 0xCF, 0xCE }, { 0xD0, 0x00 }, { 0xD1, 0xDB },
>> +    { 0xD2, 0x01 }, { 0xD3, 0x32 }, { 0xD4, 0x01 }, { 0xD5, 0x3B },
>> +    { 0xD6, 0x01 }, { 0xD7, 0x74 }, { 0xD8, 0x01 }, { 0xD9, 0x7D },
>> +    { 0xFE, 0x60 }, { 0x00, 0xCC }, { 0x01, 0x0F }, { 0x02, 0xFF },
>> +    { 0x03, 0x01 }, { 0x04, 0x00 }, { 0x05, 0x02 }, { 0x06, 0x00 },
>> +    { 0x07, 0x00 }, { 0x09, 0xC4 }, { 0x0A, 0x00 }, { 0x0B, 0x04 },
>> +    { 0x0C, 0x01 }, { 0x0D, 0x00 }, { 0x0E, 0x04 }, { 0x0F, 0x00 },
>> +    { 0x10, 0x71 }, { 0x12, 0xC4 }, { 0x13, 0x00 }, { 0x14, 0x04 },
>> +    { 0x15, 0x01 }, { 0x16, 0x00 }, { 0x17, 0x06 }, { 0x18, 0x00 },
>> +    { 0x19, 0x71 }, { 0x1B, 0xC4 }, { 0x1C, 0x00 }, { 0x1D, 0x02 },
>> +    { 0x1E, 0x00 }, { 0x1F, 0x00 }, { 0x20, 0x08 }, { 0x21, 0x66 },
>> +    { 0x22, 0xB4 }, { 0x24, 0xC4 }, { 0x25, 0x00 }, { 0x26, 0x02 },
>> +    { 0x27, 0x00 }, { 0x28, 0x00 }, { 0x29, 0x07 }, { 0x2A, 0x66 },
>> +    { 0x2B, 0xB4 }, { 0x2F, 0xC4 }, { 0x30, 0x00 }, { 0x31, 0x04 },
>> +    { 0x32, 0x01 }, { 0x33, 0x00 }, { 0x34, 0x03 }, { 0x35, 0x00 },
>> +    { 0x36, 0x71 }, { 0x38, 0xC4 }, { 0x39, 0x00 }, { 0x3A, 0x04 },
>> +    { 0x3B, 0x01 }, { 0x3D, 0x00 }, { 0x3F, 0x05 }, { 0x40, 0x00 },
>> +    { 0x41, 0x71 }, { 0x83, 0xCE }, { 0x84, 0x02 }, { 0x85, 0x20 },
>> +    { 0x86, 0xDC }, { 0x87, 0x00 }, { 0x88, 0x04 }, { 0x89, 0x00 },
>> +    { 0x8A, 0xBB }, { 0x8B, 0x80 }, { 0xC7, 0x0E }, { 0xC8, 0x05 },
>> +    { 0xC9, 0x1F }, { 0xCA, 0x06 }, { 0xCB, 0x00 }, { 0xCC, 0x03 },
>> +    { 0xCD, 0x04 }, { 0xCE, 0x1F }, { 0xCF, 0x1F }, { 0xD0, 0x1F },
>> +    { 0xD1, 0x1F }, { 0xD2, 0x1F }, { 0xD3, 0x1F }, { 0xD4, 0x1F },
>> +    { 0xD5, 0x1F }, { 0xD6, 0x1F }, { 0xD7, 0x17 }, { 0xD8, 0x1F },
>> +    { 0xD9, 0x16 }, { 0xDA, 0x1F }, { 0xDB, 0x0E }, { 0xDC, 0x01 },
>> +    { 0xDD, 0x1F }, { 0xDE, 0x02 }, { 0xDF, 0x00 }, { 0xE0, 0x03 },
>> +    { 0xE1, 0x04 }, { 0xE2, 0x1F }, { 0xE3, 0x1F }, { 0xE4, 0x1F },
>> +    { 0xE5, 0x1F }, { 0xE6, 0x1F }, { 0xE7, 0x1F }, { 0xE8, 0x1F },
>> +    { 0xE9, 0x1F }, { 0xEA, 0x1F }, { 0xEB, 0x17 }, { 0xEC, 0x1F },
>> +    { 0xED, 0x16 }, { 0xEE, 0x1F }, { 0xEF, 0x03 }, { 0xFE, 0x70 },
>> +    { 0x5A, 0x0B }, { 0x5B, 0x0B }, { 0x5C, 0x55 }, { 0x5D, 0x24 },
>> +    { 0xFE, 0x90 }, { 0x12, 0x24 }, { 0x13, 0x49 }, { 0x14, 0x92 },
>> +    { 0x15, 0x86 }, { 0x16, 0x61 }, { 0x17, 0x18 }, { 0x18, 0x24 },
>> +    { 0x19, 0x49 }, { 0x1A, 0x92 }, { 0x1B, 0x86 }, { 0x1C, 0x61 },
>> +    { 0x1D, 0x18 }, { 0x1E, 0x24 }, { 0x1F, 0x49 }, { 0x20, 0x92 },
>> +    { 0x21, 0x86 }, { 0x22, 0x61 }, { 0x23, 0x18 }, { 0xFE, 0x40 },
>> +    { 0x0E, 0x10 }, { 0xFE, 0xA0 }, { 0x04, 0x80 }, { 0x16, 0x00 },
>> +    { 0x26, 0x10 }, { 0x2F, 0x37 }, { 0xFE, 0xD0 }, { 0x06, 0x0F },
>> +    { 0x4B, 0x00 }, { 0x56, 0x4A }, { 0xFE, 0x00 }, { 0xC2, 0x09 },
>> +    { 0x35, 0x00 }, { 0xFE, 0x70 }, { 0x7D, 0x61 }, { 0x7F, 0x00 },
>> +    { 0x7E, 0x4E }, { 0x52, 0x2C }, { 0x49, 0x00 }, { 0x4A, 0x00 },
>> +    { 0x4B, 0x00 }, { 0x4C, 0x00 }, { 0x4D, 0xE8 }, { 0x4E, 0x25 },
>> +    { 0x4F, 0x6E }, { 0x50, 0xAE }, { 0x51, 0x2F }, { 0xAD, 0xF4 },
>> +    { 0xAE, 0x8F }, { 0xAF, 0x00 }, { 0xB0, 0x54 }, { 0xB1, 0x3A },
>> +    { 0xB2, 0x00 }, { 0xB3, 0x00 }, { 0xB4, 0x00 }, { 0xB5, 0x00 },
>> +    { 0xB6, 0x18 }, { 0xB7, 0x30 }, { 0xB8, 0x4A }, { 0xB9, 0x98 },
>> +    { 0xBA, 0x30 }, { 0xBB, 0x60 }, { 0xBC, 0x50 }, { 0xBD, 0x00 },
>> +    { 0xBE, 0x00 }, { 0xBF, 0x39 }, { 0xFE, 0x00 }, { 0x51, 0x66 },
>> +};
>> +
>>   static int visionox_rm69299_prepare(struct drm_panel *panel)
>>   {
>>       struct visionox_rm69299 *ctx = panel_to_ctx(panel);
>> -    int ret;
>> +    int ret, i;
>>       ret = visionox_rm69299_power_on(ctx);
>>       if (ret < 0)
>> @@ -92,28 +212,48 @@ static int visionox_rm69299_prepare(struct drm_panel *panel)
>>       ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>> -    ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0xfe, 0x00 }, 2);
>> -    if (ret < 0) {
>> -        dev_err(ctx->panel.dev, "cmd set tx 0 failed, ret = %d\n", ret);
>> -        goto power_off;
>> -    }
>> -
>> -    ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0xc2, 0x08 }, 2);
>> -    if (ret < 0) {
>> -        dev_err(ctx->panel.dev, "cmd set tx 1 failed, ret = %d\n", ret);
>> -        goto power_off;
>> -    }
>> -
>> -    ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0x35, 0x00 }, 2);
>> -    if (ret < 0) {
>> -        dev_err(ctx->panel.dev, "cmd set tx 2 failed, ret = %d\n", ret);
>> -        goto power_off;
>> -    }
>> -
>> -    ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0x51, 0xff }, 2);
>> -    if (ret < 0) {
>> -        dev_err(ctx->panel.dev, "cmd set tx 3 failed, ret = %d\n", ret);
>> -        goto power_off;
>> +    if (ctx->mode == VISIONOX_RM69299_MODE_1080X2160_60HZ) {
>> +        for (i = 0; i < VISIONOX_RM69299_SHIFT_INIT_SEQ_LEN; i++) {
>> +            ret = mipi_dsi_dcs_write_buffer(ctx->dsi,
> 
> Any reason for not using mipi_dsi_dcs_write_buffer_multi() here?

I was planning to switch to multi afterwards, but I can add it as patch 3 on v2

Thanks,
Neil

> 
> Thanks,
> 
> Jessica Zhang
> 
>> +                visionox_rm69299_1080x2248_60hz_init_seq[i], 2);
>> +            if (ret < 0) {
>> +                dev_err(ctx->panel.dev,
>> +                    "cmd set tx 0 failed, ret = %d\n", ret);
>> +                return ret;
>> +            }
>> +        }
>> +    } else {
>> +        ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0xfe, 0x00 },
>> +                        2);
>> +        if (ret < 0) {
>> +            dev_err(ctx->panel.dev,
>> +                "cmd set tx 0 failed, ret = %d\n", ret);
>> +            return ret;
>> +        }
>> +
>> +        ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0xc2, 0x08 },
>> +                        2);
>> +        if (ret < 0) {
>> +            dev_err(ctx->panel.dev,
>> +                "cmd set tx 1 failed, ret = %d\n", ret);
>> +            return ret;
>> +        }
>> +
>> +        ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0x35, 0x00 },
>> +                        2);
>> +        if (ret < 0) {
>> +            dev_err(ctx->panel.dev,
>> +                "cmd set tx 2 failed, ret = %d\n", ret);
>> +            return ret;
>> +        }
>> +
>> +        ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0x51, 0xff },
>> +                        2);
>> +        if (ret < 0) {
>> +            dev_err(ctx->panel.dev,
>> +                "cmd set tx 3 failed, ret = %d\n", ret);
>> +            return ret;
>> +        }
>>       }
>>       ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_EXIT_SLEEP_MODE, NULL, 0);
>> @@ -154,14 +294,38 @@ static const struct drm_display_mode visionox_rm69299_1080x2248_60hz = {
>>       .flags = 0,
>>   };
>> +static const struct drm_display_mode visionox_rm69299_1080x2160_60hz = {
>> +    .clock = 158695,
>> +    .hdisplay = 1080,
>> +    .hsync_start = 1080 + 26,
>> +    .hsync_end = 1080 + 26 + 2,
>> +    .htotal = 1080 + 26 + 2 + 36,
>> +    .vdisplay = 2160,
>> +    .vsync_start = 2160 + 8,
>> +    .vsync_end = 2160 + 8 + 4,
>> +    .vtotal = 2160 + 8 + 4 + 4,
>> +    .flags = 0,
>> +};
>> +
>>   static int visionox_rm69299_get_modes(struct drm_panel *panel,
>>                         struct drm_connector *connector)
>>   {
>>       struct visionox_rm69299 *ctx = panel_to_ctx(panel);
>> +    const struct drm_display_mode *panel_mode;
>>       struct drm_display_mode *mode;
>> -    mode = drm_mode_duplicate(connector->dev,
>> -                  &visionox_rm69299_1080x2248_60hz);
>> +    switch (ctx->mode) {
>> +    case VISIONOX_RM69299_MODE_1080X2248_60HZ:
>> +        panel_mode = &visionox_rm69299_1080x2248_60hz;
>> +        break;
>> +    case VISIONOX_RM69299_MODE_1080X2160_60HZ:
>> +        panel_mode = &visionox_rm69299_1080x2160_60hz;
>> +        break;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
>> +    mode = drm_mode_duplicate(connector->dev, panel_mode);
>>       if (!mode) {
>>           dev_err(ctx->panel.dev, "failed to create a new display mode\n");
>>           return 0;
>> @@ -191,6 +355,8 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
>>       if (!ctx)
>>           return -ENOMEM;
>> +    ctx->mode = (enum visionox_rm69299_modes)device_get_match_data(dev);
>> +
>>       mipi_dsi_set_drvdata(dsi, ctx);
>>       ctx->dsi = dsi;
>> @@ -240,7 +406,10 @@ static void visionox_rm69299_remove(struct mipi_dsi_device *dsi)
>>   }
>>   static const struct of_device_id visionox_rm69299_of_match[] = {
>> -    { .compatible = "visionox,rm69299-1080p-display", },
>> +    { .compatible = "visionox,rm69299-1080p-display",
>> +      .data = (void *)VISIONOX_RM69299_MODE_1080X2248_60HZ },
>> +    { .compatible = "visionox,rm69299-shift",
>> +      .data = (void *)VISIONOX_RM69299_MODE_1080X2160_60HZ },
>>       { /* sentinel */ }
>>   };
>>   MODULE_DEVICE_TABLE(of, visionox_rm69299_of_match);
>>
> 

