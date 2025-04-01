Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD9A1F930
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514229; cv=none; b=n2Jq9qCKpjs1HWdZAVjqFtS3oljl5vQLD5RituwzLlv6xHx7GPFsr3jPRqEqvwkhUcXyEamDXCfJdl+ChtK/5DDfreS/8lR6tVe0/+y1uspdGFiGmbznOsVG7kHh9KNhdR4mjOyRM00VxVsdpR7Vl2yMl5VkIVedd1ctJiRlSpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514229; c=relaxed/simple;
	bh=xaI867HGHR4T8sG8WY/K4UFRf2cdS9W4OArVVIu7Kpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4bXAwicJCpCSMRJcBSeLG+yokX7tgrpsShg1Eq0W4UlI3TtwWgPhbyYBrzBFLlUFLjVufomcfDO7Nkt7wQn4F2JNdcxt/sQUnfTquxtA6m/hrMWaDv619Uv3ywo1GeiWEMp26QBbdO4cpdyOLiR+H1YFzu8ghqrThVNCgdyqmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZdgGKKbp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZdgGKKbp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743514226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GD6tHabuLwNG81tJKtS1hzWrYbj0F2aL9q0asRKe8YM=;
	b=ZdgGKKbpq/DYW4sOr9R+gRN2iS5oMwZzbwEtY5sGpgNhTOuxtgyR8aJgE9PIlREH/mKnqz
	IpER05Bgdx4ygGEm7/6fZI7ztzXlQzvIsC8K6pM4QHjpb/o3Tc2zvuHp9N1NvD4VcflciU
	usuk6131N82QbylMLbfmdUuZf6s0tq0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-ouNWUEpqMDS0rONo9mtQ2Q-1; Tue, 01 Apr 2025 09:30:24 -0400
X-MC-Unique: ouNWUEpqMDS0rONo9mtQ2Q-1
X-Mimecast-MFC-AGG-ID: ouNWUEpqMDS0rONo9mtQ2Q_1743514223
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3912a0439afso2373942f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 06:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514223; x=1744119023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GD6tHabuLwNG81tJKtS1hzWrYbj0F2aL9q0asRKe8YM=;
        b=D7gD3SjmTRZOq0UcNoA4j1EAWvBbxfosZI/0FmDdo4mg9w6hHHsSoirVhZiutk3pGc
         ws6fX/cMdZkQrftFRwYFgPdmT0hEUqaWNaqyQG+5Hb/4bhXG/knpcbgVeQXwaK3cuBIa
         7XAQi1EtFr3XEXT6ywuuM0MevMPTihZC6YStiJMAbSpuo4D8fpukgtzehUGQnx5iWOZm
         tE9Rjc4ihlaGXBjiuz7CfoBnwQGHs+fABH1Aljbcm1k7MlY5VyGCifr+ZqlFVd8JPcrL
         4bS8DYJ1ETvPvNawaJ0lrNbBJOqGT8ZMs6pR4U1M9QmXSchQJmUP4umBwKFGlybTuF+1
         pIsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhxKS++iQRLJiyXtD+1i6Xt6Xs51j/B6gbDCR52kPTSarl6HmiyWdCeFdUDYuvPDOIMcr8HS4zjdB/Mhw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc11YC6GAxqIdhSWuICMpbnyPtxrSJFsmRndIhahrZX/pL6bMB
	yLELbXqbiJoVUxdzjhs0pUJ/RplD9xbNA/6KnYSu1hYEoqBtKna2QAR9oyrwdQo9hYa8hYwADwa
	cnKOFP4mpr+Xhgc0IQH4gkjOG7rSq9ijHdVY1dsl5qiSIEEaFdIZgyrnhAtadww==
X-Gm-Gg: ASbGncuqryMNmtR+CGCrjghxCZtvP+dOgxh/s90CEZ0ml8KEpQGAmG88/3PZdOcdMNz
	4p+AXi/xlG/hHdxKj2PpfLBDYy7paeNl7oAbRaOlpZIz4jts7ZHgHMbSW4+7Yj0nzkxrxFxCL9w
	lmIxEmMD2LMbNsDWEVmotifczYYXGx/Ne0b7PAp0cBxObi7fbySGgZitVAn4VmoLlBhPbnTBnfU
	767HpaLJ4KE8bDkJO0ZRRdFNtpOvtyqdS2rj7Ul9GGGfZwGkMD9R5EDLllZIOUArcKzvXN2n8IM
	t+Bbn9CiYghPS2RJllF1xc5+ny88SNxRhwX1H87XrbozB0DeusNM6EkWd7o=
X-Received: by 2002:a05:6000:1787:b0:391:2c0c:1270 with SMTP id ffacd0b85a97d-39c120cca84mr10705799f8f.1.1743514223444;
        Tue, 01 Apr 2025 06:30:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtrXMI4ItLJvlB6UQ12DShg3B37MVyGcSOysd3SaKEAZoFNB9cLMEIrsOQAU4HBuVM/YXR7Q==
X-Received: by 2002:a05:6000:1787:b0:391:2c0c:1270 with SMTP id ffacd0b85a97d-39c120cca84mr10705740f8f.1.1743514222825;
        Tue, 01 Apr 2025 06:30:22 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-59.retail.telecomitalia.it. [87.11.6.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6588d0sm13928073f8f.7.2025.04.01.06.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:30:22 -0700 (PDT)
Date: Tue, 1 Apr 2025 15:30:17 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, michael.christie@oracle.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH v8 1/8] vhost: Add a new parameter in vhost_dev to allow
 user select kthread
Message-ID: <74u5ppfmuf4gwjup3eotpnd6bulocerdk4l54qvykfcnesf6hm@udabnuiw2v6y>
References: <20250328100359.1306072-1-lulu@redhat.com>
 <20250328100359.1306072-2-lulu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250328100359.1306072-2-lulu@redhat.com>

On Fri, Mar 28, 2025 at 06:02:45PM +0800, Cindy Lu wrote:
>The vhost now uses vhost_task and workers as a child of the owner thread.
>While this aligns with containerization principles,it confuses some legacy

nit: missing space "principles,it"

>userspace app, Therefore, we are reintroducing kthread API support.

nit: "userspace app, Therefore" -> "userspace app. Therefore"

>
>Introduce a new parameter to enable users to choose between
>kthread and task mode.

I would explain that by default this is true, and so we are not changing 
the behavior with this patch.

>
>Signed-off-by: Cindy Lu <lulu@redhat.com>
>---
> drivers/vhost/vhost.c | 1 +
> drivers/vhost/vhost.h | 9 +++++++++
> 2 files changed, 10 insertions(+)

Anyway, the patch LGTM with or without the commit tweaks:

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

