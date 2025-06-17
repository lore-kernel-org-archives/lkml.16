Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A934B2DE203
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163435; cv=none; b=El/iiPr5Rlpi9zSMdPdPO4kYqZrTCrHMB+5eQgJt3ZSFhRSK2UHgyTwuQxzHAj/TnPpNw75t6KwglYj/GKkR0gTEYV+iqsojXMGMwTaC1TgBl3e5a+tOhr5ZdePiWjgnjRdHUHObuLkToM2W+vZCOVz0fBueRw2cGZ0gNodoOeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163435; c=relaxed/simple;
	bh=TB/w16P9pB9DnXe6stqbMfh5xgU3Sips4Ssv9O+y+GY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F4RU9GFbvRu48DcgVgzVJlIZFidiAP1tOljT+wSHlHmeA9H1CMqosadyKsRZuivjsZlVJq+Ftgz3uPFsUpvA4xi3c3R0Wlt4jFmMSBCtUbIaxW5YI3gUVtiLnSZK2aeXvWWYdC+8qkDgvhlV42ZJcEW9PwfjbX6dinxoTiEL3j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fcGV2Eqk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fcGV2Eqk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750163432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C4KpzV7mfKG7YJcI56fObFy+07qjMjy6zIN0X7a6W3Y=;
	b=fcGV2EqkpwmV0BYWpkWiPoZAyeDypJkFY84lfgbm8I3pTN+a5gdEybWtbpeo+1lqTWBt5+
	/324+flPE68+pQ1o2l/05aSI7mBudpUMftk/Nufq7cA2tsmrKZLfraxngJ5o+8fxKhPKIw
	J50q0vMsbJEvERlkImHWE72Tn5gP2cQ=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-a6kBgiL_M-umOWDjdJQMMw-1; Tue, 17 Jun 2025 08:30:31 -0400
X-MC-Unique: a6kBgiL_M-umOWDjdJQMMw-1
X-Mimecast-MFC-AGG-ID: a6kBgiL_M-umOWDjdJQMMw_1750163430
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b2c3e576201so5230246a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163430; x=1750768230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4KpzV7mfKG7YJcI56fObFy+07qjMjy6zIN0X7a6W3Y=;
        b=O2NXoeRS1mvsenVJbi5Xw5wU38Yo5rMN3/1vsyHYT8WGLdpAD1J/jIZ2V4oNBUmM+a
         pB2z7p6+ii71+4aSmJAhjZhu+ep5t9Hvgb7YrJd8W3lwvfWzz9B7b8cfPER9smSBKzWI
         7L0dkYzBkGtng4w/YngPZ/qBCkrxJEVmuZTgkLdvTthn5mnxOD/vckmhLMaaeiizzRHO
         HQZ1pt0yiRcQcZJqJZVsWyGRyJ6sEEtE48km87vcvad3R5H7qe3Z0xvbSZCxkt1kaat4
         Wi68TkoVyFP2LYqGs+QLlZzC5ob3xOTlgZck4KFlKAzhgvl5EXHiqLnUbQucWDRS2LLS
         ItcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfftOrtDWuEAiH06V7pWBSEJYEEQNL/zoCoxlyvUdlptndBbmxFGetHpyo6/45NrODyMiESAeCahnewXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx10Y516tRAuxL0RChuOgDF1B+ax+gtBQvC3VYDuPyjeZTA1T4U
	lgdKwh4t4U9g82aLwGXsqk4fz3ouV3IsRUghM2YtkBCoTX40o1NsXdXQNGora3nQX6t4lacum6v
	N6za+x+AZ4+akBzz1sjf5Ek+EpnMvE3xTLdSRA3u4VW8IugygcLVtusm1pGLlI3ghcJQgvDJPZ6
	fEg6o835Rn30F49YSMiTXt2Ju28wP5mAgmsOuxBacB
X-Gm-Gg: ASbGncvzPWRu8WR3SCzYx5qm3LjKqKTbmcvKyY9GMkLk2spfrVUGnFbbPrkxYQPJt7O
	6bGe45tJ6/R9nmJPf2iNw8REFC4hC75aJayPj9XKKaQH0q3EfU5+zt7y4GqUxgCAl5XHghFY4QX
	Os1g==
X-Received: by 2002:a17:90b:57c5:b0:314:2cd2:595d with SMTP id 98e67ed59e1d1-3142cd260camr1982709a91.8.1750163430338;
        Tue, 17 Jun 2025 05:30:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQNEBXEy5uriJtOkqUSJvEhCCTvxWbcelcAhaQW4UNtVmCQ1n9HvM1d8Jev83IHABwhp+As21PazyBz3dX5LY=
X-Received: by 2002:a17:90b:57c5:b0:314:2cd2:595d with SMTP id
 98e67ed59e1d1-3142cd260camr1982671a91.8.1750163429917; Tue, 17 Jun 2025
 05:30:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616082518.10411-1-jasowang@redhat.com>
In-Reply-To: <20250616082518.10411-1-jasowang@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 17 Jun 2025 14:29:53 +0200
X-Gm-Features: AX0GCFusAvHVE3AZoZTULayMywUaufTKyuftKIh_kB3-gFeGtOgP4a0XWHoJg-U
Message-ID: <CAJaqyWehyX6TvfCk_8L_dKxkkpR-P2CwHbobGOs5tX8rhxQyjw@mail.gmail.com>
Subject: Re: [PATCH V3 00/19] virtio_ring in order support
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, xuanzhuo@linux.alibaba.com, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 10:25=E2=80=AFAM Jason Wang <jasowang@redhat.com> w=
rote:
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
> Changes since V2:
>
> - Fix build warning when DEBUG is enabled
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

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Thanks!

