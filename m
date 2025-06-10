Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344551E835D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749599170; cv=none; b=arXfZJtW8bht/UpZcoADUC/fcl/3hHpKVj21uYhUeP8s249GcoOfQ/Qbvgm6JFBX36zHzWZqoirdGNW4LhxVd3El+ughRl1Y9N6tyd78GV392hwlKLqoQ/pE2YcY5xJRwG37JH9NDrlMOZn4Ce6d6WG7FWTcQl5Gc8od7BxFbWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749599170; c=relaxed/simple;
	bh=Sq9m/8Zsgt38t4Fi+k3gyM7dtBAL71nB569xEbVDFBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F2JLDQvB63MHmZK4z6GVZ1A4MO7Bumvfnl41xv/6mTDtklOQhO6mw4f9amDH9C2tdAZ6VIwhKd9KnaFJ+hhgqINhmnOM1U1oExxthKBeYGA4+QVKr/05ZJ9iCoBz1whVWDKSBSTuRqhZH8I9Tz2a7fwvADed3bFIKTwLIxfK3q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGEvCUCh; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGEvCUCh"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70f147b5a52so37197247b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749599168; x=1750203968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaNAWIk693eyh1JuJXCjO7d9zppcw7IioMGsGW5QOeQ=;
        b=gGEvCUChLK0BWG9b5yQyzH/1zzkMqOHbYUR/1SpsCdwialbFYIkZxMH/51qy0Fa+zk
         nV0MRFtdzS7e2+IqRi0NgmeAWt4X9Wr9HOYZJSq7diKcbWse54VT02RHEg6Jbvjpii1N
         l8KrjE7x3hXG5MKzbCpyK9oUs5KSg5eo3Qu323UhQUSmCttyxGI1MPdZYLnmLlxKxygv
         XSOzasAz1UzRuZVvocfub9NLvvwuBwQnA8b0EId6Xuy7qP36mTgvnE1j7mImddotceFW
         DMqqh7S9LGNaFwMXtzcrpN1CQuX2LagjZDtKhekRuCQrugiwKWgq6Kh1A6TJRcnlhjpb
         /Mhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749599168; x=1750203968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaNAWIk693eyh1JuJXCjO7d9zppcw7IioMGsGW5QOeQ=;
        b=GuJXWeUcPPM+5YSei8Mo80VKNjxBUU5PdYfQ4fDRl/VwBAwiIZKVVOUTV3n2+HjIFb
         oI7N9RE5oseDvNQMc2ue0Gc073Q0G2DupLUtVsJqySMN04v8EEwCUV3WDUhT2tM38EXD
         /poY4y+9JBmS7/3ZMUvpEKWveXyMhfkcMhZH2TKYkYvjh/AtbbZH+K2FR+FqKiY1kW4F
         lPq2+0Wz8oLflkLpSWFeKsHPq9svHugaNl+cZVqauTX8FJ0wmzcOtUkTqK/dHgzy3Un5
         rMeuGR5BoQaSyhOfX+lkR2VrM/8KOVEoyCJ9hqsVtvost0/xkoS93LxIk1zn9LSk7NpV
         gtsw==
X-Forwarded-Encrypted: i=1; AJvYcCVvVvQ+y+XHfLhnJgMbx+3R3au9WhmPaR9XycruF662/ab2JywzPv5haMWFC7vsAtpK5I7M03Fa8ZRxN3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWxQD+uEtxgskLAay0vqL6LSb4HynKzUqPzC2/dpJ/AIhEOLlb
	l6+/z6xncnVLgBjn7xXKXdDlq9D4D2uvMOPu9Bu7UlEwkpamvDEeK8fhVPBK25p3Fj5fBgh3HQY
	8M7ATVG2Qnltk4L5pm1iRiu5dJLsbIWY=
X-Gm-Gg: ASbGncsa6eNJKGHbKeu2qF0gnIYqgHro7W2u/z0HOAd2KK322CYpDstu467ekyJ+QOM
	sd1d+QLPoWIHrR6axsM7AsXrtBPyzzf2jfTaJYpFVsM6A11V4UtuBhnL3uta+hGeFvgCgifRJOu
	oOHS8/+f7sjOO0y+O0L0LDCww/8Ov5/QGkT3W7z1fbwJJfPfidSbQvG4xtGk2+wl7RxLRF/YSrg
	h1k
X-Google-Smtp-Source: AGHT+IFlSiYMoXYwvXdw9GGBE1bbuzMyf8oy1xePq+HOQZmDZKnqRN3l+kSWFJuqu+jAvb7ulZL6geoVRsj/h6dDz2Q=
X-Received: by 2002:a05:690c:f8f:b0:70e:2cf0:f66a with SMTP id
 00721157ae682-711423b49ecmr12929537b3.6.1749599168119; Tue, 10 Jun 2025
 16:46:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602143216.2621881-1-karunika.choo@arm.com> <20250602143216.2621881-8-karunika.choo@arm.com>
In-Reply-To: <20250602143216.2621881-8-karunika.choo@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 10 Jun 2025 16:45:57 -0700
X-Gm-Features: AX0GCFtOjUISdCzo6v7j81cqhd-VkhsJOGhuoIsrxLi-HBnY11WkKZSrMnkt8pY
Message-ID: <CAPaKu7TFYuDNns1wwkb9RdZqgurQhAGMMOrOOUsg35umqLNL8w@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] drm/panthor: Add support for Mali-Gx20 and
 Mali-Gx25 GPUs
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 7:34=E2=80=AFAM Karunika Choo <karunika.choo@arm.com=
> wrote:
>
> Mali-Gx20 and Mali-Gx25 deprecates the use of FLUSH_MEM and FLUSH_PT
> MMU_AS commands in favour of cache maintenance via
> GPU_COMMAND's FLUSH_CACHES and FLUSH_PA_RANGE.
>
> They also introduce the following registers:
> - GPU_COMMAND_ARG0~1
> - SHADER_PWRFEATURES
> - AMBA_FEATURES
> - AMBA_ENABLE
>
> This patch enables FLUSH_CACHES for both families of GPUs via the
> PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH bit until FLUSH_PA_RANGE support
> is added. It also adds the aforementioned register definitions and
> firmware binary support for arch 12.8 and 13.8.
<snipped>
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/pan=
thor/panthor_regs.h
> index 4eaa2b612756..8e01440f8743 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -89,6 +89,8 @@
>
>  #define GPU_DOORBELL_FEATURES                          0xC0
>
> +#define GPU_COMMAND_ARG(n)                             (0xD0 + ((n) * 8)=
)
> +
>  #define GPU_SHADER_PRESENT                             0x100
>  #define GPU_TILER_PRESENT                              0x110
>  #define GPU_L2_PRESENT                                 0x120
> @@ -98,6 +100,8 @@
>  #define L2_READY                                       0x160
>
>  #define SHADER_PWRON                                   0x180
> +#define SHADER_PWRFEATURES                             0x188
> +#define   SHADER_PWRFEATURES_RAY_TRACING_UNIT          BIT(0)
>  #define TILER_PWRON                                    0x190
>  #define L2_PWRON                                       0x1A0
>
> @@ -125,6 +129,13 @@
>  #define   GPU_COHERENCY_ACE                            1
>  #define   GPU_COHERENCY_NONE                           31
>
> +#define AMBA_FEATURES                                  0x300
> +#define   AMBA_FEATURES_ACE_LITE                       BIT(0)
> +#define   AMBA_FEATURES_ACE                            BIT(1)
> +#define   AMBA_FEATURES_SHAREABLE_CACHE_SUPPORT                BIT(5)
> +
> +#define AMBA_ENABLE                                    0x304
We still use GPU_COHERENCY_FEATURES / GPU_COHERENCY_PROTOCOL even on
v12 and v13.  I suppose they are compatible with AMBA_FEATURES /
AMBA_ENABLE to some degree?  We should unify them.
