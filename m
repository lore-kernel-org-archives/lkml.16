Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DB2218ABD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 09:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744019776; cv=none; b=rEjMc42n51xDSFST5IJ56+ee2VUvMpX2nZX7UwaS3iUcuv2liaub7w1ypz6JumPbhMijF+mcX1TGg3qj+5KZC2gXquAdK3TO/6YAMdmuVaWid0s1YpZnCjh9OQYwWLOz03EB3CpgcRFWKjOt5r+wXTsVhlgxyXNK5d7TyY57vqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744019776; c=relaxed/simple;
	bh=UWGQgnddu4SCQwzyPJ1YCmFg6yQRpDeNI9dH9L4fn00=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=X6Usr3kaAMGSVBCy8uR2MzHsoTRoE4JLHDnWP6VOlRx1vaPz9Lp7Z8aM3w1MhOxMBOUL0Ex3IWBvleGHwlgvkPkNq6I9ZkSqsdzpi8NUPigMBApBfHr5OyyvGDrgU3iihTAHvJBJIt7JMpB2b7IPD1lnxQemWIFnJWypOxbBy0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=reYVnccm; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="reYVnccm"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3913d129c1aso2812278f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 02:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744019772; x=1744624572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exKXl8iO7SzmJWroy0QI+krsFjcxaCbrBNWz/awsG7U=;
        b=reYVnccmOtsvfcR+sePPY9EtZoWVkjs7jjN+XPVWvHcIbJeHTr82kwaKYVrPdpDCh0
         CrJeaSraXYwnm0QdENwXPj6ynPQy/rORPbg+XZOXua1BQ2x5d4TM4JFcvOtZrSIkTIrE
         zGSN1/kppK819qDqF2iLOCYhOTgZIlPVYDTPIiXfZtZkoRoaAgGVfLN9YBALG8FXvCNk
         PimdBeIi6dr2Dd6nVEqo5IJtjy7CEAuM4cC+6fSOtz/FLyhxHqs67VBvwkllJ6SsVuLV
         nA8VTCvWczHEHiyhMhe2IX6wJv49FVMigr7JnwhNmYeYXdLTYGsC4/IA/JtUV9m365m7
         9sNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019772; x=1744624572;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=exKXl8iO7SzmJWroy0QI+krsFjcxaCbrBNWz/awsG7U=;
        b=O0f+NA4q9wm5bBkr3DhFUGrR8ktwQycSXfVhZ4U3emmkFbj0xPe3kttw7kCsIUt00O
         s/y97LvhZ/Gyso9rAOCxpnOao19ulYWIWZXkEftHoapAhAsRPcBq0w6sHd1CQN1m9KUe
         SJvkGMlUA+F9KjyCZAnFdCyGkTxtNY0LtMCTAaaQFxN5+I1hvkn6mbkpxSlP5fQeaRUN
         EhoV0nw6nlg/4c1rDhy98AzFj8d85dPi6aPAG5OHGDb1/63rNiu5QOsB1qpMNsLCdAp4
         fkIkAND7FSi0qMK7Z5hCYHUsx+Wj+TQbh+mpNbGlkD66vruaEVeiH9JDpEGiFnroBPCy
         cQag==
X-Forwarded-Encrypted: i=1; AJvYcCVOdf7Ppr4aPOE8IvGusdZtskRdVPZ8OUBqJoP2zccAcg/cSvavzzmY/MS8q8jF990OHltJfwQSla1RbWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLW/6IBAS1UbuFF5NndBtZpP423WM8KFywRr1eJ2wIr8l+aYCi
	a1+/UIb+52KfyAgAiWxsGl2JSMUDuqZGTvtiE+nTJpEX9lcQEYVT/fxwXnaKaMU=
X-Gm-Gg: ASbGnctHLXujPSDNzwLmjOK9E9yNeesXmERl9EH+FTa61HOYtYXcnHjld+NMzxVZm6/
	l1znPb98n/2HeR55IHdEf7S+gSnINz+rvRM+0nRPn9H/3xu1nD/u3QfLyUklZBl2omPgwsqjl+Q
	zMy0hKEUML+I6iCUiepn4eUpmDSkyGXK0ZHfA2lbwOse64qWzPFFMjt2uixKG9joX4SPjRnOK0B
	xGv2oS5gAHXKNOOiHCpjcgoq6A8qqZGsVMmCMK5vUA4LGQFU7FmaV+9i9wFJXTWKeWOHJbBtN4Q
	c3sHIh7iDhAM9LSaNw4SDWPxWimEdW1LaOzVj0eWDZTJ4FGgriD26OiXJeUdXSoGbaDz/Jis/O5
	6+2Fseh8fJlOlW1ogNcq62Q==
X-Google-Smtp-Source: AGHT+IHvW9AY8dW8OeqiLq7BVhAE1rWiDpJrGLyBLxtZgZUhwxSkhw7t/IeGNuQI9SNzXAwkxQIpzg==
X-Received: by 2002:a05:6000:2287:b0:39c:266b:feec with SMTP id ffacd0b85a97d-39cb35aec8dmr11421588f8f.7.1744019772364;
        Mon, 07 Apr 2025 02:56:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f2a4:b974:cba3:a605? ([2a01:e0a:3d9:2080:f2a4:b974:cba3:a605])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a7225sm11480515f8f.26.2025.04.07.02.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 02:56:12 -0700 (PDT)
Message-ID: <dc9ebbfc-7227-412b-b1d6-9ccfb393658f@linaro.org>
Date: Mon, 7 Apr 2025 11:56:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 22/30] panel/newvision-nv3052c: Use refcounted
 allocation in place of devm_kzalloc()
To: Anusha Srivatsa <asrivats@redhat.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>,
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Michael Walle <mwalle@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Linus Walleij
 <linus.walleij@linaro.org>, Jianhua Lu <lujianhua000@gmail.com>,
 Stefan Mavrodiev <stefan@olimex.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com>
 <20250403-b4-drm_panel_mass_convert_part2-v2-22-260c8a44c56b@redhat.com>
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
In-Reply-To: <20250403-b4-drm_panel_mass_convert_part2-v2-22-260c8a44c56b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/04/2025 16:16, Anusha Srivatsa wrote:
> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
> v2: none.
> ---
>   drivers/gpu/drm/panel/panel-newvision-nv3052c.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> index 06e16a7c14a756b9a399347b29b410fd5f4ae273..08c99a48e06dc02677c6f0575d344f890871e0af 100644
> --- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> +++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> @@ -777,9 +777,10 @@ static int nv3052c_probe(struct spi_device *spi)
>   	struct nv3052c *priv;
>   	int err;
>   
> -	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv)
> -		return -ENOMEM;
> +	priv = devm_drm_panel_alloc(dev, struct nv3052c, panel, &nv3052c_funcs,
> +				DRM_MODE_CONNECTOR_DPI);

Wrong alignment here

Neil

> +	if (IS_ERR(priv))
> +		return PTR_ERR(priv);
>   
>   	priv->dev = dev;
>   
> @@ -803,9 +804,6 @@ static int nv3052c_probe(struct spi_device *spi)
>   
>   	spi_set_drvdata(spi, priv);
>   
> -	drm_panel_init(&priv->panel, dev, &nv3052c_funcs,
> -		       DRM_MODE_CONNECTOR_DPI);
> -
>   	err = drm_panel_of_backlight(&priv->panel);
>   	if (err)
>   		return dev_err_probe(dev, err, "Failed to attach backlight\n");
> 

