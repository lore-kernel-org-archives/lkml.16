Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680AF248F64
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750749273; cv=none; b=J9PCFWn/Rxsp2RT2NmYxvSXDMTbNzlDmXTix3rLO4txIZhMVflaQKB4zJdVwHJohJff/Mn3X2qE460zveOqkDT1oLo7gkHbgoUwoZKqL+eole7zfg7QkiB2HsXxKoCDSwydeLWu3o3BAvMskPzNgL089qEpmebNVGm3qk+A6mu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750749273; c=relaxed/simple;
	bh=nET1gJEsQoUnbclWMzIn4J/kW3aT/Kgp+JNFW9tmDAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XVFduVhTF2oIzjNutUMUcFDKH++XZOBi8HuyUZT1NVk80n/75ThKsnr4d9HrMy3dKNuF+aHBdvO86yT/jjYKhpdGxiGwIFA8f6cBm9jW81AlQc2uFyk14ir0MrhhsGSIa2wbQsaqnVOGjvXrnD7803VO5byWO4y8MSzNZMoSNeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=lVrpx2Bh; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="lVrpx2Bh"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-adb5cb6d8f1so784739166b.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1750749270; x=1751354070; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i3O/kbdN1R6dzhK7EawM1PIi5N4Kg7zW17zp/dNMj1c=;
        b=lVrpx2BhgYIzWopTvY9/D3KfCg4rnlRwDdXedxgwj7U1PfFDTNvX52NIrgkmdqMZ0j
         miYVcNLpQ7FNaPwituJKxl2Iji8Oo4Us/wN89CE4bnFwS4bMx92RsQoY3P/PGrsB7JYX
         P+sXoq9mTFt2RrRDoU5K5JHX7akuEKtKnNeqjqB8+kb/YGVEakCztPiapf5E9cs9P/zH
         c+NYaDXvSERSXVDCIdvK9g/MgkKKVu/9Wg5MuqKTlGmogmUxj8ejxiOe8ggoAYVY4+A/
         EypTQW+kPnlragj/U6cki9g8aItLfCCKpHSgyPMGbxA2YCsLlCSdoK/xgRItPnZn7u1h
         uozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750749270; x=1751354070;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i3O/kbdN1R6dzhK7EawM1PIi5N4Kg7zW17zp/dNMj1c=;
        b=SgFUiq6YmOGvYPXHd08vjSYcngMx3sb/xl5c4Pqy1ZvH/kyVuME2FM3naCg45Od0VU
         qX6Lg5kaMvNDEEnVEjhwdunBykNKbfwE0zHnRbF/ntaKnMoZeWaTLTRhBsDFO8PsvbzQ
         QvgDuidcptVnv/JDJE2FxjUP9/21YyJnxKMZOTqaBXNurvM1Ldm2cndAzo/hVASm2+1Y
         qqKlcv0RVlOE17sKX/DFfvHdCV5pvM8/Qr52AcBpdggzJUZfUTHU5COf/BNAZVPjmOZ7
         py2CvDUVgxROUtj15SiefZfKB9NMjjd/ZeyVqJuvagWLUSNURqxnY05XmCP6B15Vv2ht
         2AKA==
X-Forwarded-Encrypted: i=1; AJvYcCXThd/LzxWC4BL6RNHJ29BbUXIHoNOcDvyWXBldIkNnYJ/qhLWw7Kzvm5ZMNxgkoF1SE2S8foSh7+iEIpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYysUtQ0bIzQPdul9FRp55Pa8G57SA+QiRPemhBg53zhtEPJSz
	R4WBqYhhFXgUkqmYcroGOgXDa6iP8VNDxb7FnpfZuucmfKxg4JTIApSA9nrZy6AWZ4I=
X-Gm-Gg: ASbGncvRKFhg1rJecUCpr5IME6zIY/MyZ34Ugq4H7fYToHOydRt8mTBY863kyJUyKhx
	vHLojQnS4uoGz/+gDIklo2sZkEjDfZQttnAsuGXieZAXKs4vZ2lK2Zz+psu8dVj+mqWJJ2o88vQ
	3lrHJ34GMA4YlmD8ysQUXOszzHIXGh6DdUc6u2sGDE7uopbhXh9c4dGFZZIgUE06hSRlQWom4bj
	sFlat4XvBMyOw9oEnJvWv3k679IrXRKWipxUk65inJbAJ59hp4ANtRRHL4a1aoBoHH9hKpFq2+j
	QBw+t+MvyEk9n8XFnFHgrEFyolRZ/K30uv+WH4fxBa/ZTrweag+Ix0hG7/hRa892Wg/URCQ=
X-Google-Smtp-Source: AGHT+IFyqZi3XuHoAqSel9NcTyM6a8to6TnnNAlILz2CVQlPmoEe8VkJjYi2Jq9ty/8Rh1HMu6sWxA==
X-Received: by 2002:a17:907:e2e2:b0:ae0:b3cd:8f32 with SMTP id a640c23a62f3a-ae0b3cd91cbmr16862866b.11.1750749269565;
        Tue, 24 Jun 2025 00:14:29 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209a40sm837830566b.173.2025.06.24.00.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 00:14:29 -0700 (PDT)
Message-ID: <c3ce0abd-d924-4c8e-9cce-39d694a19418@tuxon.dev>
Date: Tue, 24 Jun 2025 10:14:27 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: microchip: sam9x7: Add HLCD controller
To: Dharma Balasubiramani <dharma.b@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250611-sam9x7-dts-v1-1-7f52fcb488ad@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250611-sam9x7-dts-v1-1-7f52fcb488ad@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11.06.2025 12:17, Dharma Balasubiramani wrote:
> Add support for HLCD controller.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/sam9x7.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
Applied to at91-dt, thanks!
