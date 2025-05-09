Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF3F267B74;
	Fri,  9 May 2025 06:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746770699; cv=none; b=dkUZQnArh2ITxj/XfbiBWFJh9XUTYq4WK0Lt4l60gjGORyAFAw0qlDniaHrhDiYAeVC7gTd1279PEjx9xzzx+junTt84BdL6b30LnT8KBqRqqRnd9Z3cXJu+uO5SDxeSozp3SGCQWFo6tpljJ+QTAR2pY4JqcFKS7euJtX0CXVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746770699; c=relaxed/simple;
	bh=C5/G1pjgdh5IkDeQym4rHiYsnzlKdEPrrZm8Ybiuxlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UzYUhb6WlQpDJbxWmtZNaAXGQPxKYfAJx0HUp9HeQD+ghhEfQJ2TMAkqx+OWn4M2yb2nOLRhFSFZrhxRauHQOTbMUSd08UIj1QaUbIHgVDWx2K+9YgHdxa03jf+X3NdqZc28A3gIARAHDWWuv3LTTDcZY9vwZZuzM3gbb+qG3j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8hE/SkL; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8hE/SkL"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so1267849f8f.3;
        Thu, 08 May 2025 23:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746770696; x=1747375496; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YH+J7PBU/JVJvTRTJ5fWHu9R175kV/9VAq5m9JiwHE=;
        b=k8hE/SkL6hH5teOcrV88AYMyZBdeP6NLxoaJqoAK71McZUlXBXwdkD61TNQyBBpH1+
         3h7kROGSGbwroEj0Xyeaaxztllx8kM8viWHnsFKw+z7JXa+QNyrTuwRcy9B9sucBGwNs
         nXmWML/gJiw4+Zg3VhiwlFHeeoB5UdsWGO0/Gabsa3inzATS8g+ujU63CBc36ZKpGtFE
         O+a6YTuiTsC1OEhQlJ9zUF0sUk5Dphis7IQKfQwtDA1CEPTiBh6d5FOSMFG83RYFfn/c
         GzHeDFKfiL244lTLtYhZa7kl3w0Y0VSrxfP38SjGyfwILuEQQjol3UgvZVuTC0azPo0t
         wXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746770696; x=1747375496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YH+J7PBU/JVJvTRTJ5fWHu9R175kV/9VAq5m9JiwHE=;
        b=ugQP7rDSRzPrAqAke9lHHtqy+E1FuU23RszFgUIX/ja6aaSOUbUPViNOcWfxlM8qry
         ybXTJBswhNfxiBKUHT9F9mHzwCOKGfUWu7ydRwxN87PDYdQXCjImjJEvt6aK5bZ6ZLZS
         hYORnSyKNklxdoUY6TIxClXSyMk7iuNz/G04GU2rUtr5N3LOJFeldIXMrZpGroRfNtfj
         n7h8M6eaQxFoRvmo4HDQxRYX5pDGXXBgsiLMcI/Cvd/9iyrD76yHaZsie3Qa3zC/mosK
         /S4UStZirt7TXG+LjggFem1FD11xYlB2fgZfqcqMJJEcS/4y7fTyWwHW2ZrLbG5dp2x+
         DJuA==
X-Forwarded-Encrypted: i=1; AJvYcCWLHzxwkA8Ze6dxrAeQ/oDdUqbtHNmb2lV3z9gd/+pYfmkjSUg7yvlRhy8Lt/gUpqG9isBqdqaM6ri5@vger.kernel.org, AJvYcCXrt6C/P6jrDLbB/rjsf8okp7s214mz34LPKgv5bIoDwmrLlIeUwakK78Adbfx0QRFVtNvS5vbjtaUp3Bt6@vger.kernel.org
X-Gm-Message-State: AOJu0YxFfGLgtNQp/F8fZfR8Zruc58WyYItx5/yk0lem6AVIdu0Fs7Uo
	Jlv8uR/JTa7AFKlCm4VxDQmlpVLO1LaMM3b6KtRYLUer6m3x4E0FZtf3ZzH0DvCJEWTn844pvcx
	S5ymE4MsB1NvbKJ+RTZmScXlyhRQ=
X-Gm-Gg: ASbGncvbVFoPby3RGf3QvpAKI7UjWh90PBaa04+kOCyci9ht9gCz7Uu6MNuDGyG3nwh
	D/IpcyH7loHFHsF1QIj/i/lemq0O+ox59acSwQfzqW0tQRb8m6hBrr+ZMAXj9YFrNS/9ynYNU+r
	nsZy4i5sb3E9ibymcSEXUqbEFNNfYHEfoQ1A==
X-Google-Smtp-Source: AGHT+IEoTNTrBaYbkjgRbGjpus29JTMUvaAhSH12iOiVqjFnAX+vMaEZKKf9Cq3jByjlaiW/E63KH8HOE7hW1bhzXd8=
X-Received: by 2002:a05:6000:4287:b0:3a0:b635:ea40 with SMTP id
 ffacd0b85a97d-3a1f64a3e3dmr1665593f8f.55.1746770695189; Thu, 08 May 2025
 23:04:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506093340.106575-1-clamor95@gmail.com> <20250506093340.106575-3-clamor95@gmail.com>
 <48472736-4182-4d47-9980-6d63541f6975@wanadoo.fr>
In-Reply-To: <48472736-4182-4d47-9980-6d63541f6975@wanadoo.fr>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 9 May 2025 09:04:44 +0300
X-Gm-Features: AX0GCFv_03eCqlR5fKQ8OMhAozBUTZ4dDTAVo2y7TPMRcWAJrTLnSJhD2n38a3U
Message-ID: <CAPVz0n0DF6NUBc8BfAyOS7JCwjT0yrCwYgqPyfivA0o_onQzDg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] drm: bridge: Add support for Solomon SSD2825
 RGB/DSI bridge
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
	andrzej.hajda@intel.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	neil.armstrong@linaro.org, rfoss@kernel.org, robh@kernel.org, simona@ffwll.ch, 
	tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 6 =D1=82=D1=80=D0=B0=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 20:49=
 Christophe JAILLET
<christophe.jaillet@wanadoo.fr> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Le 06/05/2025 =C3=A0 11:33, Svyatoslav Ryhel a =C3=A9crit :
> > SSD2825 is a cost-effective MIPI Bridge Chip solution targeting mainly
> > smartphones. It can convert 24bit RGB interface into 4-lane MIPI-DSI
> > interface to drive display modules of up to 800 x 1366, while supportin=
g
> > AMOLED, a-si LCD or LTPS panel technologies for smartphone applications=
.
>
> Hi,
>
> ...
>
> > +config DRM_SOLOMON_SSD2825
> > +     tristate "SSD2825 RGB/DSI bridge"
> > +     depends on SPI_MASTER && OF
> > +     select DRM_MIPI_DSI
> > +     select DRM_KMS_HELPER
> > +     select DRM_PANEL
> > +     help
> > +       Say Y here if you want support for the Solomon SSD2825 RGB/DSI
> > +       SPI bridge driver.
> > +
> > +       Say M here if you want to support this hardware as a module.
> > +       The module will be named "solomon-ssd2825".
>
> Is it "solomon-ssd2825" or just "ssd2825"?
>
> > +
> >   config DRM_THINE_THC63LVD1024
> >       tristate "Thine THC63LVD1024 LVDS decoder bridge"
> >       depends on OF
>
> ...
>
> > +static int ssd2825_read_raw(struct ssd2825_priv *priv, u8 cmd, u16 *da=
ta)
> > +{
> > +     struct spi_device *spi =3D priv->spi;
> > +     struct spi_message msg;
> > +     struct spi_transfer xfer[2];
> > +     u8 tx_buf[2];
> > +     u8 rx_buf[2];
> > +     int ret;
> > +
> > +     memset(&xfer, 0, sizeof(xfer));
> > +
> > +     tx_buf[1] =3D (cmd & 0xFF00) >> 8;
> > +     tx_buf[0] =3D (cmd & 0x00FF);
> > +
> > +     xfer[0].tx_buf =3D tx_buf;
> > +     xfer[0].bits_per_word =3D 9;
> > +     xfer[0].len =3D 2;
> > +
> > +     xfer[1].rx_buf =3D rx_buf;
> > +     xfer[1].bits_per_word =3D 16;
> > +     xfer[1].len =3D 2;
> > +
> > +     spi_message_init(&msg);
> > +     spi_message_add_tail(&xfer[0], &msg);
> > +     spi_message_add_tail(&xfer[1], &msg);
> > +
> > +     ret =3D spi_sync(spi, &msg);
> > +     if (ret)
> > +             dev_err(&spi->dev, "spi_sync_read failed %d\n", ret);
>
> Maybe, just spi_sync in the message?
>
> > +
> > +     *data =3D rx_buf[1] | (rx_buf[0] << 8);
> > +
> > +     return 0;
>
> Is it on purpose that ret is never returned?
> Is it safe to update *data if ret is not 0?
>
> > +}
>

Acknowledged, thank you

> ...
>
> CJ
