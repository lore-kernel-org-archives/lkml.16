Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C801E32D3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745897997; cv=none; b=tqqJOYKApzKSarzSbvTCMynJHDPvSrfzItEjBrd4TvZ9JWhqiVekm8DON979ncB7+N/XnuLaEcmYu9S3TzQGMWEjR3rop23V+CwFDftbUeDD96lXN5//bMVt0iAd3MhrNnBjzoLJAqn777m+Lk4+psIQD9nYlo2ZwhkUVKqsPNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745897997; c=relaxed/simple;
	bh=CZ+mWcXOnoNmB5QyyZZqqFpy5PLSEtLDvf2WP/DW33Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R263txDS9mpf8tGIbcBp2lj50H8+qwVnwODW1lKYgQRjXKLjOz7+AjKC9DZGUDErehohGgMUZKsF1Hbb/txNK6KQj9JbLLMvONMZ5atlP7lM79AMAA1fIqtp8sUWxMpgax/QWZ29I8I1bapcyEffryRjg+CDLQTvqhJT/aWX1tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YtR7Al/S; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YtR7Al/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745897994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CZ+mWcXOnoNmB5QyyZZqqFpy5PLSEtLDvf2WP/DW33Y=;
	b=YtR7Al/SvAHD8T1A6ELqi2CJzDK2Dzw/a7NkdgYu+CTNT5u8DEezCWV1F2GV2xjbG/HY+j
	S7gpVmnSdcEaNzXe/pasMmdAqHqLdZj1Id0AsKbwWElYa0sEYZ2Cm+l2/lSnloZ8cxzrI3
	TBD+UWEGvaFf9aQLipNs5iWYLWJTY6A=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-cZSRRobZMniHEjJrCseBEA-1; Mon, 28 Apr 2025 23:39:52 -0400
X-MC-Unique: cZSRRobZMniHEjJrCseBEA-1
X-Mimecast-MFC-AGG-ID: cZSRRobZMniHEjJrCseBEA_1745897991
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30a29af28d1so60206a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745897991; x=1746502791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZ+mWcXOnoNmB5QyyZZqqFpy5PLSEtLDvf2WP/DW33Y=;
        b=qmTq9aVL4h404KtffIvbpP32pLtQA/JfmCjTm2/YlE64DluHG6Czg/IZO1l3frUqL4
         hFBdP3H1FgZ3yhebKoPWwgRaw9Id4fbnQ54nJD5QyzvzhEsILzxudxMklwt89KIDb9/n
         eHSiPUGAOaiHsp+eQYDQJWYeQ0xNLgWcvwPux0Y0P9uMAgtTNGeRutuU8/DGrnFAW1JB
         SwynGb6Saoak52HDuV5pi/njk/1odDJngHMuU9JUIihJ8yEnHT2mcr3jR2yVabgM4ON7
         U8Cxc3eLofk49ZtufvLodtTZLE7C1s/Mt2PTBNxNRnTQmLgSz6nDQquN/hM90gj3vo5k
         nr4w==
X-Forwarded-Encrypted: i=1; AJvYcCU6Lj3vWrS7Jgq7Wpiez9LZUGVOjmpPGzRCVbnHhfI6+Rctvc2FvjUmZceYJTXQjpQh8vNUeooRYpe33ck=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqSOsPzPwe7iOKo88hgldArp9pC8twa1kBHmgPrFxKcd/MyMFj
	sJ7GBKbkrWUjnSA6kbDB1a6VhNMeGJ7JZP405hLTCTxgXczyrdwbZ3D0k3FzbxDGAYnPF1UwLwf
	DLoFIbyFR11qPWowLPK8P//4EjwoD64DiGT6i7hkL/7F8MXJZ8giPf0mEDr3+c9VnpqkRfko095
	Fnl5y6Qjp/hRKg9vlcSYyXaUXXlOG52DJrRwsZ
X-Gm-Gg: ASbGnctFfcf/4fm1UFGJoZsLD+vr3/Y7SXcX6uUHZZMPdm65JkeB743R3U9fu+/pxK1
	PO9uG2pM/ZD1HoGZ8SM9CJ5cxpaWFx07fS7KgQsaoWol5cZ+LzkfwPLrCUQfNvQ2jDQ==
X-Received: by 2002:a17:90b:4cc4:b0:305:5f25:59a5 with SMTP id 98e67ed59e1d1-30a215a9e6cmr3195100a91.35.1745897991092;
        Mon, 28 Apr 2025 20:39:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO25nt6hV3dV111j+arayWq9RJrat5QwpIGcVcLMQhppu+t5T6cKy8dvsGeNPzrwkLvZvBpyPz/UcGeHutQWE=
X-Received: by 2002:a17:90b:4cc4:b0:305:5f25:59a5 with SMTP id
 98e67ed59e1d1-30a215a9e6cmr3195076a91.35.1745897990674; Mon, 28 Apr 2025
 20:39:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421024457.112163-1-lulu@redhat.com> <20250421024457.112163-5-lulu@redhat.com>
 <CACGkMEt-ewTqeHDMq847WDEGiW+x-TEPG6GTDDUbayVmuiVvzg@mail.gmail.com> <CACGkMEte6Lobr+tFM9ZmrDWYOpMtN6Xy=rzvTy=YxSPkHaVdPA@mail.gmail.com>
In-Reply-To: <CACGkMEte6Lobr+tFM9ZmrDWYOpMtN6Xy=rzvTy=YxSPkHaVdPA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 29 Apr 2025 11:39:37 +0800
X-Gm-Features: ATxdqUEwpamsgyJSROjElXTifDP9gzLG-yrcg3CrQ8683svXB8ELNH4GnXFNWQM
Message-ID: <CACGkMEstbCKdHahYE6cXXu1kvFxiVGoBw3sr4aGs4=MiDE4azg@mail.gmail.com>
Subject: Re: [PATCH v9 4/4] vhost: Add a KConfig knob to enable IOCTL VHOST_FORK_FROM_OWNER
To: mst@redhat.com
Cc: Cindy Lu <lulu@redhat.com>, michael.christie@oracle.com, sgarzare@redhat.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 11:46=E2=80=AFAM Jason Wang <jasowang@redhat.com> w=
rote:
>
> On Mon, Apr 21, 2025 at 11:45=E2=80=AFAM Jason Wang <jasowang@redhat.com>=
 wrote:
> >
> > On Mon, Apr 21, 2025 at 10:45=E2=80=AFAM Cindy Lu <lulu@redhat.com> wro=
te:
> > >
> > > Introduce a new config knob `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL`,
> > > to control the availability of the `VHOST_FORK_FROM_OWNER` ioctl.
> > > When CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL is set to n, the ioctl
> > > is disabled, and any attempt to use it will result in failure.
> >
> > I think we need to describe why the default value was chosen to be fals=
e.
> >
> > What's more, should we document the implications here?
> >
> > inherit_owner was set to false: this means "legacy" userspace may
>
> I meant "true" actually.

MIchael, I'd expect inherit_owner to be false. Otherwise legacy
applications need to be modified in order to get the behaviour
recovered which is an impossible taks.

Any idea on this?

Thanks

