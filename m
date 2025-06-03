Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795B21F9F7C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 05:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748928510; cv=none; b=dGaivUlQkz34I/Laen6GhvuBrkeG6N/a2PvKDteiHF0kcrq0SnOua0Gw+ah8E6fd9ivMADYnxIJvPxnjJTOUfRtaZk2u88mjOP5p/XiOhDasTu1Kou7V5kH96X3+/MgZd9u2CeK6Nn+Qsj3NDYivWL7a3KMxZ4odwsZVAdA9YzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748928510; c=relaxed/simple;
	bh=tKTwiZHr1T7OcqgJQXsgM7l83EgKhPzPz/oRDLCDRZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MxbNjM2RzqWVWNlplOcyHX9sXhMEVHFMTiSHszlLCcI34Kc1uBjW7JLOVr7tQe2T5ubSu1B6XGQ+lLlEdmJDJrvjXw1vcoTNRj0+gEVOzVRnZ8jKi9ipCKMPG+lQtvWqWBUC+TU0dCT9oYP8BxzYBjLXMoEPZ6OMtLFSnOkzG/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DiJwKGSJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Se4xwMfd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DiJwKGSJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Se4xwMfd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DiJwKGSJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Se4xwMfd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DiJwKGSJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Se4xwMfd"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 75CFF1F38D;
	Tue,  3 Jun 2025 05:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748928501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1hN3/bwsM+kQFOPK0LZummJGWGR9dunUQ2aWjPdto+0=;
	b=DiJwKGSJv82ZIEuOm7Wl2hUsrpFFB1xDlRMLoJ36ovUn2jqPP33MZmfWCkRqQq/osMt2gu
	KHMVgvgEJunf3hjSY6yo7A81r/NPNmSDuvCBcCcOqmIUDRW1RxbSVhMmvaUVMBsJGb0e/g
	i7uXBeOmThUuHplH00poz2/ocIa8CIE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748928501;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1hN3/bwsM+kQFOPK0LZummJGWGR9dunUQ2aWjPdto+0=;
	b=Se4xwMfd/d4d8prnYYQpuLgb5JIqd7+4sM7yrMlRkcphx0sl88ZobCRPwGcTCDNYh914wC
	hyCxNFBw4ZcvoZCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748928501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1hN3/bwsM+kQFOPK0LZummJGWGR9dunUQ2aWjPdto+0=;
	b=DiJwKGSJv82ZIEuOm7Wl2hUsrpFFB1xDlRMLoJ36ovUn2jqPP33MZmfWCkRqQq/osMt2gu
	KHMVgvgEJunf3hjSY6yo7A81r/NPNmSDuvCBcCcOqmIUDRW1RxbSVhMmvaUVMBsJGb0e/g
	i7uXBeOmThUuHplH00poz2/ocIa8CIE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748928501;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1hN3/bwsM+kQFOPK0LZummJGWGR9dunUQ2aWjPdto+0=;
	b=Se4xwMfd/d4d8prnYYQpuLgb5JIqd7+4sM7yrMlRkcphx0sl88ZobCRPwGcTCDNYh914wC
	hyCxNFBw4ZcvoZCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 14F0A13700;
	Tue,  3 Jun 2025 05:28:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2NlIAvWHPmi9aQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 03 Jun 2025 05:28:21 +0000
Date: Tue, 3 Jun 2025 07:28:15 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	akpm@linux-foundation.org, willy@infradead.org,
	muchun.song@linux.dev
Subject: Re: [PATCH] mm/hugetlb: convert hugetlb_change_protection() to folios
Message-ID: <aD6H73HH7BBoJ7XQ@localhost.localdomain>
References: <20250528192013.91130-1-sidhartha.kumar@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528192013.91130-1-sidhartha.kumar@oracle.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30

On Wed, May 28, 2025 at 03:20:13PM -0400, Sidhartha Kumar wrote:
> The for loop inside hugetlb_change_protection() increments by the huge
> page size:
> 
> psize = huge_page_size(h);
> for (; address < end; address += psize)
> 
> so we are operating on the head page of the huge pages between address
> and end. We can safely convert the struct page usage to struct folio.
> 
> Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
