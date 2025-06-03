Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8777F173
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 00:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748910069; cv=none; b=hCsje+AQj7vANQSiD0e7NzzVTgMKBPCGX0yUiZGV0og9QmGxLJI2wemu94zTV94cykUBfTxXVQ2t6Rjc8KdVrnoediVRrxGhH8N4p3dHGFus7gjfNwou4l7sbEVkGT5T9+OwthJbHnUyQ+6lvvgqolmNvX4N3NbZTxJ4nO/3Jbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748910069; c=relaxed/simple;
	bh=muRKJB45yUSSH1dLq3YwIqoMDKCJaPyJvUJvh9hLCcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4+AUTF5y7DI4eEG3tQdS1JViSBqbm+/xRBGjqKgy2jB+ucuQbvJomS/++LhsSQFz8MakLW5T1erhysQoopY7I3BTI7uVONcCM2cKh06FkD/KtEWLPoBQozQWqiDVZ3U1+vme7Mo/sufKGIDIkYMO+IyqG/YgifOVlt9LAIYnAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fZVWO0JU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fZVWO0JU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748910063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BbZKo31wveM8UXh6qSOa8oaTLTeSDZyTlXL6i9pO/lg=;
	b=fZVWO0JUfrfCFC5pLz5IHPZodjmM/bsGHRtKXdc4fYE+JnpoNuh3VnGiNjur7J1J/CEaRT
	8BB5oCtVFXSYGkbpipBV1eF/uYEEdUkJAfcS/AzNNrRAChNNWREdvxEjgMGJDuRX+Lvyus
	+mMDCM/7YD3VpRMw0moWyZL2Zqsaa0E=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-66-D2zEE1FjM5mUDjRGtKe_Hg-1; Mon,
 02 Jun 2025 20:20:59 -0400
X-MC-Unique: D2zEE1FjM5mUDjRGtKe_Hg-1
X-Mimecast-MFC-AGG-ID: D2zEE1FjM5mUDjRGtKe_Hg_1748910058
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 83FB41956087;
	Tue,  3 Jun 2025 00:20:57 +0000 (UTC)
Received: from localhost (unknown [10.72.112.13])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 884B41956094;
	Tue,  3 Jun 2025 00:20:54 +0000 (UTC)
Date: Tue, 3 Jun 2025 08:20:50 +0800
From: Baoquan He <bhe@redhat.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Yu Zhao <yuzhao@google.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>, Nhat Pham <nphamcs@gmail.com>,
	Barry Song <baohua@kernel.org>, Chris Li <chrisl@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add mm swap section
Message-ID: <aD4/4pAxrhb4bRoI@MiWiFi-R3L-srv>
References: <20250602152015.54366-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602152015.54366-1-lorenzo.stoakes@oracle.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 06/02/25 at 04:20pm, Lorenzo Stoakes wrote:
> In furtherance of ongoing efforts to ensure people are aware of who
> de-facto maintains/has an interest in specific parts of mm, as well trying
> to avoid get_maintainers.pl listing only Andrew and the mailing list for
> mm files - establish a swap memory management section and add relevant
> maintainers/reviewers.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
> REVIEWERS NOTE:
> 
> I have taken a look at recent work on the swap and chosen a list of people
> who seem to be regular and recent contributors/reviewers.
> 
> Please let me know if I missed anybody, or if anybody doesn't wish to be
> added here.
> 
> I also realise we have a bunch of non-swap stuff living in some of these
> files - we will have to address this separately :)
> 
> Thanks!
> 
>  MAINTAINERS | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e66460861bdf..3386272f6bf4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15674,6 +15674,25 @@ S:	Maintained
>  F:	include/linux/secretmem.h
>  F:	mm/secretmem.c
> 
> +MEMORY MANAGEMENT - SWAP
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +R:	Yu Zhao <yuzhao@google.com>
> +R:	Kemeng Shi <shikemeng@huaweicloud.com>
> +R:	Kairui Song <kasong@tencent.com>
> +R:	Nhat Pham <nphamcs@gmail.com>
> +R:	Baoquan He <bhe@redhat.com>
> +R:	Barry Song <baohua@kernel.org>
> +R:	Chris Li <chrisl@kernel.org>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +F:	include/linux/swap.h
> +F:	include/linux/swapfile.h
> +F:	include/linux/swapops.h
> +F:	mm/swap.c
> +F:	mm/swap.h
> +F:	mm/swap_state.c
> +F:	mm/swapfile.c

I am happy to help review swap related codes. Thanks.

Acked-by: Baoquan He <bhe@redhat.com>

And by the way, mm/page_io.c may need be put under swap scope either?

