Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257B021C9F5
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 15:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748532805; cv=none; b=VpkW35zTBKMGaOhoGNAzj4FRc8UQPn7/G4UVrOxx+5KyXVQDWIIXwcn4ymmvSKGxjxBSPKk/pfzt00Q6ZfWQqtCB9uuzbUP2pjKNH9Qzk29ge77X1Sq5+cb7daIlFdwpF9nT/8SgMHxjEaWqVKJiCgIh9Z/hy7O26lUP1TK+ZRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748532805; c=relaxed/simple;
	bh=QGw3SeVFXYVYOzL+kW264JyMISWAAxmyJ1DyNg+uanw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eO/RRCP8LQR8LB0sEcww0PinyKBtk9Xul+IVNUbMMCooTmEsyhRb0SjAkRKgEC/4BOBGfYDI/DDYDLUSOONmHUd/uleUyiAUBvu8A8lmHUfZPCzTl6YTnpqZ8RkpE8oIbamp0+y4D8YbVK9KYX4Ab+cTNUpP/+uHSkfuHk0++x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Cpn/C4VD; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Cpn/C4VD"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3f9a7cbc8f1so367476b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 08:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748532802; x=1749137602; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QGw3SeVFXYVYOzL+kW264JyMISWAAxmyJ1DyNg+uanw=;
        b=Cpn/C4VDp2ry6zUF40Q8KRuYqNXzfKsBCIDZecGYi/KCS/ymLiHwMWf7fybCS5q3eF
         i8vsuVIxe1MVNb72xjZr4/t8mRsZ3FTvO8G2T0Iwfq6Q9eHDhC6tyfRaKggORellayD9
         sh08d72MAorDQZezq6YyEi80qtBnbJjwn6lGtn235eXbqbx2xFSfyancDpGPvIV5XUZE
         yTHztTmMYnLwK6vnB2g+ODvjP1jns4UzX6uezwpqUnZKR0fhtyFk/1QCay8sRMmH/GrS
         TRLx3mgoQkbp+KnOzuUAwAhW++rTl+co99t9jdXA07FIclvZ9F5ubDDlkM1igddsNfw+
         2pIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748532802; x=1749137602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QGw3SeVFXYVYOzL+kW264JyMISWAAxmyJ1DyNg+uanw=;
        b=cRHdSCcoBW3RWTuzuUVBGTVrltPyA5iWjY4TNjuFpTvWbLNCnCDK3SzV8mvEvEXW6R
         cIAPuK5vZfPpLQghEmM1bR/AUMyetvA7rDlqs0J5IO2mF2R3OlVjRFJKFDSoEJfqexvS
         lnp4CriW/9kTAly/2jn+sdXmR5DgJ6qFXGpuNqtDMAWLNGpGN51u0NQf2Wh5cW2wlEwp
         LomNvHfSSaUE4U+4R7XsWtebkb/+jXB8Nh1sHF2dHdkOQd9wk7koRZPRan+3QBMzVdhc
         EgDbHvI0UJU3Z2Pmcx4vre5l9aVhCOIgscfBiWUijVTy4nD3Ye1fYCVPajsyMat0otX8
         nzfg==
X-Forwarded-Encrypted: i=1; AJvYcCWgHea4lLRtIe5w6z+B9dIzmGJWsRaugmtHiwEh+dNh/N++bQsZTAy2OEFyUt+GQkZI7DBiCdh2SvAeua8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT9VyAMuo6B71vWYIAi23JDDdSLLi1O7AO3cqrV0qrlxb/1N8/
	MatwRftIt3rIwoMJiAXQ9OVJ61DcczYvyO+xlzYjWIuadv7TBwL9U0XHTOcOr/lQvks=
X-Gm-Gg: ASbGncuAvmMeNB1sjICDioL9Pc1zRO5pw32eznCENAvo3IL7NgY4efujoxZOmx4PO26
	sKTS6gqzXFp18Rq9sqU+jwUPBGwVYd8g0a156rZM07hg9xPl0WL0FsZHn/vcsdNbVVoc8/paODu
	SG9MzYmkf3S8EdfyOeAKYzJ9gV9kVMWqrPhjql7nrSxz0GrX+2SnmfAsPo8cfWaWpKA+DLDK6/m
	NM4U7VffhnU2xe5MSGcoErLFs0tLEX1yJqvc9JMqOY64XRk0j1TDGz3lkqjkRM93ZK9WLQO1WBF
	dm+HiLrxhbTfGYw5HzxVner76ma9cxRNp+6vl2+rVTzNpT8hH+ikgtwM8dip+mDx+0fgiyOQEjP
	HxED3fmMBulyF2rryUlzlZ3m5oA==
X-Google-Smtp-Source: AGHT+IEHqt2TXipMpOtCWZM03ipD2V1JcC4i1LJeU/pC1caBAXKNxDTmzAlqmEjoL3VZqIFse+G3uA==
X-Received: by 2002:a54:4116:0:b0:3f6:6d8f:1365 with SMTP id 5614622812f47-4067073568fmr1203951b6e.3.1748532802067;
        Thu, 29 May 2025 08:33:22 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:928b:5d5c:6cd9:1a4? ([2600:8803:e7e4:1d00:928b:5d5c:6cd9:1a4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-735af9bc74csm277033a34.52.2025.05.29.08.33.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 08:33:21 -0700 (PDT)
Message-ID: <b45ea46b-3e17-4cb9-8e69-9eea0a3f8241@baylibre.com>
Date: Thu, 29 May 2025 10:33:20 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] counter: microchip-tcb-capture: Add DMA support for
 TC_RAB register reads
To: Dharma Balasubiramani <dharma.b@microchip.com>,
 Kamel Bouhara <kamel.bouhara@bootlin.com>,
 William Breathitt Gray <wbg@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250528-mchp-tcb-dma-v1-0-083a41fb7b51@microchip.com>
 <20250528-mchp-tcb-dma-v1-2-083a41fb7b51@microchip.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250528-mchp-tcb-dma-v1-2-083a41fb7b51@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/28/25 1:13 AM, Dharma Balasubiramani wrote:
> Add optional DMA-based data transfer support to read the TC_RAB register,
> which provides the next unread captured value from either RA or RB. This
> improves performance and offloads CPU when mchp,use-dma-cap is enabled in
> the device tree.

It looks like this is using DMA to read a single register in the implementation
of a sysfs read. Do you have measurements to show the performance difference?
I find it hard to believe that this would actually make a significant difference
compared to the overhead of the read syscall to read the sysfs attribute.

