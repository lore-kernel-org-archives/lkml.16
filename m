Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A70A21ADAE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 12:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744980313; cv=none; b=AhoTslMzRJuoEJ3mHacKHsxeiymZApOGgdGK9hZvzmrr75gaht0ksa5/LtcACeLRcDGRP58umARaqPHF0CLHDlfrkG4UULvhkwOYg1LvFqUs3mm4CB+azLndOJypor14FSqjTNyIOh6vDTncyGH+ZinHvksUpj28VW/5zHXxzBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744980313; c=relaxed/simple;
	bh=18Osn+o9xTHzDTfvt5jq/dH9+/i3xRIFr76Wqmc58IA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u9c7iDDDWZUNPufPyZjw8j1KnbAonZMwJgPoKKLgwNJG2MYOaCgMSIivgP2xFdeE3EhsuTedEblt2JjbtRRk0i5OdQYUCWgedQ9Hay7jHoNbRSQ9CPoH6DZLNTYZDmGKl8ZSO7cKHeWMWXBqpBroy/NIHq0hmQ/zEjUbGUNWUAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=AfIQwtkh; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="AfIQwtkh"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e8fd49b85eso27293986d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744980311; x=1745585111; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OXkCfmEUc7LzpxVnLIg/IPHBctqoHaGPnaOOKS8P/Og=;
        b=AfIQwtkhfAYxtxx8nG3kUXkguxixomrSCD7auKtELjBajOU2JoIz+CAIvSo2h5e1dO
         S/47zYYSIxuxqPW7AyDpK7czq2f0dr1UyJpQOApSalIt6a+U9hXU8RVDSNORgBSJIwiT
         Jt2Y3Rg3YNKqwvBmrkc8ID608S/kONqDg3rBxLRAip+xhbZ/8ckQw+i2ba+ffWylaTc4
         rTW9b1uKojvzlfwJC68qRGxS9kxgtkVeNbqm0vd6OS1yZur7IrwLHOb0eeFwP8gQ0kB8
         H3vuDt9xWVHB4ehuvJHFsFOtb82rinrbHndG9dqgOcZxhAaUt99scp2iZrDnE79cl4+n
         DfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744980311; x=1745585111;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OXkCfmEUc7LzpxVnLIg/IPHBctqoHaGPnaOOKS8P/Og=;
        b=DY4qGDmEN6StIGl4KuReQqecC1Pp30+dyXrOqFa2I395GOlwwbSZ6z3uh7sGLb51JQ
         d1Q3l4AgHi92uJliXwZRHn3Eae3eF0FaMJy/PHNYOi4s84WOTlOXtD/hHc4pLWmOsNws
         BzBFkKrG+q+5iLg9Viafnc6GJa5x+A+LOElijeK7g3UeZVrxxCkcCpZ6GUEfdOGKV64d
         JieH8Vvrfq1YnKmkoPrQwec9J1CW0ZBU2uGc7gjZq0szaJRJpBPN5L2o3ncA3NZx2L9J
         v7SRIuX7T9USZz5XEOJ0Dbj0Auulm36bhKUF5DgrOM+OQD7gzNMugTfFgZu0cTNj0oim
         j/7g==
X-Forwarded-Encrypted: i=1; AJvYcCUH2ULihvZCq/GJCNHptsiyE64vhRhBV6cEjHgAcwTBWgreF6dYmoNuW9/jDJ0ydyvnsO3R2m8cV0bEg4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ2sTIvCsA+XL3VfHfCgw/YEkak11x6FBR25ra/x7oW9uDh9J7
	jDOXn9ci45G8Hh6ltpFSkuTE/CwIg6NeqCUebxK7M/D7aoxkzTr6773OXJMLH/Q=
X-Gm-Gg: ASbGncs0fml3qGXWnJLACCA9lnFPKfXvP2RoKsrYNUCphCQpMGVKeoSKaywY/wWzGJu
	yQZhYc0Rgzl1aM+nYmrAokPY59mBwqlvdQNhifV8ehjcVvfC4w6u9/HfKgl2L0S9VlpNZbIdpoC
	9rQ910YZIXZTPnMoBiR0nhunfOYrfxwJgG/q4djq2+fGe8cFTi9BWxVvY77f4fcux9xdBRIndNN
	7BrOMu/eNI/gHBChvHhC9P+2dI3zLxxASQpdWJhGmLDaGqCzJaVXVWbwVAIqG38vMkuuOzVhGMt
	4O5nHm43OkupfjPqUda+tNUHuYAMr0ZrdqXmSIS/EEHGNw==
X-Google-Smtp-Source: AGHT+IEZdyYA51jGvbZkm/yOrNHbFvp9m23H3RTW5HtgAkzz9w0U+ZAEqEnXFIW9TtqYnKH54EJ3Ug==
X-Received: by 2002:a05:6214:daa:b0:6e8:90eb:e591 with SMTP id 6a1803df08f44-6f2c4577f11mr35766706d6.24.1744980311082;
        Fri, 18 Apr 2025 05:45:11 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::c41? ([2606:6d00:15:9913::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b0f939sm10224416d6.48.2025.04.18.05.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:45:10 -0700 (PDT)
Message-ID: <275992627ec612d0a82f5a63bcdae47efdfe16ef.camel@ndufresne.ca>
Subject: Re: [PATCH v5 1/5] media: imx-jpeg: Move mxc_jpeg_free_slot_data()
 ahead
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Fri, 18 Apr 2025 08:45:09 -0400
In-Reply-To: <20250418070826.141-2-ming.qian@oss.nxp.com>
References: <20250418070826.141-1-ming.qian@oss.nxp.com>
	 <20250418070826.141-2-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 18 avril 2025 =C3=A0 15:08 +0800, ming.qian@oss.nxp.com a =C3=
=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> Move function mxc_jpeg_free_slot_data() above mxc_jpeg_alloc_slot_data()
> allowing to call that function during allocation failures.
> No functional changes are made.

Since the following patch is a "Fixes" and depends on this one, you
must also add the tags here.

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encod=
er/Decoder")

>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Ack.

> ---
> v5
> - Split the resetting pointer in free to a separate patch
>=20
> =C2=A0.../media/platform/nxp/imx-jpeg/mxc-jpeg.c=C2=A0=C2=A0=C2=A0 | 40 +=
++++++++----------
> =C2=A01 file changed, 20 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/med=
ia/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 0e6ee997284b..2f7ee5dfa93d 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -752,6 +752,26 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_da=
ta *slot_data)
> =C2=A0	return -1;
> =C2=A0}
> =C2=A0
> +static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> +{
> +	/* free descriptor for decoding/encoding phase */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			=C2=A0 jpeg->slot_data.desc,
> +			=C2=A0 jpeg->slot_data.desc_handle);
> +
> +	/* free descriptor for encoder configuration phase / decoder DHT */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			=C2=A0 jpeg->slot_data.cfg_desc,
> +			=C2=A0 jpeg->slot_data.cfg_desc_handle);
> +
> +	/* free configuration stream */
> +	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> +			=C2=A0 jpeg->slot_data.cfg_stream_vaddr,
> +			=C2=A0 jpeg->slot_data.cfg_stream_handle);
> +
> +	jpeg->slot_data.used =3D false;
> +}
> +
> =C2=A0static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
> =C2=A0{
> =C2=A0	struct mxc_jpeg_desc *desc;
> @@ -798,26 +818,6 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg=
_dev *jpeg)
> =C2=A0	return false;
> =C2=A0}
> =C2=A0
> -static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> -{
> -	/* free descriptor for decoding/encoding phase */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			=C2=A0 jpeg->slot_data.desc,
> -			=C2=A0 jpeg->slot_data.desc_handle);
> -
> -	/* free descriptor for encoder configuration phase / decoder DHT */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			=C2=A0 jpeg->slot_data.cfg_desc,
> -			=C2=A0 jpeg->slot_data.cfg_desc_handle);
> -
> -	/* free configuration stream */
> -	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> -			=C2=A0 jpeg->slot_data.cfg_stream_vaddr,
> -			=C2=A0 jpeg->slot_data.cfg_stream_handle);
> -
> -	jpeg->slot_data.used =3D false;
> -}
> -
> =C2=A0static void mxc_jpeg_check_and_set_last_buffer(struct mxc_jpeg_ctx =
*ctx,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vb2_v4l2_buffer *s=
rc_buf,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vb2_v4l2_buffer *d=
st_buf)
