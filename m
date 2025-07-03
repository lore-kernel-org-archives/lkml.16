Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFE32D63F1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534509; cv=none; b=PVdBK5RbKjWjbZHJY/5hb5csWK90dIEDh92a7tsRynOuImfA3cgfDnwsX/Ztneuc+m0joM4bQTaBPa7BRrUffu9WKVjj51OzBt2mkEM4PvU5F6WUhGjtL0g9GWB9+W2gcaJVkQs8EiTLYHQd6EhO+a3UBFxexZbaCkHkpwu5HJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534509; c=relaxed/simple;
	bh=rq4mTYB/1560UB0rBsKFmXq0QzxdfbBTetPKVFWDkkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DpUw+xto0xxIAO/cCeQXPPE2CQ6KgH/imVmkJyoYvxxfJufpb5nwR70yUHM5vQyXXait2P6YoQqHY1iAhQqyOBtyJk3mXCXvYdgtmGvtvXjW3AXrQOQVtmdRlU17GZpKqIZqq58OY5AMF/jiSUDSZy+7Rn9Z/GVjFNKYfgyUhG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EFRjm3SS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IOFH0rFP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EFRjm3SS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IOFH0rFP; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EFRjm3SS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IOFH0rFP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EFRjm3SS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IOFH0rFP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 55DFA1F387;
	Thu,  3 Jul 2025 09:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751534506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Por51rfQpl+HHWn6dQahsNai+AbHBReTEPcU5b2UV4U=;
	b=EFRjm3SSQXTyy7c4Q0xH73zmLMTImh9tiTAO2As83Omug7Eq+f+zTKU+/DUGfUMOkb4m90
	VxwfRaB7YqZ755ULiGUZHt2DI7k50yIxTx8lRk3gs3x0uGBw2KpEidolfvOmd2nlp92jAu
	n3A0ngfhmNhwEyRnxxvqUElXnv0qme8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751534506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Por51rfQpl+HHWn6dQahsNai+AbHBReTEPcU5b2UV4U=;
	b=IOFH0rFP+n9CYvIMetfQd9A+oEqCiouc+1vzuBEUczsNGAICGobX8epSoRcl8YU7EaLALS
	jVZTJeYOeYZ6D7Cw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EFRjm3SS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IOFH0rFP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751534506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Por51rfQpl+HHWn6dQahsNai+AbHBReTEPcU5b2UV4U=;
	b=EFRjm3SSQXTyy7c4Q0xH73zmLMTImh9tiTAO2As83Omug7Eq+f+zTKU+/DUGfUMOkb4m90
	VxwfRaB7YqZ755ULiGUZHt2DI7k50yIxTx8lRk3gs3x0uGBw2KpEidolfvOmd2nlp92jAu
	n3A0ngfhmNhwEyRnxxvqUElXnv0qme8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751534506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Por51rfQpl+HHWn6dQahsNai+AbHBReTEPcU5b2UV4U=;
	b=IOFH0rFP+n9CYvIMetfQd9A+oEqCiouc+1vzuBEUczsNGAICGobX8epSoRcl8YU7EaLALS
	jVZTJeYOeYZ6D7Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DFA2E13721;
	Thu,  3 Jul 2025 09:21:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SR3sM6lLZmjffQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 03 Jul 2025 09:21:45 +0000
Date: Thu, 3 Jul 2025 11:21:44 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	David Hildenbrand <david@redhat.com>,
	Pratyush Yadav <ptyadav@amazon.de>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 1/3] cma: move __cma_declare_contiguous_nid() before its
 usage
Message-ID: <aGZLqItjir7Vmmgg@localhost.localdomain>
References: <20250702173605.2198924-1-rppt@kernel.org>
 <20250702173605.2198924-2-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702173605.2198924-2-rppt@kernel.org>
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 55DFA1F387
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.51

On Wed, Jul 02, 2025 at 08:36:03PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> and kill static declaration
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Acked-by: Oscar Salvador <osalvador@suse.de>

Thanks Mike ;-)!


-- 
Oscar Salvador
SUSE Labs
