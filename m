Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A34D1C84A5
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748535741; cv=none; b=UWAY+WEbP+iHyJvSUHC3sEpK/OU1NZzdEduW/As46jGNL4sxV2Eag0mrFce5Ay7ly3HMDdI0K44rgDfw5nLg2V1IYFvaeh9wQtyTgHduubT2rWh5Q6Ou+UIi9jO8bGLLIldXnSh0L2kRIToimGNAG0qO2HJzZYVbStVNzP6PKig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748535741; c=relaxed/simple;
	bh=gEN6lDiE/kCz3cCG2dJKfYLxZRUu4dDH9wBtEEEyVDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8yHcDOXXXGcAyI5aNkpVG05Hn6/CFGrHj75ZK/nvooF3+6rSWAFIBiKooUOCXm7OdDJVwoTxN/49zkL5Tja+bvBq/zpxijBVWs1SAkAX4mR8v+1pv5j7gGyXdeaajh6HxpmpDLnyeyTbvVAKsUOeTljR7CK9yKwg9AaX8S48oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=sBDJfhX3; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ZmNkjHj8; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=HyWeMu9Y; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=RwxxuEJc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="sBDJfhX3";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ZmNkjHj8";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="HyWeMu9Y";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="RwxxuEJc"
Received: from localhost (unknown [10.100.12.32])
	by smtp-out2.suse.de (Postfix) with ESMTP id 2056C1F7FD;
	Thu, 29 May 2025 16:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748535738; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lxDeu3h5/e2Dor4zcf2wwpUXfX47eUvG4MdqHLFkL9k=;
	b=sBDJfhX3Y7hxNm73MjTCy8cOUZFBO+1H9PTsiBSdpFJbvGnD8LFqdERh6FjHkdqd1Rs5+T
	94/LAbVkiXR5w5vCbvSWqeSGsLBgEWh6Ut6GX3G7WMbwd8TiCQinATZq0iMU3xKOUQo9+o
	kuFdhsMgCU36SIazL7tY/sjsFflFWyw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748535738;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lxDeu3h5/e2Dor4zcf2wwpUXfX47eUvG4MdqHLFkL9k=;
	b=ZmNkjHj8bAxMuM1k4d/PmVCTnKfzz6qvhVHLsy6MLqqENbRKhcU2ORVV1nXb8/FAfFlyqb
	EWtHjc725TZj4eBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748535737; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lxDeu3h5/e2Dor4zcf2wwpUXfX47eUvG4MdqHLFkL9k=;
	b=HyWeMu9YcwqeeQzYwEs/utEANntZukEq9sj6D/Er8T6xoOt0q6sI7wcXlLZW/qQDM/zwSU
	sojF3uIngONwwW9RV9D1QWO9GD2nXfn6eu0KjDCSEdJhL3Lc0GvwmO/fD5u+IAN3+f+iPm
	fMolCFWCMc1igv3XPjs0rNAVaeKchG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748535737;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lxDeu3h5/e2Dor4zcf2wwpUXfX47eUvG4MdqHLFkL9k=;
	b=RwxxuEJcN2NYA+yEGgTFL/der/+nYn3XpTYQ7nqgc53g3AYM+pu0xBiv+at96XSN3r2MTl
	D8QVTDTICyJhFOAg==
Date: Thu, 29 May 2025 18:22:17 +0200
From: Jiri Bohac <jbohac@suse.cz>
To: David Hildenbrand <david@redhat.com>
Cc: Baoquan He <bhe@redhat.com>, Donald Dutile <ddutile@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	kexec@lists.infradead.org, Philipp Rudo <prudo@redhat.com>,
	Pingfan Liu <piliu@redhat.com>, Tao Liu <ltao@redhat.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <dhildenb@redhat.com>,
	Michal Hocko <mhocko@suse.cz>
Subject: Re: [PATCH v2 0/5] kdump: crashkernel reservation from CMA
Message-ID: <aDiJuZgUC2CYtdxi@dwarf.suse.cz>
References: <Z7dc9Cd8KX3b_brB@dwarf.suse.cz>
 <04904e86-5b5f-4aa1-a120-428dac119189@redhat.com>
 <427fec88-2a74-471e-aeb6-a108ca8c4336@redhat.com>
 <Z8Z/gnbtiXT9QAZr@MiWiFi-R3L-srv>
 <e9c5c247-85fb-43f1-9aa8-47d62321f37b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9c5c247-85fb-43f1-9aa8-47d62321f37b@redhat.com>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost:helo,suse.cz:email,dwarf.suse.cz:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30

On Wed, May 28, 2025 at 11:01:04PM +0200, David Hildenbrand wrote:
> I think we just have to be careful to document it properly -- especially the
> shortcomings and that this feature might become a problem in the future.
> Movable user-space page tables getting placed on CMA memory would probably
> not be a problem if we don't care about ... user-space data either way.

Agreed; in the v3 series [1] I amended the documentation part [2] to
explicitly mention that kernel movable allocations could be
missing from the vmcore.

The risks associated with pending DMA are also mentioned.

Is there anything you're still missing from the v3 documentation?

> The whole "Direct I/O takes max 1s" part is a bit shaky. Maybe it could be
> configurable how long to wait? 10s is certainly "safer".

I have nothing against making this configurable, or just setting
the fixed/default delay to 10s. Which would you prefer?
Would you prefer a command-line option, config option or a sysfs
file?

Thanks!

[1] https://lore.kernel.org/lkml/Z9H10pYIFLBHNKpr@dwarf.suse.cz/
[2] https://lore.kernel.org/lkml/Z9H4E82EslkGR7pV@dwarf.suse.cz/

-- 
Jiri Bohac <jbohac@suse.cz>
SUSE Labs, Prague, Czechia

