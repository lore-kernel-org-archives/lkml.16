Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8699A224893
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751021518; cv=none; b=UgYLFy8FlAZ8nrvLltkKeL4txKf0VlgGToevSufmcVr5c0iqSzMZ83US3Mrbbi0lecW+UdKOWh+/kGxuWS/UBVjhYXFg+c3f+2+fap43cvybHIQWwxvxk9YtSF8rUieI1quSzFDaKlfVV/1Q68mzDqntLXUGlngBi62Bz+LItzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751021518; c=relaxed/simple;
	bh=8NiJEsAY6H5hPb9ifVbvDlDwq1XB2n1aC1SVumzVDf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZ8ubotSncSZwDekfXgqJWdV1LZQODxkx9zIyhwZlC2y/MrlceW5OBSLKpGzmFj2UgUQFlh8AbG1S3nKxECieJqZ1KWGxxkBHRLWrPz5P5j2FydNsEnxF99rlNo+lt33pBKP1+BeWQ3eKU44bRzqo/KMMhY+sjUlbAqtz4eNDQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bt9nFbfp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bt9nFbfp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751021515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L9N28nJ//bAtYtJKvSA/25sV4gpscCPOFq7vHxaYwng=;
	b=Bt9nFbfpYtZskS5sVeVxxzeJj9b/wOKJadU3h4Vubdg3AOpnOS2r6eHiaDnVr3gE85DR+/
	z/4dpMSh0ZBuhJNuwA07FNwQcOMS2KUA0miccOrLlQE9gAnHE7rvS/nPmkf21JHzPXX7aI
	xlWu26QpcstjiXC8XlIJtPOY7mGjxFY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-NygEStmHPd2i4pTxn5eKyw-1; Fri, 27 Jun 2025 06:51:54 -0400
X-MC-Unique: NygEStmHPd2i4pTxn5eKyw-1
X-Mimecast-MFC-AGG-ID: NygEStmHPd2i4pTxn5eKyw_1751021514
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a58cd9b142so41639911cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751021514; x=1751626314;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L9N28nJ//bAtYtJKvSA/25sV4gpscCPOFq7vHxaYwng=;
        b=ekLidX4sti9hY6Xngz79mbH/W/pWrvkZr/s7TLlGCMLx908S/Qn0IC1jig8TTtnRj+
         YC6oVEZw1Q3LKnh1biOYrMi5KZNrVrfZqn/RVwGdmNHvt4ubdO4FvtlX7/bw2zK8yZ7v
         +BJwC1vdBPhSAdvIcilAOryuBh+Vl+CD+SEFeOaRuEXYWify2qIHmFg8aISAWJrIPcU8
         wCNvIEagp5Vr4Y/8KvFkBM9/WVl7KZlJy8PEmPqtmP4vLLDZq4Df2WjXTrY10E2uxXch
         QEvkEl1wERuQKZdgxrnU8v0IHs1g/YcuaTcw3kJbeCKYSxlzPF0PsYwUVraJcPReEwOP
         c1xQ==
X-Gm-Message-State: AOJu0YzPPbNCp/8+s8tGLnSbNruAd0VHrER+w2kavyAg1JuGC2aOgipK
	1Jv4DI32wPykZIxWd39VZIDM5AvBTyIRhw+D65zNQiJRzFnjRReQ48iwts4w5OL2CrNSHGplKiV
	Di+KrrO4ZfCoFmpGrotQXJF0e6N+wcXq7RZZEhBpcxfSmT7J/rZwM9n0Fd0SDjRIycZzaFBiU7A
	==
X-Gm-Gg: ASbGnctMkN0chu2ScpKM1WzBFmyuiLY2mxQJs7i7z5OBTSlytCP5hNZEiXsd8ly0Za8
	PHZC8Tp7Xo863aKSkH5w3RqY+SVxl7RQrye36dS+5uO0Igz5jLoaXKreL312aXKswVIXRjuhNYd
	50/x12UUPzBSE0uzJNWXmsm2uIsBm3/68Pth6m1eta4Z9fpgoEzC2gk3T/4bqIEwk1hySnayWAh
	iqlpKy10NRj62mc7J01UxT+Yc1jnwwRiFFywfQ/EJoRpppBu+BEvejiT/hHRBF7sIA6loJxJe+8
	xBHJn0/zmwTlcf7HIVgXHOpc8h+x
X-Received: by 2002:ac8:7f4e:0:b0:4a7:30e2:b31e with SMTP id d75a77b69052e-4a7fcac456fmr48138381cf.34.1751021513893;
        Fri, 27 Jun 2025 03:51:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUZBEeQ02fjTo/PBcoZEjlOKuEN1OVgF9WmLAZpvc5pbASKuBu4dcl/skhi8pvedUhQk6Z7w==
X-Received: by 2002:ac8:7f4e:0:b0:4a7:30e2:b31e with SMTP id d75a77b69052e-4a7fcac456fmr48137981cf.34.1751021513420;
        Fri, 27 Jun 2025 03:51:53 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.181.237])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc5ad3c6sm9858681cf.78.2025.06.27.03.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:51:53 -0700 (PDT)
Date: Fri, 27 Jun 2025 12:51:45 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, Keir Fraser <keirf@google.com>, 
	Steven Moreland <smoreland@google.com>, Frederick Mayle <fmayle@google.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	netdev@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH 0/5] vsock/virtio: SKB allocation improvements
Message-ID: <izmrcafyog7cxvef2nipk5f2vzxxptyc4fopnvl3heqslsp7q6@32ssw2piag6h>
References: <20250625131543.5155-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250625131543.5155-1-will@kernel.org>

On Wed, Jun 25, 2025 at 02:15:38PM +0100, Will Deacon wrote:
>Hi folks,
>
>We're using vsock extensively in Android as a channel over which we can
>route binder transactions to/from virtual machines managed by the
>Android Virtualisation Framework. However, we have been observing some
>issues in production builds when using vsock in a low-memory environment
>(on the host and the guest) such as:
>
>  * The host receive path hanging forever, despite the guest performing
>    a successful write to the socket.
>
>  * Page allocation failures in the vhost receive path (this is a likely
>    contributor to the above)
>
>  * -ENOMEM coming back from sendmsg()
>
>This series aims to improve the vsock SKB allocation for both the host
>(vhost) and the guest when using the virtio transport to help mitigate
>these issues. Specifically:
>
>  - Avoid single allocations of order > PAGE_ALLOC_COSTLY_ORDER
>
>  - Use non-linear SKBs for the transmit and vhost receive paths
>
>  - Reduce the guest RX buffers to a single page
>
>There are more details in the individual commit messages but overall
>this results in less wasted memory and puts less pressure on the
>allocator.
>
>This is my first time looking at this stuff, so all feedback is welcome.

Thank you very much for this series!

I left some minor comments, but overall LGTM!

Thanks,
Stefano

>
>Patches based on v6.16-rc3.
>
>Cheers,
>
>Will
>
>Cc: Keir Fraser <keirf@google.com>
>Cc: Steven Moreland <smoreland@google.com>
>Cc: Frederick Mayle <fmayle@google.com>
>Cc: Stefan Hajnoczi <stefanha@redhat.com>
>Cc: Stefano Garzarella <sgarzare@redhat.com>
>Cc: "Michael S. Tsirkin" <mst@redhat.com>
>Cc: Jason Wang <jasowang@redhat.com>
>Cc: "Eugenio Pérez" <eperezma@redhat.com>
>Cc: netdev@vger.kernel.org
>Cc: virtualization@lists.linux.dev
>
>--->8
>
>Will Deacon (5):
>  vhost/vsock: Avoid allocating arbitrarily-sized SKBs
>  vsock/virtio: Resize receive buffers so that each SKB fits in a page
>  vhost/vsock: Allocate nonlinear SKBs for handling large receive
>    buffers
>  vsock/virtio: Rename virtio_vsock_skb_rx_put() to
>    virtio_vsock_skb_put()
>  vhost/vsock: Allocate nonlinear SKBs for handling large transmit
>    buffers
>
> drivers/vhost/vsock.c                   | 21 +++++++++------
> include/linux/virtio_vsock.h            | 36 +++++++++++++++++++------
> net/vmw_vsock/virtio_transport.c        |  2 +-
> net/vmw_vsock/virtio_transport_common.c |  9 +++++--
> 4 files changed, 49 insertions(+), 19 deletions(-)
>
>-- 
>2.50.0.714.g196bf9f422-goog
>
>

