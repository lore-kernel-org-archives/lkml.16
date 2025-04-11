Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043C81F8BD6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 18:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744397269; cv=none; b=pQBP2dLEZB8N83tkjohjgb9tPryuEltGEJgVXvvoRTLg64c3rva/cTpDBk6iW+50QpwacMODJWBdEmi8utfbDwCsXozUOWlgbhjrhiZ5qBl5lpLTpOpzRSWiFi7wAeuEJiYmJnrl5MdKlFwTzuipncPFTxFaX+NN7dYWXwAjjd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744397269; c=relaxed/simple;
	bh=igfmk052ohOfBX0sJswb9359FPqtwwRUyoS0iYxyj+w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S54HG0kJYcw08CfqbA0N36JkVtAmmbAUHBfC+83sXU116YRUnaPS5+N23dhpxDlJB2rHGzEyutbCqhmK5K0Q5aGugUj7Op3GFm8+WoPyH9ukYaqN84gEzfsnkYlW/MniACHr10qJQZFWoLKs/X2WfiWIXJYcPeutlLLJj9mGsKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=zBsWChSo; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="zBsWChSo"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c5b2472969so237197685a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744397267; x=1745002067; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WsKwnpTHjMkgeZIljAagk5lvn0NCV/Em7Uj95pOpDGI=;
        b=zBsWChSox7ZhlMvsteMOMcQqiUximK3oCwHzZQ4O778uJdwX9oTFMz9C5u5l0D42h1
         bc9FykbUc4zzcfPnIRT637kMziKAlQjxejIeEzU2LYYAIxPwMhijU9RlUlwXOyaaOO77
         WhkZiD1uw5+S1lwLQW1lVQ2EvQl7aq7c6ZF41sbcM+BbM/eavj6wfVvVd8AKWhQr3KH3
         c0R8/T0PVsn/mbYteUk8O+JJ+r7Fpd6sZ2CzuZ13V637RBYcR5y4CDAMWdMEDlMsycsv
         9/kfRnzkBTe/DlcCk5Ul8XHqA+xK2Y2evDtedBuTzfPQevWnEu6K3aWZ+Xq044rgKZGv
         6iBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744397267; x=1745002067;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WsKwnpTHjMkgeZIljAagk5lvn0NCV/Em7Uj95pOpDGI=;
        b=aves1ehTEiMkf7YfeiuvbcEjcUFm4sYT7htqRcLBfkqgHfQ6cKZbrdHVUuhD5p6HxJ
         P80y8Xj13qNtak/nBeD8zQd3P/+Ns/yKMPKPZTxMW5iskkVOJl4SXJhZUPrvlcZDyAPS
         Odta3kw5wtWbBc3Pmms2IXZWZNMP6yUNTCjNT02BefDZ0Uub0etSglusbP1vdkxqpAMQ
         oUZCpFeupuAdmeRU8nzGWeOVM+uS6tiF1SAAEW8XfgaDN1CCToCU0xtfi3lRjdQTI8mI
         AUjGsERjmZ4HBPSjNMlH1wB+QXDVn9YRO77U8u2G3YNVHdae3R5IxhvhG5sZCK5AaKSq
         rnvw==
X-Forwarded-Encrypted: i=1; AJvYcCUE/BLNJloFR/u/wRC1ApiTlP+KG7zba8/X0thC3kRfFWUaAO2u+LoSv1NUBLlmsDqNHqLg+52/Gag24Ro=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvaXECJl2p6o9ZBjmTud+Fp9+ZyaeAprfH2yASBcizWGuk63rh
	LDBWyceeJPOBti+SW6VK3EF1r0bSdxwjq6kKyshl2O+1WXyNBZo07mVBhrfesfg=
X-Gm-Gg: ASbGncu30JVmBwvPeYwkj30g8tVr4CetJZESmse+vrQU3/3KEn8Nkh0Z122AUDGDovu
	Qj/xjM33YMGQDm6KaET/AJ9CJadjuFCu097m9jIvi5yc27K6dzv+Ap/4ODcw0OyyE8saoGJ8KHK
	GLqhyopfsSTzZIbPlqOJpRKiAZUl0H5iviWoz7voph8ZxLC85I+3Uw+2i5fG6FAsV7kWPzcoHti
	AiJo6Edbf7noBXRKLL7PVr/rUmlxj32ewTePX3hi6QZhLmrFhCiGIBvJc8wK9A9GmhYZyxT73kU
	wjQonsF/+mhXgNY73qcM9oYOmA2r2Mt7dO4P/9jENKQZow==
X-Google-Smtp-Source: AGHT+IFtKnV9+w0FwXGSzvq+4jUfFCuVoEptoZcv67KhNBh18LEdtioKg5wo6qZbIxlKb9n37yn5ZQ==
X-Received: by 2002:a05:620a:17a9:b0:7c5:57d6:ce3c with SMTP id af79cd13be357-7c7af1328a8mr627352285a.22.1744397266859;
        Fri, 11 Apr 2025 11:47:46 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8951969sm298592885a.45.2025.04.11.11.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 11:47:46 -0700 (PDT)
Message-ID: <588eb09a61dea0c07e02c8b474972c6ca9b3b3e8.camel@ndufresne.ca>
Subject: Re: [PATCH v4 1/4] media: imx-jpeg: Move mxc_jpeg_free_slot_data()
 ahead
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Frank Li <Frank.li@nxp.com>, ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 mirela.rabulea@oss.nxp.com, 	shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, 	festevam@gmail.com, xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, linux-imx@nxp.com, 	imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Fri, 11 Apr 2025 14:47:44 -0400
In-Reply-To: <Z/kpBXvJe/n2YHg7@lizhi-Precision-Tower-5810>
References: <20250411074347.809-1-ming.qian@oss.nxp.com>
	 <20250411074347.809-2-ming.qian@oss.nxp.com>
	 <Z/kpBXvJe/n2YHg7@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 11 avril 2025 =C3=A0 10:36 -0400, Frank Li a =C3=A9crit=C2=A0:
> On Fri, Apr 11, 2025 at 03:43:40PM +0800, ming.qian@oss.nxp.com=C2=A0wrot=
e:
> > From: Ming Qian <ming.qian@oss.nxp.com>
> >=20
> > Move function mxc_jpeg_free_slot_data() above mxc_jpeg_alloc_slot_data(=
)
> > allowing to call that function during allocation failures.
> > No functional changes are made.
> >=20
> > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > ---
> > =C2=A0.../media/platform/nxp/imx-jpeg/mxc-jpeg.c=C2=A0=C2=A0=C2=A0 | 46=
 +++++++++++--------
> > =C2=A01 file changed, 26 insertions(+), 20 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/m=
edia/platform/nxp/imx-jpeg/mxc-jpeg.c
> > index 0e6ee997284b..b2f7e9ad1885 100644
> > --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > @@ -752,6 +752,32 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_=
data *slot_data)
> > =C2=A0	return -1;
> > =C2=A0}
> >=20
> > +static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> > +{
> > +	/* free descriptor for decoding/encoding phase */
> > +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> > +			=C2=A0 jpeg->slot_data.desc,
> > +			=C2=A0 jpeg->slot_data.desc_handle);
> > +	jpeg->slot_data.desc =3D NULL;
> > +	jpeg->slot_data.desc_handle =3D 0;
>=20
> You add above two lines, it is not simple move function. Move above two
> line change to next patch.

What about just making this its own commit, give you the chance to
write down that your making that function safe to be called multiple
times ?

Nicolas

>=20
> Frank
>=20
> > +
> > +	/* free descriptor for encoder configuration phase / decoder DHT */
> > +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> > +			=C2=A0 jpeg->slot_data.cfg_desc,
> > +			=C2=A0 jpeg->slot_data.cfg_desc_handle);
> > +	jpeg->slot_data.cfg_desc_handle =3D 0;
> > +	jpeg->slot_data.cfg_desc =3D NULL;
>=20
> The same here.
>=20
> > +
> > +	/* free configuration stream */
> > +	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> > +			=C2=A0 jpeg->slot_data.cfg_stream_vaddr,
> > +			=C2=A0 jpeg->slot_data.cfg_stream_handle);
> > +	jpeg->slot_data.cfg_stream_vaddr =3D NULL;
> > +	jpeg->slot_data.cfg_stream_handle =3D 0;
>=20
> The same here.
>=20
> > +
> > +	jpeg->slot_data.used =3D false;
> > +}
> > +
> > =C2=A0static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
> > =C2=A0{
> > =C2=A0	struct mxc_jpeg_desc *desc;
> > @@ -798,26 +824,6 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jp=
eg_dev *jpeg)
> > =C2=A0	return false;
> > =C2=A0}
> >=20
> > -static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> > -{
> > -	/* free descriptor for decoding/encoding phase */
> > -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> > -			=C2=A0 jpeg->slot_data.desc,
> > -			=C2=A0 jpeg->slot_data.desc_handle);
> > -
> > -	/* free descriptor for encoder configuration phase / decoder DHT */
> > -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> > -			=C2=A0 jpeg->slot_data.cfg_desc,
> > -			=C2=A0 jpeg->slot_data.cfg_desc_handle);
> > -
> > -	/* free configuration stream */
> > -	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> > -			=C2=A0 jpeg->slot_data.cfg_stream_vaddr,
> > -			=C2=A0 jpeg->slot_data.cfg_stream_handle);
> > -
> > -	jpeg->slot_data.used =3D false;
> > -}
> > -
> > =C2=A0static void mxc_jpeg_check_and_set_last_buffer(struct mxc_jpeg_ct=
x *ctx,
> > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vb2_v4l2_buffer =
*src_buf,
> > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vb2_v4l2_buffer =
*dst_buf)
> > --
> > 2.43.0-rc1
> >=20
