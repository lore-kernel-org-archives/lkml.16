Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA30450EE
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 01:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749433286; cv=none; b=hhgF8kOiY0zj3ehCdvoMvrdqckozt1Ey0wEMBoAFWxYbPc1xamqYGBW9qLEKk+Az6bpLJY3sCcwWYgcQba/3C2IXMOv8vwhF5ACohDfCrVJPCOHYbrRNtXG1Te+A8x9tWkuACme9eyHlpP9LxQ6uUHgoxP+A1q/K8DtG1wWNF2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749433286; c=relaxed/simple;
	bh=hej6cxyFs+C7L664xb6ANQmQk5M7wHwxWDKSIemdnnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TKQlhgoGS8Wr/Yc5AhyQ453wTr1v9nxesXI9f3fEqQZ5X0q6yuPvdInnE6H1BpQNVUWxyQqdSG+5vFXdKkO4vk6NilGW59aWd8FfljWTb4MbtAby8s0gPsXqkHjiDkP2MDdXQEodIZnLrxJlCtDmY3j34c/+mRtnq9xmC4y6KrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aNF/P9Ga; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aNF/P9Ga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749433282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7lofrGKgIf3f6wW1zlnvc/h/o97h/a3X8RkvsJpwFaU=;
	b=aNF/P9GaS/MqdNFIcqx8obAykqUhrIuamewUGsKbm67EJkobmvIm8/y0vuKwH/3Bi40BbU
	8zE7VwUc7hnGsBXQY+OAT42ZCdrGbZLx2ldEvTEDnjZ/CWd7xFxJw1/qTpSIZ5dS3NkW82
	xNm77rJkc2ooDymn3oglzVX7BlIxmiE=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-Ak04EMnvMVWDclgQaC5D2Q-1; Sun, 08 Jun 2025 21:41:21 -0400
X-MC-Unique: Ak04EMnvMVWDclgQaC5D2Q-1
X-Mimecast-MFC-AGG-ID: Ak04EMnvMVWDclgQaC5D2Q_1749433280
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235842baba4so32200115ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 18:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749433280; x=1750038080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7lofrGKgIf3f6wW1zlnvc/h/o97h/a3X8RkvsJpwFaU=;
        b=j/6VumbP9VOm4vNCUsYATrG2ppamEClI52Uo+fY+ZD3ptj/pXAkzD40DiBsfKo8TcH
         BKsBsAb/26iNquSflG5gbtKLlWwr9MmQL2R9MZ2lqN4KEN+yjXc9bxiE9QpKhCylqw8g
         bpQsIAu3EMUOHzR3i6NItktM9/EKkMaqtdNnG8AzXHNnmkdcl13r8A6hHTfmo1VGyI1B
         bOTH7hzsQuMFLQmYWNdfwzSJ4hJ/dCyA2m7N3jjZ4HLisoBDisjrmL1MfqvWR0AI6Esc
         G1ZS0FtF8U5B8uW7bKHBhLsRpoJNd4uCVn1jUYUhcdstkfpyXAO4CI1p5alpnxskw089
         28XA==
X-Forwarded-Encrypted: i=1; AJvYcCVw/nSbOYH9ld1mNcv3NUHqPZlSutDv95QcJzi8J3nshIy6FTzGa3wvm1iIAOJhVBDTdPZPj/WaKnks1zs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0aO/V/yRohJknIE0S8eARykWW2t8+YGsYrIT6bkUp7qPve5Zj
	LiAb04nu4a1UrrX/Yc83GwrYXF/a1W849ba45pNyaeLsbJEg4glkxlAUcr1J1Dw09pc/lnZpgtf
	lrFOxkYU4kh2+EqRVrAUCF4ceYPvhQPMKpWR13HMGrNvqqufyZjkMu5D9BQURrX02YP6/VVKXX6
	M7GA1BqMM4cDPUfZK7qlakQYGSZ9auJkEzR9k6ckRV
X-Gm-Gg: ASbGncsSdZPuubIEeA/KJoeOgpNy9uYhmqFDY8v9AQ76WiiPpPWSvvnOF8OcgU2WG7U
	wlZQvxZx1vtbhcdIYR4n3LvmmBL2q9ouOr4rGKi6yubL814OoGXCmf1dQ7guSEEqYsXHQ
X-Received: by 2002:a17:903:18f:b0:223:4d7e:e52c with SMTP id d9443c01a7336-23601e21f1dmr165873625ad.5.1749433279870;
        Sun, 08 Jun 2025 18:41:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHlKs2ojAmTxWBYs9SkoDYKoNfRXREC8v8QVqcWcXoYxdrrpZxtxnkDAVGmRSIrSysdiJuHsbWlub+a5zvDOU=
X-Received: by 2002:a17:903:18f:b0:223:4d7e:e52c with SMTP id
 d9443c01a7336-23601e21f1dmr165873425ad.5.1749433279524; Sun, 08 Jun 2025
 18:41:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606115012.1331551-1-eperezma@redhat.com> <20250606115012.1331551-2-eperezma@redhat.com>
In-Reply-To: <20250606115012.1331551-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 9 Jun 2025 09:41:08 +0800
X-Gm-Features: AX0GCFuohxh2ELb-a6MSM6UQ7eR4Le-eCUhd0Btq7qRcTNbff4xXZwicgMFihYY
Message-ID: <CACGkMEsw2taXgW11na2CFK6W03c=x=wMn3iwNZPypgPkeSU06Q@mail.gmail.com>
Subject: Re: [RFC 1/6] vduse: add v1 API definition
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: Yongji Xie <xieyongji@bytedance.com>, Cindy Lu <lulu@redhat.com>, 
	linux-kernel@vger.kernel.org, Stefano Garzarella <sgarzare@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Maxime Coquelin <mcoqueli@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, virtualization@lists.linux.dev, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 7:50=E2=80=AFPM Eugenio P=C3=A9rez <eperezma@redhat.=
com> wrote:
>
> This allows to define all functions checking the API version set by the
> userland device.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

It might be worth clarifying how it works.

For example,

1) would VDUSE behave differently or if it's just some new ioctls
2) If VDUSE behave differently, do we need a ioctl to set the API
version for backward compatibility?
3) If it means a brunch of new ioctls, could userspace just probe the
new ioctls instead?

Thanks

> ---
>  include/uapi/linux/vduse.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/include/uapi/linux/vduse.h b/include/uapi/linux/vduse.h
> index 68a627d04afa..9a56d0416bfe 100644
> --- a/include/uapi/linux/vduse.h
> +++ b/include/uapi/linux/vduse.h
> @@ -10,6 +10,10 @@
>
>  #define VDUSE_API_VERSION      0
>
> +/* VQ groups and ASID support */
> +
> +#define VDUSE_API_VERSION_1    1
> +
>  /*
>   * Get the version of VDUSE API that kernel supported (VDUSE_API_VERSION=
).
>   * This is used for future extension.
> --
> 2.49.0
>

