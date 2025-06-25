Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A75285CBC
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841213; cv=none; b=Feuh6/85k0JXJJZGPJAZfRU5Mol50Uiw5HP6w0SzLxVxpC0VrId3QSrrz8T4nHdGPadRmLy5pKi0TIi5biawDJVOofLnHr/CgIpy8c0zN2YB734RQqAh6blqLr1/L5YXDlvFK2DzA/otMXum7Kzne90e2/Fr2+/X3X5kL7KeHBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841213; c=relaxed/simple;
	bh=T892iFCO06qpRgPeQchYWUIxyB8KQBY18W5Fu61V8v0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FiT+oz46PrIUpI5I08a5E/6M8HIOopgpJgqGbIwidyJwmBCCBcKOCxZkMjaPpcaxGYwWJf8UGzSrvMz21AhkqPKzR0CW76xUBn8Hzwyr2zTH+PXsqBeIXL2nSO8/c68xww/DWotELgkpVQf8cAujX3+RVwZNzmDDYJt+3S0ba58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N+kdCcP+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N+kdCcP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750841210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D+42UAAF2j4BWLSQ4E8Q8fXFCTjQBZojHeATS4CdgFc=;
	b=N+kdCcP+NMHusa976MO5PB7DwAS/6Oh+OAVpqw2NQa/grBwy7FBx9JIqnfhkahUOzxZJGl
	4rlUM0yKn3+thNPZrOPNIsFVOEE0J1FtNMUYRjYCwngsKLJCspN7/qWqv1g8pej2KKK+wf
	l7p+LbeiWyw36rSwtcVaZXX9rpa+aYs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-lAk3CdYcOoe3Cl21AS7H7w-1; Wed, 25 Jun 2025 04:46:48 -0400
X-MC-Unique: lAk3CdYcOoe3Cl21AS7H7w-1
X-Mimecast-MFC-AGG-ID: lAk3CdYcOoe3Cl21AS7H7w_1750841207
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451d2037f1eso38571555e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750841207; x=1751446007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+42UAAF2j4BWLSQ4E8Q8fXFCTjQBZojHeATS4CdgFc=;
        b=vXozr2qBT3VPwPxLroxEpb5ajITVZet0zPqyHzHtxuN0zL3xm/J1mzbnRsIEHB/S2R
         UTXTLcLTy6vHFWFJ3iOB66gx83mTda5+iKMHaenhg5JvKyV5lM6XDFOI+sgKMv3lcsNK
         Wh3goIpkpb5xIXie88gjP8XRTSvzvu/WVYjhmktiBa0WPiSlkysJ+tQ0QO5XHDIeUKVn
         ZnX/9RkBio4FYneVGRcEQapsxR4LTl/l0aRtSdbAaSxudrnVm3EsVKE8DOmZ1N8ZsJGu
         KNHqNtr/wl6ubIAFURbvB1lGvQvOPNItdVwattkWhh/3ji5VngZSnGmNTrw+Rsi0Xm+O
         nRCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXxGDBsfprDhmebTdhcqBSV+0x6D0LpTabXl+BxCtSd8c54e2e/YJoLbpE8dpLfGVNu4QnNEgtgLA3v+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEHSIZFOjBfBUas9MY+2VuKpXpywQjqrZo25TtNuu1EoMIbiNn
	vSbQeaKTWWr1ZksSbK2cOHL0e2DCzK+PjUTigbddb9S8g2Be+yYBYIy8hkc0NjTlmH/QeeFONwg
	ERIjnnaF4nDAY5MxBcwUdmXWOi54Pj28vvB6w5NMtYIDVMAUQyBAAI5r1kHHzZ0Tcyw==
X-Gm-Gg: ASbGncvrg5De6N+KEE/nMe4iFwUw/YxpzEBzONm3zGLplaACE9KhCflU2h4T7DIwx59
	8gUSbHDkwrOVq9eHsBf/ohRphjoicgo/9VxLlGK9yekUqcGA73g7xBZngaNjaDyCFW63PQREAfX
	+KYLEXIMSbSoRoH/XkvVqgS7cVvQg4eGoLIHJyls9XmsMBt1apBJhJjfBFHevRxOGlfNqMv+AMc
	7pPlFrWmyyVM5DJGVunYI3hlN7M+i+HhjwBtmoOYFA0eHS4egqb9mvOQJDT5QCNvKjrlUs2UbPx
	z5yFqblwjW4oM3Q73ZWaVSMhYSFU
X-Received: by 2002:a05:600c:1d16:b0:453:8042:ba47 with SMTP id 5b1f17b1804b1-45381b0aa8bmr17319085e9.19.1750841207379;
        Wed, 25 Jun 2025 01:46:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdo3ANalwvdp1sAiXAQf4VC8mWRTnkMA0mUZ6qwOVf3rBLgRagdbcE6BtWV/oNmQJNx6Z7AQ==
X-Received: by 2002:a05:600c:1d16:b0:453:8042:ba47 with SMTP id 5b1f17b1804b1-45381b0aa8bmr17318795e9.19.1750841206778;
        Wed, 25 Jun 2025 01:46:46 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.151.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e811450bsm4062352f8f.97.2025.06.25.01.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 01:46:46 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:46:41 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC net v2 2/3] vsock: Fix transport_* TOCTOU
Message-ID: <lv6nvdc4lrwhipk6ehtivbnsn7ggb7bujky3z6ybhxorlmisgn@qyuo3egnbdu3>
References: <20250620-vsock-transports-toctou-v2-0-02ebd20b1d03@rbox.co>
 <20250620-vsock-transports-toctou-v2-2-02ebd20b1d03@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250620-vsock-transports-toctou-v2-2-02ebd20b1d03@rbox.co>

On Fri, Jun 20, 2025 at 09:52:44PM +0200, Michal Luczaj wrote:
>Transport assignment may race with module unload. Protect new_transport
>from becoming a stale pointer.
>
>This also takes care of an insecure call in vsock_use_local_transport();
>add a lockdep assert.
>
>BUG: unable to handle page fault for address: fffffbfff8056000
>Oops: Oops: 0000 [#1] SMP KASAN
>RIP: 0010:vsock_assign_transport+0x366/0x600
>Call Trace:
> vsock_connect+0x59c/0xc40
> __sys_connect+0xe8/0x100
> __x64_sys_connect+0x6e/0xc0
> do_syscall_64+0x92/0x1c0
> entry_SYSCALL_64_after_hwframe+0x4b/0x53
>
>Fixes: c0cfa2d8a788 ("vsock: add multi-transports support")
>Signed-off-by: Michal Luczaj <mhal@rbox.co>
>---
> net/vmw_vsock/af_vsock.c | 28 +++++++++++++++++++++++-----
> 1 file changed, 23 insertions(+), 5 deletions(-)

LGTM!

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 63a920af5bfe6960306a3e5eeae0cbf30648985e..a1b1073a2c89f865fcdb58b38d8e7feffcf1544f 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -407,6 +407,8 @@ EXPORT_SYMBOL_GPL(vsock_enqueue_accept);
>
> static bool vsock_use_local_transport(unsigned int remote_cid)
> {
>+	lockdep_assert_held(&vsock_register_mutex);
>+
> 	if (!transport_local)
> 		return false;
>
>@@ -464,6 +466,8 @@ int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
>
> 	remote_flags = vsk->remote_addr.svm_flags;
>
>+	mutex_lock(&vsock_register_mutex);
>+
> 	switch (sk->sk_type) {
> 	case SOCK_DGRAM:
> 		new_transport = transport_dgram;
>@@ -479,12 +483,15 @@ int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
> 			new_transport = transport_h2g;
> 		break;
> 	default:
>-		return -ESOCKTNOSUPPORT;
>+		ret = -ESOCKTNOSUPPORT;
>+		goto err;
> 	}
>
> 	if (vsk->transport) {
>-		if (vsk->transport == new_transport)
>-			return 0;
>+		if (vsk->transport == new_transport) {
>+			ret = 0;
>+			goto err;
>+		}
>
> 		/* transport->release() must be called with sock lock acquired.
> 		 * This path can only be taken during vsock_connect(), where we
>@@ -508,8 +515,16 @@ int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
> 	/* We increase the module refcnt to prevent the transport unloading
> 	 * while there are open sockets assigned to it.
> 	 */
>-	if (!new_transport || !try_module_get(new_transport->module))
>-		return -ENODEV;
>+	if (!new_transport || !try_module_get(new_transport->module)) {
>+		ret = -ENODEV;
>+		goto err;
>+	}
>+
>+	/* It's safe to release the mutex after a successful try_module_get().
>+	 * Whichever transport `new_transport` points at, it won't go await
>+	 * until the last module_put() below or in vsock_deassign_transport().
>+	 */
>+	mutex_unlock(&vsock_register_mutex);
>
> 	if (sk->sk_type == SOCK_SEQPACKET) {
> 		if (!new_transport->seqpacket_allow ||
>@@ -528,6 +543,9 @@ int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
> 	vsk->transport = new_transport;
>
> 	return 0;
>+err:
>+	mutex_unlock(&vsock_register_mutex);
>+	return ret;
> }
> EXPORT_SYMBOL_GPL(vsock_assign_transport);
>
>
>-- 
>2.49.0
>

