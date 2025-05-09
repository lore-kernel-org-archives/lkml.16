Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4828722CBF9
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804940; cv=none; b=YnE4IBWyzTye3vUzIblpYzSNGWMrDaPq9msssFkbkORm0HimGjtQYmtXzmJQU04KBgbvommesSPAIdXjQ29uJiRvvXsKIW7cs0zyxQ9jDlqdtgb0GeS52XUpkUh9KUIggDF5iWVqmxuGEBPSvVKdvjdqsxhTlUTTH+RAL5NecXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804940; c=relaxed/simple;
	bh=T6QWhs7RsMCF/1w8Cii+RFTxAaGq6sTRjOKVsID6XpQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=K+Lxq0YaU0kuZ3HA3pbYeQKEeBdxxtfbIGhrcxoeHfmWc3KCKN5NuUiHAXz9fhO3s/LdMBcXGEHRt8zKMw7niyKTfUtu6i3s2FDeCAWC7Jhp3Ukq7IeH17sPUDVH3m0eNrIMy0UmAX9Ds39XyINQLf1Az5QHYk6SNfK/XUrIaJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vNT8o9fb; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vNT8o9fb"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf680d351so19436075e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 08:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746804936; x=1747409736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Lf024pTfan+q9P4HvlL7cyqlLI9Q/+p93cpsiJhSK4=;
        b=vNT8o9fbGu+6XpyQ7IZ+TJORf4+J08nY36qoCErwc6jWJWmNqbW9qxCLHrHvqPnwh2
         Sd7AEum2a8xo+Keoh8MONNMKZsnTWIfs3c54pX3UphFkTu22VVPO8RPujMtD25OcF1Sa
         ki/xaqajDRlrQMfWSQvN+woT4Z9iXXct1pZLDFp4XeLpd5Ynm5LBlGED8kOL74sP9+f4
         AguUuaPJoKCAVUFZ6M+1t/uZDojKCoCNRdR4aITy/r3pG3Pnm2fOs4Vev8C+elNTcldX
         Dse5gsefPugcVsf8ScDRZzeFMR+NY3mX02pO9QQ9T+zwODKFSaWzzE2/HUUyhSLJYa23
         zV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804936; x=1747409736;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8Lf024pTfan+q9P4HvlL7cyqlLI9Q/+p93cpsiJhSK4=;
        b=qfru/bcwGNVMo4N0z9J+GQVFdvgt6e0NPHS9omAOdx87vEvmlAntw8HLperxHR4Z+g
         XvwUCRu1fh5UYnFnZBDSx12gtYmH1y2MG46nXpR7QJIVmKvTH7MXmjgPkrPpbjUIFCIz
         Duv2GnRe/XbV6mFUQYMIhpacpV2MAtCAJjGndNlvxipQh7Iuwlswb55Z5TXo8AhV2UJi
         BTh4dokZ/OMHXZekcxD1I1Hs8d7VyVNz4+AjfuZa1yJUZ4kcS27pYEMELrJxRdC4W44x
         yoW0VLgSR3Qxa2iiibT7kwTG6r2LgbdlQyTWMuqrJeLMp+sW6+Y6X1odxtV9z3gbvI1o
         dfrw==
X-Forwarded-Encrypted: i=1; AJvYcCVIB6NEkgh+0nn8uHHZkAIXUprTPLGrPfU8ujbiTn00lCOSUgLDyTIncxI+6n7TCxFEsEmPZqxIPn9OjZg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk5NDl7x6pKHkzrqAg9qYFk6OJF19Tm3ozMr9PNhzJQ9a/yKeM
	SMYvAjQ55/FFLRDm97MSXZdFJP26+aOt/jYZoWWX5UXPgGL8uae23JGDpn+YzZw=
X-Gm-Gg: ASbGncvBWNN5zV71EeP1Vz8rA3u2V9jwHQowF+hHJJ2iIh5hify7vsUoIRiPqopH12C
	yyXOGheo1mef4OzzXewDUpU8JjrUWA0FqOWGQCZMRJJlZSGc3+tj+I9OudUFUA9rMU3KDjq0Ews
	2fbFd94H0EWJzdupMgunNTpmRRW/1YRbnALws25uf9CA1HjsW4jXpvAZoqk9JUUOMk818IOnC94
	fEjrjQPQfxtZleHVh0om/ajtx1d7eOa6S12jhfIXpyNJQW819wsbt9DhObcjmn31+CazBUyphdV
	XJ/qm9lOAYzcdorOux2wYaBj4Aiu2X+Y9tsKEe4JsSpnyp5sUXokIifjP7qoBzEBZyifXjqS+2N
	c/pQfHpyDLRXes9E=
X-Google-Smtp-Source: AGHT+IHee8AoQ48Wmh4QoUcNKP20otCxG3keyweeVnCtmCpXbPFY1XMvweqwVZVtf5GlL3zDrP25Eg==
X-Received: by 2002:a5d:5f86:0:b0:39b:f44b:e176 with SMTP id ffacd0b85a97d-3a0b99504f7mr7296980f8f.24.1746804936618;
        Fri, 09 May 2025 08:35:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:22d7:71a:9f62:f7e2? ([2a01:e0a:3d9:2080:22d7:71a:9f62:f7e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2961sm3570883f8f.45.2025.05.09.08.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 08:35:36 -0700 (PDT)
Message-ID: <6d2f35ee-1b33-40b6-b164-ab4480110e49@linaro.org>
Date: Fri, 9 May 2025 17:35:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/meson: Use 1000ULL when operating with mode->clock
To: I Hsin Cheng <richard120310@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, christophe.jaillet@wanadoo.fr,
 skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250505184338.678540-1-richard120310@gmail.com>
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
In-Reply-To: <20250505184338.678540-1-richard120310@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/05/2025 20:43, I Hsin Cheng wrote:
> Coverity scan reported the usage of "mode->clock * 1000" may lead to
> integer overflow. Use "1000ULL" instead of "1000"
> when utilizing it to avoid potential integer overflow issue.
> 
> Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1646759
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>

Could you add a Fixes tag ?

Thanks,
Neil

> ---
> Changelog:
> 
> v1 -> v2:
> 	- Use 1000ULL instead of casting the type of "mode->clock"
> 	- Refine commit title and message
> 	- Fix the issue for the evaluation inside drm_mode_status
> 	  meson_encoder_hdmi_mode_valid() as well
> 
> Christophe,
> Thanks for your review and your suggestion, I think I should add a tag
> for you,too, but I'm not sure what should I add, if you would be so kind
> please let me know how should I tag you in the patch.
> 
> Best regards,
> I Hsin Cheng
> ---
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 7752d8ac85f0..c08fa93e50a3 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -75,7 +75,7 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
>   	unsigned long long venc_freq;
>   	unsigned long long hdmi_freq;
>   
> -	vclk_freq = mode->clock * 1000;
> +	vclk_freq = mode->clock * 1000ULL;
>   
>   	/* For 420, pixel clock is half unlike venc clock */
>   	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
> @@ -123,7 +123,7 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
>   	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
>   	struct meson_drm *priv = encoder_hdmi->priv;
>   	bool is_hdmi2_sink = display_info->hdmi.scdc.supported;
> -	unsigned long long clock = mode->clock * 1000;
> +	unsigned long long clock = mode->clock * 1000ULL;
>   	unsigned long long phy_freq;
>   	unsigned long long vclk_freq;
>   	unsigned long long venc_freq;

