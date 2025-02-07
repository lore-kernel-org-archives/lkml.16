Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED4123C8A0
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945349; cv=none; b=SjhC0sWu8qT9WsBIaD0AGkgFZLXwJCAFr1INfCAG3MSsg+b2rkQTExBAL+7Q/I6RH6oZCqCCX8GlpemATpET5o7v8IivmMa4LmkQaQxQaZ4Q9IvlAps7uqmsXms90sAX6wsxWp3Zj+/fs3PovAyB8/+lm5xE0irvN6ibiMS6nn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945349; c=relaxed/simple;
	bh=iTsuxyEIymohulJzY7JTD8IGPdVLrm5BWF6T6qQbtUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EX70h6Bhwdu32N2jADBOCVCcdw4ajQQX7T9KEjib/v8VBOljlsmEl/zF8ThcVn2swuZA2Wm+GZFlv5pRDdD2ygQRsvjPDdKTP1R50y6l5z38dXWRLXhqIoNkeQ74KsjHjWZi68ZwVSW/qJg2CBcirMCu/GM31tcjWiBZUNIM2Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JUbYWZNH; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JUbYWZNH"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab794ae3cf2so48257866b.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738945346; x=1739550146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCn5Dk3vMVo7X1t68AtKlpToAukuif5wkQVCcdE+FHY=;
        b=JUbYWZNHAyUHLGGBjQk9NOUHCfDIgvwTalD6XE6mPQ0WD95Fk925PgC0riqYDQXoeg
         RnzfGEo0QdKWEGEyqiQu66bBEnL09SnM9UEBHkxtRJHK1MOibOjzQ94yDEgZo7RC8b2F
         h93byUEHrxLBsraVPGxjm1Agtzl09YaJvoCaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945346; x=1739550146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCn5Dk3vMVo7X1t68AtKlpToAukuif5wkQVCcdE+FHY=;
        b=IUDG6VzfcSVUsQaO+LmBZz+6B8Xt8rlKEqfES1yOVgjzJ1eugM8xFovYgaKOVJZE/N
         Stqb9kSMYwIn3LzsqUrXWtSqoqEvCSV2P3N2qND0DADCZQZJYHc3iB1TFx0ieoZaTeCi
         fvOxzYyPNc6IMBPMitcAAe39Xj/x+KFUez6YUcIhowkTE8GrwPbLRXvoDrT5H7km4E80
         CIwmxcBzvMP7zBYr7fyhUjLY0BpPyC4v5VdskujnOE46hzw/ahX20y4St131DR6RCX81
         bAhSlxrqaznCs6+aTnuTWpgdMZ0Ud2vL28Y/jZXBoKeEmpwgnCNUFu65yc2/LrKEC25j
         FJbA==
X-Forwarded-Encrypted: i=1; AJvYcCVj+zAOFZVVM3eVLQm+4RRhTuLNMeMPMwqzejxfhhSQ/yyFrrH4LALyGo1oC3/BZjSUqBO9h0OCUAWkaPs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOkWT1ZqQo17RgZJSZ7cb9Ln4ePqDeyRxW6vrTL5uTpT69VyJf
	uSSh1XEX3hUIKcMY/P6WmvUlb49Lz55HypWZKKVRRTyE/XV3e+MLx85j/M6HgqMw2EOL9Ms5Jvt
	DhObx
X-Gm-Gg: ASbGncuGb0tCMFylzJDg/prZgoHcvbvug7BidBaTT7330v5YwfPS3t8MDyEQ4E6v5v9
	YrSXQxixEmhLkT8lKqCwh51p28RhgajdnmZ7QGF7ivZHJwtpBZ0hsc2SWY7t0DIbI3p8TGQi4un
	pW4kWYdFQQOXrGB60RchDOfnwJst5ItTxg5mn9EQs8kwdOeBNRjB2U0y7mgQ7czzdnRdqLuCJRG
	WtIzRIyQJ2xafzJu+utMkJSmh4+mH9XA+vWckVYz+EbubxnUWoy7xy5vDniZ25eZoQhXNLzY7Mu
	MTiYvHh6XDv4J+Jr+pZtconqGuoXQ9qjVARNbiupycyRXNgV4Ho=
X-Google-Smtp-Source: AGHT+IEPrs4EH7/Z6+bBYYE//ub20rbteF5a8kQmVAMx2hToZtZLpXcLcs+yYXmRXd7dfunZ+KPCog==
X-Received: by 2002:a17:906:f59c:b0:aa6:9624:78f7 with SMTP id a640c23a62f3a-ab789ac0db7mr315356666b.17.1738945345914;
        Fri, 07 Feb 2025 08:22:25 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7917d10d4sm80965566b.105.2025.02.07.08.22.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 08:22:25 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dcd33d9d9dso11195a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:22:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWArK4Rp/P+dLq6J+guCJ+qxTqib1jB+883xawBs6OPKisgIphz2oFB/WxwD9LTegZz6KK0tk6KSAsZtx8=@vger.kernel.org
X-Received: by 2002:a50:ee16:0:b0:5dc:ccb4:cb11 with SMTP id
 4fb4d7f45d1cf-5de46901c8dmr116990a12.4.1738945344498; Fri, 07 Feb 2025
 08:22:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com> <20250128-b4-rkisp-noncoherent-v3-1-baf39c997d2a@gmail.com>
In-Reply-To: <20250128-b4-rkisp-noncoherent-v3-1-baf39c997d2a@gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 7 Feb 2025 17:22:08 +0100
X-Gmail-Original-Message-ID: <CAAFQd5BkbJz4VJOvj8P5gBtbi=VCgsgebw12PnepLj6Qn6C_AQ@mail.gmail.com>
X-Gm-Features: AWEUYZkLRr1JxCvNI8JDDZBOdbLkP21kufM0wZUw4Akj7bxs1aInWlFMBNe_a0o
Message-ID: <CAAFQd5BkbJz4VJOvj8P5gBtbi=VCgsgebw12PnepLj6Qn6C_AQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: videobuf2: Fix dmabuf cache sync/flush in dma-contig
To: Mikhail Rudenko <mike.rudenko@gmail.com>, Christoph Hellwig <hch@lst.de>, 
	Robin Murphy <robin.murphy@arm.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 9:36=E2=80=AFPM Mikhail Rudenko <mike.rudenko@gmail=
.com> wrote:
>
> When support for V4L2_FLAG_MEMORY_NON_CONSISTENT was removed in
> commit 129134e5415d ("media: media/v4l2: remove
> V4L2_FLAG_MEMORY_NON_CONSISTENT flag"),
> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions were made
> no-ops. Later, when support for V4L2_MEMORY_FLAG_NON_COHERENT was
> introduced in commit c0acf9cfeee0 ("media: videobuf2: handle
> V4L2_MEMORY_FLAG_NON_COHERENT flag"), the above functions remained
> no-ops, making cache maintenance for non-coherent dmabufs allocated by
> dma-contig impossible.
>
> Fix this by reintroducing dma_sync_sgtable_for_{cpu,device} and
> {flush,invalidate}_kernel_vmap_range calls to
> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
> buffers.
>
> Fixes: c0acf9cfeee0 ("media: videobuf2: handle V4L2_MEMORY_FLAG_NON_COHER=
ENT flag")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> ---
>  .../media/common/videobuf2/videobuf2-dma-contig.c  | 22 ++++++++++++++++=
++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/driv=
ers/media/common/videobuf2/videobuf2-dma-contig.c
> index bb0b7fa67b539aa73ad5ccf3c3bc318e26f8a4cb..146d7997a0da5989fb081a6f2=
8ce0641fe726e63 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -427,6 +427,17 @@ static int
>  vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
>                                    enum dma_data_direction direction)
>  {
> +       struct vb2_dc_buf *buf =3D dbuf->priv;
> +       struct sg_table *sgt =3D buf->dma_sgt;
> +
> +       if (!buf->non_coherent_mem)
> +               return 0;
> +
> +       if (buf->vaddr)
> +               invalidate_kernel_vmap_range(buf->vaddr, buf->size);
> +
> +       dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
> +
>         return 0;
>  }
>
> @@ -434,6 +445,17 @@ static int
>  vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
>                                  enum dma_data_direction direction)
>  {
> +       struct vb2_dc_buf *buf =3D dbuf->priv;
> +       struct sg_table *sgt =3D buf->dma_sgt;
> +
> +       if (!buf->non_coherent_mem)
> +               return 0;
> +
> +       if (buf->vaddr)
> +               flush_kernel_vmap_range(buf->vaddr, buf->size);
> +
> +       dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
> +
>         return 0;
>  }

I took some time (over)thinking the kernel vmap range synchronization,
because these functions can be called both from the kernel space using
respective dma_buf_*() kAPI and also from the user space using the
DMA_BUF_SYNC IOCTLs, so we could in theory have the multiple
invocations racing with each other, but then I realized that we don't
really provide any guarantees for concurrent writes and reads from the
CPU, so I believe this should work fine. Sorry for the delay.

Acked-by: Tomasz Figa <tfiga@chromium.org>

Let me add @Christoph Hellwig and @Robin Murphy just in case I'm wrong
on that, though... Hans, let's give them some time to take a look
before applying this.

Best regards,
Tomasz
