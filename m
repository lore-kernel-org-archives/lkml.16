Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2310C19ADBF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743613402; cv=none; b=eW0J8cvphOtqGz4+PMe+c9y/xzvI+5jW342VNEpCWqrRVujaSaWapyx3xgNgqn1pId0vg4x5zSjOeJggoRSsB2IuviMNGlEkF5ypv+rDBQaauJQZ7H5mL3RLFLBAKIShHepJv5RJBs9eXn8IX+iEohkPdyNiN7EYpMndyjqqkWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743613402; c=relaxed/simple;
	bh=UPXAbSFM46LvItdz6K36Hv59vGh9Nkgg2+ffhWuDgFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VcgtNt2AooUhfwN8zfZtX4wLctK5vMlhv7K2PmvHUtVgauERsNlp27BRZ2YIJFfvWfK1ddXsuqSzFbBmqJqGXiYwFz0rJPL973B1zUuYSP710hhvB7ljLURHCrIOZILNt2V2kULBM9Eq1wcxabvZ9UcqiMbhI2ircdakDE0zc9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rWFGI8P8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aha205K+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rWFGI8P8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aha205K+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rWFGI8P8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aha205K+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rWFGI8P8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aha205K+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4B9BB1F38E;
	Wed,  2 Apr 2025 17:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743613399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fa6YlXKodz8uE2B17ypH6DPH4OLlDWUm8hFyF5FIY9Y=;
	b=rWFGI8P80VWPbDK82CvkzpgfMRqhsRT66++IButprgXUkvHplkNVR+XAfce703NyqRxfcm
	o2Mnvu1xS4IhZbCaKlE9zWZo3KFT7U8zBPJKZlJW82qj5MbU9BRPUik8tnzKz6atXEJ7wa
	5jeb912wh//dS+1kIcc3XIVtg3IOkQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743613399;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fa6YlXKodz8uE2B17ypH6DPH4OLlDWUm8hFyF5FIY9Y=;
	b=aha205K+PISVQemmiSHd444KuIKNhvoqvLTkoXs+lESA7oYt3e01QexR7UdiM4dzX9Rahi
	zE4x/84orzT5wUAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743613399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fa6YlXKodz8uE2B17ypH6DPH4OLlDWUm8hFyF5FIY9Y=;
	b=rWFGI8P80VWPbDK82CvkzpgfMRqhsRT66++IButprgXUkvHplkNVR+XAfce703NyqRxfcm
	o2Mnvu1xS4IhZbCaKlE9zWZo3KFT7U8zBPJKZlJW82qj5MbU9BRPUik8tnzKz6atXEJ7wa
	5jeb912wh//dS+1kIcc3XIVtg3IOkQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743613399;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fa6YlXKodz8uE2B17ypH6DPH4OLlDWUm8hFyF5FIY9Y=;
	b=aha205K+PISVQemmiSHd444KuIKNhvoqvLTkoXs+lESA7oYt3e01QexR7UdiM4dzX9Rahi
	zE4x/84orzT5wUAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BDBED137D4;
	Wed,  2 Apr 2025 17:03:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id d/qQK9Zt7Wc2XwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 02 Apr 2025 17:03:18 +0000
Date: Wed, 2 Apr 2025 19:03:10 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	mkoutny@suse.com, Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 0/2] Implement numa node notifier
Message-ID: <Z-1tzl2NqqRUYyU-@localhost.localdomain>
References: <20250401092716.537512-1-osalvador@suse.de>
 <78c976ba-1eaf-47b7-a310-b8a99a3882e2@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78c976ba-1eaf-47b7-a310-b8a99a3882e2@suse.cz>
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,redhat.com,kvack.org,vger.kernel.org,gmail.com,suse.com,intel.com,huawei.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,localhost.localdomain:mid]
X-Spam-Score: -2.80
X-Spam-Flag: NO

On Wed, Apr 02, 2025 at 06:06:51PM +0200, Vlastimil Babka wrote:
> What if we had two chains:
> 
> register_node_notifier()
> register_node_normal_notifier()
> 
> I think they could have shared the state #defines and struct node_notify
> would have just one nid and be always >= 0.
> 
> Or would it add too much extra boilerplate and only slab cares?

We could indeed go on that direction to try to decouple
status_change_nid from status_change_nid_normal.

Although as you said, slub is the only user of status_change_nid_normal
for the time beign, so I am not sure of adding a second chain for only
one user.

Might look cleaner though, and the advantatge is that slub would not get
notified for nodes adquiring only ZONE_MOVABLE.

Let us see what David thinks about it.

thanks for the suggestion ;-)

-- 
Oscar Salvador
SUSE Labs
