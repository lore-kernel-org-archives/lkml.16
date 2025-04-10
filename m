Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036551EEA5D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744273407; cv=none; b=eIqtHD7KSgaBiJLDe8+INUved0qCy1LaXQEEw+Mj3QnkW34oP5ubXXxg1DuYDW8Boc0WCpYtGgrX9mn5VSNPDvpypW3hgKWHUTt2aHZfFhFF5/Z72Ibtw5rNVEm8VulXu9QTOqpeoBJNoXwbV5rk0RPdCEVK8dIFe0g2iYb2dJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744273407; c=relaxed/simple;
	bh=w0Eip1KvEL2E47saMtj81jFs2u/VlTQhewjpFRRD0LA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMof+eO8HguqcUqxrnGC0jlV1F9GwFYw93NLEl43Xw1hsYX/z5e6tDJMnQoeDkU/VWaa3Qwj6P10X4XtLgNvkXC5VwikPVAKkrRthqppIC9MJwOS1C0DIi8DFMbssX7lRjQmLtG0aeyQi0GhsgJlpW8G2ZqJ9lQwLfd4TxSluhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PBI/k2hy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zU6pEYbb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bQDBnmr6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tPKEXMf9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PBI/k2hy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zU6pEYbb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bQDBnmr6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tPKEXMf9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EBE151F38C;
	Thu, 10 Apr 2025 08:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744273404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qVIQ2MX1Hq1l5AC3ecRhaV3yCbZqZNAwv8mbBxCFZM8=;
	b=PBI/k2hyp2pZkJIGPorc2ue24Pol5k0pzh62Xuen570UrhNA/V2dU5RPscKJX8XJSVgCO4
	RyCVjh3N9NHsxZ9G8jI/KHpGyIm5JD2kRBUEIzCCPlYpIHhuzdSC2IkqY9hd6fWlWR5fyZ
	Nq+qLy/tUOaPFqgBu8mhLfQAUx7Ynt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744273404;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qVIQ2MX1Hq1l5AC3ecRhaV3yCbZqZNAwv8mbBxCFZM8=;
	b=zU6pEYbbAPP7RmianZcOHUilpG8/LilViqoMN4ebpxM2D9vpkiDv68wzbsnPdI8wobHPne
	u1fzVLJ9n9OFAWAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bQDBnmr6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tPKEXMf9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744273403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qVIQ2MX1Hq1l5AC3ecRhaV3yCbZqZNAwv8mbBxCFZM8=;
	b=bQDBnmr68Js8G7OKr/UvsUWhr5S3LwMhhmuEslfyhvDYkwWOTbOjPNt3E0s7wuQ3SNc42j
	guFAPCX39TzJNztU5Z3D586+fKKcSm3OoJ1196tg2aTnF7R8+VlkDsrNLoJFUvGoXFq8B8
	nSok4XnCc38nzBlCVigSLkvpHk+QMa4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744273403;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qVIQ2MX1Hq1l5AC3ecRhaV3yCbZqZNAwv8mbBxCFZM8=;
	b=tPKEXMf9wDPII7vWon2IyIiQac5XNp70lzHIA3osEXpK+G1CpMS1GEdQ4WYfwoK+2+REGB
	bn/myF1rjD/gQNBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5003313886;
	Thu, 10 Apr 2025 08:23:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id w5TmEPt/92cTCAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 10 Apr 2025 08:23:23 +0000
Date: Thu, 10 Apr 2025 10:23:13 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Gavin Shan <gshan@redhat.com>
Cc: Aditya Gupta <adityag@linux.ibm.com>, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [REPORT] Softlockups on PowerNV with upstream
Message-ID: <Z_d_8fyQzGuwzbIv@localhost.localdomain>
References: <20250409180344.477916-1-adityag@linux.ibm.com>
 <Z_dWTU8UsvCHFMpN@localhost.localdomain>
 <dc4c0d4e-a9a5-4fa5-b39d-4248fba26043@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc4c0d4e-a9a5-4fa5-b39d-4248fba26043@redhat.com>
X-Rspamd-Queue-Id: EBE151F38C
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, Apr 10, 2025 at 03:35:19PM +1000, Gavin Shan wrote:
> Thanks, Oscar. You're correct that the overhead is introduced by for_each_present_section_nr().
> I already had the fix, working on IBM's Power9 machine, where the issue can be
> reproduced. Please see the attached patch.
> 
> I'm having most tests on ARM64 machine for the fix.

Looks good to me.
But we need a comment explaining why block_id is set to ULONG_MAX
at the beginning as this might not be obvious.

Also, do we need
 if (block_id != ULONG_MAX && memory_block_id(nr) == block_id) ?

Cannot just be

 if (memory_block_id(nr) == block_id) ?

AFAICS, the first time we loop through 'memory_block_id(nr) == ULONG_MAX'
will evaluate false and and we will set block_id afterwards.

Either way looks fine to me.
Another way I guess would be:


-- 
Oscar Salvador
SUSE Labs
