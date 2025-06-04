Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3351828FAA1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 13:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749043318; cv=none; b=KdoIAmuy4DaUxauPW1sLIW+Issx3gBzUKB0SSVbnhh4r46aw+lvWR/6kG9tGRvNF/0hoLFLg3OqowWf0ssalasDalZbAczDVmkJ1CXigyl0/Giey+xcu3+p8JGFO1UPg+1ef7jZllJc4PJ/b688AwNpkZRzW9lwG9pra4fQU9Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749043318; c=relaxed/simple;
	bh=dbA7qnY0vkNuQHcmJgwJbq1/AuyJ0mzf0CTGLPRhOVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CbHynFKXTumm7ckp5EJ4sv0nqliNvLecQgp+Khfw5n4tNG0tRX+lRkcByAjoVLQ2GUGZPp4SE41nsTYaJxW2Fx4qKzJH5hs/GWobSThXcmWP4XuPdIzrr5enhCKofKkkYidpPuDXNsmoikg4VAp36mz1OdLBwZlQTbKsU0gsXwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1KcnaBqG; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1KcnaBqG"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2e9192a03d4so3369221fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 06:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749043315; x=1749648115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42EU1sJyYdG5F1cgKizvK41dUy6Q1Og1sjraWSNVWMs=;
        b=1KcnaBqGQcNTorNWLkXd9T95VZ8JkAq0oRO1gVhebAS9n0Q9yAPa7SbZeYaqYP62PP
         o1aXsVQaXv4WIZt+CWtm8sR/c/uFLUPhCOySGlaxyFZ0SBjN4jDQOtsNzA2Wy319qUqj
         yx6TVh6ugoMnQjekJMeXvHFyZ8gL3PDmOFSxbVBDjCEYLph7JYYXqLMQkUDT8IVT82LN
         +lYJetb7Lc/zj4G/H6eMtyNqVxFRcotm/WuAmgg6SA56XgHCyMkwgDTEJ143MT9FV3IG
         ss22J07ovcC9w66eTkNv0ne+K3MOgqvY/1asj/4jBkgX5T/UyyYsnGFqP62ctrWZ+p//
         kuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749043315; x=1749648115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=42EU1sJyYdG5F1cgKizvK41dUy6Q1Og1sjraWSNVWMs=;
        b=aL+Vt9TprK0skK0vgKTjYDwFiwzv9BhnaBMCynHhHX9eiSdyakes8ss7RP0bMiTSZE
         6K3PnNOoF7VlV0sRdJ8/uOqArrkfE4Q09UXMyz0ukPRll02BN0/+sZe/5zPpqA7r/alh
         CwRosYsex/S9HEDXnIEm6apm647fMcAZuHwNgZhYJp95o5oJw3ZY/b0CMVMWI/MFhZY7
         pwhi2zxnGLQbgJSK8WxSVE1Gqv5mKQ3Y7mckYaM67RCeaJfQjxlIRoze9B8Rsvl5EGny
         Zjlz+Or0XuuXdcC+gTW1kxS3XZgZ8s6y0xNTIUpYdDHhg9JOdILyvcYBhjuokh81KBHx
         d5aw==
X-Forwarded-Encrypted: i=1; AJvYcCU1lPJSPuDt7fsO2bqOptXFUPStUcrMoYZZMvzGtDRWER53ONI6ia7iYl9767y/15eXiQvFX/tC/7Rgbjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcXMyt6xDmHoxnawRr4rbzXKG0BEiINsxWofqVbLpluJTb9EN3
	rGI94dsHsxB48S3tky9j0ZOZJMLBA4yRl2GQIGgIsF3dKXbjMjMutQcdmP9bepZXx28=
X-Gm-Gg: ASbGncsL9r43w2l2DjFYqIQ4JdL2HwmR8dAFyBDhN2T/1qd0EHCD7ebaGgxgWqIEdOF
	V8jkh5AwLy78qRWC2CizviWZ+HjCFON2y3v4kBHYIy+d7waukhpkUqnZ9ahfYHFTF8G432FwEuo
	JVTwSxZetLQEOxWSlw3CmA0iLpB8bU4kVX/rJ7BsPh1K1yhthxAeI81FcVoEDJbZLDkHVR5gplH
	sbxSOd/A5IAS6/5t2sSTU6CG3bEGD1qxb+lRx9XQBBjPKwKAm+L22NbqqErgxvTX37tlOa6UviN
	M+xqEqi2VghowjdCJDaGbbpjhtD4Y26Y340tFBr2zfz6tnNBKGFTX8WoCaCjYfZR3b8u8PoPkAC
	d6NOgytTC4GX+7Nbw2+rjjbKf6kNqVKXCEwlEh7w=
X-Google-Smtp-Source: AGHT+IEeJlq8acVoI6eGj1GQFdyqUT4Gx77dcBUJqg3CfYkU0wTl237zJBQxk+ufigaGhCyRnVkMlA==
X-Received: by 2002:a05:6871:42c4:b0:2d4:d9d6:c8bf with SMTP id 586e51a60fabf-2e9bfc6c923mr1651646fac.32.1749043315015;
        Wed, 04 Jun 2025 06:21:55 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:56f4:67ce:c6e3:8f76? ([2600:8803:e7e4:1d00:56f4:67ce:c6e3:8f76])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e906816c51sm2622910fac.28.2025.06.04.06.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 06:21:53 -0700 (PDT)
Message-ID: <3ff77f5c-b13b-49f5-98b0-a799453768d0@baylibre.com>
Date: Wed, 4 Jun 2025 08:21:51 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] counter: microchip-tcb-capture: Add DMA support for
 TC_RAB register reads
To: Dharma.B@microchip.com, kamel.bouhara@bootlin.com, wbg@kernel.org,
 Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250528-mchp-tcb-dma-v1-0-083a41fb7b51@microchip.com>
 <20250528-mchp-tcb-dma-v1-2-083a41fb7b51@microchip.com>
 <b45ea46b-3e17-4cb9-8e69-9eea0a3f8241@baylibre.com>
 <27407669-a580-482c-8c60-226b56562ce6@microchip.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <27407669-a580-482c-8c60-226b56562ce6@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/4/25 1:15 AM, Dharma.B@microchip.com wrote:
> On 29/05/25 9:03 pm, David Lechner wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 5/28/25 1:13 AM, Dharma Balasubiramani wrote:
>>> Add optional DMA-based data transfer support to read the TC_RAB register,
>>> which provides the next unread captured value from either RA or RB. This
>>> improves performance and offloads CPU when mchp,use-dma-cap is enabled in
>>> the device tree.
>>
>> It looks like this is using DMA to read a single register in the implementation
>> of a sysfs read. Do you have measurements to show the performance difference?
>> I find it hard to believe that this would actually make a significant difference
>> compared to the overhead of the read syscall to read the sysfs attribute.
>>
> Hi David,
> 
> Thanks for the feedback.
> 
> You're right — in our current testing setup, I didn't observe any 
> significant performance benefit from using DMA to read the TC_RAB 
> register via sysfs. I benchmarked both DMA-based and direct MMIO 
> register access using a userspace program generating high-frequency 
> capture events, and the overhead of the sysfs read path seems to 
> dominate in both cases.
> 
> Our initial motivation for using DMA was that the TCB IP in Microchip 
> SoCs includes optional DMA support specifically for capture value 
> transfers. I wanted to evaluate the potential benefit of offloading CPU 
> load when frequent capture events are occurring. However, in practice, 
> the complexity added (especially due to blocking behavior in atomic 
> contexts like watch) does not appear to be justified, at least via sysfs 
> or simple polling.
> 
> I also tried routing the DMA-based read through the 
> COUNTER_COMPONENT_EXTENSION watch path, but as you may expect, that 
> ended up hanging due to blocking behavior in non-sleepable contexts. So 
> that route seems unsuitable without a more complex asynchronous 
> buffering model.
> 
> Would you suggest exploring a different approach or a more appropriate 
> interface for DMA-based capture (e.g., via a dedicated ioctl or char 
> device with async support)? I’m happy to rework it if there's a suitable 
> context where DMA adds measurable value.
> 
> Thanks again for your review and time.
> 

Adding a feature just to make use of something a chip can do doesn't
seem like the wisest approach. Without know how people will actually
want to use it, we would only be guessing during the design of the
userspace interface. It would be better to wait until there is an
actual real-world use case and design something around that need.

