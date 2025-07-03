Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B303B142E73
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751531040; cv=none; b=Y+kDP/mGmTzmqP1TQZefVC7zOPtUQRmdlFHByBNq8eJ8/MxU6+cr1RJqDGG4bfqnJaC6/ZfLRsrnHngB5SahwU7Ee/KHdAiLqjSjHDIzpKwbBFJJm3NrZVqzMy0dcziTO46OMmON7SSSfAZWDk2Jrjcf54sQO09VgP1us7EntmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751531040; c=relaxed/simple;
	bh=o+NkW4UjRCYC3Ox02bP9Grs2dJLcAnd5IKgqdCW1eLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tIqJbXYkROWNNy7zsCwQderCt4otKEjCQXx02yL7NTlqQnG1xlwGimJdip8l17GuH9qdVb2x7ZAUuv4ZKCery8rRAglIJbsXpUOjyNNBeVS2AiteacFD8ktlwnZMUTYXYkgO3PkmaQ/rZ97W7nsKYqt/4yoQRURZnRKkDIWEhSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BBzq4HO3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BBzq4HO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751531037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ke2YfmZqQvuyIhOn4BkIuW587OZjecPx0SDiI46FKLs=;
	b=BBzq4HO3bm4L8uLva9XYnQz9lPYd3fJB7qSfFcg70CN/g/2fBZkR9A1WTjK1BAz7yH/Ajo
	NXlfYP4aMyPBgRkdeGOpuAuE4aN66mQs39RJ2RZrwwFI+PjFEe5jp24Qy70qaTSFY0z51Z
	a60ik0/bwsbYRg9wZFX0mgJ1vCOijxk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-glzomTrfNUC9G_4Yb_OQzQ-1; Thu, 03 Jul 2025 04:23:56 -0400
X-MC-Unique: glzomTrfNUC9G_4Yb_OQzQ-1
X-Mimecast-MFC-AGG-ID: glzomTrfNUC9G_4Yb_OQzQ_1751531035
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a54a8a0122so3879959f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 01:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751531035; x=1752135835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ke2YfmZqQvuyIhOn4BkIuW587OZjecPx0SDiI46FKLs=;
        b=DAdcLECMDLogFnXkrZcauH8jaU61LySV9H4iI2uky07p86q/xFK0YenNNHrngwxtQd
         bz7Zda5OnZqxApCRtWSwt5TyDaujMcJGQLS+9HIzbqMN21AiJlhQjI1ZCpzbv78mEYRZ
         NGc/radPPDyjdrvfZxIe+ZYlkVaSNJLc+CYTKyPb2uiood9vlFqTXDJBDBYk69wInZkr
         +fDB4THxHbwV19mjSLQA/hutbKe9wjvsJAVjDp0L01hy+tknANtJGqprYe99rq42qQN4
         GD7jrNj1AcFEKiJcyohzYrDlNEx5axftGYXe55uCtklgpiO9eCCz01TuI8w55WetEli5
         2WLw==
X-Forwarded-Encrypted: i=1; AJvYcCU/N3om9WoatOjSPBfufVCr0/JYYdsz24dCoKJoHR45nVNQ0c+H3EXShWTeXbI5ArjSk1x++geR3igmoBE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9w4KHaZ7rD4MAZUauDIDAqfG+bq+WdYo80jrhSLcDx7IiBgUB
	qKBOBpFZdTsKt7IJD/HvutheQDN5h2lzZFLSFwixFfbBT88mmsALCREtnNd3NpiXulPP7i3+GLO
	XTn/JkjQmo1YaNwn2LODJzv/+tvB0w4rAjayZXZQEjlZG5v9farFZu8deipK1LrGg7A==
X-Gm-Gg: ASbGnctHlgIckhYiy59iECwZ4Tyhwu/RouV47HXao96w/wxe1smoMO2glRQEjVPZO6I
	LJwIczOvoxOXU+rW5xygD3+0ZCmdnSBL2IoyScZ/z6xyPzmvC9quWmdNO3pMk3DQsepPUTT231A
	JkfKEUy3AT3g0CMYzzbabfScxB5C0GfK4cerPc6sRzuTK3M0GYJc+83+tEReu5xdT/JGC4cSnnD
	4wHqOF3iIZ1o6ro+3p24F3ozl7MsYRFq2bQr2woHMESvHSGNM+S7gQ+9kBxAl1lfBHqcEJPb7bm
	h72zLYi7bu0bT8QbHWrgLgx/3kg=
X-Received: by 2002:a05:6000:18ae:b0:3b3:9c75:c4cf with SMTP id ffacd0b85a97d-3b39c75c60dmr972430f8f.51.1751531034888;
        Thu, 03 Jul 2025 01:23:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCYV82hCMNv406EdS8av4JOq7IBDVQLti9dcL/h1KSI+kswFV5uEQ+Wn0KudAapNB0JCaiDw==
X-Received: by 2002:a05:6000:18ae:b0:3b3:9c75:c4cf with SMTP id ffacd0b85a97d-3b39c75c60dmr972392f8f.51.1751531034265;
        Thu, 03 Jul 2025 01:23:54 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.200.84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f92esm18167611f8f.90.2025.07.03.01.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:23:53 -0700 (PDT)
Date: Thu, 3 Jul 2025 10:23:49 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 3/3] vsock: Fix IOCTL_VM_SOCKETS_GET_LOCAL_CID to
 check also `transport_local`
Message-ID: <34n3no6ip55yftyqtdpww6jzsse4mhnk3pjmd5sfqhpp5nt3my@wiql5wlf3zzp>
References: <20250702-vsock-transports-toctou-v3-0-0a7e2e692987@rbox.co>
 <20250702-vsock-transports-toctou-v3-3-0a7e2e692987@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250702-vsock-transports-toctou-v3-3-0a7e2e692987@rbox.co>

On Wed, Jul 02, 2025 at 03:38:45PM +0200, Michal Luczaj wrote:
>Support returning VMADDR_CID_LOCAL in case no other vsock transport is
>available.
>
>Fixes: 0e12190578d0 ("vsock: add local transport support in the vsock core")
>Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
>Signed-off-by: Michal Luczaj <mhal@rbox.co>
>---
> net/vmw_vsock/af_vsock.c | 2 ++
> 1 file changed, 2 insertions(+)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 9b2af5c63f7c2ae575c160415bd77208a3980835..c8398f9cec5296e07395df8e7ad0f52b8ceb65d5 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -2581,6 +2581,8 @@ static long vsock_dev_do_ioctl(struct file *filp,
> 		cid = vsock_registered_transport_cid(&transport_g2h);
> 		if (cid == VMADDR_CID_ANY)
> 			cid = vsock_registered_transport_cid(&transport_h2g);
>+		if (cid == VMADDR_CID_ANY)
>+			cid = vsock_registered_transport_cid(&transport_local);
>
> 		if (put_user(cid, p) != 0)
> 			retval = -EFAULT;
>
>-- 
>2.49.0
>

