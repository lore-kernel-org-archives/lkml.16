Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295E7236424
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749574825; cv=none; b=Ux4XlRB9zb/5w3mDNxFR5GQb7lZ93Xe/9CiftFo7xwQRR1hvTO/Mf8Mv37BoXYm+/XnB+blzdRXngleP5cxZH+xJ8cUr/IfCFbJ5P1pFXI3NqoX45nMYsJMNBb0enhY4Y4+uhj6aY/+1HTsVIQ05y9puWvvtBFuB4cWKg4Hglt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749574825; c=relaxed/simple;
	bh=9hsZLaU75BjpRptkuBvMUF48vhmBMkkHos8UoQfVNSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bqhyl3l4UR+UnTTrRAOu2LTFVFREHYGiIPOsQhdyFg1iUasllbwiZCXScrUd67irGAEOyUN++hGnxgSj6TZwTfGBy+T5YqZx2rOHAf7gBIUP9daFiaUbfj8lS1Iro1+xV8Zi0fFoNCfAcF9EiUDAjFgFSJq03JB1ePpGwdiiku0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GDdzoc8u; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GDdzoc8u"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-70a57a8ffc3so56276377b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749574823; x=1750179623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CpWx/dhcYFHrMuRqfMn/uLf3NBOzEdKJ7PHmZdNdWs=;
        b=GDdzoc8uhjLl6JwBSuN5YC3n9rQuDV6eetXL8fboZoAwwNU8v6RbI8tzjTHQbsgz6p
         Rpw+wubCKLyybh34zofSSdocA27Qp1n2m8EfLx//uNaAHLmU1WY4+ebDVCy0pyfDmBvV
         nCxhqrYpCjsABgRaKCq8vS4Tvw/FJFikPEEI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749574823; x=1750179623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1CpWx/dhcYFHrMuRqfMn/uLf3NBOzEdKJ7PHmZdNdWs=;
        b=jatlpgly44gd5mKcW+Shbk/rWe9ujiVAhZiPiNLvfE8jW0LcGWJU3gzvcIxbxgbMCm
         dZLQZN31hS9xAiTXcruhB7iScQgVX7COF69dtaEO39NCr1Dl/uVm40vL/bvUJIZZX/XE
         zkt6e1nHWIbcldg3hU+enA4djfyZfzU5PkO/vwB3NxMPualQRs1OmTooGhNrjkcdkBEv
         g2XDCr02IWEEGhzNK+/AONSXA6pE7nYKlSgWQU4wVQlhePgBFbI686Oom8YKSZZ/ojPQ
         woc9Hg2G8DaNBEFIxGL7J9hK077LO3SJ1G2PurhWBaltw2ayqTf5Wt9N+9zhGFWRJLMD
         9EZw==
X-Forwarded-Encrypted: i=1; AJvYcCXi61QaE13A+0NPuos7Lq5zvX9971hbZIU8KpYMctNRUVn821F3TZgAjzzJ6fGsDPOlRD+TFWiYN0b1X0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLd8w2y6JLNwOxBqgKYEk6nzM8g2bS4pLzGVdGfhRGYQ1yNgfH
	dprd68ORYDJ3CJYoQ+ZdjK8lNqlJyTHZsyZF6SZ0sKUHxNWhpw9BP3xm1U0N2BDBBgBu8L1S4ha
	S38d9LtO25WIQ7T4I54vrcj7OGg02kRmE7myrpKMx
X-Gm-Gg: ASbGncuSiPgCDWqQsCCKkQgNOB2rlTDf4ySdwG7XSd5ZXiJmudPD4Z7itm4qaCNrXq3
	CyjfKjdY2nLQeHHtZqlTNOZydK2l2WvIFtJwuOCZnbmkY6ycbE6ig2tbEWXU+cMhEN+NQJBiKnS
	JS/c17ikQQ0s81wBQ6rrKWoF2LceFiTshWIdtlqgSMjY6EY8UmEqCf3Q==
X-Google-Smtp-Source: AGHT+IE00ce8xDusfDQD3NtC4YowjQLIoj1ZSjHEA05wiN/p3V0Le4pgsgSFjs0cflbETy+V51Wu5cNchYcgN7AsnTw=
X-Received: by 2002:a05:690c:4906:b0:70c:d322:872c with SMTP id
 00721157ae682-711409e4d32mr2975947b3.1.1749574821564; Tue, 10 Jun 2025
 10:00:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610153748.1858519-1-tmichalec@google.com>
In-Reply-To: <20250610153748.1858519-1-tmichalec@google.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Tue, 10 Jun 2025 10:00:10 -0700
X-Gm-Features: AX0GCFuwttqkyiSf7Z-Y9KrGw93dCiqxmCXC4gASs51y4epRMY_H18lbkfSbcSA
Message-ID: <CANFp7mXZXSJLYTO+2rkn+W6ki_hnzBPJ6s8MwtFFeyPqLbzQ1g@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Defer probe on missing EC parent
To: Tomasz Michalec <tmichalec@google.com>
Cc: Benson Leung <bleung@chromium.org>, Jameson Thies <jthies@google.com>, 
	Andrei Kuchynski <akuchynski@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Konrad Adamczyk <konrada@google.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 8:39=E2=80=AFAM Tomasz Michalec <tmichalec@google.c=
om> wrote:
>
> If cros_typec_probe is called before EC device is registered,
> cros_typec_probe will fail. It may happen when cros-ec-typec.ko is
> loaded before EC bus layer module (e.g. cros_ec_lpcs.ko,
> cros_ec_spi.ko).
>
> Return -EPROBE_DEFER when cros_typec_probe doesn't get EC device, so
> the probe function can be called again after EC device is registered.
>
> Signed-off-by: Tomasz Michalec <tmichalec@google.com>
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index 7678e3d05fd3..f437b594055c 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -1272,8 +1272,8 @@ static int cros_typec_probe(struct platform_device =
*pdev)
>
>         typec->ec =3D dev_get_drvdata(pdev->dev.parent);
>         if (!typec->ec) {
> -               dev_err(dev, "couldn't find parent EC device\n");
> -               return -ENODEV;
> +               dev_warn(dev, "couldn't find parent EC device\n");
> +               return -EPROBE_DEFER;
>         }
>
>         platform_set_drvdata(pdev, typec);
> --
> 2.50.0.rc0.604.gd4ff7b7c86-goog
>

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
