Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5AD258CC5
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 13:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746453453; cv=none; b=oNvk0oNL4AdHMquLda0VVUpolyFFkhzgaMzo/RKeRjs0Gi3JSFKes9ImEwwnyvTTW2FW+tap2Of/bOUPE54WEORB6ocEvBoTM7o3kB6WX1w4cV7u/kmeE9rQg55+bfgo0U4ctlo4n28tHw/2RLFx04SGc3pBIw0iIhYHHnpusCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746453453; c=relaxed/simple;
	bh=7c3MlvjxM4l0czXUSwKHbOv6lkRvNqp8kskIe/50s3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCdIs4vIM8JyRvs0pWmAqPW+eHuOK6/36nmeB9+ADk+mtBVf99rTxOujTuJnDKYkFgTMqZPLpHf70owBJikXZUd8H5JHfWYriNlalTHTmVeLpkWv1KMMbWL16ZYgZV+WhrqPYWVKa9L9YiSpisM/XlhflWx1R3i9Aw3wAJhXuGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ITE/oXWQ; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ITE/oXWQ"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-72ec58e45baso2969956a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 06:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746453451; x=1747058251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=deLqCQ0R/IhrB6rCh2mYQyRMGHfxP9fVsJMdPdrYT2I=;
        b=ITE/oXWQoCKcD04YnRmm0y/ozT5zLxpejlIdyT0VXeQOaDc7Fnu+WunO2CKDuH/t5M
         f4GsZbP6bGXAxX7ZCoSTpi9iXLeukyuEb0s4RjQsCMAa3p+PdiKZ0Ni9G1QTwdRd1xu6
         XaAkLTVdIZiYPZDrFAl18IJJzUvkJcIC3jgmRno1RUkDTszgJRKfjGrsZk2Eti+rkEFy
         DZPteZlhx2XcAV4pASL6NvUi49D7jRCvjOvZmK8xJC2vxLKIhxntDIsvh5RRd2kUWQCM
         B7exYcMbTb49bEbCUIkmUjKsLxDbjRWAE42fUs8pXmChu5TltEh0QUOweEz+0S5d5HdH
         zekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746453451; x=1747058251;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=deLqCQ0R/IhrB6rCh2mYQyRMGHfxP9fVsJMdPdrYT2I=;
        b=fVjjuZuwS0k+ZYLkl+a3DWmirlC602UYGqwKM19cnBH+OUbKM5hp2a9qS6BQwB4JBe
         QU9H7wNqVj2VmS/GGFoKMHPjjocaj02IHLRz4xuA0tWVfAhi0UUmfiKUg9gOZUem9H5q
         iDH8Jh+CGRiY2LO3gWRzL+e07Z+/teVk0+GAWAHWwGZu3DFbytl6YVbXN8e2rrUlbzAt
         45+tnFWnGSPYIvUjEaGdyFyTnvRrq98pf7L8s+Vt8UpRt3ZYQXcWNMr5mp+maPSxywb6
         IUOHg4e7XOJHWW/Wo5Q0ffihzh73WZta9nI2zL6Ka8MHAwlt3QR+iKnYYrxr9kZ+vOQb
         q67g==
X-Forwarded-Encrypted: i=1; AJvYcCWjd+6eN0GeueedflqDS0pYrYtA6IZlb4g91Ja/JgQNxhRvyQJ0wwC3Z96Gw5fqPZfX1k9SHKp4Nu9bLoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIiLTU/5bqcVIk+okmQKkwvOCx7/GrXHF+uFroSn82OwUStgkN
	fTf+tBhIwFJ1Dzz8vQ952r9BHyaZOAuuqPg8pS4UQn/n60J0FiwP4Wb00OertYdw23k8eo45S9Y
	e
X-Gm-Gg: ASbGncvLI8Sw9IYpvKzoZAUgfLXLdZkn1ipXMdfHn1vj5bC1LT1asujO1idnF0eMeVF
	wkFiqI4OF15XUxffllm1c4p0xpNRmAFICN69RAGw7yusRhmr20Zp4CaZWXJC9hE1005KkTJpDbW
	gS3wzATcmVgPabCDWrUfKs6C9lr590z43IPcxZhW4EsJKVy6KQhCdHvtlS6qyG0vQvA7aJFk/dJ
	nsAw+lNgtgC1n5qfNX/7NnYPtPpCN+HgeS0nckgEfBZ3ViZQCCF/TI41hgr7JibpjcZnQ9pdl/h
	jhDz9PgZJiGQN1dFue18NhNtE9YWr7cXg4eDJ/9w3anPXtq/n1HmULegCGgU8Hiwdne5jDXwoZ9
	hexnpZIbOKxRF9Zg=
X-Google-Smtp-Source: AGHT+IHHUXBWiUip20M4q/7ydDt9/FNBxTFin43+HmguhLrufCWOOz5GxdItgIHeHNntNVMA6GjqFw==
X-Received: by 2002:a05:6870:e995:b0:2c1:c821:c836 with SMTP id 586e51a60fabf-2dae83e5b54mr3766890fac.22.1746453451065;
        Mon, 05 May 2025 06:57:31 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:2151:6806:9b7:545d? ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2daa0e5099fsm1976029fac.1.2025.05.05.06.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 06:57:30 -0700 (PDT)
Message-ID: <efe160b5-5d91-4892-a0d6-ef73116fe071@baylibre.com>
Date: Mon, 5 May 2025 08:57:29 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: ad7606: explicit timestamp alignment
To: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <noname.nuno@gmail.com>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250428-iio-adc-ad7606-fix-buffer-alignment-v1-1-88dfc57e5df0@baylibre.com>
 <d7f00a8c9d4da6f780c1ec067be2702fa0e60ea1.camel@gmail.com>
 <20250504155544.60fe3464@jic23-huawei>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250504155544.60fe3464@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/4/25 9:55 AM, Jonathan Cameron wrote:
> On Tue, 29 Apr 2025 14:01:54 +0100
> Nuno Sá <noname.nuno@gmail.com> wrote:
> 
>> On Mon, 2025-04-28 at 21:17 -0500, David Lechner wrote:
>>> Use struct with aligned_s64 timestamp to make timestamp alignment
>>> explicit. Technically, what we have works because for all known
>>> architectures, IIO_DMA_MINALIGN is a multiple of __alignof__(s64).
>>> But this way, we don't have to make people read the comments to know
>>> why there are extra elements in each buffer.
>>>
>>> ---  
>>
>> Reviewed-by: Nuno Sá <nuno.sa@analog.com>
> Applied to the togreg branch of iio.git and pushed out as testing
> for all the normal reasons.
> 
Not sure how we all managed to this, but this is missing:

Signed-off-by: David Lechner <dlechner@baylibre.com>

