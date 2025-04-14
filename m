Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6011917E7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744648359; cv=none; b=ntQAClwajVSu9JmQMpkjWX1jigy3bWvYsSF8LIadKDcdmywQDumpsElyU5HnziQqj0NG9X2QSCrahB6v4uQQN59No3ivjc+J0JswfJfiKv9mHzrnx0Tsu3D7+QzGgH2xljHO0UcQL32B5nHZm1hF6vKd3qmzoblkvt8sT340r5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744648359; c=relaxed/simple;
	bh=LxeEjXsTzyjmpn+ReNlLxMKLEF/tsQrcB3L0UMTB9is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sV6auPO6fiToMrCEmJzx8VaGdfUdLwZR3QfdXT96uocLTPBEmtlV37fcq6oKiOkYq2lP/QrKKD5gAgJOH2sQWWuyTQlWdbaSvZSzJrZ1t1VEwhpHYgcu7ROWkIBLdBTT/ssJpijU9rh9jD5kou2JnfxE9Jw7+wNFQfxkScxv/Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VrppPEBy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VrppPEBy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744648356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=psPpYVaNQlJBPoNb/90nh8sbsObK4AuLZcGNe09lj5c=;
	b=VrppPEByuDEadsvSH+p/M1HnQCMj2v5XF6AtS80foymTitPpmiIE2Wd7OklxnBTn8KptjP
	cMjxNz1BJIYJykiYD3CB73znx6OgDQqRRwARqkF/FoecqbhK0Nmhp1qdoAywk9Rs0p/YYk
	4KZxmYhS1mgx26NWN4iNlWa6vHVGH2A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-uerkHiodO_222ZwAHlXNOw-1; Mon, 14 Apr 2025 12:32:35 -0400
X-MC-Unique: uerkHiodO_222ZwAHlXNOw-1
X-Mimecast-MFC-AGG-ID: uerkHiodO_222ZwAHlXNOw_1744648354
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d22c304adso23780075e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744648354; x=1745253154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psPpYVaNQlJBPoNb/90nh8sbsObK4AuLZcGNe09lj5c=;
        b=qjDC2txHEILhVhNFco8eFXd+ILdwUnVQe9NdUonkBUElJtiOpp6VTTR8kGPfcj3kiP
         FQBDhQ0JPKv6uRzF0vlxjMpgZutZJUzf8Aq53rHp6PpRtZMd9KiFGitHr8dhSqgQTbGa
         e6OrxQpri/8Vzsf5sMnYQ1eFLduc3iWYoo1p9qOX2Phwm3hUEEBFPu1dV+1jmBla0cky
         3bEzSydFiQYMx0m8pG/pIlC0kJJMJovhNU3U/lZi4+7ROi5WI4wqSVPysbrbY97Pa1Gs
         s/7e0ktEhQyCGVLebitbtdm93tFvt1CU9mWE3xi2q9/7oEPx9ytthKwCzCU1ff5m3HMH
         wuYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoN3PvtZOr3rB493DBTh//33ugpg3mpdc+K/rfZFbWNlQ6+O5rzn+McE6algxOZ6HS1FXSwZ08mu8Nicw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPXs9DFgjetAjzO6EcdCaeqrEKNaDy7eHA4NxcOBLmXqJ3IH2J
	yMZxnTW0c3XKimkPIyrVrGP+RxrRof3yU9qN5o1ifhcKuuW2W69qdT3+l889vrpnts/nC8pkqk4
	ilaCSW+i3dtaDk3OYlgBSAqIdghM7RlTuz1G3DTdpjirWNUklKFCqPUgy9yJPgw==
X-Gm-Gg: ASbGncskrx0QYE1SpyzgrlLtTXNiaOXm9DIpdpJnSNfx5DXVpcizeXsaFUqeLeZhz+N
	WTuA7pg9LfLbomewNtYtm8pBhMl4ARVhQdOfHUTQGjEc2LrlRz3oDUbjqM59rxrZ58vspptyRba
	DbTRkPgPipdpejONJPnd/U9oL5m1jKeyq0vw2BvC0P5NHpe9Eyj7iAQCY1yOhMOP6GJ8eo07x3H
	ZOTEilfQpYKxZpSgFu69lWHer+27cvpo7sdY5IlYN0OrZ2gWLo3HVe+5nNUVMBGWzNpg8HpDeHk
	xuxjGg==
X-Received: by 2002:a05:6000:248a:b0:39e:cbca:8a72 with SMTP id ffacd0b85a97d-39edc3059aamr38195f8f.12.1744648353759;
        Mon, 14 Apr 2025 09:32:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErshira9b65DJz4U+YOoZ2EfEQ5MJmWz7qS8OqJT6VLSYpu4hvsslk7OCkkLLr5Vcu2G6UIQ==
X-Received: by 2002:a05:6000:248a:b0:39e:cbca:8a72 with SMTP id ffacd0b85a97d-39edc3059aamr38167f8f.12.1744648353322;
        Mon, 14 Apr 2025 09:32:33 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a2a13sm179644545e9.10.2025.04.14.09.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 09:32:32 -0700 (PDT)
Date: Mon, 14 Apr 2025 12:32:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: virtualization@lists.linux.dev, kvm@vger.kernel.org,
	netdev@vger.kernel.org, jasowang@redhat.com,
	michael.christie@oracle.com, pbonzini@redhat.com,
	stefanha@redhat.com, eperezma@redhat.com, joao.m.martins@oracle.com,
	joe.jin@oracle.com, si-wei.liu@oracle.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 9/9] vhost: add WARNING if log_num is more than limit
Message-ID: <20250414123119-mutt-send-email-mst@kernel.org>
References: <20250403063028.16045-1-dongli.zhang@oracle.com>
 <20250403063028.16045-10-dongli.zhang@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403063028.16045-10-dongli.zhang@oracle.com>

On Wed, Apr 02, 2025 at 11:29:54PM -0700, Dongli Zhang wrote:
> Since long time ago, the only user of vq->log is vhost-net. The concern is
> to add support for more devices (i.e. vhost-scsi or vsock) may reveals
> unknown issue in the vhost API. Add a WARNING.
> 
> Suggested-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>


Userspace can trigger this I think, this is a problem since
people run with reboot on warn.
Pls grammar issues in comments... I don't think so.

> ---
>  drivers/vhost/vhost.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index 494b3da5423a..b7d51d569646 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -2559,6 +2559,15 @@ static int get_indirect(struct vhost_virtqueue *vq,
>  		if (access == VHOST_ACCESS_WO) {
>  			*in_num += ret;
>  			if (unlikely(log && ret)) {
> +				/*
> +				 * Since long time ago, the only user of
> +				 * vq->log is vhost-net. The concern is to
> +				 * add support for more devices (i.e.
> +				 * vhost-scsi or vsock) may reveals unknown
> +				 * issue in the vhost API. Add a WARNING.
> +				 */
> +				WARN_ON_ONCE(*log_num >= vq->dev->iov_limit);
> +
>  				log[*log_num].addr = vhost64_to_cpu(vq, desc.addr);
>  				log[*log_num].len = vhost32_to_cpu(vq, desc.len);
>  				++*log_num;
> @@ -2679,6 +2688,15 @@ int vhost_get_vq_desc(struct vhost_virtqueue *vq,
>  			 * increment that count. */
>  			*in_num += ret;
>  			if (unlikely(log && ret)) {
> +				/*
> +				 * Since long time ago, the only user of
> +				 * vq->log is vhost-net. The concern is to
> +				 * add support for more devices (i.e.
> +				 * vhost-scsi or vsock) may reveals unknown
> +				 * issue in the vhost API. Add a WARNING.
> +				 */
> +				WARN_ON_ONCE(*log_num >= vq->dev->iov_limit);
> +
>  				log[*log_num].addr = vhost64_to_cpu(vq, desc.addr);
>  				log[*log_num].len = vhost32_to_cpu(vq, desc.len);
>  				++*log_num;
> -- 
> 2.39.3

