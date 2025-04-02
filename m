Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED42120E70F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743607557; cv=none; b=ayrE0FV2Eh/Dc+b4ZDxg85AjPmNN0CUfi/JLzDFGnLR4CN2S0N7Jt75it+Km6BotLCq4Fp8meYLQRJQ0Nl3EjfE3j9pp7ePYmH70kzsLmVGVRzuLUavdMDjssiVuRdzwgfAZhMXDYHnHO/vYu2Kruqd4x0d1F+HUAHPFsoz6bqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743607557; c=relaxed/simple;
	bh=l926G3/GnKMsY91eRIL3ZKQSAklEMXj6F7fRMQUHM2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BaNFuACC8f+yCsPS2keOf8kRxwmx9NuCf7UYzfucKWL+ltpxi5jRn0gQumrt/Q2/l/+M0yPnoK59AKH/1pF0Mc87f5VG+pnfgkVQOyLqXIgZQyrcYiKriAYdgJ4EGU3LO01+X7Sqzn4qlq2KFm57b7GBnBFsZ9DzN68cT8kMCeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=or1S6wVO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="or1S6wVO"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so45360495e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743607554; x=1744212354; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l926G3/GnKMsY91eRIL3ZKQSAklEMXj6F7fRMQUHM2s=;
        b=or1S6wVOTuk/gZe5ajxLKepu/wiH6tH3Bzy9ZxCrwOH3zYJ3VPntXpupxS87ltV6Hh
         Q6MpxXiwi4iJF+41ax25oeY3z9fgiDWmloVL4BZkpDcqpOb3ko/eF0Z+bXL4QXSuezSk
         QkAT3uK1PECPn47vkJlSL/zxeLfysw5XwcIK/jSqNn1HGgx0QcrM65glJfqKG3m96tfu
         kVyFB6qJ9sxj8xfLImA25PZQ3janiwbhs170Tto7ATaN096nx/ITdKLXHOkwt5BO15yJ
         JxzonmSD1spISw+YW/dIcCF59IDq2kg7CEtpV92v3KVHwzK4yqEk02A0m54nIBUcYCo+
         C6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607554; x=1744212354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l926G3/GnKMsY91eRIL3ZKQSAklEMXj6F7fRMQUHM2s=;
        b=nbNOPA1ZF4d1+4k4XS0l8lNjuPOVkF/4ZE/qOAt57A9xKri4DcF5T0FHOt/PCOGunG
         DxdCR6hkyoC9EXZ2UTuhQsAHzw5JpI91WPMP5YaVELhumXwWIfA07rBxhPgx9C4zJtmc
         Bl8cTJbLvt+0Eb3k9WPFGcTc1cllNWnFNyqfrB/BF8ZzBJ7CbFB5zSuWkZD2LyB2WbX7
         HnhTlJIaW7NJGAHR/OVikV03q/TB3Rw4PfsbThgItWNHaXsQzdNfA2HYu5gqFxSl97eE
         usGwDNCwSEfLvWjQ8Wb8ll9cPiFAonMah5IuiL0UHyKVXNAArpz8WAPdzXkfJ7ODGxgA
         HEsA==
X-Forwarded-Encrypted: i=1; AJvYcCWGZwcjz7Nej2z+EQuXTDcj3hislqd2KnXpQuZYI/56ju5x4Gx9XC609V4FTVnunutATB7oYTNyScontDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwGYboRUQkvR745Pvnhx8zcKj5ToRcdvUBlWwsDARMvYySmmT8
	+k74sk0GaCR92S8zsICO2A8DvRcuqZ10a4aHJNUKT9OlC8D/RKQ2DdbGSWvD8Hk=
X-Gm-Gg: ASbGncsIPWpTZgjiCDh+BghFS028nmAJaQ7trjIXWOnHEYYVSul43j+teXSMwyL9kR4
	w5m0H1/zAYBRhRWVufK0egby5EjQLgxknQIxS1NvgD0Ch2DSEiG4BjkB2RAkdPXHhd03ee2QwXJ
	iY/nbsQlec6OUA/KhfAVueCGYzlNEPp6k2w9F+ungl3vrq8q5ZnNb75z5/i4Cs5wBvugDIt5Snw
	Ls8g499JJ0FfF5OQxMMLDj3M0mObIh/j70UVJEYBrchv+AxRFtYe10NjUpMZ2cMf9U6E2oiGqe8
	EmtXMtqk9Cn210zfvp70etTRyhZbbeVSsU3g2ZY/IiNenCfYy2wAPg==
X-Google-Smtp-Source: AGHT+IEegXmVKA09FbeJyOVnobPM7jeiGI/k1Yr7hy3uRUtv8KSbnYS8a+5IfVfK3n5ACyNX1dGU+g==
X-Received: by 2002:a05:600c:8705:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-43ea7c4e749mr79860615e9.5.1743607554183;
        Wed, 02 Apr 2025 08:25:54 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb61b633asm23897165e9.37.2025.04.02.08.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:25:53 -0700 (PDT)
Message-ID: <c41598be-08ba-4417-9fc8-94377d8b1d61@linaro.org>
Date: Wed, 2 Apr 2025 16:25:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/21] mtd: spinand: winbond: Add support for W35N02JW and
 W35N02JW chips
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-21-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-21-45c1e074ad74@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I'd consider squashing all patches from 16 to 21. But not a strong
requirement. I guess it's a master of preference.
