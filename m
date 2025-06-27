Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6141625EF81
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 23:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751067387; cv=none; b=fB6yXE3zh0YQLzQXIk3O8fhcN/W4jJeLQfA3m2dEtHkzPAm8HgDf5bze3k+UsA6bI1R6CsediRTeTWYVS3jgyUJ1JPgyPuI7gs/lOTwHVU8jCQCiHDlPNlDc4THejVPTMQmh3wcWxYnlXcoY9Zk9wowkpM3lEyeDQF/lRT8hQ9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751067387; c=relaxed/simple;
	bh=ecxNgGLJ0ceg2mw32I8PwtVd+Bs6zCvgfvPYi442IWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QrOpuiqg+fFCUrAjdRZymF88/ewRCOuoRqRfQkZ8SwMUbOEMn6yQ0JdzkUe/CwgjABzsU79titcKnW5IVtHkCuVpRqA5eI458u+OWxJDJheCfOqRmBDusf3nSypolCj/6wrbo2878i5kHzKMeiXjgIeoudPrhpA9VgLomd4xzbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hYANnAIu; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hYANnAIu"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6115f7ebf2fso1268044eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751067384; x=1751672184; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KS5+5awS+3+wXbArsBYmZlO0Z0GYxJERA5jSGiTS01k=;
        b=hYANnAIu/ShF1cngobKyZ3e/Ql0pBBO2g6du8ulNviUq/sgS+uDkdRDYNiYj8IqZes
         mkvOtUXrfVKtd1o+PqTHdkAKy2HNz0JHWqezB7qmDiwFCK7Sg6ypcirW1DJVUz3envoM
         jLcIgqcPrIih6rbSmkQg/5jWGus1J6Ak2f2s3mC6YS5trLBhrccSCB9z2k/YKmut3kia
         Hr/oTsEXBS2Gouz2/g+yGlafrE/hAgRhNDqMeJiUPVxTieYb1j/7XLnMiA0lpmpSnflB
         5UUuijkv1Zr8GMVKw8WecsdvkrGtIh0LbioLkJnlgupqPPt/2+xf+gG8bSGzvoju93en
         ax+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751067384; x=1751672184;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KS5+5awS+3+wXbArsBYmZlO0Z0GYxJERA5jSGiTS01k=;
        b=JXJ9S7cb/hFYu1CF0YI7WIpzcg90cQNaGwDSTvcZdjYCmaR5XkWmVRg+gb8JN+jWDG
         fEb+w3RVbDjcDbFikL066Gpqbz3Z6CEpqaA6feenEbGFrxpTZN0Nk7VtykjElS/kAmw1
         h/FwB8Phlu6/GpHQid9oNHKdZfcHWNEAceUB5mdVEGDCl2P70Q6dwiUMdMcfyk9qjAev
         HgJnjZXWvRzURYXN0+ieK3x4H/gEB8kt5FcHxm7zRHtUx/DyOoytV383IyBKn1N/KFe4
         KWqBV/B5SzXcWsnXAlyhF0Otz3K7+2Ask8hnRG7z4dNFrTKoUSISU4qrTe10DtuTT2vN
         L6CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxjbNLsVRm4rZvXKCaZIKro/Le7Wtwk72w4WWlpTMJJNV8Mcbg7vffOMMfC0E6Rm+P8R49QjA7n0Do3jY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLd2eAHNDi+x45yTkq4lnHmu4o0HvHiJjpd/hOoCfUpaKFkWE4
	aQyb7m2/xNcMf9KoTNNrhf4aTqYmEqHK7SMdHZVp9GYCvMpVEnLeCYwcl8W16nEvYPM=
X-Gm-Gg: ASbGncsmA5g/OYA/9sSo0gvczpkxpFby8AwpWBmAXIeO6fytbceLmBhc29VxxCEWZN/
	0taXEnQ4x7aAUqUzGtat3r4XJVqkK801ilxhYV/UZj1B3RfU7nlsToi8O2pJru+eppSCPEZ1VoW
	qVIThkQJ6PlHL0T7BclRGXgqJDk1EjRtGgYCXDabDz5MN+qB3lUi0UQhddxxYaxH9l/mJohs/kK
	JCKNRMt2Kid47+WIi4Qb/7Kt+3gXNXofGR+AOvSySUwSFRrf20kD5DlTWtxQirGL3hoEiAlsSlE
	HzrKH12oC5viAsYrXpXrbues+Kn1avkmqpjm6JYT9c9dVPMymkKeIMdfEGRIf4BERNL0e/h5jEb
	FWdY6c61RgVf+yG1bnFkUi6VQ8SiMRkpyhdqr
X-Google-Smtp-Source: AGHT+IEssFT0wZJYugWiw6Jgk1s5LByepHYNeiyjZJg6Qq+SSxEoPL/QLwyMcPPeh+MamQqKsKqBzg==
X-Received: by 2002:a05:6870:7905:b0:2ea:841f:773c with SMTP id 586e51a60fabf-2efed759ab7mr3742580fac.35.1751067384200;
        Fri, 27 Jun 2025 16:36:24 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:1715:453e:e133:7d6? ([2600:8803:e7e4:1d00:1715:453e:e133:7d6])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4ef29absm1128704fac.14.2025.06.27.16.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 16:36:23 -0700 (PDT)
Message-ID: <c1ea7287-a1a8-4d77-97fd-f341d2412005@baylibre.com>
Date: Fri, 27 Jun 2025 18:36:21 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] iio: adc: ad_sigma_delta: use BITS_TO_BYTES() macro
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org
References: <20250620-iio-adc-ad7173-add-spi-offload-support-v1-0-0766f6297430@baylibre.com>
 <20250620-iio-adc-ad7173-add-spi-offload-support-v1-3-0766f6297430@baylibre.com>
 <aFj6Dv1kKFe9ijvr@smile.fi.intel.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <aFj6Dv1kKFe9ijvr@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/23/25 1:54 AM, Andy Shevchenko wrote:
> On Fri, Jun 20, 2025 at 05:20:09PM -0500, David Lechner wrote:
>> Use the BITS_TO_BYTES() macro instead of dividing by 8 to convert bits
>> to bytes.
>>
>> This makes it more obvious what unit conversion is taking place.
>>
>> In once instance, we also avoid the temporary assignment to a variable
>> as it was confusing that reg_size was being used with two different
>> units (bits and bytes).
> 
> ...
> 
>> -	size = DIV_ROUND_UP(reset_length, 8);
>> +	size = BITS_TO_BYTES(reset_length);
>>  	buf = kcalloc(size, sizeof(*buf), GFP_KERNEL);
>>  	if (!buf)
>>  		return -ENOMEM;
> 
> Hmm... On the rough glance this sounds like some kind of bitmap
> and hence bitmap_zalloc() (and other bitmap APIs), but I am not
> sure.
> 

I looked at it, but I don't think it is worth changing. It is
really counting clock cycles, not bits.
