Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A961AAA11
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 10:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748775101; cv=none; b=qCbp86zp2F27KcAzuHAd6CY3Dp7zP3xpp8JhdxRiKxoOaOkiMieslEY9x+p7p6QodguUBMAtL9wlpNdRqruqGXWAB7edKuB/jWFpf5lr9QfpB+T5R99L2mo+jEcFvySwTDgb4OnO2bBRFX2fQM6Q2v4oQgvk++nalSd+4sXBrL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748775101; c=relaxed/simple;
	bh=Kg3D1Hds9FAI9RcBxGC9kYXWJb0C19mfROuvp6I68T0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTAggWFi0/NYwyKfIoGCw0PPB+wat4reCU8FtBotj5oaDyC9gwdNvx5t7sI8tQQ6HCo55uvdn3E7639amd//Una4tcE+BK3TKbU6RhEpA22A38X6mzR3ljOrywPI0SXmtf/lX/D6mbQ4dV2gkNdCRkwC51CH4KczWjWQ1JAISa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DYQTEDiS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DYQTEDiS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748775098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r+LDkkF3bl9XFii8SeXhYSZYWFK7xdUoFXE21Deot6Q=;
	b=DYQTEDiSdyQbMJiPkdjD9rj8JmJt/YRpQJmcc1yatWWq/oh9omV/vKjfD+1ZPEPj1VtD0M
	s2UcMULpqIUUAEmjbtUhvilfLGkQE8ysn9QHYx6ANFYa1z5NSFQx3k9Au8Ht9EwkWiGTVO
	i+Fu57fjDppfyHwonXHoPNY4ZSMWwNM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-vXR2IVadNkaXVMFlOGilyA-1; Sun, 01 Jun 2025 06:51:37 -0400
X-MC-Unique: vXR2IVadNkaXVMFlOGilyA-1
X-Mimecast-MFC-AGG-ID: vXR2IVadNkaXVMFlOGilyA_1748775096
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451ac1b43c4so4858575e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 03:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748775096; x=1749379896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+LDkkF3bl9XFii8SeXhYSZYWFK7xdUoFXE21Deot6Q=;
        b=cQznu3bLHEQqzuNiedxqKzfDAizhKELJNDj3A23SyRsN5X5DOdQwxYWQxLueueIIyj
         xJbQr3bThqCwhqqESYDK31EVdpxV8aTADf7i6Wv1aZbpsbFzkqaB15ktlBzuBzMU8hGw
         en/C/KaLd0K6CgeWzxqxDTpWDliJnAYr30Erc0Z/mOqI0dXCb8RnNHG5KV62I9a2OEoN
         wLnbf/RjtNvxmAHjJtcnz+dC8nVMHATi4hWSwpJRznPtz9gKV6OTQKhEadz+DHeMaabT
         0sSRIg+3YtOcv+fYv26c1ljXuUrpzYwzACOip49DvODBfxwutBJd/xGe2OqNfVcIr1PV
         3pIw==
X-Forwarded-Encrypted: i=1; AJvYcCUMcBUByDevtxmMgNThiaVl6BQgS0oKR5fEHopTTjwxbglM797WipuQV8NwJGRe/hM2WCYo1GLARLrKH6U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv1mNRpxhh1hnZXH4X644dCCkNWs3LhAIbG8eV05HBqYx1HALZ
	9UW43xLlXSxfesVkqXXjd6VfId/dAz2KBXauJJPDOmBtr4KzQ4XgChJLZkNjScMMnzdE3sgffem
	A/QuEb5HUKUWJLA+Dsw//jyjdjsZv6WmUL4/PpX1280OXh0rCrrnMO+D+NS2t/GRAxg==
X-Gm-Gg: ASbGnctS1FXafA/v3+27uRN3fUhzL/bRcczvhiz5CHl/gOHF1Y4PXKXsshzMtBNJiSf
	ETAjONiKtm0A0uS7cpTJvVipjbk9JWA8jv/U/JEncH/rGv+UJyv/EmXtfKMDSpJFLfINQmo4kdC
	T2xgJSke3PqOIgo6Vgot1jy1qG+OV99O/t1B72J2QfJfZLeNdIo+6k6d0o2QsLah4mbS+jFpAlv
	MDWuea1eA8uruDIybK0Uc3hY6lgG0qzaQU0kUytQrw8j+zfxsBN7A7MGkPeDY1mSdb7lK+gUGq8
	5akdkg==
X-Received: by 2002:a05:600c:6747:b0:450:cd50:3c66 with SMTP id 5b1f17b1804b1-450d8876bd5mr68720215e9.29.1748775095925;
        Sun, 01 Jun 2025 03:51:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyVvW8vOUJekNf9fJWEFV8OBsS9sxAfCFyfMFebeG/spr6/CyNivjswpG1bzmxkbm+qlN2ZA==
X-Received: by 2002:a05:600c:6747:b0:450:cd50:3c66 with SMTP id 5b1f17b1804b1-450d8876bd5mr68720075e9.29.1748775095516;
        Sun, 01 Jun 2025 03:51:35 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8012af3sm80427155e9.35.2025.06.01.03.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 03:51:34 -0700 (PDT)
Date: Sun, 1 Jun 2025 06:51:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, michael.christie@oracle.com, sgarzare@redhat.com,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: Re: [PATCH RESEND v10 1/3] vhost: Add a new modparam to allow
 userspace select kthread
Message-ID: <20250601064917-mutt-send-email-mst@kernel.org>
References: <20250531095800.160043-1-lulu@redhat.com>
 <20250531095800.160043-2-lulu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531095800.160043-2-lulu@redhat.com>

On Sat, May 31, 2025 at 05:57:26PM +0800, Cindy Lu wrote:
> The vhost now uses vhost_task and workers as a child of the owner thread.
> While this aligns with containerization principles, it confuses some
> legacy userspace applications, therefore, we are reintroducing kthread
> API support.
> 
> Add a new module parameter to allow userspace to select behavior
> between using kthread and task.
> 
> By default, this parameter is set to true (task mode). This means the
> default behavior remains unchanged by this patch.
> 
> Signed-off-by: Cindy Lu <lulu@redhat.com>

So modparam is here but does nothing.
This should be the last patch in the series, or squashed with 3/3.

why is this inherit_owner but ioctl is fork_owner? is there
a difference? If not
can't the name be consistent with the ioctl?  vhost_fork_owner?


> ---
>  drivers/vhost/vhost.c |  5 +++++
>  drivers/vhost/vhost.h | 10 ++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index 3a5ebb973dba..240ba78b1e3f 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -41,6 +41,10 @@ static int max_iotlb_entries = 2048;
>  module_param(max_iotlb_entries, int, 0444);
>  MODULE_PARM_DESC(max_iotlb_entries,
>  	"Maximum number of iotlb entries. (default: 2048)");
> +bool inherit_owner_default = true;
> +module_param(inherit_owner_default, bool, 0444);
> +MODULE_PARM_DESC(inherit_owner_default,
> +		 "Set task mode as the default(default: Y)");
>  
>  enum {
>  	VHOST_MEMORY_F_LOG = 0x1,
> @@ -552,6 +556,7 @@ void vhost_dev_init(struct vhost_dev *dev,
>  	dev->byte_weight = byte_weight;
>  	dev->use_worker = use_worker;
>  	dev->msg_handler = msg_handler;
> +	dev->inherit_owner = inherit_owner_default;
>  	init_waitqueue_head(&dev->wait);
>  	INIT_LIST_HEAD(&dev->read_list);
>  	INIT_LIST_HEAD(&dev->pending_list);
> diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
> index bb75a292d50c..c1ff4a92b925 100644
> --- a/drivers/vhost/vhost.h
> +++ b/drivers/vhost/vhost.h
> @@ -176,6 +176,16 @@ struct vhost_dev {
>  	int byte_weight;
>  	struct xarray worker_xa;
>  	bool use_worker;
> +	/*
> +	 * If inherit_owner is true we use vhost_tasks to create
> +	 * the worker so all settings/limits like cgroups, NPROC,
> +	 * scheduler, etc are inherited from the owner. If false,
> +	 * we use kthreads and only attach to the same cgroups
> +	 * as the owner for compat with older kernels.
> +	 * here we use true as default value.
> +	 * The default value is set by modparam inherit_owner_default
> +	 */
> +	bool inherit_owner;
>  	int (*msg_handler)(struct vhost_dev *dev, u32 asid,
>  			   struct vhost_iotlb_msg *msg);
>  };
> -- 
> 2.45.0

