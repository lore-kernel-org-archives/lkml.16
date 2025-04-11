Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98616279338
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744343724; cv=none; b=c0y4K6foZao97fDfPuubGbCUcOEuVrhgQRh6QoDnfkckJefqcqZBWq83ilz5Fs7Gc7tM8zt8nHYhzEAQVXBpjQXsaOQWGC5YHnwM/sBV/jx3rzHaMjozmNOGV6QBN6VENpkwnwyBtzfEfLpay4FBfviT6L/oL4sZFnz5G6iSAIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744343724; c=relaxed/simple;
	bh=7scZtjfdkHQl58bOfY5LOVON22T34d3o6bVcYyyKkjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XpwvCBHOl+d9K7T5Wn9cEhsre1Pmf2r/7XW6G4r7V36/eLLiHXyMy9rjOnpORaGIu/1YQKMiHfhR0ZFsp3yDt0QelZQN0LTckgRVd2IgcXDbPrtPosW/MsXDLZtaMfZj0fSD3AB3hF003916Lbb2GQQMZx4ZNi19ksenvtJcHV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ClAujvvE; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ClAujvvE"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54991d85f99so2718620e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744343721; x=1744948521; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L24yBt+u1d+twFNLziQnDE2J7d+Rot77UD9S9Uo4aPw=;
        b=ClAujvvEBa4UTdHedZ71//M9cc93hZv5xK7jMqvCEeyGnZY1of6VZw307R75k9e261
         MV9QvjWi0DgafDAoWfbkdrG197s6twD1go5WVImO9tB7az1Vj5q/DzhdBzV7IQZ2hv54
         3CJFYg5QmgjrSi/lgDnp52lj1slTnOD+B7w7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744343721; x=1744948521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L24yBt+u1d+twFNLziQnDE2J7d+Rot77UD9S9Uo4aPw=;
        b=t6zDAnnX56Yw23O2JErquuzXsxA0O0OvTQH3eaLnBn0Fd4kNBzWHWxLqPH7X8ZvaVA
         /i2JkXLxKD5v1DKtL7dKlQz7K7OOYNgiE7nsA0ZZ5qJH1uSPaUACXlAnUbqupuHGwHyQ
         sATcKHh4u1U0QrvH5Xs7JQB5bc+lU6tbnzVAOcwycA6cCri1IeAKINVfvmfP40nwbXrp
         9QLK961PI/FlxO/P9HjQE0YpEdIEbeoHIB0xYhnWLDJ8mD3QkNy/2w16cm1mHaYQmzQu
         vyakglIkZ9M9snfKEjE/vFJVgCatpEnr5sV+X/ee4fI8E500IEyCobifqZRQs9o+2Paj
         4TZA==
X-Forwarded-Encrypted: i=1; AJvYcCXqRx4fdpOrbRLBKgsN7enmLAYoFwpTdCaBnb68kh6ifcz8wyVoJFcUJKSm5UnwguThbhd0y/1opZf9OoU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg0lX0a+Ej9p9nfTxfVh2q4n658WUJnQE9c8hqtaRb//+SWcbD
	QIGG8/C+vAt9Ec7qU1mVQxbJNX8BSJuKQg6zGkZxGg8I7cHL3azNUF88SMrF/ScXA5oIEejo60S
	h0e4Ob9n36WiQgQTy8BqJbKUS8yzTY0liXqeOrU0zj60fue0r2w==
X-Gm-Gg: ASbGncu3lj/rT+OBiFc1I+jHOg4uwregTMGdWGfPe3xFKdfcbTFTt3bKdFIYMrmdiGO
	71SiKyYctTHD1BAXrcuvnJ/KF0TE31ors2L6+zliln5CQum3+MWMaRS09I/yQfYm7pdvEUYA2iM
	unrn1Sszs4nXzz6WKgh/gzhu5rhpsmcOamaQclhLHPTJ5aH94fWA==
X-Google-Smtp-Source: AGHT+IGST93Mdnl/SJ3+PvqUapn6w0OPuBcimtucgzR0X13Tco1xI5XdA8X9bFlkWHqnnRmz2FJbgZU3TWmcKbz320s=
X-Received: by 2002:a05:6512:3f0e:b0:545:6a2:e59 with SMTP id
 2adb3069b0e04-54d44d53070mr366196e87.18.1744343720614; Thu, 10 Apr 2025
 20:55:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e788aa927f6d827dd4ea1ed608fada79f2bab030.1744284228.git.robin.murphy@arm.com>
In-Reply-To: <e788aa927f6d827dd4ea1ed608fada79f2bab030.1744284228.git.robin.murphy@arm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 11 Apr 2025 11:55:09 +0800
X-Gm-Features: ATxdqUFxZ6XZ0rU2qM_6yVtCZ604t5ctPfjhoKZ6ymLWiIDdpb-O4LgRH2q1G88
Message-ID: <CAGXv+5HpF3f67unRtr483kwMDvQKB=C9PrATFG1+NPXZNzWUSw@mail.gmail.com>
Subject: Re: [PATCH] iommu: Clear iommu-dma ops on cleanup
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, will@kernel.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 7:24=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> If iommu_device_register() encounters an error, it can end up tearing
> down already-configured groups and default domains, however this
> currently still leaves devices hooked up to iommu-dma (and even
> historically the behaviour in this area was at best inconsistent across
> architectures/drivers...) Although in the case that an IOMMU is present
> whose driver has failed to probe, users cannot necessarily expect DMA to
> work anyway, it's still arguable that we should do our best to put
> things back as if the IOMMU driver was never there at all, and certainly
> the potential for crashing in iommu-dma itself is undesirable. Make sure
> we clean up the dev->dma_iommu flag along with everything else.
>
> Reported-by: Chen-Yu Tsai <wenst@chromium.org>

Closes: https://lore.kernel.org/all/CAGXv+5HJpTYmQ2h-GD7GjyeYT7bL9EBCvu0mz5=
LgpzJZtzfW0w@mail.gmail.com/

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/iommu.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index c8033ca66377..095f9e9afe8c 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -538,6 +538,9 @@ static void iommu_deinit_device(struct device *dev)
>         dev->iommu_group =3D NULL;
>         module_put(ops->owner);
>         dev_iommu_free(dev);
> +#ifdef CONFIG_IOMMU_DMA
> +       dev->dma_iommu =3D false;
> +#endif
>  }
>
>  static struct iommu_domain *pasid_array_entry_to_domain(void *entry)
> --
> 2.39.2.101.g768bb238c484.dirty
>
