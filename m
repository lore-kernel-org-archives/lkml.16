Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D7022AE76
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 20:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750797456; cv=none; b=aeMXo+YkTBRf3XCv6EOFeWGdFbYUNhTLJ5oMGqqrG5rF/5S42XheJ83AgfkV3ZjV2fHc4MGL7YlqA6n0wpxhAOX+qfhXhzqmaX51P/6vYATFT66PtDwYXRigrPZ7Wy4fp2OTaQQHsJmaykhvVAnJnOR3tUfjeU/pIVu+4K/v4fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750797456; c=relaxed/simple;
	bh=0Xmn1uuMhDiiBO05TyWDJfrX1cm44KxsQolkC8UP5n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sdk29j5S1lwcvHRxA2YgQJYqpYdI/nDFI2cxtLFFqk/0XAtBtIdS4M+cZ54FvAWTxYFeJcqBEJZUkUCH65s13It64HQ5S+1iGR5D3kBP4uSDeMAJVkeIjFy5VAx2T4vl3e+XXczAGOSk2feNzlSSZMkHaUJCFrzGVyJhmcfLDxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OZPDxSLW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OZPDxSLW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750797453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6yxMqBKwP1JxoQEpLOHCxLcmo0QA6v2itUNxKEqsozo=;
	b=OZPDxSLWoLJwPZry3vWA0gEFyxd9IENV45ktIAARuOZAZ3ZisrQaHsPa5jlcOQIVAif7UT
	4bWq8kLmygfcHFAXNi1aa1dvqp8EmgRT79rfhhf0Trfr0vveNyK0VPL4sVfl3iTaHi0Dnz
	ZKGcexauImovXb9fIvKBiHIzkHP46ww=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-Sw5IgCfXNC2F0dLjkC9XcQ-1; Tue, 24 Jun 2025 16:37:32 -0400
X-MC-Unique: Sw5IgCfXNC2F0dLjkC9XcQ-1
X-Mimecast-MFC-AGG-ID: Sw5IgCfXNC2F0dLjkC9XcQ_1750797452
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c7c30d8986so197407285a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750797451; x=1751402251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yxMqBKwP1JxoQEpLOHCxLcmo0QA6v2itUNxKEqsozo=;
        b=S89eej2B5K0qLy3dLlSKFmvTBFWMazMwsvsi+QKg8HehVsppMkS2wEHIGp/sHraOOw
         lorHH3TQhTrhR2Q8eZm5cW4RXD9uaXgxxay/t7s1LWzpOzm0fWHJ/9MzL3jfRKvZ+XW5
         kK1vrpIWlogBb3w9BdCwhbtUCGKT7EuXJeqzK8drLu0lbTlOuj1GUCgFWsD6zyiNClJ0
         eZxwo0w94lAyuk6sy7+vm0EiW3ExIlep5h7LsvPs2P1CUrZWVC47vjlgKOz0IQmiImJr
         6ORLf9Ewh0ikisCSS7J/83BFYNz27OecsnH6tpzQtbb0syurwdwIJtDZAZeq6Y+2QKbg
         cmvA==
X-Forwarded-Encrypted: i=1; AJvYcCUeq0ZXxUUdat+fUvB20PPOsiOqiI0lL6thk9Y93cuVOldpDMLOlkLPsxOu24E3k+FLMwdgDjTqe+LCUvI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh/ERKLuurLgPFey5ULUoT4RsaFDacx0grWiYqTHZn4LOJJcyw
	pEYpZ/OkQAvMkJQ9UIhG5VnKOLM5Ug/7XtKEtWohJGWENhCqhy2sxudntFWVpOtTRaDg4lwv8sr
	M9pYeEDt85nRTiYRxWJXltBeW4mtryGcvzgIgAD07viVEdHAvQyxQzpHCp6EqM0yYKw==
X-Gm-Gg: ASbGncuWbsKv6hBWj01iM+9h8Vd1+y6vjONGmzrn6Zph2/NM3DHUbVOrwjhAITHh2Za
	FSDi0EhVvQkuge4nzhsm7U4PkO0cgDXQYkkSbm6gvd2t+KnsQRYDXFIPWE7vG1c0IZoVTytBuuM
	wuGcbKMHVIO+fB88kyDjSqdPXDnAbAiCqYtqA46HhG4pE9aCleftBU+xOzC2ufvU3H47jBxtvYc
	Vc0cwbJnwidQr6in++pWv/O5aHbM1JPpZAGUAOw4grENfprdG61ZdNjlV67ciEPuyxTqj2mNnut
	UVjo+/wADS8Luw==
X-Received: by 2002:a05:620a:4245:b0:7d4:2868:89ea with SMTP id af79cd13be357-7d4296ca006mr71566585a.4.1750797451567;
        Tue, 24 Jun 2025 13:37:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJhrZbzSf4nFQrc7HvgOH4lF63QunCi8blfM0+NnlfUmmge32P6rWG9OyIu4U5ZJRiNzQrZw==
X-Received: by 2002:a05:620a:4245:b0:7d4:2868:89ea with SMTP id af79cd13be357-7d4296ca006mr71563085a.4.1750797451009;
        Tue, 24 Jun 2025 13:37:31 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd09576766sm60648376d6.81.2025.06.24.13.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 13:37:30 -0700 (PDT)
Date: Tue, 24 Jun 2025 16:37:26 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	kvm@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Zi Yan <ziy@nvidia.com>, Alex Mastro <amastro@fb.com>,
	David Hildenbrand <david@redhat.com>,
	Nico Pache <npache@redhat.com>
Subject: Re: [PATCH 5/5] vfio-pci: Best-effort huge pfnmaps with !MAP_FIXED
 mappings
Message-ID: <aFsMhnejq4fq6L8N@x1.local>
References: <20250616230011.GS1174925@nvidia.com>
 <aFHWbX_LTjcRveVm@x1.local>
 <20250617231807.GD1575786@nvidia.com>
 <aFH76GjnWfeHI5fA@x1.local>
 <aFLvodROFN9QwvPp@x1.local>
 <20250618174641.GB1629589@nvidia.com>
 <aFMQZru7l2aKVsZm@x1.local>
 <20250619135852.GC1643312@nvidia.com>
 <aFQkxg08fs7jwXnJ@x1.local>
 <20250619184041.GA10191@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619184041.GA10191@nvidia.com>

On Thu, Jun 19, 2025 at 03:40:41PM -0300, Jason Gunthorpe wrote:
> Even with this new version you have to decide to return PUD_SIZE or
> bar_size in pci and your same reasoning that PUD_SIZE make sense
> applies (though I would probably return bar_size and just let the core
> code cap it to PUD_SIZE)

Yes.

Today I went back to look at this, I was trying to introduce this for
file_operations:

	int (*get_mapping_order)(struct file *, unsigned long, size_t);

It looks almost good, except that it so far has no way to return the
physical address for further calculation on the alignment.

For THP, VA is always calculated against pgoff not physical address on the
alignment.  I think it's OK for THP, because every 2M THP folio will be
naturally 2M aligned on the physical address, so it fits when e.g. pgoff=0
in the calculation of thp_get_unmapped_area_vmflags().

Logically it should even also work for vfio-pci, as long as VFIO keeps
using the lower 40 bits of the device_fd to represent the bar offset,
meanwhile it'll also require PCIe spec asking the PCI bars to be mapped
aligned with bar sizes.

But from an API POV, get_mapping_order() logically should return something
for further calculation of the alignment to get the VA.  pgoff here may not
always be the right thing to use to align to the VA: after all, pgtable
mapping is about VA -> PA, the only reasonable and reliable way is to align
VA to the PA to be mappped, and as an API we shouldn't assume pgoff is
always aligned to PA address space.

Any thoughts?

-- 
Peter Xu

