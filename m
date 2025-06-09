Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBEB21C9F2
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 17:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749490458; cv=none; b=BZOj2HTiMOvMG/6mZ47Fniz7gHC48STgJuiAMFe9vvdFuWd97knv5fuPf2Wr2THdF72hIwZpesR9IJEQ/tptLMTxsXKqbYIkfgQgDTicN2ZdJcIiMZmEAetBI64ewRBPOE0ZtpLkNMpGFim5deqSvU/4/uVLE0fp9QybNWkS4Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749490458; c=relaxed/simple;
	bh=cI/XyzNZz4jR3deqzWHJHcJsVaGiftu7JJEkZOUtes8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oej5YiOvgYJcjSLvhXVJx2r9ejNSPsECLT0bWAOYfan1bKIRR48Uk8H1MxjTRbyriO4bkyX8DgSZbn1LwE9gtYtOWlpQthxwbKKxEPUmPtTCxFUufzg3skwRj4qWULWLqtoHDfXZMW93V7l+d7/e3kQab3xuyRdLA1xbrHRxiuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NAJsnOR2; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NAJsnOR2"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so3624159f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 10:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749490454; x=1750095254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9BmRKlj/RMDP5IzXSFzdO4da8XFCR2YzozS+rvgK1WE=;
        b=NAJsnOR2SeBEknsf2iRpaaLs0SJT/7uJ3bMCEXVtIE3S5O63gwMapFUMEX8yTolM3w
         XbxEZcmW8iig0YzuXfSqmCLdKBljMjjwup4B5BWIH4Nmdjo3o/y+ew/jaSdqqXD9rJ78
         OW4uaYam7lBG+8SUw7LDfWUJ33i1wuTDODO25bfXpVjgjVh/rk/jyzUaStEDKy/o0mPm
         wJHPGYS1rV685Xu0UuOhFqcjs+gqerHFLrZh+sIxI0eBovpCquW0h6V1kLHKUS6kdclv
         P5yS2dhah4meoqvOvDsvKrVHJlackGNCve+kYiEEuC/SobiXX0wjnLkObBTzKuL44Lql
         B/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749490454; x=1750095254;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9BmRKlj/RMDP5IzXSFzdO4da8XFCR2YzozS+rvgK1WE=;
        b=GSqYV7y2DKxZapcR7/4UB0b68kn3C5QjmCVOPbgjg51l0uMdvg4Wlrz074nQ6LJjbq
         KNIQLnyl4V93hzWN2dmhiT36Hv3iKLUnLhC1Ft3KKJps+ds1xpfvNUk1oZNcj9LHWIAN
         wG5mmdEef6GmaezW6jbJMJFxXTpHx6FIEP60ERDDWnoNeUtDT5Z17IU02jt/bqhewIgX
         XK/an5NUvJXmsVOvuHXES3/HsMth7FnaOqUkoAYkojyFOSVMtwUXM/tNzIiAh5KwkYvQ
         VTH+huU2aMWeWprgNatAeHCqtdViYX/mYI5hjEufKOsa/86PpZf4eogWWtbP+hCuehFr
         mLhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhagaEFc276A3IMeHxqwW3yxbshrVs354LQEj6qGbzTuhX1YrsdwaKSddukjfkg+y1zgD2Jr9886mWwhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoUzYL48Q5w+hpsM9LEJD/v4fT3hCDZa/rWu8i/UzFOob/uDW4
	nxlzXFIR+sAwoUq40Qgij0HEEFY6q+w+64GZ2UPfg0AyfI6RCFnf5PYCZ5YR2UfTLI8=
X-Gm-Gg: ASbGncvFVNJ3y4CCn/S1G/Zytn0Ju90LUjvEa30Fm1BPzrlwE6BxmN1H6H7dQ8lSPze
	p4cioLRtsKGu4RXb706kJPqoiDFrUQ32ABRZYtQgPg+HCt6D5TpDTIv1OOrv/JBTlNKq1ZNYAfL
	x4cMHi1R45YwKVEbSm3AC/nBC2GTShwEYx0/ntt9exDBuexbOKgxKpEVV1TED4F0tDGyg+XHMB0
	PPcdF1cGmu7Uu4SVvjbkgc7su68dj9/KRxTVrYjwre2Ns3rW0h0bKn2YWX/wS+rg9Nr3NanaO93
	NIuVu6Lfb0oA6D38F2JPEEnAUtdVlWwr6OZq3tHlLHmbAMAZATovXtmoG3XHq1EP5//xmdxMJRK
	WzZhpMlktqRIo17b+xtlxjtpybcBa
X-Google-Smtp-Source: AGHT+IGkaYk2ZR7eBVSuTYhU38XKPy8+5RJ/cs78kF616gKs+MS4l8QgLXSnlOu4Zk+j1JmLSxgFAw==
X-Received: by 2002:a5d:64c6:0:b0:3a4:eb7a:2ccb with SMTP id ffacd0b85a97d-3a551417255mr318548f8f.16.1749490454350;
        Mon, 09 Jun 2025 10:34:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:d049:de0c:efef:b94d? ([2a01:e0a:3d9:2080:d049:de0c:efef:b94d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730d162asm113789415e9.39.2025.06.09.10.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 10:34:12 -0700 (PDT)
Message-ID: <04556296-bcda-436f-b462-6b1718dafd00@linaro.org>
Date: Mon, 9 Jun 2025 19:34:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: use vclk_freq instead of pixel_freq in debug
 print
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250606221031.3419353-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20250606221031.3419353-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/06/2025 00:10, Martin Blumenstingl wrote:
> meson_vclk_vic_supported_freq() has a debug print which includes the
> pixel freq. However, within the whole function the pixel freq is
> irrelevant, other than checking the end of the params array. Switch to
> printing the vclk_freq which is being compared / matched against the
> inputs to the function to avoid confusion when analyzing error reports
> from users.
> 
> Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/gpu/drm/meson/meson_vclk.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
> index 3325580d885d..c4123bb958e4 100644
> --- a/drivers/gpu/drm/meson/meson_vclk.c
> +++ b/drivers/gpu/drm/meson/meson_vclk.c
> @@ -790,9 +790,9 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv,
>   	}
>   
>   	for (i = 0 ; params[i].pixel_freq ; ++i) {
> -		DRM_DEBUG_DRIVER("i = %d pixel_freq = %lluHz alt = %lluHz\n",
> -				 i, params[i].pixel_freq,
> -				 PIXEL_FREQ_1000_1001(params[i].pixel_freq));
> +		DRM_DEBUG_DRIVER("i = %d vclk_freq = %lluHz alt = %lluHz\n",
> +				 i, params[i].vclk_freq,
> +				 PIXEL_FREQ_1000_1001(params[i].vclk_freq));
>   		DRM_DEBUG_DRIVER("i = %d phy_freq = %lluHz alt = %lluHz\n",
>   				 i, params[i].phy_freq,
>   				 PHY_FREQ_1000_1001(params[i].phy_freq));

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
