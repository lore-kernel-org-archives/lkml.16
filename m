Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AF113C918
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908371; cv=none; b=YVAZPI2IycGs1NuhPfpn+Hli7diaEkUCR/kaoBAxf+9mZsQYlXWZl0BdRYPFCjnBkhesHG4s0+cCTeUr88BFaIbD0R9da1xBnKHzn4ff7OzCzUjflzPpPLvnDwpj/iW8HYebE1ZFhQx8i9eD441pqV3Ejj9gusYzl/ACTkHDiaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908371; c=relaxed/simple;
	bh=hI2PkXg+5nFv0lJw00qYMEYS3IrXQKl1hC5C8cOA9ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fz5QUrss958Piy3tuzhcy07/Pq0Libu4s72XwuGbnFFtPyYNpwjdOdgo7JJx1AwSyqH6kMWT2ffVJQi6pPRIxc7lmS4wBmPL8ex9AGoMRQz8g3SsrA0M2dcmV4DaYcBlF+fIVgtNJYm6nk3fR8+3SxCv1l3tYwn9zQpT/1M5JYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jZ8L8mhu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OdnzB7To; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jZ8L8mhu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OdnzB7To; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jZ8L8mhu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OdnzB7To";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jZ8L8mhu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OdnzB7To"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BDA3B211E8;
	Thu, 22 May 2025 10:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747908367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mJfxvIGADykpV/3Aru4pEGNYo+FCqumWO2IR3zGTS1U=;
	b=jZ8L8mhuCvRJ5aztPiKxC4pHZSoPxuHeZui96DeRNoB3+KIYeXkxUuTfKm/YaAjF2JGeiu
	GoExPf/qVPSaojW28ljqh7eWiCwrarWW+S248sXh6JNMHLx8J3u0+sIoB8LlLT5XGTgbLI
	IQwPIKzVW2/PJdKXMMIndmwjXt37kzs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747908367;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mJfxvIGADykpV/3Aru4pEGNYo+FCqumWO2IR3zGTS1U=;
	b=OdnzB7Tod9A6HmzzvvEUMejqQMWVmYwRrloo4lIJmSXnAKI6sWuacKzE70kMwNGr/3eRzz
	1Me07idBo3n6BXAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747908367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mJfxvIGADykpV/3Aru4pEGNYo+FCqumWO2IR3zGTS1U=;
	b=jZ8L8mhuCvRJ5aztPiKxC4pHZSoPxuHeZui96DeRNoB3+KIYeXkxUuTfKm/YaAjF2JGeiu
	GoExPf/qVPSaojW28ljqh7eWiCwrarWW+S248sXh6JNMHLx8J3u0+sIoB8LlLT5XGTgbLI
	IQwPIKzVW2/PJdKXMMIndmwjXt37kzs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747908367;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mJfxvIGADykpV/3Aru4pEGNYo+FCqumWO2IR3zGTS1U=;
	b=OdnzB7Tod9A6HmzzvvEUMejqQMWVmYwRrloo4lIJmSXnAKI6sWuacKzE70kMwNGr/3eRzz
	1Me07idBo3n6BXAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7CC3A137B8;
	Thu, 22 May 2025 10:06:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WqrnHQ/3LmiGOwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 22 May 2025 10:06:07 +0000
Date: Thu, 22 May 2025 12:06:06 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Donet Tom <donettom@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH v5 3/4] drivers/base/node: Remove
 register_memory_blocks_under_node() function call from register_one_node
Message-ID: <aC73Dp90lDz1PN5T@localhost.localdomain>
References: <d2490e807b2c13950bc1d4199f22ec078cc4c56a.1747904868.git.donettom@linux.ibm.com>
 <a2cc58f18dc984fc9563b9c10d5708cc92ac579f.1747904868.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2cc58f18dc984fc9563b9c10d5708cc92ac579f.1747904868.git.donettom@linux.ibm.com>
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.20
X-Spamd-Result: default: False [0.20 / 50.00];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,linux-foundation.org,kernel.org,nvidia.com,linuxfoundation.org,gmail.com,kvack.org,vger.kernel.org,huawei.com,intel.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[]

On Thu, May 22, 2025 at 04:17:30AM -0500, Donet Tom wrote:
> diff --git a/include/linux/node.h b/include/linux/node.h
> index 5c763253c42c..6cf349c26780 100644
> --- a/include/linux/node.h
> +++ b/include/linux/node.h
> @@ -136,18 +136,8 @@ static inline int register_one_node(int nid)
>  {
>  	int error = 0;
>  
> -	if (node_online(nid)) {
> -		struct pglist_data *pgdat = NODE_DATA(nid);
> -		unsigned long start_pfn = pgdat->node_start_pfn;
> -		unsigned long end_pfn = start_pfn + pgdat->node_spanned_pages;
> -
> +	if (node_online(nid))
>  		error = __register_one_node(nid);

Heh, remembering this code always brings me joy.

After this patch, register_one_node() is only called from try_online_node(), right?
Which, before calling in, explicitly sets the node online, so... we can get rid of
the node_online() check unless I am missing something.


-- 
Oscar Salvador
SUSE Labs
