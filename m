Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9726A1A3152
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745600130; cv=none; b=SKQCnrwyimt2ivFoO+CxMXoSqg5p5AgkvK8N8TeUtFW/knJdJyJt1nW7BLFzlxsisL6VbwzrZFvBnw+BeRVE/ZjvfCkcgIWA/dSVphoszwwEEtE9I813o2d1nN2CaP3f6xCe7aJNTg9VOm20jEDj8vMabduMlscOpsgoihm2Og0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745600130; c=relaxed/simple;
	bh=av0WARHpVC5dP0N7FA//JdQofs5lv1A3nuk6xbdoAkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OuvJ0EqnVhK/VNB6oZSYgLk+RD7IARgg2e4lTMV0O6qShkTpEz8m2wGZQKBPFf4DxzHwZ6AWVAbeIKDAsr/2u8YabZtpfj3AZMPcJfSH7KqbX+PikxsBRbXePbQ+rN8XNndcs1Rk6tqB/Drq0q2uUFG3OhPRRoBkP8P1oBaDHp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Hj8WG93b; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Hj8WG93b"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-72ecc30903cso1495212a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745600127; x=1746204927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2AsKVQ5GJOuiLwxDelWM0lJ+dx6Hx5f6lCwnvVtcemM=;
        b=Hj8WG93b3qHcwDSLKuvld7cy6pyZxLIoSbjz+aIgu/+iRHN9m0/WPtrjnV+maQNrra
         z4CMGD2iNL9SEjV3mHO3mqJHPcQIK24uWFku5PaH3LZz2ECw5FKxOyxcI+E0Ml0h7BP3
         g2wkPdmYdeWbxKBXUYPo754pQWoGKRbv583KTQNSjDKU6ERoJ2ehEOeFyX032uyqoQ3v
         CaJCUfhteS6QHtBfKp0KLOpYB0K5GwNBRjg0BnnhseM4gwUh+1H4h+hdGcuHRrGxfH2L
         epG524E0oJvwfklVf4KdT+XBpdagtfDlypRzzF2MN2eKu0CadmuTpIowLqIVYIPjFiA1
         JZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745600127; x=1746204927;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2AsKVQ5GJOuiLwxDelWM0lJ+dx6Hx5f6lCwnvVtcemM=;
        b=C7mGCTFiuSSv+AxD/xIcYF3BhOBgopmXnLtiRoA640gLw+/WrAoAlLiFF5DE3YsfMt
         SML+QpiDcnCITzJUC2hL9hWNntdfcep6PaEqf/FB8Bf8gucc9k8GlvxtSVASsNzH/D/E
         u+3r8IGWndziRGIMjPFffVtK99EZ37gj4nv16iySCHOn7WSEwB9LcS0+xTfHr0Oworrq
         Z2p1cOiOatVv5EpomvPF0JG/VHrCNV75k5CsAFJJz6yL7uBAjh6zOmCCD9PdIjnP9k9E
         3K7LQ0rJ0zZBCdt2lk0aShFtZtGC0JQWCCR5bDBOGHKbLmnjIa3D+pqCgtdWzO0Tqkfi
         Ef+A==
X-Forwarded-Encrypted: i=1; AJvYcCUhotVQ+Ze57K3DSEsik8EIZXM79utKq18JY6i4NgPWwojP3mwBzwcwddmE7Ce0I6FiMWyXiHgzc1xcjk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB4NKRRzpJTxBsD0KnomMA2+p/ng8eoOMHqId/L/6X+gNEiYuu
	3aF/SNbu47YjiOmCVWI5VgpIN8YEzdt3YaGv4ideY/0m1Qcag2uXMWkCSyujiu8=
X-Gm-Gg: ASbGncuh6NfJqAWt3eZMSSUFxijHneCgdP5IptQofhCnpcNOkqqPnWUQph5LGtSEX50
	SmB29/hNpJkLOBY4dm7GGLlhWdBHlVy41ldKTN1IQaA8xcw07z36nSED1Q2tRlq8VL8vSzeBuVY
	nWd2ZtG18F5a68sqJRi3ZpoEVGB0nFORisC2/DMRmB6FdrL5lcMb9z8JmofBX80uFf7w33sd5uk
	9w1iBGS0aqLdyLRDUc/PGXBNN+9aqhPoFAEf9/SgGrxG/2U/zhigaZegNYuBbREz/qdof7Ci6/q
	ZpmJYKoU5L3pdTtFR+pYjS0dfRLwmMVRk5oCnS2WnRgB9ai72NpAmI8dXFR9ZHfg0FKvZHclaN2
	HFV/TjIlhXv0I
X-Google-Smtp-Source: AGHT+IGz68VTwwPVP1aa1JRNKA+aEBF5LbWPHc0ffGLvBRV20Rgekg0A3Ho2Riy2YIvZqaA+SUdHmw==
X-Received: by 2002:a05:6830:6616:b0:72b:9e6c:9be6 with SMTP id 46e09a7af769-7305c7bca29mr1990781a34.11.1745600127490;
        Fri, 25 Apr 2025 09:55:27 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:96a3:e28:3f6:dbac? ([2600:8803:e7e4:1d00:96a3:e28:3f6:dbac])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7304f2ac2besm742232a34.30.2025.04.25.09.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 09:55:27 -0700 (PDT)
Message-ID: <a06a5b07-8b99-495d-8e84-200923b277c7@baylibre.com>
Date: Fri, 25 Apr 2025 11:55:26 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: ad7173: fix compiling without gpiolib
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Guillaume Ranquet <granquet@baylibre.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20250422-iio-adc-ad7173-fix-compile-without-gpiolib-v1-1-295f2c990754@baylibre.com>
 <CAHp75VfHkKC81EinO+oN1b0=NRkwmNBLPky=HkrvPJCmt4njDQ@mail.gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <CAHp75VfHkKC81EinO+oN1b0=NRkwmNBLPky=HkrvPJCmt4njDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/22/25 4:03 PM, Andy Shevchenko wrote:
> On Tue, Apr 22, 2025 at 11:12 PM David Lechner <dlechner@baylibre.com> wrote:
>>
>> Fix compiling the ad7173 driver when CONFIG_GPIOLIB is not set by
>> selecting GPIOLIB to be always enabled and remove the #if.
> 
> I'm not sure we need to select GPIOLIB. If you want it, depend on it.
> GPIOLIB is not a hidden symbol, so why "select"?
> 
Since this parts of the driver unrelated to GPIO provider/consumer rely on this
being enabled to function, select seems more appropriate.
