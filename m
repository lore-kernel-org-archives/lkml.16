Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEB4281346
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 09:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748942061; cv=none; b=t2uhYZAQr93gvIB2Y+TPsWxKGkAcEbKfvpwGOqy+nmPpqRtkzeqoBIDWVC8ztOoMKStbZ3E1hvTwr1k783toLP5EpANhk+FrQLThLMlmNhjcihYzBNdTChFlqMHI3UPqVVANwv5ohbGBVn4t+tcj5YhcFzJy+JoKnHCDQAkTt2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748942061; c=relaxed/simple;
	bh=bKFfuFTXnXcW0MLjqKGPAcDHK2f0CqjHudlM3qXsI1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SH2LDixtksDIohfF/oxNn2j6NQ5XAEnaTCri6nzuuevYg4003J20WDvKNjMUmc1RddayJ3T1UBKp1I39RlOwa8nehkmXxtVJK++BF50W9JFWtTyJuWRJOUPh3nJzOWGQ0FCtSX8UctxZ/Crg9eVMfXBstrCWfOIMRR9z/I3zj+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UaKBoU+8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vHCmXQgR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UaKBoU+8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vHCmXQgR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UaKBoU+8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vHCmXQgR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UaKBoU+8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vHCmXQgR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BAD8221286;
	Tue,  3 Jun 2025 09:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748942057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FbA0e9GDhuLELcDxxAWKeQuIzyYscoH3Gi2NgunVPl0=;
	b=UaKBoU+8dBFAQ6ayk9+iOW4CmDj2qF7gWJMplyXNLulooxqO3Bc9EXu9XGwNH5lOnl8d00
	IextmIVD3gYtXNCH5w5K5lo1WoNIAgDLDMT4zjrVjDX0IOecxN52T60Y3MhNrk1SvHU9Ca
	nO+RdtHWwciPjSzwZHAeyf56YSWUk3E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748942057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FbA0e9GDhuLELcDxxAWKeQuIzyYscoH3Gi2NgunVPl0=;
	b=vHCmXQgRPny02YyX1TtuchySYFIbiUdT99ZJX7CmoYpJSbBae13k6ERFPgZCq/21Nuw7Yx
	3tbSTNaQmL3CuvDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UaKBoU+8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vHCmXQgR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748942057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FbA0e9GDhuLELcDxxAWKeQuIzyYscoH3Gi2NgunVPl0=;
	b=UaKBoU+8dBFAQ6ayk9+iOW4CmDj2qF7gWJMplyXNLulooxqO3Bc9EXu9XGwNH5lOnl8d00
	IextmIVD3gYtXNCH5w5K5lo1WoNIAgDLDMT4zjrVjDX0IOecxN52T60Y3MhNrk1SvHU9Ca
	nO+RdtHWwciPjSzwZHAeyf56YSWUk3E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748942057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FbA0e9GDhuLELcDxxAWKeQuIzyYscoH3Gi2NgunVPl0=;
	b=vHCmXQgRPny02YyX1TtuchySYFIbiUdT99ZJX7CmoYpJSbBae13k6ERFPgZCq/21Nuw7Yx
	3tbSTNaQmL3CuvDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D6C313A1D;
	Tue,  3 Jun 2025 09:14:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ixtvAOm8PmiaNwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 03 Jun 2025 09:14:17 +0000
Date: Tue, 3 Jun 2025 11:14:07 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Honggyu Kim <honggyu.kim@sk.com>
Cc: Gregory Price <gourry@gourry.net>, kernel_team@skhynix.com,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Rakie Kim <rakie.kim@sk.com>, Harry Yoo <harry.yoo@oracle.com>,
	dan.carpenter@linaro.org
Subject: Re: [PATCH v3 2/3] mm,memory_hotplug: Implement numa node notifier
Message-ID: <aD683wrmR12g5xB9@localhost.localdomain>
References: <20250502083624.49849-1-osalvador@suse.de>
 <20250502083624.49849-3-osalvador@suse.de>
 <aBTkgnYYSN0SMQCU@gourry-fedora-PF4VCD3F>
 <3ad3bcba-b8b6-4e30-8ad9-adba5761e923@sk.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ad3bcba-b8b6-4e30-8ad9-adba5761e923@sk.com>
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gourry.net,skhynix.com,linux-foundation.org,redhat.com,kvack.org,vger.kernel.org,suse.cz,gmail.com,huawei.com,sk.com,oracle.com,linaro.org];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: BAD8221286
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

On Wed, May 28, 2025 at 11:23:53AM +0900, Honggyu Kim wrote:
> The 'err' of sysfs_wi_node_add() wasn't propagated to its caller before
> this change as discussed with David at the following.
> https://lore.kernel.org/198f2cbe-b1cb-4239-833e-9aac33d978fa@redhat.com
> 
> But as Gregory mentioned, we can pass 'err' now with this numa node notifier
> so for this hunk, shouldn't we add the following change on top of this?
> 
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 3a7717e09506..3073ebd4e7ee 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -3792,7 +3792,7 @@ static int sysfs_wi_node_add(int nid)
>  static int wi_node_notifier(struct notifier_block *nb,
>                                unsigned long action, void *data)
>  {
> -       int err;
> +       int err = 0;
>         struct node_notify *arg = data;
>         int nid = arg->status_change_nid;
> 
> @@ -3811,7 +3811,7 @@ static int wi_node_notifier(struct notifier_block *nb,
>                 break;
>         }
> 
> -       return NOTIFY_OK;
> +       return notifier_from_errno(err);

I do not think so.
NODE_BECAME_MEM_AWARE is already too late to react.
We only tell the system that __now__ we are in this state, so there is
no rollback possible from this point forward.


-- 
Oscar Salvador
SUSE Labs
