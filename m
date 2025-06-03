Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9FD231830
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748957396; cv=none; b=VsJfsv6TLRvsrFTGLqTBc6odlk0UXKWs121fQ2ekILbmpL1yePuUNd5iSf3yCybLQBGQViOOJkm0G9TNez875sBtd5kna1epMwyzKm7EeXoVPRl76pz/ZReKkdnFsdfcB/XThKOLLXfp2YJJvo6reH78WE5z9najWt9YJYyfsrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748957396; c=relaxed/simple;
	bh=cALEzadqM287uTeXN80M2rgaHzMsWBb39Fvo+oH+CF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YLL1EIG6/EzEEmUY12cCstZcGttrSU3wBNsFbzhNbNVmMkdHOGCn9G67hq4AcRSL9R/f0t3EWQ7TuEg74584EN2HxAIZc0/u2UQIPGmom2Fcm5S+ZbGeOWAkrEql1SfsxnODV0Ze7cWa2JMn4zga4i7zewywGr8oaQIG8FiCY+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Cw6jC+X9; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Cw6jC+X9"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-735ae79a44bso4561359a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 06:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748957393; x=1749562193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B4074lnBbCE6o69YYHhmehNVryk0Fo/i6I6lU14MnK0=;
        b=Cw6jC+X92BlLi/wmBuOnLuUP/AdKqtDDP0eHpAV34V75HpR2Rine2TqLhJWOIkikGT
         h3JyVF9uH21kDWmI7aJPeuEpOxWzQY8VrsoUasyxU4TNI9iW93d47z++cqZLgb1x1Zxy
         2yyJFYgjIx4XMQlg8BCPa2wYywnp6CLvNw6mp9JBWzl6YQBE2OZoF8yXycqPvl3ZVohw
         zRPmNRIDeYhGPlVxXRJKmiQTVTWeJ9yLf4xAM5cIhGXFijdFnSG2nB/RuqoSSdVR8RLJ
         JCj7mCDrXKiv1FXQJHOfV2Dqk2PT2ckCkluMYs4VeGeoE+s7yA3NUBT6ttQI6iw3hgB5
         9pdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957393; x=1749562193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B4074lnBbCE6o69YYHhmehNVryk0Fo/i6I6lU14MnK0=;
        b=KCKA/V7zm5Lef7WQy84QyOx+9uPUX8tnfanHfVrWGyz1dYDNW2zgUe6C/CSUJJiNRn
         czGe6Ff5SMh3AhJ7j393tJARkAZMEQxChkcjvVM0WYxoyGm5HZbGSrMI2ExDudI8ad6K
         NcnCRDViI/NqnBUWxOVH6pKTecFjV4ThQF5E7gtN5tXqSHn7SECtNObV5tWyzC/JOhgM
         M5UHQo/CbI3NWSR2CBqoEG2ZoXmV6WCy703Zpjg+6hGowo3izedyhlOyINFPqFtfHJrw
         9UqaQ9ZVvRt7uPTyq8rTuHKYiAFujscmCPu0YvIi3ihayOVvczGKGPgwgBJiR7S4MAdK
         pkfg==
X-Forwarded-Encrypted: i=1; AJvYcCURJ7FAIjtAepRRs7n3n99jpEKJSmhHGNwVqADwcEL6GBO/xpVyKCYI+7kX5aOejvkhlf8MzDrJlkQTtow=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWaulP9HvqhMu3/u10wf0ojGCKG4mI93DddvCIXuEmom69+FW7
	ei0rYCBnrVdELEFxAF8+O7/dynyX68v2zaFX41bXOA1i0tChX2U77W90xvznK4k4f4s=
X-Gm-Gg: ASbGnctYlWp9GzYbRI2I/BDQPHeeSDUnUdgM8LCfOxSDZSa2Br3LahgimEjl5TjIxgU
	59wPFfIf0vDEoVNZ3nbxNOmcJHylvlufSk3//fwU9FZAmUAsgb1W6dQOwRNDuQlNBQGNSnC30oV
	APRjoN+y97a0jzwOod7K3cik3JOa1Tbv+K/yLk2A5qExtnHzqRDQoM5/nIVr96FhbZbQnLYxVqb
	IT/UrVc9sq/q4KC7mu15syFRX/pL/E8DPOiKiIsDmlxsnuzXPsHR/4N7hjlYnOyKmcQIjrTfHVL
	jISYQSfDz3YLOW4py0JyiUXYWBbhKWbG6+gCz1cPMjpQ0FGMVNPp02snPZ+TKHEO60vSyzUlfcm
	7RboqvWpyqkSHbzjUw1ES8lNdcX9ztSydY1Iy
X-Google-Smtp-Source: AGHT+IF8kMDOg8rwg3c36JfYuMIR4bv1Il8ofYqW9P5T2sZ5z3aDyr/IKbsJ1zcRJnmWjOwA0bGxPg==
X-Received: by 2002:a05:6830:370b:b0:735:b40e:2b47 with SMTP id 46e09a7af769-73758c0ad87mr9227072a34.5.1748957392742;
        Tue, 03 Jun 2025 06:29:52 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:e835:af77:41c:3a1f? ([2600:8803:e7e4:1d00:e835:af77:41c:3a1f])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-735af879fe2sm1962952a34.40.2025.06.03.06.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 06:29:52 -0700 (PDT)
Message-ID: <b1f0dbee-13bd-4e5c-90b9-c6d88cb15971@baylibre.com>
Date: Tue, 3 Jun 2025 08:29:51 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iio: accel: fxls8962af: Fix use after free in
 fxls8962af_fifo_flush
To: Sean Nyekjaer <sean@geanix.com>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250603-fxlsrace-v2-1-5381b36ba1db@geanix.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250603-fxlsrace-v2-1-5381b36ba1db@geanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/3/25 7:25 AM, Sean Nyekjaer wrote:
> fxls8962af_fifo_flush() uses indio_dev->active_scan_mask (with
> iio_for_each_active_channel()) without making sure the indio_dev
> stays in buffer mode.
> There is a race if indio_dev exits buffer mode in the middle of the
> interrupt that flushes the fifo. Fix this by calling
> synchronize_irq() to ensure that no interrupt is currently running when
> disabling buffer mode.
> 
> Unable to handle kernel NULL pointer dereference at virtual address 00000000 when read
> [...]
> _find_first_bit_le from fxls8962af_fifo_flush+0x17c/0x290
> fxls8962af_fifo_flush from fxls8962af_interrupt+0x80/0x178
> fxls8962af_interrupt from irq_thread_fn+0x1c/0x7c
> irq_thread_fn from irq_thread+0x110/0x1f4
> irq_thread from kthread+0xe0/0xfc
> kthread from ret_from_fork+0x14/0x2c
> 
> Fixes: 79e3a5bdd9ef ("iio: accel: fxls8962af: add hw buffered sampling")
> Cc: stable@vger.kernel.org
> Suggested-by: David Lechner <dlechner@baylibre.com>
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
> Changes in v2:
> - As per David's suggestion; switched to use synchronize_irq() instead.
> - Link to v1: https://lore.kernel.org/r/20250524-fxlsrace-v1-1-dec506dc87ae@geanix.com
Were you able to find a way to reproduce the bug well enough to
test this?

