Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7A625D20D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 08:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188107; cv=none; b=u76qKdkGF35p3ekP+dNncQn1IMoAw+YUjGEhfgrNeVgtdAQ8KLi7+2DlMhDKGgGCO8KlsTVQX3ELNRKYZZk9LR/exXrB2ObcZJ/erHgCLFmZXhMyFWT/gJBMi6fFzsBp4Gy8VW7eT/hLGQQQbLqm24KEBwBorW1+f/5yxgPmynk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188107; c=relaxed/simple;
	bh=lYReHbTMQCeR2BT9nW9VzYq7MnsKRG5ohTeMAY4qWC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RjoPZvngnsXky2EukZ35bQ8Zd+YtHDL3AxqMPdTAGR0j72TDSMEMFrhGqKCpqhyLoLr01TMHA2l5dk8ocYdj1XRzAauFPOu+UKjiDaFRSwTWFsVF9bKGLTjYQeTYypeuJdLsz/8PQAZh0H+4X3Xe3GQns9aK7O9lOogBwZF8JYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=xa3ksB1x; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ngpcSF7b; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=xa3ksB1x; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ngpcSF7b; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="xa3ksB1x";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ngpcSF7b";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="xa3ksB1x";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ngpcSF7b"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B2B9F1F388;
	Wed,  9 Apr 2025 08:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744188097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f6Y8XZ8ioDDRtrzfM8mvcVLgbeSwyDfafUZk4c2B+pY=;
	b=xa3ksB1x4SYDG/IAWiifM7oqcLyoGJDh0HO7KxrQ2FTstrVUGAzTyT8XmAsvJ0+s3AduCk
	oOs8lX+s8HUL82tveGa1PeZIcwbMtd+CwOO+aAcczqFa4R4udAZSl33htydG7Gkaf3b/1L
	I5j+OQE4gO37oAFA170oQpc8Ey7Gvgk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744188097;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f6Y8XZ8ioDDRtrzfM8mvcVLgbeSwyDfafUZk4c2B+pY=;
	b=ngpcSF7bVN28T4hqsNGRwVE8wnRd6bH4KqrYOLPyWngVmXAOURPkJuZZBIJS5a6oJIr08J
	R2MmwnsxaNPQOIAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744188097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f6Y8XZ8ioDDRtrzfM8mvcVLgbeSwyDfafUZk4c2B+pY=;
	b=xa3ksB1x4SYDG/IAWiifM7oqcLyoGJDh0HO7KxrQ2FTstrVUGAzTyT8XmAsvJ0+s3AduCk
	oOs8lX+s8HUL82tveGa1PeZIcwbMtd+CwOO+aAcczqFa4R4udAZSl33htydG7Gkaf3b/1L
	I5j+OQE4gO37oAFA170oQpc8Ey7Gvgk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744188097;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f6Y8XZ8ioDDRtrzfM8mvcVLgbeSwyDfafUZk4c2B+pY=;
	b=ngpcSF7bVN28T4hqsNGRwVE8wnRd6bH4KqrYOLPyWngVmXAOURPkJuZZBIJS5a6oJIr08J
	R2MmwnsxaNPQOIAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A427713691;
	Wed,  9 Apr 2025 08:41:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id g6zBJ8Ey9mffYgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 09 Apr 2025 08:41:37 +0000
Message-ID: <019215ee-12f3-4c2c-8b63-5b7ba1153c30@suse.cz>
Date: Wed, 9 Apr 2025 10:41:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update HUGETLB reviewers
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>, David Hildenbrand
 <david@redhat.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Peter Xu <peterx@redhat.com>, Michal Hocko <mhocko@suse.com>
References: <20250409082452.269180-1-osalvador@suse.de>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250409082452.269180-1-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:mid,suse.de:email]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On 4/9/25 10:24 AM, Oscar Salvador wrote:
> I have done quite some review on hugetlb code over the years, and some
> work on it as well, the latest being the hugetlb pagewalk unification which
> is a work in progress, and touches hugetlb code to great lengths.
> 
> HugeTLB does not have many reviewers, so I would like to help out by
> offering myself as an official Reviewer.

Thanks, Oscar!

> Signed-of-by: Oscar Salvador <osalvador@suse.de>

Acked-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 193d7e216d79..7b32498a42cb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10963,6 +10963,7 @@ F:	include/linux/platform_data/huawei-gaokun-ec.h
>  
>  HUGETLB SUBSYSTEM
>  M:	Muchun Song <muchun.song@linux.dev>
> +R:	Oscar Salvador <osalvador@suse.de>
>  L:	linux-mm@kvack.org
>  S:	Maintained
>  F:	Documentation/ABI/testing/sysfs-kernel-mm-hugepages

