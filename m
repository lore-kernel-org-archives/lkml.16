Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4524BF4E2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 03:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743564819; cv=none; b=aeinB/G+gNlleYn1jru305v7qLUVBWjwwfLUEoqIAQuFcTAbotaFRbli98KDlAsRos5vTMwMD+0PbusocZn+jHwgrb+bPpf2B2hpvojzk7h39zODNLIGVr3oiIMzaEOfCZ0tWF9Jl4DPw9NCn+E5cJA6H9DjlpZsOSejtHFNhVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743564819; c=relaxed/simple;
	bh=69XJT85EHo+SshqCiuNQaRq+b9jcUKvJKuIOzxGBobc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFKC0X2IW8re04eKPqXFZc2bG++zR72ym5TYwDDbRHCpiF03y2YmAPQsFuPb3Qbqu5jzs2hv8Bnt4DzBBFcmdD+dkq3LX8qmjM+4chxLRGCWJglzwFwS8fa6Fy0BZLlmrvdN3YE6sKJruPVOQaq6g590YDg4abmYJX3I/KNcZOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PxS94lay; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PxS94lay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743564817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u861kM0beM3tosruNcbDstVJoI2djQc7Mj9vRD0bTbI=;
	b=PxS94layFXSoEgZLBu7rQ92omr5gOUyv6/vgsL0TaWYV+5K7udz4FomkK6Pppl0F4ozBd8
	GWJHKfkWYATlAG1sys5oF9JLgGtNK5CQ5g0L2p6N/9O7AxqzTfB8c5EtoCPY/Tyl3OSl7p
	U0Iqc6PerU5K4V7K/CR19MSWbbWFS5E=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-625-XM9mqz6vNEqvQn1Rmu--Bg-1; Tue,
 01 Apr 2025 23:33:34 -0400
X-MC-Unique: XM9mqz6vNEqvQn1Rmu--Bg-1
X-Mimecast-MFC-AGG-ID: XM9mqz6vNEqvQn1Rmu--Bg_1743564813
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AA76319560BC;
	Wed,  2 Apr 2025 03:33:32 +0000 (UTC)
Received: from localhost (unknown [10.72.112.12])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9F89A180B488;
	Wed,  2 Apr 2025 03:33:29 +0000 (UTC)
Date: Wed, 2 Apr 2025 11:33:24 +0800
From: Baoquan He <bhe@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, yanjun.zhu@linux.dev
Subject: Re: [PATCH v2 7/7] mm/pgtable: remove unneeded pgd_devmap()
Message-ID: <Z+ywBPEom1mylJiy@MiWiFi-R3L-srv>
References: <20250331081327.256412-1-bhe@redhat.com>
 <20250331081327.256412-8-bhe@redhat.com>
 <d4f6c677-7944-4b27-a21c-819dccbfcb37@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4f6c677-7944-4b27-a21c-819dccbfcb37@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 04/01/25 at 10:21am, David Hildenbrand wrote:
> On 31.03.25 10:13, Baoquan He wrote:
> > There's no user of pgd_devmap() now, remove it from all ARCH-es
> > and linux/pgtable.h.
> 
> Drop this patch, Alistair will remove all that devmap stuff soon.
> 
> https://lore.kernel.org/linux-mm/42a318bcbb65931958e52ce4b1334f3d012cbd6f.1736488799.git-series.apopple@nvidia.com/

Thanks for telling, will drop it.

> 
> -- 
> Cheers,
> 
> David / dhildenb
> 

