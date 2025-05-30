Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D452111
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748626454; cv=none; b=OoWufHzcMr4rWLYaP9sh3kfxGxCNQE53T9S0yI9toHlVWxNDUrMW8nXXfXNzuSRVEySJ7S63eEvTq4iMs5B3JgNhAsHYeToNRU57teYqmqonod6/y72+zvjTpQaSgDZuh48HIyZ71U3mH80IivoVcfKO8Vf5fKSSEyEjLpxJPOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748626454; c=relaxed/simple;
	bh=NUrbM1IHsw/iamRbw20s1vrlwE9qRJhYCkHTEZckSOk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OFR0hJxH06MaqFQ8MoRvCkS71unJcqbAgtVW+dPyyIUwFCGrp5qY0+gALEgOTuPdYP3Bptlc0BTp2CmumXfTT0ozrLbh7siWaBVIX0smUz/TV0yU4sOnA6fHN112D8bJqzp+/sAJv9GssILJGbaHt2egYjSomfu0jKuZimU4oOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=Q0rzxA1U; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="Q0rzxA1U"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c5675dec99so240065185a.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748626451; x=1749231251; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=buVLTLGIIGSDQEPVaBKvvla56/HpfEM5pnwMP7FjQZ0=;
        b=Q0rzxA1Ua628jAMTtWCck87WeVuvdCSPrJLdskxEWG3RatO680w3R31HAMF1djm8k3
         LprEhBxd+eDJNroDKRHbifvKtVgaeiCtUT3xjlIVp8e7YgulfQ7f+WFAmQ3WqzNVJv/u
         4IYz9c/RqApPJzw6H1D0f2s/Aw1zhKpfazHUddayiW9sAPIbDJTA6TCSqHlmwc1vMn6d
         H2eZr6ToyJuivgn/EkWw/6vq+cprpDvbQfFwN3FoQnl2EuIdxK5nO0LSak149D9PvjvV
         pRxtOq9sZhyWfsRmZq0+SdaWkK1DPzZXg6KTYhLQygr2aBk3eNrny+LEGE0aap2l2R0U
         bZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748626451; x=1749231251;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=buVLTLGIIGSDQEPVaBKvvla56/HpfEM5pnwMP7FjQZ0=;
        b=kiAnfkayrczNxcA4cLv8wXd2Q3ZC9AXtK10z1SECEnMoy6XRqqn+enPMPWU6fBlKOP
         fWvz7QOgttMS1nxwuOvVV00dYtvupcHqVz3dffmhnr8Y7tG1fDbiqezTX+blDJXG6V7p
         M/z62vXpuMOeEmsrI5tfC5ojmUw+dpLA2PzhKU05eT+jp2ErErJv+kSwppjdx8HOHzRr
         GCRVKHuMYxF8Z+OMX9E2tTNKeyrZQTsfrysjvVLAwVEMby9K3PSEqIMghFwH+mG3LCaf
         Dc5j/RgGVsgqpefhuLA0QvL9PANKGPNN64ww5xS1DKO95RTTU85afjwgue9wENVmxayM
         Z0oA==
X-Forwarded-Encrypted: i=1; AJvYcCWtZo1sQpLui0OcKckjf/wYeDJ/nBQBlX4B6+ceM5TV1tXWi8H808Jex8Gbc/i8ixTuIHDbVmLNnXqhwvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ+vl8/5uGjpelB9ZAU+PYbRoPZ3GnguZMRxWBe2qr8wcBrGHI
	g+19wMFtcvAxsKtySA4+a+ILsiZLHfooi6ed7VQqXC0DbTrWAQWzJZRfGytZ56ClTki2KwF99nF
	7YcgQwbc=
X-Gm-Gg: ASbGncujysb9CaiTZt9dS0nAPO9I83gM8BpxnEbfZNnS0KYa+9UwLizf299Sx+lV84Q
	zS/xdZzFQNzpF7v8jdnMt4ZiAreeu0VKAV7K50N+g6lADiqLxhOKa8IB1hytBGjynz8sRcLBfuD
	Gp5w70zvgvxWE1LxrqVykT6PmQWCbyNVlmPs5TM1ntnKocbBIHBfvnPxAFtiHSs2jlAOiQ5xfm+
	awZCvzcH7bJfOkqBRgq1o9zOr4HknEQE1VlMyvKYlqxZdz9XgAh/19ZhpWpoBwZJ/6IeqhPw9ze
	C02enLD4IPcVzplD59X8UUD3WxICoLzc+NMcEUwDRv+5Zl4SA5yPDTNm
X-Google-Smtp-Source: AGHT+IHjLHOAn3d1xA8OLMjNNh0KseItAA4qflnmZwhssThdabG4QAR2XR2GIUqKvALq3wp6IsH/tg==
X-Received: by 2002:a05:622a:260a:b0:4a3:d015:38b9 with SMTP id d75a77b69052e-4a4400c18cdmr80240681cf.39.1748626441532;
        Fri, 30 May 2025 10:34:01 -0700 (PDT)
Received: from ?IPv6:2606:6d00:10:5285::5ac? ([2606:6d00:10:5285::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435a633c8sm23319031cf.70.2025.05.30.10.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:34:01 -0700 (PDT)
Message-ID: <ac655c582609b7887381e1b68ed99f6b128fd794.camel@ndufresne.ca>
Subject: Re: [PATCH v5 06/12] media: mediatek: jpeg: refactor jpeg buffer
 payload setting
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: srv_heupstream@mediatek.com
Date: Fri, 30 May 2025 13:33:58 -0400
In-Reply-To: <20250530074537.26338-7-kyrie.wu@mediatek.com>
References: <20250530074537.26338-1-kyrie.wu@mediatek.com>
	 <20250530074537.26338-7-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Kyrie,

Le vendredi 30 mai 2025 =C3=A0 15:45 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> 1. for multi-core jpegdec:
> =C2=A0=C2=A0 core0: |<-------- decoding buffer0 and resolution changed to=
 smaller
> =C2=A0=C2=A0 core1:=C2=A0 |<-------- decoding buffer1
> =C2=A0=C2=A0 core0:=C2=A0=C2=A0 |<- handling resolution changing
> =C2=A0=C2=A0 core0:=C2=A0=C2=A0=C2=A0 |<- vb2_set_plane_payload
> 2. the payload size is changed on the step of set format. Because core1
> is running and streaming has not been stopped, the format cannot be
> set again, resulting in no change in the payload size.
> 3. at this time, the payload size is bigger than buffer length,
> it will print a warnning call trace
> 4. set payload size must less than buffer length

You'll have to rework the text in this commit message, I must admit I don't
understand from this text what exactly the problem is, make it really hard =
to
review your solution.

>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0=C2=A0=C2=A0 =
| 18 +++++++++++++++---
> =C2=A01 file changed, 15 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 0074d1edb534..52d59bb5c9ad 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -720,10 +720,22 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *=
vb)
> =C2=A0		plane_fmt =3D q_data->pix_mp.plane_fmt[i];
> =C2=A0		if (ctx->enable_exif &&
> =C2=A0		=C2=A0=C2=A0=C2=A0 q_data->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
> -			vb2_set_plane_payload(vb, i, plane_fmt.sizeimage +
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MTK_JPEG_MAX_EXIF_SIZE);
> +			if (vb->planes[i].length > (plane_fmt.sizeimage +
> +			=C2=A0=C2=A0=C2=A0 MTK_JPEG_MAX_EXIF_SIZE))
> +				vb2_set_plane_payload(vb, i,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 plane_fmt.sizeimage +
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MTK_JPEG_MAX_EXIF_SIZE);
> +			else
> +				vb2_set_plane_payload(vb, i,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vb->planes[i].length);
> +
> =C2=A0		else
> -			vb2_set_plane_payload(vb, i,=C2=A0 plane_fmt.sizeimage);
> +			if (vb->planes[i].length > plane_fmt.sizeimage)
> +				vb2_set_plane_payload(vb, i,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 plane_fmt.sizeimage);
> +			else
> +				vb2_set_plane_payload(vb, i,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vb->planes[i].length);

Is this the same as ?

		unsigned long max_size =3D plane_fmt.sizeimage;

		if (ctx->enable_exif && q_data->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
			max_size +=3D MTK_JPEG_MAX_EXIF_SIZE;

		vb2_set_plane_payload(vb, i, MIN(vb->planes[i].length, max_size));

It is unclear to me how this isn't just a workaround though, looking forwar=
d
your reworked commit message.

Nicolas

> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;
