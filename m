Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F38170A26
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750741451; cv=none; b=gyYF3u0639TWevkN63LWf/0RMZLKtIfxw+1kz8kmNXPs9nZzSkeIsBeqruUvbD/ogJAIPqT/rsqa5p0hE9GLsDbNPqNzpx6ZbAwG/XY9XmQYNRbIrpazS1++RQBuRPX8EtwZpN4/qDnRAZvBhu2meyDHbxcDVoGbSauGFd2kweQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750741451; c=relaxed/simple;
	bh=jTiiCki4eU516Zn3vPoO1DXReBO81r+B3DSrw6+H10g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RF1cyBIxjvJi6dFDRmlfvh2K7Wp/PxzfUDFzgBQH14gK7pe2nf29U+ivkr1EVTczKDp2C/kySqeyNlTUAD+zNiXV4HUmsfpkd47eIIiPYLtQEVWWgRaB5NN0AXMypd/1dCUNu2f6m5UC3qgjG3NaDzaPVuZEWLfUOBIRn1vqaY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=dWOb3mQR; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="dWOb3mQR"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e7d9d480e6cso3722510276.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 22:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1750741449; x=1751346249; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqEyiR61C1W0/+KTWzUiTKCsg/9mevRSEFCD7wnXFig=;
        b=dWOb3mQRF+UPwFhKoL82ZgCpokjytvrGjzzYOCFRnGoFh7JwltY36KQQW7GqepvrWw
         VmklKGm3kvH8kGR5KMNgJY6gXNZyYOgVqrqRDeVMSeV29EFfCw5MLuvbZra6Zd1OMTx4
         0OHE+FEdOUhii2HHLvg15+50smsv+OsIXm/27HfbztpP48XJ+oGgrp3ib0KZ+AzOZU0h
         RCN6dmVb7jzPZ2445dllEIuYvxBET1epwa3V5f0ZWAi94+35z4kKJrEGvv7EFwEv6nQD
         TVwOPnmaHcN5jRuZesvu7rOmk0iHy9HKMUHc+H/WIzyG8kn98qiBFXlfGjJeEeTJ1d8R
         NWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750741449; x=1751346249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZqEyiR61C1W0/+KTWzUiTKCsg/9mevRSEFCD7wnXFig=;
        b=Yt/5zshCDrWGElGbhEtVdgVrSvFY0dfXW72AOslwLMZ3sGna/CR+l7nnVVWhk5MlIZ
         qNq1iCe2KP5Bz3Br87ILZex0Yk2le4AoOWvEJQMORjQRLd3M/vhFikxy06o0/a1xnvd6
         bY3e4uPhbpHV/VAZ9yL8eWerWpa75rEsjxO5L4I6pBufz93TmAr1MHZ43rvrC+K1USbz
         ZekfARFnCmjE1s1AcqA+o75spIQaiA6l/X0XVN9Dg2uKSfLEM2SRDJBrRqk21hHw2kWo
         YEjrIJWqoQZKc3SXrmvlNAAwTGR0Lp9I51n3Z2HPjegSdPZbCZYEbXFg1p+YGhpSxO2Q
         S8Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWabG4ST/qDGaKMEU8I+mwgWwojh/hQM/YlaPuc7dYX8z7JprKWxCVLSGMMT8S8FCccoNR8UBxpZcVsTmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlAtfUpX/AlRteShrF9beRc4kaI0056lXuMH/vD/JDx6Lyee3d
	Z5+akaaYPNHGRCTFPk7uZI21OS6f4kmCwljitV3EheHdJm0wdJFKpuSjXaO1b15Ur28=
X-Gm-Gg: ASbGncssQT4II93A1E8my34XbC6r8GvYxnbPBQwwmOp7VhsruKeF2jsOHoa7E2rfi7r
	YPKnFwcrkkSGJFGXjnKCW4JA6DIc/TVyc9JzJcZ0sBXEAbPrG2F215DmG7t1tDXEJdCdP5SpJQb
	HjNjE8HDu65Qf/IV+dezKXh992UIXUYmovbB5UnG/Hotw5sXSJKmiI4R6nLg+4flJ6fLsTMDb0M
	OysehBYa4w+xeCIohlD2HRhGF2vM/LRdzgW2zLhKr7aTsDFpDbuakBzRohN8fUkjz9hDIQBQrK7
	m0R6Po+OLdLnkBfLy30Hn79Vrd2ERy3GMweWgNyxUXQpHB8f1FTuRdp+QLR9yvvXAzmMr1a4qju
	ACMbYiMhoYzMq6/E94mKyJdV1xxjhdw==
X-Google-Smtp-Source: AGHT+IF3F9RrxJafQc6fNCXixeVgmrwxN9hiUoyARa+iIR0XupA50lrF5OWzVDrOBXlyJO04e1Awpw==
X-Received: by 2002:a05:6902:6983:b0:e84:3203:1af1 with SMTP id 3f1490d57ef6-e843203255cmr13029358276.3.1750741448743;
        Mon, 23 Jun 2025 22:04:08 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842acb5572sm2846478276.53.2025.06.23.22.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 22:04:07 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e7d9d480e6cso3722487276.2;
        Mon, 23 Jun 2025 22:04:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWlJ+oibwcuEmxlbex4aZZ5MQHRrvvubGu1CQYCqWWu1Bp+pfrf4F3VX0PAIohYnpylRWUDI0WNmQBB@vger.kernel.org, AJvYcCWvQe7csDY5ohki8e2IJLVAL4SzNxQGiSFCRZnFMeFi6YJPI26FFNouBXlUvixftlD2XoKIvw53MD8Ixsc=@vger.kernel.org, AJvYcCXCQslBS5dkTkLG8SU22RdBlpExAgPT/l13hL9gdznvZy6OUigU0p454S7hD0Q8tRqcDswOkfEzaSFa@vger.kernel.org, AJvYcCXqxZq0f6U7y2SdB4CuH3YfjRdHmBdI7/95FeG2E4SsaN2Xois0YeSc0J+mWfmz5SaABsIFr0CrIn+DQVA+@vger.kernel.org
X-Received: by 2002:a05:6902:2402:b0:e7d:a012:290a with SMTP id
 3f1490d57ef6-e842bd31ba5mr17718497276.44.1750741446999; Mon, 23 Jun 2025
 22:04:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net> <2241399.8hzESeGDPO@phil>
In-Reply-To: <2241399.8hzESeGDPO@phil>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 24 Jun 2025 07:03:55 +0200
X-Gmail-Original-Message-ID: <CAAObsKB2tLewhCt6LWtuCW1niCPAHvqjWYAQ8t6fv9YLVsQmJQ@mail.gmail.com>
X-Gm-Features: AX0GCFuWUi05UoZnTls2Tcn0dm5ovOsTmo6J_0Og6xGh9EfBiQOG6iE0FtJ2MtI
Message-ID: <CAAObsKB2tLewhCt6LWtuCW1niCPAHvqjWYAQ8t6fv9YLVsQmJQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] New DRM accel driver for Rockchip's RKNN NPU
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	Robin Murphy <robin.murphy@arm.com>, Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 11:28=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> w=
rote:
>
> Am Freitag, 6. Juni 2025, 08:28:20 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Tomeu Vizoso:
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
>
> > ---
> > Nicolas Frattaroli (2):
> >       arm64: dts: rockchip: add pd_npu label for RK3588 power domains
> >       arm64: dts: rockchip: enable NPU on ROCK 5B
> >
> > Tomeu Vizoso (8):
> >       accel/rocket: Add registers header
> >       accel/rocket: Add a new driver for Rockchip's NPU
> >       accel/rocket: Add IOCTL for BO creation
> >       accel/rocket: Add job submission IOCTL
> >       accel/rocket: Add IOCTLs for synchronizing memory accesses
> >       dt-bindings: npu: rockchip,rknn: Add bindings
> >       arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588-bas=
e
> >       arm64: dts: rockchip: Enable the NPU on quartzpro64
>
> from a handling point of view, I would expect patch 1 - 6
> (driver code + dt-binding patch) to go through some driver tree
> but have not clue which one that is.

I think Jeff Hugo would be pulling it into drm-misc? We still need a
R-b for the job submission patch, and also have the userspace driver
ready for merging.

> And afterwards, I would pick up the arm64 devicetree additions
> patches 7 - 10 .

Sounds great.

Thanks!

Tomeu
