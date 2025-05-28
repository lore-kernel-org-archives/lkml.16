Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD4A24418F
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 07:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748416251; cv=none; b=f3QgX6YAKeY/OWc6NR0EfFr3O6nmuEswbNMvir2rzDy+jABglDRX2hnE66vFP7bOQ+icuMb/AIQTwhIiQ5oagLoqnKcyySnIR4+u+vvTix0TWhjBnE/2Bbeb16qAQ40G+4wehNtSZrCoRkWzmqvCHDn46M9wtm5FHd/N2cKmDcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748416251; c=relaxed/simple;
	bh=xJQPB2jy1v7zTbPkh6FR3Feggx+J19/Zgl2VfQfYFmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jlFlJ9EoMAqi7Kr8GyOqISBjfn5GPLNzDl0XbWJ5oEZeOav7pY7/zJBcsL4NZ7TZwIcKg9vKQqPr67Y0xll03sBaOXfVmjxvktHTshZQ4lku1Npw7X8/+KI2ayHiPyy3s3DZUii6Htep6VE4y2M73pH7SlqRBQQ8EbsSjMB6g0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dhbfL5RL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dhbfL5RL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748416248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ssZ9dBa9v+HNDbUH5Jeunvi9xbhwLoe63txxouNgBgo=;
	b=dhbfL5RLeBJu/r3EwTXGdWyYny4zQux79QQHIxELhFyfNvyNL5rRX0OPFV6NB+hATY/vSg
	gQIIwsWa8zf5kE6jTwkkTOj9Ox1kCuvawp4ay6PdaeWWSlT2jf05HmLpORZM54jX7tunRE
	tRFzk/nMqSq5jmWwU8d+wzPZMOdHZgs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-Itd9GtzDPIS95YHMzLH2Tg-1; Wed, 28 May 2025 03:10:46 -0400
X-MC-Unique: Itd9GtzDPIS95YHMzLH2Tg-1
X-Mimecast-MFC-AGG-ID: Itd9GtzDPIS95YHMzLH2Tg_1748416245
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-604fe4c3130so957244a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 00:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748416245; x=1749021045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssZ9dBa9v+HNDbUH5Jeunvi9xbhwLoe63txxouNgBgo=;
        b=Q3KRInMd04S1nix9+R+1r9q1J7AUpzbtuqoQG8wL5spXA2pfQ4ydzr//1HxUM6bBxh
         ghXLd2mRw+jbWOAlTG/4HY+CczMTmYV9CFNVD0iMsqtl3x5Np/hzRaRDC8TiixnCyVdJ
         NVqh6NP64xIgQMSYtouJPQFcwD+kqFZ46OkeXFFZfMxPYHdcaKeTAA40NH1BM1aXphmT
         M2aAGzDZv15tLWATlvEValnZ8rt26yQ0DjfeZbsTO6+ML70nhhkCfImLrPjMnH+NnTsK
         xqnsxJdHMYB1sTecKAXQ73uKcol+lIFGGOf2pGQQT95iTRETuMJZaKU1QjyHvGy3NM0L
         LhzA==
X-Forwarded-Encrypted: i=1; AJvYcCXBfDAA4j+w1/jvPW86XxBT764clu3fTE/PkOEUpG85lpSfsvINbMKJgLvdBY2kD5nnhqB1llkTtkLocu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIsJaF75M5inq+cuqAZU95a+ekVprPUJz5j+WdrY+BJSFfSAdI
	xL0z9QLdEipW1fIAb26w0MAbEvWFxKxRVWpuRmsJKrQwzRvaAC68zKarUaPlalRgHXTubkhIvK+
	c1QnObI7HOANpmifbxceCBRikDGDJbb71e5gZFbmvUfJWwkLJNmYNnKkrh7QBue1/zDN9dr67x3
	K5qFhNclzmJaXGAHULfbx6gjB2rJkibei27svepboo
X-Gm-Gg: ASbGncumRSQoHPnFEmb0gjULZeWgOYskEerclCi/IxgPtRytfVbwFlg6qxCNNnUw1jq
	uahxR6I00nJbgbHSvd+xlJQjRNojFREdoaL8RKSwtw6QJqDJAYKcqZ+FEJw+uZrvQywKG
X-Received: by 2002:a05:6402:26c6:b0:601:96b8:afe0 with SMTP id 4fb4d7f45d1cf-602da2fefabmr11888269a12.23.1748416245473;
        Wed, 28 May 2025 00:10:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhePeWEVZFOz+kI3JlZIyc3qnBTWbWKY31bwy6WgdYOBXQx5QKLLmHYdASVWDKNw5R6TVEFe3x2F1cl46tYTk=
X-Received: by 2002:a05:6402:26c6:b0:601:96b8:afe0 with SMTP id
 4fb4d7f45d1cf-602da2fefabmr11888240a12.23.1748416245102; Wed, 28 May 2025
 00:10:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528064234.12228-1-jasowang@redhat.com>
In-Reply-To: <20250528064234.12228-1-jasowang@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 28 May 2025 09:10:06 +0200
X-Gm-Features: AX0GCFvrQcz0mEYQCyDO34FgjW8CGt8vHecpgrGd5CfDkSoAIVHfSNiJO934Pvs
Message-ID: <CAJaqyWd=L75X6umxBzOd1SYfk1vTbBcPMTSmxJZQZ9kMMsbrXg@mail.gmail.com>
Subject: Re: [PATCH V2 00/19] virtio_ring in order support
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, xuanzhuo@linux.alibaba.com, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 8:42=E2=80=AFAM Jason Wang <jasowang@redhat.com> wr=
ote:
>
> Hello all:
>
> This sereis tries to implement the VIRTIO_F_IN_ORDER to
> virtio_ring. This is done by introducing virtqueue ops so we can
> implement separate helpers for different virtqueue layout/features
> then the in-order were implemented on top.
>
> Tests shows 3%-5% imporvment with packed virtqueue PPS with KVM guest
> testpmd on the host.
>
> Changes since V1:
>
> - use const global array of function pointers to avoid indirect
>   branches to eliminate retpoline when mitigation is enabled
> - fix used length calculation when processing used ids in a batch
> - fix sparse warnings
>
> Please review.
>

Reviewed-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Thanks!

> Thanks
>
> Jason Wang (19):
>   virtio_ring: rename virtqueue_reinit_xxx to virtqueue_reset_xxx()
>   virtio_ring: switch to use vring_virtqueue in virtqueue_poll variants
>   virtio_ring: unify logic of virtqueue_poll() and more_used()
>   virtio_ring: switch to use vring_virtqueue for virtqueue resize
>     variants
>   virtio_ring: switch to use vring_virtqueue for virtqueue_kick_prepare
>     variants
>   virtio_ring: switch to use vring_virtqueue for virtqueue_add variants
>   virtio: switch to use vring_virtqueue for virtqueue_add variants
>   virtio_ring: switch to use vring_virtqueue for enable_cb_prepare
>     variants
>   virtio_ring: use vring_virtqueue for enable_cb_delayed variants
>   virtio_ring: switch to use vring_virtqueue for disable_cb variants
>   virtio_ring: switch to use vring_virtqueue for detach_unused_buf
>     variants
>   virtio_ring: use u16 for last_used_idx in virtqueue_poll_split()
>   virtio_ring: introduce virtqueue ops
>   virtio_ring: determine descriptor flags at one time
>   virtio_ring: factor out core logic of buffer detaching
>   virtio_ring: factor out core logic for updating last_used_idx
>   virtio_ring: factor out split indirect detaching logic
>   virtio_ring: factor out split detaching logic
>   virtio_ring: add in order support
>
>  drivers/virtio/virtio_ring.c | 896 ++++++++++++++++++++++++++---------
>  1 file changed, 684 insertions(+), 212 deletions(-)
>
> --
> 2.31.1
>
>

