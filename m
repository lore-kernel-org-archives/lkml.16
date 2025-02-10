Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00281C07E5
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739192279; cv=none; b=D6pPdlui6nLCeRbzwCSFhMjyPm+ZddVlW7Ao+Ersf7SQKHCUNeI/QaU+tSLCy5uHLKz8TFCGh3xLeav1acCIbNYF+Xf+G48A8DJynpCdFGzqJqHL6rVaC0bRP1rS0TsPw5bSiePzWgAneY04w+Ztu1HE/fXdnWXGgg1VW2rV/eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739192279; c=relaxed/simple;
	bh=vES+R76zCFKvpCLBJjEw5I3JRgR4vUCD/ysxQSLOjV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q8Ag2SecoTpHqVKlD7lM8jgy02LDpQrEV1o6yumKPGyhNUXjcbVrA64D7lE6/2LKh9UT5MaLoEgD/pHdlsJ75jpM1ufvUT8kXVx4+BMEMceXHWoTV14JR3gK28MNS74ZCQ5iIhcJUjZTHeidMr94+gEfN/9sreMP1p2Ri+fdv70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mQp4qLRw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iiWfmPrg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mQp4qLRw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iiWfmPrg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mQp4qLRw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iiWfmPrg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mQp4qLRw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iiWfmPrg"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BBE28210F8;
	Mon, 10 Feb 2025 12:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739192275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G5N+29t5fdH1xZC+QmxN9ar41yJPhbeshQ+XzkWvaBk=;
	b=mQp4qLRwGUOY+WhAxZIvylgKQUO+f2UaTjObrMRqMW4bt/S5EZwhe7FkrqlF1lL9jxDasP
	HBqGp+abl459j/a5FkCDHNcQyoyP09o6UkmBCyCMI1s/SMLDCy58tIBUcvCQXL6pk3MxGp
	Ag0ksCLOPrL6WetWc8rXSS76IalTTBg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739192275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G5N+29t5fdH1xZC+QmxN9ar41yJPhbeshQ+XzkWvaBk=;
	b=iiWfmPrgGKhq0yux6kMny3f9TcjnSH9pCKL15pKymgNQfPQOOBq+fCNWjEra5ktwISMRqs
	tsEKBwgwEpfe6LDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739192275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G5N+29t5fdH1xZC+QmxN9ar41yJPhbeshQ+XzkWvaBk=;
	b=mQp4qLRwGUOY+WhAxZIvylgKQUO+f2UaTjObrMRqMW4bt/S5EZwhe7FkrqlF1lL9jxDasP
	HBqGp+abl459j/a5FkCDHNcQyoyP09o6UkmBCyCMI1s/SMLDCy58tIBUcvCQXL6pk3MxGp
	Ag0ksCLOPrL6WetWc8rXSS76IalTTBg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739192275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G5N+29t5fdH1xZC+QmxN9ar41yJPhbeshQ+XzkWvaBk=;
	b=iiWfmPrgGKhq0yux6kMny3f9TcjnSH9pCKL15pKymgNQfPQOOBq+fCNWjEra5ktwISMRqs
	tsEKBwgwEpfe6LDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2DB6F13707;
	Mon, 10 Feb 2025 12:57:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id b/aGBtP3qWcvfwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 10 Feb 2025 12:57:55 +0000
Date: Mon, 10 Feb 2025 13:57:53 +0100
From: Oscar Salvador <osalvador@suse.de>
To: Frank van der Linden <fvdl@google.com>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, yuzhao@google.com,
	usamaarif642@gmail.com, joao.m.martins@oracle.com,
	roman.gushchin@linux.dev, Zhenguo Yao <yaozhenguo1@gmail.com>
Subject: Re: [PATCH v3 05/28] mm/hugetlb: fix round-robin bootmem allocation
Message-ID: <Z6n30QhWeAyFea40@localhost.localdomain>
References: <20250206185109.1210657-1-fvdl@google.com>
 <20250206185109.1210657-6-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206185109.1210657-6-fvdl@google.com>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,linux.dev,kvack.org,vger.kernel.org,google.com,gmail.com,oracle.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, Feb 06, 2025 at 06:50:45PM +0000, Frank van der Linden wrote:
> Commit b5389086ad7b ("hugetlbfs: extend the definition of hugepages parameter to support node allocation")
> changed the NUMA_NO_NODE round-robin allocation behavior in case of a
> failure to allocate from one NUMA node. The code originally moved on to
> the next node to try again, but now it immediately breaks out of the loop.
> 
> Restore the original behavior.

Did you stumble upon this?

AFAICS, memblock_alloc_range_nid() will call memblock_find_in_range_node() with
NUMA_NO_NODE for exact_nide = false, which would be our case.
Meaning that if memblock_alloc_try_nid_raw() returns false here, it is because
we could not allocate the page in any node, right?


-- 
Oscar Salvador
SUSE Labs
