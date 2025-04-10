Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E07B28A408
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290520; cv=none; b=hKzWJ7Jpir18ZMj6AypaZf5j4BQeQ9szCh5rrvumOryX1oAAUMWlJNBZtcxjjIeJ436l+VuQ7tK6Cw7soZCFZRjXzXiKEYLkXK23ZB1ozQfMZ3LJZwEzelHQoU3rvCWUzuJZKlN+o53ZcGe3nP7WiedcHjb1BoquS6H/9tJG9l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290520; c=relaxed/simple;
	bh=5mubNZKqQrSu5S0oinweDg4SnDUbFvLRMCDLD1QiRIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWXC7Dn7Uc19yQuSOf4iBsi+oditS+X4m9G9oOKSNtnIqo0zWt1NEyxpSXe16JRHv4C+Vkp4I5+mgFUniZo5FxCPM2bjXNisEI+WcirWfvesSPmO1KTLnTD2wZQ6SPL5+tp8BSiv7D4y2R/8b8h0ezagZPodqdXCXYK8YBJsM7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ltdp53VW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NDnNRhO6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ltdp53VW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NDnNRhO6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ltdp53VW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NDnNRhO6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ltdp53VW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NDnNRhO6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 152DE21166;
	Thu, 10 Apr 2025 13:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744290515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JQ+GE9TVlMaXc0U/j9vFk5uI5XCKPbbp9Ak9w+zgA3g=;
	b=ltdp53VWtTufTRvgtyHpInvkWOHVNfCdEJSJkoDc0uokyeq7zckk6u0acA0YcMta/h2dN3
	1FS9+ww4Kvt2wCuRwOEQXZJCJxQGyxYOh+D2/9cgxXUHb2U62AvdWiMS+ulGuR6StIakuU
	XpsvUk9Ef595xroZIj/eGVzYr1si0jU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744290515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JQ+GE9TVlMaXc0U/j9vFk5uI5XCKPbbp9Ak9w+zgA3g=;
	b=NDnNRhO6/DlVDH1EQDP1rhKf40t017jcRX1jfIkEHAjGR3vWHD2pYhAQiiGIq8BMlSDxB9
	qh1MCfj3aLVnZKAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ltdp53VW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NDnNRhO6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744290515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JQ+GE9TVlMaXc0U/j9vFk5uI5XCKPbbp9Ak9w+zgA3g=;
	b=ltdp53VWtTufTRvgtyHpInvkWOHVNfCdEJSJkoDc0uokyeq7zckk6u0acA0YcMta/h2dN3
	1FS9+ww4Kvt2wCuRwOEQXZJCJxQGyxYOh+D2/9cgxXUHb2U62AvdWiMS+ulGuR6StIakuU
	XpsvUk9Ef595xroZIj/eGVzYr1si0jU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744290515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JQ+GE9TVlMaXc0U/j9vFk5uI5XCKPbbp9Ak9w+zgA3g=;
	b=NDnNRhO6/DlVDH1EQDP1rhKf40t017jcRX1jfIkEHAjGR3vWHD2pYhAQiiGIq8BMlSDxB9
	qh1MCfj3aLVnZKAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6925513886;
	Thu, 10 Apr 2025 13:08:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cQhhFNLC92eRYQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 10 Apr 2025 13:08:34 +0000
Date: Thu, 10 Apr 2025 15:08:32 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Gavin Shan <gshan@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, adityag@linux.ibm.com,
	donettom@linux.ibm.com, david@redhat.com,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	akpm@linux-foundation.org, shan.gavin@gmail.com
Subject: Re: [PATCH] drivers/base/memory: Avoid overhead from
 for_each_present_section_nr()
Message-ID: <Z_fC0M94iwDcoOla@localhost.localdomain>
References: <20250410125110.1232329-1-gshan@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410125110.1232329-1-gshan@redhat.com>
X-Rspamd-Queue-Id: 152DE21166
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
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[kvack.org,vger.kernel.org,linux.ibm.com,redhat.com,linuxfoundation.org,kernel.org,linux-foundation.org,gmail.com];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, Apr 10, 2025 at 10:51:10PM +1000, Gavin Shan wrote:
> for_each_present_section_nr() was introduced to add_boot_memory_block()
> by commit 61659efdb35c ("drivers/base/memory: improve add_boot_memory_block()").
> It causes unnecessary overhead when the present sections are really
> sparse. next_present_section_nr() called by the macro to find the next
> present section, which is far away from the spanning sections in the
> specified block. Too much time consumed by next_present_section_nr()
> in this case, which can lead to softlockup as observed by Aditya Gupta
> on IBM Power10 machine.
> 
>   watchdog: BUG: soft lockup - CPU#248 stuck for 22s! [swapper/248:1]
>   Modules linked in:
>   CPU: 248 UID: 0 PID: 1 Comm: swapper/248 Not tainted 6.15.0-rc1-next-20250408 #1 VOLUNTARY
>   Hardware name: 9105-22A POWER10 (raw) 0x800200 opal:v7.1-107-gfda75d121942 PowerNV
>   NIP:  c00000000209218c LR: c000000002092204 CTR: 0000000000000000
>   REGS: c00040000418fa30 TRAP: 0900   Not tainted  (6.15.0-rc1-next-20250408)
>   MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 28000428  XER: 00000000
>   CFAR: 0000000000000000 IRQMASK: 0
>   GPR00: c000000002092204 c00040000418fcd0 c000000001b08100 0000000000000040
>   GPR04: 0000000000013e00 c000c03ffebabb00 0000000000c03fff c000400fff587f80
>   GPR08: 0000000000000000 00000000001196f7 0000000000000000 0000000028000428
>   GPR12: 0000000000000000 c000000002e80000 c00000000001007c 0000000000000000
>   GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   GPR28: c000000002df7f70 0000000000013dc0 c0000000011dd898 0000000008000000
>   NIP [c00000000209218c] memory_dev_init+0x114/0x1e0
>   LR [c000000002092204] memory_dev_init+0x18c/0x1e0
>   Call Trace:
>   [c00040000418fcd0] [c000000002092204] memory_dev_init+0x18c/0x1e0 (unreliable)
>   [c00040000418fd50] [c000000002091348] driver_init+0x78/0xa4
>   [c00040000418fd70] [c0000000020063ac] kernel_init_freeable+0x22c/0x370
>   [c00040000418fde0] [c0000000000100a8] kernel_init+0x34/0x25c
>   [c00040000418fe50] [c00000000000cd94] ret_from_kernel_user_thread+0x14/0x1c
> 
> Avoid the overhead by folding for_each_present_section_nr() to the outer
> loop. add_boot_memory_block() is dropped after that.
> 
> Fixes: 61659efdb35c ("drivers/base/memory: improve add_boot_memory_block()")
> Closes: https://lore.kernel.org/linux-mm/20250409180344.477916-1-adityag@linux.ibm.com
> Reported-by: Aditya Gupta <adityag@linux.ibm.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>

Acked-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
