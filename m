Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8359420C02D
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746450448; cv=none; b=K+BXSdyQmf/QTg0TPrdncFrk3NvGrwL2LvtG8avoB3y4Da5ibd3RLvIEIJrh7NlkDKjP2Guhy2B2IaG6EXyUNgkX8YKbz6OCj8Yi3VlIDJjiEImV2mz4QYhHT1l0VEH4BgeqYTJLBEAd2U16TV51KFivyz4CtKEBsL8Wag3qKaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746450448; c=relaxed/simple;
	bh=mU78H2q2BseXOWGWn0v4UhutJKm1HUV0n1qhznyEM1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o58yq17Mx0l23P1Dg5edaGZjDROlqkYSmuiKB1trRipBNkY9dFyTqQPc068n3be+zNc+6jmuVl6p2AUj8CfnYV7WzUHrhVzgrewYX8akJIcojZZXEy8aN3/1zSnEJoqyq6HbenMxIPfFEucWr4i+COtYWrev3sUsmpWGlNb2pWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UXbmpPeU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=45CPe9Wg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UXbmpPeU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=45CPe9Wg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UXbmpPeU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="45CPe9Wg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UXbmpPeU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="45CPe9Wg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9D297211EE;
	Mon,  5 May 2025 13:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746450444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n7bM99N3Kh6W6XwDJeCpv3UvEQyAWW+ApgUPey55Uew=;
	b=UXbmpPeUdI6RZBQM7QlcUE1bplF6Ccf3krG6pfyeNq5NkeGFzmium+TgD04qDiAUVV0AKh
	pXgIWwpXoAe8k/GIZxi3pOZRN+OUM4XLo0+jWCQ15Rvx46scwQS1YNAkeqlDxavHegsPvl
	T5h6gJ68crqGkBQGMGJVZLT45jQe3pw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746450444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n7bM99N3Kh6W6XwDJeCpv3UvEQyAWW+ApgUPey55Uew=;
	b=45CPe9WguxqpWyWbrjzPN382WBQ0Baf6JOAShn1QfglbH34CHmrg997AoKo6yMZ4h50gYD
	gXhG+XoNL0sIL2DA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UXbmpPeU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=45CPe9Wg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746450444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n7bM99N3Kh6W6XwDJeCpv3UvEQyAWW+ApgUPey55Uew=;
	b=UXbmpPeUdI6RZBQM7QlcUE1bplF6Ccf3krG6pfyeNq5NkeGFzmium+TgD04qDiAUVV0AKh
	pXgIWwpXoAe8k/GIZxi3pOZRN+OUM4XLo0+jWCQ15Rvx46scwQS1YNAkeqlDxavHegsPvl
	T5h6gJ68crqGkBQGMGJVZLT45jQe3pw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746450444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n7bM99N3Kh6W6XwDJeCpv3UvEQyAWW+ApgUPey55Uew=;
	b=45CPe9WguxqpWyWbrjzPN382WBQ0Baf6JOAShn1QfglbH34CHmrg997AoKo6yMZ4h50gYD
	gXhG+XoNL0sIL2DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CD65F1372E;
	Mon,  5 May 2025 13:07:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JPRMLQu4GGjlLQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 05 May 2025 13:07:23 +0000
Date: Mon, 5 May 2025 15:07:17 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Donet Tom <donettom@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] driver/base: Optimize memory block registration
 to reduce boot time
Message-ID: <aBi4BQAi_zWviDSk@localhost.localdomain>
References: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>
 <aBdK2EIMYYRmmEwA@kernel.org>
 <a1e0cddc-ed38-4f48-b028-f3ab5025c157@linux.ibm.com>
 <188fbfba-afb4-4db7-bbba-7689a96be931@redhat.com>
 <aBhoqpC4Jy-c-74p@localhost.localdomain>
 <74c500dd-8d1c-4177-96c7-ddd51ca77306@redhat.com>
 <aBhva9D6H5BtkSID@localhost.localdomain>
 <0e568e33-34fa-40f6-a20d-ebf653de123d@redhat.com>
 <aBiGquz1Exx8KUqq@localhost.localdomain>
 <da921072-64a8-4ef1-b583-763406e57e8b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da921072-64a8-4ef1-b583-763406e57e8b@redhat.com>
X-Rspamd-Queue-Id: 9D297211EE
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,nvidia.com,linuxfoundation.org,linux-foundation.org,gmail.com,huawei.com,intel.com,kvack.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, May 05, 2025 at 12:36:21PM +0200, David Hildenbrand wrote:
> My thinking was, whether we can simply move the register_cpu_under_node()
> after the try_online_node(). See below regarding early.
> 
> And then, remove the !node_online check from register_cpu_under_node().
> 
> But it's all complicated, because for memory, we link a memory block to the
> node (+set the node online) when it gets added, not when it gets onlined.
> 
> For CPUs, we seem to be creating the link + set the node online when the CPU
> gets onlined.

Yes, that is one think we need to align on.

So, add_memory_resource(), which is part of the hot-add stage, will mark the node
online if it needs to.
I guess that this is done this way because further down the road we rely
on the node to be online for some reason (e.g: online_memory_block() being
called from add_memory_resource()).

Although from the conceptual point of view, it does not make sense, does
it?
I mean, if a node does not have any resources onlined, why should it be
onlined?

But let us assume that that is the way to go, then we could in fact
tweak the cpu-hotplug code to do the same, and online the node whenever
a cpu gets hot-added, and not really waiting for it to be onlined.

I can do some experiments about it and see how it turns out.

> > The first time we hotplug a cpu to the node, note that
> > register_cpu()->register_cpu_under_node() will bail out as node is still
> > offline, so only cpu's sysfs will be created but they will not be linked
> > to the node.
> > Later, online_store()->...->cpu_subsys_online()->..->cpu_up() will take>
> care of 1) onlining the node and 2) register the cpu to the node (so,
> > link the sysfs).
> 
> 
> And only if it actually gets onlined I assume.

Yes, we only register it if we managed to online the node.

> > I think that ideally, we should only be calling register_cpu_under_node()
> > from register_cpu(), but we have this kinda of (sort of weird?) relation
> > that even if we hotplug the cpu, but we do not online it, the numa node
> > will remain online, and so we cannot do the linking part (cpu <-> node),
> > so we could not really only have register_cpu_under_node() in
> > register_cpu(), which is the hot-add part, but we also need it in the
> > cpu_up()->try_online_node() which is the online part.
> 
> Maybe one could handle CPUs similar to how we handle it with memory: node
> gets onlined + link created as soon as we add the CPU, not when we online
> it.

Yes, indeed, as I stated above I think this is the way to go, to have it
paired.

> But likely there is a reason why we do it like that today ...

I cannot think of any (Tm), but it is a possibility.

I will take a break from hugetlb stuff and play a little bit with this.


-- 
Oscar Salvador
SUSE Labs
