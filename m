Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E70F292B35
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751304520; cv=none; b=a5AkLxaaw8ED4P4h29y5CYFu0klW94O3bSk0A5cTFdK8EMaEI9Ip53tHGe9WT+2cJb8f2XKbhYJTg8RFROPYLYzbvlk5tLuPAFY/qCoS7LwVM296ezBVMyyLlIrkZUi9kkoDX6oPecs9O1SZivVG3zKbvtu3oAc6qdwn5IaiTpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751304520; c=relaxed/simple;
	bh=AZysZLAfMgjijyvGawDaXqme8p+2Ab++Mdy0TlE6OKo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=txYDyI9j2n67b9RP0bZvIcS9P6VfLYqlYDvvGIvsUcuneFn8b+cfBnW+9QSpPz3yHZtJz390EEnskgRZL789QtctgTtY3ubAfm3ZO/zCp17zn/dSRd7VEGqdj8JDICinK5mN6gsV/WnAU3g5Z/74Q9eP1gjXpurquF7DYQ+oISQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JRR6aFMl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JRR6aFMl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751304517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XTEw+AZQXJDFo+sYwotNPS7NL0XSe5VzVOicEJ3vP2I=;
	b=JRR6aFMljSUZSkipX7pHQSTAS4suuH7aqdhHEEAkumdy+1hwrW3/snBonqq3lmKlSNaqNo
	cvHrWcaHYbjkgqNvVQmldfIJs/x6fLYy3f3gXFuNb8pR8/IJYSg32mbGMZA+z+Qp5hX4s4
	ny6vGz2yK3RVLtVXNbaSODExTDwa2W0=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-YWkc9KKxN8SvzF4-jv2ytA-1; Mon, 30 Jun 2025 13:28:35 -0400
X-MC-Unique: YWkc9KKxN8SvzF4-jv2ytA-1
X-Mimecast-MFC-AGG-ID: YWkc9KKxN8SvzF4-jv2ytA_1751304515
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddd689c2b8so8089725ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751304515; x=1751909315;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XTEw+AZQXJDFo+sYwotNPS7NL0XSe5VzVOicEJ3vP2I=;
        b=MTf6al/jHeVe1OR4HMk9D6PrRz19S56qLlGlbwOnz5RyBdSgsV9vF8o/RyS5lfROuD
         A9UZHOsc9sGUHf1zq+NDFUz6AAinYHXlAyfp3w20fAENaRN7rqcGjt0zwMskthaLXShq
         cU2iE+6oKNmrHTQ/11v4Vgiw2Ca0Uf4r1grL/hoFELGW6dA53nQBEpoS+kY+szxrrcx+
         F5ld9zK5SlSSYbYcGjOQTvB8MczY1NCYDG2xBS8q30QXJDJoQ1F3PQRyYrDHNE9ZIWBn
         dMJA+JnbKoVD0nOEUbSSH6kL8J4lL6H3bQkV/IyTYVj1aVmoDCbAselOCQEdzYdPnUt5
         ca5A==
X-Forwarded-Encrypted: i=1; AJvYcCUxdLZuBiuDgbCHZp5dDj0C3Ws5rkZPqSFJDsrizg2JH+/WEpS8wxU8/ZgrPV+a7kVJO3Ln2Y2DXGt/0q8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz52jC/a8Nb/NjK1g6gchfLZcieEt1B2R4Hw8zgOBEPstK8QAx6
	GHDC6kzjvJAj1ForfR7ysY4VU2QvKI5zaqUni3jtc2IN9Aq+272aZH9s/9mV5L7RXE+mXsSS3eS
	AiO0Y1lDEarjlXJL3Np7oZR1D60CGkCYuxDSx22nuSyWEMObcBnFjyp/Hs/SETrhPpw==
X-Gm-Gg: ASbGncv7jTjK0iqJgOa2bq8z7iJ0NoOjk/0KOvF5ISdLc2zKkJh1MqXY3pPO8z7FSwA
	menvsgp6br41X9E8stGwh2z/dYVMbpzmA3lq6NQpZ0SE8+xobREqSSUby0mV7g3QvKCRc3FjL1u
	UNG/XQTT8xmRFpOF5X6FFPw4KF8BIOtGFxKdIp6GDxIvRrm5oL6IoK1DQHSuPiVkNQw7UCTBvwU
	1XuMSX0o43F+7chJU3aiuV/JwNohKANi1BzDKvfJJQaOa362rquQc+lLvdUezwYZPFnoW4RmDxY
	GjM03fe4hPYu5OnwN8DHQctxbg==
X-Received: by 2002:a05:6602:14c7:b0:85d:9738:54ac with SMTP id ca18e2360f4ac-8769649f507mr329258039f.2.1751304514872;
        Mon, 30 Jun 2025 10:28:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBhqZGB3QLk7wR0Imzc7PvjRuRP90fkt1j/6bV+xvH6DMJu6hPhaHCi38lYJceTKtXqQLTKw==
X-Received: by 2002:a05:6602:14c7:b0:85d:9738:54ac with SMTP id ca18e2360f4ac-8769649f507mr329256939f.2.1751304514474;
        Mon, 30 Jun 2025 10:28:34 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50204860506sm2003757173.9.2025.06.30.10.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 10:28:33 -0700 (PDT)
Date: Mon, 30 Jun 2025 11:28:31 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Artem Sadovnikov <a.sadovnikov@ispras.ru>
Cc: kvm@vger.kernel.org, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Kevin Tian <kevin.tian@intel.com>, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: Re: [PATCH] vfio/mlx5: fix possible overflow in tracking max
Message-ID: <20250630112831.2207fa2e.alex.williamson@redhat.com>
In-Reply-To: <20250629095843.13349-1-a.sadovnikov@ispras.ru>
References: <20250629095843.13349-1-a.sadovnikov@ispras.ru>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 29 Jun 2025 09:58:43 +0000
Artem Sadovnikov <a.sadovnikov@ispras.ru> wrote:

> MLX cap pg_track_log_max_msg_size consists of 5 bits, value of which is
> used as power of 2 for max_msg_size. This can lead to multiplication
> overflow between max_msg_size (u32) and integer constant, and afterwards
> incorrect value is being written to rq_size.
> 
> Fix this issue by extending max_msg_size up to u64 so multiplication will
> be extended to u64.

Personally I'd go with changing the multiplier to 4ULL rather than
changing the storage size here, but let's wait for Yishai and Jason.
Thanks,

Alex

> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Artem Sadovnikov <a.sadovnikov@ispras.ru>
> ---
>  drivers/vfio/pci/mlx5/cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/pci/mlx5/cmd.c b/drivers/vfio/pci/mlx5/cmd.c
> index 5b919a0b2524..0bdaf1d23a78 100644
> --- a/drivers/vfio/pci/mlx5/cmd.c
> +++ b/drivers/vfio/pci/mlx5/cmd.c
> @@ -1503,7 +1503,7 @@ int mlx5vf_start_page_tracker(struct vfio_device *vdev,
>  	struct mlx5_vhca_qp *fw_qp;
>  	struct mlx5_core_dev *mdev;
>  	u32 log_max_msg_size;
> -	u32 max_msg_size;
> +	u64 max_msg_size;
>  	u64 rq_size = SZ_2M;
>  	u32 max_recv_wr;
>  	int err;

