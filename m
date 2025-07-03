Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49708288C15
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535042; cv=none; b=mv6+6bAP0ZF4qxmNb1lnKJtbs0RxnK+uj+XV0hfO61Pwal+5ROS8ZtkCup4d7XTxbaiqBdsCaQiobxv2z1urLUuAuM6iAxg48hR6mGXhZ77OxXYu3qSVv+nZLeQQapv4pWZb5amulyyDTuzLJy/mfatN1/qFAZZzJn/Gr9u+t7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535042; c=relaxed/simple;
	bh=+9LY65EJRBu4Z+OtHRUlcwV0eyAifNrUhOiPBXIMhGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NMCWR6J1gIcJGYSgt4VXGMduxKlzB3ENpfhA27Pj3K/+AmxWGYjWf8w6vZD9audH/GiUGLrydmFFeJYwW1mpZX1R9xD5Mg89dcmx0VmKmSGhUtJeWsuMVuX1gj3qguUJzdPfLFVE1YRp2dmYLM0gOy3tH/YZ0WRRKtiTrZE7zOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D4BXHVOK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D4BXHVOK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751535040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qRFdLYJ4q7/MAXUEMWlpPtrPV11dB3OuQtvNTnayJQo=;
	b=D4BXHVOKop+JmmO5kOf30mgX08WDZ5D+QWx7xoL49YfF94JFjZZ/36VQ/QoEXV2MoKx0KJ
	YM+SqW1Il/vAZhp1ZjDIUgKTJ3aVlVbpg4NtZ+RMCrbC/FA6feqYBRnag7XqsGON+UMMXi
	uLoAdMbeoT4M0U6sxDAxGZ2jXjkPnXw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-f1nMf-owNy6yc2zwciP8fw-1; Thu, 03 Jul 2025 05:30:38 -0400
X-MC-Unique: f1nMf-owNy6yc2zwciP8fw-1
X-Mimecast-MFC-AGG-ID: f1nMf-owNy6yc2zwciP8fw_1751535038
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4532514dee8so51071125e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 02:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751535037; x=1752139837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRFdLYJ4q7/MAXUEMWlpPtrPV11dB3OuQtvNTnayJQo=;
        b=AmsSNt+aki5G3erznx7fK6L6psRRYTnr1C1Y0KZTsx5M61Z0vSsGKz0trgvGNEk86h
         OuKojP6SfX65FSRT5ZlZQK6dTzMTOE8RLxw8FOvQbf56QTqmKF3MDuBsDJ6z2DfYOocp
         PeLAkYudwtuseMdXb6ptJShUwfvw9Q9bs8yZHwsEQaPjFyXTDX7LRIJD7RMJPN/inzYl
         M6n9YcSzCNQGmMZGgiGNk93TH6m5I3SYNf3lgDaxFu0RgcYUs0sIxeYEqW1u0V72Zr/k
         VugW6rd0KJr4q037j4Ab/KIuiyM5Plj6skq9ev8i2xsnLUSL5MC0NpJaTdlJVdBbR5Up
         pMhg==
X-Forwarded-Encrypted: i=1; AJvYcCU2RyliqW/i09AKkunk88YiQDsS/VT2NSb0atOJmiUGj1qhyluwdCqZcF8umbBwcmww+zS5269l8d8wXOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKRKVNnmuFGVH3pPPGu7wkoBDBHpIXdXj5hrNGGmjvhlpR2Eyr
	JNl1vq3yVdDAnWiEPV/p90JY0pD+yQyS84fjzIURgu5T25wa17Z3npnd4og9Ynrx+o3gJi5LKhk
	BxnFLISYOUD0U0lhDKGl0s1Rtejkt/B43f/tfG66NRjALmoVjs/Jn4PbE68KyflMNLQ==
X-Gm-Gg: ASbGncsabns2Hbm7XFHlSnwhma8Fi0c+ecBY/5/Y+6VvdeHtzq698rSMeDJTaQFVbf8
	GyWrJ2UzeUDLgmfe0ZCZmSGArD3vipPF3D89mbaU9BE9cl2ZrwyU/es9a23LH5FkRJvh8humpBO
	XuOUrDEufIRra8l3huKUP8TlOirShxDwBNdviirUQrHQpowju2nloLTkSTRzuItEGADn1nFoqAz
	LHLp8xMHm6hkdTNdoU+3211cdpO09WFXGJoRGah5o8dp6c94sQzi2dQq99pAw5J+6TcmHe9C3Ny
	oIVGdjnQK/RZNO1V
X-Received: by 2002:a05:6000:1a8f:b0:3b3:a6b2:9cd3 with SMTP id ffacd0b85a97d-3b3a6b29e99mr848223f8f.48.1751535037383;
        Thu, 03 Jul 2025 02:30:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELWFqj9I+aIUDU/5RiZ+sKsYw2mzWKRfT/gfXBnwZnWoC9nFVXzrA0v3mthR9QtuA2m2qUlQ==
X-Received: by 2002:a05:6000:1a8f:b0:3b3:a6b2:9cd3 with SMTP id ffacd0b85a97d-3b3a6b29e99mr848203f8f.48.1751535036898;
        Thu, 03 Jul 2025 02:30:36 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152e:1400:856d:9957:3ec3:1ddc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997e24bsm21380565e9.16.2025.07.03.02.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 02:30:35 -0700 (PDT)
Date: Thu, 3 Jul 2025 05:30:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] virtio: Fixes for TX ring sizing and resize error
 reporting
Message-ID: <20250703052907-mutt-send-email-mst@kernel.org>
References: <20250521092236.661410-1-lvivier@redhat.com>
 <7974cae6-d4d9-41cc-bc71-ffbc9ce6e593@redhat.com>
 <20250528031540-mutt-send-email-mst@kernel.org>
 <770fc206-70e4-4c63-b438-153b57144f23@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <770fc206-70e4-4c63-b438-153b57144f23@redhat.com>

On Thu, Jul 03, 2025 at 09:43:46AM +0200, Laurent Vivier wrote:
> On 28/05/2025 09:20, Michael S. Tsirkin wrote:
> > On Wed, May 28, 2025 at 08:24:32AM +0200, Paolo Abeni wrote:
> > > On 5/21/25 11:22 AM, Laurent Vivier wrote:
> > > > This patch series contains two fixes and a cleanup for the virtio subsystem.
> > > > 
> > > > The first patch fixes an error reporting bug in virtio_ring's
> > > > virtqueue_resize() function. Previously, errors from internal resize
> > > > helpers could be masked if the subsequent re-enabling of the virtqueue
> > > > succeeded. This patch restores the correct error propagation, ensuring that
> > > > callers of virtqueue_resize() are properly informed of underlying resize
> > > > failures.
> > > > 
> > > > The second patch does a cleanup of the use of '2+MAX_SKB_FRAGS'
> > > > 
> > > > The third patch addresses a reliability issue in virtio_net where the TX
> > > > ring size could be configured too small, potentially leading to
> > > > persistently stopped queues and degraded performance. It enforces a
> > > > minimum TX ring size to ensure there's always enough space for at least one
> > > > maximally-fragmented packet plus an additional slot.
> > > 
> > > @Michael: it's not clear to me if you prefer take this series via your
> > > tree or if it should go via net. Please LMK, thanks!
> > > 
> > > Paolo
> > 
> > Given 1/3 is in virtio I was going to take it. Just after rc1,
> > though.
> > 
> 
> Michael, if you don't have time to merge this series, perhaps Paolo can?
> 
> Thanks,
> Laurent


Sorry I forgot I asked that netdev guys don't handle it.

-- 
MST

