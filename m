Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5621713BAF1
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747789351; cv=none; b=npNmVYyYwk+XSZVw5TkrfMzsOHs1EIFjQse8/gcz6dDFOtCMGCgrr1hcRbyrImqgXwkMjNJWWblrLF6wUiJuptENyBjFWM0YO6gYsbpWDR8T9L8V4wVTPCxOltyMTChiY8w5eFJbkBMviGTcCcVrmzS5lrlOyFgCQywMtp/7YCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747789351; c=relaxed/simple;
	bh=O33VdhTCzVm3TAY1aERPfCWJvZB/zfCLqnEIZIZqyig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZpU5eFTxVImB77R4zZv0ylye15NRSk44Rx0VnF6L+tvAGvCEFIWcs8TGdJyU8x03PplYZTkUJagXmTpi3mBV6q2jt5f3+m6dl/pCNK428tunzWI+w7Os3Ra5m6+bGMQAA1QRtYQtddfFUEx8ZIpSjE8Jym2OwL5tI0KyFTTfnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M39czcrZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M39czcrZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747789348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rc0wCNIYnwUJVUAky1/kj4SQFT8RKF0SdRFnhcDQNLk=;
	b=M39czcrZZiYquveJ15YHXZ4wEvPJudpeN1fzj+jLIZxn8xGnVa9VVdu3wZrLpxFJN1yWaQ
	401BjT0tgBBMfE8sE/ZgsjEAZEtvJJmPzIo4Ikitu9aVZ/7rnrteECo01pZckiiiuCZiyJ
	NHS608PeVkvYAGouXyfsIb5pj1rKbSo=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-tGlR6KK1MryrwL6QVA2gog-1; Tue, 20 May 2025 21:02:11 -0400
X-MC-Unique: tGlR6KK1MryrwL6QVA2gog-1
X-Mimecast-MFC-AGG-ID: tGlR6KK1MryrwL6QVA2gog_1747789330
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30e9b2e7a34so3246458a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 18:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747789330; x=1748394130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rc0wCNIYnwUJVUAky1/kj4SQFT8RKF0SdRFnhcDQNLk=;
        b=APg3locfCDifXYdX9pz7c9RDuzzoKzdF+LEQCECy4ROlz6T+9L7RWlLad7OjVExG0H
         j3lwDPnhwMYzaaMRHqBz+l3L1pOhGJxZArhaxtzcxC6jz/ILKVuw0ExpU23OegUQCkdJ
         ha/rzmngBBlZz6ONy6PUYWDbdn6Dimo44vkQuQ1HHxxNKdFjF/vmjooyLwTvHHjUjkrx
         UjliEaMBR5UCmg4r2LnE76tSAWnVsQw9d6Icob36HY6fBDleTQUCf3omRhQpP+jy2NHs
         oxKNoEWJrcElYw3gSpIaGkDJta3OZnkiHZbTX48tMbyp0YycUR2WcQY6gxjnf6iJF62U
         tacA==
X-Gm-Message-State: AOJu0YzrePDog31XXolP3N6csg3Ht9Rthf5MhWoG/H++ZI1sEUy37nDV
	upW85YVRpPjCN4JfHKld7XHv4Z3x8R1oQNiFNcyZ+ij5NaZCQ9ldSVqyYGVtYpIQV0MWJXsZ/vQ
	jkClPIhCUM0NcJolNSWje+LAJDQINNv739eH94hbH2A0xOoPxckga3bUHvwUUl664oU+RmnbK9b
	Axh+Ozd9tC0LNZB3qIh/+hp2ZFbDWxJ9/1GmERke3W
X-Gm-Gg: ASbGncsYkcxVb2267VwFG7Lie0TR/orWtAyf7IsyvR5hKIk9dRtXtkIHx1FoDT8aSQS
	8ZaI+UEsiCMRBn1N9ZY8f+9jnfj7QPySEw0I8g59Ax4adr1vvpIBLqdRtW6qRilVyNp+JkA==
X-Received: by 2002:a17:90b:574c:b0:2f1:2fa5:1924 with SMTP id 98e67ed59e1d1-30e7d5b6f64mr24922208a91.26.1747789330331;
        Tue, 20 May 2025 18:02:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVVFvpZdZ4r+oVmhw4/sv1St3/fu3mLokNhAk5APUxIRZZh/XvVJIFYhEQHYIh8xHlAFatT9Pn513p5tplJJ4=
X-Received: by 2002:a17:90b:574c:b0:2f1:2fa5:1924 with SMTP id
 98e67ed59e1d1-30e7d5b6f64mr24922153a91.26.1747789329792; Tue, 20 May 2025
 18:02:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520110526.635507-1-lvivier@redhat.com> <20250520110526.635507-3-lvivier@redhat.com>
In-Reply-To: <20250520110526.635507-3-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 21 May 2025 09:01:58 +0800
X-Gm-Features: AX0GCFsaYO4uVJj44snCtrWXyqLzuFjw3y_DOy4i26ruogIAYBQCZYeNoq2bDaQ
Message-ID: <CACGkMEudOrbPjwLbQKXeLc9K4oSq8vDH5YD-hbrsJn1aYK6xxQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] virtio_net: Enforce minimum TX ring size for reliability
To: Laurent Vivier <lvivier@redhat.com>
Cc: linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 7:05=E2=80=AFPM Laurent Vivier <lvivier@redhat.com>=
 wrote:
>
> The `tx_may_stop()` logic stops TX queues if free descriptors
> (`sq->vq->num_free`) fall below the threshold of (2 + `MAX_SKB_FRAGS`).
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
> greater than (2 + MAX_SKB_FRAGS). This ensures that the ring is
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
> index e53ba600605a..866961f368a2 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -3481,6 +3481,12 @@ static int virtnet_tx_resize(struct virtnet_info *=
vi, struct send_queue *sq,
>  {
>         int qindex, err;
>
> +       if (ring_num <=3D 2+MAX_SKB_FRAGS) {

Nit: space is probably needed around "+"

> +               netdev_err(vi->dev, "tx size (%d) cannot be smaller than =
%d\n",
> +                          ring_num, 2+MAX_SKB_FRAGS);

And here.

> +               return -EINVAL;
> +       }
> +
>         qindex =3D sq - vi->sq;
>
>         virtnet_tx_pause(vi, sq);
> --
> 2.49.0
>

Other than this.

Acked-by: Jason Wang <jasowang@redhat.com>

(Maybe we can proceed on don't stall if we had at least 1 left if
indirect descriptors are supported).

Thanks

