Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47CA2D540F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749597137; cv=none; b=VMj7OyXqX0DuO6xKkd5Z+L/Jf44fCEbd2GJqbR+G/VUtmy/qd6KNq5xKhEFMaFw5VipTnb6j/493rNO0tV/+eEaDrsXkzEcb15ZrQ2fYX32WDy7QYbf/FhbkBpeXFFnHRlhqw60p6Nf8cQZBWgxGV9XO7Dw7kenhXGxgy5fsczM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749597137; c=relaxed/simple;
	bh=IOh0QevXlTT/FfRbCC7y1VBSlVzPIrZPPZbTk1zGyv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YMlajNemcBbC+8WRh/4LcWlnLCe8SBFxR1qo5dZ4PGdHLfZ33qIChn2kxzxkojNPJbrgta2v7YuKCxpOvKMuBQWw/BoK98lZanm/YE2ybZpOGGi7BEn53/5Pfta4gvCa7d2Nxbpf8AKxJwe6uOvmpzJCreSaBLUyVgsiIVYit9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1tyN4JB; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1tyN4JB"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-70e64b430daso58554867b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749597134; x=1750201934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZHaVkiLrbaAoem+fJHSN03rlECJT5C5GzqrHElASHo=;
        b=Y1tyN4JB6qxcqTUc1lfvA+CSRJ7y9ds77+qyhfoVAbMqGkU8WsGjxMXNay+b+WnUet
         tjgT3AHoEdGIjY0UsOpQ/zvAn7/BPzYz+g7TO1yDSBbIPiQvxwpQfqErw/J8iUaaJR07
         wWOpc9kXzECneOnPBTiE8pXQKhd3ygd2YG7sgV573pqAtd0GIs6sWZJybu0eFKC4KS6g
         O9qEXZUfq8TNQFSRJ93GwG2tmwUwXRkbj8/cyGw6FVZdGbBzsW8StJbIo7QLCxw5+hda
         Rw1F2BdgKvff2qYqmG7yzRgHJZ105MYotJdJF1vnFeYUx6INw9sRYvRKpgJ6NeteN6wk
         IfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749597134; x=1750201934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZHaVkiLrbaAoem+fJHSN03rlECJT5C5GzqrHElASHo=;
        b=gq2PnteV9sKuoJHXTzp+IAkAnMxW2VpFLXiOb8GzkARDYVdgsz/3C58UXDWDp/PIo0
         reTNVkVI+SjUj7at/AU/WTNbvZzHI3uO8ctsQaT0ohVS21py+90ykBnyYANS1zQBENXG
         gQFFkVN/xvDyzIzV/0vH64XLeFHoskfNq0URKF2QRjqQf9YvetxqRivybGwIEJlNDzur
         7p31S4Xvu6dbMolmtwwa21zM1bhqUBc2YSG7KV0I/taeytuUhmTnkgLYOvaXd+T6cZ7L
         ilA1RWmgmJ9WcAd9Gr/0T3oDGL5zkYasKeYVS8rEqP2sOgy1UdiILXi/vMBe9v4PnBF1
         JOVA==
X-Forwarded-Encrypted: i=1; AJvYcCVCtmG5ocitMzHGDURBrQJpg+HJboqn8MjPhUWhui50k/N2JKa834HTKKTX+MIxYIGBPB1krYmLYBZvYK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjahSdAsUNfJQylOK7Ay5TQpyHaRsG7M7xgFQbcLhpagYu6Jc9
	d4pm8Yzp1592gdUGz9CTT7PDPqTDEXcQEjkASAK+5ZqUIed48xb+A/1QPYQYOb9Exui+UWyTPfU
	/HNQMoZeJBPCVDxc32X2XESvOCzBgBuI=
X-Gm-Gg: ASbGncsPrS8Wv8YVnK+zx3nNftgVA262ZcQs9R5zx/q2aU1+rUM2ghjO74wx8EsFg5m
	M2Ax4ItTsyc06nIZqdgeNKHrMjkn+nRWegz7JbOqmtVXDbavwPQ2BlcUAmCVob7/0V7HJjTyLDB
	d7j96GmAyTS9Ij1JqiF0bkA/nanqqTaDLs/7LRLas7UWIgsd4ZPSntN+BVc2SGTcWr12EMzZEn9
	I1F
X-Google-Smtp-Source: AGHT+IEXDVnMUtCIHT0EzmIFREsVFhabB3kvSB6CwQcovD6visnkC9fl3iyGLCJk9zRI3gOuA6yIMYxXNcI0Rd99pD8=
X-Received: by 2002:a05:690c:39d:b0:70e:7706:82c1 with SMTP id
 00721157ae682-71140af1863mr18827157b3.34.1749597134588; Tue, 10 Jun 2025
 16:12:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602143216.2621881-1-karunika.choo@arm.com> <20250602143216.2621881-2-karunika.choo@arm.com>
In-Reply-To: <20250602143216.2621881-2-karunika.choo@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 10 Jun 2025 16:12:03 -0700
X-Gm-Features: AX0GCFs0t2lD4ebPOfl_N7eCj67AHAfs5lteWu97IH0qtVxZ_pexAD0d0DDX1BI
Message-ID: <CAPaKu7TbzqjF+q7McOS3JppiKfg=zKFr4aYQZGsmvOnR+jEN3g@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] drm/panthor: Add GPU specific initialization framework
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 7:33=E2=80=AFAM Karunika Choo <karunika.choo@arm.com=
> wrote:
>
> This patch provides an initialization framework for multiple Mali GPUs
> by introducing a GPU support look-up table. Each entry contains, at
> minimum, the architecture major version of the GPU, and may optionally
> provide feature flags and register offset overrides.
<snipped>
> +/**
> + * struct panthor_hw - GPU specific register mapping and functions
> + */
> +struct panthor_hw {
> +       /** @arch_major: Architecture major to match against */
> +       u32 arch_major;
> +
> +       /** @features: Bitmap containing panthor_hw_feature */
> +       DECLARE_BITMAP(features, PANTHOR_HW_FEATURES_END);
> +
> +       /** @map: Panthor regmap */
> +       struct panthor_hw_regmap map;
> +
> +       /** @ops: Panthor HW specific operations */
> +       struct panthor_hw_ops ops;
> +};
None of the fields are really needed even at the end of this series.

Can we merge patch 1 & 2, introduce just panthor_hw_init and nothing
else, and let panthor_hw_init call panthor_gpu_init_info?


> +
> +int panthor_hw_init(struct panthor_device *ptdev);
> +
> +bool panthor_hw_supports(struct panthor_device *ptdev,
> +                        enum panthor_hw_feature feature);
> +
> +#endif /* __PANTHOR_HW_H__ */
> +
> --
> 2.49.0
>
