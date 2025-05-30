Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D991A01BF
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573774; cv=none; b=J/hlw1JSTQ5mtAqz8H2rMw6tLZ/fbGWcrtDvXAnMXDNRmyjyseW7zc+3TuJHYQ+02CdEG5i2ZAXlG74c7zknx8N5ZtZfkdANNYLSkDaN/1ekFM8m24tHu7IjTF0JolZeXCyNFcsfbGM9ysm9fnVAXO9QbOzBhY2ibajABKLfbxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573774; c=relaxed/simple;
	bh=hxdTBWmbCq0pcJKIOji7VXJUJ3GCxmi5wkSOCdAVgkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMqwajTWGxkq8IeD93ZsMNbn7hlRDHAD/8OxgMOjA4wFr9VwG7I59iij3dhXVEZpBzFIB4Z2Pr7hkL1V7BUTbobEisDAsoWLsOjnWEd5KRNbEcFkdHcEyx5ghdFgKtgQ71iBDEfBGWl845LTY7IySH3ELmbuJBA5ddc0s0WhNpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BHAXQ/q7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BHAXQ/q7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GwPezpBUIMZVOVHCzCG+3BRCoa4zJY6BARP8ztWbI0Y=;
	b=BHAXQ/q7VJAqrvDlhdY/iTX2TjjySM+wOt7TKxBnnPz73Ud7jFFYBvudzWVxKlALUhwJAP
	3crLlcs5PrvWU1VOwbnTssUJx8Z9rovBg/AHcNfVH2vE5O8VIBIvWX7Cx+5WZ11AXnwFxP
	k3fxVLSvVVFriGiRBngH339Qf+b5UiM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-145-LbYxpKf4PV-2sPw4ycAeqg-1; Thu,
 29 May 2025 22:56:08 -0400
X-MC-Unique: LbYxpKf4PV-2sPw4ycAeqg-1
X-Mimecast-MFC-AGG-ID: LbYxpKf4PV-2sPw4ycAeqg_1748573767
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 51AED1956089;
	Fri, 30 May 2025 02:56:06 +0000 (UTC)
Received: from localhost (unknown [10.72.112.13])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9D8C51955D82;
	Fri, 30 May 2025 02:56:04 +0000 (UTC)
Date: Fri, 30 May 2025 10:56:00 +0800
From: Baoquan He <bhe@redhat.com>
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: akpm@linux-foundation.org, kasong@tencent.com, hannes@cmpxchg.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] mm: swap: fix potensial buffer overflow in
 setup_clusters()
Message-ID: <aDkeQFMjzz0frIg/@MiWiFi-R3L-srv>
References: <20250522122554.12209-1-shikemeng@huaweicloud.com>
 <20250522122554.12209-4-shikemeng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522122554.12209-4-shikemeng@huaweicloud.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 05/22/25 at 08:25pm, Kemeng Shi wrote:
> In setup_swap_map(), we only ensure badpages are in range (0, last_page].
> As maxpages might be < last_page, setup_clusters() will encounter a
> buffer overflow when a badpage is >= maxpages.
> Only call inc_cluster_info_page() for badpage which is < maxpages to
> fix the issue.
> 
> Fixes: b843786b0bd01 ("mm: swapfile: fix SSD detection with swapfile on btrfs")
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
> ---
>  mm/swapfile.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index a82f4ebefca3..63ab9f14b2c6 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -3208,9 +3208,13 @@ static struct swap_cluster_info *setup_clusters(struct swap_info_struct *si,
>  	 * and the EOF part of the last cluster.
>  	 */
>  	inc_cluster_info_page(si, cluster_info, 0);
> -	for (i = 0; i < swap_header->info.nr_badpages; i++)
> -		inc_cluster_info_page(si, cluster_info,
> -				      swap_header->info.badpages[i]);
> +	for (i = 0; i < swap_header->info.nr_badpages; i++) {
> +		unsigned int page_nr = swap_header->info.badpages[i];
> +
> +		if (page_nr >= maxpages)
> +			continue;
> +		inc_cluster_info_page(si, cluster_info, page_nr);
> +	}
>  	for (i = maxpages; i < round_up(maxpages, SWAPFILE_CLUSTER); i++)
>  		inc_cluster_info_page(si, cluster_info, i);
>  
> -- 
> 2.30.0
> 

