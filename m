Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C51C204C1E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269375; cv=none; b=eJ6LN1o4QJN5AyaweEA4Dqh+/bDoEVoPY4SWPD6rslGizXw88RSO3R7/9OBgNyiopA0rWB3V+49WXID8CcFQSJW58wLM0DEcfNuh9N0pXEh1trM3onTc7hTpdyJ0TQEvy9Bk3XXZ1ThtAFoF/AKB93uf39kRd58q3u9fSWdIfSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269375; c=relaxed/simple;
	bh=jtF/nrS6iv9Kj+fvDEFx6uHdSawvFx7PwxIay8a7nrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f9Z5M8eLyrrQt1Ghiwks1/du8HewIyi1mqudeSIaGF0v/gN1iZwkYJpMD3yEd55oQZx1rXIS3t82GZGyn/VYPLy9MHunr4S0j3ISFjI8kh0vWY4J7NgI4VDhiNfTPNRPcsrIybiZUNrZ2ukwZcJQ7D45hLbECNSSp1RH7CTlwkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=iwA5776c; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="iwA5776c"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso5432545e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744269372; x=1744874172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zmLueEOSOx1TOZ/xE11puxSYTKnDaeqcR4nW9ehtutQ=;
        b=iwA5776cZPPcaLJ6Y6M6rglFih14l61mU9JsC3An+TEN+gRHlT7GQJ4NCz92t5IdiH
         S8TrzQuqsdm9BDzLdm+kGixXhpQhF8ryPoSLmtd0UZbhtdeBua7QuNrxxMJEGXPh8VEC
         aegO/uxYFGKeZW1yCS166FpzT/xS3a8oy+wTSWgI/rvDvSIiIFEVXpEKbXkF9LRuYfh6
         vQ0b686UqGKgy3KTqERZL5r7KRGd/pLP+mVfIlW5+FAm9QrxGJNir9o/Oy0nGSvHiQG2
         lgeG14tPcwQi8Kd+kxrwmIznDhQfQlKklwoDEhBlBJ0gAkN0cPYzR68IW8fVeGVQDCER
         7sjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744269372; x=1744874172;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zmLueEOSOx1TOZ/xE11puxSYTKnDaeqcR4nW9ehtutQ=;
        b=TBXXHR+R31r7sSqXHreqqc3HrQxigvg09F608jVjRXPYcA5srQcPCBOfjsZhiy2xOD
         Da/2GVKylkj6Nw/ZXuRcz0mQLbKZMn8eMLnDHBIi4bIlBAD5xUYU8CnQE8bxICoSDcde
         f4AzvscgbPIoniwzryPbyKliQhxkfT4Go5HhE9ckFFvP+EgHxnW70gvNWdrw78wXOx/m
         RUkfwrUS2PdXd6gkNp9abC6KOCRuzDtYFlXKO0sRmZO6kvMcAatHOr8oxXGid5u9nozi
         UE+7uHfx0TXOmUoxqUOQZZVcJNUyJosBfx4RqD7zT5DixGMan1DrXGjVo0O5ak9oSqYK
         Aotw==
X-Forwarded-Encrypted: i=1; AJvYcCWkHW2IGoTSvqaDRUMG6uqx8DtSuKALxWcTtYsZF7eAHqNNA4PTGMfIVfxxSqygl1lAwgxPVdzZVGpSEa8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi9gmo6su9qu4TqM9ouuv6v8NcEpvD8P9H7fXP9LmVpXvI7OPu
	JefNUTHlMFKQ9qKMz1JiiehlLNjcgNRMn77OxWh2GoWjJZDTE+WFIfdJEzpMw94=
X-Gm-Gg: ASbGnctKaFB2HhQsyCMknhcoikM7nyJTx+YfdR+kyx+r4SDg4B3Do7pDSKMgZU1so8M
	tdVv6IQSX5FX5YMdjt3tIX5B54b9M14K1oDqmXLDyZ5uAl+st67S4MRXRDneIGafaaeQJpiZVtI
	naTgjXAydJUSSnX3Rq7J8AsTJ2nOz9hjuFYzmnQAXeC2/aj3mw3B/9G/auMw9s6mY5zvKtpObVt
	KuEat588oIiaSSvGEJy1KTZJMkf0+ocuztqNE1cC/OlzUru6RccH9iTXbmxroquLkodU3I85UY2
	zPzQ63ZI5GRn7IfAFgl3Xps9g7qfwYTLCWNjuUbhNRDmouV+hi88z4imBlk=
X-Google-Smtp-Source: AGHT+IEz5IG00lmAVwHCdXdSnJ2Z0KQTlp+V18IFUkzrkAAyElIVx0JjEnVPmuw7GvI+SO1ZUwQhPQ==
X-Received: by 2002:a05:600c:4ec9:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-43f2ff0540fmr11919285e9.18.1744269371500;
        Thu, 10 Apr 2025 00:16:11 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d069sm45329215e9.17.2025.04.10.00.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 00:16:10 -0700 (PDT)
Message-ID: <b8f356b8-b242-41da-a654-d937a354fc1e@tuxon.dev>
Date: Thu, 10 Apr 2025 10:16:07 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] pinctrl: at91-pio4: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-1-c9d521d7c8c7@linaro.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-1-c9d521d7c8c7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08.04.2025 10:17, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
