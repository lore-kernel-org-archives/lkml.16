Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A5730B9A4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751644842; cv=none; b=Xz6mBAYIDAAB+jW4L52coWE/TD+UG8ByC8oL38dVxGVNrRy88SRsN4o3GMmwa/kTezRsj5evI2dYTt7/RBDS3dtu9twprGpYbMEQpvaDOPmoVwAMIg+hql7xT/cW1Lw6l66xrD4SmLRAv3iUALNJRi8q6YzouzhHBg7boRSpIWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751644842; c=relaxed/simple;
	bh=ycMEhz/Ymor31tiNW/7/5CKiWvgFdDIwLPBpH80D5o8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BdO53hFEXtrL5wndvmcVAi7CsyYuI6QXjn/gctx3K9AXHfvJmz7pHk6S7MN6mnb0lg5zTnvdkPrqOB4Hv1vXu/ZKq3kGHV27uo7h9yoFZNcBeJRhLbLQ+NjN41todPBkDGbPYM+/sJjOjMraqNf8fmq7aV3kfPBvDWUofXSkeLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com; spf=pass smtp.mailfrom=melexis.com; dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b=LGf1BJtk; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=melexis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b="LGf1BJtk"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a97a67aa97so7139401cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 09:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1751644840; x=1752249640; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ck5pH4TCdFvbc+j4rr/UURqCRGDwQIto4Y+SJ0crfmI=;
        b=LGf1BJtk8nj5G2733cQR/5VYQgPKrI50a8cn5xDQqe4yo6CtINif5ioDTVbZSLGV9u
         nycQ1JtaHQECDQqZZ/ssmbEWriCRVvtdIZqZYLqoAYCiU4DTHq0aHG0YyVaqVYpDTigk
         dQG9gDjHRnq2CBzEEYoyYVRFAKhawmu3Lt8OcUiDLwfbgUMTCbIBcsinJ3rlL+7xSwnN
         a1B05UREz2biwxArLZ5D7xZERZdvK/lh9M0YYpTLSIOY6zBIqfI5YcwCwkBNCjHDvDbD
         0CKYGGoyEUP7MsKdp8SzuNdvZ9NEpdVL8pSLwV75oxir7UmjQrnTZMDoxJFscIwX4Nq/
         kkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751644840; x=1752249640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ck5pH4TCdFvbc+j4rr/UURqCRGDwQIto4Y+SJ0crfmI=;
        b=m7iCt33G0LycNnVtTTLC28n9SdttsUPVDeThU2zH/4MXO3qCYZdCn81K1WGokZpXEd
         iq53i9nn4pl9Z5rDlOYZ3Jjh8ef8w60CQL9IeytdrCtCxOBq1M5j1sLr79fdrOke2kXo
         vpHgDtrQqywZnJiZWPRsUmAAjoOG7NfyLlJwrr6BchAq53uM4mucXOsIipLR0eOqtgPb
         ttJ0Lv+p6FRY0uCJQcizQun71muA44uUPkjIgoxIV7PWuU2zVevn4+be/JLb1Scf7mZH
         8VXq2QCRumF3tLXNsUQsojtdg9P6FZnpdk9bbTyRnNQM+aLDuAz7/KraKJe7uJldVNEC
         hzQg==
X-Forwarded-Encrypted: i=1; AJvYcCVN3HLLoshw+t8y4Aei1cYpiWLrzFvI+EDvffexxms9A7CeqQgO5V/92FWnumlXbr9LgH5gFg8q+sAjYVs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx9jkZmEyYv6VhmKikj/RZ+kEP2TJJe9NsQCBgonc22R7ZqMot
	GvEe49lJKCCHBpdC+t5T4F4vKqen6raRBKT7bpc38VSWs/UgSXSGboghSCt2dheXAjcwnoW405Y
	r6XFGlvNd317FffiENy6rx3cz1vLYhfJ3wptrb1vS
X-Gm-Gg: ASbGncuqlbuViMm6g7QcaUqU3W+VAx8Pg5Kgsyh8qJu+1KrD0h1s3aiFauthSYEpFjL
	YDO1BpJEqg8IfoQE7leYHcz3Dka+P9Wbf2ETV1plw7yY0i6S3XjTxsEaK/D+UjcqUONrPCG6o5l
	jGaZc62buU0RNWzh3/ICPB2ge/esQUiJlMcZjnSypK19OLncBR+SEjdVrDtWeR/rB759LYoFGWQ
	vhcDLm/FO7zxaeD
X-Google-Smtp-Source: AGHT+IE/Ue+mLX7FnsWxENqyuQ0YBB6qs+VzIgDrYWL+iko7VKcfvXw8DWSoR2RhEh1WBsZm/t2iAUbF1v8iUCzXZ0c=
X-Received: by 2002:a05:622a:1996:b0:4a7:2f49:37d6 with SMTP id
 d75a77b69052e-4a998600242mr38616231cf.5.1751644839366; Fri, 04 Jul 2025
 09:00:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com> <20250704075428.3219924-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250704075428.3219924-1-sakari.ailus@linux.intel.com>
From: Crt Mori <cmo@melexis.com>
Date: Fri, 4 Jul 2025 18:00:02 +0200
X-Gm-Features: Ac12FXydqto7Ti7oKXJu3NtVrCWodiVKgbT6j1TWMXlIlpDLxJ7OBdzg-fhb8Rw
Message-ID: <CAKv63utwwwQVMrAZAGy9rkk5fFPncQ=TzggZf6K0s-+GB-oi6g@mail.gmail.com>
Subject: Re: [PATCH 38/80] iio: temperature: Remove redundant
 pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

If that is the case then:
Acked-by: Crt Mori<cmo@melexis.com>



On Fri, 4 Jul 2025 at 09:54, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
>
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1
>
>  drivers/iio/temperature/mlx90614.c | 1 -
>  drivers/iio/temperature/mlx90632.c | 1 -
>  drivers/iio/temperature/mlx90635.c | 1 -
>  3 files changed, 3 deletions(-)
>
> diff --git a/drivers/iio/temperature/mlx90614.c b/drivers/iio/temperature/mlx90614.c
> index 740018d4b3df..8a44a00bfd5e 100644
> --- a/drivers/iio/temperature/mlx90614.c
> +++ b/drivers/iio/temperature/mlx90614.c
> @@ -225,7 +225,6 @@ static void mlx90614_power_put(struct mlx90614_data *data)
>         if (!data->wakeup_gpio)
>                 return;
>
> -       pm_runtime_mark_last_busy(&data->client->dev);
>         pm_runtime_put_autosuspend(&data->client->dev);
>  }
>  #else
> diff --git a/drivers/iio/temperature/mlx90632.c b/drivers/iio/temperature/mlx90632.c
> index ae4ea587e7f9..bf689f6143f3 100644
> --- a/drivers/iio/temperature/mlx90632.c
> +++ b/drivers/iio/temperature/mlx90632.c
> @@ -1043,7 +1043,6 @@ static int mlx90632_read_raw(struct iio_dev *indio_dev,
>         }
>
>  mlx90632_read_raw_pm:
> -       pm_runtime_mark_last_busy(&data->client->dev);
>         pm_runtime_put_autosuspend(&data->client->dev);
>         return ret;
>  }
> diff --git a/drivers/iio/temperature/mlx90635.c b/drivers/iio/temperature/mlx90635.c
> index f7f88498ba0e..80d0eb7d2294 100644
> --- a/drivers/iio/temperature/mlx90635.c
> +++ b/drivers/iio/temperature/mlx90635.c
> @@ -749,7 +749,6 @@ static int mlx90635_read_raw(struct iio_dev *indio_dev,
>         }
>
>  mlx90635_read_raw_pm:
> -       pm_runtime_mark_last_busy(&data->client->dev);
>         pm_runtime_put_autosuspend(&data->client->dev);
>         return ret;
>  }
> --
> 2.39.5
>
