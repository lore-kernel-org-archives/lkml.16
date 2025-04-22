Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260A618A6DB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745329818; cv=none; b=qNKGMoQKXcGi4YZAd4Y71PA/cun3yuwTBn6GTie0MdnrHA69G75EU4uGR/S6w9vHJ2BS0LyHnao5TQxiIl4Ea8aNfLWGaUz3+wP89+altlS+av0DLciKufemYToAwKoII358k4hk864agenY1ANQ/ot5Htjs+S3+HF4k9v8eXNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745329818; c=relaxed/simple;
	bh=dkCmKq3j0PhWQbKGGX4/SXtHAhGav5AP9tWWdDGr5gM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFYqgt5ebrNWc+pOSrpoNnea5BCgUk3z2Dk4G84Hs7VYPUK2RljE4wYF943Qs4KPl14vCNTfilsN+bFH1gTSwB7DSQUrTpDMH6o27PUafcoueyNpYhtSENSsSU+yJ3Qlh9sgYGH1LwYArv7lBYjOeNsQfIZIaJblgNBZEKryquk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O4ix3TWk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O4ix3TWk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745329816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tGrrkrKKBqlG8Lh7JFZpiU/FR9zy5tYWV0eT1+VwfIQ=;
	b=O4ix3TWkPnwUW0v/gasUOdDLu2rAPMGvp5BhYLaxa+ZVodwLp9vGfvWtNYtJ68aKZ4qL8v
	CGR/6+J4l1nQrDzvfqmej7mvjWjMA+KF9tLQP/H8g2CURkZ3v3/4wUp9PwIrC3Hu9Lg4qB
	RX3W8+bnAvsowprwiYHBheO07DEdVqc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-u2F3mdMcPmuuB9rEQ_gVZg-1; Tue, 22 Apr 2025 09:50:13 -0400
X-MC-Unique: u2F3mdMcPmuuB9rEQ_gVZg-1
X-Mimecast-MFC-AGG-ID: u2F3mdMcPmuuB9rEQ_gVZg_1745329812
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac28a2c7c48so428168466b.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745329812; x=1745934612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGrrkrKKBqlG8Lh7JFZpiU/FR9zy5tYWV0eT1+VwfIQ=;
        b=We4am3tPp3JM/8SuaNZF5QXWD2sXOuqxdZAY/wC1IstzMDvUrxvBHfroyomtMXIVBM
         Mu0JuKz8Ve+1sQGDKN/I2yS/lzPsrKjY6AjcHblJmE6b9QG8gADMjSDDz79rhZB0eAwP
         80fuA1MWd4FWzQZIQ5+EhuLK9hQfc/rdmZe2N0wvUx5ybyXDgGOvpgal4TxUnPB6o+1J
         IPNAuWzDvcRHu4w6q9inv5dwhTdkCykC7hlIF9by8MY9hZMnMJtrfYNEM+zleNjA5YIc
         IRIcrKotHj4ctPw6g761tuSY6mrzYzC0I11DRSKvHjsLuAz4QQ7Abc0zu+prdnnSd/Kh
         ybmg==
X-Forwarded-Encrypted: i=1; AJvYcCVq50mjzsuJiqQhJ3AbBP9q9Hhbo+SUNKYOU5GEfKCKs1S5BQtHBZLWBqOUWHtfGQIYO4vc9ZYqO6Us1o4=@vger.kernel.org
X-Gm-Message-State: AOJu0YypGRUADrob97Mh/rz2t3CZWhbxfSfz+Ew9hZcTtT2nyt4zh7Gk
	FBHmPxrlOZ79VG+/2hhkzOlYTeutHnykfiwgPjbO+FfWqt7E1+W5/7sw1kfh9Vk1f+eX848b8RD
	ebUmEVlyTiGpANx6d2fdPgvZFWgDOUYqUFzB7e7z3F8bxlGmUBiKezdLgWiUUqOv8OaX1Qw==
X-Gm-Gg: ASbGncsBNEWcUw3ZSlLZHYlzYItKFIuCuBgPAwmKcxS+hFPUBYkyFLikX6V6nVxUwcH
	JESBGSvlU8j+RNyGte/4XkT+wRG6WJsssAiNHus1obUfI27FJ06OAOeOqhYj8NumDCjOoiY55BB
	h+oAj5/nHzIm6udmGwW61q1kZ2oJmMTQQi7LVLQ6GJ4WCMeZVzy/jxV3oeT0Jc6zHWf70fOf++s
	UagghNHA47fBfKqgvlheOITpKIEuoKF4w3lNhdDIusJx7dPkka5VgXc/AkaMusZktAzb5RIcU02
	Q1QQRfo0398tRFlO
X-Received: by 2002:a17:907:7da5:b0:acb:4cd7:2963 with SMTP id a640c23a62f3a-acb74b8e55dmr1223055766b.33.1745329811880;
        Tue, 22 Apr 2025 06:50:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQvXSYXhBqNx9LOtFRQbGzKaEda8F/rKCshPfN314qnQj7UlAV89zqf9GyuhprD3N9TfTw0Q==
X-Received: by 2002:a17:907:7da5:b0:acb:4cd7:2963 with SMTP id a640c23a62f3a-acb74b8e55dmr1223052566b.33.1745329811204;
        Tue, 22 Apr 2025 06:50:11 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.218.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb905183a0sm489771366b.110.2025.04.22.06.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 06:50:10 -0700 (PDT)
Date: Tue, 22 Apr 2025 15:50:05 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, michael.christie@oracle.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH v9 4/4] vhost: Add a KConfig knob to enable IOCTL
 VHOST_FORK_FROM_OWNER
Message-ID: <4xh3i7qikqiffxocxms4wfplg4tvemnszvywmtpkfyiqvq3age@jcq3aqvumig2>
References: <20250421024457.112163-1-lulu@redhat.com>
 <20250421024457.112163-5-lulu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250421024457.112163-5-lulu@redhat.com>

On Mon, Apr 21, 2025 at 10:44:10AM +0800, Cindy Lu wrote:
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
>
>diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
>index 020d4fbb947c..bc8fadb06f98 100644
>--- a/drivers/vhost/Kconfig
>+++ b/drivers/vhost/Kconfig
>@@ -96,3 +96,18 @@ config VHOST_CROSS_ENDIAN_LEGACY
> 	  If unsure, say "N".
>
> endif
>+
>+config VHOST_ENABLE_FORK_OWNER_IOCTL
>+	bool "Enable IOCTL VHOST_FORK_FROM_OWNER"
>+	default n
>+	help
>+	  This option enables the IOCTL VHOST_FORK_FROM_OWNER, which allows
>+	  userspace applications to modify the thread mode for vhost devices.
>+
>+          By default, `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL` is set to `n`,
>+          meaning the ioctl is disabled and any operation using this ioctl
>+          will fail.
>+          When the configuration is enabled (y), the ioctl becomes
>+          available, allowing users to set the mode if needed.

I think I already pointed out, but here there is a mix of tabs and 
spaces that IMHO we should fix.

>+
>+	  If unsure, say "N".
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

As I mentioned in the previous version, IMO this patch should be merged 
with the previous patch. I don't think it is good for bisection to have 
a commit with an IOCTL supported in any case and in the next commit 
instead supported only through a config.

Maybe I'm missing something, but what's the point of having a separate 
patch for this?

Thanks,
Stefano

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

