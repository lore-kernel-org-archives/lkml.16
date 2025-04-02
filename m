Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1595D21B9CF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 14:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743603857; cv=none; b=SJyKebe2cJbDXjoruLVyukZ3xWDkFnXmPZWzVULIBA5tSW5Z37Jo4JndUExCyYImEGmXgz4h/rB2uCq7rsn0n+UlyeZ+kiu3XlhaVXtda3/ytW+W/tXS9L+9opE5jkpZYNTccajYIfyNaeu5pco1ksU33HUuDCkRg7SGqsMP5dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743603857; c=relaxed/simple;
	bh=1M5XlE3fz9m8/SJijU20jne9EBSfoyZ2jk5Jp3UkBx4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WwIo0gg4Vles+dhVaXcBrUQsDk9sAT+3NybE1FM+uXusWj5smnPRxIQa0lIzgIGfDcAI3lt///DGvfL9oRUqz038cDrcbUym8j8Gh2hSa823wEAPBeRrm1QW3/dy17V4Dr7DJ47SoIiiygNYvV+/g42OGPJqESnjXSGM3ZiCPtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h16/ZZih; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h16/ZZih"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43948021a45so69016165e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 07:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743603853; x=1744208653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xyARiLNtATS5AzswjM8CCyE8YJ8HDHxhY7Aa8WTCbG8=;
        b=h16/ZZihEqb97jSUQzE7O2HXO3VWHzTzyydAH4zZm0Qw5IPDTW3287tPI62BrqfQ+/
         9XDlok5rZ6QVEVmCI0fc3NDUCmiFPx0sc4SmuGqR23ZHQfRG6BQYu1MyOrEPzIuaHOzN
         ZYiFuMqMQpUCKTL12XsQubqB5D64XrsGhUuZPsU2kVHWcfKCxes+jPeXPZhOwS3FrUoZ
         JcLbLJeyS+4VSLysPAfmkTfmHRDdM6w75YUT4anFQ8opS3Ly4eFDpUOzJzDvxzha3UN4
         oAYx8ewWrlJGq54DQnf0tvuTmvYzUN0Em2pVFai2W72d96qCJN7um5pHA8t1E4I7E60q
         YWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743603853; x=1744208653;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xyARiLNtATS5AzswjM8CCyE8YJ8HDHxhY7Aa8WTCbG8=;
        b=DWwm6E2mmj8YVxBELJh8R8JZ5sreJ4/W3KLDd90+HoG2+7gDz7PIndXTxLr9AdQFHr
         +zs0uHpl/vmsSVxiHpa9aA11hscqL0v1h9kH7xFP82q54ZgR4yt4gbzXFwisFmgduJLE
         a1x/NIDotYKKHiz1YxdsL2g4brOrCVTEp0qQM8TMB+ME+ps6McSFcoc9UOlqKfjA2w38
         V8EEbGphxod9wVdNWFNZAHGw3sIOPz/gwqobxKAGj7RijkFiycvt5aCoAj3gKD3jX0xt
         cAjXDMb7WSfxHoSzIuR5JZaSBWpNfranxlcGHr1fNmib6yuf+e+piVTBkG2hs/aTQ6VZ
         gQkA==
X-Forwarded-Encrypted: i=1; AJvYcCWzKG+Zp3N0q6JDY7H5fF0x0o5Sh7odZjZX2aNcVaRn8Rl5WwsR6v4Vvt2sUTsWqHz+PVt9lMtlDhNFSCU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEcLi8NXLOMNErgErG1O2wwxd59utdxhqrBOIr6/66NvsRnO/C
	pWaH5XHgneO5e1RxZAIEuoLoin5YWzzhULP373+W5NyDryEWYTaNo87f5cZSnaA=
X-Gm-Gg: ASbGncu8chFZ7KBHkj0tHYG7dbdhOg0A/ogb3ZShPS0zPM4gfG1YhrLHuYgPqCLi1s8
	7eCRCbfD2XWOKIxoKtOAF3sblZU6Fgd1Wg/TMCP53DbjPG7QusxPxqOt/QSjuAWyFKVN4nABCY/
	C25HDF2e6SpAFQUb4EKtrlmJsstjjbs6f0GTVghojHzXglriC53h7r+5AJiwms9cTLVaQB5HUaG
	KKcbjN+QLgj9oqeoaFarFmntmvhH78k4d2XnvpKoIVl5nx9gySRqiElnENIHLCEcHAeO3L2YWrF
	YzskE3RhRa0HiI255XENovWjvMw2Fftidkadd3jqTLGg851Q4kZA8Sl79gqLjd61ISkTAgMvIK1
	6Os10aWWsl2vUl6zHtVV7JQ==
X-Google-Smtp-Source: AGHT+IFsRGX2wdB2iepKQDGuzp9DMis4YZNIE0+wJscPdfYLg84AN2qt5xXeU/OvBzroap0cGm76eA==
X-Received: by 2002:a05:6000:2281:b0:39c:2688:612b with SMTP id ffacd0b85a97d-39c2688622amr5478938f8f.7.1743603853259;
        Wed, 02 Apr 2025 07:24:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ca59:43e0:210c:afcf? ([2a01:e0a:3d9:2080:ca59:43e0:210c:afcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a41c0sm16808220f8f.88.2025.04.02.07.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 07:24:12 -0700 (PDT)
Message-ID: <74718ea9-30e5-4d85-9f19-e597ab41af6e@linaro.org>
Date: Wed, 2 Apr 2025 16:24:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 00/10] drm/panel: Use refcounted allocation in place of
 devm_kzalloc()
To: Anusha Srivatsa <asrivats@redhat.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Linus Walleij <linus.walleij@linaro.org>, Joel Selvaraj <jo@jsfamily.in>,
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
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
In-Reply-To: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2025 18:03, Anusha Srivatsa wrote:
> Start converting drivers to use the API - devm_drm_panel_alloc().
> 
> This series addresses only 10 drivers. There are 98 more to go. Sending this
> series to mostly get feedback. if any change is required, it will be
> incorporated in the next version and in the next series that will
> address the remaining drivers.
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
> Anusha Srivatsa (10):
>        panel/abt-y030xx067a: Use the refcounted allocation in place of devm_kzalloc()
>        panel/arm-versatile:  Use the refcounted allocation in place of devm_kzalloc()
>        panel/z00t-tm5p5-n35596: Use refcounted allocation in place of devm_kzalloc()
>        panel/auo-a030jtn01: Use refcounted allocation in place of devm_kzalloc()
>        panel/bf060y8m-aj0: Use refcounted allocation in place of devm_kzalloc()
>        panel/th101mb31ig002-28a: Use refcounted allocation in place of devm_kzalloc()
>        panel/boe-tv101wum-ll2: Use refcounted allocation in place of devm_kzalloc()
>        panel/dsi-cm: Use refcounted allocation in place of devm_kzalloc()
>        panel/ebbg-ft8719: Use refcounted allocation in place of devm_kzalloc()
>        panel/panel-edp: Use refcounted allocation in place of devm_kzalloc()
> 
>   drivers/gpu/drm/panel/panel-abt-y030xx067a.c         | 10 ++++------
>   drivers/gpu/drm/panel/panel-arm-versatile.c          | 11 +++++------
>   drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c | 11 +++++------
>   drivers/gpu/drm/panel/panel-auo-a030jtn01.c          | 10 ++++------
>   drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c       | 11 +++++------
>   drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 11 +++++------
>   drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c       | 10 +++++-----
>   drivers/gpu/drm/panel/panel-dsi-cm.c                 | 10 ++++------
>   drivers/gpu/drm/panel/panel-ebbg-ft8719.c            | 11 +++++------
>   drivers/gpu/drm/panel/panel-edp.c                    |  9 ++++-----
>   10 files changed, 46 insertions(+), 58 deletions(-)
> ---
> base-commit: de04bb0089a96cc00d13b12cbf66a088befe3057
> change-id: 20250401-b4-drm-panel-mass-driver-convert-ddca32e95d16
> 
> Best regards,

Looks good to me

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
