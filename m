Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E320825C813
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748626701; cv=none; b=isQA4i3eYX1fgy9F72/NJ1io830yR3dx10aWkHeU6cpun3I4XIb08JSgrnZS02kiYcODesF9npDwfIc71ZzWo9IpHtfdxKO6k58osnPt7BYiXxkBWt1yNKdWTvLQ8jMQZPFHdI5Kn5AONh9uVdgzEaILKinMsfgb94Krx8eIG9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748626701; c=relaxed/simple;
	bh=X2Ll0iePDDZlr5wgx9c2MximCZGvceZrf0zlhHi0xIM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SF2HuISdcsuwXnjWjPlfWOS0dZ0pW32IwO73TJE/BHFupggkzjhXySNyhRpTyXxs5DDt4Sh+aBY0Uywmy4sNNsqow3UNQtkdiK5etTC1DvTfrJYUupXzhAOsoYQWmPYBnUZnzTFzygBKAyqrvkf3En63TxfE3UwLHLIWtnKZyAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=2b0hcrG4; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="2b0hcrG4"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47686580529so21610931cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748626696; x=1749231496; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4XJgKivtCt5LJoQcbBThiFJZHfZb7pmb6uFcMoblf8Q=;
        b=2b0hcrG4YC5Q7JhDEHkFwQGsz8an/MFJrXKgdwVnxQoZ1EbeyD9cpVIheFQbbKwCpq
         UotaR5TeD5df+FmzJDa7Yo7O40amzo7H/fmZw5sgS9IZUB0WqmBQMlBldHDfXvOxKp61
         NFt2CVFI8IvGBJZhAlBTbsQTvCfaNbZsIW8NHjCpMaMqV0kW8NFxjL+gGmNiSJE8eORS
         0p1RVxB6bLJdrbITDllyJvRfgMQM2EJlepR0awxjxsGqlvq1OJ+EppQoPZspAUUD9AhK
         sSXV94XcvB0F+bFLUXoWC8nVCz/acHI3o2fCqJGSv+d5CB4rcY4A8mmPytDZ+VfBI3rW
         nKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748626696; x=1749231496;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4XJgKivtCt5LJoQcbBThiFJZHfZb7pmb6uFcMoblf8Q=;
        b=ntjew6fsb1KGqf0nyG/oANoXbtJSAFCXTOl4cc/WFHNqLk3oD8dlVz4iBPzayBOR85
         oiJ9KwA3Gempn/6TVDen/hODoUoj6tPMlzP60oesH1uIl8YdgiOsWQBulgC0bVVHUS6G
         lLJ4uBHBshdwBmlNP0zKt7IxiJAKMBUNzZCj4dsYQ96ZJnI4wcXyFdiAT11Vt8W+mm/V
         C0SgPxS3+7UcsMfGbyYNiyVJDzs8E9MvF9bLEw6liYIGVQo4khCqBc5KQpHv3n69NjpG
         4wpjKjFmHvMGgNjs6EoynVZo2LIn6Zlsp4XBDOfEsIh0hekT/5e+oFkZ/u4tccphmc1G
         MJIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD8PqU/h1Khd2dWWZ1BER0ZJxUni6NuN91YdSXdtPGYFVP1KujlMsOo5ggqC+TagBa8YHQFalbGbSa2mU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpOzRkBMxzPr33HP3RyranRKDXT3HGe1aPzcJqsLLT5jiFvZxM
	Z1jBPK+9M/7lHkj0YkURPWmiIBuhn96UUmjfu4wglCo7ZtEbxc0dIxmV0xOY3hSkFDo=
X-Gm-Gg: ASbGncsNAhvjG6/4c7HOBk1aYQroC1pYkzm3Gi+LU2iAmJHZk+tcM2VUHWuCcqeKBfz
	In35HOZlGMFegs16e0FYI55ZNElZUA5rXV2Dhs3oEZW/7uOKGrhz5SrWnyTSXG7VHIU+Sze+vnj
	1Fb9iDWFPMW1m+bLLreqyiF/CAxp2rvPOu7SD67DUnQgZ75x9iKyCFTZXjZdizCMPOJS+gjF61C
	cega1auG66JUa6FTRPq5HYKrLKvBPRwZNV4IFo4oN7dIAf0ivaCnO0jFnNdgxZglFfEAiW1NsYq
	+vgQhWmJW/TFY+kkCb8+lcuBeU2Z0HJsz687vPe85qoFKCa+xEJV8m1Oxl8OnLU9Dto=
X-Google-Smtp-Source: AGHT+IEm6WRR1loVcMiU2DqaH+dlvJGnjKbEYabizfJDoQi11LUDznGgxwtmSqdbcL6beHmdAwv8gA==
X-Received: by 2002:a05:6214:2524:b0:6f8:c23c:5257 with SMTP id 6a1803df08f44-6facebdbb1amr58096746d6.11.1748626696550;
        Fri, 30 May 2025 10:38:16 -0700 (PDT)
Received: from ?IPv6:2606:6d00:10:5285::5ac? ([2606:6d00:10:5285::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e1a90esm26195946d6.105.2025.05.30.10.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:38:16 -0700 (PDT)
Message-ID: <8eadc152c3542c30fb31bb67093087f2bb0a6c31.camel@ndufresne.ca>
Subject: Re: [PATCH v5 07/12] media: mediatek: jpeg: refactor jpeg dst
 buffer layout
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
Date: Fri, 30 May 2025 13:38:14 -0400
In-Reply-To: <20250530074537.26338-8-kyrie.wu@mediatek.com>
References: <20250530074537.26338-1-kyrie.wu@mediatek.com>
	 <20250530074537.26338-8-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le vendredi 30 mai 2025 =C3=A0 15:45 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> 1. change dst buffer size to same as struct mtk_jpeg_src_buf
> to make sure all params of mtk_jpeg_src_buf could get a memory.
> 2. For memory alloc operation:
> the v4l2 framework malloc a memory, the base addr is vb2_buffer and
> the size is sizeof(struct mtk_jpeg_src_buf), mtk_jpeg_src_buf could get
> itself addr by container_of like that:
> vb2_buffer -> vb2_v4l2_buffer -> mtk_jpeg_src_buf.
> vb2_v4l2_buffer must keep on the top of mtk_jpeg_src_buf.

The subject imply a refactoring, but the most important change in your
patch is to fix the wrong buf strut size. Can you rework the subject
and message to state what you are fixing please.

Add a Fixes tag, and moved it at the start of the series to show this
isn't a problem you have introduced in previous patch.

>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h | 2 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 52d59bb5c9ad..7e3509be6f69 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1103,7 +1103,7 @@ static int mtk_jpeg_queue_init(void *priv, struct v=
b2_queue *src_vq,
> =C2=A0	dst_vq->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> =C2=A0	dst_vq->io_modes =3D VB2_DMABUF | VB2_MMAP;
> =C2=A0	dst_vq->drv_priv =3D ctx;
> -	dst_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> +	dst_vq->buf_struct_size =3D sizeof(struct mtk_jpeg_src_buf);
> =C2=A0	dst_vq->ops =3D jpeg->variant->qops;
> =C2=A0	dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> =C2=A0	dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> index 655dc9c3280c..186cd1862028 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> @@ -96,10 +96,10 @@ struct mtk_jpeg_variant {
> =C2=A0};
> =C2=A0
> =C2=A0struct mtk_jpeg_src_buf {
> -	u32 frame_num;
> =C2=A0	struct vb2_v4l2_buffer b;
> =C2=A0	struct list_head list;
> =C2=A0	u32 bs_size;
> +	u32 frame_num;

This "refactoring" should be split, it does not fix anything.

Nicolas

> =C2=A0	struct mtk_jpeg_dec_param dec_param;
> =C2=A0
> =C2=A0	struct mtk_jpeg_ctx *curr_ctx;
