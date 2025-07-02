Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02D223BF83
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751450358; cv=none; b=OrojNRy0ig0FZx7Cg1ysdrRLpjpDwzHI+lmk75VpH8sUdxpYuXpN3hHD9GRMIZzXLbnGxIkGiw5pkpHniawbY/2qm+hG5HDP1imZnx8Cb77/Pulw2GXI+OqyjT2qbFJ7Lngz9u15etft813fGLAO4tlg78qUvqFTbyUK0E/8Hd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751450358; c=relaxed/simple;
	bh=MPkoP+32gi4/DVKPXzxo9wfllMKOaCUc8HF+OAy1R00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdJYRKoIH80tm1jVPZpFdMKYctCi2slpXkmbg+uEhglDVjp5I0vlGWnP+IgXOxb8bnDDl8yxU1YcuE7DPiv68lz+VKm41cpTeldtjd0aSxh+Bquh2VAG7i7akIGU40SSjEtJ3MHox+rBmCM8lfEOXv1ORkwJrPXyljnyIFLg23k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S7DnSeox; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S7DnSeox"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751450355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2BELDn7cgIkAWV4mR8DE+PJmYwWVN5UbFvf5JUowPPU=;
	b=S7DnSeoxbf4Hp/ZkvOX3xyQgSZ4ylyerZDmisnHQma4IqxqiifVbZN5zk87Ry9orere1ZS
	lAWvpy3rbyo9cjtBTcLshqMsDWQwNhuSgys0hPHF+0F5oJGD8lP3E88W3oafSGtZW3jckQ
	PBEaGSE0/UB4u5UoaOxE/p+0Sccz2Xo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-R3JDvpimOf-HnqiguiQNSw-1; Wed, 02 Jul 2025 05:59:12 -0400
X-MC-Unique: R3JDvpimOf-HnqiguiQNSw-1
X-Mimecast-MFC-AGG-ID: R3JDvpimOf-HnqiguiQNSw_1751450352
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a6f6d07bb0so96525011cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 02:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751450352; x=1752055152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BELDn7cgIkAWV4mR8DE+PJmYwWVN5UbFvf5JUowPPU=;
        b=dzNW3J6u9SP/To+vpyhch+e8BZSK66EXBLw8s7u/B6mo14lPL86zF2jJpikQ4m7N95
         Mu/zfSg7IMofuaJzJdlxXMN6HhfSYZzuHwEivNuwTgNwrAuDF+TV8w17HrKsPnEKyvhn
         7unQ8KvP2BuTlSVk+IKGCLTzgempers2kjRX1/VEH/4/+lZdC7J/LBqUsUbI77s4GdxQ
         nfKzUNVDMBpUpOZFleS8QhgSb3eD5XDYH1BJFcIfjXYb3GQgMoW+q3LUEEJi/F6ylt4z
         RmuXpCoQxTbZATGhdnhvXBvFMMhwH7IcU4gh7vlXxipcjgLl6cBuUAcSDxtAWGIJH9Ez
         53Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWTqTW0t+Z1hfcuklPlVdxMeTUnlkhl+K4AvEwMfsVl3g6w3KRVF/hiv2UuKm8N2ydKXCsd3RFEmd1LYQU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx99tOuP8VdKPGskrLE1xxDMQAFOonq4JZqqFX832m7Y2jrdra7
	Wpdj00dWi7IcssnV+bN9uUOH80jpqK96aCCXtBA9arWpc8FdpazbTi/kgD/Ttt8YbggEbQ6VB7n
	wHTQidndC6U6zcuaIopEyNHnLx1+99+TJNX42fp3dbFnESChbZ+Iv6Vb+0+iBG7K5sw==
X-Gm-Gg: ASbGncsaXfBpoZGo76T2fgab9ez7KCpjXGQy0f4MhwKftCB0usj3vfQZHU7wJ1QFmvg
	bZLqz5KRrBkbMQYaP6sfVeo8n6EYc47RiAsOG0b+2vObkr94RHNekNKJQAIttUw9tL6NEFIM2e1
	w4FTtK79HbB/WsdY2hXr8+dtnajwJROf6ibXcq4VrogbMzrG/kUzLr9T8eF0vxjEl+OEj2TfDlm
	vf32DFTpCxr52GyOCZF5aVfH8GlvtbQGMgaes7EvNH6PwtQXNebKfDW6C3f7PguNIj6sudg55bE
	ICZKD1FnlqCsj2K/EcJ0pNGeFmXj
X-Received: by 2002:a05:622a:156:b0:48c:a62c:756b with SMTP id d75a77b69052e-4a976970385mr35619851cf.25.1751450351742;
        Wed, 02 Jul 2025 02:59:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUSe8FhbuOGev3Og+XILWaBisyuQK6SRMWeCzQJsy/WSDvlGf3UEpPXNUfSztf5p5of2PIog==
X-Received: by 2002:a05:622a:156:b0:48c:a62c:756b with SMTP id d75a77b69052e-4a976970385mr35619611cf.25.1751450351299;
        Wed, 02 Jul 2025 02:59:11 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.164.126])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc57dbe0sm89177611cf.55.2025.07.02.02.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:59:10 -0700 (PDT)
Date: Wed, 2 Jul 2025 11:58:55 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: mst@redhat.com, pabeni@redhat.com, jasowang@redhat.com, 
	xuanzhuo@linux.alibaba.com, davem@davemloft.net, netdev@vger.kernel.org, stefanha@redhat.com, 
	leonardi@redhat.com, decui@microsoft.com, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, fupan.lfp@antgroup.com, 
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: Re: [RESEND PATCH net-next v4 2/4] hv_sock: Return the readable
 bytes in hvs_stream_has_data()
Message-ID: <mofyjvpvlrh75sfu7c7pi4ea6p5nkatkqqtnwpwne7uuhhl5ms@gaqcs3m6i6kx>
References: <20250630075727.210462-1-niuxuewei.nxw@antgroup.com>
 <20250630075727.210462-3-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250630075727.210462-3-niuxuewei.nxw@antgroup.com>

On Mon, Jun 30, 2025 at 03:57:25PM +0800, Xuewei Niu wrote:

IMO here you should not reset the author to you, but you should keep
Dexuan as authour of this patch.

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
>Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
>---
> net/vmw_vsock/hyperv_transport.c | 16 +++++++++++++---
> 1 file changed, 13 insertions(+), 3 deletions(-)
>
>diff --git a/net/vmw_vsock/hyperv_transport.c b/net/vmw_vsock/hyperv_transport.c
>index 31342ab502b4..64f1290a9ae7 100644
>--- a/net/vmw_vsock/hyperv_transport.c
>+++ b/net/vmw_vsock/hyperv_transport.c
>@@ -694,15 +694,25 @@ static ssize_t hvs_stream_enqueue(struct vsock_sock *vsk, struct msghdr *msg,
> static s64 hvs_stream_has_data(struct vsock_sock *vsk)
> {
> 	struct hvsock *hvs = vsk->trans;
>+	bool need_refill = !hvs->recv_desc;

For v5 remember to fix this as Paolo suggested. Dexuan proposed a fix on 
his thread.

Stefano

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
>-- 
>2.34.1
>

