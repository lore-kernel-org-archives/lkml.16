Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE7B33E1
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 04:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738383746; cv=none; b=om18AGVdZEDX4W6MVSSJt71kKMinAT5IjRDAsbDElN1dBdXHysWAc/k+cUvew/QxMqIpND+o/5tz9u9GH9OWW0RWfCiEObvOQCqUwYk6y3IPPFJHQQEMDfWr7Z4AtI9OyXHBnynFY8BHgr2kfhFqJzlNqBpMY5DsQkkBbBZVoSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738383746; c=relaxed/simple;
	bh=0U6kErVD3CsF3cDAvOMJBzt7OPWTBVFCuCSTvsw/zn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOkGxN8lVgXqBKTlMul16sY1pbZYamySRq0U6aV6cFzjaQrbR35jNTzCaVzLPxCztUliM5YiNbkKpJ1XMg33OA29IksCN4/mjc0pklR6/K7K4PhcUNIY0XPHb4Selc8v5YcC669xAsNSaOhEOLQs6DAt/3HAve80McAzR932w1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ec5gJmGe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ec5gJmGe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738383742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Ig6TH7qnMW9vqfBPnMTJLnOHwh56eOqpsqPuSlb7kQ=;
	b=ec5gJmGe4ZwCjeD3eGm/m0dxRp1Sa7aKTIke5LOMy94AHaYCvkjQZ3yB3WzMRFZVl74KEa
	6efw2z/jIKWo6I8PBe8fuGUvLlr1VjO4I3MSgjdhu92on2xjdSKRvdYzPetE6t7mXq85GX
	4i24eeZy9KSmMiptsfFmTtb6tpytCy0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-322-zf_HO1DfMT-xwtjDhBfBdQ-1; Fri,
 31 Jan 2025 23:22:19 -0500
X-MC-Unique: zf_HO1DfMT-xwtjDhBfBdQ-1
X-Mimecast-MFC-AGG-ID: zf_HO1DfMT-xwtjDhBfBdQ
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2F38A180036E;
	Sat,  1 Feb 2025 04:22:17 +0000 (UTC)
Received: from localhost (unknown [10.72.112.37])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EA93D180035E;
	Sat,  1 Feb 2025 04:22:14 +0000 (UTC)
Date: Sat, 1 Feb 2025 12:22:09 +0800
From: Baoquan he <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mahesh Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] crash: Let arch decide usable memory range in
 reserved area
Message-ID: <Z52hUz5/nZhzTUb4@fedora>
References: <20250131113830.925179-1-sourabhjain@linux.ibm.com>
 <20250131113830.925179-4-sourabhjain@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131113830.925179-4-sourabhjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 01/31/25 at 05:08pm, Sourabh Jain wrote:
> Although the crashkernel area is reserved, on architectures like
> PowerPC, it is possible for the crashkernel reserved area to contain
> components like RTAS, TCE, OPAL, etc. To avoid placing kexec segments
> over these components, PowerPC has its own set of APIs to locate holes
> in the crashkernel reserved area.
> 
> Add an arch hook in the generic locate mem hole APIs so that
> architectures can handle such special regions in the crashkernel area
> while locating memory holes for kexec segments using generic APIs.
> With this, a lot of redundant arch-specific code can be removed, as it
> performs the exact same job as the generic APIs.
> 
> To keep the generic and arch-specific changes separate, the changes
> related to moving PowerPC to use the generic APIs and the removal of
> PowerPC-specific APIs for memory hole allocation are done in a
> subsequent patch titled "powerpc/crash: Use generic APIs to locate
> memory hole for kdump.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: kexec@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  include/linux/kexec.h |  9 +++++++++
>  kernel/kexec_file.c   | 12 ++++++++++++
>  2 files changed, 21 insertions(+)

LGTM,

Acked-by: Baoquan He <bhe@redhat.com>

