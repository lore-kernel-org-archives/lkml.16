Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF26266B41
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747730901; cv=none; b=RWCszqOJ6a2tbgHdOQhd0ln6Mwokq6WXLFvjmhwEeFALUtK7hiXkK/UILI3YKhFmMHUlfYjLZTic9C1pKZY4YOlpEjhrUXB9gGAOxCMnmtwYW0Mp36syt/L58BxC3a7AZmU2b4/vvCjJQt5FTabgZDzllgAW/sUKj2g7VTYiDiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747730901; c=relaxed/simple;
	bh=nr7R7Fg4ot8hKPSC611voSLfEni8RCjYfnpL6ZiLWEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxbNCDHzSZk/XC4Ok6rX+abTS7dNVuPW24IMUOtvx522/VNm0utW5BAG2MVOnnnBDnmVqpj7RwMB7+E8VvlDjQXH3/u19bAWcnSTVxXxmQjsBC6tM0k7gzfCIR5e1ajWScJj4YpGJAR+T3nU1tFgof0pp1trHrkZYceNWggiFtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ad+UN3aS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ad+UN3aS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747730898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9Jdw+1ZYszJBt4wLErRESKCGA4uJXq+gclnU2fYPdK0=;
	b=ad+UN3aSJgGIU+GyTHcqbwSosk9YnsWYOQt3Cjn106Uel9seaN4nOg5Fsx2AYDXBlgCXsX
	ZqLOe/c29Fc/wxXk13/9SGkB3QWICiAKjt7Iazp8KtxPDySiQZZd6qWUbpQUJJrTt7TEe9
	x3vpcTtKfANqK7nLCRDEiOWhAZs3GXU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-fN8bpCzcPm6H_wVWO_DnZQ-1; Tue, 20 May 2025 04:48:17 -0400
X-MC-Unique: fN8bpCzcPm6H_wVWO_DnZQ-1
X-Mimecast-MFC-AGG-ID: fN8bpCzcPm6H_wVWO_DnZQ_1747730896
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ad56437a03eso180041866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 01:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747730896; x=1748335696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Jdw+1ZYszJBt4wLErRESKCGA4uJXq+gclnU2fYPdK0=;
        b=aPfYM+f+6UfIOakvebI6aHuwFA/m9DESscsPMhxUm22I8jtoheJd1kdaQV+PQ/srDN
         ERHA+8lyZ7B9jkaaVIfAsyoCZ+3JOhUpZ7JRWkvKdgZmpbC/5RcboTVEq50HzyKNySau
         3DBkTobSsNvbfYrgXCcbTJEjrJok4WiSgqnY7myve3fzEiSHFVIe7/4fbmnvQWpZoojt
         GfiHH0WJPiFVHl7M3rAHyG/JVaJDYdupinQhlgjZVAr7ke1EN6vHbDeTrv2r38FTePP4
         dNFpw0FziPH1u+IwShbqBBZCscCvCkA+tZtauKns6e/Fqcfd+MVstr/gqilkzJhNkqYk
         BCzw==
X-Forwarded-Encrypted: i=1; AJvYcCVVn0h9nplNXaXP31Lxpv6efg9USEYia0FuUvmuIaH01Sdhze7qBGWsuoHWvbGl12bgn/YeW6ytfHVkj6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCwe5Td4DG6cjA7vAp8f5XVQE1qt2wabLvXLev7kFpBWVsmzmL
	87r6Svva35qOw+byksdoLQVDH07nAMG3j09C3zKknhQICdSDUDcfjJ8BHvZIx6rEw9fT7dcTPUG
	gclYuKvVPPchXmaQ7UNt9D6l+vYMUbNfSLdw+GHeZZIXX8BzcR7kUwyGMnVkoyZwuDQ==
X-Gm-Gg: ASbGncvYFOFkoJTjHYJcrLd9iDXFRkrnTgUv/Iib+5GDzAcT2IIoXJNh3HEnQxEPHX5
	SQi+JwoIcPJI2/iGkC86tIm6CeFqLEadUYkSYg3G7U06QrGWfFQHDdbgawF7nHX3tnmr3vsI0Np
	OrcBqYUxE4sngD9lgzL4zH5A27D5USkkJCgko4ApVunIsU58G/8/QFSt4UsBDa9cc8iBfD5TQLO
	tBRPSheMatV/bNRI59AlpMska3k2/HwjyFkUs2gmTcOPvqL0XxvNhejgzD1+/mpWurCdOj+cgw1
	uF0jrbOtR0Yfzr4BVNvmDtD0o5+/1mH3mDPiDZhpuafl+FjtwaUMA3tOBOEZ
X-Received: by 2002:a17:907:7b97:b0:ad2:50ef:4933 with SMTP id a640c23a62f3a-ad536bca532mr1376485966b.31.1747730895770;
        Tue, 20 May 2025 01:48:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2BHWScPxNpfhTKIVE/UH/c9qw0sXakELnUkTcCcer3v4L/X1iHFZvbAf5Qer6tD/v8Uho5Q==
X-Received: by 2002:a17:907:7b97:b0:ad2:50ef:4933 with SMTP id a640c23a62f3a-ad536bca532mr1376482466b.31.1747730895174;
        Tue, 20 May 2025 01:48:15 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-35.retail.telecomitalia.it. [82.53.134.35])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ac327d5sm6862353a12.63.2025.05.20.01.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 01:48:14 -0700 (PDT)
Date: Tue, 20 May 2025 10:48:10 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: mst@redhat.com, fupan.lfp@antgroup.com, pabeni@redhat.com, 
	jasowang@redhat.com, xuanzhuo@linux.alibaba.com, davem@davemloft.net, 
	stefanha@redhat.com, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: Re: [PATCH 0/3] vsock: Introduce SIOCINQ ioctl support
Message-ID: <27pwterjsrrvgzcdwgkrfkthbqdaqptj6lj75gzfmhuouilexp@jg4t54gsnw2h>
References: <20250519070649.3063874-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250519070649.3063874-1-niuxuewei.nxw@antgroup.com>

On Mon, May 19, 2025 at 03:06:46PM +0800, Xuewei Niu wrote:
>This patchset introduces SIOCINQ ioctl support for vsock, indicating the
>number of unread bytes.

Thanks for this work, but please use net-next tree since this is a new 
feature: 
https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html#netdev

Thanks,
Stefano

>
>Similar to SIOCOUTQ ioctl, the information is transport-dependent. The
>first patch introduces a new callback, unread_bytes, in vsock transport,
>and adds ioctl support in AF_VSOCK.
>
>The second patch implements the SIOCINQ ioctl for all virtio-based transports.
>
>The last one adds two test cases to check the functionality. The changes
>have been tested, and the results are as expected.
>
>Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
>
>Xuewei Niu (3):
>  vsock: Add support for SIOCINQ ioctl
>  vsock/virtio: Add SIOCINQ support for all virtio based transports
>  test/vsock: Add ioctl SIOCINQ tests
>
> drivers/vhost/vsock.c                   |   1 +
> include/linux/virtio_vsock.h            |   2 +
> include/net/af_vsock.h                  |   2 +
> net/vmw_vsock/af_vsock.c                |  22 +++++
> net/vmw_vsock/virtio_transport.c        |   1 +
> net/vmw_vsock/virtio_transport_common.c |  17 ++++
> net/vmw_vsock/vsock_loopback.c          |   1 +
> tools/testing/vsock/vsock_test.c        | 102 ++++++++++++++++++++++++
> 8 files changed, 148 insertions(+)
>
>-- 
>2.34.1
>

