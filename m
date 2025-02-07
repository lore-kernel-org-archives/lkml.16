Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8BA1F8697
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 14:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738938094; cv=none; b=jIrNukGYqjivdpRiWsrbAXun0AMB5WJf5oS19RnzORWlDH5wwGNkJl+42Y1y9Zrt3CjmSoA8p577h4BJbEXFPZYXGQA0FAC9CDdahH0Ga0FXCjIyu0e5/PFS75K6EzKXlMiG23ATQSJYfQMozPGpdkbqhJFwqBElxUFLqeuOl2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738938094; c=relaxed/simple;
	bh=xO7WRefc/IdunpdbpYWaJx6QkiMBM6UHcj5PnDgRQOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kyvR1ifNiLv/UcOgFhQhvcYG7D3Wvlz3DiSVEkKdz04+eh9WunpGucamr9lvkJsDeJKYEzka7jvHmRn1ANnulCLxx2BS5NF4hBuzoHv385HLmB8XxzaZzvxz8sPjGPQZ3tF15xZrde6fjxPOsPfd0UTjUWw9pdwHTg4J7vAC5bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xr78hENR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xr78hENR"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436a03197b2so14455905e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 06:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738938091; x=1739542891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NAwcnkM+PzRe51c/ss1O+62EsfQXolXBWlx8ljeQQPE=;
        b=xr78hENR3NmXxLw/nJYNqXYXZqil5WbZ4WVXSULI7AUbP5oGZpE8QSx2shMAEZRMGD
         t/fK9VBb14jM/N18znyRzLWjNXn1d4XKp5e9br+tQdg4trlO3gc1mBrnsNFh3sQgRs0I
         /AhoHyuO7sQ96YxMpffrUke2Dm8g1IE/dJ+43blE4yLUScPOWFIsMFu06PAaexPufIPv
         ORefSK76Yw/4eIueWoo0G9kTy2F+6HQWrRtEggrjW3y7QnKerab/4oNlS9l+Hx9WM98N
         W5FXqQrxoCMmyLOZBPEwqBYSrQpdzCkUUW6vUSzqdmN2j0jsvafFVW02JNymged1o/4S
         QSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738938091; x=1739542891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NAwcnkM+PzRe51c/ss1O+62EsfQXolXBWlx8ljeQQPE=;
        b=WS/rtbXEvNg1ZFKo8nwwKywxZVKSvpI9A4kppR/KGGNMsVnI71oKduv1cARRik1sMs
         5FhE4RlN4RbE5l/f+hKXWrerOGgNC3n4tE/Tmlvt8tF2JqPQm6d/yTkBoTMKVtdIbGsK
         mRPR8ggxTcnn+VnJBXPGaZA90I4dBItP4mQZXAmvvacxqooBy3aLZQQI1LM5qQ1c+h/L
         7zxguAqMEib9bApB1PObknUj6dDDEugyqh2xnd3uBWwZG6FD1pbyR29JsAdmIPYYO+cZ
         f5sVFYiFzAkPZwEoMbqsx3H9O0q5S5GRbjIprOEQG4Owzgh7+OTCvrjYsGRSrO8a+a2F
         SHlw==
X-Forwarded-Encrypted: i=1; AJvYcCWuu63tzXi4AbszM4jQ5HSvAK5T/V5NiBB+72xNe8/jdlEAqyW35jeEz5ZSWgSLUP7oUnAfuP65WK1Rt5M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzo9qFTiurB5U74QpJoL9vT/f6Iczv5HT640h/sM3MXy83H252
	L1hTbNfPIYuTpJ0becdLuaenChGFoTOBbPy7hZtH9OleZ2lhjrV6qQ4EXoxjaDk=
X-Gm-Gg: ASbGncu/HQqtsEyykWrOGmTcrj79FwRHfWjAjVtfJImTRk8T9JwZVfBNYbE+k13Tra/
	T/uMJ39jyBdHXV2H14GJRo3b6sjPu74+jkEEPB5ocqqq8wDUNXSezEOeaz41W+5keKfACT/VeMJ
	pS6A4Iv1lRv908ic3ULppdeQ2u48wZWcODuohSyg8n8YylgW4t0zyCLvxx2clpZnfbcdxyrH4HT
	aa5+P4AGcqqmTP7XCMWmk9w5peMGHeDk+MO4VxqLKyivO9f47MNZjwPA3eWCe5R7vCXuIVayUR7
	muAF5f0nAjViqG9yYFs12jSoDctxhlBj72n7PbKHk4fbwHs73CpDVJSFxuc3TZI=
X-Google-Smtp-Source: AGHT+IHsAn/5NuVWMfrT0WHyD1iRvhJHcQ1HOD5ajIz8v5VPfyCTgBqaPudj3dtejQe1G4pbiVMvEw==
X-Received: by 2002:a05:600c:1c8c:b0:434:a468:4a57 with SMTP id 5b1f17b1804b1-439249ca925mr25071915e9.26.1738938090624;
        Fri, 07 Feb 2025 06:21:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8? ([2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391d5283b2sm58939355e9.0.2025.02.07.06.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 06:21:29 -0800 (PST)
Message-ID: <f2e04ad9-c846-40e0-80c4-1b0e443dd14e@baylibre.com>
Date: Fri, 7 Feb 2025 15:21:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/34] drm/mediatek: mtk_hdmi: Convert to
 module_platform_driver macro
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
 <20250113145232.227674-12-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20250113145232.227674-12-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/01/2025 15:52, AngeloGioacchino Del Regno wrote:
> Now that all of the mtk_hdmi subdrivers are a platform driver on
> their own it is possible to remove the custom init/exit functions
> in this driver and just use the module_platform_driver() macro.
> 
> While at it, also compress struct of_device_id entries and remove
> stray commas in mtk_hdmi_driver assignments.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
