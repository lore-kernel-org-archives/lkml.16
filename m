Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D0F198845
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746695874; cv=none; b=r1p/hvSWq4Ox9oB6iWpJ4mwA5GaDTYAXRH2PeqMtHEGeo2oq01L9ciy+5LicAFrXHlfKAJ+h7oLJl9ZGZH2jFSevJgA5sodd5I4rOns8JVJycuxtIK/Be1wgjFwxH763473w7LQngCb3S82H3IEnmQWlOD/WKSz/aWARyMyhCD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746695874; c=relaxed/simple;
	bh=qi4zSwwVRiM8Caxw8MdBx4iB4nMBbxZ1ban3FdIwPwM=;
	h=Message-ID:Date:MIME-Version:Subject:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q9ipfkakmoLCgh/hGY8etY/4EOTMy32DPSTYYMSEaQOdz1xrWSRCJXbe50Buj7l6oB+4oOSGwx/WeEXTl5qmNWO9HKWnkyyv2h6Pd9A/v2m17qvzQ3ZzJrjdvdKrb+rt6Ym6MN7AOIY0km/F95S5sVdm4CEXm1rL4DiEPxM1zgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4c6k6p7; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4c6k6p7"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so90833866b.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 02:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746695871; x=1747300671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a+56cHF6gbjg9b7rLaSj6XUGJ/00Kv0YUnU/8If/1zA=;
        b=Q4c6k6p7qcBEIbEiiTE97Cj4wBVlbnX6SVYGGD43YKfg0ZSHq7vyhLJNwbKKRPiJpI
         mU5CHuRE5DSc4A5YenU20jGRjkdojhOJThALR3XhWj9DDr2pGfGFzrz4j4LPd7PwjXAW
         MI9BS5ucy/1+M8PDhs5VKhcwfk3Mk8zA3yw+J6Pv/1s6bfaCPIjPOmzXVLt+t4WS/k5g
         xEEUtUZ/FJuXcKfcZHoG551iZmFQSvOpZnbg75JKtx5/pROSCXWGpa2glvcHt7D/Mgae
         byDSwn3m42qByprv35DfffOIesnaC0wmaB7OfUIm8fhQoasmdEVJIyi5hPEvZdt5QNfA
         jV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746695871; x=1747300671;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+56cHF6gbjg9b7rLaSj6XUGJ/00Kv0YUnU/8If/1zA=;
        b=qnGczXl7NO4D2ueXm2q1BgaeOAsyG2DcO0dn3QS4VU6rHBz/vevkgqwCIrwpJW/Ecw
         GgiSmcJsVakpiLGG8ph33vZeWktw4eOAqc+Eu62/3Qtf8+F4iNVK5fgtDTSPTzlqYDfu
         jsMd3U5G9zaZn9p9VN1iI39HCq5haG5G0xlqewbq2zV0SqidAS8CKmt8cE9xH8PII+x6
         9yjbSMUOpU1WKxOKBAK2W4sVZSegkX8uIzUJKZoQAFrAUDTk/vLgkeFaV7oF6t3kpTI2
         OIZfjU0aI0GxyWiONoGsHmdBuLFP3jsZ1AeXvXqKdKHHrAFARfnyuEFLx7sztYe64pkO
         pU+g==
X-Forwarded-Encrypted: i=1; AJvYcCUjyh6VZsP0x9eJP7535oxa3GAThzIDEjzHy3c1oo9V/WQ9KWmnCKuvtwPjWdZiEeE/LuqyBV1kDleTQQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVscjvg4cLVbfp4wNnH/WhzTpk1b8QmIoWJhgNdoD+nw83acdE
	Hk8ZPy0GSp18LkFJXcKlioWfUBVSwxu85QdxyGhQiDq30E1ZCu+f
X-Gm-Gg: ASbGncu+z6GMKcOj2evyKt218KQlReExjDpcvPN/HG/3SgOTPko72FhGV6YFY4olkNN
	4NEhmJU0JUOr8BfQgO+2PXwZjr+1tuXQdVsbuQUfleCZyy5acneyTir5nLzpnYWfiSLpH/ZJ2pE
	JePEZb1fNfbKdCT9k37IhgU614eP5cLHES9vRzwTuorMeBcSH6gWGhkmrHLxjszOoYhjByy4dTM
	NCsug0VmKVPk1f5bYZfOJ/FZevRZviIo0zLGdU1ex5c39DPisbdHtT57OFifMgzyqo7cHYbVZID
	+uHxZI9efuXk0sh6qBzfkISWVo7q3QNoFfozjsNGy4+vAw==
X-Google-Smtp-Source: AGHT+IFmWAd+eviv3h7VjmVWci5W0QdaBhX2GqrRe/6fK4YypAuf2ZAxrYbHdShCeyAUrGLjo+ku8g==
X-Received: by 2002:a17:907:7e86:b0:ac3:bd68:24eb with SMTP id a640c23a62f3a-ad1fe67c5cemr209151966b.1.1746695870412;
        Thu, 08 May 2025 02:17:50 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a733csm1048068266b.73.2025.05.08.02.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 02:17:49 -0700 (PDT)
Message-ID: <e901a2f3-55fc-497a-9bcd-10d75b26990d@gmail.com>
Date: Thu, 8 May 2025 12:17:47 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator: max20086: fix invalid memory access
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Watson Chow <watson.chow@avnet.com>, linux-kernel@vger.kernel.org
References: <20250508064947.2567255-1-demonsingur@gmail.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <20250508064947.2567255-1-demonsingur@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/8/25 9:49 AM, Cosmin Tanislav wrote:
> max20086_parse_regulators_dt() calls of_regulator_match() using an
> array of struct of_regulator_match allocated on the stack for the
> matches argument.
> 
> of_regulator_match() calls devm_of_regulator_put_matches(), which calls
> devres_alloc() to allocate a struct devm_of_regulator_matches which will
> be de-allocated using devm_of_regulator_put_matches().
> 
> struct devm_of_regulator_matches is populated with the stack allocated
> matches array.
> 
> If the device fails to probe, devm_of_regulator_put_matches() will be
> called and will try to call of_node_put() on that stack pointer,
> generating the following dmesg entries:
> 
> max20086 6-0028: Failed to read DEVICE_ID reg: -121
> kobject: '\xc0$\xa5\x03' (000000002cebcb7a): is not initialized, yet
> kobject_put() is being called.
> 
> Followed by a stack trace matching the call flow described above.
> 
> Switch to allocating the matches array using devm_kcalloc() to
> avoid accessing the stack pointer long after it's out of scope.
> 
> This also has the advantage of allowing multiple max20086 to probe
> without overriding the data stored inside the global of_regulator_match.
> 

I've made an error, the above paragraph is not relevant here, although
it is relevant for other usages of of_regulator_match() where the struct
of_regulator_match is a global array, which causes the data stored in it
to be overridden if another device using the same driver probes again,
which could cause of_node_put() to be called twice on the same of_node.

I'm sure that's not a common issue since it hasn't been fixed yet.

> Fixes: bfff546aae50 ("regulator: Add MAX20086-MAX20089 driver")
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>   drivers/regulator/max20086-regulator.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/max20086-regulator.c b/drivers/regulator/max20086-regulator.c
> index 59eb23d467ec..198d45f8e884 100644
> --- a/drivers/regulator/max20086-regulator.c
> +++ b/drivers/regulator/max20086-regulator.c
> @@ -132,7 +132,7 @@ static int max20086_regulators_register(struct max20086 *chip)
>   
>   static int max20086_parse_regulators_dt(struct max20086 *chip, bool *boot_on)
>   {
> -	struct of_regulator_match matches[MAX20086_MAX_REGULATORS] = { };
> +	struct of_regulator_match *matches;
>   	struct device_node *node;
>   	unsigned int i;
>   	int ret;
> @@ -143,6 +143,11 @@ static int max20086_parse_regulators_dt(struct max20086 *chip, bool *boot_on)
>   		return -ENODEV;
>   	}
>   
> +	matches = devm_kcalloc(chip->dev, chip->info->num_outputs,
> +			       sizeof(*matches), GFP_KERNEL);
> +	if (!matches)
> +		return -ENOMEM;
> +
>   	for (i = 0; i < chip->info->num_outputs; ++i)
>   		matches[i].name = max20086_output_names[i];
>   

