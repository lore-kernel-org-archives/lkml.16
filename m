Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B9326ACB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744293330; cv=none; b=D7A5I6Wz+53ehtNs1r1rsyqXSHZISss5VDRLtctl4OxfHbfFakpBzvmuWbzJPxXpPJWCVeUL8ccxKFhmhz0SBI1o+IMBiojwIaLaLQWQgIZRG8TZ8da3cuMubjRqNVe4SKdOq142z5N4xvP+NZxORRYJ44FmYdbaDBVeK+GAUnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744293330; c=relaxed/simple;
	bh=HgstBAgpcoyJB79ka6L9MS4wzTkiQ+tdNNgqeJ3yAyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Abz/mlRZx2WVs6PmLI2+8ZON08CfDNtl/ka5x9Lo6LA67WOHwsJXjeRoc0HBNQE0rdvtswcVl4m7pFZiPIPhApIlWJR8KxlnYnX8RZ0/ddsGRdNDy/d9J5jH5GdZDznXKspkHWoSpherlnQlupJ2l2IUuzhnSQMD76XFC8U5l+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sOILeg+2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Z/OXTelw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sOILeg+2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Z/OXTelw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sOILeg+2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z/OXTelw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sOILeg+2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z/OXTelw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 835A521179;
	Thu, 10 Apr 2025 13:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744293326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=slFcpUKngMaxeKh9g43/vSqYK//QRrWjwpIc7hgFzhU=;
	b=sOILeg+27QLtlJZPA/dGwPoBBD2Clh7qgGAlLmwxmU71MErWsuk6gr8PtJi+CE8YKKWID7
	4xc9RegdI7O16X9YO85b/+ObEMugpjkK7QW4d9DripqOCeo4/KFnsVv86Wb1GRx6u9ree4
	HC1nkz9BuEkx1Vsoy60/t64h5CszUiA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744293326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=slFcpUKngMaxeKh9g43/vSqYK//QRrWjwpIc7hgFzhU=;
	b=Z/OXTelwM1h4EmZ+Q1heCXvmKQ3KDKAK+ebC7P/MK9RkhmgpedZ2+VuhbIJ/hHlzDyJrTv
	hTZ2RFa3aeVIUnBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744293326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=slFcpUKngMaxeKh9g43/vSqYK//QRrWjwpIc7hgFzhU=;
	b=sOILeg+27QLtlJZPA/dGwPoBBD2Clh7qgGAlLmwxmU71MErWsuk6gr8PtJi+CE8YKKWID7
	4xc9RegdI7O16X9YO85b/+ObEMugpjkK7QW4d9DripqOCeo4/KFnsVv86Wb1GRx6u9ree4
	HC1nkz9BuEkx1Vsoy60/t64h5CszUiA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744293326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=slFcpUKngMaxeKh9g43/vSqYK//QRrWjwpIc7hgFzhU=;
	b=Z/OXTelwM1h4EmZ+Q1heCXvmKQ3KDKAK+ebC7P/MK9RkhmgpedZ2+VuhbIJ/hHlzDyJrTv
	hTZ2RFa3aeVIUnBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D58A0132D8;
	Thu, 10 Apr 2025 13:55:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id J8ouMM3N92fncAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 10 Apr 2025 13:55:25 +0000
Date: Thu, 10 Apr 2025 15:55:19 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, adityag@linux.ibm.com,
	donettom@linux.ibm.com, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, akpm@linux-foundation.org,
	shan.gavin@gmail.com
Subject: Re: [PATCH] drivers/base/memory: Avoid overhead from
 for_each_present_section_nr()
Message-ID: <Z_fNx7hTOR8St0SM@localhost.localdomain>
References: <20250410125110.1232329-1-gshan@redhat.com>
 <9deb3725-8991-43d1-8c3d-56523fabff28@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9deb3725-8991-43d1-8c3d-56523fabff28@redhat.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kvack.org,vger.kernel.org,linux.ibm.com,linuxfoundation.org,kernel.org,linux-foundation.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid]
X-Spam-Score: -2.80
X-Spam-Flag: NO

On Thu, Apr 10, 2025 at 03:18:00PM +0200, David Hildenbrand wrote:
> Staring at the end result and the particularly long comment, are we now
> really any better than before 61659efdb35c?

I think we are.
I mean, we made it slightly worse with 61659efdb35c because of what I
explained in the error report, but I think this version is faster than
the code before 61659efdb35c, as before that the outter loop was
incremented by 1 any given time, meaning that the section we were passing
to add_boot_memory_block() could have been already checked in there for
memory-blocks spanning multiple sections.

 
All in all, I think we are better, and the code is slightly simpler?

-- 
Oscar Salvador
SUSE Labs
