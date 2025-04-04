Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2D04438B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 08:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743754175; cv=none; b=vGDbhMLmr+fNzQJLGFns/k1wdF55gt60eOlolTtgg6WWdnHH9F1EVfgtxCoj3GFN6P2AeIWzoRE4ZldbRCa+Atltp2jpmyEdQ8J4iqR2igrgzbAN5rYoIMCwPKjODdd6DIKtwEdRMI5ym1sJ2/Ha0uWS9TJDKoQ6iZLHsV+22rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743754175; c=relaxed/simple;
	bh=yV9gySGcz9nCBmFuK0MGbtvEcssL7765LlB8XkROYxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdf6mOM65v8Dp8f5f241gBxfN9EG6Y5o6ogr2yE4k+0c4qLZxQbn+ufS/yPyl43as3NZCulqOCsHLZm5XTyPj4wLTjo8GSSbchhq6Zl6igBpPCgSIe96K9Av8gR0Nr8qx/iKISAQ4UMXMEK8g4MKflajqu12o/yLW52dwUPdWZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H9mR93ri; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H9mR93ri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743754172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yV9gySGcz9nCBmFuK0MGbtvEcssL7765LlB8XkROYxg=;
	b=H9mR93riNw0DM0nCKlGyYgZbVmWRumdijXF27F01ZMi9HRFvpTA4Bxm7b5RQ+OewKHDTCR
	u3HARrDGCkzI/L0AvKvhsOg5baYoqaIs5G210Srtc5E5jMyQvs9F7AdxCAIVsBNAGI+p/W
	4n6mXTvrb50wgYnrzkEDHMkm+Tx5wAo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-4tIywbVvNb-MfdYZ0v__WA-1; Fri, 04 Apr 2025 04:09:31 -0400
X-MC-Unique: 4tIywbVvNb-MfdYZ0v__WA-1
X-Mimecast-MFC-AGG-ID: 4tIywbVvNb-MfdYZ0v__WA_1743754170
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so9968545e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 01:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743754170; x=1744358970;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yV9gySGcz9nCBmFuK0MGbtvEcssL7765LlB8XkROYxg=;
        b=LY4OZtivvIuxs1rmpPjlAggoVIBXomhpsaFWHjvWc4Xw/drhpS3mUs6IIGXBn5hANA
         x/RdsR6H91xNDbslGPMEjM7cCczdK4plR5nxrtDyKTBOysOgSdJcsQkYQjw/SuOy6j2L
         yR5eSFKoL+haoGZzbIWLxgnUHpejQxGHffBI0X3jgDlYJT3ml9ugVEGS2UBQreWrpA0s
         xZCYfgh3855w161QgW5pdsJ/RD86lmtlH9wwiHquKQSRNPPSnH0MlkhRTQldwSUW65Jr
         WbTAZpG9O+kHtFdEqrLBYgPUKJmvfLALwlrgVxVMSxuN7RPDJ6P/ia0U27OAnfB6FATZ
         3iNg==
X-Forwarded-Encrypted: i=1; AJvYcCUVqi4IWvTTMgIG6mEboe/EnWIUthFVGtuGtLbbiEty/BOKhuivrX3eJhLr3V3K2GYWJ7D/d+Sn07Wsn90=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzlLJWldlbLJBKlihfdA3PFUwR79WBD0lYhUSil+LMdNqUuYDn
	5du3bGGunm5ktEwDqctHlQTV47u1mM+IqdQ9/P8RZZk+WeHP8MTnj24zmh1svrOtxCYQvXaUFVy
	95nNWueh6RT/0a2W13yaLdGAH4VgraBW/2krD34AZ9GuNVkcloA9qtOpWJrf+HA==
X-Gm-Gg: ASbGncvmJSXu8ryRjKJmi3uH+/e1um/Gfuxs3GLXtVrHkRrpc0DcNyyxFcYJShkna5i
	EtKOqtIIiV0xyhUyEz/9kGzZq9UmxUpWTKySjgRRbfiNsr/2A3hy2lqsjF4NNxT1oT0U+gijF+N
	125abRrh5GgMG6hYs7gvv5UqDtdAsst8MvBCf2iRH2Nu3PdEQMY0B5ENct+y6I2aNvvs1KAP7uv
	grB0PnVeanSpaWSoXSwf2fQpzNAlqwOJyHktkFNsm6Nj1rqCuf4VZubUtGtEZoeNlSNsdvbh97W
	I1iSPzPHSg==
X-Received: by 2002:a05:6000:144e:b0:399:7f2b:8531 with SMTP id ffacd0b85a97d-39cba9776d4mr1803213f8f.38.1743754169868;
        Fri, 04 Apr 2025 01:09:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG754OrlwhFHNx9bSdDp3RVe9BAdUN8rbNKS+RMhtY4uj+i5/0n3q6iyPufdrVkEsaxkLy08Q==
X-Received: by 2002:a05:6000:144e:b0:399:7f2b:8531 with SMTP id ffacd0b85a97d-39cba9776d4mr1803184f8f.38.1743754169540;
        Fri, 04 Apr 2025 01:09:29 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c300968cfsm3779154f8f.16.2025.04.04.01.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:09:28 -0700 (PDT)
Date: Fri, 4 Apr 2025 04:09:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>, virtio-comment@lists.linux.dev,
	Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <20250404040838-mutt-send-email-mst@kernel.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <Z-43svGzwoUQaYvg@infradead.org>
 <148a3c8ee53af585b42ec025c2c7821ad852c66c.camel@infradead.org>
 <Z-46TDmspmX0BJ2H@infradead.org>
 <05abb68286dd4bc17b243130d7982a334503095b.camel@infradead.org>
 <Z-99snVF5ESyJDDs@infradead.org>
 <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org>

On Fri, Apr 04, 2025 at 08:50:47AM +0100, David Woodhouse wrote:
> What's annoying is that this should work out of the box *already* with
> virtio-mmio and a `restricted-dma-pool` — for systems which aren't
> afflicted by UEFI/ACPI/PCI as their discovery mechanisms.


That specifically would be just a driver bugfix then?

