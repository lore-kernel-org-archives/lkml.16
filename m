Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAC01F91C7
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084243; cv=none; b=FO/ZcuQhOjBXZUAs/owtHlxsYINBz8taluuSYXe6YsfdXPaqTOFUyis5u2CuWjhh7giq0UtsEF0wVGuJedpYdtZYQ+kRvjb4zeWrZLdHcv9XVdcvV1zejXbfDQuWuCxE9/9sbL+24lHier/ggNzTDZmHQxjrrNe/hmYRdWS9yOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084243; c=relaxed/simple;
	bh=cBkQGq+aQh2WGhSROw87npSAa+GCGQe8VqIRgDN9+3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+2p73NbWua36e9a7JIofR3R4mumC0juC4fY+QCRXo5j0xeg+vBWDGY+3ST07degt+t8c6lL5knDuqbKAUUKItCGmV8cWsgCJIjN1SjnLIasmVBxRn6mMfzux6Bi67pwI3aNvuvUgPy70LAF6y0YscytUIFl1Tig2LJdFtoj+60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F4hfXkHn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F4hfXkHn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750084240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b122cq18cIxKAeDyocwvAGBr6eAjHnsn2f9gGHRU4ls=;
	b=F4hfXkHnVDbTjLCqeAmrIyVFBdh2NOs2lOXBEg4ViYeuys7qTAdos+sJfd34RKO5uJLKVw
	6IiS2YJBigmnjuXUGNFRhYaWRDP1+4pxe9h5K0pCTXKCktbXO/2ur5s5RjKiSEM5OJtoMX
	x7mQaGR1F5mODCEHdYEQiLrlER1IwKU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-GPbyLhFZP4uHpDoo1rID7g-1; Mon, 16 Jun 2025 10:30:38 -0400
X-MC-Unique: GPbyLhFZP4uHpDoo1rID7g-1
X-Mimecast-MFC-AGG-ID: GPbyLhFZP4uHpDoo1rID7g_1750084236
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f6cc5332so2674212f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750084236; x=1750689036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b122cq18cIxKAeDyocwvAGBr6eAjHnsn2f9gGHRU4ls=;
        b=Xms1tNe1v0gb7WmF8uMq6G/zc2CbuUkZ+VR0qatGLk4Q0hZ7bPLvO2RUvas4mVtIYH
         nO7XZ8dw+hGCSus1Sr9cs9wmVeOWd8CEvBY3wQM06vTpm9xmHvHBQcGpQq3dxvYUIPpP
         z6cSH60bXUzk6ronq0iI3wWuMW9/ZuYsg5pF48VbaAwMsqPfuqAmFGz1DQgljnrUE4Nj
         vyoFit1RT45SfD+IOmbX1FRX7KGoI74JslPHMuFEHDh6eEQPUqLx3hWbkFVkWPPruXCK
         RtXG3YNPxtpKzB9PMkb5r0GqyTNNitSyefMV23ORBK3iadwaUkrQFp77DZf49b7zCBue
         tMWw==
X-Forwarded-Encrypted: i=1; AJvYcCXHS1QrLE2dDMjK3Q++EsiBry0Xbin8Kam2yCG6dPtNk2OK4XrnLF4Qug82uCxMSTZAnGuXb8qtymeLT2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIozID1lzhhZ8R1HtVCtXWilPjgOJE6woAZBPMtBGoKMhRczOr
	8i/Hp+kUFCnT31+7W2qV8ZO9Nr2928oB1NpVDfThxzeenazruCG4Fd3Zy/H6pSeKlqJXVHECbha
	/+38yuqUhbLp6UBL3lmkELqsnokU1swBVu6Jpsl2qpFM0SswOFgn+keGdNucUu/Zulw==
X-Gm-Gg: ASbGnctkHg6fkEMY0bbQh2Ev+KaylMwKwQpaVmn9j1aV7Y33+M8dIYOzvQN+rjzYGRr
	iGmFCIh1WfamlKmoPdvTHbwTnD+Mymi4KdWM3JTrGczbio/SmzOHJJ8QkgFqsfgAmxvceSLD7m7
	PaYNNMg7QYqTdFPmFqXXFLzhlIFWrILEWFxAO0vzJ/IFCWtMOy1d17SB8KPmlkdLBZxZTYIGtqF
	NAOx5FhClg6eJnohU5Um4nWutyQ9PEOIes+NTOuLprJwPAF/gYHDnQ0D+il25vFfZ308+lT5ET/
	wsdKzKnW/YbZIz+Us3k6U6CkZM4=
X-Received: by 2002:a05:6000:4211:b0:3a4:dc42:a0ac with SMTP id ffacd0b85a97d-3a572e4b6eemr8077944f8f.49.1750084235911;
        Mon, 16 Jun 2025 07:30:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsnkYIGAr+qs47yOUuIjHINelBcn/kxEeTN9OXZQ0z3+Yj1yvrInii/mr9eol6osEokceKog==
X-Received: by 2002:a05:6000:4211:b0:3a4:dc42:a0ac with SMTP id ffacd0b85a97d-3a572e4b6eemr8077892f8f.49.1750084235405;
        Mon, 16 Jun 2025 07:30:35 -0700 (PDT)
Received: from leonardi-redhat ([176.206.17.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b2371bsm11346666f8f.70.2025.06.16.07.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:30:35 -0700 (PDT)
Date: Mon, 16 Jun 2025 16:30:32 +0200
From: Luigi Leonardi <leonardi@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: sgarzare@redhat.com, mst@redhat.com, pabeni@redhat.com, 
	jasowang@redhat.com, xuanzhuo@linux.alibaba.com, davem@davemloft.net, 
	netdev@vger.kernel.org, stefanha@redhat.com, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, fupan.lfp@antgroup.com, 
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: Re: [PATCH net-next v2 1/3] vsock: Add support for SIOCINQ ioctl
Message-ID: <mrib74zhrw47v4juifp67phnm6tffb7qgfm3xmtcuw5maminlv@4i7z36hg3554>
References: <20250613031152.1076725-1-niuxuewei.nxw@antgroup.com>
 <20250613031152.1076725-2-niuxuewei.nxw@antgroup.com>
 <2bsvomi4vmkfn3w6ej4x3lafueergftigs32gdn7letgroffsf@huncf2veibjy>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <2bsvomi4vmkfn3w6ej4x3lafueergftigs32gdn7letgroffsf@huncf2veibjy>

On Mon, Jun 16, 2025 at 03:42:53PM +0200, Luigi Leonardi wrote:
>On Fri, Jun 13, 2025 at 11:11:50AM +0800, Xuewei Niu wrote:
>>This patch adds support for SIOCINQ ioctl, which returns the number of
>>bytes unread in the socket.
>>
>>Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
>>---
>>include/net/af_vsock.h   |  2 ++
>>net/vmw_vsock/af_vsock.c | 22 ++++++++++++++++++++++
>>2 files changed, 24 insertions(+)
>>
>>diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
>>index d56e6e135158..723a886253ba 100644
>>--- a/include/net/af_vsock.h
>>+++ b/include/net/af_vsock.h
>>@@ -171,6 +171,8 @@ struct vsock_transport {
>>
>>	/* SIOCOUTQ ioctl */
>>	ssize_t (*unsent_bytes)(struct vsock_sock *vsk);
>>+	/* SIOCINQ ioctl */
>>+	ssize_t (*unread_bytes)(struct vsock_sock *vsk);
>>
>>	/* Shutdown. */
>>	int (*shutdown)(struct vsock_sock *, int);
>>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>>index 2e7a3034e965..466b1ebadbbc 100644
>>--- a/net/vmw_vsock/af_vsock.c
>>+++ b/net/vmw_vsock/af_vsock.c
>>@@ -1389,6 +1389,28 @@ static int vsock_do_ioctl(struct socket *sock, unsigned int cmd,
>>	vsk = vsock_sk(sk);
>>
>>	switch (cmd) {
>>+	case SIOCINQ: {
>>+		ssize_t n_bytes;
>>+
>>+		if (!vsk->transport || !vsk->transport->unread_bytes) {
>>+			ret = -EOPNOTSUPP;
>>+			break;
>>+		}
>>+
>>+		if (sock_type_connectible(sk->sk_type) &&
>>+		    sk->sk_state == TCP_LISTEN) {
>>+			ret = -EINVAL;
>>+			break;
>>+		}
>>+
>>+		n_bytes = vsk->transport->unread_bytes(vsk);
>>+		if (n_bytes < 0) {
>>+			ret = n_bytes;
>>+			break;
>>+		}
>>+		ret = put_user(n_bytes, arg);
>>+		break;
>>+	}
>>	case SIOCOUTQ: {
>>		ssize_t n_bytes;
>>
>>-- 
>>2.34.1
>>
>
>Reviewed-by: Luigi Leonardi <leonardi@redhat.com>

Stefano is totally right, reusing `virtio_transport_unread_bytes` is a 
good idea.

nit: commit message should use 'imperative' language [1]. "This patch 
adds" should be avoided.

Sorry for the confusion.

Thanks,
Luigi

[1]https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

