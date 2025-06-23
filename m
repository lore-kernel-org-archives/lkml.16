Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CF4225417
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 22:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750716839; cv=none; b=bwrMy7UULcQ2d5G0l7mLzte0nConDqGjiX4ZO1JaGrtUfpBKJtX61V5wo3se2Nxvg1+NcwBrEmrZ6v0HnQRrbkJE6QfwzDoxYfrOkYDxbWbG/w4rNuNI08VosTEoCxdmxoKc/Wi/PAz3dACxa6sZzuONsiZ8DWdaAbDTAuJnbOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750716839; c=relaxed/simple;
	bh=wJcXCAJECXi5ljAr628OVAHuy8Y9oZqFr2rrCgRpOIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0J6dn6LD4XwLIwI0qAI97hfUPBvcBj1Fed8jCWgyRhaQIsMidCxDNwAoQjlIK96w2/Mef1+uVwPelTNURQeRn6ledO9GCF9amef0To81hi05EBPwN85fGcywf54EwOC7Inqf02KFtkDP8788JQvrQHrSQJp9u8kzpZveIyylyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Q0WlSs6A; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Q0WlSs6A"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32b4876dfecso56983171fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750716835; x=1751321635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnxqDoaRj0errePw2QkBpLowRG+RBieBmvdQlxqNJus=;
        b=Q0WlSs6AR5lX2jteOzh1KOz7woh17NPJcmkrPj9aav2Psarn1+tj7qk2t9gFYOUtTs
         YeB2Q6zURhSKL+O8lXVrUtm3NJsqLi7Z4cnutdJ7QqZLvB5pr0cx3rnOLik35DMr0R0N
         gctKGajjxnpwvr0FAjcrJdzytbGBIEXHT8tcBDPceTpAasMbUDJ5mAg6bBHU53zTBiAS
         Uz2yxJCiF+u9OoHiJewJxAuokAdsdiNhoJJfJEBKLD6v1+VAhyldrBvkQ/J83ZD+WGpE
         Ywu+HZupTQMRnv1LWjqeiIB7HkDiLqtioQU/0204E9dZd0OsrhiTnrqc3KhJzKgIUjFq
         dw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750716835; x=1751321635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NnxqDoaRj0errePw2QkBpLowRG+RBieBmvdQlxqNJus=;
        b=v3DE6eNPyXodxQeKgwnj6+PueWjUICV/LaUp/sD+v4J9EE/h1pGRisEsFgzikrdQTT
         nP2fQYta6bE+S9JET6tpoIweAb/vmFHHQamHguZ4jxLbCbNfAFdZct+AM5a6Q12couDk
         vHegK3o+fNtJUQ2mqf/cKi1pK5S8SX0BDwvhpk6c2SI9a1ZL5sITEXxKRtaD4K9IPYHD
         qu/4dWKTXDxHo4WakosBmzj6VF9BWO4OlRMKpWBwNwxt8ybp4gUbMmWBBcGrRZOYAZnQ
         veOfsFeTLsviFjfX9DbW2p/gt5Zuzg8E2aCDcGNrCMAJz8XpGWNGuOF0Uc0FjNwZDgZf
         y9OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHgK6RoGpBzdcZbdw0RAZwgaCLnoYGyalK8mT+Y+JrC2UGs4fJnVhL5pP29F0bH5WEdWdSWwKBlem1Iog=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBxlek6pw2Y6OIhgNEr1RyhJO2NXgqEQUNuVMsLIhNCYVsD4ha
	CHqgNtClKSz+MYZUASZc6O0VEPwoNtzQy8CN8m0oulJYtTfZmFi4ExDK8bl9hSHvcHgzacRs5QG
	fxc0mPYQ3P8sTYYMNz9obA66ACPPwYdkmiWwUKOnAxi0+WhkVQjZJI4dSfA==
X-Gm-Gg: ASbGncugTendy0ugSS9t0nTC4FJRJY6d/+1dDHg4FwDh1gq9W4M7tRYxrZhzzmF/v2z
	Y95fqIOljIXaHMZQ/iP9XYF5rRrVsiKcQ58bK3+UGyUczpSwADlCPikP+vHPhfXiYjjyx6DQqYy
	H5E6V7dI9k/sHuS27onw1oJMtYBWFV5gLhygFzmQ0FjhoB
X-Google-Smtp-Source: AGHT+IHifSn0eVzJmS5BrditIB7BKsqxt1CMhoSsnvDLbPgVU43kS75EDseT2mI+y8tbUM6L8NVyQ6zt4qA+TyhW1vk=
X-Received: by 2002:a05:651c:1488:b0:32a:e7b9:1dc9 with SMTP id
 38308e7fff4ca-32cb958b0bemr2452311fa.3.1750716834720; Mon, 23 Jun 2025
 15:13:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-losd-3-inv-icm42600-add-wom-support-v5-0-4b3b33e028fe@tdk.com>
 <20250623-losd-3-inv-icm42600-add-wom-support-v5-1-4b3b33e028fe@tdk.com>
In-Reply-To: <20250623-losd-3-inv-icm42600-add-wom-support-v5-1-4b3b33e028fe@tdk.com>
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 23 Jun 2025 16:13:43 -0600
X-Gm-Features: AX0GCFvR_nDSyo7IJDHgSyfc6fnSxZDup-RqSeIBBq3gfaSlt7C4LZkW-8tJYiI
Message-ID: <CAMknhBEpkWrZdWSrhQS6E1GnENCipf+LxNNSNUyZrm8Gme2f_Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] iio: imu: inv_icm42600: move structure DMA buffers
 at the end
To: jean-baptiste.maneyrol@tdk.com
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 6:56=E2=80=AFAM Jean-Baptiste Maneyrol via B4 Relay
<devnull+jean-baptiste.maneyrol.tdk.com@kernel.org> wrote:
>
> From: Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>
>
> Move DMA buffers at the end of the structure to avoid overflow
> bugs with unexpected effect.

If there is an overflow bug, we should fix that rather than hiding it.

If I misunderstood the problem and timestamp and fifo should not be in
the DMA aligned area and there is a problem with DMA cache writing
over them, then I think we should reword the commit message.

>
> struct inv_icm42600_fifo has a DMA buffer at the end.
>
> Signed-off-by: Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>
> ---
>  drivers/iio/imu/inv_icm42600/inv_icm42600.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600.h b/drivers/iio/im=
u/inv_icm42600/inv_icm42600.h
> index 55ed1ddaa8cb5dd410d17db3866fa0f22f18e9d2..9b2cce172670c5513f18d5979=
a5ff563e9af4cb3 100644
> --- a/drivers/iio/imu/inv_icm42600/inv_icm42600.h
> +++ b/drivers/iio/imu/inv_icm42600/inv_icm42600.h
> @@ -148,9 +148,9 @@ struct inv_icm42600_suspended {
>   *  @suspended:                suspended sensors configuration.
>   *  @indio_gyro:       gyroscope IIO device.
>   *  @indio_accel:      accelerometer IIO device.
> - *  @buffer:           data transfer buffer aligned for DMA.
> - *  @fifo:             FIFO management structure.
>   *  @timestamp:                interrupt timestamps.
> + *  @fifo:             FIFO management structure.
> + *  @buffer:           data transfer buffer aligned for DMA.
>   */
>  struct inv_icm42600_state {
>         struct mutex lock;
> @@ -164,12 +164,12 @@ struct inv_icm42600_state {
>         struct inv_icm42600_suspended suspended;
>         struct iio_dev *indio_gyro;
>         struct iio_dev *indio_accel;
> -       u8 buffer[2] __aligned(IIO_DMA_MINALIGN);
> -       struct inv_icm42600_fifo fifo;
>         struct {
>                 s64 gyro;
>                 s64 accel;
>         } timestamp;
> +       struct inv_icm42600_fifo fifo;

I didn't look at how the drivers use timestamp and fifo, but if they
are passed as a buffer to SPI, then they need to stay in the DMA
aligned area of the struct.

> +       u8 buffer[2] __aligned(IIO_DMA_MINALIGN);
>  };
>
>
>
> --
> 2.49.0
>
>
