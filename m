Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E4928E575
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749040129; cv=none; b=s3ScSyrfmaVo6ZLvnyX8XuvrMV9W7z3kKED4QUW6zBzn88tIrWjYu1uQ9Wn+Safj/l69fsEUyXrlH84eH0v1pRDoMCTmzQmCsRgAhtZLCdioLYCXotGQCHi8x5S/lQu8jQCnddFvz11bbiJo5H0i5LD4sET7pnZ4Jg/HcNmm4fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749040129; c=relaxed/simple;
	bh=zjDDB5TW++8UXKoaEJDw0k+J96PErHvkj6jidnGYHio=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=KQzlVs9JcixOMc3qsXTlFEWPQzNXXOgweA1sUXJVRx+hMa6fMA8W/ouP8NVEYmAztW+XyHhEWBFSuaiu/uop7P8XLp/rCInWAaNeNEi4YZqI4agpKXiGmSJsZ5XnKgIRV9UEmUoDdCh00FhasUwqeRaTHzRkU75cl7LD403OUa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VwplEXUK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VwplEXUK"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso61820205e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 05:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749040126; x=1749644926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHUZpm8njqGD1R+5qQCk1RIh5pT7PqWdA9OuJlsd1W4=;
        b=VwplEXUKBuBGFeDBkGKyvm68SxCEiF48KfW9BkaapvOvrdSfkjUWq5RBxgFhPVqpd3
         9KR35/GaFPtg1G+zP25n8iI6SxyBC8B/FBaXrOo+PdsW6aLeIRIE1ZWx18c6xTygLRHk
         cOzaGOexEnoiUWawgpbcknVhxvWxDZypNP6RrCP7P3srTbiZw809jYr8MLDbzGSzBPbB
         DjTusJUime8euKnuOKwBBjdjjwOmd7Hz9gq3pX1m4NGKJKSaQtSNgFSXs8ztivm7xxC7
         v8Ak9e3DGwVSsA9wpissAw59FNV/MDUW4rUkXep2HzHaJ1E0LkMwyo0J831Gl5thHVJz
         WeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749040126; x=1749644926;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tHUZpm8njqGD1R+5qQCk1RIh5pT7PqWdA9OuJlsd1W4=;
        b=ZR2c+tewpNJk3av+lDxQFY3LItokgYaopmZlOY8COpSGig6+EFRFFZJpTJlQCnjFUE
         aMHGbPadNWQ8INQXAabFc/hMOSC4hLXxv8w7IRdZWft7oWAzTixWVWwHgr51RsLDJC/G
         RpVl1YzwY6ah7ShzekJ5sVwOu7ST5OppzqIT3tIHBf1ptCxtaFDE77c3DY3LTCF2ABRb
         NB1Fvc13thdne4te5lgvlXy9EWQuWXhrT4PGkkMW+JggOMNcTSe+8LN59l9n4R69z+In
         wV1x6LxR+/oKvbxrf6btZ07LKDg66bTLBNXWf9tiijc1n6F/g4IqNT7pYpyJrdkOjKSD
         930w==
X-Forwarded-Encrypted: i=1; AJvYcCUi2hB68odjIus7RVZdbpHYINYqFuEW33wdYXRDb1f80anaShJixHAn3nLa0QZrfrFCTXIo7NowHgNM+m8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHro+x7TxQnUdN5wuvqzZg6nknlQQ3Ud9ZZsTnFEYNIVPvaQ+X
	A7k++9/h3gACBrIuDimESyxGKnIR91gi1FJx5twLmIFfI0+rfPbTI8xxbOiSDtYcaA4Zz9YncL8
	AHyd2
X-Gm-Gg: ASbGncusK9bvU1/5CGvusgxQoMn+IUa1SoEtkTmpWSsSPsoondSj5q7AI+EJi1CwEIc
	Vj1UrIMgBqo4XFcG5FhCnVwFNF7yhpMpfLSOEAuepUfVnwbGVkh86oOrBHtxAWaC/yz3xf+goyU
	9J3toKH+9fBVeqbJkPzemx5iwxECODJ7XQWZ/vKn8aXuoav46uPUueH7H5DfqdocU5Sq950yvKB
	/rVXdmcsaAJkIyaTqn607Nh6vGVhxNT9RLnpQmj3zDLgitYow/SR7S/OEavO6t/5IQFXECclYQF
	WACCAmDMlSqfmr2XWSauuHMnfVE7egrRi+rBQG6SRnqJ1dXaE4nfR5rjbsW/23eeE9wMeR9iZtD
	Vqntm7ADCDN0t6IWK+vBpHtqDUkSItW2f2zta
X-Google-Smtp-Source: AGHT+IGDdLAfgUp5HWmKCRd1uJdegDgfmDSuEKDECzU4lLA24gzbXSvP/6fE/XhTFHX4AkEn5oZjvw==
X-Received: by 2002:a05:600c:8b25:b0:442:ffb1:b58 with SMTP id 5b1f17b1804b1-451f0a77006mr27764845e9.12.1749040125854;
        Wed, 04 Jun 2025 05:28:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fef9:cf1c:18f:2ab8? ([2a01:e0a:3d9:2080:fef9:cf1c:18f:2ab8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b8a8sm21295168f8f.5.2025.06.04.05.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 05:28:45 -0700 (PDT)
Message-ID: <315f5ec8-a022-4da0-80d4-8ddbea0778ae@linaro.org>
Date: Wed, 4 Jun 2025 14:28:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Update my email address for DRM Panel
 reviews
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org
References: <20250603-panel-maintainer-update-v1-1-224aaa222d99@oss.qualcomm.com>
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
In-Reply-To: <20250603-panel-maintainer-update-v1-1-224aaa222d99@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2025 03:18, Jessica Zhang wrote:
> Update my email with *.qualcomm.com address
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ac8da9a3baa3..e94d21953227 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8208,7 +8208,7 @@ F:	drivers/gpu/drm/clients/drm_log.c
>   
>   DRM PANEL DRIVERS
>   M:	Neil Armstrong <neil.armstrong@linaro.org>
> -R:	Jessica Zhang <quic_jesszhan@quicinc.com>
> +R:	Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> 
> ---
> base-commit: 0f6afbb2ae6c9bd2acd5acf75762fec68bc6fab0
> change-id: 20250603-panel-maintainer-update-dd26f90ade0a
> 
> Best regards,

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
