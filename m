Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE2623816B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749598967; cv=none; b=q/n8SiB1CQ7QGUJ03RLsOcEj7nDk/HutQqcsw9X9RIjoS8cXCZ/PjWhivv5lOLwzy5eqDfPwuYSRix5vqsxB4d6kUAv62p0dvoK6MGJm7Io/RRJep4vuIqA6tJEri9nT7RjqyWf5LW+ByCnczfumtwmuAD0PRvcg1Mn2+pH/QGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749598967; c=relaxed/simple;
	bh=BE/PMvc2GdhivuHIGxBicL88pKrhGVTNDt0WIUgyhlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G0pJd2Y+RsMuWVCX0pn0Oo0Wsgr068MkHbMO6lwQ5+//oKlD+D7WMGQom2iN/oqsf/wLEs3QYQg58kK8j/zuWRzU5J/oNGt6vm101d6Ia8CbB0jCC/xCbME3WCzKfb5w1PIem65k7s6wYXy9AuyDK2ere2MzxhnERdlVRL/WvfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLcoMz+z; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLcoMz+z"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-70b4e497d96so55182547b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749598965; x=1750203765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8TOOutMUvALC8WwNkTaCsFKpE+sJJdgWJ/3tM22tTY=;
        b=fLcoMz+z/jlZrSV0jzOvDvgle6IucJoFIX1+ceI5/ST0a3qHWTSLNSV1sdapftM4AW
         FMK6fbcVzJwMOOs1ZPW+yJq7e0mtU+yIfaA6FuuiZJf4ke8FxDKP1lB1dBkmH4HIRBgH
         DwqSNHqy+BbNqJycrFNzhSEh0FBAoOxoHORdMheT2/x4hWPlMfU4wCDY50xCYnQc2gmG
         LM9fw8/wtoelxpmAd0XxRdJ83qIdKhR+S7BKMZKg8x1dYJZltMcJKZEb1daLxolS9tNA
         7Lnx0DfimChSQ28SsulDhPXGRRooEXxcOwX3f3shMz/OrWbMBrYq2OGfAn5GuYtFQbRW
         w+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749598965; x=1750203765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8TOOutMUvALC8WwNkTaCsFKpE+sJJdgWJ/3tM22tTY=;
        b=Idr1ZUEry2PcGbHBee9YXgRc2ar/VZ1/lhvC5+GIi47QT1YpHMYpSlmpwd/t0EHKi7
         SByVU6/iq9Q2TtWNeJAw5MFbYl8odFlT4Z/fB+Qk+GAosqhdsMD0nxQfXrqUYh8nQzvG
         pIZexOlWD8chpfqyQ1DqpISzB9/ptP26+00Pt5VspXS35LWOdDJ+EGfcGRJC0ULIbPff
         akPm7AexJ3/MiYaCuWseHqWgXPMQDnuPTT9eaYV+dBlV0d1kUk7AkB5I7+bECDCXflVS
         jgKwxk61zSdZHgchL01jje2eb5oTfijO5oh9x6s63w/ctT7eAGnA4aWHEYRP8VaV2Z9F
         ryJA==
X-Forwarded-Encrypted: i=1; AJvYcCURKPjMgzmRN+CdADNUOFatlplHVy87TRCuR3zp3fu5wi01jDa9NNljxRChug33SaHT5QkPsvXJjsw7G7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpL5X/5UiY9+mcXmqVCYKwWFie4EI2TuxnnYo9jRQAaEUXvs16
	WiBK05wvXG+KGpy+kitFEOd0djviL0n4hTu7C+ScMwnfYT0IiwQu1zv8JBinhrM0ONe+vwujHja
	C2tk8AUuXeYTfavgz/M+WyPVaXg6DsCY=
X-Gm-Gg: ASbGncv709/lUJzQcfYJIs0HkA4vtYxxhmDQM2cQO0YE7lhKSthBkdIV5BqTk3DduzR
	BPrbilFa34jTSlw+j30L9v9V1J6yTYmxnMLUuHLNYvWE6izH8Dj63Jv0G6awzGZg2WH/EBYl5wC
	HOw5hnVke2VsX2iJU3k/Io/QoDGZpudOTKra5pxw3iGdJK2xGJAqXNyKxFT5M5YLsMXzWtr7vxc
	OQ9
X-Google-Smtp-Source: AGHT+IG8IoJerZ9tPJ57NFpBkzz98vWZVZi+W/mowhH2S6wkZcUT5h6Wr5HLAvZVb90V7W6BL9k4JKRAyiQVW9Pr9Cc=
X-Received: by 2002:a05:690c:88f:b0:70d:ed5d:b4cd with SMTP id
 00721157ae682-71140aa3759mr21079987b3.17.1749598965016; Tue, 10 Jun 2025
 16:42:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602143216.2621881-1-karunika.choo@arm.com> <20250602143216.2621881-7-karunika.choo@arm.com>
In-Reply-To: <20250602143216.2621881-7-karunika.choo@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 10 Jun 2025 16:42:33 -0700
X-Gm-Features: AX0GCFsPgbmH7h-7FibXupnGA8CRFEpg_fxdZD0NolKWkcQmC88U5VOsnQXyKJk
Message-ID: <CAPaKu7TN33c71bQPWMApXQjLOO0gFsC=5rKnuKb0+jfcGPGgFg@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] drm/panthor: Support GPU_CONTROL cache flush based
 on feature bit
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 7:42=E2=80=AFAM Karunika Choo <karunika.choo@arm.com=
> wrote:
>
> As the FLUSH_MEM and FLUSH_PT commands are deprecated in GPUs from
> Mali-Gx20 onwards, this patch adds support for performing cache
> maintenance via the FLUSH_CACHES command in GPU_CONTROL, in place of
> FLUSH_MEM and FLUSH_PT based on PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH
> feature bit.
>
> This patch also enables cache maintenance via GPU_CONTROL for Mali-Gx10
> and Mali-Gx15 GPUs for consistency.
>
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_hw.c  |  6 +++++
>  drivers/gpu/drm/panthor/panthor_hw.h  |  6 +++++
>  drivers/gpu/drm/panthor/panthor_mmu.c | 35 +++++++++++++++++++++++++++
>  3 files changed, 47 insertions(+)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panth=
or/panthor_hw.c
> index f5127a4b02dc..5ec9d7f28368 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -99,9 +99,15 @@ static void panthor_hw_info_init(struct panthor_device=
 *ptdev)
>  static struct panthor_hw panthor_hw_devices[] =3D {
>         {
>                 .arch_major =3D 10,
> +               .features =3D {
> +                       BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
> +               },
>         },
>         {
>                 .arch_major =3D 11,
> +               .features =3D {
> +                       BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
> +               },
>         },
>  };
Are there going to be major archs which do not support
PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH?  If not, we don't need the
feature bit.
