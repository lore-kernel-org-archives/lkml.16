Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FE419258E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 02:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743649009; cv=none; b=cMzg/jY5DIB2XmBulbtL1AZm9VK+4J1FpYvrfdyvpEsZQaz97VHdHpalkaDCJNlg9po7ZWylh0i4UtRazvJVVZ/HjlTvsn6uIVIT7cX3edzMM7CR5WwyqtPtfaOrdO+lu7DBFLHvXY3gIZi79a1yNAuZJXkDWhqct1AlJqdYJEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743649009; c=relaxed/simple;
	bh=HVC3hjdgueCUr+hNCsul0JV9pxgZTqkXpUwn2padDU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQ/1EM2ofuf5R5npm3iXfEwubHXMdLKDk2A+PcmtaISSTELKQathNuAdntMsLPvK67KiyoI2FyL41JNX6v8jBYxFTLLvrDe6dWgL2iIqvXvYAA8hqBgNgiRDXTpw3U6KRIFlltGJvxOjIhMsP6GEBdPICn8P0z1vAkGMtmOcnCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DQN+R/zf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DQN+R/zf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743649005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IB+ISU4Wjgqen/35fHtciQhc4tnSvmILc9sQEZbFbPw=;
	b=DQN+R/zfv7wD73atE5lY2k2sLf2Hj8TPW4Q88UE19FbTuHqoLQb0pIUFM4Jre35gN22gHI
	M/OC9tbPTPdRgIMQEVgrDJ1g4ZzBENSwqCawvfAWWUHETlRffNpS3Ct2aYZkm5+E8aXQMt
	hYnNmrt5KK3eeVZ+Yqwrr0Mym8imTF0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-101-hKNG8ImCMBGdb8O0EFN_-w-1; Wed,
 02 Apr 2025 22:56:41 -0400
X-MC-Unique: hKNG8ImCMBGdb8O0EFN_-w-1
X-Mimecast-MFC-AGG-ID: hKNG8ImCMBGdb8O0EFN_-w_1743649000
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B2C4A19560B8;
	Thu,  3 Apr 2025 02:56:39 +0000 (UTC)
Received: from localhost (unknown [10.72.112.12])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E2DC21809B68;
	Thu,  3 Apr 2025 02:56:37 +0000 (UTC)
Date: Thu, 3 Apr 2025 10:56:32 +0800
From: Baoquan He <bhe@redhat.com>
To: Zhiquan Li <zhiquan1.li@intel.com>, k-hagio-ab@nec.com,
	yamazaki-msmt@nec.com, lijiang@redhat.com, ltao@redhat.com
Cc: akpm@linux-foundation.org, vgoyal@redhat.com, dyoung@redhat.com,
	kirill.shutemov@linux.intel.com, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] crash: Export PAGE_UNACCEPTED_MAPCOUNT_VALUE
 to vmcoreinfo
Message-ID: <Z+344FNhxiMonoZb@MiWiFi-R3L-srv>
References: <20250403030801.758687-1-zhiquan1.li@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403030801.758687-1-zhiquan1.li@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Add makedumpfile/Crash utilities maintainers to let them know.

On 04/03/25 at 11:08am, Zhiquan Li wrote:
> On Intel TDX guest, unaccepted memory is unusable free memory which is
> not managed by buddy, until it's accepted by guest.  Before that, it
> cannot be accessed by the first kernel as well as the kexec'ed kernel.
> The kexec'ed kernel will skip these pages and fill in zero data for the
> reader of vmcore.
> 
> The dump tool like makedumpfile creates a page descriptor (size 24
> bytes) for each non-free page, including zero data page, but it will not
> create descriptor for free pages.  If it is not able to distinguish
> these unaccepted pages with zero data pages, a certain amount of space
> will be wasted in proportion (~1/170).  In fact, as a special kind of
> free page the unaccepted pages should be excluded, like the real free
> pages.
> 
> Export the page type PAGE_UNACCEPTED_MAPCOUNT_VALUE to vmcoreinfo, so
> that dump tool can identify whether a page is unaccepted.
> 
> Link: https://lore.kernel.org/all/20240809114854.3745464-5-kirill.shutemov@linux.intel.com/
> 
> Signed-off-by: Zhiquan Li <zhiquan1.li@intel.com>
> Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Looks good to me.

Acked-by: Baoquan He <bhe@redhat.com>

> 
> ---
> Vmcore size statistic of a freshly booted TD VM with different memory
> sizes:
> 
>   VM.mem | Before  After
>   -------+----------------
>   512G   | ~4.9G   ~2.0G
>   256G   | ~2.0G   ~1.1G
> 
> Most of changes are done by makedumpfile, but the prerequisite is kernel
> needs to export an indicator to identify unaccepted pages in vmcoreinfo.
> 
> V2 RESEND note:
> - No changes on this, just rebasd to v6.14.
> 
> V1: https://lore.kernel.org/all/20250103074941.3651765-1-zhiquan1.li@intel.com/
> 
> Changes since V1:
> - Rebase to v6.14-rc5.
> - Added document into admin-guide/kdump/vmcoreinfo.rst per Dave's
>   suggestion.
> - Add Kirill's Reviewed-by tag.
> ---
>  Documentation/admin-guide/kdump/vmcoreinfo.rst | 2 +-
>  kernel/vmcore_info.c                           | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst b/Documentation/admin-guide/kdump/vmcoreinfo.rst
> index 0f714fc945ac..3b47916f1856 100644
> --- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
> +++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
> @@ -331,7 +331,7 @@ PG_lru|PG_private|PG_swapcache|PG_swapbacked|PG_slab|PG_hwpoision|PG_head_mask|P
>  Page attributes. These flags are used to filter various unnecessary for
>  dumping pages.
>  
> -PAGE_BUDDY_MAPCOUNT_VALUE(~PG_buddy)|PAGE_OFFLINE_MAPCOUNT_VALUE(~PG_offline)
> +PAGE_BUDDY_MAPCOUNT_VALUE(~PG_buddy)|PAGE_OFFLINE_MAPCOUNT_VALUE(~PG_offline)|PAGE_OFFLINE_MAPCOUNT_VALUE(~PG_unaccepted)
>  -----------------------------------------------------------------------------
>  
>  More page attributes. These flags are used to filter various unnecessary for
> diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
> index 1fec61603ef3..e066d31d08f8 100644
> --- a/kernel/vmcore_info.c
> +++ b/kernel/vmcore_info.c
> @@ -210,6 +210,10 @@ static int __init crash_save_vmcoreinfo_init(void)
>  	VMCOREINFO_NUMBER(PAGE_HUGETLB_MAPCOUNT_VALUE);
>  #define PAGE_OFFLINE_MAPCOUNT_VALUE	(PGTY_offline << 24)
>  	VMCOREINFO_NUMBER(PAGE_OFFLINE_MAPCOUNT_VALUE);
> +#ifdef CONFIG_UNACCEPTED_MEMORY
> +#define PAGE_UNACCEPTED_MAPCOUNT_VALUE	(PGTY_unaccepted << 24)
> +	VMCOREINFO_NUMBER(PAGE_UNACCEPTED_MAPCOUNT_VALUE);
> +#endif
>  
>  #ifdef CONFIG_KALLSYMS
>  	VMCOREINFO_SYMBOL(kallsyms_names);
> 
> base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
> -- 
> 2.25.1
> 
> 

