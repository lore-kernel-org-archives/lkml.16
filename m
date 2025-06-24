Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF75A6F53E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750725684; cv=none; b=EDFo9s3iZ4Su6LaJ9hpRA1yUpcvBeBxOa9Fa9g++OvZpvTStFsXi7GRjy7hAo9zOUUHZ9ltWmLoIz3S7YzQXsT4bKHGsq9RfehNlQR8Bvlm/cl8vNyxfH+T4NjgTDYIENc6jf/OOuaW+OwmtetsBZJF3rrxJmSeBj86jF+rCC2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750725684; c=relaxed/simple;
	bh=GvGEMD4Kki46f9H9uX0qMuel22O0AXwTFQlVMCNPfGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ozjsTWeZ9XTBcj/L72g7Kqu18lYV0ZXJ36qatzuN1nzp/8gMydOGc6T5W8I5w7xX9oo47fuqYGkEkfwpE912DsZsD35vsI7iebAHYv76tlasJwDszK2QN8DZYO/tqDMl8vddhB/eVuasP92eMpm3PzmGJb14jjCC4PrfrbX5b54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eGlQB4c9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eGlQB4c9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750725682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xbnuXzX6Ua5JYwe0HLbF3e8hcisCc2OGbdItWwpjUDE=;
	b=eGlQB4c9J+InAnQ6kAtELt7TJUtisvKqRdSEiiTcWyzcoxsO5No0aZbxxJlpFqfEw+n25s
	u0sqVf6s/ZEkhp8H2I2hiIesAQux+i/QG9v6ZGrLI5sVFDgWqmn+baA0Br9uE+yXt/JWsK
	gyTZi23usCHDOYya4y+YkZKDfEqwb24=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-C4TABJ2tNjOpOf64b9TWFw-1; Mon, 23 Jun 2025 20:41:20 -0400
X-MC-Unique: C4TABJ2tNjOpOf64b9TWFw-1
X-Mimecast-MFC-AGG-ID: C4TABJ2tNjOpOf64b9TWFw_1750725679
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-311ef4fb5fdso4169978a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 17:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750725679; x=1751330479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbnuXzX6Ua5JYwe0HLbF3e8hcisCc2OGbdItWwpjUDE=;
        b=KwiLzLvNIdeGpZB/2OFkWBh6PS1eaYlBsHdBvQlwl/5Rb+QtwYibEnmOTt+Fe5R+rs
         jtCA1jumMlrnM/TunsYmEenSnpIaSkk1lf/IGzTrfRBHYY0R9p3vGTgFfqVpfOUPpJmF
         PRHAfqS3MG7PeJx7+6eB9fTuz6fFqQvblQ3ufzfdyrSxvP3Oyq06x6HeJ6HqshyPbjcA
         QA69u0OPgYjVUqHYFDDQjMjcwallYJWB8yZZpcszkipgpEcae+m32zFHzLIy9I+/4MMV
         B+FLFHtuLHAAtOi1Ji3klzTwAjERTeMgy8XSdLk0ZC5A6R7nJrR9DjJP4IgFZx4QjSXd
         WXIw==
X-Forwarded-Encrypted: i=1; AJvYcCU4c6MFZFkzZOjIulZ5weVv31NjKlG0I1K2y8sX+LSv2Z9MBhzQizhG7TAGHIkUt4SdC/p6e/R5Y/aL5cQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyzhOnAh5JtqB9otHtYAt9GuwOeegzrFqLvbd1t5zoPAVtso3k
	Rnzd7LcUprLqitMtxwIv6P7Vp816Wm6gELFBDyrmNjyoqQxzkZaMJ2dan1ti44O8n9XTOnnfin+
	yWmHVB5p+9EjQcEXeU8DTyml1YnmZ2vh7XcoLWkSUzuJBVW2MNZKdhBU7Vth0byExL9CudPTH3w
	2rGwtID3LjfFiI3XypOugbN5iijN3YQj8HacCyKKqx
X-Gm-Gg: ASbGncsvsVgoVTPn2ps6JU4K24gwQFSJHxSVu0FCFF7Jt1rStNF0RTGZTFeuCtA5Uue
	x4GSiRPgaSh8irdOVCzxuVvFVOMZuAP0UkHgOc0AMVozXR1K7EnC2LAVsJbXAp4FJyK0iTc4g93
	kTjIi5
X-Received: by 2002:a17:90b:1b11:b0:313:f775:d381 with SMTP id 98e67ed59e1d1-3159d8c6018mr24356834a91.18.1750725679503;
        Mon, 23 Jun 2025 17:41:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6dEmVr9JtJH1QXjsGmq2JCy5G9t+XM+PlD3FqtiyHroh5fjeISWvwEljOQeseXbYcTgWgJVagbODZoUulpeM=
X-Received: by 2002:a17:90b:1b11:b0:313:f775:d381 with SMTP id
 98e67ed59e1d1-3159d8c6018mr24356808a91.18.1750725679038; Mon, 23 Jun 2025
 17:41:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <241C7118259DA110+20250623065210.270237-1-wangyuli@uniontech.com>
In-Reply-To: <241C7118259DA110+20250623065210.270237-1-wangyuli@uniontech.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 24 Jun 2025 08:41:06 +0800
X-Gm-Features: AX0GCFvlNF7ePY8RpTN4tJmMih3I4v5pSV8-lai00J0trBY4VR8RP0Arg9mHNag
Message-ID: <CACGkMEvwV3em-7kca9JnTmWCgtWJUrVdOXU9om8Mjcfa9pic=w@mail.gmail.com>
Subject: Re: [PATCH] virtio: virtio_dma_buf: fix missing parameter documentation
To: WangYuli <wangyuli@uniontech.com>
Cc: mst@redhat.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhanjun@uniontech.com, niecheng1@uniontech.com, guanwentao@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 2:55=E2=80=AFPM WangYuli <wangyuli@uniontech.com> w=
rote:
>
> Add missing parameter documentation for virtio_dma_buf_attach()
> function to fix kernel-doc warnings:
>
> Warning: drivers/virtio/virtio_dma_buf.c:41 function parameter 'dma_buf' =
not described in 'virtio_dma_buf_attach'
> Warning: drivers/virtio/virtio_dma_buf.c:41 function parameter 'attach' n=
ot described in 'virtio_dma_buf_attach'
>
> The function documentation was missing descriptions for both the
> 'dma_buf' and 'attach' parameters. Add proper parameter documentation
> following kernel-doc format.
>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  drivers/virtio/virtio_dma_buf.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_=
buf.c
> index 3fe1d03b0645..95c10632f84a 100644
> --- a/drivers/virtio/virtio_dma_buf.c
> +++ b/drivers/virtio/virtio_dma_buf.c
> @@ -36,6 +36,8 @@ EXPORT_SYMBOL(virtio_dma_buf_export);
>
>  /**
>   * virtio_dma_buf_attach - mandatory attach callback for virtio dma-bufs
> + * @dma_buf: [in] buffer to attach
> + * @attach: [in] attachment structure
>   */
>  int virtio_dma_buf_attach(struct dma_buf *dma_buf,
>                           struct dma_buf_attachment *attach)
> --
> 2.50.0
>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

