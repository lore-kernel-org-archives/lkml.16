Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2161FAC50
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 12:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743510466; cv=none; b=RDrb74hLPf1XK6wOmmilID8r/iVdGP3uY8AUYADpXjJckZX5LlhHUG02ViQKnC0781HtxT9PVC/dFZlaCYgoqaMWgMN2tx+eD+N0JGkLkopGSLfFTvASXIGfpFp1E74FC8kMF+4wtG+JZKUVyfrZ1agjaqx2BAngMCDfXhynYbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743510466; c=relaxed/simple;
	bh=BClutkQpqyZvckcjwzWJ1OK2iF2XXQt7os9vtNK7sKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ux9sscOSYWGEiX4tGbftte1TNsql7g7uyyyzXpxFNNvHB31X+Fakx1lbdoH0qedNhvB4850sseEKjJJIvw0bXRgqsof5sF9qZ7k0dWZGAbmclD1SGR5Vr4udJQSIplhXhkv3Gds/QtD/SoqpJuQh1vr2ieb1uAm7URFwV1S9I2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RMZCx7oX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RMZCx7oX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743510462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FNoSdGtyM+b9K0jvjiDPZCfEnjTJKg0RDqC1m3p719E=;
	b=RMZCx7oXPL6mzK1uawX4LFnJAxZzjpl2wJqxmUi5RBHgwvnON+kKpHsnf3cx9+2RJXpZzt
	Ubhca//dd+xQ6jf6NfU9AB/xNvCu7doNEJNrZrc6SREu9ommwYTMIIHldUy6iGX15fJsrv
	H5DRH4KO3Dp59ssOHhVkXoG9p4o+qP8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-7fsC1ci8M7yEW9q757w2hg-1; Tue, 01 Apr 2025 08:27:41 -0400
X-MC-Unique: 7fsC1ci8M7yEW9q757w2hg-1
X-Mimecast-MFC-AGG-ID: 7fsC1ci8M7yEW9q757w2hg_1743510460
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-391459c0395so2236708f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 05:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743510460; x=1744115260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNoSdGtyM+b9K0jvjiDPZCfEnjTJKg0RDqC1m3p719E=;
        b=dbRX67p1J05LFJe4tl9WwCavAG+lVuy3HV106RbMr7ydAeodW8D6dCGgRVRmlzfuLE
         ndbJOrg3ANRUCK2DD5jzjkK13wYaCsepLd2g9CjNo3pLpRuXdKc0tZh3mDpcfe+vcPhO
         b7FapXBJGsvGjDBQMMuahVzKuly4czHhMTo8tbjKgDBHp2JIbB3SnPklSau/m5p7Ny61
         sK/JKeu2VlS8AbEs4p6pBkrzUXFNZSPOJQuqnfSJMwKBT9L7ijnELmZpT1xLb7jEkhur
         3iKLF4Im/9A8ZCytZwqpwblYDM2yv4duSg/EesZIdnxiv14/ZxacvjsiZstyOdOFc7Bs
         tsGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmjp0+g0ll6PTsFDUAxiLl8/NcRSPz82MOzFnH/Q0QXy6AK/CRAjAnaCV5xcNw16XLCX7mhVTWEyzu2G8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTqGcW8oAPWwq+Smppumca88jb33VjHJ3Xo+rG4WTzU7LUNv3q
	jBx582Lg5P8kje2cclQ+PQffQ0+aj4uGvx2cHQU8DUfglipYCYO9tDMcVxIbaAM6hjVy7O0ZvD+
	g7dFS92PoSkjH5sq1QQt4eYKRCpVaf8eUN3Dpo8x1n0XLAgwkkK7UjB9Vqc3PFg==
X-Gm-Gg: ASbGnctWv0dfOzsGqN+kgWqS0oXgXwr+Cmg4nHsfYXbg5PO3fcRVguOkFAZY8NfAbIq
	QY9EfFLU7u/axPufcs10fs0u4LwPuq1T2NmId2eGjK2yPSm90nwgWT+c4zhH9rGBna/NRvVbwbw
	YnibtNmRuz95QRbmpPA4w5qjyLJEqmOUniu3MdZ2RaX577YSeLung2lYciFRu5jDypjEM+DIVgY
	7BAyFoyGWAe9D84oaq5qXt6pXq0bCd/O9lj1DV9U0uxRTPZXnlDFK3jiLGC2e+v9j+wvQT9hej+
	I6U8p9pCq9YaL3ei7w==
X-Received: by 2002:a05:6000:18ad:b0:391:2fe3:24ec with SMTP id ffacd0b85a97d-39c120daf7cmr10194185f8f.14.1743510460022;
        Tue, 01 Apr 2025 05:27:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNDLZxIYTRL0m7LzO7a9ysoMH6UHZb/pAKwZvCOmabgUAWbDiDNTPAJI1m2fpOK9WDP9gyTw==
X-Received: by 2002:a05:6000:18ad:b0:391:2fe3:24ec with SMTP id ffacd0b85a97d-39c120daf7cmr10194159f8f.14.1743510459607;
        Tue, 01 Apr 2025 05:27:39 -0700 (PDT)
Received: from leonardi-redhat ([151.29.33.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a41b4sm13805481f8f.85.2025.04.01.05.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 05:27:39 -0700 (PDT)
Date: Tue, 1 Apr 2025 14:27:36 +0200
From: Luigi Leonardi <leonardi@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: netdev@vger.kernel.org, Michal Luczaj <mhal@rbox.co>, 
	Paolo Abeni <pabeni@redhat.com>, George Zhang <georgezhang@vmware.com>, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, Andy King <acking@vmware.com>, 
	Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Dmitry Torokhov <dtor@vmware.com>, 
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net] vsock: avoid timeout during connect() if the socket
 is closing
Message-ID: <jsq3jgl3fks7uv2v37c2o4m7p6u5vhv3ftklccpr2flcyssdwk@75x4zbey7j3i>
References: <20250328141528.420719-1-sgarzare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250328141528.420719-1-sgarzare@redhat.com>

On Fri, Mar 28, 2025 at 03:15:28PM +0100, Stefano Garzarella wrote:
>From: Stefano Garzarella <sgarzare@redhat.com>
>
>When a peer attempts to establish a connection, vsock_connect() contains
>a loop that waits for the state to be TCP_ESTABLISHED. However, the
>other peer can be fast enough to accept the connection and close it
>immediately, thus moving the state to TCP_CLOSING.
>
>When this happens, the peer in the vsock_connect() is properly woken up,
>but since the state is not TCP_ESTABLISHED, it goes back to sleep
>until the timeout expires, returning -ETIMEDOUT.
>
>If the socket state is TCP_CLOSING, waiting for the timeout is pointless.
>vsock_connect() can return immediately without errors or delay since the
>connection actually happened. The socket will be in a closing state,
>but this is not an issue, and subsequent calls will fail as expected.
>
>We discovered this issue while developing a test that accepts and
>immediately closes connections to stress the transport switch between
>two connect() calls, where the first one was interrupted by a signal
>(see Closes link).
>
>Reported-by: Luigi Leonardi <leonardi@redhat.com>
>Closes: https://lore.kernel.org/virtualization/bq6hxrolno2vmtqwcvb5bljfpb7mvwb3kohrvaed6auz5vxrfv@ijmd2f3grobn/
>Fixes: d021c344051a ("VSOCK: Introduce VM Sockets")
>Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>---
> net/vmw_vsock/af_vsock.c | 6 +++++-
> 1 file changed, 5 insertions(+), 1 deletion(-)
>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 7e3db87ae433..fc6afbc8d680 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -1551,7 +1551,11 @@ static int vsock_connect(struct socket *sock, struct sockaddr *addr,
> 	timeout = vsk->connect_timeout;
> 	prepare_to_wait(sk_sleep(sk), &wait, TASK_INTERRUPTIBLE);
>
>-	while (sk->sk_state != TCP_ESTABLISHED && sk->sk_err == 0) {
>+	/* If the socket is already closing or it is in an error state, there
>+	 * is no point in waiting.
>+	 */
>+	while (sk->sk_state != TCP_ESTABLISHED &&
>+	       sk->sk_state != TCP_CLOSING && sk->sk_err == 0) {
> 		if (flags & O_NONBLOCK) {
> 			/* If we're not going to block, we schedule a timeout
> 			 * function to generate a timeout on the connection
>-- 
>2.49.0
>

Just tested and fixes the issue! Thanks Stefano!

Tested-by: Luigi Leonardi <leonardi@redhat.com>
Reviewed-by: Luigi Leonardi <leonardi@redhat.com>

