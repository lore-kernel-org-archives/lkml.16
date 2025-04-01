Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECEC13BAF1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743513716; cv=none; b=RBL/b/gbDtNCmaFA23Sm2xo6/Ng55836mWFBSI7xtAY4lCodME+DzWDlnjCDj/+s2WS6aDh1HQoDYDg0RvnrxKy4kRcuBLS8shYiKff9ln3s5p9v3H90fhE9e2EzChcJ9bUXew6L4lTZi+7EQwzHS/4xEGfdmVNERITqWpVQcfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743513716; c=relaxed/simple;
	bh=ycqaVfo4cc/Z15EASZ9JqEGL8RqMFYZHnyysBu7HA+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ionyYZYmu3RWeSPjBLIGZ2lM0w+YyB4EKOZ6HB2T1jZOuRaesjVwvpyMV+wSfD+5HyqkJaN6UccgevI12FQ8fOSjMMIie0mQUfyg6ctRaEXYExuTA9jVqS80jcN6yCz+w3eK0AW0B2pmzMvVLPfWH9IsjXavDPTv0zd5NeDPTek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bsgNgCU4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bsgNgCU4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743513712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eRPbMyE5s2HZPVPM3LxqZ+mTI/kiq2Z60zsrimmnKds=;
	b=bsgNgCU4e3mnZuiU6NFY9RUxJ/d5oW64wO+rJqySUFkTtpoQtMSMhE1IovTKjmtVAlEgn2
	sHV+QLZoSY87MYXUC9bew0SSYJ3ryYNvwiTGMBcfZL8UBaUeX0knELDIkEO1zW9u179Fto
	+PFDHpuj/K8Iw+oti0+lYKPgwBmtmxg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-vk8kUF_AN_GOBxtTp-4_uw-1; Tue, 01 Apr 2025 09:21:50 -0400
X-MC-Unique: vk8kUF_AN_GOBxtTp-4_uw-1
X-Mimecast-MFC-AGG-ID: vk8kUF_AN_GOBxtTp-4_uw_1743513710
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso38553555e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 06:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743513709; x=1744118509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRPbMyE5s2HZPVPM3LxqZ+mTI/kiq2Z60zsrimmnKds=;
        b=Ibiw/ZXfbSp8eSwtFbp2kwE541lTYNUKY3okjT5Jz4MgPwkMaNj8I4U0k22xiORS4g
         L+MQdOXeLa5Lm3aKXR6qRMtaD9G9LPW8fQZBQp+YMX9unR7ol/gX+S71kNC3rpGrkbRY
         gpNAjznrrtoWGVqUUCHVh7aSc251++bQ6KikSo57xlpHSUkudNb3pgy8w0FJomSnIhba
         aRKWrACG+1htNOXD9ofGy3rxbnjgooMXhdVa1npHNByhBT421iAwTg+TmolNUmNa4j1k
         DwXzD3fZUtWVkDRSKJxDAYLHquWQ6OKvsYywXyHAVSGjanUV8SEISyP+KJmkjv1HC1Qt
         OOPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGtq2NMF+hKMPTv2qpQDoCoQ+nMDgIeBK0yEM8mWdNvO6CpZHpkP8eU9/bILJP9pf7xChISbxmgiz0dtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Y3FXXxmrDAP4CCw6EoRTRZZUuV9nOUyiCHytsBgHkO4ij/yO
	j12TW8bx5ZuAl17/Y5kwacsspvp/KO+J/3reZF9lBdG+1o0Q2Hhcjbqqy7FEuz1nTOUOuTkUTAy
	noGD+q/e+BrK0Oag3kNSceyCLb/piK2KTpmP5gp2o5fkR4g2pjWNCy7FSRHg7Kw==
X-Gm-Gg: ASbGnctvR9U6o2y8m0flyCQ+XmbqS9JHQBf95SEqJqRAf2ly+KGBc5YcGN6rDOLEiyK
	0j+CWFp1IG++4KbpL2vmlXDnjUf5RZOYNoqSnUOsuejG9/LTYtQBWhzXQtMWp46pmmUqUnkdIVQ
	dPSh2sJwplg9s7hRxi4/CZGTgB+CQnlAul3QmYxbD86cRl/iCrDzNf8esGJpwi4IuSHN03hAE0w
	6itrQauxhYAbPMK2txTnJOsGNkT6MPdz/y5op0S0gH9ku6WzocQhnwxDEEPAyMSwjRrkkBFwoWG
	U30I/H/4cS74J0G+Bbgm1TUOEa7XirERYmAq1BRIqm27fDO4SxrOyFkco7E=
X-Received: by 2002:a05:6000:1864:b0:391:2f2f:818 with SMTP id ffacd0b85a97d-39c120cc896mr10576008f8f.9.1743513709523;
        Tue, 01 Apr 2025 06:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiWSuzzoAuRNaX6AE7+30mbeGythA/LKCONvKE8G1+2K+Xi1SRoClR/KoadewifmZl/GAkjw==
X-Received: by 2002:a05:6000:1864:b0:391:2f2f:818 with SMTP id ffacd0b85a97d-39c120cc896mr10575974f8f.9.1743513709009;
        Tue, 01 Apr 2025 06:21:49 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-59.retail.telecomitalia.it. [87.11.6.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66277dsm14027524f8f.24.2025.04.01.06.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:21:48 -0700 (PDT)
Date: Tue, 1 Apr 2025 15:21:41 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, michael.christie@oracle.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH v8 8/8] vhost: Add a KConfig knob to enable IOCTL
 VHOST_FORK_FROM_OWNER
Message-ID: <3zmkrimo2nghk42iatj4tuhfb7qrxx235srleuavi4at5dsv26@zj6wqgj7hj62>
References: <20250328100359.1306072-1-lulu@redhat.com>
 <20250328100359.1306072-9-lulu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250328100359.1306072-9-lulu@redhat.com>

On Fri, Mar 28, 2025 at 06:02:52PM +0800, Cindy Lu wrote:
>Introduce a new config knob `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL`,
>to control the availability of the `VHOST_FORK_FROM_OWNER` ioctl.
>When CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL is set to n, the ioctl
>is disabled, and any attempt to use it will result in failure.
>
>Signed-off-by: Cindy Lu <lulu@redhat.com>
>---
> drivers/vhost/Kconfig | 15 +++++++++++++++
> drivers/vhost/vhost.c |  3 +++
> 2 files changed, 18 insertions(+)

IMHO this patch should be squashed with "[PATCH v8 6/8] vhost: uapi to
control task mode (owner vs kthread)".

It might break the bisection to support an ioctl, and after a few
commits enable or disable it depending on a kernel configuration.

>
>diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
>index b455d9ab6f3d..e5b9dcbf31b6 100644
>--- a/drivers/vhost/Kconfig
>+++ b/drivers/vhost/Kconfig
>@@ -95,3 +95,18 @@ config VHOST_CROSS_ENDIAN_LEGACY
> 	  If unsure, say "N".
>
> endif

nit: there is a mix of tabs and spaces in the next block, should we
fix it?

>+
>+config VHOST_ENABLE_FORK_OWNER_IOCTL
>+	bool "Enable IOCTL VHOST_FORK_FROM_OWNER"
>+	default n
>+	help
>+	  This option enables the IOCTL VHOST_FORK_FROM_OWNER, which allows
>+	  userspace applications to modify the thread mode for vhost devices.
   ^
   tabs

>+
>+          By default, `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL` is set to `n`,
>+          meaning the ioctl is disabled and any operation using this ioctl
>+          will fail.
>+          When the configuration is enabled (y), the ioctl becomes
>+          available, allowing users to set the mode if needed.
   ^
   spaces
>+
>+	  If unsure, say "N".
   ^
   tabs

>diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
>index fb0c7fb43f78..568e43cb54a9 100644
>--- a/drivers/vhost/vhost.c
>+++ b/drivers/vhost/vhost.c
>@@ -2294,6 +2294,8 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsigned int ioctl, void __user *argp)
> 		r = vhost_dev_set_owner(d);
> 		goto done;
> 	}
>+
>+#ifdef CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL
> 	if (ioctl == VHOST_FORK_FROM_OWNER) {
> 		u8 inherit_owner;
> 		/*inherit_owner can only be modified before owner is set*/
>@@ -2313,6 +2315,7 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsigned int ioctl, void __user *argp)
> 		r = 0;
> 		goto done;
> 	}
>+#endif
> 	/* You must be the owner to do anything else */
> 	r = vhost_dev_check_owner(d);
> 	if (r)
>-- 
>2.45.0
>

