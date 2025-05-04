Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDC47DA7F
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 19:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746388117; cv=none; b=phfaZJEhc2o/Le5aQk9ep0TbHWI67bMdd8LJaDMs4mH5zHDJPoLOt7enHyUAP/0LOgxzznHhH0pI1YQiJc7oWkbLXP0IGlFZd4Zfsd4RfA4xPWVRyyTXp4yggzo7Wp52dvo35s3lnb1odghXBn7LgGwlISTNWZC4PiHZ6Mn5mJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746388117; c=relaxed/simple;
	bh=pfrGjy9sFH027sd2QmcRJbL9tHEZjXpENoMYvP42MH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7MuqIDWyd65dWQ9vXX9v9XalrnvatsUA+Sm6claF/BxvPBQqN3BBUe2f9zXmErIcYCvQ4OhltTMCRIGhIC3JGU0yKN3yiQhxN5kYMlS5yX7i1Wuto7Fkm+GU2q3a/H49ryGBP+3yGHVWfasaaFEQvJqkkcUfLJ2S6vNpQF3GNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Fh8sSb0L; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Fh8sSb0L"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7304efb4b3bso2215686a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 12:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746388114; x=1746992914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HnwuzSuusn2LX2ZHjCLJbOjOO8seDbLw7ar5XqNTwiA=;
        b=Fh8sSb0LJbJ39shwZB3C0yk0F0+GpaaY9/z8mdPSt8KuiR2SxC/lCssB3Xbzod5AQz
         6h40Vw3UCQmlftK7WNDxjIqZi9Ppq5QCIPf3TJR+E4B9QPpq8JEBxQJaWDXnGwRzSfdk
         s1bhievPG80NBqmt61U7xh4z+azhNf38eAvryC5WeA5D2QdVW+9zc0uXoGVMg2Ug2bZD
         jNU4gawnTV1vPVKuSYwpuXMY1ddzpyAuxxfwbIjrjfKCYcy8+hEVDZwYlQ4iIzTCi9VN
         mP78/4BenX45/2s09P6HmG9ZfXxvrYepNAtTGJ7XwqFd7+rJb5K+uT/bQ0Ne+rXztz2Z
         oriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746388114; x=1746992914;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HnwuzSuusn2LX2ZHjCLJbOjOO8seDbLw7ar5XqNTwiA=;
        b=sj502sFowF31bGnKgDM+agmnvZ+L0lVs1UKJCqVjvxa0EmS1Mwr/IrrqU+S4NgWwCZ
         LEkPV5kKjTKznbrh/nBajmLj3kb68h/gGINUj6oOzJferODTOtt8v9VtLWfPb+s7agkw
         /EyrkUEP2mfawlMMbu+gxCx4OA5jh1u9nJsOgmID5sTJKxjDVTxPdqSdSlY78Y63K8RZ
         zJ0Rw6uWA3C8DB1QgDjqp8zGux9p5j1dUYMIH6/aNlU/SUl23AixrY/b7RWK4Mf580I0
         vPCN9QmqqhldsNHdgleGzKyKyUuel/VEcco6Oq8eBxOiHqZ7yENVmjxKgzW3/TN2kQQv
         cG0A==
X-Forwarded-Encrypted: i=1; AJvYcCX41S/HoX84YlrZtj7+fpFi4Q2i5Z7exusaNskA0dCLDolteZPIx4DmjPr4/xovZeTlXrJvJdUDrf0gJYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlVfcDEU62r31vX1nQ++zAPMQox9+tS8q+emd/EFwROr4njYV4
	zCm1Jt/QlWpVKa/TsG4xIW62SnvXOl9vtaa8t7cXFLVND8kpQc0l4UgqDkyd87Y=
X-Gm-Gg: ASbGnct0KzgDIfDKKuyWRQK8xSAoNBmfU2ReHy3d9SkaAuyYyxU/rdBgnI25eLA4wGV
	xt3DjIwJ6xErAcc+4BnSUuu6SX3RcNf0b5XVhb7onY7N2UJBeMEYip7xVHsxgttqALBmvvbVnJi
	7PP/xRQ61E6UxZFY8Z8b6AFfvCGgK11HunMYixnNoexB1FqgNNXAJM5YLHP3TlZzhVbdJny5Bz4
	cq2YWRwuhu2skyf5sVwez59Z52mZMbNklq+X0W6wF98OKFTax7BZnSOqfSgBmU48H5R4PuaDRnq
	JsOyDBjGczt/+H3tglylsRdhqwdnyvXd8IVAoCOcpBexsfptFfX728kx8Itu/402FC4gn2rpiCM
	wmyatG8Hh+QzkNlzCusaLcm7cXzIR
X-Google-Smtp-Source: AGHT+IEeWwZDLnV2kLTz5RTYpnyvvvl/iHho8ndVq67XvjTpGS5bVf4ZbtzTB68KrAEY12RnhPnaRA==
X-Received: by 2002:a05:6830:6c10:b0:72a:d54:a780 with SMTP id 46e09a7af769-731e564611bmr4217238a34.17.1746388114338;
        Sun, 04 May 2025 12:48:34 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:2ddf:83b1:4b93:16c8? ([2600:8803:e7e4:1d00:2ddf:83b1:4b93:16c8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-731d350943bsm1249459a34.61.2025.05.04.12.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 12:48:32 -0700 (PDT)
Message-ID: <357c418f-7f00-416c-937e-f6fea1c0af96@baylibre.com>
Date: Sun, 4 May 2025 14:48:32 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] Documentation: ABI: IIO: add calibconv_delay
 documentation
To: Jonathan Cameron <jic23@kernel.org>,
 Angelo Dureghello <adureghello@baylibre.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250502-wip-bl-ad7606-calibration-v2-0-174bd0af081b@baylibre.com>
 <20250502-wip-bl-ad7606-calibration-v2-1-174bd0af081b@baylibre.com>
 <20250504161603.7d1027af@jic23-huawei>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250504161603.7d1027af@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/4/25 10:16 AM, Jonathan Cameron wrote:
> On Fri, 02 May 2025 15:26:58 +0200
> Angelo Dureghello <adureghello@baylibre.com> wrote:
> 
>> From: Angelo Dureghello <adureghello@baylibre.com>
>>
>> Add new IIO calibconv_delay documentation.
>>
>> The ad7606 implements a phase calibation feature, in nanoseconds.
>> Being this a time delay, using the conv_delay suffix.
> I made a late reply to v1...
> 
> Key point being that, in the general sense this is only a calibration
> thing if it is both writeable and we are using it for filter phase correction.
> In more general terms it's just a conversion sampling time offset (and as you have
> it here in seconds).  I'm keen we define this to incorporate more general
> cases including extra read only info on sequencer timing - that can be useful
> if we have something like 
>                  _____________
> Input 0 --------|             |
> Input 1 --------| 4 in, 2 out |-----  ADC0
> Input 2 --------|  MUX        |
> Input 3 --------|_____________|-----  ADC1
> 
> That is the ability to schedule more channels across a small number of
> simultaneous sampling ADCs.  In these cases we've never had a way to
> express what was done together.  Mostly there have been obvious
> combinations (i.e. voltage and current at same time on a given wire for
> power measurement), but it would still be nice to use your new interface
> to allow us to describe what is running here (though probably not control
> it as that would be hard to do!)
> 
I'm totally on board with making this more general than just calibration, but
having worked on a couple of multiplexed simultaneous sampling ADCs like this,
I'm scratching my head a bit trying to figure out how we would be able to know
what the delay was between the conversions, at least in cases where we don't
have a hardware conversion trigger based on a clock/pwm. Generally, it is as
fast as the SPI bus can bang it out, but that isn't a fixed or predictable
amount of time.
