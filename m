Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B81D433A8
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 06:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747202913; cv=none; b=e7q7fSrV9dmuNnJuzMmklE1Njk9KEf96v+OxTm6Y41ybUvisRDsrcN71hXe+e825LL1zp+zBv582J7YYxFLKc18yUnSHIH1XK9+qf7glZXg96ZTMmX/MJZ+Jc7g2fRsDpAGfOyZXekdu5We8ftNpp5LWxLh4pEtGSPPKEBTkWSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747202913; c=relaxed/simple;
	bh=clqW7NWTFiJ7YoR3lDVtuE7JolyoGieukxj9gWfyBjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CEaj6pck6mL7TW8RPXTCuu77qfGAWE7CVTWEpgXRspx9lJfrx+8TrtZwyqljbfcMPuknyo5mfzDagsljVBFHPYovoHvuuDhtTjfvaRF805gQm864a4GbQiLW7FDodIGvD/8jclPbFURcQK9qHa+bIjOEw5xbYY05nWra4Z+64cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=avNM7E8E; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="avNM7E8E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747202910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GTiJAnWJjUYIhLrqKEbp6nIdZ7MIc80RxWcquMrGcF4=;
	b=avNM7E8EX5L6pUb40JS4dJBEZA8OEGV3daA43V65FtnBzPIFp9+Vk7XVnwTrQOjNk5wlgd
	Qwsn9egahKiupWQfsDB3XJSY1mLNV5Wg0aTAAEVLAU4mAR/rXw7q62O4D+cvddCKP7lj5J
	QRe1DOdA1M50lAxTADLp4WU4eCZ+5MA=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-uVHBLpUYMY2ef8SznJr3hA-1; Wed, 14 May 2025 02:08:25 -0400
X-MC-Unique: uVHBLpUYMY2ef8SznJr3hA-1
X-Mimecast-MFC-AGG-ID: uVHBLpUYMY2ef8SznJr3hA_1747202904
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30a7cc8c52eso7915713a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 23:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747202904; x=1747807704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTiJAnWJjUYIhLrqKEbp6nIdZ7MIc80RxWcquMrGcF4=;
        b=SVjuHznPijsiBKOxb/O2LG789R44puLu0apS/OcsNM8W700y/MexFPUfDHYHoi7gQ9
         at1medfcgw+Dmuf3glIA1qFClUsgqjJoFCPrAHNxflnAuLx30O/T5pZv9rCYnDmAj9MQ
         YmRINjilsH/9+i2z3oOkBVD9md2SXQ91wZzZjdSwGfJgNaEs5ZKOhHWhBB6QmgfzuYSP
         TIcR0ruf5sbtgGiNfZY6u5Rtrd06zi0ZOJH+Uf2NExmY6rcjYvMptAi3qY5gh16kQhSL
         RREW70NP7Hgx6vNTDdnz1zl0QG9U6Tbz4KqGLjAXPb93sLOrECOKsgCCNNZp7raYmqtR
         Q83A==
X-Forwarded-Encrypted: i=1; AJvYcCV43+vV0X4gmQe+8y1K78xVgjo6jJk07bNnJjsSwIeWAgiiO/BL/csN/YjKtESFaRgW91YV2ALpP1v5NrI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV7MA/eFGRtqdydmaKexudx/MXRtnVkgyCp49zHnpJXDK0kaAc
	mp2NcLmv7beCmVJwQcAise0owyoaEZhJ1vBkuxHlk9nOFDzHAAVZ4MiqYTiOrSktNcTuDWvavAa
	qvEMYp4WYqmMiNyTErFX6mkYBlyd2sQbHOVr7pASpn8blaOZLNMFEsuQBBmgKIzUGXOKVMD0ma9
	csyL1TV7k3dYPOgPMpHW+dYMDrUbdfJLen4la3
X-Gm-Gg: ASbGncsfz6m4vxWHD4WeqafqPL35IjGITHc8CkvMYwGMux5QvBoa6Z3U+6fRvsTvzXD
	PKsG8EMCfMK/XdISj7B5TT7siLWQQHHO1DHEMhO2BsyAhXhBv57grEKKmrCOLtaGyrm1N
X-Received: by 2002:a17:90a:e188:b0:301:1c11:aa74 with SMTP id 98e67ed59e1d1-30e2e623b1cmr3638566a91.28.1747202904473;
        Tue, 13 May 2025 23:08:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhn6kqdMgQ6s4WnRHem1sYVRVuHeAiWgE6nRiMRHJ5QkKKuABSWLiPE/twiXG+1HU+576sx0nKCmDWB9E2sN4=
X-Received: by 2002:a17:90a:e188:b0:301:1c11:aa74 with SMTP id
 98e67ed59e1d1-30e2e623b1cmr3638535a91.28.1747202904089; Tue, 13 May 2025
 23:08:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511222153.2332-1-sami.md.ko@gmail.com>
In-Reply-To: <20250511222153.2332-1-sami.md.ko@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 14 May 2025 14:08:12 +0800
X-Gm-Features: AX0GCFtz_D_3mYpYzBUGBYhubV1vNLsSLsRetmERaz5Lx-ANh9YkQtT84sru_W8
Message-ID: <CACGkMEvw7GB1UtZtNjw4TVD1nzr2JCgdsjFK7tiGC46CLV8hPw@mail.gmail.com>
Subject: Re: [PATCH v3] virtio: reject shm region if length is zero
To: Sami Uddin <sami.md.ko@gmail.com>
Cc: mst@redhat.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 6:22=E2=80=AFAM Sami Uddin <sami.md.ko@gmail.com> w=
rote:
>
> From: Sami Uddin <sami.md.ko@gmail.com>
>
> Prevent usage of shared memory regions where the length is zero,
> as such configurations are not valid and may lead to unexpected behavior.
>
> Signed-off-by: Sami Uddin <sami.md.ko@gmail.com>
> ---
> v3:
> - Use idiomatic 'if (!region->len)' as suggested by reviewer
> v2:
> - Fixed coding style issue: added space after 'if' statement
>
>  include/linux/virtio_config.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.=
h
> index 169c7d367fac..b3e1d30c765b 100644
> --- a/include/linux/virtio_config.h
> +++ b/include/linux/virtio_config.h
> @@ -329,6 +329,8 @@ static inline
>  bool virtio_get_shm_region(struct virtio_device *vdev,
>                            struct virtio_shm_region *region, u8 id)
>  {
> +       if (!region->len)
> +               return false;
>         if (!vdev->config->get_shm_region)
>                 return false;
>         return vdev->config->get_shm_region(vdev, region, id);
> --
> 2.34.1
>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

