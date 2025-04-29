Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230F023E340
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745944345; cv=none; b=CR8EsjFgJTy3F1vOJi8+Hdd1LY1byGNZSv/fSc1tFx3h8Ad5ZQf5bPQysy+QrS5qxb7/0XkX3mSiI8EtxtOnnzY3Gp8a6HEXOD0LxYpMK1RGV522POwUSCNH3wDUfH2ELn44gaowkQDDN5JJHy40ceyCnFjg7ac/aNld2dBVJsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745944345; c=relaxed/simple;
	bh=kxJijwJOOpyMIXcfCls3QqWyToNqydz2DXvZT0qcO1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E6Tv1TlCTgD/iRoWuaYkKgdhAes5pI4EvNQVew5owkq7fI5it5TNs3SRaCvuSQ6gKNxv9lePr/6u8i0yYFY41yeiSc29+d+ca2VEe1nvB635dpYTidbdBVvZQYFUrIfuINdUNoq62T3VfQVcfr+T6MqM5bMsxc4YK8mwbAbTQnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ELlwHHls; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ELlwHHls"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-401c43671ecso15965b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745944342; x=1746549142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VlzV3aC3Ajcd4WwT0NS/l9ibLgDyq3ihO7Tsirhk0II=;
        b=ELlwHHlsrW4x6siALslx2SQSxA7l8//pnnn/r1cacg4Kp8Q0AQNXaXrbSf3ZBBtZ/3
         3L4dHQ5n40xTkPUBXHg1/eBR9k9ZvcPm6rkqk8xY/utc/aUw/JA/7wEQ3k0QgT5MGeTI
         6V2d9iZNAnfZLOWkumB35RahyHKZHYWfuws+Ml/rsrrtVSduWe4YjUn2kiCo4GnqEIEu
         QzbtP8TJkDFUa7cU1kCZevOyOFBB++REcnfhAaTVIjn/FoVVuYflKgBCUMY1hDrkH9Ek
         V+zpPoBAr43pC9qnJa9xkuXyJja30QtwgDo6c27ACc4ToMl5dGZv69nFXgdE5FH7zC1R
         AAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745944342; x=1746549142;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VlzV3aC3Ajcd4WwT0NS/l9ibLgDyq3ihO7Tsirhk0II=;
        b=v4Gc9CgL58fyFKdmRA5PrvVQ0inG5NUsnjFQyzzrr8n4tlJZ5y/G0royRFrYBZMROy
         /4YUfdm4EmKMiA1y5HI/lYTZpb+Fqp7jS5Aw2/DqDHvwNkQAFk2s/8UPQ/UG2TH5txMB
         PLXNSj817VpKfax1yIkXlOaRqn9Kkol7oj8Z44DESc5Tm9yA8Iq9rPKVBTWPAL336Vdz
         CQu9hjHoEq9sKliMPH6GZqvcrmvV3tbx14OVEq7pXfHwI5WfqyfPpxLXYb3DnMq2Ohxy
         cyortjpVV5IqBo4ahJHA8ecH+quDO+kgQ0fqG9k7mQFD9RMLLAjvM4U6O0CxlOUTETxr
         VBMw==
X-Forwarded-Encrypted: i=1; AJvYcCVwr0ZvkrZMt8WXS1Vl/rSRIhyyr7zdNEZ3xndotD2OIHh6Uq76yMH04NutyVaxAJNHtYX4HCDu5iwchmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaJHJv18Y/PPfBnXuVSoRCUFA+P489+WJCahQKd7PPf9Y8nfrL
	koPW2T7AQVMRRKawaG9DQPKew5Eh+dx9Be7D817s8l4/13MPCQ80TyRb4Ry5kDo=
X-Gm-Gg: ASbGncvMS0WpOV1obfngYd3MpLdPkXb81xQfR6IMjrdU/GvutaWGfO4OqczuW9Qtz//
	6Um6qJdaC5G6Zde9XRYqrMhI479jB3ZkwGnv8M9z127ad4mOUwHQZGpxgFRFRRv8+ExXv69cnoJ
	dkZjosdLiPERNOtH27q0K/QpjFJQD7fE/QvahUA/giSiVxBQvVk01Wnw33H8q9v6mujzye2BItr
	a4ScVyo+z37vKcCJsqoVNRDW7LwLOdRsXSNGduYhziQZDrDU+1IhjBwBdSN8faXUMvZTn8wBv10
	6x/JFwjymgxSebvlWGtMIqj3EmFMJEsXgN8XuhggQa6vXn59BUg5aWa6iBdUde0JdVurhpt+sis
	KPviU6ySV2aktY775Og==
X-Google-Smtp-Source: AGHT+IECXLQfMw4IHoT8sY1k3B5PGYoLM8POTBaiM9WXU5IhYjgdUCA4tjARzeoztfzPvG3hb3MlHw==
X-Received: by 2002:a05:6808:22a9:b0:3f4:11b3:206b with SMTP id 5614622812f47-4021103ccb9mr2215175b6e.17.1745944342109;
        Tue, 29 Apr 2025 09:32:22 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:dc17:157d:e8b2:3ad6? ([2600:8803:e7e4:1d00:dc17:157d:e8b2:3ad6])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40212c4dbe6sm315201b6e.49.2025.04.29.09.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 09:32:20 -0700 (PDT)
Message-ID: <ad489cc7-8c89-44fa-bcec-5c4b9cbcab74@baylibre.com>
Date: Tue, 29 Apr 2025 11:32:19 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] iio: adc: add support for Nuvoton NCT7201
To: Eason Yang <j2anfernee@gmail.com>, jic23@kernel.org, lars@metafoo.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nuno.sa@analog.com, javier.carrasco.cruz@gmail.com, tgamblin@baylibre.com,
 olivier.moysan@foss.st.com, alisadariana@gmail.com, gstols@baylibre.com,
 antoniu.miclaus@analog.com, eblanc@baylibre.com,
 andriy.shevchenko@linux.intel.com, matteomartelli3@gmail.com,
 marcelo.schmitt@analog.com, chanh@os.amperecomputing.com, KWLIU@nuvoton.com,
 yhyang2@nuvoton.com
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250429025505.3278016-1-j2anfernee@gmail.com>
 <20250429025505.3278016-3-j2anfernee@gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250429025505.3278016-3-j2anfernee@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/28/25 9:55 PM, Eason Yang wrote:
> Add Nuvoton NCT7201/NCT7202 system voltage monitor 12-bit ADC driver
> 

...

> +static int nct7201_init_chip(struct nct7201_chip_info *chip)
> +{
> +	struct device *dev = regmap_get_device(chip->regmap);
> +	__le16 data = cpu_to_le16(GENMASK(chip->num_vin_channels - 1, 0));
> +	unsigned int value;
> +	int err;
> +
> +	err = regmap_write(chip->regmap, NCT7201_REG_CONFIGURATION,
> +			   NCT7201_BIT_CONFIGURATION_RESET);
> +	if (err)
> +		return dev_err_probe(dev, err, "Failed to reset chip\n");
> +
> +	/*
> +	 * After about 25 msecs, the device should be ready and then the power-up
> +	 * bit will be set to 1. If not, wait for it.
> +	 */
> +	fsleep(25 * USEC_PER_MSEC);
> +
> +	err = regmap_read(chip->regmap, NCT7201_REG_BUSY_STATUS, &value);
> +	if (err)
> +		return dev_err_probe(dev, err, "Failed to read busy status\n");
> +	if (!(value & NCT7201_BIT_PWR_UP))
> +		return dev_err_probe(dev, -EIO, "Failed to power up after reset\n");
> +
> +	/* Enable Channel */
> +	if (chip->num_vin_channels <= 8)
> +		err = regmap_write(chip->regmap, NCT7201_REG_CHANNEL_ENABLE,
> +				   GENMASK(chip->num_vin_channels - 1, 0));
> +	else
> +		err = regmap_bulk_write(chip->regmap, NCT7201_REG_CHANNEL_ENABLE,
> +					&data, sizeof(data));

Why does this use little-endian format for data but the later bulk_read of the
same register uses CPU-endian?

> +	if (err)
> +		return dev_err_probe(dev, err, "Failed to enable channel\n");
> +
> +	err = regmap_bulk_read(chip->regmap, NCT7201_REG_CHANNEL_ENABLE,
> +			       &chip->vin_mask, sizeof(chip->vin_mask));
> +	if (err)
> +		return dev_err_probe(dev, err,
> +				     "Failed to read channel enable register\n");
> +
> +	/* Start monitoring if needed */
> +	err = regmap_set_bits(chip->regmap, NCT7201_REG_CONFIGURATION,
> +			      NCT7201_BIT_CONFIGURATION_START);
> +	if (err)
> +		return dev_err_probe(dev, err, "Failed to start monitoring\n");
> +
> +	return 0;
> +}
> +
