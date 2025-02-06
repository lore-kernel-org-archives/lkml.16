Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2FF235370
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859567; cv=none; b=WGauxR5K0o4j3scfN4Bt4xtlz/ufeT2qhTj3BGQ2vE4PaOQCa+n0XNTJROaOeFbijvqdyK/RAAzt9p9LvUS7/ksECaTfDlWNH1bP8u8ISvcYWouVJHDbRmR83Qn6OcKWJROZKht79z3k/Hq75WTnMJG1J08NLW/W+lnvCDbGrtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859567; c=relaxed/simple;
	bh=jj2q4Y5/kinjIhFlJ7jl8lzGc1VVDeaMmYEb7/yxo7Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=L+C0rI8iH5zEOpSdYsMLcRPOVNhJPW8mV4/eZTeSZp9dznrTUPYkp4rbihER/OLu1V2igswtBQ46z87jascC4dq+lt41WOCwKlt+UX9KM1qSc5+82SfuONl6bzdXGbSd2WrxpXdujjxfy1eu7f5W6pAr/paWtavN1zp/Czv6LNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gcIDXJrA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gcIDXJrA"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso11353265e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 08:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738859563; x=1739464363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LrX4aXgNAaqC2pLZXXSBxJoznD/P2IXrnuC12Tf7uZY=;
        b=gcIDXJrAaNgV49h36VNXxypManyOO+NNV1kTuIcupjTG8UKUgVHVovHX+uwQtEs/VI
         EOe0vEA5XcKJRD3/tbEQ4kVvkXvCkiyVWaloXU9lKb1w1vhGQyf+m/IR0QdeTXVWj+Ab
         7hLNkSzhDTeff1ZItiagXw7Ut9DH91bZW1UmFTt/K4nyc7aiSYRutx+D1AUewT1VuZii
         pRKztqnrC7+bzBdDJXoaODDmn64a5jZC9sd3mypC8B8Vpr2ZlpLQGOHwnTNIuJtcr5D5
         JTJ21t+Pa0hNrJ/TuJhHuSkIgtpaYE8tceiIDsb6JPpZzeWncmaDR3ys9/fY2TkTMEPR
         YkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738859563; x=1739464363;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LrX4aXgNAaqC2pLZXXSBxJoznD/P2IXrnuC12Tf7uZY=;
        b=sebkDipfuOblKq7E8PYSrXRdo1By7zL7Id4h+otYSnPJwIl5R6VpzULFQh2DfU/xqG
         NWb9G0f7CsGi8zDStifaAjTTkBmZDL8qgLFew4xT0mteRmz2QhZCm/Mip4Pb+nc1G/tf
         Pkg7TJ2iQKuAnCBhQbrfk75FAVYkehBmkLThWTkXK5D2894z6OZtXi/kFpRiKy96foK/
         pf1GevpCxRQOWdeEqlXwU4SK83dZbObazxLrHCdCLcZUeHU9crBUls9swtnAwAkAOfos
         OID3vvXvvOC6jqFSYMnQgvbAI0fSwDB5yIBc4J2svmgXIsiepBa8sGn8t5JqhAeoiHy3
         sSJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZcvIONXhQ5B449D6If1GDU54m9A/Ds3N+C5kJAfV3LZJeqdQjnId5eylnUyDrjlTIJfNv+2y/EsdyWpY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy8JL1lc4E4PFQXhYv75o4/dNWqF8EyNyY24wZRwrH1AtBFbAu
	5pd6Ib0lXPWYdtkQs8buJRowEzVMS80SoTMwHWoRJz1ctwn8tfHMCibx0o6iUK0=
X-Gm-Gg: ASbGncvdXw2o7z/H641+5CDAhbVo/yeZY5tN+VSL33CwZmfBy8c4gRdFw6HtVPijLsL
	Kfa6GlocOPx7zKadj63E+PrNFRJbZEeq3sIANpMtqBBod2U0Pzem97gcWYE7JG71mPqoJVFNrJt
	xPUF3R+qahZfRSh0gCyeQhlIrCUvHugff8uvnx1Rsl559j4KIZi2ZoUapqfLnNkizXjBx+RUIkv
	4lvx6sWYISDaqGhzE3gUC3EEqQAfoEbxG+a7xdVHrs9hB021vgLXmPOUgrpu8ejJrhJioemQi2y
	kYN+LzH77XwWhco/iNaXw3s2bLmovfGAmzyMftCltPu0xLFi7cZhHDU3i+LIqdN3RA+y
X-Google-Smtp-Source: AGHT+IE9K/O1p4oeSMlme4SzJ9IMsECI9mFi2Gjm929bnlAW5rnGP22AK3SfaB6uqKRF7LO/NDawPg==
X-Received: by 2002:a05:600c:3d0b:b0:431:44f6:566f with SMTP id 5b1f17b1804b1-4392498fc5dmr630895e9.13.1738859562939;
        Thu, 06 Feb 2025 08:32:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6? ([2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d40csm59722365e9.9.2025.02.06.08.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 08:32:42 -0800 (PST)
Message-ID: <eb01b1a6-426e-49d6-a16e-3673157243ac@linaro.org>
Date: Thu, 6 Feb 2025 17:32:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 3/3] drm/panel: panel-himax-hx83102: support for
 csot-pna957qt1-1 MIPI-DSI panel
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>,
 quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
 <20250206131300.1295111-4-yelangyan@huaqin.corp-partner.google.com>
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
In-Reply-To: <20250206131300.1295111-4-yelangyan@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/02/2025 14:13, Langyan Ye wrote:
> The csot-pna957qt1-1 is a 10.95" TFT panel. The MIPI controller on this
> panel is the same as the other panels here, so add this panel to this
> driver.
> 
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx83102.c | 123 ++++++++++++++++++++
>   1 file changed, 123 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> index 8b48bba18131..ba5e5b7df5fc 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> @@ -43,6 +43,7 @@
>   #define HX83102_SETGIP1		0xd5
>   #define HX83102_SETGIP2		0xd6
>   #define HX83102_SETGIP3		0xd8
> +#define HX83102_UNKNOWN_D9	0xd9
>   #define HX83102_SETGMA		0xe0
>   #define HX83102_UNKNOWN_E1	0xe1
>   #define HX83102_SETTP1		0xe7
> @@ -291,6 +292,103 @@ static int boe_nv110wum_init(struct hx83102 *ctx)
>   	return dsi_ctx.accum_err;
>   };
>   
> +static int csot_pna957qt1_1_init(struct hx83102 *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	msleep(60);
> +
> +	hx83102_enable_extended_cmds(&dsi_ctx, true);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc4);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D9, 0xd2);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x2c, 0xb3, 0xb3, 0x31, 0xf1, 0x33,
> +				     0xe0, 0x54, 0x36, 0x36, 0x3a, 0x3a, 0x32, 0x8b, 0x11, 0xe5,
> +				     0x98);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xd9);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x8b, 0x33);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP, 0x00, 0x47, 0xb0, 0x80, 0x00, 0x2c,
> +				     0x80, 0x3c, 0x9f, 0x22, 0x20, 0x00, 0x00, 0x98, 0x51);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x41, 0x41, 0x41, 0x41, 0x64, 0x64,
> +				     0x40, 0x84, 0x64, 0x84, 0x01, 0x9d, 0x01, 0x02, 0x01, 0x00,
> +				     0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETVDC, 0x1b, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_BE, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xfc, 0xc4, 0x80, 0x9c, 0x36, 0x00,
> +				     0x0d, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSTBA, 0x32, 0x32, 0x22, 0x11, 0x22, 0xa0,
> +				     0x31, 0x08, 0xf5, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcc);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTCON, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc6);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETRAMDMY, 0x97);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPWM, 0x00, 0x1e, 0x13, 0x88, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x08, 0x13, 0x07, 0x00, 0x0f,
> +				     0x36);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPANEL, 0x02, 0x03, 0x44);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPCTRL, 0x07, 0x06, 0x00, 0x02, 0x04, 0x2c,
> +				     0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x06, 0x00, 0x00, 0x00, 0x40, 0x04,
> +				     0x08, 0x04, 0x08, 0x37, 0x07, 0x44, 0x37, 0x2b, 0x2b, 0x03,
> +				     0x03, 0x32, 0x10, 0x22, 0x00, 0x25, 0x32, 0x10, 0x29, 0x00,
> +				     0x29, 0x32, 0x10, 0x08, 0x00, 0x08, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP1, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> +				     0x18, 0x18, 0x18, 0x18, 0x07, 0x06, 0x07, 0x06, 0x05, 0x04,
> +				     0x05, 0x04, 0x03, 0x02, 0x03, 0x02, 0x01, 0x00, 0x01, 0x00,
> +				     0x18, 0x18, 0x25, 0x24, 0x25, 0x24, 0x1f, 0x1f, 0x1f, 0x1f,
> +				     0x1e, 0x1e, 0x1e, 0x1e, 0x20, 0x20, 0x20, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0x0a, 0x2a, 0xaa, 0x8a, 0xaa, 0xa0,
> +				     0x0a, 0x2a, 0xaa, 0x8a, 0xaa, 0xa0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGMA, 0x0a, 0x0e, 0x1a, 0x21, 0x28, 0x46,
> +				     0x5c, 0x61, 0x63, 0x5e, 0x78, 0x7d, 0x80, 0x8e, 0x89, 0x90,
> +				     0x98, 0xaa, 0xa8, 0x52, 0x59, 0x60, 0x6f, 0x06, 0x0a, 0x16,
> +				     0x1d, 0x24, 0x46, 0x5c, 0x61, 0x6b, 0x66, 0x7c, 0x7d, 0x80,
> +				     0x8e, 0x89, 0x90, 0x98, 0xaa, 0xa8, 0x52, 0x59, 0x60, 0x6f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0xe0, 0x10, 0x10, 0x0d, 0x1e, 0x9d,
> +				     0x02, 0x52, 0x9d, 0x14, 0x14);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x01, 0x7f, 0x11, 0xfd);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc5);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x4f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x86);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D2, 0x64);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc5);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0x0a, 0x2a, 0xaa, 0x8a, 0xaa, 0xa0,
> +				     0x0a, 0x2a, 0xaa, 0x8a, 0xaa, 0xa0, 0x05, 0x15, 0x55, 0x45,
> +				     0x55, 0x50, 0x05, 0x15, 0x55, 0x45, 0x55, 0x50);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x02, 0x00, 0x24, 0x01, 0x7e, 0x0f,
> +				     0x7c, 0x10, 0xa0, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x03, 0x07, 0x00, 0x10, 0x7b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0x0f, 0x3f, 0xff, 0xcf, 0xff, 0xf0,
> +				     0x0f, 0x3f, 0xff, 0xcf, 0xff, 0xf0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0xfe, 0x01, 0xfe, 0x01, 0xfe, 0x01,
> +				     0x00, 0x00, 0x00, 0x23, 0x00, 0x23, 0x81, 0x02, 0x40, 0x00,
> +				     0x20, 0x9d, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +				     0x01, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP, 0x66, 0x81);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc6);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x03, 0xff, 0xf8);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0x0a, 0x2a, 0xaa, 0x8a, 0xaa, 0xa0,
> +				     0x0a, 0x2a, 0xaa, 0x8a, 0xaa, 0xa0, 0x0f, 0x2a, 0xaa, 0x8a,
> +				     0xaa, 0xf0, 0x0f, 0x2a, 0xaa, 0x8a, 0xaa, 0xf0, 0x0a, 0x2a,
> +				     0xaa, 0x8a, 0xaa, 0xa0, 0x0a, 0x2a, 0xaa, 0x8a, 0xaa, 0xa0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
> +	hx83102_enable_extended_cmds(&dsi_ctx, false);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 60);
> +
> +	return dsi_ctx.accum_err;
> +};
> +
>   static int ivo_t109nw41_init(struct hx83102 *ctx)
>   {
>   	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> @@ -440,6 +538,28 @@ static const struct hx83102_panel_desc boe_nv110wum_desc = {
>   	.init = boe_nv110wum_init,
>   };
>   
> +static const struct drm_display_mode csot_pna957qt1_1_default_mode = {
> +	.clock = 177958,
> +	.hdisplay = 1200,
> +	.hsync_start = 1200 + 124,
> +	.hsync_end = 1200 + 124 + 80,
> +	.htotal = 1200 + 124 + 80 + 40,
> +	.vdisplay = 1920,
> +	.vsync_start = 1920 + 88,
> +	.vsync_end = 1920 + 88 + 8,
> +	.vtotal = 1920 + 88 + 8 + 38,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct hx83102_panel_desc csot_pna957qt1_1_desc = {
> +	.modes = &csot_pna957qt1_1_default_mode,
> +	.size = {
> +		.width_mm = 147,
> +		.height_mm = 235,
> +	},
> +	.init = csot_pna957qt1_1_init,
> +};
> +
>   static const struct drm_display_mode ivo_t109nw41_default_mode = {
>   	.clock = 167700,
>   	.hdisplay = 1200,
> @@ -681,6 +801,9 @@ static const struct of_device_id hx83102_of_match[] = {
>   	{ .compatible = "boe,nv110wum-l60",
>   	.data = &boe_nv110wum_desc
>   	},
> +	{ .compatible = "csot,pna957qt1-1",
> +	  .data = &csot_pna957qt1_1_desc
> +	},
>   	{ .compatible = "ivo,t109nw41",
>   	  .data = &ivo_t109nw41_desc
>   	},

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
