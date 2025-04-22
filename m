Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB861AA791
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 20:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745352156; cv=none; b=AjaSg6+zcgvYqX6Oqs3Ex4rCLsIjsfIadgzizMKrb7FHsbvhQNvHn9Lcg6/wnrZXH8pmXK+YfYybhpWq9a0oUNjBWelxfOTzNoR97abE9SJcMMzUShXxZydFGiIWZfLjosb2Hx5+hnsy7bttLjSFYRIjBD+0LOeX7mW6Imit4ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745352156; c=relaxed/simple;
	bh=1nSSP/2kRzhGO7fA+xH4AxdXe/AO8I11Gk3oJfT76tc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k0zYx3VpmpoLXNEO6ovalhuCx2vf4aBboN3/rA5B0adyqDyJmcGV5TohxhLKyNkIYxtedRjcVaL+/geACSNgQx9WmzX9cjAm4gOQQvGCVOuEwM4EwjqbqCU2PVrcheGK1AQWoPEdIjO36fSKhZXZN1ZJrCYuiHH4vgl80koiPrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=XA7C0WAw; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="XA7C0WAw"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c58974ed57so534230385a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745352153; x=1745956953; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9u1inJLOLfQh6u+GzwXvGD1x0ZTwyyXPt4wVXYzgNE=;
        b=XA7C0WAw8KQpmEduuOFmHqmEQ2d8GbK3IzOKa+O7cbKlZlGWotwnFqpd4dJ7RKCPfw
         Mk89u34jXtzts04zpGuH9duMva33hLcT1Vro9M7QjpGUXGOycHoTpnKhsU1WfjWhE+YM
         yp9XQ2qpypmJZsUFbi9mNykl6qqoniUfNGsWcBTXV0D79GHmkwHvcUvLKs9u2yAdnT4R
         UP3FGm3yrBLgbHxKV/glpdlrRjnpTuAfsa4qWX84cAL13+8f/rFprQUEYmgI6QIvlqsA
         lEwJ/0fSHoU17/EW/VlcF3pwIZgs2jOHVkzybsCzT3dRo0etsm71pkhMpac27G3AJD0v
         UD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745352153; x=1745956953;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s9u1inJLOLfQh6u+GzwXvGD1x0ZTwyyXPt4wVXYzgNE=;
        b=mRN23bGa05mkFQPhE1ox5fpONiK39vwDCd+F/zh3rcbAxxz3n66stQUFLkMRMhgbGQ
         g6FotOPZ1AO1EdnVvI+V1QfLjc73q9RW9zBfF05djjKOWT65aQsuyoRvKfz7a7XJSEQw
         aWm+qJjYLSfRpm5K0ds2yuQAAe8c9MSx4wbm8mRfZUyc80Hs1LwVghqcIqjWgogEhsTg
         H4nmUhAx76SfBTwnhK5IQdpSYoBn0eycIkv+r+5kFrogQzZXi7qXrz9bnX4MAOLhnbeG
         0PyNF48RgnMmKdkRZkyh0S5dqPEA7A0LUKNoGGCa3T2aPvh8GUVLKdgoQsO9CHoZyi9O
         Y6uA==
X-Forwarded-Encrypted: i=1; AJvYcCX4+nRo/QOLZQcQIMp75kQg+3LubY/XDSAr7yGjMtpdXHFZnjlw/6C0OLxcleTIWvG9JlnwU7A6MbU7To4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCJdOidWJmi3+VVyu6cNJwSJzel0ykhMrLno1wAFnpEMhm1ii6
	cfv08xhOCGL3VFWuWfklNxef0hHbTez++MroidrJFlo5aox+rb+KI3nD8JrWxM0=
X-Gm-Gg: ASbGncvsWrfwCfPU0IlgOomH4oV5n5v+GG2/M9XrrxJL9TNuxTyYUI9/qY5CRiO5fAO
	lCCg/8ClOFdeM/PeBxArqiGg5ii0V2X2QNP0nATyGZTbRncsooD98CUdi8+TtrpjNZihttt6iWv
	aDUwInUqvlpj6q4sgrLJGbNq5JCm/vuZPXJ5RUb8U/7NQ16yOH5py1Gze9g+EFQT9T8yAExAOt6
	OlUDdUjKvTvNnQ5kVkaBw4mBLQbyyHndhtV9LMAzicb8986ZNFQdyZoZSKpV1kiMROsEWz1/E6/
	J7bW9ADFvo/3Pvqb06jty3tL9Iw9S1c6eC2SgnA3USxgVQ==
X-Google-Smtp-Source: AGHT+IEyfUity8IZHL89fVip+YlKPkQeYXQ/cc/i4hOtn80oieQH71fbgk3bqPItSdc1oVh2sxqqRw==
X-Received: by 2002:a05:620a:45a6:b0:7c5:5d4b:e62a with SMTP id af79cd13be357-7c92805f2f4mr3022695985a.54.1745352153635;
        Tue, 22 Apr 2025 13:02:33 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a8f3c5sm593665885a.37.2025.04.22.13.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 13:02:32 -0700 (PDT)
Message-ID: <5f215b62927438061eb004694847705406a6814c.camel@ndufresne.ca>
Subject: Re: [PATCH v3 2/3] media: verisilicon: add WebP decoding support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Sebastian Fricke	
 <sebastian.fricke@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>, 
 Erling Ljunggren <hljunggr@cisco.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart	 <laurent.pinchart@ideasonboard.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Jean-Michel Hautbois
 <jeanmichel.hautbois@ideasonboard.com>,  Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Date: Tue, 22 Apr 2025 16:02:31 -0400
In-Reply-To: <20241121131904.261230-3-hugues.fruchet@foss.st.com>
References: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
	 <20241121131904.261230-3-hugues.fruchet@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le jeudi 21 novembre 2024 =C3=A0 14:19 +0100, Hugues Fruchet a =C3=A9crit=
=C2=A0:
> Add WebP picture decoding support to VP8 stateless decoder.

This is a bit short. I believe I've asked to explain why its fine to
bump the NV12 max width/height to 4K here or in the code. Also, will
need a simple port once the PIX_FMT is changed.

Nicolas

>=20
> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> ---
> =C2=A0.../media/platform/verisilicon/hantro_g1_regs.h |=C2=A0 1 +
> =C2=A0.../platform/verisilicon/hantro_g1_vp8_dec.c=C2=A0=C2=A0=C2=A0 | 14=
 ++++++++++++++
> =C2=A0.../media/platform/verisilicon/hantro_v4l2.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 ++
> =C2=A0.../platform/verisilicon/stm32mp25_vpu_hw.c=C2=A0=C2=A0=C2=A0=C2=A0=
 | 17
> +++++++++++++++--
> =C2=A04 files changed, 32 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_g1_regs.h
> b/drivers/media/platform/verisilicon/hantro_g1_regs.h
> index c623b3b0be18..e7d4db788e57 100644
> --- a/drivers/media/platform/verisilicon/hantro_g1_regs.h
> +++ b/drivers/media/platform/verisilicon/hantro_g1_regs.h
> @@ -232,6 +232,7 @@
> =C2=A0#define=C2=A0=C2=A0=C2=A0=C2=A0 G1_REG_DEC_CTRL7_DCT7_START_BIT(x)	=
	(((x) &
> 0x3f) << 0)
> =C2=A0#define
> G1_REG_ADDR_STR					0x030
> =C2=A0#define
> G1_REG_ADDR_DST					0x034
> +#define G1_REG_ADDR_DST_CHROMA				0x038
> =C2=A0#define G1_REG_ADDR_REF(i)				(0x038 +
> ((i) * 0x4))
> =C2=A0#define=C2=A0=C2=A0=C2=A0=C2=A0 G1_REG_ADDR_REF_FIELD_E			BIT(1)
> =C2=A0#define=C2=A0=C2=A0=C2=A0=C2=A0 G1_REG_ADDR_REF_TOPC_E			BIT(0)
> diff --git a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> index 851eb67f19f5..c83ee6f5edc8 100644
> --- a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> @@ -307,6 +307,12 @@ static void cfg_parts(struct hantro_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0
> G1_REG_DEC_CTRL3_STREAM_LEN(dct_part_total_len),
> =C2=A0			=C2=A0=C2=A0 G1_REG_DEC_CTRL3);
> =C2=A0
> +	if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_WEBP_FRAME)
> +		vdpu_write_relaxed(vpu,
> +				=C2=A0=C2=A0 G1_REG_DEC_CTRL3_STREAM_LEN_EXT
> +					(dct_part_total_len >> 24),
> +				=C2=A0=C2=A0 G1_REG_DEC_CTRL3);
> +
> =C2=A0	/* DCT partitions base address */
> =C2=A0	for (i =3D 0; i < hdr->num_dct_parts; i++) {
> =C2=A0		u32 byte_offset =3D dct_part_offset +
> dct_size_part_size + count;
> @@ -427,6 +433,12 @@ static void cfg_buffers(struct hantro_ctx *ctx,
> =C2=A0
> =C2=A0	dst_dma =3D hantro_get_dec_buf_addr(ctx, &vb2_dst->vb2_buf);
> =C2=A0	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
> +
> +	if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_WEBP_FRAME)
> +		vdpu_write_relaxed(vpu, dst_dma +
> +				=C2=A0=C2=A0 ctx-
> >dst_fmt.plane_fmt[0].bytesperline *
> +				=C2=A0=C2=A0 ctx->dst_fmt.height,
> +				=C2=A0=C2=A0 G1_REG_ADDR_DST_CHROMA);
> =C2=A0}
> =C2=A0
> =C2=A0int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
> @@ -471,6 +483,8 @@ int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
> =C2=A0		reg |=3D G1_REG_DEC_CTRL0_SKIP_MODE;
> =C2=A0	if (hdr->lf.level =3D=3D 0)
> =C2=A0		reg |=3D G1_REG_DEC_CTRL0_FILTERING_DIS;
> +	if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_WEBP_FRAME)
> +		reg |=3D G1_REG_DEC_CTRL0_WEBP_E;
> =C2=A0	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
> =C2=A0
> =C2=A0	/* Frame dimensions */
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c
> b/drivers/media/platform/verisilicon/hantro_v4l2.c
> index 2513adfbd825..7075b2ba1ec2 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -470,6 +470,7 @@ hantro_update_requires_request(struct hantro_ctx
> *ctx, u32 fourcc)
> =C2=A0		break;
> =C2=A0	case V4L2_PIX_FMT_MPEG2_SLICE:
> =C2=A0	case V4L2_PIX_FMT_VP8_FRAME:
> +	case V4L2_PIX_FMT_WEBP_FRAME:
> =C2=A0	case V4L2_PIX_FMT_H264_SLICE:
> =C2=A0	case V4L2_PIX_FMT_HEVC_SLICE:
> =C2=A0	case V4L2_PIX_FMT_VP9_FRAME:
> @@ -492,6 +493,7 @@ hantro_update_requires_hold_capture_buf(struct
> hantro_ctx *ctx, u32 fourcc)
> =C2=A0	case V4L2_PIX_FMT_JPEG:
> =C2=A0	case V4L2_PIX_FMT_MPEG2_SLICE:
> =C2=A0	case V4L2_PIX_FMT_VP8_FRAME:
> +	case V4L2_PIX_FMT_WEBP_FRAME:
> =C2=A0	case V4L2_PIX_FMT_HEVC_SLICE:
> =C2=A0	case V4L2_PIX_FMT_VP9_FRAME:
> =C2=A0		vq->subsystem_flags &=3D
> ~(VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF);
> diff --git a/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
> b/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
> index 833821120b20..c291b1560e20 100644
> --- a/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
> @@ -22,10 +22,10 @@ static const struct hantro_fmt
> stm32mp25_vdec_fmts[] =3D {
> =C2=A0		.codec_mode =3D HANTRO_MODE_NONE,
> =C2=A0		.frmsize =3D {
> =C2=A0			.min_width =3D FMT_MIN_WIDTH,
> -			.max_width =3D FMT_FHD_WIDTH,
> +			.max_width =3D FMT_4K_WIDTH,
> =C2=A0			.step_width =3D MB_DIM,
> =C2=A0			.min_height =3D FMT_MIN_HEIGHT,
> -			.max_height =3D FMT_FHD_HEIGHT,
> +			.max_height =3D FMT_4K_HEIGHT,
> =C2=A0			.step_height =3D MB_DIM,
> =C2=A0		},
> =C2=A0	},
> @@ -42,6 +42,19 @@ static const struct hantro_fmt
> stm32mp25_vdec_fmts[] =3D {
> =C2=A0			.step_height =3D MB_DIM,
> =C2=A0		},
> =C2=A0	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_WEBP_FRAME,
> +		.codec_mode =3D HANTRO_MODE_VP8_DEC,
> +		.max_depth =3D 2,
> +		.frmsize =3D {
> +			.min_width =3D FMT_MIN_WIDTH,
> +			.max_width =3D FMT_4K_WIDTH,
> +			.step_width =3D MB_DIM,
> +			.min_height =3D FMT_MIN_HEIGHT,
> +			.max_height =3D FMT_4K_HEIGHT,
> +			.step_height =3D MB_DIM,
> +		},
> +	},
> =C2=A0	{
> =C2=A0		.fourcc =3D V4L2_PIX_FMT_H264_SLICE,
> =C2=A0		.codec_mode =3D HANTRO_MODE_H264_DEC,
