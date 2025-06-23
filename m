Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF7F1EF394
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750674087; cv=none; b=gyXt86K4iBmOrSbzIO3jE1oKOVAZa7CtOb2HMRANVrmpZykETiy1cBVfhq6CuKyifvoZc6lrfz/kI6EocBaKKpcy6JFHRqQ+m7xhFs8C8WixxcqBCuS/ox9r4AzRdW3fXTocTyYIJvJ76RI7mqa5k7HGs9gKMU3JwFh8bcAkQ4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750674087; c=relaxed/simple;
	bh=CadnOnqUrP01j9sf1g6sUWHOFqKProxbSycYgQcVmxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YMNLODUsyJYUGfDoQXV8A2L0C2AZgV7b1zl0XT3F4rfh2sPmr1vWFkpgfyjgzQM5Hs2SVKDKQ6OsaoBeo07oH1TTioVT1s1fSdAQjCqTQ9d6FKCRDs4lxikjYl8E2Z0VrGIOS+iRgap6iRFWCWvZpNVuEHGOIVHyCsOJQ6UZeHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MeIChkIN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MeIChkIN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750674083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0lgw/bD4SindaQDwTXpeWQKLQPGV/k/mx1XMIx/reNQ=;
	b=MeIChkIN5mc9k0qLQ4zz/42LFZIUspwtuzfbWwT6CVQrEwM+5hCN8j5uDPLN1PsF0W37tJ
	SOUsdn0eclikM/i7IOyx7+jMyYYfClPQpCMP+488KxB7UiFWvoRa5IftHbyvPoK8P+qhmU
	pe+02ONbknHgKmx9lxQ71m9/DV0TeQA=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-TQRNAiUjPxGrnMx_4DTxhg-1; Mon, 23 Jun 2025 06:21:22 -0400
X-MC-Unique: TQRNAiUjPxGrnMx_4DTxhg-1
X-Mimecast-MFC-AGG-ID: TQRNAiUjPxGrnMx_4DTxhg_1750674081
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-707cf1b0ecbso53642217b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750674081; x=1751278881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0lgw/bD4SindaQDwTXpeWQKLQPGV/k/mx1XMIx/reNQ=;
        b=I4hSTgRPAdx7ByPHTTfTjM8xAU8Sx4b//bvm1OHxqhf/F8qeK1YRBI9j+POMm/hysv
         ktrB236T9FAEEQ2mkWKhYJoPwoC7BJDPAU5mRmVSzxK8OH7Sh573ACv2PUoskA9KpnU3
         qCFeuXOspZmpcx15Yd+dOcBM9HcPRbzdIEgbuVRP9l21j+4rVaIlmCZE8nR77mDdoI8j
         9atU3YYl/MWqNO8R1d2ftDaRhjaU6M6AuTNjbYOz7kvyN31oyKSeu5US/H0njZMZqj8n
         M5afI1/TyTQvkO/vhR29+kQ9Vr+DNF/Y/aAvOaKyI6bLCYCLbqPmmUwXetkFExtm5riZ
         szNA==
X-Forwarded-Encrypted: i=1; AJvYcCUdsr2RHjlHNDT8E9OtiI3u+JJJFLc7LYE/zWZ5e97QEfhazRLF4Oqx7PGFE070Kffg9Rgx6PF4GRQE0S8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp2Xtbuk6hIUZ9GKGe245CxvShh2deAvpBcuEIXosX0s5P4qs1
	2ChSOUkulBrls2Ioy10TXBP7AhUHBaJRIG8jxaEt+3vozDv/9VKrW2RheoIPtapSLTGHJB/tSmK
	S3ichvbpddilxy9MqGrFyavtbPXeYz6ZIz8dt1pTpsi5Ad1fp9gffMWDCCsPpTioDIFC1TQDS0V
	sQXhQQBs4mKA/epOkhJAIuUUjcbcdgWV3X+o1EDbAsyEWf7ZC+MCYchw==
X-Gm-Gg: ASbGncuDPEIdFj8HSFKTijbuBDA2C8so6QEAo6Bg64KAwoJ4khaK22vNJSh+aSb0BQ5
	0aapoPSvXaJrPmvz4Ay29bGdTW4mW5gl4hmjSLWtQBotQsYhe6WHXpQbLTX789qRe1mzxJFiASc
	8X1yc=
X-Received: by 2002:a05:690c:6f93:b0:711:7128:114f with SMTP id 00721157ae682-712c63c5613mr173777247b3.12.1750674081365;
        Mon, 23 Jun 2025 03:21:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFiDnn92RagGTfufzHsxHhTXMUufsWyR4eKoIQO45W2ta/mlkrX/GRWBBKswWX0hUbhvXY3gbxHPfx0i3Xsoc=
X-Received: by 2002:a05:690c:6f93:b0:711:7128:114f with SMTP id
 00721157ae682-712c63c5613mr173777017b3.12.1750674081105; Mon, 23 Jun 2025
 03:21:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618114409.179601-1-d.privalov@omp.ru>
In-Reply-To: <20250618114409.179601-1-d.privalov@omp.ru>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Mon, 23 Jun 2025 12:21:09 +0200
X-Gm-Features: AX0GCFvydjAk0H9SdIviYpopwIHMR0R5bzlGmZzRGrpaLGnO5vBQo-A0rDztVy8
Message-ID: <CAOssrKddunTkNzY1ydgg-rpi1aTuq-ghgJcVuQOXnK1GH5HCtg@mail.gmail.com>
Subject: Re: [PATCH 5.10/5.15 1/1] fuse: don't increment nlink in link()
To: "d.privalov" <d.privalov@omp.ru>
Cc: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 2:00=E2=80=AFPM d.privalov <d.privalov@omp.ru> wrot=
e:
>
> From: Miklos Szeredi <mszeredi@redhat.com>
>
> commit 97f044f690bac2b094bfb7fb2d177ef946c85880 upstream.
>
> The fuse_iget() call in create_new_entry() already updated the inode with
> all the new attributes and incremented the attribute version.
>
> Incrementing the nlink will result in the wrong count.  This wasn't notic=
ed
> because the attributes were invalidated right after this.
>
> Updating ctime is still needed for the writeback case when the ctime is n=
ot
> refreshed.
>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> Signed-off-by: Dmitriy Privalov <d.privalov@omp.ru>
> ---
>  fs/fuse/dir.c | 29 ++++++++++-------------------
>  1 file changed, 10 insertions(+), 19 deletions(-)
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 4488a53a192d..7055fdc1b8ce 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -807,7 +807,7 @@ void fuse_flush_time_update(struct inode *inode)
>         mapping_set_error(inode->i_mapping, err);
>  }
>
> -void fuse_update_ctime(struct inode *inode)
> +static void fuse_update_ctime_in_cache(struct inode *inode)
>  {

Backport is wrong.  In the original patch we have

-       fuse_invalidate_attr(inode);

And that line comes from 371e8fd02969 ("fuse: move
fuse_invalidate_attr() into fuse_update_ctime()") in v5.16.

The fix is to not introduce fuse_update_ctime_in_cache(), because
fuse_update_ctime() is already doing that.

Thanks,
Miklos

