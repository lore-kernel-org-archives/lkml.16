Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B00916F0E8
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 14:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738938048; cv=none; b=OIzgwE2QSzMVMp3TMcK7K9p0pE0tpJUTrlpMKe6HubQggJBmTbYNChf4e8zgqNgAB1SvxkEnwnGE3dOJP7xAUCONSx+2wLIO6vJGsZQp6USi7ENJODAatck6eoTCDEoqfWsl6MpbDjzJdbzqkCwuNfOxhgwFxsSiZftVsSiEsE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738938048; c=relaxed/simple;
	bh=2hFDK54et7ZFuVssh1DAcLqX8oIrwGEhNAWI1S2MV6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MNz8kmOCGXfS4vYZNHDlatsbczJ5kzCTnra+JxWOm9hHKe/guWzMkACYVfF86m3Y16JGsPuRAGb+eOw2imckd4ou2WOQJV5/L3ibXdX2oHvGNHGtxpt25sau8w+05JwKbP0ISNsIphVgEwbIM8j4WOAL10C1yhhKjJhWJ1Qx74s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nEnpBHFl; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nEnpBHFl"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38db570a639so1222328f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 06:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738938044; x=1739542844; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nc124+i3gOWUcLL+MRlZMX010tcJdonEHZUPHfaiwDo=;
        b=nEnpBHFly5g1z9DHUHtZnRd/+OG+1eybMK/qrkNeSge6mufdzFkyczj2jCzxBiLKgq
         kthzR5vPK46J8ykdV/Oq2wT9u08HVVhOfgyFO8/BFReJzBMnuwXd+u2NBQanRaSI4Y6m
         Y9v483hN2zT0whLnZbvLUm7M3777Su7rWGQCN1Fs4D6E8tkiOWFVu0KS54P5Qyd/6BZI
         tWzqI6j3FlOifdWqEnls62BOuti4+tBqDagz2dFxGXyAPtRhKHJfJ2bKkrD6LJ/QLR5B
         7KI+mtFwOwKOVD65CKtSk9WV1qNYlfQHzvjbKZu4hHc9ko/RUBuIjRaI1qrRagxQP7Kw
         LPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738938044; x=1739542844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nc124+i3gOWUcLL+MRlZMX010tcJdonEHZUPHfaiwDo=;
        b=CEx3Zt8iI2XhuD0pshK+D3zVNI13NMf61+lLqXEmz0VVJ7P/QJri0MSczYUtQ96G0Z
         nQXd/noAwNk1XE3E7ovs2sm9kSTvTKZNUNc67mruMkl+TQKvk9PZEE2wNW6F4ns025tH
         icPUVG+mRScdiVnz53IAroDdT/qBOnmnvzH/jIhVAj7UDqSC3TknbAQZ1x2L7Em960iz
         BkFE1y20xwR+Clp/yJJ56k2TTyf0Emk3PRY10dtANIaTzgQHkLHr0P3/ClIeCAad8Lfn
         QfSEZHKySnUnbV5KBmQueA2M8Klb32yj8FbE/PW2rTdzT3zlzwjg/T0nODi0pxX8LP/v
         oQwg==
X-Forwarded-Encrypted: i=1; AJvYcCV9AzYBeE+E3v5xgnWOCXvTGJkpOJP5wG+dgYMLisukWWLY/yCM7lNgNYHO5lT5ClaoR29WqHvcqipTHwk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo8M9sNsMMhe1VYPQbeMjrCG1HzN1gSkm4VfxH3FT8eGTcRfu9
	upF8tgf9XHnPOlG5tT4KPm879DrWA1LL6cLeedderke9CotOpPFVRpPQ1iKtzH8=
X-Gm-Gg: ASbGnct2ZYD3DcoqCjDSupEuQmHNORs0ef5W5Y9asGw68WYs32vUeXlnUkZUUGI7A1Z
	nlsMLtr4OOwnXOIinBrfPkl+chkwwojc/DbdrKMn/viVdVNpHWeS2ePVS3gdHsAFeTSkidLSpkT
	BZd2rXkVLKNnRwcXkl+g8FHZ/1HFk2C1izuAJb3JxyxisBmlQp8d7BxK9/jqGedCcsvYTiaVqVN
	9qmLbD9vulFujIgi5WYyeCyI1PSV8Z0HMkzyuU8y5PdHzAeMwjY6YRx9f+K1LDQ7LVV2aLMejDr
	Xo3pVgHQe1qwGG+qjzz6t5v8poPUMJTrONWfqfhQn1jezw0/P5RXRZs54I/LGB0=
X-Google-Smtp-Source: AGHT+IHb8NiDsyLlRIFbUrauOpegRl5HcLPG5P5HG+ThsLlczAtmqh5c1eeSyDNXReTt5f+HIp7+9g==
X-Received: by 2002:a05:6000:154b:b0:38d:c6b8:9fe1 with SMTP id ffacd0b85a97d-38dc9ba7670mr2614925f8f.24.1738938044458;
        Fri, 07 Feb 2025 06:20:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8? ([2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc5839877sm3151857f8f.3.2025.02.07.06.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 06:20:44 -0800 (PST)
Message-ID: <f2f07151-ecba-4e28-b156-8a85388cd064@baylibre.com>
Date: Fri, 7 Feb 2025 15:20:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/34] drm/mediatek: mtk_cec: Switch to register as
 module_platform_driver
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
 <20250113145232.227674-10-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20250113145232.227674-10-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/01/2025 15:52, AngeloGioacchino Del Regno wrote:
> In preparation for splitting out the common bits from the HDMI
> driver, change the mtk_cec driver from being registered from the
> HDMI driver itself to be a module_platform_driver of its own.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
