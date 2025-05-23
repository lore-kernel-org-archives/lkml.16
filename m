Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE137DA8C
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747988620; cv=none; b=Lb+4Svy6bPQA1BQ9UwHRVKOZM8ODCcTI3bDs0YqIBn1vUFTU/zvvAJBgmNVvuyvBDDvWj4uTRl5948BcvSSj6UM83OFli4x6CLsRFDKEBRsjBcymEOhPlb/554ZUKiOXfePks8QZD48h3laeXbr0wOQp71t2mSDb8gCki8iaWR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747988620; c=relaxed/simple;
	bh=rowdX8b9KeLg0HtKdS4Vgg2Bqi5d3IWWYjNpvpjDsQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8z7yA7VhyP30o8q+ZFhU67mJuOHy2K0AxCJhuIxFcCOx5AeBHcnbtg92HlDXQgZNkgUPDHTAQ1Pz1hHi2/XQZ31tPEs2TYImPkeGjVX9UyHY/eY6PsMhUKy4h3iTlCmT7J0i62zrx0rGGq9JKDrc6zQoUrJzg30QSSW0QYWB0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VT/dk6NV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PE6q+MZo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mk2DJrKz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hivo/S0q; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VT/dk6NV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PE6q+MZo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mk2DJrKz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hivo/S0q"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B3E521F7B5;
	Fri, 23 May 2025 08:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747988616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h4BuFL4WZEyP6+SkcQzWwlfaosz8lXC/4Cuh0DB8QLw=;
	b=VT/dk6NVtLTDAhe4Zm+jaMw2XqZgi9rrKX/t4liBHmEbPDz8E02ZHtcChM3mhU/aQekjYH
	N0SlB8RtHLcUCn9UMObyxIhBSMXmw461MGEGImw11Xyk9MI7akMqqgrIDIePnGekp0EAS8
	ZM3T2DM/lLrRkz8wMGBWLvOqsQ7co5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747988616;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h4BuFL4WZEyP6+SkcQzWwlfaosz8lXC/4Cuh0DB8QLw=;
	b=PE6q+MZornqhww4OGrKSTTR+x4xi8fGMnF2TqD/tg3L3o7o0pvJC9hiAYDo3xmlfofCyxT
	5bQHqn1jCKU8ahBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mk2DJrKz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="hivo/S0q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747988615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h4BuFL4WZEyP6+SkcQzWwlfaosz8lXC/4Cuh0DB8QLw=;
	b=mk2DJrKzNBLqFGCeDjxllTjKiMJzqgxP5QLcBAIXqjzwpHRvBvvN+1Kz3toam8UeMDISwO
	WJdcbReNAFeX+fuJU5yZgK8yuEYKvZnOQ/FlTuBW/jyQbaz29FuIRnx3GAdKs8W22UtqzQ
	JQAyNFPmVvBPSpWfqnSmEHEvM65HVAw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747988615;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h4BuFL4WZEyP6+SkcQzWwlfaosz8lXC/4Cuh0DB8QLw=;
	b=hivo/S0q3b7XGg8EjKH9bbk69FmGNeTp6btLgqY5LiC6QZOty8K3E8VZCU2s+bddoGTuwH
	7zSEA7AsVcbCq6DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2AA661336F;
	Fri, 23 May 2025 08:23:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id b/WYB4cwMGikLQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 23 May 2025 08:23:35 +0000
Date: Fri, 23 May 2025 10:23:33 +0200
From: Oscar Salvador <osalvador@suse.de>
To: yangge1116@126.com
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, 21cnbao@gmail.com, david@redhat.com,
	baolin.wang@linux.alibaba.com, muchun.song@linux.dev,
	liuzixing@hygon.cn
Subject: Re: [PATCH] mm/hugetlb: remove redundant folio_test_hugetlb
Message-ID: <aDAwhW9AjPFc2CP2@localhost.localdomain>
References: <1747987559-23082-1-git-send-email-yangge1116@126.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1747987559-23082-1-git-send-email-yangge1116@126.com>
X-Rspamd-Action: no action
X-Spam-Level: 
X-Rspamd-Queue-Id: B3E521F7B5
X-Spam-Score: -3.51
X-Spam-Flag: NO
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,localhost.localdomain:mid];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[126.com];
	FREEMAIL_ENVRCPT(0.00)[126.com,gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kvack.org,vger.kernel.org,gmail.com,redhat.com,linux.alibaba.com,linux.dev,hygon.cn];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]

On Fri, May 23, 2025 at 04:05:59PM +0800, yangge1116@126.com wrote:
> From: Ge Yang <yangge1116@126.com>
> 
> In the isolate_or_dissolve_huge_folio() function, the folio_test_hugetlb()
> function is called to determine whether a folio is a hugetlb folio.
> However, in the subsequent alloc_and_dissolve_hugetlb_folio() function,
> the folio_test_hugetlb() function is called again to make the same
> determination about whether the folio is a hugetlb folio. It appears that
> the folio_test_hugetlb() check in the isolate_or_dissolve_huge_folio()
> function can be removed. Additionally, a similar issue exists in the
> replace_free_hugepage_folios() function, and it should be addressed as
> well.
> 
> Suggested-by: Oscar Salvador <osalvador@suse.de>
> Signed-off-by: Ge Yang <yangge1116@126.com>

Acked-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
