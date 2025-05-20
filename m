Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C80A212FB8
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747728324; cv=none; b=XECU1N2uCehL7HbD239HjrYWtDPARFWxGKZLL7nqle54iwqE9MEetLqNNPZ4Ih6UGrPSphukx5AzxENlNTrwj3JPWOygXTpQbvw44UXe2nN374GzrlV/52fTsOKg7UMYeuSrUq4geHwr3uxikqbmS+NKgpVB+r6OUwpS/B+gXLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747728324; c=relaxed/simple;
	bh=Mx44AFtHKg6NPUwYy9XHoArClrZEsXPQ/I3fa+2ymjY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qThZg8NV/bOz+/Lghz3+JxUNBprVE2tK38GdhoaGmBSOPgRttc0s9tn61UwKDo6D5uIKmQgevtLqffdTBAb8dQPu6ONXEe43KQJsz+4c5FviCKayc7Y7JoadvZ4zEKpLMyFhGecVWyONivrzxd0dOi9nNT4Ex9ToxTxB560gSYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sJdfiUDg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sJdfiUDg"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so31102155e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 01:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747728320; x=1748333120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8uNWDaQGmXlN2WBOvHoF7sz3M4udRBK5xujbVMotESw=;
        b=sJdfiUDgDxuVR3f4yBHDx+QjhyYwY0ILqv2tBafwfxzb0heFB5Fagk6+VuySGrc7OF
         D/MAAAhXj/3P0iuzdISiJBbdpiwtGnIqOdKi47AYIhFNYOGJhnF9hiuMw1LBF5xizXU1
         RQVIIUdvPnbno/eTgOLz0FNkwH/Lwjpx2uxxP5e4aZ5G+Y4HLQ5i/4gV7n7wt6L62IN3
         MQf1Q4aDpzpFfwtqL0tofW7o7wFxLUc03aN+fSefi0LzYbyA3wYw/XduL8Gx0mHx6GOT
         TwHl8VQmlw0i5d6irP0H7gBTdv19j/1BiTqojaXKz6YqgoKmVSFjTvMO7UDy6BWb5SxW
         1ddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747728320; x=1748333120;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8uNWDaQGmXlN2WBOvHoF7sz3M4udRBK5xujbVMotESw=;
        b=q+uD3Kl8bX8CSdVj/Ok8BUI6Csznt8s6LShvON+2UyBtN/fGtunsaWIzgsX0oXOGTQ
         TRAbrX9wLa3Ia/bgy/055AGufDsYJ/1bOaRo4d5BhCOvMSHIrkjqmK0eT+tJ12e6U2nj
         +fLgWR0VZ6uj4jPrmXPbrTXf1tOLEqunG2P8z4y3IZrIWRFe+9rxVdRY5SbU0BhyfI+V
         +/Zy1sVFBw04PSQnC4LnkUcctQKat3uCpotJ7g3UOnAl9O73O6JJJE9l5pnXmHNs58x7
         7AgCmZ7uRJIE1OLkEV7Rn8CkfZTlyHgOXuvnEAWA3oESQhBICpiBkqXD7T1MCXqyLqv0
         voBg==
X-Forwarded-Encrypted: i=1; AJvYcCU5scsXdotd3YFE+wlOO1+HxERJm0dHS00v95g5y4uvXuUfZCiufdDS4Lnl9k2feBJ+AtX5POu7Qg/dfp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA9b+T57fOxK/JOFWdef+pUS2MHNuXmI8i5krnNShlLY7Ie6qw
	bRTGMuQskJuYcQfxkyrvbiGCcFDLCxl0DkGdJo0HoSQ4LUqGS5np6IGEtJcgLSuV2c4=
X-Gm-Gg: ASbGncsqm30QZOebIb7u2QBO61Zc05G/dhBRv+lp8chGP1jUI3o4PREDTtDlgERk534
	tRbV3SDGCtMqxzMdcGCnrDM1aIY0kipi4SJ3E79JgM1IYvWzYDIJeGVdwzijY02wkzmayqL+9PW
	5DjP2ca+7dv+9ZcqLCBWQ4Havghd6F3PwQRHRbDh3NCBvzN85T2Fr3ua+KxTXNL5e0gt3fvM6UY
	ozg7yC8z/4NGmo+qxRTu9GHlalUOlQCiImJnvD25iZ7CFyXFjZZHogkYfOzm4Y/qGcnKLdFibzA
	PKIxrhIoAtfvFH8dV1Fx9KSTU+iNIqecDLixFmLiWH0RMPbgQAop34OXgaL+shehrFpm5x1LH5Z
	r8jD6NJNjwVpd7pzg+ijUajmBUytg
X-Google-Smtp-Source: AGHT+IEdhL7k5DzcFwB/JV4pFW3hFU/M2ztaF4G0E1I47kMXHVf4IEu46LQ3/VSTgqWHUuOLyF6tAQ==
X-Received: by 2002:a05:600c:4fc9:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-442fd6271b6mr194407665e9.10.1747728320567;
        Tue, 20 May 2025 01:05:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f182538fsm21418725e9.7.2025.05.20.01.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 01:05:20 -0700 (PDT)
Message-ID: <b6a18331-2f5a-4ce6-a3a5-2a483805cc78@linaro.org>
Date: Tue, 20 May 2025 10:05:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 28/30] drm/msm/dpu: drop ununused PINGPONG features
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-28-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-28-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> All existing PINGPONG feature bits are completely unused. Drop them from
> the current codebase.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 12 ------------
>   1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 9658561c4cb653ca86094d67f7b5dc92d36d38cd..c1488a2c160b0e2ab08243a6e2bd099329ae759b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -87,18 +87,6 @@ enum {
>   	DPU_DSPP_MAX
>   };
>   
> -/**
> - * PINGPONG sub-blocks
> - * @DPU_PINGPONG_SPLIT      PP block supports split fifo
> - * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
> - * @DPU_PINGPONG_MAX
> - */
> -enum {
> -	DPU_PINGPONG_SPLIT = 0x1,
> -	DPU_PINGPONG_SLAVE,
> -	DPU_PINGPONG_MAX
> -};
> -
>   /**
>    * CTL sub-blocks
>    * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
