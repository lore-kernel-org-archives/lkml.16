Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DC770814
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743166760; cv=none; b=DZsUfC2jOsxKR26GVecKdCI2klMonGG+LuI3U7X0xg88gmLz2G/yhahPCvu/E6WczuSynUyK7HAskbh4ZvI0SymNwiKJ9uEjMGcW6VfDSm2111ndCpoADsVzcT3zqZeXQ+eMFExqC/PMWL9B+EDV87xw7un8apKqRkj9gy5UQ4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743166760; c=relaxed/simple;
	bh=vKq8kM552BXKQP3g2sfxgp8yUYJ9RZrKo9foX6FztlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfsrpqqxxCXu9peDS48IjY8mkvJYUIs06YonyK7YD+gI3lqVvbj+kUGOxWZF0kO9bXV8MNkSnDupWayKPXB3OHDWYjbqTm2phnzpSG1GzwbVnJGQBj8Q4TD4V0wAvM7Ae/ilCTj0uBxgdrtzdQSyO7L+CPMc378iE6Mim1eHm7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OjvO0PxA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tQ3RCDDI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oatfvwxs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=un83GBRc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OjvO0PxA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tQ3RCDDI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oatfvwxs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="un83GBRc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2AF1D1F395;
	Fri, 28 Mar 2025 12:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743166756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eoxJI3tSKLozJ9buY/IslFV3bpaEPzfq4n4oUlR3WrI=;
	b=OjvO0PxA0t3ZTZ9GNxIcnu72SMZo+wkU7VDLEbSNBRFVu2XRgZxDOtb3PEvuVRzobY3yjK
	fC75e3lA6UJRq3xrGYG7kNx8xCqQkvbPYcYsfoOHEvahdgwiDjUM2df5wYcm0kUk63vxwr
	jpadw0hsXbYv1/trkSe+rcyGK60bZBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743166756;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eoxJI3tSKLozJ9buY/IslFV3bpaEPzfq4n4oUlR3WrI=;
	b=tQ3RCDDI4C+Bzmjd+Lk5V/RR7b9u8CQDHlSg8P44v0ke1jEg4SiggnDNp2D7t4qeTGr97a
	PC4r0i2UiUJMKGCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743166755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eoxJI3tSKLozJ9buY/IslFV3bpaEPzfq4n4oUlR3WrI=;
	b=oatfvwxsbU7P+YVlnLSiyPOPGUfmvH2QjcTQ4Ghe4XRH7veK9lBO2Wkl2Oo9qdhxDlqdqy
	eR0tnhUQiyneCrAaGIF7UC7VmGNUJiuFwS4tZup0USW+RgB3Y38aWixKHAnJMbdAdEEVwk
	Qv+bNieWW7OsBQ4TnU4UidmStRTsxyM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743166755;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eoxJI3tSKLozJ9buY/IslFV3bpaEPzfq4n4oUlR3WrI=;
	b=un83GBRcEX61mgTbGYcy75UbAZc0pr4gRG7omy8bfO6vkQ4izH/XHaUJSZMlDGGHcVvFh9
	0Ycd08rcsT5SlJCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BDE3C13927;
	Fri, 28 Mar 2025 12:59:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8/iEKyKd5meEWQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 28 Mar 2025 12:59:14 +0000
Date: Fri, 28 Mar 2025 13:59:09 +0100
From: Oscar Salvador <osalvador@suse.de>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: akpm@linux-foundation.org, monstr@monstr.eu, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] microblaze/mm: put mm_cmdline_setup() in .init.text
 section
Message-ID: <Z-adHYx8NAzle2xS@localhost.localdomain>
References: <20250328010136.13139-1-richard.weiyang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328010136.13139-1-richard.weiyang@gmail.com>
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,intel.com:email]
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, Mar 28, 2025 at 01:01:36AM +0000, Wei Yang wrote:
> As reported by lkp, there is a section mismatch of mm_cmdline_setup() and
> memblock. The reason is we don't specify the section of mm_cmdline_setup()
> and gcc put it into .text.unlikely.
> 
> As mm_cmdline_setup() is only used in mmu_init(), which is in .init.text
> section, put mm_cmdline_setup() into it too.
> 
> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
> CC: Masahiro Yamada <masahiroy@kernel.org>
> CC: Andrew Morton <akpm@linux-foundation.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202503241259.kJV3U7Xj-lkp@intel.com/

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
