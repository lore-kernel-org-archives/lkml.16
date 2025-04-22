Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2A327815F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745329024; cv=none; b=HtmI+wVT02zPb89hOb1xpWxa3j6B4ev9DjJACbGHKoeZIUrFvqHLOkIpZFghhKY42UXaaIHCsjPZMpRWaGrQREozzYBWy7qjDencazf+kqlXldOKOOktowTg74kAy/PY+O+fDsv4ZacreDg4H4nI5iNx0MtjQNhxYXwar6RPt0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745329024; c=relaxed/simple;
	bh=qqYnk5XrxGLzZLkCL3wTaRUPbFdR2fhEIlck66k8r7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/OljnMPF2ftrpzTRwibkmXOVgY+YvwFAyVBPo2kOsKbpGrB4eIzZTnDpn8MJczzVwWkFvb0SQP3uXbK/hftSrtvX8ySf+MRhdVeGtZFdSbmRjwrAFpTxSvi/M8DIr+FkzcxpfxAdseyfBnm1ZLVYlV6Py2SdcAXt6LMETMEJx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MNNU1xZD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MNNU1xZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745329021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zUewcCAfKjSAtX3UJYdMN8CFjSRLSUT1k8cvjFFQcBY=;
	b=MNNU1xZDj9xEhkPwsp3xihqLyqjW2U8hSI35EP0OFvfZovoRt7663HTSfGPZWqWdshKEff
	pdwwJ2OHx2HINwaGJzn15kiKcu1Y/RaluBnSOvAAA2/VTyqgzRfiUsKYXj1PxVjAHv42+O
	t84aS8rDa2rZzyuAM5+YnlKeKP6MZUk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-kLFJ0gH_MnGZmsz3xPH3xA-1; Tue, 22 Apr 2025 09:36:52 -0400
X-MC-Unique: kLFJ0gH_MnGZmsz3xPH3xA-1
X-Mimecast-MFC-AGG-ID: kLFJ0gH_MnGZmsz3xPH3xA_1745329012
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5e5c03580aaso3785172a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745329012; x=1745933812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUewcCAfKjSAtX3UJYdMN8CFjSRLSUT1k8cvjFFQcBY=;
        b=IBrcQF3y8NZFO4A/0NGtLxFdzVdBccb6aD3OzRMPy72lwI1pRj2n0swMobK4lDp2hi
         2HH/assNwCrpMvd10k6FP376nQKleF8Xf9YgUQ8WMJ+caQbUvoje1u1MzTKjiSg2chMB
         b4mwP0wmln1Dj8s7q1Z6VDY9pn24B3qbkIs/0Oe02FZAb42xFh1SLkMiKD6zjw2FzNrX
         7vu5s7NUkzNETRe66CUfipW02wjVu8ZHDjQ+WhF5Bkc26MtmuBUH7rNYOGnUfStEpgor
         15xJ3WWgFfeEzZqi64fvnT4Mf31CYaNoHZEgqSEEgMH1qTUXNtHulxTPO+/Mm6JIehuO
         PvJw==
X-Forwarded-Encrypted: i=1; AJvYcCVbzXhhl94C06zJJmwghyZxtb8EKycI66+nJe7a4KGejauG7Ga+dX90N2nlD5BGCG5IMv4DVrNovIuEo40=@vger.kernel.org
X-Gm-Message-State: AOJu0YwChOaw9Tv83W9ghKzEFk+pciFY8P1d8WbXo/zdKAlTRu6h0kmx
	DG5wWy8o9n6nrRukn6SlgWhH32EgCzMeaHffFkTHXy9/+SGozY2uiwCB2uz3dVr2UOcCeIqHoR/
	iFpIqZl6hEcsZ83nZy93ZK3AFoi4/GHVz/qQP+65zuFWn85tOapyllm9ImoK1qQ==
X-Gm-Gg: ASbGncv35WVS19kudQ/jIuUlMy91200fa5m250xsyaQQufH3DYQ8yDiC5RVUz2TGYdE
	0Oz7qH1hrqCCsKMIzJkX3dt1TvFrWI1MgcayYgTxDOsO7SD77W1+Xyvl2MFbbULMfS6IpyOZHPm
	HmOuycTYc+9CSZMc4kKi2VoyRnRvaktdc3PngNWeJVqYqYmxbFXyS/1igrZWkh8X3jLVc36X3HG
	LngTmGRUGpKzrte1UreQaFwJ7c/L2st8MJIu1v437rcMhXp0k3pP7yHTrVZIblH88v3e0VFZXMG
	9Wbk6nm8R/HqqiQX
X-Received: by 2002:a05:6402:274f:b0:5f4:c499:5508 with SMTP id 4fb4d7f45d1cf-5f628535a3amr11578544a12.9.1745329011720;
        Tue, 22 Apr 2025 06:36:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLWfcUfsxB2IzKkKV/CizBO05VIu+DXGm+L8+NKFCuGMypvZbpTLcet5RlzVieCOKekjSNxQ==
X-Received: by 2002:a05:6402:274f:b0:5f4:c499:5508 with SMTP id 4fb4d7f45d1cf-5f628535a3amr11578522a12.9.1745329011142;
        Tue, 22 Apr 2025 06:36:51 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.218.81])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625a4aed3sm5887654a12.80.2025.04.22.06.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 06:36:50 -0700 (PDT)
Date: Tue, 22 Apr 2025 15:36:46 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, michael.christie@oracle.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH v9 1/4] vhost: Add a new parameter in vhost_dev to allow
 user select kthread
Message-ID: <feelu5lubmz3syms5nkjnzdzoygwnbnldms3hzbhkenpu3s4k6@xwzjct2xo6hq>
References: <20250421024457.112163-1-lulu@redhat.com>
 <20250421024457.112163-2-lulu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250421024457.112163-2-lulu@redhat.com>

On Mon, Apr 21, 2025 at 10:44:07AM +0800, Cindy Lu wrote:
>The vhost now uses vhost_task and workers as a child of the owner thread.
>While this aligns with containerization principles, it confuses some
>legacy userspace applications, therefore, we are reintroducing kthread
>API support.
>
>Introduce a new parameter to enable users to choose between kthread and
>task mode.
>
>By default, this parameter is set to true, so the default behavior
>remains unchanged by this patch.
>
>Signed-off-by: Cindy Lu <lulu@redhat.com>
>---
> drivers/vhost/vhost.c | 1 +
> drivers/vhost/vhost.h | 9 +++++++++
> 2 files changed, 10 insertions(+)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
>index 63612faeab72..250dc43f1786 100644
>--- a/drivers/vhost/vhost.c
>+++ b/drivers/vhost/vhost.c
>@@ -552,6 +552,7 @@ void vhost_dev_init(struct vhost_dev *dev,
> 	dev->byte_weight = byte_weight;
> 	dev->use_worker = use_worker;
> 	dev->msg_handler = msg_handler;
>+	dev->inherit_owner = true;
> 	init_waitqueue_head(&dev->wait);
> 	INIT_LIST_HEAD(&dev->read_list);
> 	INIT_LIST_HEAD(&dev->pending_list);
>diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
>index bb75a292d50c..19bb94922a0e 100644
>--- a/drivers/vhost/vhost.h
>+++ b/drivers/vhost/vhost.h
>@@ -176,6 +176,15 @@ struct vhost_dev {
> 	int byte_weight;
> 	struct xarray worker_xa;
> 	bool use_worker;
>+	/*
>+	 * If inherit_owner is true we use vhost_tasks to create
>+	 * the worker so all settings/limits like cgroups, NPROC,
>+	 * scheduler, etc are inherited from the owner. If false,
>+	 * we use kthreads and only attach to the same cgroups
>+	 * as the owner for compat with older kernels.
>+	 * here we use true as default value
>+	 */
>+	bool inherit_owner;
> 	int (*msg_handler)(struct vhost_dev *dev, u32 asid,
> 			   struct vhost_iotlb_msg *msg);
> };
>-- 
>2.45.0
>

