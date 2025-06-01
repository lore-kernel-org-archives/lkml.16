Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC1618DB2B
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 06:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748760083; cv=none; b=eORXzlGOUDVSwvWC72rD/T1YnDC4hI26Svz1rhKjzebXm7Nx59h7tS7PKNQhQwIKasQxmd1Bb6DecOQveuFdSvRsonDkQL/i49qPnQPuau7Etn5PrSUOo8IGk/SFtnu79WpwuW0lsEuSMw2empdyptmhOu76CUeKDOtqNagfXoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748760083; c=relaxed/simple;
	bh=7nIuduBZSDN8yG4gI1AL7If3QAxZl6VdPtjos3S82gY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LjgL5f+Qs9HLaGRKBBkvAiO36jc7I+ySsV0rQHjhBp4k2bv2EJm3h2pzwfBRvrywvJDX1Ogn61F5HFivqW/KaNEZEHBpRXjBWKzsVWBxxqAyT8ti01QtivobFNq4BQ6Fbq6+AIlKlW8cU6JW7C0vENQ71OMCA0Glq4Z31R9Q+Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=Iv91YkLV; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="Iv91YkLV"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70e447507a0so27150817b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 23:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1748760078; x=1749364878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDv2NwLqpacBBYcKaq5onzHq7Gle/gc1PiMFPCdKyB0=;
        b=Iv91YkLVutRzPUJt7I5MEKsmYl4bqFiausDX1QTkkNJJKMrplETK1xNBQtirXsbS7C
         Rh/+LiXzgBmZz/gKbyFX/opx09kF6Qy6IYcs/T5tI4l6ADh1zufSdIKl9UPtTAlFuc4x
         /dz1WQWCdStLmkv/Dwg//TNjPeExY6OkJfRv/ty5c6NDgkXbxBL73ehtB58PEZfqJWd4
         TcNb+RokOzJYIP/a+qBaq9nNmT7NswFl9zBCl7Htx5ena49a7Gl+/vpI6OqNwOSz10Uy
         MXz59/Wu7MrZEKYKc5S2Pj+wmS1jRP18QlOlNgMM1djtUWMNEnbmCL2o0ZrUbbTmr0r0
         V65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748760078; x=1749364878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDv2NwLqpacBBYcKaq5onzHq7Gle/gc1PiMFPCdKyB0=;
        b=UyYBRU4o9//OoVLRYEoh/y8Wdj1aNqJgiwZ4WCYLHc33xqX6c9uxXtXgMUBRDqDGgU
         eln8P1z8cPaK6rib9XmiTRwQrD3zLsxjndcCe8RRThAuXGKBvBDQXc5Vc0ycHsm3Yibe
         klD0sUhZ4+Z6YHbd/VHeE4cTPT4AlZUnMfzc+l4Hbba5t0+kxlAnW2P2FJdHojvlMYgn
         Rf0uZz6xbRMWbtQs85hHgvSD7+s2TzeBqPbe/jCmLs4AuSbTV5xNO24CdQiC6cg2IHPC
         UfDXRo+BQeHNDBuVRKMc3GrFscZnZqMa8kVhFkQTXSk+PafpcnsaHJDv16D1whIxG3En
         WNiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/Ydttz7z3j3amKDtXYhcMojso0hajg8p441PLKUZDFQ+g9CO2db4HfUCP2RFfAUGd5fUlrTdTSXorgPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMsVW7h53JqnE9KcDfMW4L13SjYgWTwKw5rH9iPL+olkRrjHEy
	ZtSE921K5c2zhBJ7C4RXMtk1WGO4b4lmr7710UlNTb5gg/r11PwgePmt1Si2SLaZYsE=
X-Gm-Gg: ASbGnctahXKxwDcUgnJgrs2JvroT/cBhiRmPW3ceJbKiRZX7SDFJ4oLyY3oKon6xPtD
	S0tP7LnVmCk3g3tB40yxPLpJ8kE54dGOcMJG9KiXU7LyLMVVR+pDgUSTA2iu6gOEXFHxypX/wDe
	9gcIxdZpvuSWo4pL0OmI1QUTQoIEhXksDuMgAWtbThPwZ4xlSK5//GWEhZGpj4X4FnyKSO8HFaJ
	jwQE0YQH+tAF9DgiV1mlGS9dypa3pVL0ysk8n9AQpRucMgu8THjh5JaBH/CEDUqosEajyNkHSgB
	UHUgbLKbtkgt9Fon6VInSKy1lx1Oil85XIICbhA4M2haeQFpvspw1X0mhz/xuOIJg7el6UrtMLH
	FrZfzI3oa4WYOsefuCJarOBHmQYbxGw==
X-Google-Smtp-Source: AGHT+IG7QFqS1UaU0YMRasbmTCx1Tr0K8NUXc+2x5saWfwUXHo9/8qNmSBwBg1YWxFL8D3/84TKyfg==
X-Received: by 2002:a05:690c:7401:b0:70d:ee83:373b with SMTP id 00721157ae682-71057c05dd7mr113923437b3.13.1748760078191;
        Sat, 31 May 2025 23:41:18 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8ac10d35sm15501757b3.67.2025.05.31.23.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 23:41:17 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e7c5d4709caso3232886276.1;
        Sat, 31 May 2025 23:41:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW4CqoNp0vHiwKvDuqV0KtmBY2XYHHgJyx+5Gq+J8ez1ZNP2C9aMyyN0jMKwjErhfEYnPYAF3iWApP6@vger.kernel.org, AJvYcCWMGkuKj8wCKudYlGU09Qx4Uydj1hSG+b8WKrXjEKqC1BZb7ThBqdCha69v2qI6+zzSUqQA7OMv089H@vger.kernel.org, AJvYcCWhKMFiaj17hJMlx25KDCb6MEpqA5JKWJeuTDEuYynugfChPlKrZURQyA6jza5g52L0UEHPqMvCCe2WHVE=@vger.kernel.org, AJvYcCXKCe8Gq6wVcYEHQk8NEE7lrF49TP+G4tqbFEOgss6RMXmQq9cBkroYcNV7lUD5whPzeUSgfgudB+HHPKgC@vger.kernel.org
X-Received: by 2002:a05:6902:1245:b0:e7d:c51d:4b17 with SMTP id
 3f1490d57ef6-e7fec876436mr9326569276.8.1748760077303; Sat, 31 May 2025
 23:41:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net> <CA+VMnFzisyMFzze52RRf6=Gstq29jmukrPSfqXfBWrVw0a7k1Q@mail.gmail.com>
In-Reply-To: <CA+VMnFzisyMFzze52RRf6=Gstq29jmukrPSfqXfBWrVw0a7k1Q@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 1 Jun 2025 08:41:06 +0200
X-Gmail-Original-Message-ID: <CAAObsKDhjkQ_wVcOiVsGPB6QPuWkKPrWEGd-6Oq7BgjX9NhTJA@mail.gmail.com>
X-Gm-Features: AX0GCFuCkivNAaBx7rL3ymXj2J3pJIXqNYSSzMxHaNqO3jwK8nThi-KXGe-k1Hs
Message-ID: <CAAObsKDhjkQ_wVcOiVsGPB6QPuWkKPrWEGd-6Oq7BgjX9NhTJA@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] New DRM accel driver for Rockchip's RKNN NPU
To: Jagan Teki <jagan@edgeble.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 8:50=E2=80=AFPM Jagan Teki <jagan@edgeble.ai> wrote=
:
>
> On Mon, 19 May 2025 at 19:14, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> >
> > This series adds a new driver for the NPU that Rockchip includes in its
> > newer SoCs, developed by them on the NVDLA base.
> >
> > In its current form, it supports the specific NPU in the RK3588 SoC.
> >
> > The userspace driver is part of Mesa and an initial draft can be found =
at:
> >
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
> >
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > ---
> > Changes in v4:
> > - Several fixes to DT bindings.
> > - Link to v3: https://lore.kernel.org/r/20250516-6-10-rocket-v3-0-7051a=
c9225db@tomeuvizoso.net
> >
> > Changes in v3:
> > - Reference in the device tree only the register blocks that are
> >   actually used.
> > - Several style and robustness fixes suggested in the mailing list.
> > - Added patches from Nicolas Frattaroli that add support to the NPU for
> >   the Rock 5B board.
> > - Link to v2: https://lore.kernel.org/r/20250225-6-10-rocket-v2-0-d4dbc=
fafc141@tomeuvizoso.net
> >
> > Changes in v2:
> > - Drop patch adding the rk3588 compatible to rockchip-iommu (Sebastian =
Reichel)
> > - Drop patch adding support for multiple power domains to rockchip-iomm=
u (Sebastian Reichel)
> > - Link to v1: https://lore.kernel.org/r/20240612-6-10-rocket-v1-0-060e4=
8eea250@tomeuvizoso.net
> >
> > ---
> > Nicolas Frattaroli (2):
> >       arm64: dts: rockchip: add pd_npu label for RK3588 power domains
> >       arm64: dts: rockchip: enable NPU on ROCK 5B
> >
> > Tomeu Vizoso (8):
> >       dt-bindings: npu: rockchip,rknn: Add bindings
> >       arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588s
> >       arm64: dts: rockchip: Enable the NPU on quartzpro64
> >       accel/rocket: Add registers header
> >       accel/rocket: Add a new driver for Rockchip's NPU
> >       accel/rocket: Add IOCTL for BO creation
> >       accel/rocket: Add job submission IOCTL
> >       accel/rocket: Add IOCTLs for synchronizing memory accesses
>
> Can this be possible to infer yolov8/10? Do we need to convert PT/ONNX
> to any other common format's unlike rknn?

Both considerations are entirely dependent on the userspace driver.
This kernel driver should be able to support a userspace driver that
accelerates any YOLO version. Should also be able to support without
changes a userspace driver that implements execution of ONNX, PyTorch
models, etc. With or without conversion to an intermediate model
format.

Regarding the particular userspace driver that has been submitted for
review to Mesa, you can put questions and comments at:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698

Thanks,

Tomeu
