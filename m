Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9899288C88
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745338781; cv=none; b=LojXN4c0mH/wUtKkb3f2FKVwdDoPvCWYKZVsDRX655UhYKRXJN/of/DivXdShTB9bp+5k577i4WwnBg3tHYwZhdI9hCNKOFkmX9biue5duLef9FVGpo0TSAvaVxiN+95RP388yfwdScB8GBNUQpHdIyY1AEQQJhwxcdwjRpA4f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745338781; c=relaxed/simple;
	bh=4/RzQ1LIVvZG3U85Dpg80Q2UbbVOrbHAeO2QxKYyG44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LxoGfWMzhgGlkS7wVy6g2AZqaC13KNUlIjxkyHvVnKvr//GfSqErGn2c1pTWk/Iq4AreELxlNB4ZyUPw5KTGr8qaAGYjMg+63pmC3JaMVJli/QizfOuAaQmyKkassSuJjPjwNRzQYyd6eqpU+51B0PspwyJ55DBBYNXBpFX9MQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=unCQKiFU; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="unCQKiFU"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-603f54a6cb5so2695833eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745338778; x=1745943578; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tfn9NtUR+iFG2oeEiO9AF3LZGUmoabJt4G/s63Re//E=;
        b=unCQKiFU67U1YgVGh5ia8HRmopDtqcoPY8TP4Nx00VtVlkIxKA+F6ERqynYjVeJMv9
         V8IX6YtNYDx1lYWjrH/tC3k04mNz/N71muXTpZqPAwUjCNi/atXNyKimLRSmytlhqOKQ
         eaoar5JZapR6BKpB+3hC1f50yYJdw8exresIjz2T54DnVw3sTTcXbyRKTzVZ/NM6Iue5
         r9ThZ5upz4Q9O+YOH1fnrW7gwGHP3PcovrEzLFuTdCzGgNnLffF9+EJ+hRepVR41HviA
         CNjuGj3y0iRCnISzrK4yXAbgfXMBpiHS46jmVc6Bw+brQVZaGhNvSaR+5Mhrw+d+9Idi
         OoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745338778; x=1745943578;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tfn9NtUR+iFG2oeEiO9AF3LZGUmoabJt4G/s63Re//E=;
        b=v3reLTK9cda4IEUZUaqkQGm0RQGeEPuPh+WIiAQRvn34Q96ti2opkLzprGMJX0C/fN
         pBo9kdeHmpldU5inDQxKdy86XDcB+mCs9OB2oNRY/nhH/8zWpxfESzxMMloEcIcFzsel
         60Q6JjCFKb63te+qpgVqadzOt+fsKb1G02j1RheN9/JrpmiVT5m5Xs0VtWP28F5/cAIP
         C2udLoaK5ct+y8fN8VTpfIGZj4CgOxEDDP1xPRspAVxdbZzu3tI5/SsN7wTweaiCQkOG
         SIZZwdEwueZRa54T7De6umDotbVnlez2KJ8U/TCAdZLLjnRvzBlP+lzNa0BuISJiUDkm
         l5GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHvM8f4n1Q92vDkc4Go/fqt61UPIJ1RuKdfe2dmXIwJEfKOXb98LxM5+aDjvdDOBej2IGau3NhWwPOGsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRqf0U43TwXdf+kYGRhM+nu4YGLOLbYUMzWYgMeudX83sBx994
	GoKfbsP+BOT8R9PAsRvBvk2ewl3kHYIXHQbFCrQ8CSnDQwxyY3LoWb1QOWpnzuU=
X-Gm-Gg: ASbGncsRKGLhJqKZOSq3ZzNC0OpP7eQkTpARlXxFJtVA+i74Y30VrcURHrU8qYimnqf
	/MNzbNnaJgqemuUAQWENz61LXnhD6puEIfYS9x88rbFh2qHSN6WnKnhfkgdr4OLChNyQt46587h
	y0efb/03jblVFx3LzX/9iDYXMI6gpN65tHAnH/iRD9+bRTNrxOKUQ8jXqVK/rfLZgUsRsYF7hJd
	0Ibxbl+e8RoI5dI6/VR0Xky1oYVEHwUoQSk5E0+hzxgOiCsUg4R4eY4GRZX4r5BGcHsuyoqroQU
	XKcyMb6qHLhIGh3saEqosb8+Ps1fliMaXl4o48tww973GcyS2p7IQy4MMVmJ13lwRn8rXmk492P
	xx4FB0u2qvfEj76/RpA==
X-Google-Smtp-Source: AGHT+IHnHLF/MJmsCEVOMpIEMAi20+FfoYD+9h/aOe4dW6zU9BD2Q0se95enPxwOaKkNpTjn8U+TfQ==
X-Received: by 2002:a05:6870:e06:b0:29e:2da3:3f7b with SMTP id 586e51a60fabf-2d52696fa41mr9068798fac.7.1745338778018;
        Tue, 22 Apr 2025 09:19:38 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3? ([2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5212c97adsm2615604fac.1.2025.04.22.09.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 09:19:37 -0700 (PDT)
Message-ID: <e43442a3-d36a-46f3-ab13-7c1b56d2993e@baylibre.com>
Date: Tue, 22 Apr 2025 11:19:36 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation: ABI: add oversampling frequency in
 sysfs-bus-iio
To: Jorge Marques <gastmaier@gmail.com>, Jonathan Cameron <jic23@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Michael.Hennerich@analog.com,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250408-abi-oversampling-events-frequency-v2-1-4059272b7364@analog.com>
 <6rgtuq2mtk3a63d3tlzbgjhauslkztgemn7566qyi3mzwywprq@lxhsvwofnvg2>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <6rgtuq2mtk3a63d3tlzbgjhauslkztgemn7566qyi3mzwywprq@lxhsvwofnvg2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/22/25 2:30 AM, Jorge Marques wrote:
> Hi Jonathan, David
> 
> Should this patch be submitted differently, such as under the AD4052 V2
> series? Or are further modifications needed?
> 
Jonathan already replied that this should be included in the series with the
first user, whatever that happens to be.

https://lore.kernel.org/linux-iio/20250413103110.572de81e@jic23-huawei/
