Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FB4205E26
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 09:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738660945; cv=none; b=pKmHJZ3Sam2e7KGrCk301CckTUJNIUBWyxy2A2lzJW9qb1jOYLCDV8sgGrJIHcllcA7C4TujAv+BJxee7xuJQA1eyoGf7l6BMO2fy4DXDGLmdB3+yBM/H8AFQ3gTZ+6fi+9Ugy7ImCCwdofYzDmfvnwN6E723UnY4wW82SgKDBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738660945; c=relaxed/simple;
	bh=A7dLWi7fKIIvDIaDa4kWCFkEStexz6zgdrkdIfbkNEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FPcRgFjBeMYw6erNTQGfakOBb0TTuT8xC4wqOkpiRjsC8OssqhuRw0MVtD57EzCCMBCN78xV2+C4f8I/LgqtwqfRxevozhtVquXDwDzqsc5qVepBJY8C6SV7Q8ienPx3kwc4gWMGAbhNAYZd1zs/3D0+Pr4tRd/hj3Iaob/pO/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ls2CL3mC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ls2CL3mC"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4361f09be37so6796875e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 01:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738660942; x=1739265742; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iwPqOt67Go815xhbnQeh4U08Eo3znEem1o3PD1G7Ms8=;
        b=Ls2CL3mCyrN65bbZ9hbq0zbGqkwYuWy3wcEgj38bkl7ZeZto1Nbw60Wx/sJD88UPRy
         iitkwgJHlR5uziaGAdazBWD8vFiYPGVh7V5RCPH5zhKt2yhgxFK8YZZdccLf6KBeszIT
         1igVSWXW9x/BOukLvLXnh3K1tSmr+FIkFBH15RbpGzIrTezJz3O9oPoU7eNIaXa1ja/Z
         mji8Tz9nJ9p0Wr6/CJYAz6yEmT32ruVYcFif1w96MiJW9jIkA46zq8BQeKmB5/q004Ao
         MJ879wp/0bPtPU8HHEVRrsR2uH+hj4KF1vEf/iPM4EdFj6p5kvjZfS9FQyIpucjTrcOp
         fWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738660942; x=1739265742;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iwPqOt67Go815xhbnQeh4U08Eo3znEem1o3PD1G7Ms8=;
        b=m2Y2rd/TzB6Lp7X15wzT45OU+jNju6OqV6KGtGosvxufxH1EFFyittrDx259/OIRkR
         AfLtbmsiJB7oiyKkdze5ugXLwPDT4iqlF2pGSs2DhJErhW3kKHsXZmHRtBs6qdMbNcw8
         5qRhTCB6NnQR9DtY5vrB5LAwdaH8aJS9FLPxbKA9+QVbzExX+5o9L2ALUDqdEYD9GTc3
         b/BwuZcnJgZBbTJKFLrqcvjSTeO9cd/31aGJRZMg+n5aKnxGrwnkRvVEm2ImLfJqZq5Y
         nFJuWDwNnOO1AU/+BjPGQlW3uM2dr8Ha3ss7cIShVy/wi/hxrfnA7IJwGvSv2IloOqRy
         D3+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWR+xPT+knoJTrj2EdxobKTlC+lAmUg4yC152k0TGGMV6dZTlyG91pm6QiQjK4bZUXG6cGy/Qr+NfbduAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFKRnEAz0f+uqgKzkZo6oW9vSRFBhm8zNITl8YVtRv/VJH6zNR
	C6Npj703UU8bzOCbR/Kr46Z+LInhkKpskJifhrFojs3n/ngq0sAa+xDw5NZ+Fhs=
X-Gm-Gg: ASbGncvtYu0xZxVnpJGx055kdwob614RvWj44LBnwW19y5O9i1OWQc7RyNpdH2LpmgJ
	ImxYs8IWYuams7A01o3/rVKPd1vYc04ld6oACuAQeuvo0vMjddYkCgiQsCxahoiVIZhub1Rr7yg
	SDN7d2pDYc25knMbYu30nqIn0A3DdZA0SzPe704KGTZpVeEW7B0qSiuzLs8YTUz0PC1ZR4DhZRs
	asAwFK4I6gbu54Rp/K7HUkGLLK8x00jA8TeGtQP5JVDShn+Mf+NNkxqbbWlG/nBz5RZkMIv2eZx
	selcXJbg5ZJ0OXhiN/ZFMwQPiAlXGy6zvpw=
X-Google-Smtp-Source: AGHT+IFsirgk0L1Hq3RMUCE7MJt9CuKJwkQ3It+7Rt91ZzYyiLoJEAmUwUNj9EwwfUu3UINbjcphzg==
X-Received: by 2002:a05:600c:4e93:b0:434:f335:85c with SMTP id 5b1f17b1804b1-43905acf200mr8465555e9.6.1738660941991;
        Tue, 04 Feb 2025 01:22:21 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc6df51sm222864265e9.30.2025.02.04.01.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 01:22:21 -0800 (PST)
Message-ID: <1fdf132f-085d-4420-88c0-bdbe87ac2c74@linaro.org>
Date: Tue, 4 Feb 2025 10:22:19 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <c5wtnqiucrfplq4655wk4iiwlxm42pdwozsqohffu54lifpbme@pnrqzul2cx2f>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/02/2025 18:40, Dmitry Baryshkov wrote:
> On Mon, Feb 03, 2025 at 06:29:20PM +0100, Krzysztof Kozlowski wrote:
>> PHY_CMN_CLK_CFG1 register has four fields being used in the driver: DSI
>> clock divider, source of bitclk and two for enabling the DSI PHY PLL
>> clocks.
>>
>> dsi_7nm_set_usecase() sets only the source of bitclk, so should leave
>> all other bits untouched.  Use newly introduced
>> dsi_pll_cmn_clk_cfg1_update() to update respective bits without
>> overwriting the rest.
>>
>> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> index e26f53f7cde8f0f6419a633f5d39784dc2e5bb98..926fd8e3330b2cdfc69d1e0e5d3930abae77b7d8 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> @@ -616,7 +616,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>>  static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
>>  {
>>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
>> -	void __iomem *base = phy->base;
>>  	u32 data = 0x0;	/* internal PLL */
>>  
>>  	DBG("DSI PLL%d", pll_7nm->phy->id);
>> @@ -635,7 +634,7 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
>>  	}
>>  
>>  	/* set PLL src */
>> -	writel(data << 2, base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, GENMASK(3, 2), data << 2);
> 
> The mask is not defined, still.

Why would it be? That's old/existing code. Commit is doing only one
thing - fixing something. Not introducing some masks or defines and
changing hard-coded values into defines.

Best regards,
Krzysztof
