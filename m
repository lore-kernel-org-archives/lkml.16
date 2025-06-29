Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECB5219A7D
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 17:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751217888; cv=none; b=S5vieemelqx30DuoTaWQnSJ1rgWMxtLlmKnMktBqLujuAT/Y+we+3xuyPPxRmyL31ZSywMhOMGAjGJzlZoPanX6bej5HXylNmy0hCj3oiJ175sxHKNFiBd5Z6mZxWla8YDLd2fYPVQwDfhnN0jjsOtYqiRU9Vi3EfojcM0brMYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751217888; c=relaxed/simple;
	bh=J0Ixkl5utjBmAEa5cnB6QG9Lrq6ZqKh2gYTnUIB/lJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nXZUYY49a5TYN1TqfyO8oRdqB4fMfJagOde4HEJ/RbRJNKoS3sAsNRR3HYAR02vkYraWgQMGgC0tCKaIYR4Msb8xv/iXRsIG8aFJtk7DYImPgTvLti9J66+LL81PiR+4lMGCrGWb/lUMfthQ8bzUoGDvPlLE/GSA5Eyx4IEJ2es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZeLx4XJ8; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZeLx4XJ8"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-72c47631b4cso1108875a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 10:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751217885; x=1751822685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Diy1MlYscq1DF0Zv66TQbVLrO14SzJmah7qWSQHod6M=;
        b=ZeLx4XJ8ZFiAuDdjKu7OVbTgFNBArH21fl8912zMpIZfQ9UVz4VAfi0HJ04oio46e4
         TkHPQELyVOe8h3yHDprPak2BISQ8MyiT7SkKaKRhpsxWYPWZlkvIVTKozAZibArGGynn
         DoTlupypfbdOau6HB+LMt1UmM575hmSXewkTXJFvKvg/95uxXUbZZcD4sJtb3Jx1u11H
         Pl9NC1rMkdJePMKpFxNJGPrsM44r0Le9bAjgjach5pKwx37YWiHpoXJENm/dWsnLJw+6
         +Fz0+eAFOqYXDa4ZpLTKgbJNdZB+ZADilrOUCa/IIfVb+ubfUU+BQbQ4BO/oVh5ud9Mf
         BA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751217885; x=1751822685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Diy1MlYscq1DF0Zv66TQbVLrO14SzJmah7qWSQHod6M=;
        b=mOE/+eoSRr/VjKLQWPOKXbV3vqqKNQx/y6hyMo5GykDmS7CcEexkguOUl7Y4NDC5oj
         xf6AU6Txbum5XLmRRvc2vIPAttKTEdbBtuCKUMdXtgrQbtTHPaDXqH1C/xTKU4+NuK49
         m4v8b0rr7x2xcLk94X9iCOpyl8J3YIJI8I4R2MmZNHcdy3dObCcONB5kFaxMDYr97TNO
         /lqYLCe60um2NeP4GdsykcljyscE5l5TEpuubNUUTjdyw3qzOtpcbmN0C8X4B3X1EW1+
         wzj4KHdwzCc14r/+j3jAX2TS7zVhrXJov6Te3pXyFe40mJu31OAmZ+q9egGPt7gL2IUu
         M9mg==
X-Forwarded-Encrypted: i=1; AJvYcCWrw8CxrFra6t4Zz1ZKOSOyxoJ0iUaxw1pJeTMTUs6wD/sDCRLpw+lvcP8Rt9k9VB+nutGRqC5Ns4him9c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe15me1evmHmX149xjkfv1tF+bSB2UwM8QTXFy6Y+XlWDctiiV
	/T0MYoMTaC3rVFCLkdewz0YBvxbToXZryoHppdrh0+GgKcZaMQ3FhPq7i2QlkTso5e8=
X-Gm-Gg: ASbGnctO7dvY1gTRwm+Nh05/fyMCYMvHrZuNgEhCjG6zSYGDzenizQRPZIEX2khEsRf
	jGWhjjVcuJQBfa+Q10TYyHtrXWCh8oGifRYh+Wa1I4K6RIPq3ARYznTWdAf6xNmB36LB/hQdc63
	420RIfgSz+QuJU92SfErpPvIPqTBhmOWE1lSO2LEmL0OWEtMv3hWQm6ApYAE+ce+Nf9QuSyo9XR
	/0/nCCMuBhjqyim4b+bpswhgSiaczMKpk7ecCskiiiV+Qkz/oa/E5d2l2BfXiajF+5fecgCPuA6
	VrUnGKvGiBICDFbvVs6cIwz/yx7Y/+S1X41uYXRgV0SiqCxe/oCsKSj3vLgpJfEmqOwh/PUrssS
	z4G/bRsbsCbVMIcg1VNFGSOTpQM/cdBACTgVV4WL2BVKslrr73g==
X-Google-Smtp-Source: AGHT+IEK2rnn6/CI2tLl625vjrG+arb7O1+sLlYYhwkeqs1zOcrydEV8o9HIf7UnVmK1VGPUEVYPLQ==
X-Received: by 2002:a05:6830:3898:b0:72b:8fd3:e2dc with SMTP id 46e09a7af769-73afc5c1555mr9130015a34.21.1751217885111;
        Sun, 29 Jun 2025 10:24:45 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4876:5a0d:2fea:6208? ([2600:8803:e7e4:1d00:4876:5a0d:2fea:6208])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb006a02sm1328459a34.23.2025.06.29.10.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 10:24:43 -0700 (PDT)
Message-ID: <9422d6db-5ada-4a93-88b2-74f1217fa771@baylibre.com>
Date: Sun, 29 Jun 2025 12:24:41 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add thermal sensors support for MT7981
To: Aleksander Jan Bajkowski <olek2@wp.pl>, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 jic23@kernel.org, nuno.sa@analog.com, andy@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, zhiyong.tao@mediatek.com,
 linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250628223837.848244-1-olek2@wp.pl>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250628223837.848244-1-olek2@wp.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/28/25 5:38 PM, Aleksander Jan Bajkowski wrote:
> This patch adds support for the temperature sensor in the MT7981 SoC.
> This sensor is exactly the same as the one in the MT7986.
> 
> Aleksander Jan Bajkowski (3):
>   arm64: dts: mediatek: add thermal sensor support on mt7981
>   thermal/drivers/mediatek: Add support for MT7981 SoC
>   dt-bindings: iio: adc: Add support for MT7981

When considering building and testing at each commit, it would make sense
to reverse the order of these patches to reduce the possibility of errors.

> 
>  .../iio/adc/mediatek,mt2701-auxadc.yaml       |  1 +
>  arch/arm64/boot/dts/mediatek/mt7981b.dtsi     | 29 ++++++++++++++++++-
>  drivers/thermal/mediatek/auxadc_thermal.c     |  4 +++
>  3 files changed, 33 insertions(+), 1 deletion(-)
> 

