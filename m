Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E5B2116E9
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084813; cv=none; b=OAqfzmGunc/EYCtU4VVIva96TFoS7cGjiZxA9MYMrsyczxYSqAxFXB6Vns1QmVvhReu35ZA1zVdPsMUdTzegofu2eiEY1emiFOSSabIHuGJnE5zc3rW5vA+xUAro8OyzbMAMbM/krs0eg98DICDZoDdOu1C/YY5exByuWt5+uZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084813; c=relaxed/simple;
	bh=alzKuO2HUZuN6seuaNV/GeBPt3IdXkXqoEGQP9n+sUg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wiup4qgqGAgLyZqpjxbhCN+fLMyqipQfHOYRm2Jvd6NOLxZtf1s3imeFM8o8yVa006RPxeDDuHSSpNg5gC+Bj/TE/A/kuWSKueASms/PbQ4nojbTtoAzJi9tMUGClbnR0LFjLLBg9oSpO4gm/Dttlv+plAM11AwMXDPLiZDBfq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WSlRTwjA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WSlRTwjA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750084810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Bss5qqcnQ+vggz3TvV/UxUdbe6K9A1vrlez2JEJ/Vs=;
	b=WSlRTwjAhFigyxX/xJB4Zw216UNEt+er+as0eynJ7BZeN4hMJRV/r12PzRwjqrt5nTlvVh
	G/Y8cCTFWZY7CoerV5hFQFXSOUfpJFfdtYHVRL76yi5lpb+unHiflJe7+Gz7U9DeJjaRfu
	jn8cvY+/84S54CUlM6QcsNeyDbHdKRs=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-dF50pg96MvekzffKAgVTVw-1; Mon, 16 Jun 2025 10:40:09 -0400
X-MC-Unique: dF50pg96MvekzffKAgVTVw-1
X-Mimecast-MFC-AGG-ID: dF50pg96MvekzffKAgVTVw_1750084808
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddd689c2b8so5837725ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750084807; x=1750689607;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Bss5qqcnQ+vggz3TvV/UxUdbe6K9A1vrlez2JEJ/Vs=;
        b=qdwMHlK3i38868FeTtt3CQmVlPr5iRrxqQ3P+GnkoXtJOmD/36BPtE/SY4+S21I/FY
         1k3NfIsrWd37Yjd7sbOlYE9tmMD8CdW4pinSBkSf9fvi2k7XX+i8UI2sn4XkzczeQIFY
         mZyzEfZZtuGvM4yuMmL3BioZE91Udq8zO65nltoh2hdYm7H08x0KmKSnvw+hJZRLsrRB
         kgTsHKiZZ9FeqDdCqWf0VKd7M1AinebWthd3d6h8TCsf49anzrwOpla3+E1iYU2V4lW5
         iGWoSEPCSwK7RK3xnxQpSaFLJQG7Yhd4lAns//moaPuBiLXKyKFtaaJPJOE28uur+Az8
         hfxA==
X-Forwarded-Encrypted: i=1; AJvYcCUwulZDT8jepongLWhNpBRzqe9xcgpmogGd8QKu2DlfWsATBJMKa98mqAQQbEBvV2fEAxazAC0a52dYV4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYJblbs7Ew3Knvf54kjZMoAndp2cxq8EP5LJksDrNpM7EaTHva
	mc6Xpn6Zrt9gAEsdqc9xCiAz2ESGKA0Y+L0Eag/4XnQUPLtVJzfqIGLLIHrcCxgYaiX5Iu8A8qp
	H1w0YWU/1sQZEzesLOArTqaWUkVmuGTNBqtbTQ9TmfV68PpwRMt3Vrju3dKuM6yK4tRtrgSn0/A
	==
X-Gm-Gg: ASbGncuqRE0zKRG1YSRN2zJJl45Ld40mRF1eT1rdrPIJLXcafB1bXOl+favO0HENM6e
	ROohbaqONPdNHhBHE/7M8BANKKRyZOfkGaRZkJaWMEDTAyiwlaOGo/y5w6JdpE+EAhnDgImORRe
	4R1F/gXcbdRbSPtxDNGt6/7Z6gDSLlAeW9xY7ybX5ZWstgGB/0bBPzPlJqlxPxiyun7RRn6XQmD
	0Ful2R13gX/qX07bDJZ++gy1I1YIW1EqkvY0b5xcXcDgPSUC614Inm0Cpk/+/QBNGdiWv42odaW
	ZaPaZLcM9w44VcbgjALPabsUXg==
X-Received: by 2002:a05:6e02:2281:b0:3dc:8bd3:3ce7 with SMTP id e9e14a558f8ab-3de07bb709bmr28632795ab.0.1750084806584;
        Mon, 16 Jun 2025 07:40:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt1gC/tTVDA6OKTBkfq8GQVqnf41DPJ6Is0kTyewN3p0cyrsdoZpdhJscEgKPjTA3hTiFNHw==
X-Received: by 2002:a05:6e02:2281:b0:3dc:8bd3:3ce7 with SMTP id e9e14a558f8ab-3de07bb709bmr28632665ab.0.1750084806159;
        Mon, 16 Jun 2025 07:40:06 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de01a4544asm20077625ab.40.2025.06.16.07.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:40:04 -0700 (PDT)
Date: Mon, 16 Jun 2025 08:40:01 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jacob Pan <jacob.pan@linux.microsoft.com>, linux-kernel@vger.kernel.org,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>, "Liu, Yi L"
 <yi.l.liu@intel.com>, Zhang Yu <zhangyu1@microsoft.com>, Easwar Hariharan
 <eahariha@linux.microsoft.com>, Saurabh Sengar
 <ssengar@linux.microsoft.com>
Subject: Re: [PATCH v2 1/2] vfio: Prevent open_count decrement to negative
Message-ID: <20250616084001.20ed53aa.alex.williamson@redhat.com>
In-Reply-To: <20250614000926.GQ1174925@nvidia.com>
References: <20250603152343.1104-1-jacob.pan@linux.microsoft.com>
	<20250613163100.7efa6528.alex.williamson@redhat.com>
	<20250614000926.GQ1174925@nvidia.com>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Jun 2025 21:09:26 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Fri, Jun 13, 2025 at 04:31:00PM -0600, Alex Williamson wrote:
> > Hi Jacob,
> > 
> > On Tue,  3 Jun 2025 08:23:42 -0700
> > Jacob Pan <jacob.pan@linux.microsoft.com> wrote:
> >   
> > > When vfio_df_close() is called with open_count=0, it triggers a warning in
> > > vfio_assert_device_open() but still decrements open_count to -1. This
> > > allows a subsequent open to incorrectly pass the open_count == 0 check,
> > > leading to unintended behavior, such as setting df->access_granted = true.
> > > 
> > > For example, running an IOMMUFD compat no-IOMMU device with VFIO tests
> > > (https://github.com/awilliam/tests/blob/master/vfio-noiommu-pci-device-open.c)
> > > results in a warning and a failed VFIO_GROUP_GET_DEVICE_FD ioctl on the
> > > first run, but the second run succeeds incorrectly.
> > > 
> > > Add checks to avoid decrementing open_count below zero.  
> > 
> > The example above suggests to me that this is a means by which we could
> > see this, but in reality it seems it is the only means by which we can
> > create this scenario, right?  
> 
> I understood this as an assertion hit because of the bug fixed in
> patch 2 and thus the missed assertion error handling flow was noticed.
> 
> Obviously the assertion should never happen, but if it does we should
> try to recover better than we currently do.

Certainly.  My statement is trying to determine the scope of the issue
from a stable perspective.  Maybe I'm interpreting "[f]or example" too
broadly, but I think this is unreachable outside of the specific
described scenario, ie. using iommufd in compatibility mode with
no-iommu.  Further, it only became reachable with 6086efe73498.

In any case, it fixes something and we should attribute that something,
whether it's 6086efe73498 or we want to reach back to when the assert
was introduced and claim it should have had a return even if it was
unreachable.

It seems these patches should also be re-ordered if not rolled into
one.  Fixing the issue in 2/ makes this once again unreachable, so I
don't mind it coming along as a "also handle this error case better."
This alone doesn't really do much.  Thanks,

Alex

