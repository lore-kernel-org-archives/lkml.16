Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF5F1553AB
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 18:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745085853; cv=none; b=bpbsulpwg63eOEbo3Ar9mJLqp3TiLcb/YKZS+z9VWXODb0S5FulhFmHHxTMAsPBUi+tjwZ+7GRfhKNeFWCjU33CAPty+BCyCewh+AYsAgYZWG/KdMUQW8EQxNon+MQPTxLXL9QVW/+9qKWfZU7jtT0MaTUDie/Jzhu/h9DdZW+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745085853; c=relaxed/simple;
	bh=ouOyKoeAngMKojKw8UEXMPbxMa5tsF/a4TIHmRZx0UU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gY1x7Bubg2MK2IBT/B5fFOgTLwheECP4gx9DHLu6zejc93kDF8JiKHA75DP+ldFaKHhI38t54WJ2CsoCfp0JyCFeH3suCMyNIZTg0VfLCGApZ6STJFf4mMdZH9/opL0E7R5nUquVhNTgeK2X1rT+G6ri1gJxrMXj9yMoB9QMpsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KhtZkQ5E; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KhtZkQ5E"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-72c7336ed99so741124a34.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 11:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745085851; x=1745690651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cnOvqQvY0JTPnC6ngZ5WgpMNFi7FR1LXeifwqpVfw6s=;
        b=KhtZkQ5E38rvRJpRul0zJKUiaKjDrxkNFY2vELP3L2AMoBt4PD4L//kv2jnMw1CeIQ
         RMVkFvG0LpnVQg+Vc66h3TNZSKKCM534Z/Q6iZgsam2b8xh9yR6kotYhxShoi2TlRbRl
         VwxdGfz8+4l7+igOL7Wgbw22usRuFRN1lss1ciDTE6hcw4jo0LQ9Pg4hCcGciTACasg3
         lSAHvphDerJ3zPsRXcGtP5fSZcs8Pex+eLTwRhcQLZ24u93MSXaVrkq+cGr44HsD9Vxq
         RmTwj4ie0vR8gMMgJPSedItouhRyYvxqMxoCw/lTOye8stDEaANejSI3I6l5MvL7FsaJ
         iXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745085851; x=1745690651;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cnOvqQvY0JTPnC6ngZ5WgpMNFi7FR1LXeifwqpVfw6s=;
        b=Zikvtno9lxA1Vlqkz8Dr5FGh6Ix4m1e4+17Ht1RXPV3bORq4ZVtssjzBXWS5EeH1Er
         v5q+91lUJHqpsSt9yCRFoutAoPIeDizWiyeM2SFTCvbX5f0ndx0r8JKmsKa5W6V8LmgB
         tbjXoT+b/qVw0hffN1OY3ilYhSsbk8qJrYnNnqsWj+M7WWaoNZjvx3JcfLaY7JaMJtIV
         M/lUyhzLSbQDOfdUtMu8bXoMIdVqZZ1R1Q/VOAzPFRifkr1fCTkwsM1660Ag7bSHSeSH
         Er9I175uB2uXh62j/11SHRQybSTxnL2OmA8eagR3WpVlQb5m+hrlodkxxTb2NYeZgFko
         tMUw==
X-Forwarded-Encrypted: i=1; AJvYcCWtLwkOzc804siO6xHpIiy+Em/AzI4A/HEw/qVTnBeUS+ABIj1AmMtLTS4pIK34Hp4LK/8juRurqXGtUDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMk+bfNDDvhChvLB5ig+PQv25b1IQWyeXjrmXYbVuUTQgtgVJX
	LFtrNZDOiZr8mUDLpRf2I/ND6ttIKxjEZ/PGerKD5UIifP/okwkglQxEGzSQzBg=
X-Gm-Gg: ASbGncvbdKICUIGm/jIvehuKdoczE2JkneVkGTRVuOn4HtDbsuvc6dIoheWCbArA+lO
	YtX2TJIbmi4UlLnAI9HVObzyKnH4rnVa46HR+2vXvkr7OBuO4AAJSL93ccA+nRTgXsOCvPUSKEj
	XgfrT6mfKGjhL1Yj53IsYlrObGARiNCWiaTphjJRZoEH2v7UVsMNJsrt8Nk6gLU3T3VkGgxykQW
	wHtrwo5+A2O0V9zBBOnEmIKVlbd4rNcM5Mv4szi1OgX8GFdzUWAcPPCI+1GmUw7O1sI0+dAX03t
	ulEfCQmVWJKXszHMWawg9Hl+CPyDYhqfsIFlFawQ7kdtepccTngWDgtZHKNfoj2zFmhlKsXTTSM
	ZsQJ11LwEUQtV
X-Google-Smtp-Source: AGHT+IF3acsObqd4J9HjsEc4P7l1hAE8P9A417ZJtaywx9v5lIYAACZt1S0qi8YyVFXmTZdKQHf1gQ==
X-Received: by 2002:a05:6871:500a:b0:2c2:4f6f:5b59 with SMTP id 586e51a60fabf-2d52681d477mr3307005fac.2.1745085851027;
        Sat, 19 Apr 2025 11:04:11 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:79a:b8ae:edee:ec5? ([2600:8803:e7e4:1d00:79a:b8ae:edee:ec5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d52136181fsm1046907fac.19.2025.04.19.11.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Apr 2025 11:04:09 -0700 (PDT)
Message-ID: <9cdb05b5-299c-472f-a582-13a7d1368f3b@baylibre.com>
Date: Sat, 19 Apr 2025 13:04:08 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] iio: pressure: bmp280: use IIO_DECLARE_BUFFER_WITH_TS
To: Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250418-iio-introduce-iio_declare_buffer_with_ts-v1-0-ee0c62a33a0f@baylibre.com>
 <20250418-iio-introduce-iio_declare_buffer_with_ts-v1-4-ee0c62a33a0f@baylibre.com>
 <aAPRuUZTWQZr9Y6H@smile.fi.intel.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <aAPRuUZTWQZr9Y6H@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/19/25 11:39 AM, Andy Shevchenko wrote:
> On Fri, Apr 18, 2025 at 05:58:35PM -0500, David Lechner wrote:
>> Use IIO_DECLARE_BUFFER_WITH_TS to declare the buffer that gets used with
>> iio_push_to_buffers_with_ts(). This makes the code a bit easier to read
>> and understand.
>>
>> The data type is changed so that we can drop the casts when the buffer
>> is used.
> 
> This one is good, with the comment to have it DMA aligned.
> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> 

Strictly speaking, this one doesn't need to be DMA-safe. This buffer isn't
passed to SPI or any other bus. It is just used for iio_push_to_buffers_with_ts()
and has data copied to it from elsewhere just before that.
