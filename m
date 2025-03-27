Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38C83A1BA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743062784; cv=none; b=L1L1i0m3DR/i2KqTSpFNjcbJoYuykjtCLZ2ogjETWfRoPWb4XvozNGwMGYWuPx5jos5QcFNUTIR6dzfjwHTuiZ3FInIgrQ8u8dPAHxOTKqb2g/DJ8ijadIA+U5tB5+gcC4vS38jZ0JsYlQW4S+cKRS4D1bf0HJxwYr2IuuWd1JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743062784; c=relaxed/simple;
	bh=suPzyQtLHmOej0ZRXwCt3tlc06jSc6cr8esmQf/lvqA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=L9oMIx0cWTDORfGnZs1Y1jb0lIe0R1CfD5yISogEoWta99rpPSfY9RhgfOUQqAuET8dMs0IQnJ5VwcvGM/+0c0BZOsRw9plkrpkx85qFRVfaSQaivTV+cQ3xlLpWRmQzsEWe9Q6nnqsJ4F9HX9g4O2UEcFnkPdFSxVXxKNspAQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IWMPEmmI; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IWMPEmmI"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso447491f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 01:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743062781; x=1743667581; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGhMa6VJYbtCJhexlEsKzPhCgiEy8U388NfgKgjW8zw=;
        b=IWMPEmmIIi0Rt3HEiZ4ha6hG/cMaCBnZ0GDed6cYgP49hajZBHhYm0RSarZ0yomN1S
         ELFmArlZyA7QTH0qi2mLaRyxUoKvVGavDbqJlPsUltAxjgy9eL7vyPp9mR3W2NzNHeow
         zEnI1RF3pU8fBMxowoCqDurxpVwGxyFFxOln4f0thWMxLq1t4jmnMtFi6Kyxv/GSGPf2
         wQHhVBzI5+TBFF2i3fj3jerGGom/XaUUS9t1qjXoFc8Itw7UiarfeNQcj8/1Rf38LwTO
         SG0/510FjQ7HpKXm7pHdtCSnuApxYlA7EBvNnqqRyrbFjp7zowEuAqcJrkKLCmvkx83E
         5AJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743062781; x=1743667581;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NGhMa6VJYbtCJhexlEsKzPhCgiEy8U388NfgKgjW8zw=;
        b=UvyvQnOHpkME130Ugy+JQPIjoAQroeXzda0CUkYp+BL37fJSROr+m2hWrXAR+UaRHK
         oGK0HmOrlfYitVx1FpY4Eq3U+wXdy0XR/U/XO3JbuEwlpSSl2bsTURXIxuFC9XtI95OR
         QvppnNPJiZBwZ2o7KA5d6DbPCej9vcKb3rKjIRiv/6QwIg79tYghfoHYy9FzlBF39mS8
         cCHVv/52PfL00lWsv1z48sNq3AFQQ7F0/z2GPzmH56Vc2VvAOFN+hVIRqflTxARSK5/f
         VX8jhTAjWaDVzIoj++Wpt25zKo0MutTE8YCnBYo9T27RdayWQ5uL7R06YwrXxBV8tu6d
         UIlg==
X-Forwarded-Encrypted: i=1; AJvYcCWjc9mGQjLU0oyYblJDlliUpbC67vVfmBbwwCJetVOmcBbs5fbjkM8yY0AWrmmsUOg4GuBa7gJcYSUgebQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz+5cyq5TPS3bulsESHRE12jvwIhvCKhSPaFANnqxDprMI2J+m
	rcw27D2rclfw6+vEKIy4QnzqNuiawYfBuzFfI3jE/pUZpDRJm8pVzwoXoWiB0f2ovmAY0WRXdfR
	h
X-Gm-Gg: ASbGncvsJawmjJoehxVtcaMhb4VuYQ1umOYfxhw7ZhRbIx0fyWo6yyVLznJRqCXv1BP
	ZathY1dEgztApyFsLDSDyxponqSC6WOcHfzcTPg4++QJms+5f7pEL8LqHeXIFj38Q5oGr8hlD0f
	ISWC50Yna9BrWkA+bv4UIpCq98RkcXD25jJX03xgMhU+1OFine54X3m9ChyBPH49nJPGlsQmiH6
	D6ygj9aB8HwM0VCsMMm6Q1S7COmLaX2GqunmZLxjnznxIt1TiOUPgEVT5f7u2DEE74jvglLeJrQ
	EMU14cN4WC1H8lEfj56sQIpJNIIfEYbF2aYUP/TbkzXvaSwlxZN//8z/6fM7AA7pnLJLWy9kYse
	oECBdzZGFJUFRhM+dH0BtmQ==
X-Google-Smtp-Source: AGHT+IGlt6rlDFgTvO9wTKCBHAZ8EwdVocHZ/7C3zQte/0P8cUQG9dipSQL6RmeM+FecfjlCH56JZQ==
X-Received: by 2002:a05:6000:420c:b0:391:2f2f:818 with SMTP id ffacd0b85a97d-39ad1740a53mr1983112f8f.9.1743062781157;
        Thu, 27 Mar 2025 01:06:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f1b8:272a:1fa5:f554? ([2a01:e0a:3d9:2080:f1b8:272a:1fa5:f554])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82dedea3sm31136235e9.3.2025.03.27.01.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 01:06:20 -0700 (PDT)
Message-ID: <3b91b3ce-92ca-4499-b3ba-e4f93d005136@linaro.org>
Date: Thu, 27 Mar 2025 09:06:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3] drm/panel/sharp-ls043t1le01: Use _multi variants
To: Anusha Srivatsa <asrivats@redhat.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tejas Vipin <tejasvipin76@gmail.com>, Doug Anderson <dianders@chromium.org>
References: <20250326-b4-panel-ls043t1le01-v3-1-96c554c0ea2b@redhat.com>
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
In-Reply-To: <20250326-b4-panel-ls043t1le01-v3-1-96c554c0ea2b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2025 04:29, Anusha Srivatsa wrote:
> Move away from using deprecated API and use _multi variants
> if available. Use mipi_dsi_msleep() and mipi_dsi_usleep_range()
> instead of msleep() and usleep_range() respectively.
> 
> Used Coccinelle to find the _multi variant APIs,replacing
> mpi_dsi_msleep() where necessary and for returning
> dsi_ctx.accum_err in these functions. mipi_dsi_dcs_write()
> does not have a corresponding _multi() variant. Replacing it with
> mipi_dsi_dcs_write_seq_multi() instead. This change is manual.
> 
> The Coccinelle script is the same as the one in commit c8ba07caaecc
> ("drm/panel/synaptics-r63353: Use _multi variants")
> 
> v2: Use mipi_dsi_write_buffer_multi() in place of
> mipi_dsi_dcs_write(). (Dmitry)
> 
> v3: add commit details where the same coccinelle script is
> used and remove the actual script from commit log.
> Use mipi_dsi_dcs_write_seq_multi() for mipi_dsi_dcs_write() (Doug)
> 
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Tejas Vipin <tejasvipin76@gmail.com>
> Cc: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
> Changes in v3:
> - Simplify commit log by adding a reference to a patch that uses the
>    same script.
> - Simplify code by using a helper that doesnt need additional code
>    changes other then using the helper itself.
> 
> - Link to v2: https://lore.kernel.org/r/20250324-b4-panel-ls043t1le01-v2-1-e43aedc115be@redhat.com
> 
> Changes in v2:
> - While mipi_dsi_dcs_write() does not have a corresponding _multi()
>    variant replace it with mipi_dsi_dcs_write_buffer_multi() to have all
>    APIs following _multi() usage for easier error handling
> 
> - Link to v1: https://lore.kernel.org/r/20250316-b4-panel-ls043t1le01-v1-1-ee38371b0ba0@redhat.com
> ---
>   drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c | 41 +++++++++----------------
>   1 file changed, 15 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> index 729cbb0d8403ff7c0c4b9d21774909cc298904a2..36abfa2e65e962af2a08aec3e63ba1077a2c43d4 100644
> --- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> +++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> @@ -36,60 +36,49 @@ static inline struct sharp_nt_panel *to_sharp_nt_panel(struct drm_panel *panel)
>   static int sharp_nt_panel_init(struct sharp_nt_panel *sharp_nt)
>   {
>   	struct mipi_dsi_device *dsi = sharp_nt->dsi;
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>   
>   	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>   
> -	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> -	if (ret < 0)
> -		return ret;
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>   
> -	msleep(120);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
>   
>   	/* Novatek two-lane operation */
> -	ret = mipi_dsi_dcs_write(dsi, 0xae, (u8[]){ 0x03 }, 1);
> -	if (ret < 0)
> -		return ret;
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xae,  0x03);
>   
>   	/* Set both MCU and RGB I/F to 24bpp */
> -	ret = mipi_dsi_dcs_set_pixel_format(dsi, MIPI_DCS_PIXEL_FMT_24BIT |
> -					(MIPI_DCS_PIXEL_FMT_24BIT << 4));
> -	if (ret < 0)
> -		return ret;
> +	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx,
> +					    MIPI_DCS_PIXEL_FMT_24BIT |
> +					    (MIPI_DCS_PIXEL_FMT_24BIT << 4));
>   
> -	return 0;
> +	return dsi_ctx.accum_err;
>   }
>   
>   static int sharp_nt_panel_on(struct sharp_nt_panel *sharp_nt)
>   {
>   	struct mipi_dsi_device *dsi = sharp_nt->dsi;
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>   
>   	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>   
> -	ret = mipi_dsi_dcs_set_display_on(dsi);
> -	if (ret < 0)
> -		return ret;
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>   
> -	return 0;
> +	return dsi_ctx.accum_err;
>   }
>   
>   static int sharp_nt_panel_off(struct sharp_nt_panel *sharp_nt)
>   {
>   	struct mipi_dsi_device *dsi = sharp_nt->dsi;
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>   
>   	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>   
> -	ret = mipi_dsi_dcs_set_display_off(dsi);
> -	if (ret < 0)
> -		return ret;
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>   
> -	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> -	if (ret < 0)
> -		return ret;
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>   
> -	return 0;
> +	return dsi_ctx.accum_err;
>   }
>   
>   static int sharp_nt_panel_unprepare(struct drm_panel *panel)
> 
> ---
> base-commit: dbe74119ff71c00f2d863a32f72aab2d15e61c39
> change-id: 20250316-b4-panel-ls043t1le01-7407b896b7a8
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
