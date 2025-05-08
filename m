Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BB9270EA7
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746717979; cv=none; b=FxkrS/GAuP/kwRsB+NyDw6a7b4+c3BmX7p+xk/Lnz1l4Tg0Sge1I7QtxkANoEnI2NpH76QTUDbhtlMH1kxO2R8eC7XWBnTtwF3whXPIYtxLOacrxpxrNwtMGgGwPF/VdotGtmhJKiJx53u9tZnW5VGw1XauZVAsaBndKgioMpLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746717979; c=relaxed/simple;
	bh=tURl+tqmW8IFifp8JcV+tFaZyMpc3PdC/Qhg5W9UnpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ftvxF2P5GMAnDUwpsqGZWMoNjoCvOneJ/PYI9zf11Qlo7nZLQI9awRf88Fpxrq1I3khvv/yeB2g3r4TKVL+RqW4u9Cgl4wSC4arlTEUX28LdrY9sDL10ukpXelxkammMSZaVR+akmIPwBumi/uD3ZkgNnswS5EuDR9FPCCoUVlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xtI/eprv; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xtI/eprv"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2db2149ffceso726140fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 08:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746717975; x=1747322775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bVI2JCzK/Honr6c714s7LjAw1g2LwnFaGSDmVmMruzc=;
        b=xtI/eprvFwlQwXQCpfpyDAtyNs+gVhs3/Si95YWSVEOB3cUZQqUeN9YJBE86ZeNGJ5
         +yuab4QYmwASvY9MAeQsNnSzc3rKYPbzX2oRLjAJHAHRQ5cikUUKG+H2dJ+/niST1rq6
         i8Dd1J/N1Thf9OdGP+cfjTNf/rza1VzbZYWIjN7U1y6SSbDalS+UQwNEjwijjQzlJGbw
         ZGJMQMiJ8hlV8Z7A3ytQyXkKPcY4BGkgZh9iO6DC/gbHSzVlbklQcFiyLBODZvzsCAba
         dV8DfMpo8FKDaCuYLFHYUmU557SSDRjyfNrrqCnhukOBkSHMOe9gB08bwuTDNtOriy4g
         mb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746717975; x=1747322775;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bVI2JCzK/Honr6c714s7LjAw1g2LwnFaGSDmVmMruzc=;
        b=LknnD9VRyz/S39goJyRMahMmwt3qGEWB1T9Kbipx9ZidBgH2e4UMxBAwHFDNP1C5/D
         aWwWrVgvQX/jXzFvljESBjFJClPXzNs5/5BxdGC5p526V3v8ltMXhlvdy7pXtb11xNUG
         7w1Mza5hwl/Co12/oCHahUdLQ3WZkx8wKInvLU7XyWtrrrVrXtBuIFPzkhhWlNdhDite
         dJB9rD1WMlsoxXX9Q8wYBf30gSVO263rklk/ccNj704pAlatqLMzrgXIQmHcC6Fttanm
         IGTVrhFHoAceZhwOG0cOW8aQAYymPe64XdXmcktuBsdQxfDJFtH88uotqmDsQumPevD4
         BLcA==
X-Forwarded-Encrypted: i=1; AJvYcCUBilk5tvU9iXvrfJh70/YP0n7TA0TVf3JfdvfZcwe42I9OahkSLzoI7+ostNk04uUJlruXfMzCnuqund8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiF3D27JbVIHRVdg2u78y0EhxXuLQ/2jDL5zW6zGm6ZBPSf1om
	do12o0VDDjwPPXI0SUOm87G0R0Q0oSnvupSOCfAzq05pAq1kmSnMeYtuBrubnGs=
X-Gm-Gg: ASbGncuMNKxQwZWvjQWibng42jcJf8n5uNRfk7N2UunQ6lQRDF6No5LEmajjFBWxSxG
	iQKa1ao2cX9zc51zDPhI+UVcUT/gdA+yZfzbKYhxvraswTDGMuX+UQYcjT5D8OWAUvKXg3dqQGj
	x479UrjnLX+eIi3mCa/Mvac5xO+nnE61Gv6AcJegmCYff0DtZ4zyAC9/lWXAYwPS2wZZr3ZiOG+
	tcarLCFsHNluhdwVtQxAS59xWFtE0vM8/Y/hnbHP7bs+jFrhOFJJibjTIT0ymHNbF3MX+U4LGqc
	BdbqUoQEdEFlNjDBXTK1n0JfbTxj4ZprBoJguwFFGUPhqL2Ev8Oa8rvx0MZTJaZih4/0nuGpbV/
	YMafn6bC2F38iTpuiUA==
X-Google-Smtp-Source: AGHT+IGj0MmV5mLbPBP0RWrxkG7fe3E5MPXh+/Rsosqd2Ao091UEuoKROB29QW8ZCVx98W2znSajqw==
X-Received: by 2002:a05:6870:ec92:b0:2b8:e4b9:47a3 with SMTP id 586e51a60fabf-2db814c6076mr2410897fac.22.1746717974798;
        Thu, 08 May 2025 08:26:14 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:1120:d1cf:c64a:ac7e? ([2600:8803:e7e4:1d00:1120:d1cf:c64a:ac7e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2dba077a498sm79086fac.23.2025.05.08.08.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 08:26:14 -0700 (PDT)
Message-ID: <a0b305dd-8eb5-412c-b9c8-d2b274707f66@baylibre.com>
Date: Thu, 8 May 2025 10:26:13 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] iio: magnetometer: Add QMC5883L driver support
To: Brajesh Patil <brajeshpatil11@gmail.com>, jic23@kernel.org,
 lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, marcelo.schmitt1@gmail.com
References: <20250508120822.114060-1-brajeshpatil11@gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250508120822.114060-1-brajeshpatil11@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/8/25 7:08 AM, Brajesh Patil wrote:
> This series introduces support for the QST QMC5883L 3-axis magnetometer,
> a magnetic sensor with I2C interface.
> 
> The implementation follows standard IIO conventions and includes:
> 
> Patch 1/5: dt-bindings: vendor-prefixes
> - Adds 'qst' prefix for QST Corporation
> 
> Patch 2/5: dt-bindings: iio: magnetometer - Adds QMC5883L bindings
> - Adds compatible string and required properties
> - Includes example device tree node
> 
> Patch 3/5: iio: magnetometer - Base driver implementation
> - Basic register access via regmap
> - X/Y/Z axis and temperature readings
> - Triggered buffer support
> - Initialization and core functionality
> 
> Patch 4/5: Extended sysfs attributes and configuration
> - ODR (10-200Hz) and FSR (±2G/±8G) control
> - Mode selection (standby/continuous)
> - Oversampling ratio configuration (512-64)
> - Status monitoring (DRDY/OVL flags)
> - Available scale and sampling frequency attributes
> 
> Patch 5/5: Advanced features and power management
> - Mount matrix support for orientation compensation
> - Power management (suspend/resume)
> - Control register features (soft reset, pointer rollover)

This sort of information should be in the descriptions of the individual patches,
not in the cover letter.

> 
> The driver has been tested on a Raspberry Pi 5 and all features have been verified.

This info is good to have in the cover letter. Even better though would be to
explain a bit about the actual methodology of how you tested it.

Also, a v2 should have a link to v1 and describe the changes made since then.

It look like v2 was sent the same day as v1. Generally, you should wait a week
(or at least a few days) to give others time to review before sending a new
version. 

> 
> Signed-off-by: Brajesh Patil <brajeshpatil11@gmail.com>

