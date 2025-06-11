Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E3E2528F3
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 20:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749673617; cv=none; b=VDdn1AhjA2pEZLOUBTVRdb1v+OSzxRIN2FQIIFc73g59z9nYCaGyqNu7UvrL32QNpE70DrXvKqxRVF2ry0+klwODrEpEmDyqNvlnkc9mkoavFPzGzHVFqyTbUGAwpaF8jiKRAEAxdYleRIstbOJG81DB75G9IykPW0fnHHtr/oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749673617; c=relaxed/simple;
	bh=4Nu0j98D6h/l9/aD/BI7DaWZwlDoKTZw120WkJ4+etI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mGDVf5GwdQTuCNg3ta66ECVIjAum0rL3nEW7ujdiWGZ/ma4mP3PPIbgtMJtXXyTxOUrOQ2zd5l6rsWtPT0Z0MRgcR/Eiulz3ker9BAWvRUA/DkBtuMqZT/qVu4r1EBrBo3XMacT2ITx0rwQUkofpeal+MhhBs+gNXYMPw461U5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ehjIFapJ; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ehjIFapJ"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2da3c572a0bso79493fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749673613; x=1750278413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=clQc+ALpEbRfKWwmdYpg7fRgJck1oxl3hljPINdz/zY=;
        b=ehjIFapJ/TrzlhYOp+hzujH6+IJIwVdx/w/dSRLa1CAgiTHgNWHYKvQtb14YhkZ9MS
         JXhc+0AYGZ6M6QDw3ETTy9JC2cbVHtRlE/cUw2p7/Z5l0pK/4x/R8ai6BmbxPVa4gW5v
         AoKRaNjgtaStufNvQdksSu2mNqOC6KDWMK9jZPNgGK+QdNMgwC6wZmXpeI4OjJv5jr0z
         3AkR47vSa+ItP/oS9VEOQmncp+3ZY/FJvafCEuxkyBUnUtHB2qTWkD3ydNLmcO4j2lAR
         vVyBU0lJj7lJOjFQ4NNvuEOr8wKRCI1G5q3iUM9Vj9R9e1o1eYxKCvg5IfTpiCnVMIoi
         APcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749673613; x=1750278413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clQc+ALpEbRfKWwmdYpg7fRgJck1oxl3hljPINdz/zY=;
        b=THuv7WdVaznuLkDfpc7oug+GzLKJXMjDi0ezt/h2Gr5XhWJfOOJRT92Sc06OdkF6et
         Uvi0pGCdoOaV2XEJoiNlgsgy+hW7DOGhsWrecsg+qMInRAEekTr27WY3X45KUAGruY5K
         u2nT4p0XWMMpoD/ZWmX4XpbbbgUB2UO6XQ8tXcvWROXDnNy53hq2k9lwDRpMEhAWY61Z
         UFUniHIx7mWvWFnQ8K5qsDg2TzKzNx8OriG7YgTc7ueE8XLM68N5f0oBJ5mEPwSl8gup
         XUluNzuvYFghwh8D6UiYLR9QU9O5ruFZ1mDt9JZycs/S4IHRBAJifelzgEd7mmOUkKrn
         tTHg==
X-Forwarded-Encrypted: i=1; AJvYcCVh1QataZmuS/I5N+Tnk+iUM1YpHR0O7ykeNrsw8VBrnT3YS+ZmEUs+G5+SqL6zPLOeZD7h9p3soIvot4c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1bX2HhdN6/F6hoP054RXNvB5V0twka6VqyDVbDSNHwXDBUumd
	IfvUbvepd/ArEohr/crp6Aoeidv4IEyyXjzn2KpZs2OdQmhKhAhVJmmrsxRHgd8TDu4=
X-Gm-Gg: ASbGncsnAxeXGg2nJXnzdkjy9lUOsAA8o/wfcWscy2C6IobfbFOOvn7oMvqelPcjZGq
	a4Id442D95sDabjAB66lf16YwXfVy/QfDedZpiKdairC9l4zUTthETZ2H6Af3ipGTt08+IPOgHo
	e0TtYYYTfZFFBtWt9+YFsWt8TB1BYLhJvxgPRzjKCA3i0uyWmjBwunAYpZ7K+Ux6Hoz3Te/L+NY
	jF+JqWGJLbKvtJsIk3pX0pEQXRpgjNipjCmOK6pTb2bq9pZkpxslmZafeYEC9khfgC/MwMmRJ6T
	WTGfGftNdu3UbVEFr2gAEDN2ZwuLc0scTiDgWyXef94sLEG8c8hd4WIcQoiza23QTBeQYgkmF/v
	ogvxrd8BbUvUA+uKEvqOo3QFAPUCv2tVR16l9icg=
X-Google-Smtp-Source: AGHT+IHVTR6x7Iywr4DoILca74HC62mQNiOYdv89GViJJzcv39NMYjFI9UxLuEQSNiTRmXfbxbG8uQ==
X-Received: by 2002:a05:6870:3644:b0:2c2:4090:9e8 with SMTP id 586e51a60fabf-2ea96e8b67cmr2383236fac.22.1749673613362;
        Wed, 11 Jun 2025 13:26:53 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4753:719f:673f:547c? ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eab8df2448sm1925fac.23.2025.06.11.13.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 13:26:51 -0700 (PDT)
Message-ID: <b4e3260d-ecf9-4a51-85c1-889d7741d287@baylibre.com>
Date: Wed, 11 Jun 2025 15:26:50 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] bus: ts-nbus: use bitmap_set_value8()
To: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20250611-gpio-set-array-helper-v4-0-fb86a9b499ab@baylibre.com>
 <20250611-gpio-set-array-helper-v4-3-fb86a9b499ab@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250611-gpio-set-array-helper-v4-3-fb86a9b499ab@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/25 3:18 PM, David Lechner wrote:
> Use bitmap_set_value8() instead of accessing the bitmap directly.
> 
> Accessing the bitmap directly is not considered good practice. We now
> have a helper function that can be used instead, so let's use it.
> 
> The bitmap has to be zero-initialized now to avoid a compiler warning
> since bitmap_set_value8() does read/modify/write rather than just the
> write that this is replacing.
> 
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
> v4 changes:
> - Fix typo s/get/set/ in commit message
> - Zero-initialize the bitmap to avoid compiler warning
> ---
>  drivers/bus/ts-nbus.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/ts-nbus.c b/drivers/bus/ts-nbus.c
> index b4c9308caf0647a3261071d9527fffce77784af2..17540034e64a4e591ea61b0b4eef86a2081b02f5 100644
> --- a/drivers/bus/ts-nbus.c
> +++ b/drivers/bus/ts-nbus.c
> @@ -10,6 +10,7 @@
>   * TS-4600 SoM.
>   */
>  
> +#include <linux/bitmap.h>
>  #include <linux/bitops.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/kernel.h>
> @@ -105,9 +106,9 @@ static void ts_nbus_set_direction(struct ts_nbus *ts_nbus, int direction)
>   */
>  static void ts_nbus_reset_bus(struct ts_nbus *ts_nbus)
>  {
> -	DECLARE_BITMAP(values, 8);
> +	DECLARE_BITMAP(values, 8) = { };
>  
> -	values[0] = 0;
> +	bitmap_set_value8(values, byte, 0);

I got distracted by an appointment and forgot to compile test before
sending. :-(

byte is undefined here. Will send v5 soon.

>  
>  	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
>  	gpiod_set_value_cansleep(ts_nbus->csn, 0);
> @@ -149,9 +150,9 @@ static int ts_nbus_read_byte(struct ts_nbus *ts_nbus, u8 *val)
>   */
>  static void ts_nbus_write_byte(struct ts_nbus *ts_nbus, u8 byte)
>  {
> -	DECLARE_BITMAP(values, 8);
> +	DECLARE_BITMAP(values, 8) = { };
>  
> -	values[0] = byte;
> +	bitmap_set_value8(values, byte, 8);
>  
>  	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
>  }
> 

