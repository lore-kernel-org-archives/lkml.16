Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DA71D63CD
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 08:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748854308; cv=none; b=NRLLR/w0row+nhM9UbGczWHTF451jR0psIsJzsyIOrkvMSu8zJgS5y3sdhsWxThDEJz6T7N1DHTUmy8AZWAmTH+Y4wWzYMdBWDk/fQQX5N29mLD1fF5n4/ov/EWdMnJ9L3W1dzRv+fCwf/A7m85YpVx+93J6tPtQ8Rl7qMuTgoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748854308; c=relaxed/simple;
	bh=S1ZoQX8VLLa/Yp+NlWT4GL2uz7nxiDybAElFK9ejljE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=E/RAcxEmZu3CsL/u7qCGjM1loqO/orOAzhVO6ujJJ6ZgL4Mw0jGiVzj+opL7mZxwKGecR5LByFkWQFvdu5Ytf3d7y2TO/7IEOpPtMdau8gDCkafpJkOYW0MQHJAFKHH9nsrhOwfKB9POubRfxPCnWBnnqsFiXz1ch/35oKK99Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SK9RzsCT; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SK9RzsCT"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450cea01b9cso15738745e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 01:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748854304; x=1749459104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFJh+DuLiwxEu1n2YgqypgEN6GoFc9By/45N27OkGW0=;
        b=SK9RzsCTzhICFVLNtu3H2ZJ/AHxsl/rYD4Dsi9AYBtB1bPnVBJiksHXuTpWYzqzMlp
         xycT8HG5F3kVV49r2UpZt5eIuuXhVz1pRjVd/oh63CJXUy/0mL5tPrIARW++QVvvzeA8
         c5dCkclo3kWZVWQiLBbmAY5MiJAXH/lBxoD0jNe0bJ6vCTD/SAkqHipUUWUP/+e7i1B5
         x8I8LTU/bT0MnQ61BqTPsbL3aI8R1NVlkxc2N5sbt1SVciWUGs+TC4V0Vvi2IwMMneB/
         LEyNx9JrcPVof2ivaTEQTyZO4VJU750Zj+LNYMwoybJ86QYL9Naz5YJUMaxTr674ePO2
         BYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748854304; x=1749459104;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RFJh+DuLiwxEu1n2YgqypgEN6GoFc9By/45N27OkGW0=;
        b=Y0F5c0TtcUbbQh6G4QdOt7x1uJOQvHs3FUEw1tcjlkTieZvKQnIy4GpXmKwJi6h001
         jyuFXjVjAu3f2jTY+CaCa4nzsj8/rf5P0aHd+IwwZ8g5n7/X44IEMv/rbiZWXmc+NgyH
         smxmu1nXdAMHv2HMPS9oMsS/Cw5AD+y6vObxRwoTCI5N4+aImvB7HSIvl6/53xlC/8/O
         xVxBCJjudFQZNdawTgunAELaNgeiqkbgGEkhujAZh5J4PAPNeyqguHZArjGr7foGPPK8
         nJu4aVNKBthZFiGzG/z5J/w5fVZxY5i6CL5lzknGgpK/MUVBkcNDyUY2CCj4fw/lAyih
         C68w==
X-Forwarded-Encrypted: i=1; AJvYcCXJOWFJq/GwQFv/DRSEGte7rf+Rz8MRTYWf5rRhzCIu7WQyeWeMTzMmrnWUr87Tg8wHo6gdUt6vJtSLiv4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSqu/jj/CDMcGJNmQuFPeM6dPh+BUC7xMk/lGP8EO1fM3Lyr2P
	D+ImgKKZG9+fUM6Pp21D/AgQ1W/X0ET/FgXopGsDw+nIy5jix2V8MtFczI1hcinm+l8=
X-Gm-Gg: ASbGncvTVDsTUFpvsV4gBliQBeR2xNsjYveuK1aOSx77hxaLNv2W3lUyEbG3ZD5GjM6
	OxHVymeV4ONALbV52LrVFCgtRDRKzftyvtEhJRjKLkowVdPjUWnDWqSYi8JBJxKLIa/Dsu6Zckv
	56kc1KdjzLrZlFZfXfYBBDH6h/Gp/wbmuol1za/0U8cMp6BroKFP2BHD2s2DkNBByXZG1moUrep
	fb/ydGv+o0ktNqiiMa8ymL83c356idxyU377wPFPratgUoxkD5jsggxLeV9Lwvnnmu5wfthmmbW
	9OhjL9Kva9M0PFBWubQZz7M5nFv6zE+G2Noo6VccAPOUxvvtwHfbhSvosLp9x+VXgj3aSm0DXbi
	m89zo+AOpfKmivnI8a3NMr/Ejug==
X-Google-Smtp-Source: AGHT+IEpZ4uYY0OxpZRgywYsVbDjtZe7g9aPxe4qMbr12yKzPvbkxYVNJIXxVCur5zyKIsg1pF8akA==
X-Received: by 2002:a05:600c:1d0b:b0:450:d01f:de6f with SMTP id 5b1f17b1804b1-450d881dae9mr102185795e9.15.1748854303883;
        Mon, 02 Jun 2025 01:51:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:cb6:30c6:d7ab:d145? ([2a01:e0a:3d9:2080:cb6:30c6:d7ab:d145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b79asm13831459f8f.2.2025.06.02.01.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 01:51:43 -0700 (PDT)
Message-ID: <ac476285-9ba0-48ba-87d5-416bed395948@linaro.org>
Date: Mon, 2 Jun 2025 10:51:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 5/6] phy: qcom: qmp-combo: register a typec mux to
 change the QMPPHY_MODE
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
 <20250527-topic-4ln_dp_respin-v3-5-f9a0763ec289@oss.qualcomm.com>
 <itmvwhcf37bmnpadcyc7kdt7wx3eljyjwyv64s24zwhbr2e45g@76uzcpjqzx22>
 <7f464eb7-469c-4350-a43a-3b99394ad689@oss.qualcomm.com>
 <7icpna4l7z63gs52oa5lqf35puib66wxxmqqul6ezdkhuziaqi@mvkf73zz2iyj>
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
In-Reply-To: <7icpna4l7z63gs52oa5lqf35puib66wxxmqqul6ezdkhuziaqi@mvkf73zz2iyj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/05/2025 10:58, Dmitry Baryshkov wrote:
> On Wed, May 28, 2025 at 12:22:01AM +0200, Konrad Dybcio wrote:
>> On 5/27/25 11:55 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 27, 2025 at 10:40:07PM +0200, Konrad Dybcio wrote:
>>>> From: Neil Armstrong <neil.armstrong@linaro.org>
>>>>
>>>> Register a typec mux in order to change the PHY mode on the Type-C
>>>> mux events depending on the mode and the svid when in Altmode setup.
>>>>
>>>> The DisplayPort phy should be left enabled if is still powered on
>>>> by the DRM DisplayPort controller, so bail out until the DisplayPort
>>>> PHY is not powered off.
>>>>
>>>> The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE states
>>>> will be set in between of USB-Only, Combo and DisplayPort Only so
>>>> this will leave enough time to the DRM DisplayPort controller to
>>>> turn of the DisplayPort PHY.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> [konrad: renaming, rewording, bug fixes]
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> ---
>>
>> [...]
>>
>>>> +	} else {
>>>> +		/* Fall back to USB3+DP mode if we're not sure it's strictly USB3-only */
>>>
>>> Why? if the SID is not DP, then there can't be a DP stream.
>>>
>>>> +		if (state->mode == TYPEC_MODE_USB3 || state->mode == TYPEC_STATE_USB)
>>>> +			new_mode = QMPPHY_MODE_USB3_ONLY;
>>>> +		else
>>>> +			new_mode = QMPPHY_MODE_USB3DP;
>>
>> To be honest I don't really know.. Neil chose to do that, but I don't
>> think there's a strict requirement.. Should we default to 4ln-USB3?
> 
> Yes, QMPPHY_MODE_USB3_ONLY. Nit: there is no 4ln-USB3 (it is a special
> mode). We handle 2ln-USB3 only.
> 
>>
>> [...]
>>
>>> Consider the following scenario: connect DP dongle, use modetest to
>>> setup DP stream, disconnect dongle, connect USB3 device. What would be
>>> the actual state of the PHY? Modetest is still running, so DP stream is
>>> not going to be shut down from the driver.
>>>
>>> I think we might need a generic notifier from the PHY to the user,
>>> telling that the PHY is going away (or just that the PHY is changing the
>>> state). Then it would be usable by both the DP and USB drivers to let
>>> them know that they should toggle the state.
>>
>>
>> If modetest won't stop running even though there was a DP unplug
>> (and therefore presumably a destruction of the display), I don't
>> think things are designed very well
> 
> They are, but differently. Display settings are always controlled by
> DRM clients (typically, a userspace compositor). They can decide to
> send data to unconnected display, they can decide to ignore HPD events,
> etc. Even if userspace responds to the event, there always will be some
> delay. I choose modetest, because it's a particularly good example of a
> delay going to the infinity.
> 

DP link state is handled separately from the DRM state, if you look at the
MSM/DP, you get the following calls on an hdp event:
dp_bridge_hpd_notify
hpd_event_thread
dp_hpd_unplug_handle
dp_ctrl_off_link
phy_power_off
dp_display_host_phy_exit
phy_exit

independently of any DRM state change, DRM will be notified at the end of
a disconnect with dp_display_notify_disconnect().

So even with a modeset running, phy will disabled following an UCSI disconnect
event.

Neil
