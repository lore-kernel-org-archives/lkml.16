Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0208635D
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 06:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748498578; cv=none; b=CUljcJ3ikn3DxC6md57FSbIiUkx/BVn0WidH+hhoRNTkNlBAU2M5UVc0ELLi6y5DrqYFVFA6l+tLWzXOLqhCl3TnrclC8tpo0Zq2afabAey1Heken+9JjxBTljhxFqJFfYytRdW/ms0b4VFRj4zYQZzs47oTDUDjdBmme27WLiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748498578; c=relaxed/simple;
	bh=Fkp+IGW7TPGnZNAbAinEElfDl2SRpDjwPauRa8hMm6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pNMTi1Fr3jMFXK45VzJ2BgQeIukIgXNy5SMI3+sAYVOXptMVYt9INfKj+k3VueCxUO2okyB29HkeNi6wzAGqzfbePP0kf6SLvOOfCY4tFSAwh2lF9ZAzfnoiMZq/q+c4W784v0WK5KQZ+rAo30n2J8KkDmTUb67COxaTjcYIKKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RnljA2pA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RnljA2pA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748498575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ox8p/2RUuwEy8Y6Yrm/mFWz/y7tZxRVqzbJuQ+vAXU0=;
	b=RnljA2pAXirScS3yCCK54lhRtPwPU0gW85g9vH6B2c3wlqwNcjPYmh2cPvOsc94m+pih+p
	iVLWOG/sUU+Cchb4YokTuQZXJdSHa7mBt8BHYDlkQhOeHpsX+sp2YCp/MOV7YoHG0ZWiKn
	z4UPuANpvPbm229XhfU+EKXt/ZycezU=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-vZEjNMlTPU-9-99Mwrtu4g-1; Thu, 29 May 2025 02:02:52 -0400
X-MC-Unique: vZEjNMlTPU-9-99Mwrtu4g-1
X-Mimecast-MFC-AGG-ID: vZEjNMlTPU-9-99Mwrtu4g_1748498571
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-310e7c24158so504721a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748498571; x=1749103371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ox8p/2RUuwEy8Y6Yrm/mFWz/y7tZxRVqzbJuQ+vAXU0=;
        b=uV22IX5LWNzK9CqhCfHonJx0tgArbEQ6C9t6Wo9M/NLFBL8d/fP8Wd+pDoQwNGY5L5
         I57IOslS5lL/KLx6RHSwPeLzsaLlIAk5E6YXFO+YCn8/AamXn+1Ulr4tPraOamfSxLfm
         +CHF/AlfBr98fY5LTpR7raUng7pn7gJeKJTvTw5FfIj6s3szYKo7cnjmaa8vfP4MFLBD
         fLElvtK1/OWtSldvxeaV00ccX/zTNRceA1gQzTaprnIJcvCwOklBBA7MdP8wrVpMeClO
         aDTwTQlTUe5XTdYo9f++Jk2pUyXyIJPouqUj1omApbGjGeES1eN+ET4SJs8cBc6qV1Pd
         hnWA==
X-Forwarded-Encrypted: i=1; AJvYcCVr5HmkHML4xpjSko78Oi6w/Gmw8MZpkHrWMujmhGa7am2YFoGa7T/NX5fXeELrP3Zpy6uIpXwbddYJqAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtTLnJWQ6RiBflcYPhIazi7RxdZbYv79Rk3o0bMiLvUuFv04RB
	s4C3LgnT1qmDYHUeq/s8ssA3yKm18yrvh716n2mLb7iQCj7Fv0wHbTI5qC98g+gMExvRk19kmn1
	aAeuHYF4DPA3K5wJIVZPiaOqq1GdkVrVA8EWMfwvTjp+mVxdxA+t+qwf14e1FSk0UtLP0hE5NOz
	rorgBMnZuOR7l415VHlDh7Y3Cgw5hn34ObwUxOA5LW
X-Gm-Gg: ASbGnctEYwKIqryAeLSZAeBo30R9Yuy/2z0YVh4mGhPQJwzLFwT9G5ZiSXhjvM2Xnnm
	zxYDH86yhqIVqTgWlj2n0WzSfLKipdkVrzhiV8F5C+cFxprViSqtmPJI4dMX4nx3SF4nJUA==
X-Received: by 2002:a17:90b:55c3:b0:312:1e41:3a5b with SMTP id 98e67ed59e1d1-3121e413beemr1546581a91.4.1748498571180;
        Wed, 28 May 2025 23:02:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGseKM57uPSH1yzFvA1sPyp64ebVJHorKWlBt3avCzTNh2XNJWP+T1mUEEHN7w8KQS8+ef/r6g+EcKIjodekn8=
X-Received: by 2002:a17:90b:55c3:b0:312:1e41:3a5b with SMTP id
 98e67ed59e1d1-3121e413beemr1546549a91.4.1748498570780; Wed, 28 May 2025
 23:02:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527183407.2093374-1-alok.a.tiwari@oracle.com>
In-Reply-To: <20250527183407.2093374-1-alok.a.tiwari@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 29 May 2025 14:02:39 +0800
X-Gm-Features: AX0GCFuDDpVrmW1-K7aWF5F3A4LuqINynrQFLI1IwHM-GXbe0Lza7KjoUEaxLzE
Message-ID: <CACGkMEv-FAbx-TU0Lvi_C=9Tk94EiHmDQzT7Fqn0ZsMcP3BPkQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] virtio: Fix typo in register_virtio_device() doc comment
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: david@redhat.com, mst@redhat.com, xuanzhuo@linux.alibaba.com, 
	eperezma@redhat.com, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org, darren.kenny@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 2:34=E2=80=AFAM Alok Tiwari <alok.a.tiwari@oracle.c=
om> wrote:
>
> Corrected "suceess" to "success" in the function documentation
> for clarity.
>
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
>  drivers/virtio/virtio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> index 95d5d7993e5b..2c022640ec4b 100644
> --- a/drivers/virtio/virtio.c
> +++ b/drivers/virtio/virtio.c
> @@ -506,7 +506,7 @@ static int virtio_device_of_init(struct virtio_device=
 *dev)
>   * On error, the caller must call put_device on &@dev->dev (and not kfre=
e),
>   * as another code path may have obtained a reference to @dev.
>   *
> - * Returns: 0 on suceess, -error on failure
> + * Returns: 0 on success, -error on failure
>   */
>  int register_virtio_device(struct virtio_device *dev)
>  {
> --
> 2.47.1
>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

