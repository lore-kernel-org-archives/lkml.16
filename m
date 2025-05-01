Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD01421C198
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 17:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746121060; cv=none; b=AtiB5mA3oqK5Bp72Aos0+Tu1Wx0OX48/SLoY5gCgu1sSXVWss/+aUW8ehYB3LxB9xboz8hhKX331aTmxy3uVbd/ilo5kUKKSQUzqJSqJUQomgDQAtGt+OTO47uA1bpGra6eCMTNHmAtkZyC5PAz56vhB3zjeE56fUAo/G73jwcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746121060; c=relaxed/simple;
	bh=n7tCVA/I1yo/yeD9ArRPIlTYK7DJ9Nd3uEq/KLJZuL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePpbgBimFcDiziWOOiC7gMhZyXxjCddiDOZZRzqcXwPo9uRPhlSjaXdn5GhjUZe5TzlSvWpxXk1hQcRY4ZP4i374QmAyeGPIiO3S1kFFkCQV5R0v9gE94XCvnDxxJk8wjgQuTBRvSjGco5lXUWkJpikJ4myEYeVzqKKLbItLGsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=N7mPn4l7; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="N7mPn4l7"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3fbaa18b810so329978b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 10:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746121058; x=1746725858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HWEnf44P8DmPGIbqKOpgVenjN4nZrTylxIuWPEPPN/w=;
        b=N7mPn4l7STX/UPle6TPdABRDCEfgJmCpTTKhpY78WZuotpiwfoee3HSbF+8wk3+KFc
         hNEr9H8XBnLLa9IqE20WgxdrrBXeb96ACL6oqjpMw/8WS4lYdv6LEdSAV6VK0i44/P1c
         mAYVkU3fwHZ9UhhGLfwS8xo/UcfJRMDeFa1tq2WHB3yT+mTLMOt34rA6igfHpAP4FwAC
         exA0CDbX3ehrrWd887v2fjPWYG7p4ndNz0eeE5naBwCC7agxiqD6t78UfmQWxZc67XsX
         klGvrDR8x0hXunQRw6EVHtrzI56TrYCSlepHPo2mFmclzhaCTJTv98F9sJwMicM6Z2li
         AtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746121058; x=1746725858;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HWEnf44P8DmPGIbqKOpgVenjN4nZrTylxIuWPEPPN/w=;
        b=QEoxtQOwmJzq9FF0FTMTEY4bkBtzd/bgFNgfgXNtTZktaXWFgLoTCoEu/VyJZSyqg3
         MDMn4LR9rUs5koi/4ln+pwD4ZwVNMLwDYT6YlyFZzeshQ9bis0BP9TEZaq4nRRKRKfcj
         iZX3IaeNqK8cHSPYieaVtR84ijQPval5ojt0zuEkWvKMYM/mLx0ApkyH8bJ83ccayBVc
         xJNA+X/06RDXQGs+GmWUPjCXUcT7fccWuim7P/kGZtDYCuNdAmxh5fv61T3e66lozvEP
         IyjkAHR0lRf+FerqQzdW33E9BZNHotQL78ZEMPxrvqSKZmuQ/zCDkYl88cCVOHdDikKv
         DGhg==
X-Forwarded-Encrypted: i=1; AJvYcCXRHJaKtusjJdd2ouQAdrzN4QDoEnBU+KYCMNApqvrlgZ8FqlyN9FhKC0SjWA2K9QNlrp+DmqCObYTMGV0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi9e8WzAnZH7dSd9NjcXQbp/DU+cdmyU0/TO/ntaA/HOvam5VA
	ISrDXbyBZUyI/uw3gAwDwKGbcy+bXuo8Yqt0VoWsPOlVNBwtmphaBlUHRY5ArhE=
X-Gm-Gg: ASbGnctpr4InoWl3Z58ZJT+phAVLTHP1JnZhsjhPj3ypOF9yFB08KijsfSU1m2+MlFt
	/tZL7BeNj6N+9U88y+xfQaw8SG6tmSrdp2DcyDtB8YiYeCaBAXI2nk//gOZVRrSudjzxrC2FswL
	P2koukfrFizodbCf2xA/dpMyTFqMDwnv+bDtnvfait7dOHmB8nmxqQTQ8FjLSQbWZS/+PNCy3Ml
	EW5hpkqfZY/Ms/J31rQGZqUJ2NeQEq9kxZ9E3hWGZOLXgrvwyPG0dXieY9aJBDp1usS5RxMUYJz
	0IdtHOpfM3FcnL4LkuN65E2Potfcka1VIsRzFNRjxZqYTGMhl7pRKnnBTQEFZoOt0UxjQ608WZu
	phtpEJI+R3LnWkH6j5DkBY6vM7dB6
X-Google-Smtp-Source: AGHT+IGL20gyAz4SH3A+Gml/P6GxXPU0D/byhQ6Ec8A6G16T781jbJMjfC13eZXdeAWXzY911EFxnw==
X-Received: by 2002:a05:6808:1b9b:b0:3fe:aedb:19ea with SMTP id 5614622812f47-4034147912amr63106b6e.25.1746121057884;
        Thu, 01 May 2025 10:37:37 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:b1ed:e5d7:8ea6:40e0? ([2600:8803:e7e4:1d00:b1ed:e5d7:8ea6:40e0])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-607e7cab6cdsm194276eaf.6.2025.05.01.10.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 10:37:37 -0700 (PDT)
Message-ID: <213ae3d3-b6d1-4808-9af3-36a8cc1f1335@baylibre.com>
Date: Thu, 1 May 2025 12:37:35 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] iio: adc: Kconfig: add Kconfig entry for TI
 ADS1262 driver
To: Sayyad Abid <sayyad.abid16@gmail.com>, linux-iio@vger.kernel.org
Cc: jic23@kernel.org, lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nuno.sa@analog.com, javier.carrasco.cruz@gmail.com,
 olivier.moysan@foss.st.com, gstols@baylibre.com, tgamblin@baylibre.com,
 alisadariana@gmail.com, eblanc@baylibre.com, antoniu.miclaus@analog.com,
 andriy.shevchenko@linux.intel.com, stefan.popa@analog.com,
 ramona.gradinariu@analog.com, herve.codina@bootlin.com,
 tobias.sperling@softing.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250501100043.325423-1-sayyad.abid16@gmail.com>
 <20250501100043.325423-3-sayyad.abid16@gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250501100043.325423-3-sayyad.abid16@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/1/25 5:00 AM, Sayyad Abid wrote:
> Adds the Kconfig option `CONFIG_TI_ADS1262` under the IIO ADC menu.
> This allows users to select the TI ADS1262 driver for compilation
> during kernel configuration.
> 
> Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
> ---
This can be in the same patch as the driver. Same with the makefile - it doesn't
need to be a separate patch.
