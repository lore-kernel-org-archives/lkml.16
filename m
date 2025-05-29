Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585CA78F45
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748534536; cv=none; b=QywhJI2uQXnUtHEajlu82CzfIx1hy8Bcl54/fiDD2nxgpoJZbjif/G8odT4OskwUgIRmnE03grnmGokrAyQ5jUhNrq5PfxoKsCnI6kzt05BUcd4Ej9b52uMfomNCv3iVNQ0hpJv5EO7fmC+Rx030ZG/0Mts7qX6EiyCWE9rTFw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748534536; c=relaxed/simple;
	bh=C81KAP8MCgz9yCar2aPGpjjkTEombEIZnVIf/7ZW2yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DBJl0OZ7Q/kcq+xQ6DzzSNzeQL794JyjScS89/DMYJbiasi2hPs5N2EnFENBs+aCsHydYz1Y0TwLrhzwPB7AupCR9ojEh7Px0phbwh6rEUxsoBwgOO8bXcGfFfDJ7cFO6IPpzO1npFhFG3hLjeOzNjKRPx0plV1ByZ2E8v3MxD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xZiDlvnA; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xZiDlvnA"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3fb3f4bf97aso300628b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748534532; x=1749139332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=77AhuRKjycx8Mt4z2m2J0PcEvKOBj2b0tESM7TEnK1U=;
        b=xZiDlvnAH8JBdtrwDz09E/mkZwswDvaaRndVBbRH2MZjwuDJcIxLTT8nflCNY4tSbR
         vIZ8h476P2YgKDPDFDPvAbfWrZdMuWPy0j/5PhdDGcuB/HGPMfPGjfC7RB21x0FXac19
         ared2KJajqTznNs2hNajDGC2qyYZQ/wMWo7xGsqKA1JY1dSPEQnrnt9LPlU84D4m+1mI
         oRJLaBRIT/Xjpso3ySXYY1Fj7tkAktqHHO3VxLoOlI9yEaX+XtvzwP7nAkfuztjmiv4N
         PIxbE2yGWqBP28FXdQ/NkzeysZXYbMlzuxdY9BAVIPoaaxJh5PxFy7h1XoiWcKHLcPH9
         rtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748534532; x=1749139332;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77AhuRKjycx8Mt4z2m2J0PcEvKOBj2b0tESM7TEnK1U=;
        b=ZLr1iSkruCx0e8rsLlMzpPp4o3mLHO++4vp0GAfajwi+TAtRzDyfaoPdpi4+PNYckw
         F5T3eBXXQ7J+Q+rlObTX+Y+17ne2HRV+pL8bzaDDxep2cn/59q6PC+noHatFQd+gu1qb
         E85Q7YUPqXqq2d6kenGePqow/EnlzfweMVEgBO7B+Jh5L/XPZSYX4qiVLOYofAvmtNcG
         d7sJS/o4mT5a2BnlrQzL4I3bzRWcEAns2P7+WEAhYzp4yyVoIHH9djosFahnQdTlLqwD
         J6/UlCmL7qLHesP95f5ZZxLyj7A04lx/MuYk9t87KE+l2GjUr2XZLAEr5LofPL6khR0P
         Xxvw==
X-Forwarded-Encrypted: i=1; AJvYcCWQhCANjBL1fZhZ5aW3QPjjwjV6ZXQLnJ4My1E570U5OqHS3fqlZHsMMJeED/3d7qn3qmEDZDIJfHhsm9s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5/wHKyG0Fra7P1nODCUabC831H03dGRrIKasy9o+kGOpMb4ts
	yuzvcY4jqJrUdrt8GqGzCftiewU+/GJ9/3BzwDbpAT77+0Jw7j6RYroynqheJhXCi+o=
X-Gm-Gg: ASbGncvLcLZ2dPvDKjuWyhKyp5Zmqc4ACJzzLS8wlrKLdyolzqVKpZrqtbKFWb370b2
	vnImML1v8M7/FW7iERrxxvUMuh+leoVIhQVkENURAxcnl/UeGSSjYN4hklcz2Wl2/eItec4KSXM
	WCX7o5nLEB4THPm5Z/bhS3fkxMhB912vnTOt4CVLQjFwMAv0llGnY6ZbbYqDysXoitKuCSTohdT
	bCJm+WDDtIZX8KiEyUy7GfPeRvqaMLIsPepKGwg+ekfh9xZnhaIlDfpY2C2dNYfmytksIdV66wa
	M9f9QyPnHzz64mjgdCbALhC6xAHSPHgtunjaYbDjUSQyj00wQBMfadix04RJgdeBgD9n+O9ehwW
	OwJtl49sCNea7n6p8kTmMwDhd9A==
X-Google-Smtp-Source: AGHT+IHkcqd5CwVFJ6fSnhyuSCPtdIuaJyq7PUMwZT0yRXfoKWliGSzc/z/d9bWNKzbH+lkeh5x/gg==
X-Received: by 2002:a05:6808:338c:b0:406:6fd3:ff13 with SMTP id 5614622812f47-406797134cbmr30276b6e.25.1748534532242;
        Thu, 29 May 2025 09:02:12 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:928b:5d5c:6cd9:1a4? ([2600:8803:e7e4:1d00:928b:5d5c:6cd9:1a4])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60c14c711edsm41211eaf.12.2025.05.29.09.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 09:02:10 -0700 (PDT)
Message-ID: <ed40509d-9627-43ce-b209-ca07674988ff@baylibre.com>
Date: Thu, 29 May 2025 11:02:08 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: accel: fxls8962af: Fix use after free in
 fxls8962af_fifo_flush
To: Sean Nyekjaer <sean@geanix.com>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250524-fxlsrace-v1-1-dec506dc87ae@geanix.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250524-fxlsrace-v1-1-dec506dc87ae@geanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/24/25 5:34 AM, Sean Nyekjaer wrote:
> fxls8962af_fifo_flush() uses indio_dev->active_scan_mask (with
> iio_for_each_active_channel()) without making sure the indio_dev
> stays in buffer mode.
> There is a race if indio_dev exits buffer mode in the middle of the
> interrupt that flushes the fifo. Fix this by calling
> iio_device_claim_buffer_mode() to ensure indio_dev can't exit buffer
> mode during the flush.
> 
> Unable to handle kernel NULL pointer dereference at virtual address 00000000 when read
> [...]
> _find_first_bit_le from fxls8962af_fifo_flush+0x17c/0x290
> fxls8962af_fifo_flush from fxls8962af_interrupt+0x80/0x178
> fxls8962af_interrupt from irq_thread_fn+0x1c/0x7c
> irq_thread_fn from irq_thread+0x110/0x1f4
> irq_thread from kthread+0xe0/0xfc
> kthread from ret_from_fork+0x14/0x2c
> 
> Fixes: 79e3a5bdd9ef ("iio: accel: fxls8962af: add hw buffered sampling")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  drivers/iio/accel/fxls8962af-core.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/iio/accel/fxls8962af-core.c b/drivers/iio/accel/fxls8962af-core.c
> index 6d23da3e7aa22c61f2d9348bb91d70cc5719a732..7db83ebeea823173d79bf8ff484add16f575edfc 100644
> --- a/drivers/iio/accel/fxls8962af-core.c
> +++ b/drivers/iio/accel/fxls8962af-core.c
> @@ -973,6 +973,9 @@ static int fxls8962af_fifo_flush(struct iio_dev *indio_dev)
>  	if (ret)
>  		return ret;
>  
> +	if (iio_device_claim_buffer_mode(indio_dev) < 0)
> +		return 0;
> +

I see one other driver with a check like this, so I suppose there is some precedent,
but I wonder if this could be fixed instead with:

---
diff --git a/drivers/iio/accel/fxls8962af-core.c b/drivers/iio/accel/fxls8962af-core.c
index 9aa02f599ae9..2034f4407dd7 100644
--- a/drivers/iio/accel/fxls8962af-core.c
+++ b/drivers/iio/accel/fxls8962af-core.c
@@ -866,6 +866,8 @@ static int fxls8962af_buffer_predisable(struct iio_dev *indio_dev)
 	if (ret)
 		return ret;
 
+	synchronize_irq(data->irq);
+
 	ret = __fxls8962af_fifo_set_mode(data, false);
 
 	if (data->enable_event)
---

This should ensure that if the interrupt handler is running while trying to
disable the buffer, that the interrupt handler completes before returning
from fxls8962af_buffer_predisable(). And no more interrupts should occur
because the interrupt was disabled before waiting for completion.

>  	/* Demux hw FIFO into kfifo. */
>  	for (i = 0; i < count; i++) {
>  		int j, bit;
> @@ -989,6 +992,8 @@ static int fxls8962af_fifo_flush(struct iio_dev *indio_dev)
>  		tstamp += sample_period;
>  	}
>  
> +	iio_device_release_buffer_mode(indio_dev);
> +
>  	return count;
>  }
>  
> 
> ---
> base-commit: 5c3fcb36c92443a9a037683626a2e43d8825f783
> change-id: 20250524-fxlsrace-f4d20e29fb29
> 
> Best regards,

In addition to the race you have identified, I wonder if there is also a race
in fxls8962af_suspend(). This one wouldn't cause a crash, but would cause an
immediate wake.

fxls8962af_suspend() calls enable_irq_wake(data->irq); before disabling the
interrupt by calling fxls8962af_buffer_predisable(indio_dev);

It seems like the order should be reversed.

