Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8326627587A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 12:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744980559; cv=none; b=RqlkYejzeRp42TZFZZ63tZGOVd5b22BJLB0kum5Dzp429hhvp/bzZizar0BNQg7Xph80oJx5hF98WHYnT7m4Bx5qYbrt1N5k2ABrfQtK4Pw9bwkisNy5S0YGI8gnj37B7EUJOgCmeGJtRF5QP2KxTR25yeVUVVTtYPVLka3CqMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744980559; c=relaxed/simple;
	bh=gQlOxlO8930yO5ibgAmuqXeO4pmpPbtEVExTdD/GYtc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QxkywGzT+d+fH0xwvUBQBGvMJPDashE2rc8r3oaxmUOW5I64uh/WAJJT5OiJVGsnq9yd5Ir68guiNeZnPI0+4LQowPJtMNRYpOWY9r8xLXfTu9jJNKVttiV8HhXxWEIoAT7ZUEpLT3HcwyruNXQGOoLfKDbEB+/CRjVBxvQdINY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=DX6jvYr3; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="DX6jvYr3"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c54b651310so240232285a.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744980555; x=1745585355; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jYaJAf4mlOAD42xMe/rZeVYxGHqCckmap7vqxCNd/40=;
        b=DX6jvYr3Aq7A3l4jD6mZYKEyKdMlXheX46wb7a5Qk/2Ok3HacWgdjowG1zVNierTVm
         CDQyM45fDLsmfQlmZqfY28oJDi5W1poCaOl5qrAQPRjaq+wGCrB7C6IRsVC/NEFDSf+O
         J5AInOzKNJojJglcA5ro1c0mtfhHAIkgQNlusw3SOMDZRLuGIins027SF7ZpVr6Qah5m
         GM6GYkSrZ8BTZbIzDNrf7l0LlCIewx9SSzxrn3I6t8fGksXC2vaOl/j5Y0PFuLCA8Afq
         aP8ABY0QEubWiZJtTWNWlidmp7YdbPzsuUQ7zX8hAKrlJAGie7ktvNey88DBboXNYcmJ
         Uphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744980555; x=1745585355;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jYaJAf4mlOAD42xMe/rZeVYxGHqCckmap7vqxCNd/40=;
        b=O1WvKMIIe8BYIvYcnEdgOaQASzCSaJyYrQ6JR92foDYV8hXej3zVN2nfVhHO8iaBIa
         E/CkDak41dhKIECBTTP/2gIF47HUZtdEWafzAsdHzpcO5B54uVlcCfN9Phhx6t9FZO0R
         dSRVXQfDEKRMdEhGGjmKCp3V9bx2vthRkZWA4GziRtR4qUEhvgeTk74iPeDfX008JpXo
         y+WI+mYUd3b5wGYvl71a/FVao2tqIGHkUulybIiGvlCIl5s16OciDSolJfLDShcftL8Z
         AU7SCotyGzJnenmvlDcE3gf4gmjwFw8YwCnJVztNV8gaPWWY4FGbyyqum63K/brMcsB3
         dbzA==
X-Forwarded-Encrypted: i=1; AJvYcCWY8P1M1lQfXk2WS1JyaFNanu0AvEwCwNVcyRG1ubyfaYZSukNCM3I5xWAqeXI9D9jkn44lld+PnhzXHPU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy4t4QY1V7NF14Qxh6ii6nbuIMojOq5nZWf37GV3U0ajdV9Qkg
	KpK+VrSWHdc8O8bxabp1z9zPPJirHJtxxxALKffs7maMVj7O6QPsLNN8Sjhho5I=
X-Gm-Gg: ASbGncuRmyttSxWAiytJ2dwiXWkNTeD/EfL86L6QD85wHZRs9IeAqXdO6xf/glMwxIt
	U4kxpzrqnvSqxkCSRaGkQTxycxdzB4slrsdD1I9tDPMK8bOq/XmbBhWkID8oFxCnZ66BnUVIsY2
	ECuSSnzpJt8xQkxFzwJBHNukf4q0FYqAKJ6UamFv69l1OT4XPYR2zJmMmRpLoZYCUGfvNFmg6oT
	G8OAkSCR5HD9i0sbdgtxd2xTuSlzu1YNdCvOu2F4GgiqGwkoYrtGkRGzuxlX+WYnpYORzGDqFyL
	pB6wFOIsud3femft6adhyyW1EE60fYYupVqxsubEjcWhdQ==
X-Google-Smtp-Source: AGHT+IGynna9oqlUfCvK4A2bAh3MndEe6O6J5Dk7XbTAN7GvFRmVsTQUL/cmbo1DTdHEkCI6hkR5wg==
X-Received: by 2002:a05:620a:bc8:b0:7c7:b59d:a6f2 with SMTP id af79cd13be357-7c927f59337mr381802985a.10.1744980555401;
        Fri, 18 Apr 2025 05:49:15 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::c41? ([2606:6d00:15:9913::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a8f3c5sm103702685a.37.2025.04.18.05.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:49:14 -0700 (PDT)
Message-ID: <22e43e927514ebfc20e97f2bfd5fd52899820627.camel@ndufresne.ca>
Subject: Re: [PATCH v5 2/5] media: imx-jpeg: Reset slot data pointers when
 free data
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Fri, 18 Apr 2025 08:49:13 -0400
In-Reply-To: <20250418070826.141-3-ming.qian@oss.nxp.com>
References: <20250418070826.141-1-ming.qian@oss.nxp.com>
	 <20250418070826.141-3-ming.qian@oss.nxp.com>
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
> To make the function mxc_jpeg_alloc_slot_data() and
> mxc_jpeg_free_slot_data() safe to be called multiple times. Ensure that
> the slot data pointers are reset to NULL and handles are set to 0 after
> freeing the coherent memory.

Perhaps:

   media: imx-jpeg: Reset slot data pointers when freed


   Ensure that the slot data pointers are reset to NULL and handles are
   set to 0 after freeing the coherent memory. This makes he function
   mxc_jpeg_alloc_slot_data() and mxc_jpeg_free_slot_data() safe to be
   called multiple times.

>=20
> Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Enc=
oder/Decoder")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> v5
> - Make a single patch to reset the slot data pointers when free data
>=20
> =C2=A0drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/med=
ia/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 2f7ee5dfa93d..b2f7e9ad1885 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -758,16 +758,22 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg=
_dev *jpeg)
> =C2=A0	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> =C2=A0			=C2=A0 jpeg->slot_data.desc,
> =C2=A0			=C2=A0 jpeg->slot_data.desc_handle);
> +	jpeg->slot_data.desc =3D NULL;
> +	jpeg->slot_data.desc_handle =3D 0;
> =C2=A0
> =C2=A0	/* free descriptor for encoder configuration phase / decoder DHT *=
/
> =C2=A0	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> =C2=A0			=C2=A0 jpeg->slot_data.cfg_desc,
> =C2=A0			=C2=A0 jpeg->slot_data.cfg_desc_handle);
> +	jpeg->slot_data.cfg_desc_handle =3D 0;
> +	jpeg->slot_data.cfg_desc =3D NULL;
> =C2=A0
> =C2=A0	/* free configuration stream */
> =C2=A0	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> =C2=A0			=C2=A0 jpeg->slot_data.cfg_stream_vaddr,
> =C2=A0			=C2=A0 jpeg->slot_data.cfg_stream_handle);
> +	jpeg->slot_data.cfg_stream_vaddr =3D NULL;
> +	jpeg->slot_data.cfg_stream_handle =3D 0;
> =C2=A0
> =C2=A0	jpeg->slot_data.used =3D false;
> =C2=A0}

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
