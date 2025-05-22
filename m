Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E84D1531E8
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936363; cv=none; b=tY/JhS5492n0NSCoHr0/e8dyleYBR/wG5R6bfvj/lBpf39DbfhCm5elFgdpRMrGIB+31by0+nqd8w7L58TlVhrUU2/qOh/l7FrywjEpYEXJAWgqy70z6DaNTg+RBWnDJGBSlJBWXm6cl99amLK4AHHoYk7pZLz2bj16KnI5PAbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936363; c=relaxed/simple;
	bh=33shT5yeyG4GlN8jGmN8cxW02rgQnzlcfRYf0PWvCkY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CjprgHfJVUKS9rIjplHDaLsp1lv1lAI9vHCd4H6fq0HhL3nvNUC1cacusKaaIGgmhWQUlxpb7AqILauJGvzvqK7xWtk222r60nSuap9NYY5rI8N9g4z9uhVE6y3t4Tt+piQtsFZgMffKK0QIEI7+yGR+YEfDSQjFy9zJ8NlADpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QGzb0cUU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QGzb0cUU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747936358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qCFC7svM4JZpb/vXhsBX/8srNOTogK7PWQN0WLRIUJo=;
	b=QGzb0cUUzaIuIEZrMYl3U1evj/GwYMzLtL03G2DfzhMtjYWJ/QtpK1doC064J+I/Ec+CQe
	J7+w93EyQCs1UCSf0vwfcEBomCRLz/X5fWWBO/lFRxrOlkIGoARq3UehtqZlsHf0ks2Zzb
	l4DuQ+lo2uMUAqV1ub+q8xcNaX5YdDU=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-GqOpK3RIPiuu-3JihGQyTw-1; Thu, 22 May 2025 13:52:36 -0400
X-MC-Unique: GqOpK3RIPiuu-3JihGQyTw-1
X-Mimecast-MFC-AGG-ID: GqOpK3RIPiuu-3JihGQyTw_1747936356
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-8614a8474f6so142250739f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747936355; x=1748541155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCFC7svM4JZpb/vXhsBX/8srNOTogK7PWQN0WLRIUJo=;
        b=LhnyMyhIme5VnnRBkRFX1PcIMAjmnHoIi4CZrlAGFU9zolflNSftwX5LRaEC0PeBKv
         Vk+h5+lSTP5hl/sEJimb2fpKrkUcPwmvkacBhPMmQEhw25pcbVMqA+4HrW0I/eI8JCsE
         wvv0+ndeyqt6Bs8mDEuJBq5DyKVtSd0kbRzTERLbkpCnTk/U7nHqvsasrduwDxaYXn1O
         qDw14EpMmfXwBFDlyOZ5ho+kctYNoq3gpaFnm9A5IzeegroCd7R/cI8KkfgtsRqy8skF
         FgWxWzIxwyfY+SquBVS9gPQYpJGI3Vpo5jq37nMdXY0QgJn/6Ou8ygTwWVt1Iga2iUeN
         RcEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZSVTsgISdSGb7R336BqvkkFJH4FUaAoxXs3z2mcVMToC6o+Ata2rPqnqhBs3eHRW9UsYDemdC3IYr0IM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+QUsoaafvv8OXYJiVSptVVdOdCGAWSCsky8LxBG9zPQ6Y49S3
	Ahtw4eNNe63OvPgmHktjL9RnxNP8riP89+Pp5I029GMJcNN52U18HMtXKhzQ3AA3xDQ0R0F/7+Z
	Z9Nh7EvzFq5MZ40Zek9t/D3elj6p2xe10gXgbP6S9+AKT5NXH3o4R0QqCs6MSYnR+71LPa1eRYg
	==
X-Gm-Gg: ASbGncvuyp0N676bdUUmbFrQGtBBRkHaENjLzZ1zbc5QkCzBt3XSBaAXqq9A0TZsWCb
	cE7TpDNUl7YeIdW4F8MMQHLOvq6O2hFxQKV/JmzYdbL7GKMMHQICllHBMUpVC8RGvaNHWLh/6vJ
	lPZm7iJnUMgffaV6V0A3kYmbFXyye4K06ncZSLMvFyibl7MyMeWgYQb9jSRmEWcuuvjaXF+1UHR
	e/HIyOf4QBy9HwyXsqqQW6EdK79g16MQKmoN4aiVpKrdxZFaxJIItYRLZGsMIwKQX4pToUkIoIY
	g2lnMTw/rysAW0I=
X-Received: by 2002:a05:6e02:4901:b0:3dc:8075:ccc4 with SMTP id e9e14a558f8ab-3dc8085148cmr26949175ab.3.1747936355320;
        Thu, 22 May 2025 10:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXoXfZvws0L1W7xZChiVtBXB0ueiTvpjJifRiy6I6C2ZywtlKUHJyc9rf8zT1q87w+pM5CSw==
X-Received: by 2002:a05:6e02:4901:b0:3dc:8075:ccc4 with SMTP id e9e14a558f8ab-3dc8085148cmr26949045ab.3.1747936354959;
        Thu, 22 May 2025 10:52:34 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc89bfeebfsm7228115ab.68.2025.05.22.10.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:52:33 -0700 (PDT)
Date: Thu, 22 May 2025 11:52:31 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Li,Rongqing" <lirongqing@baidu.com>
Cc: "kwankhede@nvidia.com" <kwankhede@nvidia.com>, "yan.y.zhao@intel.com"
 <yan.y.zhao@intel.com>, "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [????] Re: [PATCH] vfio/type1: fixed rollback in
 vfio_dma_bitmap_alloc_all()
Message-ID: <20250522115231.729dad0c.alex.williamson@redhat.com>
In-Reply-To: <64e1bbd6b7e94aa0b5bc4556d5d335a6@baidu.com>
References: <20250521034647.2877-1-lirongqing@baidu.com>
	<20250521140034.35648fde.alex.williamson@redhat.com>
	<64e1bbd6b7e94aa0b5bc4556d5d335a6@baidu.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 May 2025 01:53:48 +0000
"Li,Rongqing" <lirongqing@baidu.com> wrote:

> >     vfio/type1: Fix error unwind in migration dirty bitmap allocation
> > 
> >     When setting up dirty page tracking at the vfio IOMMU backend for
> >     device migration, if an error is encountered allocating a tracking
> >     bitmap, the unwind loop fails to free previously allocated tracking
> >     bitmaps.  This occurs because the wrong loop index is used to
> >     generate the tracking object.  This results in unintended memory
> >     usage for the life of the current DMA mappings where bitmaps were
> >     successfully allocated.
> > 
> >     Use the correct loop index to derive the tracking object for
> >     freeing during unwind.
> >   
> 
> Your changelog is extremely detailed and highly accurate.
> 
> Please directly incorporate this patch with your changelog

Applied to vfio next branch for v6.16 with updated changelog.  Thanks,

Alex

