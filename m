Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC02C135A53
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 12:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749729945; cv=none; b=O4xRWw3+wBEhr+XYWmFFLl6w5GKlez752V/OwacRVDGiuE+kjIlzSlC8dB1XjnpWDqhQmUUneTGrfXzwHI5WHpd6u/L591Ho3ebZJCb6yDKwBh+atbY8VQM9hA5E1miC65PSbkelSUUjQGELleOiXW0MDdiOaS4OfD4sk/YBg+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749729945; c=relaxed/simple;
	bh=3XwIwpV6tYjmjrm0psqIHI0tLjehrZkVaZvTgTW8u1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clljNi3uhKJUA8LOh1/cGcs/Vq5qj40TpMRayh/A3QepmXap9QcWrG1jzrDjP7gMZ4TokyQHHW0qUhDStqrF0PXaUpFXzClcso/rwdp6cyM7oB0E76vNxd8TjtStBSshsyE+DK2AbAIfqoc236wshZhSVOTGDkWKfYh0q/tKSw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Mjh5HWXs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H2GoFZjG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nUiV40WC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wXIKjIoo; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Mjh5HWXs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H2GoFZjG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nUiV40WC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wXIKjIoo"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7ECFC1F78E;
	Thu, 12 Jun 2025 12:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749729938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kXfiFH3R42SMESoKM9W7CezKKHx0W9fw4fisaAIaSZg=;
	b=Mjh5HWXsL75T6ao0zhTTRBAhURQxP15aholSim1eOdC+YyoMS4kbJzqvfVCioF4bY7e93W
	6F/7gPaxo9MBV2SYTQVCUJbSepP/49hBD1+glJUrcH0m3viFYNFcFswPK01pTuTfsHPSYd
	DrpThngTjRBXqfhcIJsqZ5vKObDiUFA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749729938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kXfiFH3R42SMESoKM9W7CezKKHx0W9fw4fisaAIaSZg=;
	b=H2GoFZjGEs0rKF38m+Qg5I1uJ2emyk39+xSAFXCFg0rsShdVgrpJbitv/qwxCE6d8jgWiC
	sU/OpttOqTq1J4Dw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nUiV40WC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wXIKjIoo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749729936; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kXfiFH3R42SMESoKM9W7CezKKHx0W9fw4fisaAIaSZg=;
	b=nUiV40WCix7Jf4u4SJyWo9DvzR1LI56a3nnl48tCdCvGyZpOCWVfZ6LQQUbZFGj8zMYoy3
	ApynaScFyrM/DOJxqxl/QddqKK2KvqPjG9LnYEy/A8MM/6KqmP8VMIj4BFNEORfW38BkrV
	X2DCHpln2YHXoEJvc6BkbMIx6U0b9j0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749729936;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kXfiFH3R42SMESoKM9W7CezKKHx0W9fw4fisaAIaSZg=;
	b=wXIKjIooyPWJRTe5Dcjf7Wf2RUo+f3ZEJi5p4AQm4YWhn3i4dvZnRvMDWNAFy9ceq9cEkG
	YKTs8apy+vZar8AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2770D132D8;
	Thu, 12 Jun 2025 12:05:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iusPBo/CSmgUcAAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Thu, 12 Jun 2025 12:05:35 +0000
Date: Thu, 12 Jun 2025 13:05:29 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com, ryan.roberts@arm.com, 
	mingo@kernel.org, libang.li@antgroup.com, maobibo@loongson.cn, 
	zhengqi.arch@bytedance.com, baohua@kernel.org, anshuman.khandual@arm.com, 
	willy@infradead.org, ioworker0@gmail.com, yang@os.amperecomputing.com, 
	baolin.wang@linux.alibaba.com, ziy@nvidia.com, hughd@google.com
Subject: Re: [PATCH v4 1/2] mm: Call pointers to ptes as ptep
Message-ID: <axv4qv7uwk7zs4ojni4syhr2tlutzrdpqk77x64tydp3sxdpza@n7vwujimcro6>
References: <20250610035043.75448-1-dev.jain@arm.com>
 <20250610035043.75448-2-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610035043.75448-2-dev.jain@arm.com>
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,oracle.com,suse.cz,google.com,kvack.org,vger.kernel.org,redhat.com,arm.com,kernel.org,antgroup.com,loongson.cn,bytedance.com,infradead.org,gmail.com,os.amperecomputing.com,linux.alibaba.com,nvidia.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,oracle.com:email];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 7ECFC1F78E
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.01

On Tue, Jun 10, 2025 at 09:20:42AM +0530, Dev Jain wrote:
> Avoid confusion between pte_t* and pte_t data types by suffixing pointer
> type variables with p. No functional change.
> 
> Reviewed-by: Barry Song <baohua@kernel.org>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Signed-off-by: Dev Jain <dev.jain@arm.com>

Thanks, this is less confusing!

Feel free to add:
Reviewed-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro
