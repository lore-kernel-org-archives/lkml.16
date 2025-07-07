Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E151329B792
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 13:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895646; cv=none; b=EJhHsP1v3fDXVYLMp3ZppUaKwJRBtxCJDcix7+A0EMmDmQSyubyqoa43J/ZOOY7tU8C7vcFp16UcUMtTqn1tYqo4/6ddcBkMmC4MovCGuUIMMMn6BtNEeLEZHrDcIhbYnzt04ka1IlsLZPAb/uAZUkljpz1yDGNG3FCkYpRVyuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895646; c=relaxed/simple;
	bh=ul3tvYiiYuyxmNUs6c6tGf8iXCr1hDf1jpTi6pw0cEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnB7NWkE+yN8kBSH/N86wMSQZZZXJzAMbL3Di9rChAUIVTO4DsGaJkvA8WXT6OjPfhvUal9JH8UYVfKrmnT826+Nkztv0GAGnXVq+R1ndyAoIWAeIZ2MgDJGUkNIKhoD78bXVopDvcngEEHwB2rOPkcd2nffzMU7TGcOiVcIohY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TyOkhIep; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TyOkhIep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751895643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W2KJ06Vv9jNgPK/f5x2D67o6F5iefXJHvVBymbKYkgw=;
	b=TyOkhIepXfcr+KziT/ZMJwROkrJCWuUX5xkVBr9K7ClIQfqY3gnfSdEIGTJawIqeVIrdnn
	Hurin1Wi/d5Ib8xw4TaJeMYKTnB2ST8zyk4dXb56EUQWhVAZgvsmYNHz8BjnnMEmfy3RXO
	BhWqeCez4wmLsLNBQC3c6d2mxoSknas=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-2DBnUcsfOZi0bxHUUB0rbw-1; Mon, 07 Jul 2025 09:40:42 -0400
X-MC-Unique: 2DBnUcsfOZi0bxHUUB0rbw-1
X-Mimecast-MFC-AGG-ID: 2DBnUcsfOZi0bxHUUB0rbw_1751895641
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45311704d22so17869915e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 06:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751895641; x=1752500441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2KJ06Vv9jNgPK/f5x2D67o6F5iefXJHvVBymbKYkgw=;
        b=hJO07vzL6t8KoA0jOHCKxU2TJcO1AGjpYwZCPF7583xoRshb8SFzV5R82PFS1ZGG35
         xbHitNECJqJcgbZtEf6f7miuG4u0EhqfXCu0aQNpxNOrqZtpHw9Nsr31/MiGmRlOi2hU
         WFsfIXG3Fn0CqiwJmOCckuykVw5usIkGWcn0Z0PDIoreLQGnDBXiu9SGWfzqCEfvR+ua
         bYv7Vk7/KwYhH01NGXZ7AUhUprYn6wHDo/RY+SXZ+eSUQvh74iuZX1K8/vU39i0VcEBZ
         MRPWtP+X2MiXQ0+YkzI3xWNFHwVX3r23iFrIUAUzkCgASSKyCyoSMi+HqwT40wyF2t9S
         ctaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvbIicqIjwGvTxlyFu8d88F9gIBgBZaV/IZ660P/rIqVoVF13Ybj+/BpQqyeN+28I40n/9zV132ScZQsI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsuxs/jacRVT4C5vzT/AAD0nU1vTZJqgkqlAjS6SXkuvukAF3P
	VJugkiMYDUlizu1K/aaV0udYR1LZzgIbfJRCz/4p2wZxd24jajS3WmkdEgQRdJzQI6Qw60+IdYf
	9u3TAIbrOAGjBw38PAKt+53q/4Vw0/2FkhmXaFSjduOqgpODmFV9j0AQ01o3zDhcGWA==
X-Gm-Gg: ASbGncuYUFeZcRZ4NMKOcwEkT3lwUs0dRfeOrbAl/DvIIJA5x0QUlWtIKni0LaCMOG4
	eFSmA6HI4G04Kn07LUet/sxrtcxiCnLT/3Px/XE2vCrnWhFsBDl0TYjWiPt/qJ5LbuLHHDSVHB+
	7L3HXJWKh/RtlfPw8ZcJw3psZ+J73P3wawJAyKoCfL/3aPEpq7GqPDbhDX3IXYNWg5bQ9+rZHYZ
	wI3ANMKi4mi4AS8PZkjhEDW7wKaJs+e93V1RYemHzcyjXfFCZCDqwbwtYwEQUoB1QmZEEqpBLZl
	GKyaHW4ZOOSCqZyqZ1sypNR6dMnD
X-Received: by 2002:a05:600c:8214:b0:450:d568:909b with SMTP id 5b1f17b1804b1-454b4e74957mr117204105e9.14.1751895641293;
        Mon, 07 Jul 2025 06:40:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ3sl8II9VgNMv0Hs+oc26TdXSoZydYWxbok3SEgKNUWhqxxpymtncK0H5qwe1x6+STsNFHw==
X-Received: by 2002:a05:600c:8214:b0:450:d568:909b with SMTP id 5b1f17b1804b1-454b4e74957mr117203465e9.14.1751895640329;
        Mon, 07 Jul 2025 06:40:40 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.144.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285c9f9sm10339166f8f.93.2025.07.07.06.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 06:40:39 -0700 (PDT)
Date: Mon, 7 Jul 2025 15:40:31 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xuewei Niu <niuxuewei.nxw@antgroup.com>, fupan.lfp@antgroup.com
Subject: Re: [PATCH net-next v5 1/4] hv_sock: Return the readable bytes in
 hvs_stream_has_data()
Message-ID: <xhzslzuxrhdoixffmzwprn254ctolimj7giuxj4nfrfg23eesy@ycpe6kma5vih>
References: <20250706-siocinq-v5-0-8d0b96a87465@antgroup.com>
 <20250706-siocinq-v5-1-8d0b96a87465@antgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250706-siocinq-v5-1-8d0b96a87465@antgroup.com>

On Sun, Jul 06, 2025 at 12:36:29PM +0800, Xuewei Niu wrote:

Again, this patch should have `From: Dexuan Cui <decui@microsoft.com>` 
on first line, and this is done automatically by `git format-patch` (or 
others tools) if the author is the right one in your branch.
I'm not sure what is going on on your side, but you should avoid to 
reset the original author.
Applying this patch we will have:

     commit ed36075e04ecbb1dd02a3d8eba5bfac6469d73e4
     Author: Xuewei Niu <niuxuewei97@gmail.com>
     Date:   Sun Jul 6 12:36:29 2025 +0800

         hv_sock: Return the readable bytes in hvs_stream_has_data()

This is not what we want, right?

>When hv_sock was originally added, __vsock_stream_recvmsg() and
>vsock_stream_has_data() actually only needed to know whether there
>is any readable data or not, so hvs_stream_has_data() was written to
>return 1 or 0 for simplicity.
>
>However, now hvs_stream_has_data() should return the readable bytes
>because vsock_data_ready() -> vsock_stream_has_data() needs to know the
>actual bytes rather than a boolean value of 1 or 0.
>
>The SIOCINQ ioctl support also needs hvs_stream_has_data() to return
>the readable bytes.
>
>Let hvs_stream_has_data() return the readable bytes of the payload in
>the next host-to-guest VMBus hv_sock packet.
>
>Note: there may be multpile incoming hv_sock packets pending in the
>VMBus channel's ringbuffer, but so far there is not a VMBus API that
>allows us to know all the readable bytes in total without reading and
>caching the payload of the multiple packets, so let's just return the
>readable bytes of the next single packet. In the future, we'll either
>add a VMBus API that allows us to know the total readable bytes without
>touching the data in the ringbuffer, or the hv_sock driver needs to
>understand the VMBus packet format and parse the packets directly.
>
>Signed-off-by: Dexuan Cui <decui@microsoft.com>

Your S-o-b was fine here, I was talking about the author.

Thanks,
Stefano

>---
> net/vmw_vsock/hyperv_transport.c | 17 ++++++++++++++---
> 1 file changed, 14 insertions(+), 3 deletions(-)
>
>diff --git a/net/vmw_vsock/hyperv_transport.c b/net/vmw_vsock/hyperv_transport.c
>index 31342ab502b4fc35feb812d2c94e0e35ded73771..432fcbbd14d4f44bd2550be8376e42ce65122758 100644
>--- a/net/vmw_vsock/hyperv_transport.c
>+++ b/net/vmw_vsock/hyperv_transport.c
>@@ -694,15 +694,26 @@ static ssize_t hvs_stream_enqueue(struct vsock_sock *vsk, struct msghdr *msg,
> static s64 hvs_stream_has_data(struct vsock_sock *vsk)
> {
> 	struct hvsock *hvs = vsk->trans;
>+	bool need_refill;
> 	s64 ret;
>
> 	if (hvs->recv_data_len > 0)
>-		return 1;
>+		return hvs->recv_data_len;
>
> 	switch (hvs_channel_readable_payload(hvs->chan)) {
> 	case 1:
>-		ret = 1;
>-		break;
>+		need_refill = !hvs->recv_desc;
>+		if (!need_refill)
>+			return -EIO;
>+
>+		hvs->recv_desc = hv_pkt_iter_first(hvs->chan);
>+		if (!hvs->recv_desc)
>+			return -ENOBUFS;
>+
>+		ret = hvs_update_recv_data(hvs);
>+		if (ret)
>+			return ret;
>+		return hvs->recv_data_len;
> 	case 0:
> 		vsk->peer_shutdown |= SEND_SHUTDOWN;
> 		ret = 0;
>
>-- 
>2.34.1
>

