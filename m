Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550C7262FC5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 21:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745356970; cv=none; b=LB8XQzn9Gs+rb0Nm+sKaVJTcloUgtOCxw2LLXKEVmfdS/7HRWRD3mdrwFSXXnTrMyLikrRczmuWDPlh+LfLugpUBZQ2CEZXirhc7RjBwyNlP0AKRP1cjUOw16vroscQMmt3rJHqm48NJUCiR1JueCYMa3A/q7sIyZtIogeGKsi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745356970; c=relaxed/simple;
	bh=W841TAzS9Pgf+kaExtU6OALsXMJdOqew/TQJAigKTzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ElNXnWwXXjBPKBQ6SK2FMetUUZXxAi2MP8otbEvCCVhO3RZhDMbPXEDU/p8gqfGhxpkUuo2Rx6fwPiV8RizSA4u99cOtbmNveVqitpQdJ0zCiQ810mklm6wXd/5HgTjUoZ85zyf+2E7ii8BmroOHh0max1f4OE/sOs7sqt2XPaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cgN0kn2/; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cgN0kn2/"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3fa6c54cc1aso3384192b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745356966; x=1745961766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y7TT6AktatuR9V4aotE2WsOxNczSAdd4gkXQfpRGYa4=;
        b=cgN0kn2/Y0SlXLbBNCrK2u/+sE9ntT3AzzTeHW3Jx3qtbofInUNhU2hwTIYOp4YKwO
         qdkeGiM8lTknRXoR3rHUzT5RYR9g23DiDLFg7tWEnAYq1r7Ilxyzi+guXa3LExyHQlq4
         UWqbUXbp93PyHmdj9s02fQCIaAKm9pZc83R/rTmfp4aMSsYS5743nwudjt754E5YSSsQ
         LdEbRvPZwToU4hjM2iN5cnu+uhlIk7ni0/tHjSzvsm0NADAsCAvlIvBNLdmCt7rdly9n
         Sf15jJFCBnitwe1RF0wA1IK/b5LBSmDEk6PEqEn8W7d0UoRmzW7dODPIEdxMo/PY0TQD
         3cFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745356966; x=1745961766;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y7TT6AktatuR9V4aotE2WsOxNczSAdd4gkXQfpRGYa4=;
        b=DBx9rhAP1d0XaFh6VHbZCCNNGWmP0mQ+5ooNXCJiAkwjuuI+5LkU+EoX3KqRyUd9ht
         B82NEOzzhKKXuAI6IuVxM+9z68iqMwF2zvMfP3J1LfTGPsBRM5CVcqBWRyBcFXJa2LRE
         gwHj1edgpiKIjIF6IVf1vBVYnka111Hu3BZBJP44LPI2FwU5WaHcLcSdRPZ6Dfz8bz81
         VzWXEJ10ubbgiEu/souOVjA4vfpU4zt/8O/gREVD9udWVxWRJkme6nAjEkYuP+yRr/h1
         N3sWkhEcNUaEUm8TM3ZbsXX3zW08jKSK449cXhwe4uX5zyPSo0l6l1YzZI3WQslxMKGW
         wpIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBr6lPoPsW/uzA0f/iKoSg0gsKUDB2tQCOCu+SjTSVP8CVdG7UuFfwX0WDr78ie4VurmZit/zFpjHru5s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1eDQ2SOlcYPfFAjIg4g8iiyfZrIC+pOlvirvrltnGLlHYEkUu
	BA0qG5nb9zFDPPTcjgVVQ9jHnX2jYsd2tEj/lWUHnf7aKV91GMAJJ5AS6PKiPjA=
X-Gm-Gg: ASbGnctj223tDTsJwXVsXovEGo077bGp7Rx3JkVVGgrLlkfh+SQbdrqZNv8V031fH80
	uM1w1iZTngaQ8g3N0WQcdvC9hDZqSD2Ch86jFQseKvEyN0Q4sGj8Hkri5VGd0iBDvqgKIHAxpxX
	pqlLLFsrHQXEbrHoPRECy0UGbO5VGgkm7K8KPsTdlSYFpCnTMdLMxqt3bzPDlytXNAmWDNNbobO
	XTejsDZYcjNOrW4FjMK5vGr2H8aYNWeYgFiDdGX9Aajffej3JXO8r6zBFDsDunKdF1M0sQmfEcE
	XNDYoSqA8h7YHCPimJcxfkvBy+ItxvFiR40shezBtgH2NBeueO6aUWB4obl6K0Hg4MYcP4xDQDl
	7ZNRXPKcWK47YGLYyx57vasyGYzcl
X-Google-Smtp-Source: AGHT+IHhf/Du65w2gsf8LB0BSIGka1F4nn2MvgiOYXQWe8VfxLVecdKEmWU3SxNZhCRA5bkBDDkDrg==
X-Received: by 2002:a05:6808:8214:b0:3fa:8bfd:773f with SMTP id 5614622812f47-401c0a5bf36mr9644378b6e.2.1745356966369;
        Tue, 22 Apr 2025 14:22:46 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3? ([2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401beeaf8f2sm2265760b6e.10.2025.04.22.14.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 14:22:46 -0700 (PDT)
Message-ID: <12dac98d-3e6b-4c2b-8ac0-d526bdb5efd4@baylibre.com>
Date: Tue, 22 Apr 2025 16:22:45 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: pressure: bmp280: drop sensor_data array
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250422-iio-pressure-bmp280-rework-push-to-buffers-v1-1-ee722f29aeca@baylibre.com>
 <CAHp75Ve_C6BXo75xy4+xZ5b1O9-TT5TGGQDgTR_F1s3TFK3p6Q@mail.gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <CAHp75Ve_C6BXo75xy4+xZ5b1O9-TT5TGGQDgTR_F1s3TFK3p6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/22/25 3:57 PM, Andy Shevchenko wrote:
> On Tue, Apr 22, 2025 at 10:28 PM David Lechner <dlechner@baylibre.com> wrote:
>>
>> Drop the sensor_data array from struct bmp280_data and replace it using
>> local structs in each interrupt handler.
>>
>> The sensor_data array in struct bmp280_data is not used to share data
>> between functions and isn't used for DMA, so there isn't really a need
>> to have it in the struct. Instead, we can use the struct pattern for
>> scan data in each interrupt handler. This has the advantage of allowing
>> us to see the actual layout of each scan buffer for each different type
>> of supported sensor. It also avoid juggling values between local
> 
> of the supported

I think what I wrote is correct grammar. Same as if I would have written
"each type of sensor". I would not write "each type of the sensor".

> 
>> variables and the array which makes the code a bit simpler by avoiding
>> some extra assignments.
>>
>> We can also drop the BME280_NUM_MAX_CHANNELS macro as it is no longer
>> used.
> 
> I like this change so much, thanks!
> But one comment below.
> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> 
> ...
> 
>>         /* Pressure calculations */
>> -       memcpy(&data->sensor_data[offset], &data->buf[3], 3);
>> -
>> -       offset += sizeof(s32);
>> +       memcpy(&buffer.comp_press, &data->buf[3], 3);
>>
>>         /* Temperature calculations */
>> -       memcpy(&data->sensor_data[offset], &data->buf[0], 3);
>> +       memcpy(&buffer.comp_temp, &data->buf[0], 3);
> 
> Shouldn't these memcpy():s be get_unaligned_be24()/get_unaligned_le24()?
> 

The scan_type.endianness is already defined as IIO_LE, so we must preserve the
the little-endian order, even on big-endian systems.

