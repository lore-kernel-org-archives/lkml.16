Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACE117C91
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749827021; cv=none; b=VW86hptcYSX+HGtTGbh9UoLUSNxd314m1RvLo6yhMsi9MIvJ3KwkwQv/5A5/jAJw03eoPeybkU160Lxt9lAOzgkGncoWCTPDMegKx7r2xULrrCWlJVbmk9UzExTsNAfL5Puutd8fBj1L5X9puY4qPPTn7+7IWJnJGMD8mTFg1d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749827021; c=relaxed/simple;
	bh=pfi0cAVHQN4FKBTbdkOEyZL1+dTywvqOTwhrmU5xJ6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/mQk4e6do9r4XlMjjL2z37W2MrebYCW1Jv3XIAcmHQqfppUQH0S4rVzMCSi9oc4LWOhvvkF+Q3+zID4vjkRR4Za+z+Sfb9iC9JFFXxAAWuF2rbX2Hd5shEWQunEnX50QK0WpyDDGSnodRMf78OD69Gk7DFc074VH6UYq2qheIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2TDEHV0s; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2TDEHV0s"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-736f9e352cbso1333544a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749827018; x=1750431818; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5PIfoLs86QX7qYXR8hEvBNfkC/r2PihnWpdbTtofWd8=;
        b=2TDEHV0sMJ2lhYeM7RXYUtWcJ2v8+K7zyDOrD6mDTz4VNqBQ39u82GFu0vROxh2U7Q
         ZWF3oMQMmVC6qqyzMC+402DWipKUtzP7f47O5Fk3SB8RQk6qvERH3xQxDEy044LW7mDy
         WwDCvKC8elQWqr26G6uMAZg53g54sekgMNPYIdN+vRKg/qcXZJPgGtaYCUCoGBIlyOcx
         HFjEnapPC6A4nRFviCS5C3fuwHiR5/J7FD1Lx7O9WlXGaOJ+j0s5MrBU+5uKAMQOWar0
         aE+jKNM7n0E5iZSRw/KwQEntkZ4c0hN9zYTvRxjFfoumiFPwh94RmTBBfcZXkj60VGrF
         TvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749827018; x=1750431818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5PIfoLs86QX7qYXR8hEvBNfkC/r2PihnWpdbTtofWd8=;
        b=Yzl/O2I/V8E4lhXoBGBh2vloJKYJD3j+aZiP50u8ZRxHmdnLOhMu76I/9wrhqGhBL3
         xWwjGypksAIb0KEkAcfyP81rtkG0xnEngK5AUYXkxKQILMRP8LBi5nWbHsXBeKxc/kV+
         ibi9ZKajpGZ+EF6BQpt2Dg54rKi7pZGYZ+W7BysIrwpcbCiMIAhcEwCD9wPxY06AR9He
         sbiWQZNS7ZjbK6jzRK9uUpK8Mu+tZCcs4cF3+kuCeZtNFbU1agIKlX01k+sXs5D9JceN
         dZLXknSsDf5NmID531Nnl/EUPXFC3gc2R17Otdo6IN152pvoEeZ1GcsVy3x7gAgElv8h
         5MvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+JyeWioOiappmRZuwUcT4uOt2IAwIhgqbVMTQsfTFGBh41l00ju7ZWPH5pdJ5MDoBEPZVBnPatHHDcgU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOjxkr93pTJHjhCX4GADYruhCMZwdrNAxqQ8b4TyVd1HemcwH2
	t4gk3c/dGOJkClopZeJ4/igQkupYvGfx3UaaGH0TzOf3IrBXyqwaEY8FcrU8M0RZHPc=
X-Gm-Gg: ASbGnctqmTbKLHfoMRt3HSfLqji59ptheWRqywACNsymhba6148CyEiI0g3rfEN/dEf
	5ml14RgU4z7z1zYhxTFkKMKQKh5v1PkWeaIqd8J7URbc4Ywo9JqcGgyJk+E29bnUYqBlJLLJyQP
	sZ7BKBm3bvQ7kmZDWysHLuvV99mls1e7wdTlzhMwuorCKxLHvY5rBfgvRqMW5YVoeuTcknXLkqv
	RWpcVM1zWqCeKOl7+vv3G2nK6O8SPwG40f0vbEh7+TQQnfK8F+aPUXziNlVKZbxHI/V3rtDmHiM
	PGVW2ZtHmW4FPOgR2sh8FfC2CUFwCxDF//TXxjfRFPyRlYyrgqBm0ucdNYbxMGH9J1HrBB+gaLC
	6IJCMAYDNRciPAE7o+NA7ZnkxDj2qHDBIXLykjvj0lgNm64U=
X-Google-Smtp-Source: AGHT+IEAL0ZDPMzjcA/VBiibBkDYEcstjdnXKAWJLVzjTIQf+FnUi+iN07J5DUfE0uU08QRa3dplKA==
X-Received: by 2002:a05:6830:258b:b0:72b:81df:caf9 with SMTP id 46e09a7af769-73a362cf271mr42624a34.8.1749827018337;
        Fri, 13 Jun 2025 08:03:38 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4647:c57:a73c:39d8? ([2600:8803:e7e4:1d00:4647:c57:a73c:39d8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a283dc101sm230838a34.4.2025.06.13.08.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 08:03:36 -0700 (PDT)
Message-ID: <8f7656ed-0a28-4ba0-accc-b19817bbb38b@baylibre.com>
Date: Fri, 13 Jun 2025 10:03:34 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: accel: bmc150: Do not configure IRQ registers if no
 IRQ connected
To: Marek Vasut <marek.vasut+bmc150@mailbox.org>, linux-iio@vger.kernel.org
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Julien Stephan <jstephan@baylibre.com>, Peter Zijlstra
 <peterz@infradead.org>, Salvatore Bonaccorso <carnil@debian.org>,
 linux-kernel@vger.kernel.org
References: <20250613124648.14141-1-marek.vasut+bmc150@mailbox.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250613124648.14141-1-marek.vasut+bmc150@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/13/25 7:45 AM, Marek Vasut wrote:
> The BMC150 on Onemix 2S does not have IRQ line described in ACPI tables,
> which leads to bmc150_accel_core_probe() being called with irq=0, which
> leads to bmc150_accel_interrupts_setup() never being called, which leads
> to struct bmc150_accel_data *data ->interrupts[i].info being left unset
> to NULL. Later, userspace can indirectly trigger bmc150_accel_set_interrupt()
> which depends on struct bmc150_accel_data *data ->interrupts[i].info being
> non-NULL, and which triggers NULL pointer dereference. This is triggered
> e.g. from iio-sensor-proxy.

Is the interrupt not wired up or is it just missing from the table?

> 
> Fix this by skipping the IRQ register configuration in case there is no
> IRQ connected in hardware, in a manner similar to what the driver did in
> the very first commit which added the driver.
> 

...

> diff --git a/drivers/iio/accel/bmc150-accel-core.c b/drivers/iio/accel/bmc150-accel-core.c
> index 744a034bb8b5..1c3583ade2b4 100644
> --- a/drivers/iio/accel/bmc150-accel-core.c
> +++ b/drivers/iio/accel/bmc150-accel-core.c
> @@ -550,6 +550,9 @@ static int bmc150_accel_set_interrupt(struct bmc150_accel_data *data, int i,
>  	if (ret < 0)
>  		return ret;
>  

A comment here explaining why this is needed and what the consequences
are would be helpful.

The obvious one to me is that we won't get events even when events are enabled.
It isn't so clear to me though what happens if the watermark interrupt isn't
enabled during buffered reads.

> +	if (!info)
> +		return 0;
> +
>  	/* map the interrupt to the appropriate pins */
>  	ret = regmap_update_bits(data->regmap, info->map_reg, info->map_bitmask,
>  				 (state ? info->map_bitmask : 0));

