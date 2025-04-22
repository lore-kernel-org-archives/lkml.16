Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E2B298CC7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 19:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745351887; cv=none; b=bRjugdZuc5Sg9ydxI8iPCUtf+vDzohIjgSPj19H6ZEOSSD1kWd8ks16+Grka1I9dMknMJ9pQ81rIh+5ygtb0URgs1ArKIGMG37XtL+DqXTjVII6BHbegs+4+7jk0bsOynXkrsFy+JZS0AKb1SxSWrl6fKSG5U5/6MARbUWSKeao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745351887; c=relaxed/simple;
	bh=UCc9IenOlRQt7veSnMNvgDmw1rTTzCVeI7tkZWg+g0g=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=td91mroZLiyvqImV6MSrd2sU7YnmHPJPrAK8lzJ03iw/SckM+aH0SfP6TcU1mFSFHyJv+aTAK6rPswrsc8r/nzEsGh0TrIEciUr7IpXMOcPvnKqKxsWsA7yQtjxsGOo3xu2hqU+QdRBy9d8MvfmvsgwRhl8Uy40WVpKlRgpk26k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=K62lC8az; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="K62lC8az"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4769bbc21b0so54426911cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745351885; x=1745956685; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wi0XCQ0wIgKNjQqJTUBlgswWdaLbIuH1pbfLDZVamA8=;
        b=K62lC8azJ9dU8MYX4L1lNETjpRr6r9ikSRLWKInE8I+n/HDK/BfKvpSm+hB61EO+9b
         ij89z9bQ6weItF5IFj1vYPdy+4u/lTQ5gl+7sBSsvrQG2XjPtCPhBQ1fr8c//U2E23re
         7XjRc5/gfJnvQyZEJlrW9TVIwxgQwM4cNi8TUdxwppHon0RT+eI4UPtrc5LO0kxTZoeG
         7ho4Qf3BiHuTVN7+ImE7o7XS8QflvyGmNlHiAqWMYL+IZaVIn+fRr95UQxJvSnTj2aYu
         zGtXVzVepKsKezfq6duCTpFoFAEGUt61kH9pcbIGRbh90UBju/g/rkk6wrmzMQqC58LZ
         vtlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745351885; x=1745956685;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wi0XCQ0wIgKNjQqJTUBlgswWdaLbIuH1pbfLDZVamA8=;
        b=I2b04zzXS2tBygo1GLfcbwTJIibdt/jeEnlnsO82Xfnx9SJ6XkAUkTbSNeEPg5U7KE
         sbyqW7JQMnLjhSZR3UzqGHUMNHJpPiOPu7LR1Yd1tbjhwR6GcSd4C8YwjfGHZk7fDbEt
         7E+02O1gi8BOHfxb1wHFkmsqIj4OpPO6oGtWZ2AF1C3byGytwpE1fQ8fCdHv1TEyIt+d
         BRShSPH46xCdKwQzxf7A7Dfbv4MUoI1GYeiQNcxFXSWptB+ETFsm0X3Vnyb6widMxaNZ
         NGKZWmmfXta3qwzOWqBbEPd3Bo+ack0/6tB9hPtNX3I6cPNd3zpw6hBjh178DjxZfqwR
         RsUw==
X-Forwarded-Encrypted: i=1; AJvYcCWIUETAEZWMaj1lcyfH+xCXuN8EOWcYlmplb2LJM+Xk89cCIM+eodNLacSyOXURXx2rpsDZOMpkPThCbhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkVZTVT4qmysn/6qV9eFOhe8qN9ZRk16UCqYFw8sDQBjhScx+M
	qQb+YwhD5GD3TmBiMQE05mHArhRpXdMT5lRqQoOzx4e/WzJCP5JxMRaoIZWcX+E=
X-Gm-Gg: ASbGncsfeNOeTG+qE62AgxBaYsp3mJEM7j2tHJ0ncXTiHK7uCJ/7+EXigOWuo4kifIg
	RqRQAZeny5iTAdHIVAdNdfSEVMwPCifnbAtqoL7ueKsLwr1X/A0SGAgazvhfOVPJfJQDWA0wznG
	XsRQp1Fuk9lt0ZzX5migYBzNL9dX1mveespqW6iSyF6nnU2fFIj2ViL4RFGeYjOu66Gumcz95MM
	R6TiXtg8f5DekYpUA7kzO25ibjwIp/ClM8/zG6WF7VzONLXv/mMvyTW4zlUD49M3Y3CBWuropkO
	xeu6owH6o6gW9gUYS+pq05kgvrZH2TD/JtQcmFZvOAPXpQ==
X-Google-Smtp-Source: AGHT+IF7avo9uEX7A3mW4T8l6RGnGWjnOiUes3AEZlicK2QwGeYThk0IGDXmi5oRWeE+79xJPQKX3w==
X-Received: by 2002:a05:6214:19c8:b0:6e8:fad9:c688 with SMTP id 6a1803df08f44-6f2c4552a03mr278764626d6.16.1745351884909;
        Tue, 22 Apr 2025 12:58:04 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af1433sm61506056d6.19.2025.04.22.12.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:58:04 -0700 (PDT)
Message-ID: <529a9804d5b14322b2be78ea6f98677db9c23c33.camel@ndufresne.ca>
Subject: Re: [PATCH v3 3/3] media: verisilicon: postproc: 4K support
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
Date: Tue, 22 Apr 2025 15:58:02 -0400
In-Reply-To: <20241121131904.261230-4-hugues.fruchet@foss.st.com>
References: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
	 <20241121131904.261230-4-hugues.fruchet@foss.st.com>
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
> Support input larger than 4096x2048 using extended input width/height
> fields of swreg92.
> This is needed to decode large WebP or JPEG pictures.
>=20
> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/verisilicon/hantro.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
> =C2=A0drivers/media/platform/verisilicon/hantro_g1_regs.h=C2=A0 | 2 +-
> =C2=A0drivers/media/platform/verisilicon/hantro_postproc.c | 6 +++++-
> =C2=A03 files changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/=
platform/verisilicon/hantro.h
> index 811260dc3c77..d1337f7742e4 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -321,6 +321,8 @@ struct hantro_postproc_regs {
> =C2=A0	struct hantro_reg output_fmt;
> =C2=A0	struct hantro_reg orig_width;
> =C2=A0	struct hantro_reg display_width;
> +	struct hantro_reg input_width_ext;
> +	struct hantro_reg input_height_ext;
> =C2=A0};
> =C2=A0
> =C2=A0struct hantro_vp9_decoded_buffer_info {
> diff --git a/drivers/media/platform/verisilicon/hantro_g1_regs.h b/driver=
s/media/platform/verisilicon/hantro_g1_regs.h
> index e7d4db788e57..f6e5bbeb1914 100644
> --- a/drivers/media/platform/verisilicon/hantro_g1_regs.h
> +++ b/drivers/media/platform/verisilicon/hantro_g1_regs.h
> @@ -351,7 +351,7 @@
> =C2=A0#define=C2=A0=C2=A0=C2=A0=C2=A0 G1_REG_PP_CONTROL_OUT_WIDTH(v) (((v=
) << 4) & GENMASK(14, 4))
> =C2=A0#define G1_REG_PP_MASK1_ORIG_WIDTH	G1_SWREG(88)
> =C2=A0#define=C2=A0=C2=A0=C2=A0=C2=A0 G1_REG_PP_ORIG_WIDTH(v)	(((v) << 23=
) & GENMASK(31, 23))
> -#define G1_REG_PP_DISPLAY_WIDTH		G1_SWREG(92)
> +#define G1_REG_PP_DISPLAY_WIDTH_IN_EXT	G1_SWREG(92)
> =C2=A0#define G1_REG_PP_FUSE			G1_SWREG(99)
> =C2=A0
> =C2=A0#endif /* HANTRO_G1_REGS_H_ */
> diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drive=
rs/media/platform/verisilicon/hantro_postproc.c
> index 232c93eea7ee..84c8e287470d 100644
> --- a/drivers/media/platform/verisilicon/hantro_postproc.c
> +++ b/drivers/media/platform/verisilicon/hantro_postproc.c
> @@ -49,7 +49,9 @@ static const struct hantro_postproc_regs hantro_g1_post=
proc_regs =3D {
> =C2=A0	.input_fmt =3D {G1_REG_PP_CONTROL, 29, 0x7},
> =C2=A0	.output_fmt =3D {G1_REG_PP_CONTROL, 26, 0x7},
> =C2=A0	.orig_width =3D {G1_REG_PP_MASK1_ORIG_WIDTH, 23, 0x1ff},
> -	.display_width =3D {G1_REG_PP_DISPLAY_WIDTH, 0, 0xfff},
> +	.display_width =3D {G1_REG_PP_DISPLAY_WIDTH_IN_EXT, 0, 0xfff},
> +	.input_width_ext =3D {G1_REG_PP_DISPLAY_WIDTH_IN_EXT, 26, 0x7},
> +	.input_height_ext =3D {G1_REG_PP_DISPLAY_WIDTH_IN_EXT, 29, 0x7},
> =C2=A0};
> =C2=A0
> =C2=A0bool hantro_needs_postproc(const struct hantro_ctx *ctx,
> @@ -103,6 +105,8 @@ static void hantro_postproc_g1_enable(struct hantro_c=
tx *ctx)
> =C2=A0	HANTRO_PP_REG_WRITE(vpu, output_height, ctx->dst_fmt.heighat);
> =C2=A0	HANTRO_PP_REG_WRITE(vpu, orig_width, MB_WIDTH(ctx->dst_fmt.width))=
;
> =C2=A0	HANTRO_PP_REG_WRITE(vpu, display_width, ctx->dst_fmt.width);
> +	HANTRO_PP_REG_WRITE(vpu, input_width_ext, MB_WIDTH(ctx->dst_fmt.width) =
>> 9);
> +	HANTRO_PP_REG_WRITE(vpu, input_height_ext, MB_HEIGHT(ctx->dst_fmt.heigh=
t >> 8));
> =C2=A0}
> =C2=A0
> =C2=A0static int down_scale_factor(struct hantro_ctx *ctx)
