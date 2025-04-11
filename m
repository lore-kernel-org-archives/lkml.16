Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFDB267F4C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 18:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744396481; cv=none; b=ojkuu13zZyZjvxZusf6hJC3Ta3eKR2PWloJPDT1soxaOLGUclVQsbkg9aK0evAvGPMAqS+XzHyG8m0YQlfhAXR44xORLaAPuuY0ZybJZwSYSMfdsW5ynynwtkAdM0r0Nl0hAMxesOOL2YBwRwcTIGufefVoKuCl/bvCX97S7RfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744396481; c=relaxed/simple;
	bh=tqp7nzWxE4ZwA2tMyN4Ja38wF56pok8OKvqOIWHLRkw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D7ebugvQUAHEJpmPjbo4UlbQKRNM4x74CfAEvl/HlbtAeDZaEFrvftON2WajZf5uUJpxFnw6tVYEOjTwXqFDX+8hfayq8/8s/HfLFG1Iy7dHwEsg1AXsRNfFFFHERaMhdnEA9FnXmKI1oPX0H/GeAt/aaINqK17vPFbtrvQYf/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=qfwW/kI9; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="qfwW/kI9"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c5e2fe5f17so224935085a.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744396478; x=1745001278; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N0AWpw5PkEqx4rxzE4AWKI4Octup9SsapRwIoW5iY7A=;
        b=qfwW/kI9Pk9hpux+lAsXc0ZUJ4K5Qo1Y5YKw3y4GbijfH5gxKk7iv7QNtisDHeTI55
         KJHJ66FtWpXlKN+QK8mVbdh6EEuzPZkpR+DbrLOe4OCu9mBkWzYpIg85FN7+MfcdfMfr
         Bia5zcMHySIWp7n6++Wz/z5Eo1GNnMQ76eJTDZ1693KriOp5eS6W6EWs78twtmg0aUHE
         Wvr+az1lRREszTdnornHszEJS6cTWjY2vXJKlf5nX/+Bi5+x6moIiRUBUdQPK8SN37FD
         IPSLIQVkmDFfZxEyTzx8OI1K6mnOneuuslEZT28/JrEe8OZoovC8uFASDViWC7dwWV+z
         GlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744396478; x=1745001278;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N0AWpw5PkEqx4rxzE4AWKI4Octup9SsapRwIoW5iY7A=;
        b=nI4dSQuvH9RWtSf/IHDgE4EUKIR7sFFNaJ8uHiqhR1r0khJKzMdtUcugOm+soVza39
         VFQueuiMrIYL5D2ZJIz3LOKSayay1vBuSV4jvsVvCXyc9lCUjNIXB6q4swRAwdRJVTgx
         uYnHovdSRMEK//YvRJTDW+cU4EGNXAzLDb0KgruuUnTKKI7G5WibbGeRVSxt9mR56aDr
         iP6p0vkjTRNjwgWUK3DCsBX6W6xthqylVwMjFloWK76BpXkPg0fSb3VHdwfg31vsgePB
         1K95ntzwR1tK6NlygJyqvGZE2mVtcyoGcgrA3Z/RmbXdkzZqg65OGukt/wbsCb/FBAf/
         oPEA==
X-Forwarded-Encrypted: i=1; AJvYcCWMq+RZaz4xkU1hOKFbkAIPiefxH1J2fWKkwqOUyivPCv+n2ljPHa6dSviBI/965VOQ0SdwJHl7sPdzIGU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzgGCsaXtn4zsBHy6Ubk8+NkxfhuU5xt8ZZkXgbTqutWdjpswB
	Yc9vt4iEMTHiiAvvdQBQ2F1LufSjQn2aX1mwPa97WYc2T1ZIHVc101UiKWGKQ3U=
X-Gm-Gg: ASbGncv0nlSHFcV+DmoZd55pcdqarBRJ/53Cg3kmL6fBY9g3Suu54u43M2MNMadk2Kp
	X5lz7N7w7m6FBFl+r6kwWRhxs77hClsgv7YtpEHzIUlZIoUATJ5BOpT5lZorDo0ihMHJPt0wyqo
	aUxN5Fu/089UHY9iFVAFoKMKsqk2Zbe+cqYdplHj5JylQ45dAtp2lEn+gVTvj3YjHgJ4MlzEb0o
	U8wvftOXEBCAyLhxrXSejk/wC16PbEPOscdT86Sug57QJqd70GSc5H1swblOGFqRatFyIZzUjXh
	gtKmPSp5Cnp+U0QzPKV2V12G2m9+jaIQUn7bvqyj+QQJDw==
X-Google-Smtp-Source: AGHT+IFdO0dOsTvQQgEwYJzn7H07oQLyZuXyp8SlGmVZfE23qvHiI5+GWs8xrNT3RdytwsmGS6VF0w==
X-Received: by 2002:a05:620a:4694:b0:7c7:95ee:77bf with SMTP id af79cd13be357-7c7af0ce3bbmr510403485a.19.1744396478456;
        Fri, 11 Apr 2025 11:34:38 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edd3e7fsm29533341cf.81.2025.04.11.11.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 11:34:37 -0700 (PDT)
Message-ID: <d19639fb0fbe5c0992a69d7783e6fad91c50561b.camel@ndufresne.ca>
Subject: Re: [PATCH 2/3] dma-buf: Add DMA_BUF_IOCTL_GET_DMA_ADDR
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>, Sumit Semwal	
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Date: Fri, 11 Apr 2025 14:34:37 -0400
In-Reply-To: <20250410-uio-dma-v1-2-6468ace2c786@bootlin.com>
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
	 <20250410-uio-dma-v1-2-6468ace2c786@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Bastien,

Le jeudi 10 avril 2025 =C3=A0 16:53 +0200, Bastien Curutchet a =C3=A9crit=
=C2=A0:
> There is no way to transmit the DMA address of a buffer to userspace.
> Some UIO users need this to handle DMA from userspace.

To me this API is against all safe practice we've been pushing forward
and has no place in DMA_BUF API.

If this is fine for the UIO subsystem to pass around physicial
addresses, then make this part of the UIO device ioctl.

regards,
Nicolas

>=20
> Add a new dma_buf_ops operation that returns the DMA address.
> Add a new ioctl to transmit this DMA address to userspace.
>=20
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
> ---
> =C2=A0drivers/dma-buf/dma-buf.c=C2=A0=C2=A0=C2=A0 | 21 ++++++++++++++++++=
+++
> =C2=A0include/linux/dma-buf.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0include/uapi/linux/dma-buf.h |=C2=A0 1 +
> =C2=A03 files changed, 23 insertions(+)
>=20
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index
> 398418bd9731ad7a3a1f12eaea6a155fa77a22fe..cbbb518981e54e50f479c3d1fcf
> 6da6971f639c1 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -454,6 +454,24 @@ static long dma_buf_import_sync_file(struct
> dma_buf *dmabuf,
> =C2=A0}
> =C2=A0#endif
> =C2=A0
> +static int dma_buf_get_dma_addr(struct dma_buf *dmabuf, u64 __user
> *arg)
> +{
> +	u64 addr;
> +	int ret;
> +
> +	if (!dmabuf->ops->get_dma_addr)
> +		return -EINVAL;
> +
> +	ret =3D dmabuf->ops->get_dma_addr(dmabuf, &addr);
> +	if (ret)
> +		return ret;
> +
> +	if (copy_to_user(arg, &addr, sizeof(u64)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> =C2=A0static long dma_buf_ioctl(struct file *file,
> =C2=A0			=C2=A0 unsigned int cmd, unsigned long arg)
> =C2=A0{
> @@ -504,6 +522,9 @@ static long dma_buf_ioctl(struct file *file,
> =C2=A0		return dma_buf_import_sync_file(dmabuf, (const void
> __user *)arg);
> =C2=A0#endif
> =C2=A0
> +	case DMA_BUF_IOCTL_GET_DMA_ADDR:
> +		return dma_buf_get_dma_addr(dmabuf, (u64 __user
> *)arg);
> +
> =C2=A0	default:
> =C2=A0		return -ENOTTY;
> =C2=A0	}
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index
> 36216d28d8bdc01a9c9c47e27c392413f7f6c5fb..ed4bf15d3ce82e7a86323fff459
> 699a9bc8baa3b 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -285,6 +285,7 @@ struct dma_buf_ops {
> =C2=A0
> =C2=A0	int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
> =C2=A0	void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map
> *map);
> +	int (*get_dma_addr)(struct dma_buf *dmabuf, u64 *addr);
> =C2=A0};
> =C2=A0
> =C2=A0/**
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-
> buf.h
> index
> 5a6fda66d9adf01438619e7e67fa69f0fec2d88d..f3aba46942042de6a2e3a4cca3e
> b3f87175e29c9 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -178,5 +178,6 @@ struct dma_buf_import_sync_file {
> =C2=A0#define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, __u64)
> =C2=A0#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2,
> struct dma_buf_export_sync_file)
> =C2=A0#define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct
> dma_buf_import_sync_file)
> +#define DMA_BUF_IOCTL_GET_DMA_ADDR	_IOR(DMA_BUF_BASE, 4, __u64
> *)
> =C2=A0
> =C2=A0#endif
