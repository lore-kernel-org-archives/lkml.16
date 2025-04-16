Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FDB22C35E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789620; cv=none; b=Qhq3/G/rvAUmpPzP841SIO/NHwRc//BygNNf45W9iTY2M4AhjPxs66CR+yDwiW9hhDSDGah7PViAXG5INPzouos4i+f7Zg+9gBmrjyR8Ax5fd4t8XH9mOcWI1AWncXCwPkflQr3wEVuZRw7iQfXFGR7xNnHbVeIKuN6ZSueQIRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789620; c=relaxed/simple;
	bh=Woiis248jlZyFcV6c0KJ2XRceoaJiE3r8gMR3OmXAq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pSb2dSet82BAQgpcKWI1IdwIG+stcI8FQWUGowt30Dn55STudsaKclnOITK3lKfCTFphenGVDGtTSzL1FZYOMItB3lZYuyNQC9/993g3+1+yslpfGiKz+TYavR65pGJU3mi2+W4oaASpw9HN/FJzR4MIZrlyVrK9EurWGnZ2GEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GlBnJ4A8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GlBnJ4A8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744789617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3uuzpXIRkdIf9HgwyCsnLAQ1Zty68iXHOJ7gPJ3rwGI=;
	b=GlBnJ4A82S2FEJ+0jM23oiVDR9vJvrPTaapV2htlUObIhbPTRXyo4wbEFBFsWUBU9rcbWh
	bwSOWFJaUe0HEGPpiAXiGthuY7J5KuKyG50x0SktoBz/R/qZi/pypa0fQPHtqaArpzNZ14
	6I86jF9NUk1XhSyyZS5FHnMbfVpmRgo=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-vaVfggc-PC6anyfUIexjMg-1; Wed, 16 Apr 2025 03:46:56 -0400
X-MC-Unique: vaVfggc-PC6anyfUIexjMg-1
X-Mimecast-MFC-AGG-ID: vaVfggc-PC6anyfUIexjMg_1744789615
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2254bdd4982so85813045ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744789615; x=1745394415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uuzpXIRkdIf9HgwyCsnLAQ1Zty68iXHOJ7gPJ3rwGI=;
        b=SVmZEil6u2yg5AhbTjGl/p4GN+JIlHZVuegS1rALggH9/2GoA7TEnGJ6M1KUt2eP+A
         RwRzvAj7cZFuG33kXxxst5CkBJq0gO1LAdVRB6OBYCaEpGuaDBU9fmkva+XKDBIPU8y6
         zBlPMTBHXoUfGbbkJM54s+KcV77wuvEGTj6g/GXBvvVBcAU+oMefCBB0oco7zBFC7DA4
         9cjKgKsG1ewaDebCfZQQrdf8ZSViHC6kWIuDyjDcMFKvby5gNuabrVti8UI6MeMBVacg
         OYSTowR2dv3r9IGXtv404oT3CGZPPZsSDtA7tDzOrWU7Iq3XCJrkSE1WRlz9uD4K4KPT
         fFwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAeaBdI88eEzTpT5nNw126WhfNlayNei9HKHi/WyeLUE5QGrSURmsx6mBTsLkkFglYJ5tN8lH2kD3X1Go=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9ZrWqDPjE9qxykk+2V8ZREcqZRuNa1YwZtwyLCpmHKARTCRdD
	afQsC4tPM7Bq9lAcPX+sRjMTMW5y9sGRhnclsJPVdpb1dXQ15on+CoR+3o8NyRxR+fTfA7Km151
	lbcDyL6T2CYDEdiA3jRNVkO8RbfluPqgoJJlX06gmOabjJ5Zmm0yrsZlXur6648PPTWk/CPKE1h
	2WrRNb8Y94ka+Of6sKpe4PMhyT+ihmDVcTBsco
X-Gm-Gg: ASbGnct0lUtAkBteFq6IDi0n7NIWRyQ2tQJzHQDRG+uk3LwQ3wpLve3JyZQoMGhCOGv
	XUoKnnCiP7jGgxwImMeZXHC9zs5K0vhPKRhpmiRYaFrtVOcQcwmtEoI32EQmvbwPyhu0m
X-Received: by 2002:a17:903:32c9:b0:21f:52e:939e with SMTP id d9443c01a7336-22c35912212mr15797655ad.28.1744789614835;
        Wed, 16 Apr 2025 00:46:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErjgPg3L39vqGFFK6Rdj2WvOpVA1dDcQP124r0ZOZ4IRpEvlOKOgz7Fujmr5sSexyffpGWZnI6AM2k2Ni2zcE=
X-Received: by 2002:a17:903:32c9:b0:21f:52e:939e with SMTP id
 d9443c01a7336-22c35912212mr15797285ad.28.1744789614412; Wed, 16 Apr 2025
 00:46:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415074341.12461-1-minhquangbui99@gmail.com>
 <20250415074341.12461-4-minhquangbui99@gmail.com> <20250415212709.39eafdb5@kernel.org>
 <1603c373-024d-4ec2-b655-b9e7fb942bba@gmail.com>
In-Reply-To: <1603c373-024d-4ec2-b655-b9e7fb942bba@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 16 Apr 2025 15:46:42 +0800
X-Gm-Features: ATxdqUHhk7SJXf3iQ5yHeMNHj2FuWUp_PAPo48ZoR1bRo43UlB38GKCpvPtEiUA
Message-ID: <CACGkMEvceXT+=HJRRe6D3Zk3k40E2ADJiXNb4qqAYm=PZnxNpQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] selftests: net: add a virtio_net deadlock selftest
To: Bui Quang Minh <minhquangbui99@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, virtualization@lists.linux.dev, 
	"Michael S . Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	"David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 2:54=E2=80=AFPM Bui Quang Minh <minhquangbui99@gmai=
l.com> wrote:
>
> On 4/16/25 11:27, Jakub Kicinski wrote:
> > On Tue, 15 Apr 2025 14:43:41 +0700 Bui Quang Minh wrote:
> >> +def setup_xsk(cfg, xdp_queue_id =3D 0) -> bkg:
> >> +    # Probe for support
> >> +    xdp =3D cmd(f'{cfg.net_lib_dir / "xdp_helper"} - -', fail=3DFalse=
)
> >> +    if xdp.ret =3D=3D 255:
> >> +        raise KsftSkipEx('AF_XDP unsupported')
> >> +    elif xdp.ret > 0:
> >> +        raise KsftFailEx('unable to create AF_XDP socket')
> >> +
> >> +    return bkg(f'{cfg.net_lib_dir / "xdp_helper"} {cfg.ifindex} {xdp_=
queue_id}',
> >> +               ksft_wait=3D3)
> >> +
> >> +def check_xdp_bind(cfg):
> >> +    ip(f"link set dev %s xdp obj %s sec xdp" %
> >> +       (cfg.ifname, cfg.net_lib_dir / "xdp_dummy.bpf.o"))
> >> +    ip(f"link set dev %s xdp off" % cfg.ifname)
> >> +
> >> +def check_rx_resize(cfg, queue_size =3D 128):
> >> +    rx_ring =3D _get_rx_ring_entries(cfg)
> >> +    ethtool(f"-G %s rx %d" % (cfg.ifname, queue_size))
> >> +    ethtool(f"-G %s rx %d" % (cfg.ifname, rx_ring))
> > Unfortunately this doesn't work on a basic QEMU setup:
> >
> > # ethtool -G eth0 rx 128
> > [   15.680655][  T287] virtio_net virtio2 eth0: resize rx fail: rx queu=
e index: 0 err: -2
> > netlink error: No such file or directory
> >
> > Is there a way to enable more capable virtio_net with QEMU?

What's the qemu command line and version?

Resize depends on queue_reset which should be supported from Qemu 7.2

>
> I guess that virtio-pci-legacy is used in your setup.

Note that modern devices are used by default.

>
> Here is how I setup virtio-net with Qemu
>
>      -netdev tap,id=3Dhostnet1,vhost=3Don,script=3D$NETWORK_SCRIPT,downsc=
ript=3Dno \
>      -device
> virtio-net-pci,netdev=3Dhostnet1,iommu_platform=3Don,disable-legacy=3Don =
\
>
> The iommu_platform=3Don is necessary to make vring use dma API which is a
> requirement to enable xsk_pool in virtio-net (XDP socket will be in
> zerocopy mode for this case). Otherwise, the XDP socket will fallback to
> copy mode, xsk_pool is not enabled in virtio-net that makes the
> probability to reproduce bug to be very small. Currently, when you don't
> have iommu_platform=3Don, you can pass the test even before the fix, so I
> think I will try to harden the selftest to make it return skip in this ca=
se.

I would like to keep the resize test as it doesn't require iommu_platform.

Thanks

>
> Thanks,
> Quang Minh.
>

