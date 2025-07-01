Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B78E1F237A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751356851; cv=none; b=cNTtvC2Eo0WxRsYNjwzQ5o3P4qTV+6PNnNxlo5yg6Bp20yS2WSfL3HRrDBw52259RxtroG4AAWfGL/lkirnfaH7/87keZ7T+Dg6NrXleOWDurUhtibV8Gt8Jj2Lm1i8y3evLNevUc0liZLf21Nyn/tPmz+kEqoAdq9ZWeC70uiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751356851; c=relaxed/simple;
	bh=NAyF1Kiygz0APuCAkMYWNlNHKj8WBxkvrzQISfhN9JM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qCWejAbu8OT8aRhXVAHgdFWpgDuUxExheQw3CGdOyIzg47vyEwdRX8cnBNl9sJ3GolHxuoFf/yE08LXLSIY2Hgc7s7PMa9Vq1YsUf6HXDkr4wmJUOqwdwELp7tM05h4J1fZzQTehZOaSKoMuV4v5c5IXp79zVE+p/8VJNMiD/U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SyNFFMzf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SyNFFMzf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751356848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IGuGKFukG47QLzMFWbqvRM07HodOOgpxJ0UT4x5/DCA=;
	b=SyNFFMzfjNxdQMZIV4X/MZOQ0TvLA02YsDRqXKp5wzkkig2+GK374lSIIHsdtD39Eu1TGp
	F3x8Pv/ZgGp/xpAXEutLo1nt283soXDqlaMnTXZI7zaWA7yHHtgkWz2wnDwot3qi51NlB3
	8x4ZNgKtuRZmbKN5B3uvIER4WG5x97Y=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-lxsIaMUGNAO4TeGDGX3Akg-1; Tue, 01 Jul 2025 04:00:47 -0400
X-MC-Unique: lxsIaMUGNAO4TeGDGX3Akg-1
X-Mimecast-MFC-AGG-ID: lxsIaMUGNAO4TeGDGX3Akg_1751356847
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2eb60594e8so2042438a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 01:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751356846; x=1751961646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGuGKFukG47QLzMFWbqvRM07HodOOgpxJ0UT4x5/DCA=;
        b=E4qwwkUCN0gBFKqzlexfGAlJCCQuq6yDg6j0Sv9axJtMRo5upsqzd6UnXR6L3y9iMq
         RsZgH+S5U3tSkxaVfesk+Q4v85RGaA374JIvX0zTVx5jjzw6xpFxbexPGuk24KFbE2el
         7i15rDuZbh/39n/tiXkNIXvaQTcDHojydiXjhPRt/odYgwBRJChF++WOIpqrjipfrHPw
         rJZIALAql3t1c03xBJT2ru3bJ8OmcF5iHTbIL/j9uoM+RCIt5Ls+QnY+C+jPmcGHs0iL
         uYsfCNY3MH874ACnWk1GEI3pgIxWJUq289sPeeIGBN1VccsL+BQDw1tMLTZXKz7PwQUZ
         jz9A==
X-Forwarded-Encrypted: i=1; AJvYcCVXkFFpbQy2RHi4KBYj9+oP3qiNBaZCtwmtqJwGAz2HGACCJDhFXAFu3Q1dRuBvaWKMuK/e7Z15/uJahcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy253dTvrxRbYeHqBkkW/YKa0/HE5XhA2KN4PeY28E7mmq09vX
	oOUg74u3RqYC8va8Yshmy/m8vXpRoHiks2vIs7NvVcnaQh6GNo2WoTTCzpaRuaAQfKPqgY0CzI5
	OeFEWmM6kjIEuDWavdtGrEo0ce9Gr6AiKjoAKusJhQVtO6SqQp8bbkLyGdQz6VDjS7BHbiLCzGL
	o9zkOMe/7qt5+Q0yR2rBUpcURi9aHbVDeLgF1zxtgC
X-Gm-Gg: ASbGncsRbohqI7s2YOSnU92/l5zXyfiR8oSZgHAE5nC4vD9zKh7Y+zPVmzXSL5Tf5Xu
	q2G2SKRqonlkefuMDPr99KMGYVyY9czErCGeHUQ+YG7aAYRfeQLussYYFkfF9WP5sslK1muX/gp
	OD
X-Received: by 2002:a17:90b:4986:b0:311:ffe8:20e9 with SMTP id 98e67ed59e1d1-318c923b9famr26832578a91.17.1751356846417;
        Tue, 01 Jul 2025 01:00:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDhHUGYNn42sSd0Kp/diabs4sdtkn8dsJt/rfUpYgyhc3VEZqFRFi12iMlH9za1bXmcG+ZHS41z3jM+unrD9U=
X-Received: by 2002:a17:90b:4986:b0:311:ffe8:20e9 with SMTP id
 98e67ed59e1d1-318c923b9famr26832495a91.17.1751356845772; Tue, 01 Jul 2025
 01:00:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701011401.74851-1-jasowang@redhat.com> <20250701030150-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250701030150-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 1 Jul 2025 16:00:31 +0800
X-Gm-Features: Ac12FXw31bwWYPdAycMWoTkuRTh098wIaEmqSiHQdHHO07TFocqKj-gXxLxNZDk
Message-ID: <CACGkMEtr+Rwu+imU1rLtLLQxY50sNzCC8gi8sE4xVhCoDphJwg@mail.gmail.com>
Subject: Re: [PATCH 0/9] Refine virtio mapping API
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: xuanzhuo@linux.alibaba.com, eperezma@redhat.com, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	hch@infradead.org, xieyongji@bytedance.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 3:04=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Tue, Jul 01, 2025 at 09:13:52AM +0800, Jason Wang wrote:
> > Hi all:
> >
> > Virtio used to be coupled with DMA API. This works fine for the device
> > that do real DMA but not the others. For example, VDUSE nees to craft
> > with DMA API in order to let the virtio-vdpa driver to work.
> >
> > This series tries to solve this issue by introducing the mapping API
> > in the virtio core. So transport like vDPA can implement their own
> > mapping logic without the need to hack with DMA API. The mapping API
> > are abstracted with a new map operations in order to be re-used by
> > transprot or device. So device like VDUSE can implement its own
> > mapping loigc.
> >
> > Please review.
> >
> > Thanks
>
> Cost of all this extra indirection? Especially on systems with
> software spectre mitigations/retpoline enabled.

Actually not, it doesn't change how things work for the device that
does DMA already like:

If device has its specific mapping ops
        go for device specific mapping ops
else
        go for DMA API

VDUSE is the only user now, and extra indirection has been used for
VDUSE even without this series (via abusing DMA API). This series
switch from:

virtio core -> DMA API -> VDUSE DMA API -> iova domain ops

to

virtio core -> virtio map ops -> VDUSE map ops -> iova domain ops

Thanks



>
> > Jason Wang (9):
> >   virtio_ring: constify virtqueue pointer for DMA helpers
> >   virtio_ring: switch to use dma_{map|unmap}_page()
> >   virtio: rename dma helpers
> >   virtio: rename dma_dev to map_token
> >   virtio_ring: rename dma_handle to map_handle
> >   virtio: introduce map ops in virtio core
> >   vdpa: rename dma_dev to map_token
> >   vdpa: introduce map ops
> >   vduse: switch to use virtio map API instead of DMA API
> >
> >  drivers/net/virtio_net.c                 |  32 +-
> >  drivers/vdpa/alibaba/eni_vdpa.c          |   5 +-
> >  drivers/vdpa/ifcvf/ifcvf_main.c          |   5 +-
> >  drivers/vdpa/octeon_ep/octep_vdpa_main.c |   6 +-
> >  drivers/vdpa/pds/vdpa_dev.c              |   3 +-
> >  drivers/vdpa/solidrun/snet_main.c        |   4 +-
> >  drivers/vdpa/vdpa.c                      |   5 +-
> >  drivers/vdpa/vdpa_sim/vdpa_sim.c         |   4 +-
> >  drivers/vdpa/vdpa_user/iova_domain.c     |   8 +-
> >  drivers/vdpa/vdpa_user/iova_domain.h     |   5 +-
> >  drivers/vdpa/vdpa_user/vduse_dev.c       |  34 +-
> >  drivers/vdpa/virtio_pci/vp_vdpa.c        |   5 +-
> >  drivers/vhost/vdpa.c                     |  11 +-
> >  drivers/virtio/virtio_ring.c             | 440 ++++++++++++++---------
> >  drivers/virtio/virtio_vdpa.c             |  15 +-
> >  include/linux/vdpa.h                     |  22 +-
> >  include/linux/virtio.h                   |  36 +-
> >  include/linux/virtio_config.h            |  68 ++++
> >  include/linux/virtio_ring.h              |   6 +-
> >  19 files changed, 476 insertions(+), 238 deletions(-)
> >
> > --
> > 2.34.1
>

