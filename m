Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177CC1E5732
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 14:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738248892; cv=none; b=uJO8ccC3T2AV1YzD8SAouXm2qNVQ7P4QO+FYMM8ATN5zVBXYF/k2JBOmtXA81rw6UsP47K90SQil1e6O5c7xb2vjrZglglMJuYSEeYnKfHDxz9sdBwOLRUF+g4i4bxTxwXeRlvybFtWOeD38v9c2WB66VKmZa8vKM0+qA3qlu9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738248892; c=relaxed/simple;
	bh=TMQl5rfvRVr5SnoZcEJDLgdQ5XZJ/i3ctaiDEkjr4jI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dghIfGh0fd/mj1BAPhzecXYE4Fk99YDsocUVJ3OGDCh19nBBYhir2y84NrOY2EIcwYpNR+ZHWmVmiVj+FhzWhn+5k0oMvfMMx3DD1lCbODwgJLEAwWn7EW4AlS4dkaZohO8OwHkmfEr3dx6x3VzMPXS+MGv0zQcVii3accMl6K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=lLmMFzRr; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="lLmMFzRr"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85bad9e0214so398704241.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738248889; x=1738853689; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F1UHNnF/D0xuHW2VMmWfJ1WGt6Iflmdx5dnF7fMQdOg=;
        b=lLmMFzRr0zOLbCZJ2fcylLeJQDn2zxGnUyiJr2znfUM9cAjjc/pLZRnYAIfSFy0TjF
         enk+ZzFHqAyyQY8+XIZyU976tQPSuBETa6fgivbMAGsKG5Go5LMPr4MFujCA+OmMnIfN
         03wjvo7Eb721lMzaxZjs+LECyO+t6wHfluQJIwoTifaPDB2LhRJy71uAnOD/sHa2FW8W
         ZSnvnfD0JwNIC3SEIiDZ4eCNzo3bjXyEl1f9E46dW5XSgefkuykx8hQbSX6JCdlwmWE8
         GfZxZwh//NXBTt9US+RCnVICxUHFydV6iUg8kTyDBA/Ly21IoBNPKo+q9uZjsyPYjgXu
         Ti9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738248889; x=1738853689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F1UHNnF/D0xuHW2VMmWfJ1WGt6Iflmdx5dnF7fMQdOg=;
        b=WAFDC/K8Vz2TclqHNL32eM2A+olJit1J0pP7tt6II772IFciia5JEPl5XY/8Gksz7a
         Dgo6Xd0ZaFz+BnDVdz5rnuIR4xO2gXPeL6Oxb9e4ftSdg3Yps7xZ8uicOud9/QJkcraX
         82WroyTAb7R1/4tfAlCIgaN3hzXsWWC13MoZPkq+W6w+sM2C2VBuio36BKRwdZWRJ4MI
         EFr4u+ANk6ATsJcdCdEcwZId7izmQeE4ZSj6ZHAP1Pjz+y2+wT3gJWOytErWxe7SZFHM
         wcOYQrwmXFUod/pfSbD0uxIeNSgaUxodcTot+7pcHU+aNyt3pGvQwUIbfjBAnuvnN7iC
         Vebg==
X-Forwarded-Encrypted: i=1; AJvYcCVhM2YmAWXGIZOtT73r67KMTYzdFUCGUbY1vXMmvw1bBn3CHS0EsfQ7+S+Mh285o8zvt/AgHQy/AiiDHPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT/lqDhFyWF72h9Jjbd4133hl3x04wXk+JXhCC9hKUZf3FsTJm
	DAjJqEU9HvrCJIy5HoPrIHPQoWIhanWoFJDUKA6IZo7/2vKnV8YzlrAdNVU1JazANR5SuYyFPRg
	3
X-Gm-Gg: ASbGncs1UO4/vJXu8NmWNanFShE6N1vK6G7n2xSkKhqrU/hNXx4vHAh9WpQKLl5UHKk
	8F3IWxZ3JDgF6DC6Tr2oDbnbtkM59UNrYrRGFGSmgPPPSv9pIEzePT9fg71Q4AuM7/6q8WXpJSi
	2Uysz9lFTkcNfoDPXcFJO4WMrU1g+vkgtJa4ET6DgHcHnyFrI9AVGnFFqy40Nu1cvs/sniI7JaP
	Pcs4Zg0+3lbdjOxhkmLano+FrBfQCQ4DbwjD5ZZWV4DC0xDJfmx6ZSkLF1xlzuIKVDaV75OzR00
	FSxwk2rOof8=
X-Google-Smtp-Source: AGHT+IGkqgU29cscaX28kSOW5d/8/UHkajIQjAhHSd6Ez0oybhdmKVoz4YyFx87CK+uM3LcMnII5KA==
X-Received: by 2002:a05:6602:2b10:b0:84c:e8ce:b531 with SMTP id ca18e2360f4ac-85439fbb605mr820918539f.14.1738248877649;
        Thu, 30 Jan 2025 06:54:37 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746c0ed8sm365185173.108.2025.01.30.06.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 06:54:36 -0800 (PST)
Message-ID: <178c6f1b-cfda-46cb-8c15-a25a5319f6e4@kernel.dk>
Date: Thu, 30 Jan 2025 07:54:36 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] io_uring/io-wq: cache work->flags in variable
To: Pavel Begunkov <asml.silence@gmail.com>,
 Max Kellermann <max.kellermann@ionos.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250128133927.3989681-1-max.kellermann@ionos.com>
 <20250128133927.3989681-5-max.kellermann@ionos.com>
 <856ed55d-b07b-499c-b340-2efa70c73f7a@gmail.com>
 <CAKPOu+-Mfx9q79nin7tGi1Rr4qGGY=y-2OhuP80U=7EtRpfBdg@mail.gmail.com>
 <19750632-1f9d-4075-ac5c-f44fab3690a6@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <19750632-1f9d-4075-ac5c-f44fab3690a6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/29/25 4:41 PM, Pavel Begunkov wrote:
> On 1/29/25 19:11, Max Kellermann wrote:
>> On Wed, Jan 29, 2025 at 7:56?PM Pavel Begunkov <asml.silence@gmail.com> wrote:
>>> What architecture are you running? I don't get why the reads
>>> are expensive while it's relaxed and there shouldn't even be
>>> any contention. It doesn't even need to be atomics, we still
>>> should be able to convert int back to plain ints.
>>
>> I measured on an AMD Epyc 9654P.
>> As you see in my numbers, around 40% of the CPU time was wasted on
>> spinlock contention. Dozens of io-wq threads are trampling on each
>> other's feet all the time.
>> I don't think this is about memory accesses being exceptionally
>> expensive; it's just about wringing every cycle from the code section
>> that's under the heavy-contention spinlock.
> 
> Ok, then it's an architectural problem and needs more serious
> reengineering, e.g. of how work items are stored and grabbed, and it
> might even get some more use cases for io_uring. FWIW, I'm not saying
> smaller optimisations shouldn't have place especially when they're
> clean.

Totally agree - io-wq would need some improvements on the where to queue
and pull work to make it scale better, which may indeed be a good idea
to do and would open it up to more use cases that currently don't make
much sense.

That said, also agree that the minor optimizations still have a place,
it's not like they will stand in the way of general improvements as
well.

-- 
Jens Axboe
