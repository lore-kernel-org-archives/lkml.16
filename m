Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F64D10F9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611978; cv=none; b=AwoywZ0ZMg6N2qwCCMXkkmmOi41OHBZMYuYwGNAS4d79TwsvmvBLnF36xdZzHefO17FRgFNvQk8aaWINycsxPjrpVEAAlNgk2Ar1B2IyP5OHLYuRKItRBz7Yb+YPweMwHkhiN+iB04aICnT8WaM0lRXQIt+GPDEz43mgHf0FJiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611978; c=relaxed/simple;
	bh=9c1qI+fAK7gVzVfX02PhmX5G1z8VEY/ylfjEmXpdwiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JC8qWGanmzWVoqcjfzJcT+sV7QSNrZxUO02JjvX7/rXfD1ffr0eh6TtA+sY8jCHKH1mLpgGU6Avtd2mWJEPZYf/yvklC5a9NCfw3yW78QTRn720ymcgOfOqGFjU4wfQ61orTTvh26mj6L0s2kVNCPEnIk7C5A4S5r5nZ0ldq7k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QQpiJkHR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oAtJW5Uu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IgWQc9F+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M54Af+Bk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QQpiJkHR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oAtJW5Uu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IgWQc9F+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M54Af+Bk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 913371F6E6;
	Wed,  2 Apr 2025 16:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743611975; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=imE5/18rdw2xcdM8hxfvUIiLq2U1qbZPwyKYWRV0hQw=;
	b=QQpiJkHRThIpzB5lckjfeQncwvMZioxai0+bSuErHTZG2hQ5khk4//u+eQzTs4bvZdDuKl
	NIeTgDuPAF9zQHQ6C9zACOIXJO8a9N02vfdiutTPGxNNn/Vj51DLs1Y7t0iibyKrMq2Wuy
	gLzXzuNImAYkl63l9CKHEvx1CP4x7g8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743611975;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=imE5/18rdw2xcdM8hxfvUIiLq2U1qbZPwyKYWRV0hQw=;
	b=oAtJW5UurW+8nVy4W39GWhyVBJOCZ9JxKTyiMOQ6izu7SZo5xJQPjhzuY+Wmchv597s/+d
	3QaMt6D57qCQGbCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743611973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=imE5/18rdw2xcdM8hxfvUIiLq2U1qbZPwyKYWRV0hQw=;
	b=IgWQc9F+ROLTodGAcY98WImE9khLUtf2i4iAnx/k9ZkUMkLSruHBEjT88IRWYy5Y+lVgmU
	yCtYIGM8xLK7OFv71sjHcoyPf1m3UTFICeqt7Z9A/LZk8iwNsNUZaYyBuXjwYfyPddWLab
	HI/cESZXopb4lBQ+BGpdnrLVpHwlfXs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743611973;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=imE5/18rdw2xcdM8hxfvUIiLq2U1qbZPwyKYWRV0hQw=;
	b=M54Af+BkJ3YRhh8SeXAfaC+npAVEsD35vWbgdTyS/JMrinnj+Hf8AZHZEvMy4Heb9bKft6
	f3XCXumN6IDN39DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 77281137D4;
	Wed,  2 Apr 2025 16:39:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3lSrGkVo7WcxWAAAD6G6ig
	(envelope-from <dwagner@suse.de>); Wed, 02 Apr 2025 16:39:33 +0000
Date: Wed, 2 Apr 2025 18:39:32 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Daniel Wagner <wagi@kernel.org>, 
	James Smart <james.smart@broadcom.com>, Sagi Grimberg <sagi@grimberg.me>, 
	Chaitanya Kulkarni <kch@nvidia.com>, Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/18] nvmet-fcloop: sync targetport removal
Message-ID: <f222500d-0be0-4b1b-8bd3-44cf098cc607@flourine.local>
References: <20250318-nvmet-fcloop-v3-0-05fec0fc02f6@kernel.org>
 <20250318-nvmet-fcloop-v3-6-05fec0fc02f6@kernel.org>
 <20250321060832.GD3007@lst.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321060832.GD3007@lst.de>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, Mar 21, 2025 at 07:08:32AM +0100, Christoph Hellwig wrote:
> On Tue, Mar 18, 2025 at 11:40:00AM +0100, Daniel Wagner wrote:
> > The nvmet-fc uses references on the targetport to ensure no UAFs
> > happens. The consequence is that when the targetport is unregistered,
> > not all resources are freed immediately. Ensure that all activities from
> > the unregister call have been submitted (deassocication) before
> > continuing with the shutdown sequence.
> 
> This needs to explain why that is needed.  In general a completion
> waiting for references to go away is a bit of an anti-patter, so
> it should come with a good excuse.

FWIW, I was able to drop this patch and also the similar code for the
lport object. The reason is with the 'nvmet-fcloop: allocate/free
fcloop_lsreq directly' patch this is not necessary anymore.
