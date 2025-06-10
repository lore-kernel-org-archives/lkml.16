Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683AE28ECD3
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557671; cv=none; b=SVFOaW7F8dLSGMf28UQp/4jo6qohCjWEVBn+S9AkP9cdKqMoPSnR9d5W4WIshP4yFzzF7FEyN/pfl4N7KrsXtCpbdLGVQ3kQMUKjyHqMpwp1P7HAuEySeKYmIKZmLYUsxO2XKubkq1CodBefTpFl4ieNKyER4QFvSAejcp1GTqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557671; c=relaxed/simple;
	bh=UqEyzX3tgxZjf0rHsn4e6H4a4wpYQHQDNEtsEDoIZww=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lk4ye3CMc8KE8AcaHPx4ZZMLFf2GIQs6p+jS+O2HYq65FGHy95z8lphWBXC2/7cIA+IhNZx7p9SB/gUIdI81w9OLE8k7K6h9b+CuOZKYRtX1hnkUqnqVqFzP/Z+JLMWW32aEW0+b+AbCNNnJ1HDuLXOut4VbR3Vl7AOyZft/Ngw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HSDoqAx/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HSDoqAx/"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-442fda876a6so47993685e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557668; x=1750162468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DPVdSZMDklf6mtDF12nzBZep9SyWTS1DC6wAFg2MeE=;
        b=HSDoqAx/rGnGEAPg94LPLG8h4sCkLKlH3b8n3TM+N1lhj8xPNVil9pWfQmtdubnRMs
         Wz/eTTMTOeTJNEh/W0YrrnhIosYhjaJN3+00N9vPcArg2RaWKP+U1ItD5sDw7JbgUMFj
         h3WVtOALz845TuBxdkPZBVZbbPMl7UzDPNer1wgnIZxggs+AhY8rMz9oehhGyw10tlUH
         daVHAZqzDFD17AChOlzrYHOlxO+9oxj2IyZrwiUyGoJrwz7lDY1pLKbAd2OJD3D1PDLC
         aQhzi4F1oHHOEEuWfdWesxVg0/Kc0/HpoyQiUurlJAaIkcbiZXx2VuD43WY8GpCklrdB
         5ZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557668; x=1750162468;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/DPVdSZMDklf6mtDF12nzBZep9SyWTS1DC6wAFg2MeE=;
        b=VjffP4w7WBFEHqD2+5L3PZins96x5OOhEJl5LDff4+2x9z+6frHF3Y/oKy1UaR6hjO
         0hHulrt2Ab/1Hnv9qnZuG6KTybI1KAyCVg4EBwijA7JInKuPLXObV4e95obLM/BZYf9g
         sEV0NVKaXiOEm3oJHikMPXih9OnCLkdX5Uq+psoHzBQHSWD9jI+aZ8bQwOJvxslSZDZL
         LsQHC42VmuIhC52N/vFtOtP3QQNvAp4VH2K4tyfqKVEvTSk1h+VsYJYBVGjT4yMlt6pp
         iYCZ5XJBgmZo2651/RP1CoDp1gXxWQzuncOm2iM3EzUU7PldTj+7wAX9nI07GWPW6rza
         2esg==
X-Forwarded-Encrypted: i=1; AJvYcCUujwp2ZhlErm03NUnnzMpcL1kVA4hmFGbteGF3A61tdu3KGhNAK+jtlt8EUq1Or2E89Y2W3bI8C3RUiuM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbPA+XdFWtmV3ti5ewfdsuJow2mIVjRfOFxPtOKRF3IYP5SXOD
	NBz9ZFgDlcpNiPrUUWJdJSZwU7kEvl+3NoAtMFhZJt5X3Nxuj7VZBE/QPig+0uLk0w4=
X-Gm-Gg: ASbGncsx7ys3EWhRWAPn7PCojHufPeDvmuqAF3isy7NAawU9cceuqavnPk3c7+D7xvf
	mmd0VlVEh4sJlbTF/8ThLJobhwLiTOBJpQ6R8yFlQu0cJEai3LQLpOqzZatMTg2c/pVg6CQdYL4
	YdTo54B3bcqppAjOlN3Iax+9VboAXUKAdK8ExvsW23OrEWGYjdFPj7hWtJgaPJ1F/29aXiBgD0m
	HSAb4t4kHIb4vdD5y+SKk1fj5JSYPpy+wzblXGNO75O1Zvqzw72186gM4rxZhIo+xPWgH9pE6NU
	awuDpY4E1o0uss+Cojp4kmM+s+MEMlikWuIdKygtyBOWcz2diII0RJtCyeQPPMLJzBqWNOjKqSI
	+xV/apyMQolEGHlLs4HkhIRvfYyQrDihUiqYbvxaR/ALJ4uc=
X-Google-Smtp-Source: AGHT+IFrXuEadreb3Ra0ecFZUmb9l900iFMIt+FWoBtiuGQI7QU2cCtR641w8MO4Bqrq58Be6Fu0vw==
X-Received: by 2002:a05:600c:3848:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-452013d7cc8mr141430515e9.20.1749557667674;
        Tue, 10 Jun 2025 05:14:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14? ([2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452669ada25sm141140855e9.0.2025.06.10.05.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 05:14:27 -0700 (PDT)
Message-ID: <ec36d5e5-5aef-4d0f-8596-96ef3e674ad7@linaro.org>
Date: Tue, 10 Jun 2025 14:14:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1] drm/meson: fix more rounding issues with 59.94Hz modes
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Hewitt <christianshewitt@gmail.com>
References: <20250609202751.962208-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20250609202751.962208-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/2025 22:27, Martin Blumenstingl wrote:
> Commit 1017560164b6 ("drm/meson: use unsigned long long / Hz for
> frequency types") attempts to resolve video playback using 59.94Hz.
>   using YUV420 by changing the clock calculation to use
> Hz instead of kHz (thus yielding more precision).
> 
> The basic calculation itself is correct, however the comparisions in
> meson_vclk_vic_supported_freq() and meson_vclk_setup() don't work
> anymore for 59.94Hz modes (using the freq * 1000 / 1001 logic). For
> example, drm/edid specifies a 593407kHz clock for 3840x2160@59.94Hz.
> With the mentioend commit we convert this to Hz. Then meson_vclk
> tries to find a matchig "params" entry (as the clock setup code
> currently only supports specific frequencies) by taking the venc_freq
> from the params and calculating the "alt frequency" (used for the
> 59.94Hz modes) from it, which is:
>    (594000000Hz * 1000) / 1001 = 593406593Hz
> 
> Similar calculation is applied to the phy_freq (TMDS clock), which is 10
> times the pixel clock.
> 
> Implement a new meson_vclk_freqs_are_matching_param() function whose
> purpose is to compare if the requested and calculated frequencies. They
> may not match exactly (for the reasons mentioned above). Allow the
> clocks to deviate slightly to make the 59.94Hz modes again.
> 
> Fixes: 1017560164b6 ("drm/meson: use unsigned long long / Hz for frequency types")
> Reported-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Special thanks to Christian for testing (off-list) and managing so I
> can do better testing myself in the future!
> 
> This is meant to be applied on top of "drm/meson: use vclk_freq instead
> of pixel_freq in debug print" from [0]
> 
> 
> [0] https://lore.kernel.org/dri-devel/20250606221031.3419353-1-martin.blumenstingl@googlemail.com/
> 
> 
>   drivers/gpu/drm/meson/meson_vclk.c | 55 ++++++++++++++++++------------
>   1 file changed, 34 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
> index c4123bb958e4..dfe0c28a0f05 100644
> --- a/drivers/gpu/drm/meson/meson_vclk.c
> +++ b/drivers/gpu/drm/meson/meson_vclk.c
> @@ -110,10 +110,7 @@
>   #define HDMI_PLL_LOCK		BIT(31)
>   #define HDMI_PLL_LOCK_G12A	(3 << 30)
>   
> -#define PIXEL_FREQ_1000_1001(_freq)	\
> -	DIV_ROUND_CLOSEST_ULL((_freq) * 1000ULL, 1001ULL)
> -#define PHY_FREQ_1000_1001(_freq)	\
> -	(PIXEL_FREQ_1000_1001(DIV_ROUND_DOWN_ULL(_freq, 10ULL)) * 10)
> +#define FREQ_1000_1001(_freq)	DIV_ROUND_CLOSEST_ULL((_freq) * 1000ULL, 1001ULL)
>   
>   /* VID PLL Dividers */
>   enum {
> @@ -772,6 +769,36 @@ static void meson_hdmi_pll_generic_set(struct meson_drm *priv,
>   		  pll_freq);
>   }
>   
> +static bool meson_vclk_freqs_are_matching_param(unsigned int idx,
> +						unsigned long long phy_freq,
> +						unsigned long long vclk_freq)
> +{
> +	DRM_DEBUG_DRIVER("i = %d vclk_freq = %lluHz alt = %lluHz\n",
> +			 idx, params[idx].vclk_freq,
> +			 FREQ_1000_1001(params[idx].vclk_freq));
> +	DRM_DEBUG_DRIVER("i = %d phy_freq = %lluHz alt = %lluHz\n",
> +			 idx, params[idx].phy_freq,
> +			 FREQ_1000_1001(params[idx].phy_freq));
> +
> +	/* Match strict frequency */
> +	if (phy_freq == params[idx].phy_freq &&
> +	    vclk_freq == params[idx].vclk_freq)
> +		return true;
> +
> +	/* Match 1000/1001 variant: vclk deviation has to be less than 1kHz
> +	 * (drm EDID is defined in 1kHz steps, so everything smaller must be
> +	 * rounding error) and the PHY freq deviation has to be less than
> +	 * 10kHz (as the TMDS clock is 10 times the pixel clock, so anything
> +	 * smaller must be rounding error as well).
> +	 */
> +	if (abs(vclk_freq - FREQ_1000_1001(params[idx].vclk_freq)) < 1000 &&
> +	    abs(phy_freq - FREQ_1000_1001(params[idx].phy_freq)) < 10000)
> +		return true;
> +
> +	/* no match */
> +	return false;
> +}
> +
>   enum drm_mode_status
>   meson_vclk_vic_supported_freq(struct meson_drm *priv,
>   			      unsigned long long phy_freq,
> @@ -790,19 +817,7 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv,
>   	}
>   
>   	for (i = 0 ; params[i].pixel_freq ; ++i) {
> -		DRM_DEBUG_DRIVER("i = %d vclk_freq = %lluHz alt = %lluHz\n",
> -				 i, params[i].vclk_freq,
> -				 PIXEL_FREQ_1000_1001(params[i].vclk_freq));
> -		DRM_DEBUG_DRIVER("i = %d phy_freq = %lluHz alt = %lluHz\n",
> -				 i, params[i].phy_freq,
> -				 PHY_FREQ_1000_1001(params[i].phy_freq));
> -		/* Match strict frequency */
> -		if (phy_freq == params[i].phy_freq &&
> -		    vclk_freq == params[i].vclk_freq)
> -			return MODE_OK;
> -		/* Match 1000/1001 variant */
> -		if (phy_freq == PHY_FREQ_1000_1001(params[i].phy_freq) &&
> -		    vclk_freq == PIXEL_FREQ_1000_1001(params[i].vclk_freq))
> +		if (meson_vclk_freqs_are_matching_param(i, phy_freq, vclk_freq))
>   			return MODE_OK;
>   	}
>   
> @@ -1075,10 +1090,8 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
>   	}
>   
>   	for (freq = 0 ; params[freq].pixel_freq ; ++freq) {
> -		if ((phy_freq == params[freq].phy_freq ||
> -		     phy_freq == PHY_FREQ_1000_1001(params[freq].phy_freq)) &&
> -		    (vclk_freq == params[freq].vclk_freq ||
> -		     vclk_freq == PIXEL_FREQ_1000_1001(params[freq].vclk_freq))) {
> +		if (meson_vclk_freqs_are_matching_param(freq, phy_freq,
> +							vclk_freq)) {
>   			if (vclk_freq != params[freq].vclk_freq)
>   				vic_alternate_clock = true;
>   			else

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
