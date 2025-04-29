Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2849C23FC7D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745941854; cv=none; b=iXid4T4mjdqhnCbxqVM21iajc0MVRQToUwz9XBk4NCNO749O7rZyuNkCjRglzU9Y2VcKRDOT4xadDNVDM93DKK2F+RVW7SLLaTDRCJ+rFBUvEppQbT8iG11jhruG6idoTOEUDx5sl3u2Bm0hesbaVUgbeYg2pSNu+GNGzWC0KJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745941854; c=relaxed/simple;
	bh=27sUWC+HFFtmMxGijGj3WlvDdGSGLfoqsxoR+r6qkAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iXxMVRUiK3pLVvdzJjxvwPzx5nLEXjHD7r7YSqxDZhnr+Wj4MyqqZCPL6QPnaAuyiCtku3spRFs68R8WLw9/mRrPyKfe1HlmYh2HDl7kSr+sf+s7eB45dUe3xfxlN6oXXJNG7L4WYCtlVLg8YRAmo4w22sb8wZF0LECyLPnkxOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KJhNUmxZ; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KJhNUmxZ"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3fb3f4bf97aso1932172b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745941852; x=1746546652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5IWwy2Q6p9XeoTqr1hNsCWFixc22wa18HwPhsdqWpx4=;
        b=KJhNUmxZUViGc4hxEpxnvJ+bCIMbraYPDqT5ZdyFX8Ivo5xaVBwDhkd3VIikEdwYFC
         SOyuD2HLr3EFb5SHTf5MNSN6PRC02vVvxrL4jVm8qbXUAXNFYpOif7euAHdXm6RtVcl0
         B4O6Q+S1ZkyaWB2NSdzmovVgPRI/mmjDGwb4VW2rgZPLnII0mhEm9O8JDPNY5ShZq+UT
         7b+Z3lkFcmoKLBe5C0IUN9nF9Z7wNA2tyxnyBC5nr1WuQ3h80cW8iNVMEomtAze5n4m7
         1cCq2UGEIi7nzYMYaKv1Ko/R32qArCPDEPgm6og26jUxR+FT/jXucH9OWbn97T91sM2J
         m8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745941852; x=1746546652;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5IWwy2Q6p9XeoTqr1hNsCWFixc22wa18HwPhsdqWpx4=;
        b=Ccxb5QSHoPVqGLgkfCNDgfv+J7b6WnI9Wl9W/e+DD1g7EqKBwAgM4+pi8Y7jAJxBeU
         n0iLjXCR4UiwSbwNy5APXbw2PWIt0U38p83CsNlp8oLgbrpa59zUJyx/9i5Bgi7bhs+t
         4IxwNNRKBY/dyxrOqKwHwz9RYWQA48eQFHfyoB9slSUSTqqUnwECkDJ6721OEaZWd/7W
         w4b4RZOZFaaAwaQnGFLiDBcKYhqMxxQLERU2EYWnyWeuEA4zfeBFOnejBG7yHqto37BZ
         bTewLAd7IUI3dPtmwoYmj32ZM6/NZ35KuQOpI+2dBGtXpkX7OgxT3s2ItyMccmZmu2Ap
         fMVw==
X-Forwarded-Encrypted: i=1; AJvYcCU2usCwkL1GtnYYYFDri6jOUskwzhbl12bsRKealRNvC/WzsIeCXxo64LHdOCoyv8dsjJYIvIwFc3qefYA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxchk7kjqsc17+pUhw7ztTiPi62OgAq1uMQr3VIhe/uRq2Uv9Qt
	/B6wwVbK5Un5GGEhp+RFgNKTPju91v1vSdJkfmy0dTY3OPTDE96mwia67ZJB1so=
X-Gm-Gg: ASbGncvdoQkCG1wLn6k2CpDl08Vd/UbyEgn19P3eHz+Of6OK4I7MKsxTjj6/apVsp5r
	9lxuF7qWyqLvyI+fE54qSOJ+/znHFla5OUMpo5Pc4coIAxQsaQSwGLhN1eU4NdU9TwJQtl2JST/
	nkUOz77XlIFWvXB7bw8cYFRWZ9ZyYeooj8XfAJLRIyLWfKU8/4qdzl1Fe0XHhTfiOGWziSYJsBC
	UR2MJyFBKy3Zi14Szk0bFBpJrwIbxxO+kSM/cM8I+cMpzD0rBuTwV9O4I3c9qGplNUL4+lrfXjk
	88C/4c6wl3YBDN1H5QrmAoS0fBkWIxQ7SpTTRUNSjxlaKC5hAHTkbA3BAHPiYk42HWjf4VtOGtd
	NYjDL9lCtTgYVjm7vbw==
X-Google-Smtp-Source: AGHT+IF3YniFZktmx+wzc5Vvip+TGKj/p4EKeDpAQZouq1NsM4HgUhhkCMBt+xncFToPImadwaDMIA==
X-Received: by 2002:a05:6808:22a1:b0:401:e933:5dd9 with SMTP id 5614622812f47-40211578670mr1858013b6e.20.1745941852264;
        Tue, 29 Apr 2025 08:50:52 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:dc17:157d:e8b2:3ad6? ([2600:8803:e7e4:1d00:dc17:157d:e8b2:3ad6])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4021292d759sm302218b6e.27.2025.04.29.08.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 08:50:51 -0700 (PDT)
Message-ID: <65cabf04-a1ef-482b-9192-d280897f2afb@baylibre.com>
Date: Tue, 29 Apr 2025 10:50:50 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] docs: iio: new docs for ad4052 driver
To: Jorge Marques <gastmaier@gmail.com>
Cc: Jorge Marques <jorge.marques@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20250422-iio-driver-ad4052-v2-0-638af47e9eb3@analog.com>
 <20250422-iio-driver-ad4052-v2-4-638af47e9eb3@analog.com>
 <9f5b0709-f795-44c5-aa64-aaed81a459bf@baylibre.com>
 <nrffdb34ldh24kjphvebdnc2p466xbmay4pm6pe3nen2wftycv@uyxqjovmm726>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <nrffdb34ldh24kjphvebdnc2p466xbmay4pm6pe3nen2wftycv@uyxqjovmm726>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/29/25 8:49 AM, Jorge Marques wrote:
> On Fri, Apr 25, 2025 at 04:44:20PM -0500, David Lechner wrote:
>> On 4/22/25 6:34 AM, Jorge Marques wrote:
>>> This adds a new page to document how to use the ad4052 ADC driver.
>>>

...

>>
> 
> Sorry about this submission, this file was indeed not updated between
> version.

No worries. We all make mistakes from time to time. :-)

