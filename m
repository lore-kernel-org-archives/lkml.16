Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD97513AD1C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 15:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745247835; cv=none; b=uLxeLi99sD/HBY+it6CgwPjV40ju6vkCIkD6t8QcTy5uDx9MKl3CBhwfbVyW1/Hhd4dFuATG6icCuoXORF4GvrXXMZHzbQVR49sgnUUMk7XU2kBwlnAahXtVUJbtqq/cUcMpYCnGtwRTilJoukYWtNW6vsK65M+dqKw0vXlylL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745247835; c=relaxed/simple;
	bh=8MwjBcfr/1YzR8kz1rCpVRVduwHDyHObygHtOZaUxFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nBmQMkY0ML4UUm8w3uec7NyipVxRhh4niVM2UHk7nhYeQUvfYUUX69whbTDMLMbo5fboAM2RILEsbD1qityX7/7CAawIfzdhaUSnP7E9jmah5dIonM2EUSWIXyWM6jCyXX3zzZOY716iI2fF/CKI0EzlLAjlQLnHHyoAGMsF8hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cOsln+2/; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cOsln+2/"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3f6ab1b8fc1so2558738b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745247832; x=1745852632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FY2XuIKhV/Sgo0Ecqc8Bv8Qk6YNHmgpAFdhrG1XHihs=;
        b=cOsln+2/8nfmAJo5/zhkcmk1SBokRsehEn0Ujj3m/lZPlzfFetDW6MU4nzbGUADjH/
         7yhhAslai2xhXWf0owiJ7uP1cz/Z8BhxJp+ftDIYzRzUh8DuDl3KF8Tqim2rrggPOy0y
         Rvuxq/hF1HjSda7QmbEzqY/Pj0ooVX30Z2QVsanM+2BeZde/beYag0gMPCx+O1/EJiCN
         msug9oTXe2ub5vkMGowGWUZT+wF/t8T/Ow4yWK3Jq9/gVu3KeuFr3p2iCqQp06S7f53q
         7d8Jmcd6SZsYuN1CtUPsw58y/++ugleyKxNjjV3/Y9ptZqs0djJgTESOlbbuSPCHIRwb
         CNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745247832; x=1745852632;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FY2XuIKhV/Sgo0Ecqc8Bv8Qk6YNHmgpAFdhrG1XHihs=;
        b=BMpMEJeGZt/0qC+0hMMUYexzxR5F/96nWTV2FSBriJ7+LDxvYQAZEcyOnp1+2xx5RR
         ey+1WC+YW2MyfKV0g5O+zYfBR1xEqpYxS4vRgW7XGGDqzqk992E1ktBm54Erl4jo+dD2
         EbLhvUIUz6jL+MoJUt4AvfeGQnvUCRFV0kIHu4xNDxNu5G2vqVYJHhhLgj9+7YZmf0DR
         XnMRQbktBiM55MQ2h6AuxTgvwfBkxvn2NH6TSmM2go2g2nSZf4uZA5SxTx+PH6s+dnew
         1Cx6F7NY12om7YbwVnrWmyWRegXvv/q3FeXpCQwrp0tcgVqwTEgHlpAjWc0LIIytBC8/
         HYLA==
X-Forwarded-Encrypted: i=1; AJvYcCVrFMCX61/q37zFJ18060O3+XN+SvB2rjt0UsdKElj0c1BPMhEtvO8QFy5Zl25dlw0/8+bG4/SPXAdc7oE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmp1EfC7333aI45CYI/+iiPuCGx3Fb9pGxcyA2iHwWB/3Ld+Jn
	YnOhNxrSsnOuwmF/G5sIZ0ep6h538nRwrAw9UzuTO/YTfTLKDLcIFetD5LuNbfs=
X-Gm-Gg: ASbGncsPRXy1ulYoNNDuzw5SQdEq3cctP2tda6f84H0Y6ZnWvjAxAK0pjraIjld+nmj
	AdANODX2XsDL6CNlooPqo1wnq4W6swe0OQS+YWtQe+2jsdIwzvKIGkR4BaHjOWzm0p95Soavp/y
	gFNJ3kmp0SpOZOeZsLi1+e8ZOwhqlX+6cj9FBwQCH0+Lw/qQQwj9OxMAbFV5zEOvHzysoWYELQX
	shRSed6IoMNszN0ymjEO37V6oieHb6KEu4a6azyeGwxnh37jNSgxeN7V6PELmNXyuNgZWMBn6sD
	SQbgND9aMVG1EqLvfgNXxA/2uQpD4VCovcL4nIX262t8fle5314/JKcsEuitwJbpM3phAZjPZ1/
	DKyQBvEUUzzvZoCvZvQ==
X-Google-Smtp-Source: AGHT+IEUiWQAh0/gbfks+29iIQLKuYGfNAiOaP+vS4xjC9mn5gHUdhe9qiJ3tqJ98liHXSBEqsOB3g==
X-Received: by 2002:a05:6808:8302:b0:3fe:af0c:73b7 with SMTP id 5614622812f47-401c0a70ebdmr6506941b6e.19.1745247832741;
        Mon, 21 Apr 2025 08:03:52 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:61f2:6de4:740e:804d? ([2600:8803:e7e4:1d00:61f2:6de4:740e:804d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401bf081eafsm1574753b6e.35.2025.04.21.08.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 08:03:51 -0700 (PDT)
Message-ID: <56f5c56e-1993-4bbd-bbce-b9c954fe8b8c@baylibre.com>
Date: Mon, 21 Apr 2025 10:03:50 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] iio: introduce IIO_DECLARE_BUFFER_WITH_TS
To: Jonathan Cameron <jic23@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250418-iio-introduce-iio_declare_buffer_with_ts-v1-0-ee0c62a33a0f@baylibre.com>
 <CAHp75VdcMoxoBU+fKQ5ex28N7YJNcEe96dOuq6hWFxpnn7UYyQ@mail.gmail.com>
 <20250421140342.4097c0c4@jic23-huawei>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250421140342.4097c0c4@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/21/25 8:03 AM, Jonathan Cameron wrote:
> On Sun, 20 Apr 2025 07:36:18 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> 
>> On Sat, Apr 19, 2025 at 1:59 AM David Lechner <dlechner@baylibre.com> wrote:
>>>

...

> 
> Maybe we could add...
> IIO_DECLARE_BUFFER_WITH_TS_FOR_DMA()
> Might be worth it?
> 
After reading everyone's comments, that was my first instinct. We should have
2 forms of the macro, one for DMA-safe and one for not.
