Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D504C339A1
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 07:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746516576; cv=none; b=L4YoZx1RiwXVjf7L4d3lvrDC/VO4IcwGRBI3ghwcL66M7UJvufNkgGKgQYWZDhn96nc8xvjh6K8ETk7KyBWa5dpkDHmrVgQwmeaUGHuzwUbAHo6PgzBsBSsA76+BreWWixz9TrOw0SZeI5AGPpbf/konB9KMuzWqsbEXFl2GVTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746516576; c=relaxed/simple;
	bh=hpftcSQU6FGDHjHNmoGwyCRlc1IEHICer4LHf9Rkwt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJF7r16R/Exhayr/TGya2ZiMuy+eMbp4KcZdMzQPAqW6s59LqDrv9gOG43eYyhIR1d/YhLlVbYwEVgBqbJGvk6fzG0I2nG6nfgQL7P4wa65Yhh32+exAS4nTQ6HusfvEOLyiylmJ6QbhKRlUwJ8FjO8Yafvd/qmc4AgV8P2Hhlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hFaTlkjm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sMW0zZP5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hFaTlkjm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sMW0zZP5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hFaTlkjm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sMW0zZP5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hFaTlkjm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sMW0zZP5"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0FB39211BF;
	Tue,  6 May 2025 07:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746516566; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YWoJIjGVoamhc8sC5DhI99Gtot5xrOK5X2qP7LJujw4=;
	b=hFaTlkjmpBdlvm2/aFPU4jD8RcBsy8P66vrKSotouBAwqphosYZsdAl42SwSXL2tTVMmW/
	3InZJXVCUF8n3buJceW3+PhKid3UpU5UrfJtwJ8dzNRz6KFAQxqZvBDzsy3oZzDHbpxwt/
	7MuD5kroaiXPkM/Wt8MpoOk0QodyiHA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746516566;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YWoJIjGVoamhc8sC5DhI99Gtot5xrOK5X2qP7LJujw4=;
	b=sMW0zZP5ZamwGzCWa5ml5lbfNwbx4uOcCjUQfzWnPAJYlpQQiRg8QsOz4K188IadAezZGl
	5/SrOSbpDk7RzHBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746516566; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YWoJIjGVoamhc8sC5DhI99Gtot5xrOK5X2qP7LJujw4=;
	b=hFaTlkjmpBdlvm2/aFPU4jD8RcBsy8P66vrKSotouBAwqphosYZsdAl42SwSXL2tTVMmW/
	3InZJXVCUF8n3buJceW3+PhKid3UpU5UrfJtwJ8dzNRz6KFAQxqZvBDzsy3oZzDHbpxwt/
	7MuD5kroaiXPkM/Wt8MpoOk0QodyiHA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746516566;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YWoJIjGVoamhc8sC5DhI99Gtot5xrOK5X2qP7LJujw4=;
	b=sMW0zZP5ZamwGzCWa5ml5lbfNwbx4uOcCjUQfzWnPAJYlpQQiRg8QsOz4K188IadAezZGl
	5/SrOSbpDk7RzHBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A53EB137CF;
	Tue,  6 May 2025 07:29:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ExUaJVW6GWjGSAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 06 May 2025 07:29:25 +0000
Date: Tue, 6 May 2025 09:29:08 +0200
From: Oscar Salvador <osalvador@suse.de>
To: kernel test robot <lkp@intel.com>
Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: WARNING: modpost: vmlinux: section mismatch in reference:
 set_high_memory+0x8c (section: .text.unlikely) -> zone_movable_pfn (section:
 .init.data)
Message-ID: <aBm6RKy_AO5iISh1@localhost.localdomain>
References: <202505060901.Qcs06UoB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505060901.Qcs06UoB-lkp@intel.com>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, May 06, 2025 at 09:42:54AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   01f95500a162fca88cefab9ed64ceded5afabc12
> commit: e120d1bc12da5c1bb871c346f741296610fd6fcb arch, mm: set high_memory in free_area_init()
> date:   7 weeks ago
> config: arm-randconfig-r062-20250506 (https://download.01.org/0day-ci/archive/20250506/202505060901.Qcs06UoB-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505060901.Qcs06UoB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505060901.Qcs06UoB-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> WARNING: modpost: vmlinux: section mismatch in reference: set_high_memory+0x8c (section: .text.unlikely) -> zone_movable_pfn (section: .init.data)

Perhaps?

 diff --git a/mm/mm_init.c b/mm/mm_init.c
 index 80a5370ac6ab..5efec0399e18 100644
 --- a/mm/mm_init.c
 +++ b/mm/mm_init.c
 @@ -1785,7 +1785,7 @@ static bool arch_has_descending_max_zone_pfns(void)
  	return IS_ENABLED(CONFIG_ARC) && !IS_ENABLED(CONFIG_ARC_HAS_PAE40);
  }
 
 -static void set_high_memory(void)
 +static void __init set_high_memory(void)
  {
  	phys_addr_t highmem = memblock_end_of_DRAM();


-- 
Oscar Salvador
SUSE Labs
