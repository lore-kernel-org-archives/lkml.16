Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B051FC0EF
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748876462; cv=none; b=f8Hwh4NeLeg2ihx6aMbfq2eBLOdHiFCGAq5LVv7AntKirZK4+E8nnrDuO8bGRPHDoKDjRRn/7DT5TkUa7WCPGxvDSkQ1Ttoviu3Y3w44cTZzjTvxjHWPmfKHM1lv5Bx+wuO+t1lTZgFAD5rZnHNtGX5JTRJeNKXODVgnIV/0gPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748876462; c=relaxed/simple;
	bh=5dRvYuDZHJt4dxtRSL6dPD9so8Zn1bK1pE7CkV2g2Ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k703kaBrvteNSFPXqntgrGzY+Ao1RYN2uxjLWuLfhpC/txEP8L4H5XqwDR0gV3T3uekXCGHQ2XHFv7CXkkN6YFBkxlZoGU/Dd/jNugffxORA8Mgyg6ClSFIZrrE2Ce/5RzOzDHW3gAcaflnpGG2TfhPqLBYR8NlGEKzmVsYNcT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hU+2bDb/; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hU+2bDb/"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-72c14138668so1166100a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 08:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748876459; x=1749481259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BKRRslHq9l+I796/Ew8fuJsvx+yR6BWkXnH67RqDqcg=;
        b=hU+2bDb/YufFv5TP3/Vt4IJ2p5GaGEr1PigKVuaZUr7Ib5W4nyT35HT1C0G/RcLMci
         JGZKpXIzvxGdCcTxaCq4Ntfn89Jxhdsm41zAZTDX8Yjd4JpNPzE+J6EkOu8X9tRPl3CG
         rH0+6mBCJESkwo0kF05vPdTj6aTWQv/Ci46Uq9EJawpcfW/Rt1h25pah94HgnmascrxH
         SJ6tVWzRNLD8EaKxiZV9qx0mNzIlKzUskx0+mHdEZyInlPzoZI8H5FMbwsp7xIZ28JMV
         RKdeW7IhiP5BIvV/KOIztNp15VMLAqU+zLORon3ozBQBiJpYF9o23rAlvx/Yq66URdWD
         qYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748876459; x=1749481259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BKRRslHq9l+I796/Ew8fuJsvx+yR6BWkXnH67RqDqcg=;
        b=iP3rr2dyrHj9jbn5CbTjJQeeNNXGfW1Gc/4xlcrz4G+iOOSX40vOVRXyQIi+Iwn9zx
         tsWtCmu+5cdjmUnwcLkAWI0xghI1ei5KRqQlk0FWdFFn/1R18lJxgPUkW4vjbS2zbieW
         ERErhNulj9WI0pdOUxsTG/LJXpcLMIkifKRIhI9EISjbyz34FpiGwHqsa/hyZmr5mhtv
         /kyd82YblSCkb1xRMp8q0GNq9xXl7vbPTfvMGKybiYHpAivm/FVqk9yKJuEDuTJUgICp
         9BLBElA7WYu9nDR6N8DIZy8CFoll0rOd2kEF2GbnlL1HZUCIkmd1y54FzFEBm9h68Dhw
         nkkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY/PpRnyxbQm8g0wEWRbBeZM79WtgKk2Sm5CCS9y/ewV15ulwOOVE3OLzOjt/j0QJblfdmC7YVj882PcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRquD5WF+mScTrDrrb/3ZkMoA0Lp/G7uLRkmNmy6ph3OecJDeG
	Z9842d+RbfXo2dEFINE5lr8orctoZZsfujwzZKtxW/9SOS052JjydrAlYKB0/OxvDAQ=
X-Gm-Gg: ASbGncvsND6sv7+b+gGABCZaLGIVlcg1yY7JFi6ssGbhaPLncPCqLPLCfP0AfwSLcYs
	KMkxPHJEg3rjeqKTajTjTIS8DzSug/fABlR7J2Fki37FLQQhZ1yLv7f1S1LVjPu29+MNcPWEZdJ
	ItB34qDML35oS7F4t9VDTDSeN9srhBi9PreT5hqL7FXSVX9Kx+0apYG9k34VzcchuH9vfWLcVFO
	eRK1FhHRAzv2cTF2IU7eHUvIB1vaeS2zK3L7ZpZGXg9jGyOyilcZWgoo4ZbqzPsGDBJdofq9sJL
	jOd1JWNeCtT4b3UPHZh4HnCW/7dL1MX7AVyNjtNVizNbIokthaXYdkqCXDJKA2szXr9Dk7iCU1c
	hlLm7is49n6kS6Jk0atdrIDTCr9bKQHkOi9NB4xI=
X-Google-Smtp-Source: AGHT+IE+kAIBR0NheiTCHpkl4+yPXWEfW3+c5RK6WjfBdTqWkx83ge6s8Nuep+dL1P8pXQzSBEB20Q==
X-Received: by 2002:a05:6830:6582:b0:727:36a0:a2ae with SMTP id 46e09a7af769-736ece4918emr8154398a34.14.1748876457933;
        Mon, 02 Jun 2025 08:00:57 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:74f4:5886:86e1:3bcf? ([2600:8803:e7e4:1d00:74f4:5886:86e1:3bcf])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-735af82d086sm1555913a34.11.2025.06.02.08.00.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 08:00:57 -0700 (PDT)
Message-ID: <f0c94748-7d09-41c0-9557-b37a1f6a8f7b@baylibre.com>
Date: Mon, 2 Jun 2025 10:00:56 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: accel: fxls8962af: Fix use after free in
 fxls8962af_fifo_flush
To: Sean Nyekjaer <sean@geanix.com>, Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250524-fxlsrace-v1-1-dec506dc87ae@geanix.com>
 <20250531175302.05b2da17@jic23-huawei>
 <x6lmsxsz6njt22z23l3nbetlstkwn4jk5ohgtpyd23idwleeg5@szatvfu4drjj>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <x6lmsxsz6njt22z23l3nbetlstkwn4jk5ohgtpyd23idwleeg5@szatvfu4drjj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/2/25 5:50 AM, Sean Nyekjaer wrote:
> Hi Jonathan,
> 
> On Sat, May 31, 2025 at 05:53:02PM +0100, Jonathan Cameron wrote:
>> On Sat, 24 May 2025 12:34:09 +0200
>> Sean Nyekjaer <sean@geanix.com> wrote:
>>
>>> fxls8962af_fifo_flush() uses indio_dev->active_scan_mask (with
>>> iio_for_each_active_channel()) without making sure the indio_dev
>>> stays in buffer mode.
>>> There is a race if indio_dev exits buffer mode in the middle of the
>>> interrupt that flushes the fifo. Fix this by calling
>>> iio_device_claim_buffer_mode() to ensure indio_dev can't exit buffer
>>> mode during the flush.
>>>
>>> Unable to handle kernel NULL pointer dereference at virtual address 00000000 when read
>>> [...]
>>> _find_first_bit_le from fxls8962af_fifo_flush+0x17c/0x290
>>> fxls8962af_fifo_flush from fxls8962af_interrupt+0x80/0x178
>>> fxls8962af_interrupt from irq_thread_fn+0x1c/0x7c
>>> irq_thread_fn from irq_thread+0x110/0x1f4
>>> irq_thread from kthread+0xe0/0xfc
>>> kthread from ret_from_fork+0x14/0x2c
>>>
>>> Fixes: 79e3a5bdd9ef ("iio: accel: fxls8962af: add hw buffered sampling")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
>>
>> That's nasty and a case I'd never thought about.  Most of the
>> races around disabling end up with an extra sample or two which then gets
>> dropped because there are no buffers enabled.
>>
>> We need to consider the active scan mask as part of the buffer state.
>> So effectively taking mlock if we enter this code will delay the state
>> transition (and change of active_scan_mask until after this interrupt is done).
>>
>> If David's synchronize_irq() is enough maybe that's a lighter weight path?
> 
> I agree if David's proposal is sufficient, I can try it.
> It's something we have seen once in some unrelated testing, so it's
> quite hard to reproduce :/
> 
> /Sean

Maybe temporarily adding a time delay of one sample period towards the
beginning of fxls8962af_interrupt() could make it easier to reproduce?
