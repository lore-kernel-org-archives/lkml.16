Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978BB22257F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744103072; cv=none; b=vDThTQy4OkCcazJtDnK3tF+JKQRxKs5g+8d9khuKpB1LpRTJ2DcIgaXtOPCvCNI5aB4VTTwa1OBck6jjOg02IxkzkLcmNmRfIZ1P+VPsJnpopVCti+JY0KxoGgscvlS6yFbWn5zgXmA0YFlPky1SFnnzG+nbebkzadvj25TvyM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744103072; c=relaxed/simple;
	bh=yYfvPE1w1pc8keRbvI/GaEEjWYkeqEZp3BkO2j/JcfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1xpPvob7166agmZW2FSjD5OtZg3dImmo8jt8ZzI9TYACSCf5KZiS6w8TBPqTLd4BGudGu5kA3anEAH6Gtm+K205gj7iKcp7+9qDz2jB3EWXPeAT4Ut0PLHgFznO5WVlwywx4+s6eVT3OHtF77+2RjrgYlizxR+vDzOeXNMnCbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FhzLihHh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F+8UFiFX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FhzLihHh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F+8UFiFX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FhzLihHh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F+8UFiFX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FhzLihHh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F+8UFiFX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C5BBB21180;
	Tue,  8 Apr 2025 09:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744103068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ckfo8fOph7ZzwdOOHPG1tC3S5ShhyBJ/++mhVbO/yPQ=;
	b=FhzLihHhlSf62m8rXTUc5p7euJYsU209Yu9iQ90Esc9RJT3/XCJh4c1rkcEbDdWjcFPit5
	ACcfgrMQ3xUyRwhN9Q0ASVDRxNpUyj4FrifSph9bbWOLotAsguOTNUpNGq1kKu2KAv/9Ro
	gpjI+HjU57AVTuai+f9ffX2gMHtOREY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744103068;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ckfo8fOph7ZzwdOOHPG1tC3S5ShhyBJ/++mhVbO/yPQ=;
	b=F+8UFiFXWK3Bl3yRApuRZSLF8/+RBwilbV4lkv+MPGv/UicQOEofqCPfLb21Hr8sgFCo5n
	cu5mSMhhPwV8/yDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744103068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ckfo8fOph7ZzwdOOHPG1tC3S5ShhyBJ/++mhVbO/yPQ=;
	b=FhzLihHhlSf62m8rXTUc5p7euJYsU209Yu9iQ90Esc9RJT3/XCJh4c1rkcEbDdWjcFPit5
	ACcfgrMQ3xUyRwhN9Q0ASVDRxNpUyj4FrifSph9bbWOLotAsguOTNUpNGq1kKu2KAv/9Ro
	gpjI+HjU57AVTuai+f9ffX2gMHtOREY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744103068;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ckfo8fOph7ZzwdOOHPG1tC3S5ShhyBJ/++mhVbO/yPQ=;
	b=F+8UFiFXWK3Bl3yRApuRZSLF8/+RBwilbV4lkv+MPGv/UicQOEofqCPfLb21Hr8sgFCo5n
	cu5mSMhhPwV8/yDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 56C7013691;
	Tue,  8 Apr 2025 09:04:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +y1lEpzm9GdEXQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 08 Apr 2025 09:04:28 +0000
Date: Tue, 8 Apr 2025 11:04:22 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Baoquan He <bhe@redhat.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, david@redhat.com,
	mingo@kernel.org, yanjun.zhu@linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] mm/gup: remove unneeded checking in
 follow_page_pte()
Message-ID: <Z_Tmljh8dfhRMtCM@localhost.localdomain>
References: <20250407030306.411977-1-bhe@redhat.com>
 <20250407030306.411977-3-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407030306.411977-3-bhe@redhat.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On Mon, Apr 07, 2025 at 11:03:05AM +0800, Baoquan He wrote:
> In __get_user_pages(), it will traverse page table and take a reference
> to the page the given user address corresponds to if GUP_GET or GUP_PIN
> is set. However, it's not supported both GUP_GET and GUP_PIN are set.
> Even though this check need be done, it should be done earlier, but not
> doing it till entering into follow_page_pte() and failed.
> 
> Furthermore, this checking has been done in is_valid_gup_args() and all
> external users of __get_user_pages() will call is_valid_gup_args() to
> catch the illegal setting. We don't need to worry about internal users
> of __get_user_pages() because the gup_flags are set by MM code correctly.
> 
> Here remove the checking in follow_page_pte(), and add VM_WARN_ON_ONCE()
> to catch the possible exceptional setting just in case.
> 
> And also change the VM_BUG_ON to VM_WARN_ON_ONCE() for checking
> (!!pages != !!(gup_flags & (FOLL_GET | FOLL_PIN))) because the checking
> has been done in is_valid_gup_args() for external users of __get_user_pages().

I will also note that you changed the flags check to VM_WARN_ON_ONCE.
I guess this is fine as we have the WARN_ON_ONCE version in
is_valid_gup_args().

> Signed-off-by: Baoquan He <bhe@redhat.com>

LGTM,

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
