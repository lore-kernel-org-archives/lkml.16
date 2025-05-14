Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226A921E098
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747212666; cv=none; b=FYxiZ9WKJmLUNbwsgIe3RMKbVq1wUeWJjUuX2bJMcsLfWZTCs9zH+6lASMmOUIJsnR0NjZkFbh5kawu7vvAB/BRZVrWgFV8J6xI1XiCcjMQE/7q7HSgjdtO8+yB2R0Dix3BU5qCfUS70rmO4mYstXXoAoqehAjowS/8jR2nhMJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747212666; c=relaxed/simple;
	bh=6tEYE069E4mzL3+5dNxHHrmo0j7FVAindoCB3iDcvBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4rOVAnzV+wD/gHyBFsMBqIMVLVVEn6BmfE2X0AVs+8VF+wVkc+ZxOcpLFiKA0LTHwqzma1NIZJ/jZPuUSjYKS9YmBiP1QqCzcJErdSdn2U0qDKdMffQeEQAmMqv1Qv1AxcvQiZe/J05K5ny4l2OZq89FasyfsfKol9jQKXs+PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u2ECZjR3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/l6f7NQ+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u2ECZjR3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/l6f7NQ+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u2ECZjR3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/l6f7NQ+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u2ECZjR3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/l6f7NQ+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 24EE021201;
	Wed, 14 May 2025 08:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747212662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1U2ujuZD1jkB0o1rfSCE6ebNEMGjdZEJaT7dHDxjfSc=;
	b=u2ECZjR3e1UIcJ1Cl9Ch3q93M8Kx/H21EsXRySOh8CWj2ha8JXy5U7SnYYD0MZMeyR+K6w
	cbuPP+vVecZKcD+pK9fzOupcrXTUXfordU3SSI1c8b2rgkbN5Jx6uoU2Z8jFZDmVa2XIF8
	3Tv8oOQqylZkteqzE122GA7qUtFhV2o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747212662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1U2ujuZD1jkB0o1rfSCE6ebNEMGjdZEJaT7dHDxjfSc=;
	b=/l6f7NQ+h5DrDRwc8EAJztzyphVOW4AYnVxcluu0qZsoeBsj6D+fyATUejRNJKT8qgF4l1
	/9DsX0OFaPZkJnAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747212662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1U2ujuZD1jkB0o1rfSCE6ebNEMGjdZEJaT7dHDxjfSc=;
	b=u2ECZjR3e1UIcJ1Cl9Ch3q93M8Kx/H21EsXRySOh8CWj2ha8JXy5U7SnYYD0MZMeyR+K6w
	cbuPP+vVecZKcD+pK9fzOupcrXTUXfordU3SSI1c8b2rgkbN5Jx6uoU2Z8jFZDmVa2XIF8
	3Tv8oOQqylZkteqzE122GA7qUtFhV2o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747212662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1U2ujuZD1jkB0o1rfSCE6ebNEMGjdZEJaT7dHDxjfSc=;
	b=/l6f7NQ+h5DrDRwc8EAJztzyphVOW4AYnVxcluu0qZsoeBsj6D+fyATUejRNJKT8qgF4l1
	/9DsX0OFaPZkJnAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 310D8137E8;
	Wed, 14 May 2025 08:51:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G6TeCHVZJGimHAAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 14 May 2025 08:51:01 +0000
Date: Wed, 14 May 2025 09:50:55 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] mm: remove WARN_ON_ONCE() in file_has_valid_mmap_hooks()
Message-ID: <pt5ni6ofhzbiiemnmrueg3w2hicfmi5qvqctz4ixasl2qrgjo7@dr5qcp52txuf>
References: <20250514084024.29148-1-lorenzo.stoakes@oracle.com>
 <9b5d232e-7579-42a9-bcbe-a4674bf76fe4@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b5d232e-7579-42a9-bcbe-a4674bf76fe4@suse.cz>
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,intel.com:email,suse.de:email,oracle.com:email,imap1.dmz-prg2.suse.org:helo]

On Wed, May 14, 2025 at 10:42:53AM +0200, Vlastimil Babka wrote:
> On 5/14/25 10:40, Lorenzo Stoakes wrote:
> > Having encountered a trinity report in linux-next (Linked in the 'Closes'
> > tag) it appears that there are legitimate situations where a file-backed
> > mapping can be acquired but no file->f_op->mmap or file->f_op->mmap_prepare
> > is set, at which point do_mmap() should simply error out with -ENODEV.
> > 
> > Since previously we did not warn in this scenario and it appears we rely
> > upon this, restore this situation, while retaining a WARN_ON_ONCE() for the
> > case where both are set, which is absolutely incorrect and must be
> > addressed and thus always requires a warning.
> > 
> > If further work is required to chase down precisely what is causing this,
> > then we can later restore this, but it makes no sense to hold up this
> > series to do so, as this is existing and apparently expected behaviour.
> > 
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Closes: https://lore.kernel.org/oe-lkp/202505141434.96ce5e5d-lkp@intel.com
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro
