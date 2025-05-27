Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B796F1A0BD6
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 07:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748331202; cv=none; b=q2kqvPwXGZLB/xpDnIIKS4F/2RVzdTJvq9SNkc9NOQcuffrvr8hpT8uUNkUus7S+60KSLNB3CtpQoTGFSpARX0JSwI55E8VztIusVvypEFVjL1UUm2VY1VvtvvCB2VQQbm040XZNaYjzEPx4RdTyHu3OppUPTASI4r1QX4hysqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748331202; c=relaxed/simple;
	bh=Q5exNgIPZ3rcCXxGY7JdPG10hbHpapVoeEeX30T1eXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nk7vN9TgwnxiSRE6icFtjgEFCUdYNAZdaKJ96wRiktbsRi1tTsiPDX/fE2BSZ5SxDFJ1QhFS9Rz4S+TQjGA3SLlHmg6W77fmvtiyrzE1LMNvEyKsk8Hv9BwrAFEpvYkCsHuhbue+Ene2tk19I/xx/MAf8jXrtHQK47VS6fr31Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FnHCegfl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FnHCegfl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748331199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cunzgH7S+aLdgPq0k81WwhGwjgYto2/OQbbZ283U668=;
	b=FnHCegfld5DzPsL7EGcm3vrTTEmHaxgtS4xatXSFwncBOR0YeIKyHO//Nptv8bbmJO4xmB
	wxCXachyX+ldhj5KPVkZNNqN0OsmlYZYvw5s4fZPsC4O8PtlNsDuY6n7pvxLIDeAbl/nuW
	7C0XgK51eoSdkl1C+y+Uc5V61juKsrQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-gN7EzVI8Oxm6WBF5LXloLA-1; Tue, 27 May 2025 03:33:17 -0400
X-MC-Unique: gN7EzVI8Oxm6WBF5LXloLA-1
X-Mimecast-MFC-AGG-ID: gN7EzVI8Oxm6WBF5LXloLA_1748331196
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ad56bfb164eso248487766b.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 00:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748331196; x=1748935996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cunzgH7S+aLdgPq0k81WwhGwjgYto2/OQbbZ283U668=;
        b=ktwEgnnlVpiyN6BfI19KRxxqZCUWw1p/HEEWTZhPXKM8CnIqXL7H1QC+X4BzAOsjR0
         iqixzM0M8OphCflAVNchEc13gK+5SF7bID5zh+8wJnf8BymxDleSwCMJuLosWFGVEqzD
         lCUyVnfBRjLkK7QLZbaoai9zX8xngbyjmN5qMR2RBzF3RLfiEx66VOQXcqvZxYwgtork
         QuwZ8BOQzJaGI0HDFLuabZC+cvdpMb6eGhIdK06qykGmvtsWSPuH8CDPbtzqRqgnZjTf
         CRUVNWYR1A+hLjW2se8iNpkUyNLvSCH/oGTKzG5h6U1FBg/YMRLXMWQIBktT28rzRYSP
         X+lA==
X-Gm-Message-State: AOJu0YyKVhIX2Wmc+IrvAMvgwGYr+rLIRXKYG/ViXD+19bCoT4ejZ9NV
	M359iWq+LJYMgyJdC7M3SJs+gyz0ipdeJAM4qGjSws7zBEI0Nn+7NH0AgVxS729w8VTV1kCNYYw
	6WqjutA9oAFolG128VXsGdzr4umqRo8JR/uFBpIfsJtO28FjMYd2CYwijuYB9WXYFtbWVB4oCpp
	VXX2CJyVYqmwxYH2hdV2CBtmfPfYN7hZeVFO9K0yRn
X-Gm-Gg: ASbGnct1pHEoaGiX//0UhqBMwRdHxuBymPWieOnynp8n0/kINTK0fPSTkJ9esWaR3cY
	6hu9zCPoltgn27UtIUPbmUSWJKk43fsfaiKNc5FGSZiUJpYdaB1RtdqEXxp5emJIlkILiuA==
X-Received: by 2002:a17:907:2d06:b0:ad8:91e4:a939 with SMTP id a640c23a62f3a-ad891e4ab88mr90913566b.31.1748331196137;
        Tue, 27 May 2025 00:33:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHE+yREw9Xt70cyZxJq0TzH4IO2hkS3lRZlAYZQR0TOm58NlaFFrIin3Tp0JuOk9uXg1wuPKl8my3Y4oIddiFk=
X-Received: by 2002:a17:907:2d06:b0:ad8:91e4:a939 with SMTP id
 a640c23a62f3a-ad891e4ab88mr90911466b.31.1748331195805; Tue, 27 May 2025
 00:33:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521092236.661410-1-lvivier@redhat.com>
In-Reply-To: <20250521092236.661410-1-lvivier@redhat.com>
From: Lei Yang <leiyang@redhat.com>
Date: Tue, 27 May 2025 15:32:39 +0800
X-Gm-Features: AX0GCFu3yaPuYSMtDazhp-Ne51miEA8ZjlwJwMW50oQSQAStMU3hnrGf9ypWHq0
Message-ID: <CAPpAL=ytK4SA-m0ZWvByVJrTNTGzvqkpiC-yGvDB7KBBXWwm=g@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] virtio: Fixes for TX ring sizing and resize error reporting
To: Laurent Vivier <lvivier@redhat.com>
Cc: linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org, 
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested pass this series of patches with virtio-net regression tests,
everything works fine.

Tested-by: Lei Yang <leiyang@redhat.com>

On Wed, May 21, 2025 at 5:23=E2=80=AFPM Laurent Vivier <lvivier@redhat.com>=
 wrote:
>
> This patch series contains two fixes and a cleanup for the virtio subsyst=
em.
>
> The first patch fixes an error reporting bug in virtio_ring's
> virtqueue_resize() function. Previously, errors from internal resize
> helpers could be masked if the subsequent re-enabling of the virtqueue
> succeeded. This patch restores the correct error propagation, ensuring th=
at
> callers of virtqueue_resize() are properly informed of underlying resize
> failures.
>
> The second patch does a cleanup of the use of '2+MAX_SKB_FRAGS'
>
> The third patch addresses a reliability issue in virtio_net where the TX
> ring size could be configured too small, potentially leading to
> persistently stopped queues and degraded performance. It enforces a
> minimum TX ring size to ensure there's always enough space for at least o=
ne
> maximally-fragmented packet plus an additional slot.
>
> v2: clenup '2+MAX_SKB_FRAGS'
>
> Laurent Vivier (3):
>   virtio_ring: Fix error reporting in virtqueue_resize
>   virtio_net: Cleanup '2+MAX_SKB_FRAGS'
>   virtio_net: Enforce minimum TX ring size for reliability
>
>  drivers/net/virtio_net.c     | 14 ++++++++++----
>  drivers/virtio/virtio_ring.c |  8 ++++++--
>  2 files changed, 16 insertions(+), 6 deletions(-)
>
> --
> 2.49.0
>
>
>

