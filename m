Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDB02F5E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 02:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749091737; cv=none; b=mnNsCEmirGwnhTTb4A7YFp4gzBFo0laLkEqVLsuPgrRnjwKoAVia60I3c6COPRCWpg1y3g+Zppr1V1CSlhMoGsbkcn4swrvl/GLqrdi0EtCgLT0w8VzZNGvyLi6BTkecTdXCFQp8ZDTgktDXjMN29PM9lj2qM/niz7MGdutWBfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749091737; c=relaxed/simple;
	bh=t4detorygDiNP94WSkQmK0XSEveHxBQIOKKfwoRS9pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ssSu4solBVZ9ckJjsnmQZGmEy9bDaX1i95Z8BHcJCiQRCTDnd4qiTIAOhUrLHbbzi7wRdcby5T1+HCOcqQIYnX4VqCxmVt4Yg4R9ABXj8kuKu7ZTtXX6ondExDqZB6TDVM2gmS9CtYttNOCeY/+AvSImIsjNmg4pafaqbrvcfOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cu0tVLEd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cu0tVLEd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749091734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dbZIYNIcbcpYGKI7GQpYFy5AAldBczcWZ7gpkadXYag=;
	b=Cu0tVLEdqbOvxggzSGkQsRHVwcPgmiUtbEmrSsSkMVjQxswVxtRmTmFP3sOzScVh4Stww8
	TwX9zqDCQUYZpyJ28Yg0MYEWSoeD8h/jqIg62H5cCPoKPgLgu3nVWu6yRcswmJxIFvqMOQ
	vZjVWUWd8kjopYVoN7KAhxcN9TX5ImY=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-hbNmJdnRN7q0SI_g_9wmjg-1; Wed, 04 Jun 2025 22:48:52 -0400
X-MC-Unique: hbNmJdnRN7q0SI_g_9wmjg-1
X-Mimecast-MFC-AGG-ID: hbNmJdnRN7q0SI_g_9wmjg_1749091731
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7480d44e6f9so495217b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 19:48:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749091730; x=1749696530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbZIYNIcbcpYGKI7GQpYFy5AAldBczcWZ7gpkadXYag=;
        b=tjA1UcSqXMR/jcRLszcbFsnKo3qZ+exhA4IEaF2Rfx06gSRUoig8eyaL1m/vVelsGE
         y7LuXbWJ9pLZ9HaBt+SIlrO5d1jcw5oB6PbzC4ebbLV0dk8al+OTEjt+4TR6uftDxa2t
         zUY6Tq/mLbENYcnclo+dnw8DxNQo+6RiDdY6bsnboovTN+EBW2k8v3nve5Fa9J/1vIDE
         8/S+5XJC2zVZ3VVk4PpHT2jAn+Jwn92FfZEr84Rz7yOAuaNMa8LQesdwIzd+jJ/ONjLm
         6Q4O2q3K3gvSWt05C/nbU0327d8fbVoszDXH/NWeMR7gqBdYJJe5XY4gp+XIs4Lcbg+U
         +PNw==
X-Forwarded-Encrypted: i=1; AJvYcCXNvPiqZaKyarGhAooA/9tEQa1xcEUDKa/bXtCkjt/Lj4iTunJLOfHLZI9uSUfFFB0/VaI+0P/ZCY7EnVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXKDzJpftH7S9ZL8HBwNmj3/dGl1yb9FXmCw9LBLr5nsURJ7cZ
	rAmq+FC/yoG7BaiNbZT31OQGQcprwcP53TX7yWheNo3yxM1KexangGgsxwqtFNf0qTWncWu1Pk0
	TyhkbYMO3P8oSchIlb4KB/KBRM05ydvv5JpjamF7qITHyyizufrn/QDswsAOd2A4AHp9qHpezjs
	vKJe2hUqxc15vvRXKL8racK5JZuceppzlDrnFrMtGKr+/EjtFRDA8=
X-Gm-Gg: ASbGncsuW4wbhmIuDaCvFnUkldDgQClEMj9jAL83B2Bgnr+YhagXtK8nwY5ubI5zs5N
	tnVGKpUZHBL84jv+IKeKCwgv4zdij4nqS3otvWm6KT1RVsbgcBkiGKwoB0RewAW/h5X3q
X-Received: by 2002:a05:6a00:4fcc:b0:742:a7e3:7c84 with SMTP id d2e1a72fcca58-7480cf89b3emr6468006b3a.13.1749091730134;
        Wed, 04 Jun 2025 19:48:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrqB3XiBYcW/hYapHNk+jA3BSGhc8isfd6N3AxDbT90mhS46oJzSgVuNFeBEMvpAsTeIqDFb4uw1vsZZZTceU=
X-Received: by 2002:a05:6a00:4fcc:b0:742:a7e3:7c84 with SMTP id
 d2e1a72fcca58-7480cf89b3emr6467980b3a.13.1749091729813; Wed, 04 Jun 2025
 19:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604184802.2625300-1-dtatulea@nvidia.com>
In-Reply-To: <20250604184802.2625300-1-dtatulea@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 5 Jun 2025 10:48:38 +0800
X-Gm-Features: AX0GCFs_GPLF0gKDUCq970gHNyiw0rWqggwHW7k_1Il5kcuvZ_GXf6UMbbRftgo
Message-ID: <CACGkMEttzcr24-cD5AGSvc_79_OJbZ-coLR-N68dMTqJe6V-TA@mail.gmail.com>
Subject: Re: [PATCH vhost] vdpa/mlx5: Fix needs_teardown flag calculation
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Cosmin Ratiu <cratiu@nvidia.com>, Shahar Shitrit <shshitrit@nvidia.com>, 
	Si-Wei Liu <si-wei.liu@oracle.com>, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 2:48=E2=80=AFAM Dragos Tatulea <dtatulea@nvidia.com>=
 wrote:
>
> needs_teardown is a device flag that indicates when virtual queues need
> to be recreated. This happens for certain configuration changes: queue
> size and some specific features.
>
> Currently, the needs_teardown state can be incorrectly reset by
> subsequent .set_vq_num() calls. For example, for 1 rx VQ with size 512
> and 1 tx VQ with size 256:
>
> .set_vq_num(0, 512) -> sets needs_teardown to true (rx queue has a
>                        non-default size)
> .set_vq_num(1, 256) -> sets needs_teardown to false (tx queue has a
>                        default size)
>
> This change takes into account the previous value of the needs_teardown
> flag when re-calculating it during VQ size configuration.
>
> Fixes: 0fe963d6fc16 ("vdpa/mlx5: Re-create HW VQs under certain condition=
s")
> Signed-off-by: Dragos Tatulea <dtatulea@nvidia.com>
> Reviewed-by: Shahar Shitrit <shshitrit@nvidia.com>
> Reviewed-by: Si-Wei Liu <si-wei.liu@oracle.com>
> Tested-by: Si-Wei Liu<si-wei.liu@oracle.com>
> ---

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

