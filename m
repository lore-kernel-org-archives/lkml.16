Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9506F239E6B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751623444; cv=none; b=mL2+ezHvDpOHdopnoR4aG2GR/H8zoKmNe/V4S8FFyeCjkPpJtSF9kEwS5HD8dD/lo7mwYvB5+nyW84X2aQav+m0xaiigzC0tGLlv9/0GGhGYAY/N13MeBZgyugcizHQWp5LR0p3y6T0DSocIoIUcm8RfTtCbUkJqD12/UFwSygM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751623444; c=relaxed/simple;
	bh=B7aUvk/jHjdAbP1Txi087l61k45RNX1ZWe+SIygilVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bmq1rie0C9/bOmmgJbID7Gfx1Ib0sYGicYJ0lvKs0Iex9+FFKSQRewtA4jAN1JDwNFPypWa+PI6haJ67UTR0I+43l6n9PsoL7rWrslMLyV07o4+apSZy3DXipu2QqxWHeYVvSJxLl8PqdcFZkMqQnPzWE9z9YD7+1hZfif+LE6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eyKzGkqX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eyKzGkqX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751623441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rWi88a+JkVfvhFesKDsYwPcS3Up3wpcEEvDnhl9YEKo=;
	b=eyKzGkqXL8vpPgddz8IWyIRdr9pBfI6XprIXpUXmxSkbh0ZtZwSnP9GvX2ZbHdMRfB38l4
	iqdEBmqSC3CxGd4M8YhgxAumfTKLgSs5N3uYLeyWx1A+aiWAtic8kNrFYo2aJ0sMpTiuTA
	Teo/EN5UpwwsBgZ6BoKMollsPlhbCsE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-o826u-i0PsaEsCxH1hMEcA-1; Fri, 04 Jul 2025 06:04:00 -0400
X-MC-Unique: o826u-i0PsaEsCxH1hMEcA-1
X-Mimecast-MFC-AGG-ID: o826u-i0PsaEsCxH1hMEcA_1751623439
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ae0dffaa8aeso82964566b.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751623439; x=1752228239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rWi88a+JkVfvhFesKDsYwPcS3Up3wpcEEvDnhl9YEKo=;
        b=gVvA6ozvGkYLdKzWKzV7Q+n6J4bJup5DW8Gj9thP9iOt4esHTkibCiLrOUCmTu2JrF
         QPkwfidVsiz8/8e/voxNG3sK7Jab/o8EyH2NQ5+wT0wc/NfOAs40kuqXLpevFmYHGNYu
         YkuUOiV1ajsFBSHibCD/8ryJETiZA8geRCz+bGKu1VymG/25pXLHWS58ZC2lPHLF0N7v
         QvIspjT8OvHPxrx1/xAJwvgKvYFMcqIYNJbnSLHjWBuo2UwC3NZ8X42IKXnOZ0aWHfvS
         rzhk1XNNCBwukzDmC1okdl0oUHwMa3ruvwNNrN5I8oOdGPvlqqqT/FInCbAjEPP76+B/
         Zprw==
X-Forwarded-Encrypted: i=1; AJvYcCW2g0ym4tKvAUBtLzlu266Fq/SuedBrpjxYnD4VdXbyQL5Lgkkbajv7bW3EKvZeXZdBlmYRzqTENRMsVqc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9PxT4PryBqTRti7HZm2J8R+XxqCpiHMg+Gd/NX3bBNMxTqzNX
	OK32UvIy3m9axJfRXK+1RPlKc+aATK0XHxjVKldTPc+oPSyHg4WK6enXzCz2X5FZLFgS69CRL5g
	A3mgflKQNHduKX5YVqxJ9SnztmVmDd/8e55/CeR/TOxHfXEjR/paPvZ7uKsRv6EAn50it3ttxz0
	piIh8gyu/UFN5OsUD8yvzEVaqRyVqdWdUSIA0HDxxg
X-Gm-Gg: ASbGncvLm+1coMFlpfu7RB+qZgnP60L/bwz/9aEMcI9HscJxRweOyyix0UBI9M+to4o
	UIhfpjIL5sxvpRt5Qx9HAtvTCNDNVIUEDxXY/r/TlIdZ8CaDFDPr0pq2qkEm+Uxm6cD0N2P278e
	aUMMKp
X-Received: by 2002:a17:907:1b28:b0:ae3:6038:ad6f with SMTP id a640c23a62f3a-ae3f801ffffmr257587166b.3.1751623439046;
        Fri, 04 Jul 2025 03:03:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHS9N1eCIk/WZ0O55TJaTXfCqhycvxAdX3gpiv7v0S1xEAaaTDokoaZNHnw35/eNshgWtKvOMMHV8DKBFb9MEc=
X-Received: by 2002:a17:907:1b28:b0:ae3:6038:ad6f with SMTP id
 a640c23a62f3a-ae3f801ffffmr257584266b.3.1751623438615; Fri, 04 Jul 2025
 03:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702014139.721-1-liming.wu@jaguarmicro.com>
In-Reply-To: <20250702014139.721-1-liming.wu@jaguarmicro.com>
From: Lei Yang <leiyang@redhat.com>
Date: Fri, 4 Jul 2025 18:03:21 +0800
X-Gm-Features: Ac12FXx2LPRflMaDOhrK2WN9s4Zkqha02pwAGwf7MkpIy2PH8obbz9l4skjV1c8
Message-ID: <CAPpAL=wY_JU7r8oWgcF_keq+rbpGdkhS5KF0K67g=rbX7_nwng@mail.gmail.com>
Subject: Re: [PATCH] virtio_net: simplify tx queue wake condition check
To: liming.wu@jaguarmicro.com
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, angus.chen@jaguarmicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I tested this patch with virito-net regression tests, everything works fine=
.

Tested-by: Lei Yang <leiyang@redhat.com>

On Wed, Jul 2, 2025 at 9:42=E2=80=AFAM <liming.wu@jaguarmicro.com> wrote:
>
> From: Liming Wu <liming.wu@jaguarmicro.com>
>
> Consolidate the two nested if conditions for checking tx queue wake
> conditions into a single combined condition. This improves code
> readability without changing functionality. And move netif_tx_wake_queue
> into if condition to reduce unnecessary checks for queue stops.
>
> Signed-off-by: Liming Wu <liming.wu@jaguarmicro.com>
> ---
>  drivers/net/virtio_net.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index e53ba600605a..6f3d69feb427 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -2998,12 +2998,11 @@ static void virtnet_poll_cleantx(struct receive_q=
ueue *rq, int budget)
>                         free_old_xmit(sq, txq, !!budget);
>                 } while (unlikely(!virtqueue_enable_cb_delayed(sq->vq)));
>
> -               if (sq->vq->num_free >=3D 2 + MAX_SKB_FRAGS) {
> -                       if (netif_tx_queue_stopped(txq)) {
> -                               u64_stats_update_begin(&sq->stats.syncp);
> -                               u64_stats_inc(&sq->stats.wake);
> -                               u64_stats_update_end(&sq->stats.syncp);
> -                       }
> +               if (sq->vq->num_free >=3D 2 + MAX_SKB_FRAGS &&
> +                   netif_tx_queue_stopped(txq)) {
> +                       u64_stats_update_begin(&sq->stats.syncp);
> +                       u64_stats_inc(&sq->stats.wake);
> +                       u64_stats_update_end(&sq->stats.syncp);
>                         netif_tx_wake_queue(txq);
>                 }
>
> @@ -3195,12 +3194,11 @@ static int virtnet_poll_tx(struct napi_struct *na=
pi, int budget)
>         else
>                 free_old_xmit(sq, txq, !!budget);
>
> -       if (sq->vq->num_free >=3D 2 + MAX_SKB_FRAGS) {
> -               if (netif_tx_queue_stopped(txq)) {
> -                       u64_stats_update_begin(&sq->stats.syncp);
> -                       u64_stats_inc(&sq->stats.wake);
> -                       u64_stats_update_end(&sq->stats.syncp);
> -               }
> +       if (sq->vq->num_free >=3D 2 + MAX_SKB_FRAGS &&
> +           netif_tx_queue_stopped(txq)) {
> +               u64_stats_update_begin(&sq->stats.syncp);
> +               u64_stats_inc(&sq->stats.wake);
> +               u64_stats_update_end(&sq->stats.syncp);
>                 netif_tx_wake_queue(txq);
>         }
>
> --
> 2.34.1
>
>

