Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BB11F3BA4
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 18:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749753921; cv=none; b=MH3lII48yTNBjdxtun5MfLypswteenIiq+8bMVRl173uE3bvStxyZxJJBamZSNqUrZcDokL8LPhGtDtq9X5fACX5QPvIfiZbp7y/oQuIcyRjOCdZtfnWkIxCPieo+s7pr8LFOYISzZ6ZXDaoVIhkqpnthZEJzEPZooq8VOhL4g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749753921; c=relaxed/simple;
	bh=ghVin/6Ib0ofa4efnFqrKYdd0d+RZ2+V2ryhajaUhlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+m83mhrkjJiPBMWLaZDaOcF56Owbil8Jw+T4+mKULQecE+3P5+FWLU9oO6bEVHnFh4nJGvOPE8QPczSy76X5uWdAyiX5EXAxhaazOJe5IgZtnUL6Kh/Z3Y3F1sapgkgrkHFmGNRGJKDGyvOxNpeJcqFBFe1tX1+VIkBZQgxp3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=up0cQ/s/; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="up0cQ/s/"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-404a5f4cdedso374340b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749753918; x=1750358718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e7sQVX/y9VgLzZU99FAxTuH0wCIRxWwgfapnssnH/pQ=;
        b=up0cQ/s/k4VMxNLMyNqaJ6eI447v9Q278RDtFDKN1GrKQy0v4ZPkhpJa2hTK3R0WUD
         6CGeLSfvOoVxGUJjKj63IFsWOqizQx0twD2RMTjDC98cjmEWtZxLytuZHAHjCJaPQasV
         tmaLE4fxu7Q7LysV2sEG77r2dkLaKAA7B702FOzZIsf8DxLjJVtlhE6EiSNMxovnLhd7
         VAv33BbKsG6DcAaFB+PlS+bYs+tzNajREYVdQRMfOPoEZzSJI/Ufnbj6tacay/aeDk1g
         zmNto41WGUS7QAMRQ/pl5Q/GlEbg1tOrPDplytoZFcbIop9SjhwuIqNoPKAZqVuwFhZS
         q0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749753918; x=1750358718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e7sQVX/y9VgLzZU99FAxTuH0wCIRxWwgfapnssnH/pQ=;
        b=tUj3yRm5A1cLcFXvyUB4s+O/xdWaON9AyxkHWDei4upndKBKMMxZ0/3c2OaTCzxXg5
         G0qGqFL7P/nPzmhN21hbvmOPBpmaR0BaF7MEUW/2Qmk8CBsY20YE+oZsa5B4lTAo7uZ2
         iMpr3DlCULFAJ/mqokvEUxhM02rCoOrBrlSh56PvP7suTp5F5AGKIbbnsrkotPcoQzxn
         hBbP7w4g8PyqdrzlnX3/l14qAsYymTHUJLicPATg97EmcmHeF0I1Z/Nm0pmxvy7qxsfC
         QhT2cwyL/Vb2dKaUks2goNrCMKV1Xjd8TGU2lDwFCOzhXp8KnNMSOb2smqf+ILM/eI2z
         19DA==
X-Forwarded-Encrypted: i=1; AJvYcCWx+yqs2v2GrpzsjZ4IKHe8ld5nmu8lRYxlkScY9AZ0iN5/z9RZmLK2R2xoP7N6yxqt6QVbyKh75maw7gk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk3uCRGxN/pBoOrWClllik+v9Kv4cNJ8DZ6JjfZl6X2yggpmyZ
	UDPSUZmk38NcDNKwzNQQprUsh0chgpxfW2xbIpyRLs4u5GVI2G7JBPgjkHBbUFuk5s0=
X-Gm-Gg: ASbGncsRUu5+Urb5C94iR4PqwjeT0VRlN0NVO/O2SdsQsgGK8kZdS/wlVCTWrzC2yA4
	SMUDDlg503JcqoNJSXndTsXOEqE2Fewfn1Xr7sOI4Jr44swjXyjAIME/ihQ8lckaignm7Hsw5Xm
	MYjKyuwEb9F4ZZZyp1zEXBUu9v7S4NcYrTy2kiq+TnuGkKEjAoJwkK7BGaQ2f3YOFdlBTdByB/u
	d1nmoCmpRQ2Zqyozd/pOfftbIFFghkKUQQr2vy4YoNZcUlly+T6UMPuszvf0pgq5KAJZqlOXQzv
	uvIrVy3Ffbf436Mhla4zFvv2WOY9vaEwji+80hneyyta672j/o5UFw2iv1udsqs9QifzcMJ7KTg
	Km77qAyjNJpTW+KjzNi9MXuLg4GiQ8aessTZ/
X-Google-Smtp-Source: AGHT+IGz47jHNxt4zvlUkgydTLbpaFIj+soSmjpN2OE7Gp76WmFhuGKdZYM9K/JqfmQtchA9LQrAiw==
X-Received: by 2002:a05:6808:21a7:b0:406:59f3:73a5 with SMTP id 5614622812f47-40a71e80deamr342590b6e.19.1749753917833;
        Thu, 12 Jun 2025 11:45:17 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:f808:847:b3ae:ff1a? ([2600:8803:e7e4:1d00:f808:847:b3ae:ff1a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a6822f829sm403435b6e.15.2025.06.12.11.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 11:45:17 -0700 (PDT)
Message-ID: <846f5979-778a-41f0-b5d2-52d639607315@baylibre.com>
Date: Thu, 12 Jun 2025 13:45:16 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] iio: amplifiers: ada4250: move offset_uv in struct
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250611-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v3-0-bf85ddea79f2@baylibre.com>
 <20250611-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v3-4-bf85ddea79f2@baylibre.com>
 <aErQVKul7Gnxvu3F@smile.fi.intel.com>
 <275cf035-f0ca-4aa6-a41f-b0c21d7c9374@baylibre.com>
 <CAHp75VeewKdOQk9qoO-2Ann90hwAGE0goOtiOG9BRjJ4cn6h=g@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CAHp75VeewKdOQk9qoO-2Ann90hwAGE0goOtiOG9BRjJ4cn6h=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/12/25 1:34 PM, Andy Shevchenko wrote:
> On Thu, Jun 12, 2025 at 6:31 PM David Lechner <dlechner@baylibre.com> wrote:
>> On 6/12/25 8:04 AM, Andy Shevchenko wrote:
>>> On Wed, Jun 11, 2025 at 04:33:04PM -0500, David Lechner wrote:
>>>> Move offset_uv in struct ada4250_state. This keeps things logically
>>>> grouped and reduces holes in the struct.
>>>
>>> Can the (smallest part of) the diff for `pahole` runs be added here?
>>
>> Well, I didn't use pahole. I could just tell by looking at it. There
>> was int followed by two u8 followed by int, so we know there was a 2
>> byte hole before the last int.
> 
> Yes, but since we have a tool for such cases, why not use it?
> 

In cases like this, I don't think the we are getting much value
from it compared to the amount of time it would take me to do it.
