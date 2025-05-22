Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD3E847B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 01:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747879036; cv=none; b=jZap8VtR26yf5S/ljK2/pyQ0jmI2AgmDA353vKrMgkz9ucyruNZjGyBsKOEG1O1doTawZuq/rx/0CvZrqOQDiLLfRc7wl+3nsWgwzopQ8CzUGCujNaUgT6vyczneQv141te9xRS8fi1mGq7Va6Jy26Ycs/b6FQWp2dE/rLJcra4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747879036; c=relaxed/simple;
	bh=YoSCo1OLY/cJ9CLaYfzANnDqrQr4fOYlitnClfwyP30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qXsv/YJUoYCcaSLlHNnRsyUj0wOcH3NVuA/UcRqCdLXml3HSPoENYsMGBlDJeMd0OUi713AhQRw2bj+SVCN6VT4ZpGjYVai99u7BPalEhFdxzudc/uomFEQWKWoUm0JSyONy143vXTGX8tF21f1eisvCj+IxkT489PjKd77/6+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J5L7iEmV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J5L7iEmV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747879033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vVv0T3X/nkiRNcQ1lUMwhZJmi4NAvNXbrMSeB9cuTI4=;
	b=J5L7iEmVljEf8p64IrbPwHQgs3NdJJMZktfDgzxPES/a/KAvgxueKGshQH4KaJ0T4pmfQN
	CgKXA+fXyA2C/M0g5OUTU/d2FqlDkJo7kAblRc2tGN6XFXYmovg8twPlQCtbccQOQh98GW
	u38OfKFfFIR5QypEz1ukVn7Dy89+IBQ=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-jSPI6dPXO3OIwhpu5AnX6A-1; Wed, 21 May 2025 21:57:09 -0400
X-MC-Unique: jSPI6dPXO3OIwhpu5AnX6A-1
X-Mimecast-MFC-AGG-ID: jSPI6dPXO3OIwhpu5AnX6A_1747879028
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b26eec6da92so4203286a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 18:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747879028; x=1748483828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVv0T3X/nkiRNcQ1lUMwhZJmi4NAvNXbrMSeB9cuTI4=;
        b=lIq9bZl63c05nit8MkSHKuQ7Tut9fe44E4cIzLZTFZ+pnkm41G8gPq7RYh9DZkrAoo
         /CbLxeuKHP2vtpH5ZFQVhgJlJLRDPxFXkFsgKgynUDObnAprp88akXbNmyjYdBWynKT6
         +rohLufNV3Xl3jlDy9To887pUhQ0aS6Beye7SUTn7o8+PLXi1Mki/r6RBZJ9ncfG741R
         uVndd3fMjRQzOlRP2/q7I1PXqhrki1h9MaCYQOxbKIHoiFvUEn+cUI/8tr83N6X8rfxp
         KDnIcA3xEulGrDWKpZJ2LIgIXNwMXYf+JJlod5qECqEG9PttKtLgvSH7QpZSFLAx47QL
         phmQ==
X-Gm-Message-State: AOJu0YyAFqgw+t5B88FQdrcYpwB0xXtfjLV2wV5AgpH7Y2lacuaZMWYq
	FmnfonZh8bWmZjWeb6vsomqzpdiqKJmYxkTNgy9bMqUr1VneHQpPWPexNiVM999qzfsCbkp2WW3
	V0hi6gQ7k4/dg3vSmr7dQHIqaxKfYIR+Jtf9MKr82E6u/a3iFscQczgPaiPjopjq54fmGOvIBfz
	NWozwKuiIQqMd+2s3C4HDLyyvUi4v4KUycfeC5ryTt
X-Gm-Gg: ASbGnct80D4qTGjUUinCPc6jmROPteuxk035W6SMXy3XqC0wjTW8gPiJDNw+6CFvoX/
	PO8F+TAQgH5GfbQbdGxh3Wwbm322ZtpTl3IkyOojYSopfWkPqQbwbBMDKhG2SVKejpf25Tg==
X-Received: by 2002:a17:90a:ec8b:b0:2ff:4a8d:74f9 with SMTP id 98e67ed59e1d1-30e7de633ecmr35326473a91.10.1747879028225;
        Wed, 21 May 2025 18:57:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5z4/0/D7/zhmwxsFA9hlVnqABSKxCuovnN31Uf36DePUPnzuC9RA1PtrB9u1qV0YRXdqm2r7m67cykpEmzeQ=
X-Received: by 2002:a17:90a:ec8b:b0:2ff:4a8d:74f9 with SMTP id
 98e67ed59e1d1-30e7de633ecmr35326439a91.10.1747879027764; Wed, 21 May 2025
 18:57:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521092236.661410-1-lvivier@redhat.com> <20250521092236.661410-4-lvivier@redhat.com>
In-Reply-To: <20250521092236.661410-4-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 22 May 2025 09:56:56 +0800
X-Gm-Features: AX0GCFtopRBJ8l40BSYI5k4Wdowo2Yl85Lt_6lA34RTQrfvR4Hig-8myMr3FqXk
Message-ID: <CACGkMEugbqFKEQ5zZrhz7wxETQQcGZK=SqQRbd59OOoy3y-MQg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] virtio_net: Enforce minimum TX ring size for reliability
To: Laurent Vivier <lvivier@redhat.com>
Cc: linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 5:22=E2=80=AFPM Laurent Vivier <lvivier@redhat.com>=
 wrote:
>
> The `tx_may_stop()` logic stops TX queues if free descriptors
> (`sq->vq->num_free`) fall below the threshold of (`MAX_SKB_FRAGS` + 2).
> If the total ring size (`ring_num`) is not strictly greater than this
> value, queues can become persistently stopped or stop after minimal
> use, severely degrading performance.
>
> A single sk_buff transmission typically requires descriptors for:
> - The virtio_net_hdr (1 descriptor)
> - The sk_buff's linear data (head) (1 descriptor)
> - Paged fragments (up to MAX_SKB_FRAGS descriptors)
>
> This patch enforces that the TX ring size ('ring_num') must be strictly
> greater than (MAX_SKB_FRAGS + 2). This ensures that the ring is
> always large enough to hold at least one maximally-fragmented packet
> plus at least one additional slot.
>
> Reported-by: Lei Yang <leiyang@redhat.com>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  drivers/net/virtio_net.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index ff4160243538..50b851834ae2 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -3481,6 +3481,12 @@ static int virtnet_tx_resize(struct virtnet_info *=
vi, struct send_queue *sq,
>  {
>         int qindex, err;
>
> +       if (ring_num <=3D MAX_SKB_FRAGS + 2) {
> +               netdev_err(vi->dev, "tx size (%d) cannot be smaller than =
%d\n",
> +                          ring_num, MAX_SKB_FRAGS + 2);
> +               return -EINVAL;
> +       }
> +
>         qindex =3D sq - vi->sq;
>
>         virtnet_tx_pause(vi, sq);
> --
> 2.49.0
>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

