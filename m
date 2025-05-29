Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFA519E968
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 02:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748485426; cv=none; b=OlIleuJLA7fEuySXnS5xqsmU03P7adhv+v3BAiSTvlBfS1PgTDxrUH6NneOkG8d+7/TjXz75xF2Z0kjBBMu1uP4fxf90bOwJ84cvzkltwN0YrMT6ZyUGE88OKLWlLElfhZNhWVew1/NctPfoSnzF4mH66pnKVedjTb3dHOYQqIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748485426; c=relaxed/simple;
	bh=8QP2bAPt4AJKcTljc8zaWDC7qeLtgVJNoRtLBeWnfto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZ4esbi/UjZcDkeK05h+zfX41OTtuaPX5kEid8WT2yaiXLKANDOYCCYfSH7hOXGP3J4/NgJZIs4bsJLQ6QDi/mcS8F3TVEedWWajsLiehi26LWEtgMSt6T1LD+mC5nV4a7fExJSTk1Q7SGyeex2HCG10oKooSQPZ1Z6Qiuw5JzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O/kXVOGb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O/kXVOGb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748485422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4pAhwizCUFXp7MX+Ed3OCbEQsG/dB7EmiP8FGYlOO1o=;
	b=O/kXVOGbfpT1Uc+tA9E5czRzbSZrU823EqdNr1FAGFteJiRO8OAgw8WF2zt6VL4mJjZmfL
	UflIQIQfjfIGikg/WXte+r5b/FuC813z3ylLg5RrfuLfFXuhpo8qC7MAmTNt6BfQZUPNuB
	jJzO6g2ZrNyfAOD2gxdZFMmBn1ldVnw=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-1U9NwTBPOseZMnBbdEiUfA-1; Wed, 28 May 2025 22:23:40 -0400
X-MC-Unique: 1U9NwTBPOseZMnBbdEiUfA-1
X-Mimecast-MFC-AGG-ID: 1U9NwTBPOseZMnBbdEiUfA_1748485420
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-311eb7889c4so407327a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748485419; x=1749090219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pAhwizCUFXp7MX+Ed3OCbEQsG/dB7EmiP8FGYlOO1o=;
        b=LNzvW5rnKouZDPjZDk3gl+41VcmivBbA4H/nYkubLVRCIFcrMcFPwTBeLlrSmucoqi
         XTc8mWwFTrFGmXWyuPmjLhgLjIKZoVeRkuk5vjBDBShmX9Wc9llos9J6VcYlpL9tJswF
         pNQbG1a5v60syBQX8+ex7ZiY3EcEloNw43pGp4lUkVeQSqzHy+tqvA20oqLisqtVFNFh
         gyHVdW5XOR5mtX33rf7GeQjsID4SRDfvBB1pByLQjzDJXV5NzzMPfKizGJOETmRUJoxZ
         koFTnDK3e//9H2lJSyPn2fxODcUdz83N3S+QMZUWnhwpdLGY9+BoQFyIksi7qkDa0ZK6
         Y2pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTrONGalfPln3hZeQo5iYOmyA024QYrHXxj+dPaCSeQlsqOoEal/aSkokXtiV0KjmOR7b4XURa93n8NC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRMTR/tehjz0abpaG8NzexWKZV/AEG5wwCZhyaJ82GcIXGgYQe
	7yjpG0ZPOquUkp/6WOAXmi55GEukoe6qRrtHOIOXGnPbmCitBHgdWVe9K44HEf+5r85UbHKC2Q4
	Sp//Y9bBlBCRbejP/denQm4WpKmjG3TNxVLhD2lPWHJRijGC09V3GfsPSrNL+hbaIpPtaP42xYY
	UO/VE1SzuS2Jco3IZ/iUtchC21FSO90gL7QfjkBcVN3cKiiWBunhc=
X-Gm-Gg: ASbGnctRcF6kYHxI5DEA7qxpqmcB5SodLFhSc/YG9BYTCmZ2qnINYqgLi6g7lIRAkYz
	F5XjKqjgXlepfXPElw5nvRB9FFz7pOqrpvhvD4205bdBqF+EV4WGIZ4ezN6s8TxZM3wh2oA==
X-Received: by 2002:a17:90b:2dc7:b0:311:b413:f5ce with SMTP id 98e67ed59e1d1-31214e91a5amr2442916a91.16.1748485419312;
        Wed, 28 May 2025 19:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbJMI07EpZilkM5JxdiosTizQrqYZyB/qRtI+w/FM5dBmfqE//T38u8vud/Cj9lDN3v2/ob0WOSKOvTGd//g0=
X-Received: by 2002:a17:90b:2dc7:b0:311:b413:f5ce with SMTP id
 98e67ed59e1d1-31214e91a5amr2442889a91.16.1748485418879; Wed, 28 May 2025
 19:23:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528064234.12228-1-jasowang@redhat.com> <20250528084904-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250528084904-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 29 May 2025 10:23:27 +0800
X-Gm-Features: AX0GCFsWi2hAyo6cMAwsnlFmTUQ9cJ_sIixNLHLmIggVmxpTlfOkzhhCr9jarhs
Message-ID: <CACGkMEsd_Actjat0cjDdLW01ent8OgBCGjgwkP2UFFX+5rhOQw@mail.gmail.com>
Subject: Re: [PATCH V2 00/19] virtio_ring in order support
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: xuanzhuo@linux.alibaba.com, eperezma@redhat.com, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 8:51=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Wed, May 28, 2025 at 02:42:15PM +0800, Jason Wang wrote:
> > Hello all:
> >
> > This sereis tries to implement the VIRTIO_F_IN_ORDER to
> > virtio_ring. This is done by introducing virtqueue ops so we can
> > implement separate helpers for different virtqueue layout/features
> > then the in-order were implemented on top.
> >
> > Tests shows 3%-5% imporvment with packed virtqueue PPS with KVM guest
> > testpmd on the host.
>
> ok this looks quite clean. We are in the merge window so not merging new
> intrusive stuff, but after rc2 or so pls ping me I will put it in next.

Ok, I will post a new v3 at that time since build bot found an issue.

Thanks

>
> > Changes since V1:
> >
> > - use const global array of function pointers to avoid indirect
> >   branches to eliminate retpoline when mitigation is enabled
> > - fix used length calculation when processing used ids in a batch
> > - fix sparse warnings
> >
> > Please review.
> >
> > Thanks
> >
> > Jason Wang (19):
> >   virtio_ring: rename virtqueue_reinit_xxx to virtqueue_reset_xxx()
> >   virtio_ring: switch to use vring_virtqueue in virtqueue_poll variants
> >   virtio_ring: unify logic of virtqueue_poll() and more_used()
> >   virtio_ring: switch to use vring_virtqueue for virtqueue resize
> >     variants
> >   virtio_ring: switch to use vring_virtqueue for virtqueue_kick_prepare
> >     variants
> >   virtio_ring: switch to use vring_virtqueue for virtqueue_add variants
> >   virtio: switch to use vring_virtqueue for virtqueue_add variants
> >   virtio_ring: switch to use vring_virtqueue for enable_cb_prepare
> >     variants
> >   virtio_ring: use vring_virtqueue for enable_cb_delayed variants
> >   virtio_ring: switch to use vring_virtqueue for disable_cb variants
> >   virtio_ring: switch to use vring_virtqueue for detach_unused_buf
> >     variants
> >   virtio_ring: use u16 for last_used_idx in virtqueue_poll_split()
> >   virtio_ring: introduce virtqueue ops
> >   virtio_ring: determine descriptor flags at one time
> >   virtio_ring: factor out core logic of buffer detaching
> >   virtio_ring: factor out core logic for updating last_used_idx
> >   virtio_ring: factor out split indirect detaching logic
> >   virtio_ring: factor out split detaching logic
> >   virtio_ring: add in order support
> >
> >  drivers/virtio/virtio_ring.c | 896 ++++++++++++++++++++++++++---------
> >  1 file changed, 684 insertions(+), 212 deletions(-)
> >
> > --
> > 2.31.1
>

