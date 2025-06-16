Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51381DED70
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084680; cv=none; b=tXud/br54ftotqhFxlfHQmBpcb6uxTLD1HLvdzsp5wIGlJwAVG8DWpvuvRDPo/7k0UY1AZuyjlyLEzj72sgL63DZKpg3EC4FFwGrpbvvg6qgQ8yy+GC2qMVWpmHrGPZ8OHxGpL8H7GY7TEZ2x9JBuuJOfOdx7Gygb/5f3OS8rXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084680; c=relaxed/simple;
	bh=+3V6B07QTgyLvlLajJHsodKxoaoAvMotU0ldSwXhncI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJCgh2bKVNe3Jy0an9/7fFm+vUgJOS9HMdlm42ug7NWlYzX+dJEu9xLWO/NMcBHocvmmwkUr7Ir/rP0kTnDVLa1ff2QvXB4ErlcflZPOB9wbGWiMtVzXVu6QWP0evBlQf+UxILNI+26qyL0gBsXYnTor609vQpksg1q12PSuZgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fhm+onhd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fhm+onhd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750084677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5PZUl5rScpx6w7U6u3JWeOhrswycFFkkuG/yAlkmmYU=;
	b=fhm+onhdawWW8ASxHph/LC/ATGJ079K4XNa+PlsafdoiAg8/SiA3Y9LtooGpRnNssqLmd3
	UGDJVbCBwygkkTw4CGpThp38zjpO93Krj32g8RlEC4YFkhlsYWLM7/6+/J226ST2mw7yQB
	+OXLt/Ao08Y2G+2zqjtYCHeTOlG2Z60=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-rhwgZkFXOK-wGcKvaHbMLA-1; Mon, 16 Jun 2025 10:37:56 -0400
X-MC-Unique: rhwgZkFXOK-wGcKvaHbMLA-1
X-Mimecast-MFC-AGG-ID: rhwgZkFXOK-wGcKvaHbMLA_1750084675
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f6ba526eso2769615f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750084675; x=1750689475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PZUl5rScpx6w7U6u3JWeOhrswycFFkkuG/yAlkmmYU=;
        b=H1xbjuBQjWOdvwyUb+eUiV6cZfNwaRBPk5k7jSh5Np4qYi+PuxKGqF59jFkIROAJmC
         cSmn/lLro6qvDExRt14EZgCXFAjV5pZfd5lQdb+sK9WvW9fAMgG7RvuuenwZwEJFbG/z
         pXsQYAY9GMd0OITuAoU7S8uKRMMOD09qC15u+tytKXxIzCvSC7G7w0d23nLMVdJ432VJ
         N7WCW3iBdgIGury5gboFPip7JDfbyJmzfXC9zo8t51Ua8PTBzUuLN6hICxaZYNj/zQZC
         umrSGWACWLzdKVWIRwoNS5MrLIN9mrc+ldL5hrXePgRdNyJ5fKGK5tnHgz6tJIbCJn14
         pRgA==
X-Forwarded-Encrypted: i=1; AJvYcCVUZTXK/OTotN/gsPpw2NzPdsv4gNMR6xnoihcvIhMhzBdN7sfdR05qc6YwWnaXDFdU5PHfR59WDjcwhaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHE5rDKGiParKg1VZAd1kcK9pr+4wrAgQ1AUx1rZVoWdsQgBfJ
	ClShA0enxlbT3JIFgw7FEtZGuCrcD/hyVyVrkgqA/8IE/4KJprswWbp3EIcCgLkShlhDbnnZAYh
	oHUOMOBO4vhskdhMCSYIcUWqQf+Na47VaJ1Eymq+sHswduyZCkgc9JoxVKDTD24jMGA==
X-Gm-Gg: ASbGncuM8qqT11mmUBuQsYbyXZIJKVzLwgysC2jJMVFg7UusdQyk5Cxlzw6MUzUhHmX
	v+jARoktd8jz4FFkAhexwQEZumBuWViuZSZOQ42lGZpLO4kqh+GrWmLlgTKy0/+IPG875+esn+N
	IU80oqjsjM/SVZoQRP+HjqISroOpWEMTqeKp/5qiLOa8uGkGBWDo7R6bJfpLItVo9vxXZeQUypu
	VBXOfyPEtzh8KyS6yPorCGilo7ThsKrkPrMBDoZ2I+EA0DCloGYEgQ0RY/8qPikIP69+1AYwSmK
	7V/QlU55BsXD7mMrnKnlq4xbo28=
X-Received: by 2002:a05:6000:26c3:b0:3a5:2ec5:35a3 with SMTP id ffacd0b85a97d-3a5723af286mr7290028f8f.45.1750084674952;
        Mon, 16 Jun 2025 07:37:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGal1F7mRxYYjQyfGOqBANwAZxzO8A0ZW64lk9iUjS0uj3llkb1LfY2b4pbZLKU1OZDRyo3lQ==
X-Received: by 2002:a05:6000:26c3:b0:3a5:2ec5:35a3 with SMTP id ffacd0b85a97d-3a5723af286mr7290002f8f.45.1750084674388;
        Mon, 16 Jun 2025 07:37:54 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.202.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2449f1sm150540045e9.23.2025.06.16.07.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:37:53 -0700 (PDT)
Date: Mon, 16 Jun 2025 16:37:46 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: davem@davemloft.net, fupan.lfp@antgroup.com, jasowang@redhat.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, mst@redhat.com, 
	netdev@vger.kernel.org, niuxuewei.nxw@antgroup.com, pabeni@redhat.com, 
	stefanha@redhat.com, virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH net-next v2 1/3] vsock: Add support for SIOCINQ ioctl
Message-ID: <2krp5lm4n5nl24hnlp3cx57gqt5sqw6vagtkipviipxf6xdpsd@bspxnwv6hkfd>
References: <xshb6hrotqilacvkemcraz3xdqcdhuxp3co6u3jz3heea3sxfi@eeys5zdpcfxb>
 <20250616142822.1183736-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250616142822.1183736-1-niuxuewei.nxw@antgroup.com>

On Mon, Jun 16, 2025 at 10:28:22PM +0800, Xuewei Niu wrote:
>> On Fri, Jun 13, 2025 at 11:11:50AM +0800, Xuewei Niu wrote:
>> >This patch adds support for SIOCINQ ioctl, which returns the number of
>> >bytes unread in the socket.
>> >
>> >Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
>> >---
>> > include/net/af_vsock.h   |  2 ++
>> > net/vmw_vsock/af_vsock.c | 22 ++++++++++++++++++++++
>> > 2 files changed, 24 insertions(+)
>> >
>> >diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
>> >index d56e6e135158..723a886253ba 100644
>> >--- a/include/net/af_vsock.h
>> >+++ b/include/net/af_vsock.h
>> >@@ -171,6 +171,8 @@ struct vsock_transport {
>> >
>> > 	/* SIOCOUTQ ioctl */
>> > 	ssize_t (*unsent_bytes)(struct vsock_sock *vsk);
>> >+	/* SIOCINQ ioctl */
>> >+	ssize_t (*unread_bytes)(struct vsock_sock *vsk);
>>
>> Instead of adding a new callback, can we just use
>> `vsock_stream_has_data()` ?
>>
>> Maybe adjusting it or changing something in the transports, but for
>> virtio-vsock, it seems to me it does exactly what the new
>> `virtio_transport_unread_bytes()` does, right?
>
>Sorry, I forgot to update this.

Don't worry.

>
>I am curious that is there a plan to implement dgram support in
>virtio-vsock? If yes, adding a new callback is the right way to go. I
>deadly hope to see that feature. If no, will do in the next.

I don't know the status, there were folks working on it, but I didn't 
see updates.

IMO we can deal with it later, since also this patch will not work as it 
is with datagram since you're checking if the socket is "connectible" 
and also a state. And maybe we also need some 
"vsock_datagram_has_data()" anyway, so let's do this when we will have 
the support. For now let's reuse what we have as much as we can.

Thanks.
Stefano

>
>Thanks,
>Xuewei
>
>> Thanks,
>> Stefano
>>
>> >
>> > 	/* Shutdown. */
>> > 	int (*shutdown)(struct vsock_sock *, int);
>> >diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>> >index 2e7a3034e965..466b1ebadbbc 100644
>> >--- a/net/vmw_vsock/af_vsock.c
>> >+++ b/net/vmw_vsock/af_vsock.c
>> >@@ -1389,6 +1389,28 @@ static int vsock_do_ioctl(struct socket *sock, unsigned int cmd,
>> > 	vsk = vsock_sk(sk);
>> >
>> > 	switch (cmd) {
>> >+	case SIOCINQ: {
>> >+		ssize_t n_bytes;
>> >+
>> >+		if (!vsk->transport || !vsk->transport->unread_bytes) {
>> >+			ret = -EOPNOTSUPP;
>> >+			break;
>> >+		}
>> >+
>> >+		if (sock_type_connectible(sk->sk_type) &&
>> >+		    sk->sk_state == TCP_LISTEN) {
>> >+			ret = -EINVAL;
>> >+			break;
>> >+		}
>> >+
>> >+		n_bytes = vsk->transport->unread_bytes(vsk);
>> >+		if (n_bytes < 0) {
>> >+			ret = n_bytes;
>> >+			break;
>> >+		}
>> >+		ret = put_user(n_bytes, arg);
>> >+		break;
>> >+	}
>> > 	case SIOCOUTQ: {
>> > 		ssize_t n_bytes;
>> >
>> >--
>> >2.34.1
>> >
>

