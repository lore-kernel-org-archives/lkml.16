Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B912147E8
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738684050; cv=none; b=XaGxoQXuUG+yvd7qc1eh796yKSAJCE7WHgvVVqqxFmjkzNCf4Eh6v2+48AvzhHRIl59X9k2FJScGWQfbyhQEekYAxSkFI9CR6uQyEF4WoXU2sDKpB8BiCoH4MLEiIpMgv9+OGrqjKKWBgnjBBKyS94zvTyfqB6IyhOL2HhVCecM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738684050; c=relaxed/simple;
	bh=oSEZzHfaKPwLFssOfp+qRDHcONqvIX5R7VrfWB2De1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MYBmnAzB1uemDFYFOJW5AvK3rhlrxbw1suZOWkeW8mVRpqbdTaZG1pjOPaHx5URCSu2gfVXdAFvknf66O+yDJepLKrunx9nWvh2PVjxtTK3yvBJ3i6XB5OPw6QkWDlXcCl9DzbIzeeMIIBRouJ3+vVEDbAoy+stYlGodHPq3yO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mFhOkdnC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mFhOkdnC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361e82e3c3so8585775e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 07:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738684046; x=1739288846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w7UCbvi2PPQx3TM0v1pZVF25QMSWIykhxRAhE4s51Kk=;
        b=mFhOkdnC61847kEi2WjhEAlwTeznNcA8ABRtEKwB2GA6keR+GljvURayj822Md0m4H
         r2bKpfFieMD7THOdeUPaYoP5h4/0yi+kbLoIGqoWYzrv5Fi+wtwu3cXwGFskZu6gbOzE
         gYJTY2BlqixjDFiyvO8/OhgpguEZnN5CzwJmpEcI1z8S7BTNgikBJhD7IfFivUtLoLze
         K1VMrtREMiqM+fDl4P4gdC1sDmDbpJj5e9oGC2zYx/bI8Xh8h74FwDAMZmtIaiHBT4+t
         xVbw+EGi98H4X45oHkjhB3SOrw8DcBDn8WHMC1MQrqF+j4CgYz70j5wnEsOSZug4fraB
         mmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738684046; x=1739288846;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7UCbvi2PPQx3TM0v1pZVF25QMSWIykhxRAhE4s51Kk=;
        b=JmFDml7BD6mFEic9DrbwHksAe9+L6clPNOFfqSk5BNz0LPxNW0h+K30SKQOmmxEM/+
         +FXuZCboysaQ+AvbX+WOpLeCZuyYoJJ0gw8grf4q95pUPgDr1jVpvbwkK2G5yfXbg5xo
         YFP5Xml5ASlThwppzGFuRR1EG572+i3i+MDhdGj+QUhga6ddX8jutqpWROGF6pbOiEAe
         YETLeTWoXWPJ0iqY8zIEmDLucVEMhK0NxzkuInVFNkIwRGfRkSA6+QV6wm+3dh0o4TFd
         bVZpeNt36+Gm94J/xswXxYknw2506yN8vVJjLsFA/8OKSvlTwnfenx2sMRh2SDJLtWk5
         RmnA==
X-Forwarded-Encrypted: i=1; AJvYcCWT0F/DCjiPd9g626ROEWS6ipUZioOUv04eTAlTnNkduIHfG846bM+OtTZvljvRfU0GcEa3iOYrJnFdn3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZaOinpIavDlmb5sergILtd7t992kIqm3RQh6RijLMKsAvE5MD
	z0wjWpyOoM5HP8kLC+HaudiWv5vN4c1OapSWy46Uc61LN6I6zFtnR87ZCrX3Vms=
X-Gm-Gg: ASbGncvQ2fBrdIqMuNUHsjUX4ilhVaACf3ZRlfvCQlxgd2vMm4v63um5WCfPptw/gsr
	t1FxKb61ReilX6I0jz2pbnWKWUam1C5kx7Bxv7dNh9F5UnE2VGnv75/Bf8lCb4ENbaDS0L9pwSi
	hAHDS5O0Tzfrf2Z+wzqHWQ92F2ZDINDFqRGH38FlT6tMs5AMFlmJ33AkoM1h/Pfzg+8p0oijb/r
	Z7QOSX9Dw3K0GNBSAaKIKD+Rlhk6o0O2upQCq7r/9yuR/xde0OyiXHcY5ypZq+SA2hFsG1uoyBR
	svZFCyEgfeP8qxOnln2NyiN91bBq5Jjqfhc=
X-Google-Smtp-Source: AGHT+IHk8t2kGkewf9miDARDQEDhBHmDwc96pGOFGgRiJyAeCiaoi7Ir/rPT4MfBpFGIq6J/A1Wu3g==
X-Received: by 2002:a05:600c:a41:b0:434:ff85:dd77 with SMTP id 5b1f17b1804b1-43905ac4d93mr13292555e9.3.1738684046304;
        Tue, 04 Feb 2025 07:47:26 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ece21sm15905008f8f.20.2025.02.04.07.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 07:47:25 -0800 (PST)
Message-ID: <25b58de7-b3ff-4d85-9db3-1b1eb0012d44@linaro.org>
Date: Tue, 4 Feb 2025 16:47:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1
 when choosing bitclk source
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-3-862b136c5d22@linaro.org>
 <c5wtnqiucrfplq4655wk4iiwlxm42pdwozsqohffu54lifpbme@pnrqzul2cx2f>
 <1fdf132f-085d-4420-88c0-bdbe87ac2c74@linaro.org>
 <iygq2utzftqrvekz2mm2nnjriwvbtnpskbb4th3wg2jczfikw3@5m7cttkxwenq>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <iygq2utzftqrvekz2mm2nnjriwvbtnpskbb4th3wg2jczfikw3@5m7cttkxwenq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/02/2025 15:27, Dmitry Baryshkov wrote:
>>>>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
>>>> -	void __iomem *base = phy->base;
>>>>  	u32 data = 0x0;	/* internal PLL */
>>>>  
>>>>  	DBG("DSI PLL%d", pll_7nm->phy->id);
>>>> @@ -635,7 +634,7 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
>>>>  	}
>>>>  
>>>>  	/* set PLL src */
>>>> -	writel(data << 2, base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>>>> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, GENMASK(3, 2), data << 2);
>>>
>>> The mask is not defined, still.
>>
>> Why would it be? That's old/existing code. Commit is doing only one
>> thing - fixing something. Not introducing some masks or defines and
>> changing hard-coded values into defines.
> 
> GENMASK(3, 2) needs to be defined in the XML file. It was not there
> beforehand, you have just introduced it.

You are right.

Best regards,
Krzysztof
