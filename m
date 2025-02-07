Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550E31F8697
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 14:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738938066; cv=none; b=oBHy4TDfWeBBeXBcx55OK5LRK8xgqADuhDBLaXPyHy+gcFx6BCqahpuR+RundJdxkWL9HxemqLzOdStk2PLvB8C02tnZ0CQuwvSGnNBmoj4oeW+AWaKC8sJsVSzCJ67w25seen2HXkqHtTPPS9Pak3QwfH4pWB9PQiSluwxzx/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738938066; c=relaxed/simple;
	bh=zB5BCO7vbRkbw+9KhUruFW/VbekbxzIkhUgXE+BTnI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GjsJXYZADrg1TEXxNK4KaIlyZO0uiBNb3/jIComQIi9/h0ItfQN4uIQFaaXRyM4qrdAQlqELZfvoLhKkDoesBf2QfqacBqCFeayKBOUdno2zpjSzODVXIyP71ToG2eXv+MOHuvPbgNO/oRuS+edD6K6txPEqx//MLzlWz8AbmpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=boNAyiaz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="boNAyiaz"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so14267005e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 06:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738938062; x=1739542862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qDisuTD3ZLBeOSNMxc2GUk38TNgB9LS+VU1agrbB+iM=;
        b=boNAyiaz9ejYZsRpmFri0bmpmc3c2btHVG0FmomCjWNLd2McXo3UKLfrmfHW83+o2O
         HCCEx109XTr7SVk/RJO21Uo2nKa3ba9OAYtHLw4m4TCciYKs5m0Lm17Mb6K2heEk2Gq/
         QtCewF2/K8IFRJ0SqLjzeSLHOBcGGrHYDpOpCLNkptE8Z9OtCkwDQUkRtyzJ60z1L3Q3
         kwiub3XGgvAnJDQ6/0/U1LHSMnANXpTk9QKTuWxHtZrvexHDsF/MLy2kijL0/DrOarPy
         j/me5JU+H1uSpVsbFLZttKS9rXJrP+yp9LCAdDaUfcV/GrLsQ4wXqzt7I43YIANcGfBX
         W2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738938062; x=1739542862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qDisuTD3ZLBeOSNMxc2GUk38TNgB9LS+VU1agrbB+iM=;
        b=Cz8oFYtQW4lCvHxu0p0BOOZ2P8FrEanAGb0YYMJ27iy3NrxqYoMcVnczDOk6zmq0+j
         YVE99Qx5XTD6gkOYnnR91jlBVA6rHFv7i3U8s7r+/0d446LfaNzk3A32TzwtsPFcYyFf
         G/peaRMRo4YUxGqZWRLaoBNjm05+jsukDdsm/M4p+4EzT86wP5ftk7b3OsSuwU93Fai9
         kHtaNfqwhWU4m5r7PacdZGlkAiWDygEqteEzAS7u8N2HxAgaPyQP6otSkXhbtkz90Xdb
         mddB38/0UCR5gZtg2VJQdoRfGCwrC9IscOjolIIlXVgQZ0eqj9kvBXVq/KUZDOak+F6t
         IKyg==
X-Forwarded-Encrypted: i=1; AJvYcCWFt6V3u66YIkEfaMw5hIHmK/kTloTTzwHZ4apL75v+zBboAmTUfzYMw7YCaT3rA5IX3fstafjjnwaL7hg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKRatY4QEINISdFGXdHyahjsUonJIGAqWLEmW0xT9QJvdvT7cz
	3rTKG5FQxbSC2aX4AsibPgZLc7GH0eeop6eL+QXfdKJ42QI/OjyC1xb1ial8oxQ=
X-Gm-Gg: ASbGnct5JWCwQklqM17CiUNY+VWktgQq0JgtQ5QGh4f0QaqRIHIo72CPhrD9XxC4mPk
	2IseabvPCV0uNnV72m3lJuT4q3OSK4riltvlHEPCiX3MyjWWt2/3Yf1T2uxJobJD/145m1E+BXL
	IiB6eehI8LQHi54uOWGh5bqIm4rUpNzqcJgCTHBufD5Jx1E2KyEas1WKxuvIfzR7qtiYHOssvwA
	Sw3FYONSNiyGLD5rzm2LzFD1ep1SOUXCMwSyDc9tI0o8rWK3UY9NFskx55Q29dm1RQ02eM89XAg
	BPliVIBDUYvtUhNOk8xOdkK64T0owGWCabWZRpVlSYkikzzOqNWr2OyiJXKl+0o=
X-Google-Smtp-Source: AGHT+IFxDkESsH4G5gG1BU4H7B4x8RnSu0oAxMNZ2KGruE88D1fDp7b1Y1apydP5lwwz3pFDUdKEAA==
X-Received: by 2002:a05:600c:c19:b0:434:a386:6ae with SMTP id 5b1f17b1804b1-439249842bamr30302495e9.7.1738938062277;
        Fri, 07 Feb 2025 06:21:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8? ([2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da9656fsm58840305e9.3.2025.02.07.06.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 06:21:01 -0800 (PST)
Message-ID: <8af4e0cb-4ac4-4ca4-ae81-6b5f7a06bf3d@baylibre.com>
Date: Fri, 7 Feb 2025 15:20:59 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/34] drm/mediatek: mtk_hdmi_ddc: Switch to register
 as module_platform_driver
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
 <20250113145232.227674-11-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20250113145232.227674-11-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/01/2025 15:52, AngeloGioacchino Del Regno wrote:
> In preparation for splitting out the common bits from the HDMI
> driver, change the mtk_cec driver from being registered from the
> HDMI driver itself to be a module_platform_driver of its own.
> 
> With this change, there are no more users of the mtk_hdmi.h header
> so, while at it, also remove it.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
