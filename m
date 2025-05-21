Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A52278C9C
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747817342; cv=none; b=rekxHBicSd05/8ZKTzv/asMYaJPfy2zqHcM3odjwkcjpt/2EPB6w2Wx5877+xFlANxg9tqTNzE7gwdfDAxr95aWVDL8nMnmqxxi/2453VzphSfgQqMammVj+gibpAQx/arKSAz4v4AX15N44JyIItBVQlcxFV+gpAx4cG4AaQMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747817342; c=relaxed/simple;
	bh=IdTAw/7q5n4CViYIVlLpy2vbeybQVr45doe2wYSwj1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4l7oC2/1gOurmwIFkZwgAQYTf76MwkUEY0Wenl390tK/grxC2K9N5Qj8FGASTUI/nnU9OT6SEjThsJbXUggiWxQEVGcwQg5kb2h7zVydyakxzPWhQLfYehTmiqGfV+OhDrPrTNjs1Y7IDy9yVAup1wgaDECtFQ7uOrZD2HbosY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IYnp7blK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kHeRh3wj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0CkkL/cY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GRdrTkGa; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IYnp7blK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kHeRh3wj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0CkkL/cY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GRdrTkGa"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 192BC2125A;
	Wed, 21 May 2025 08:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747817338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PYJxRSWIj9WyqHxSTfPZjOkXna9NizDI98LlLiwmMyk=;
	b=IYnp7blKnCEQ+CSBUy3sB7zTf5bnWzcKXg4aN4TVqNIJKNGa1Z8gm3PwojSDjrnhIBfWpU
	xRc5vSw66F3bgraR1EQIQEOnhPCZXl3hsFIbjYbE/ymetaSBJW6yfwppvEMXOgbgHlTsEQ
	TcTrEI495qNPL4GxRfIAjfqUPNVskHI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747817338;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PYJxRSWIj9WyqHxSTfPZjOkXna9NizDI98LlLiwmMyk=;
	b=kHeRh3wjbPyBx/6GhLlOhp239jRDYDZADrBbDO/OCDUNXOPZkjYavcQbBr2ko6WBcYaZUf
	mK4tolpeDKljPABg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="0CkkL/cY";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GRdrTkGa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747817337; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PYJxRSWIj9WyqHxSTfPZjOkXna9NizDI98LlLiwmMyk=;
	b=0CkkL/cYNyrA1hH6nyhrkHau7b3GUDvRZMnQgV/g+FIX9VoPpfTjJ8TY9vK9qvVC9bxwB6
	q75U7fjqLvmb79pWzZv+CabAf9FTT3VkS9CPShLlGqdPZmehKnsE3FH/DguDE3Sg037Qlj
	B/pBG3CkIb+Eyn7Qm3BWNVxZQrgG1bs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747817337;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PYJxRSWIj9WyqHxSTfPZjOkXna9NizDI98LlLiwmMyk=;
	b=GRdrTkGaRD8RwdohSA6XOzmHEwc0n7KQtZBuXkisP9h9J3W/Mg/a/BsVH0u3iwi4q3MwxI
	R+JAt3pGVkBdtoBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E23AE13AA0;
	Wed, 21 May 2025 08:48:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id P1uLNniTLWiaNAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 21 May 2025 08:48:56 +0000
Date: Wed, 21 May 2025 10:48:55 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Mike Rapoport <rppt@kernel.org>
Cc: Changyuan Lyu <changyuanl@google.com>, akpm@linux-foundation.org,
	bhe@redhat.com, chrisl@kernel.org, graf@amazon.com,
	jasonmiu@google.com, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	pasha.tatashin@soleen.com
Subject: Re: [PATCH 1/2] memblock: show a warning if allocation in KHO
 scratch fails
Message-ID: <aC2TdzP1AwYrQdcW@localhost.localdomain>
References: <aCoFphqeZAMkhq51@kernel.org>
 <20250521070310.2478491-1-changyuanl@google.com>
 <aC2EE1pg9ktQdstI@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aC2EE1pg9ktQdstI@kernel.org>
X-Rspamd-Action: no action
X-Spam-Level: 
X-Rspamd-Queue-Id: 192BC2125A
X-Spam-Score: -1.51
X-Spam-Flag: NO
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.51 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]

On Wed, May 21, 2025 at 10:43:15AM +0300, Mike Rapoport wrote:
> I think we should just make sparse_init_nid() panic or at least change 
> "sparse_init_nid: node[0] memory map backing failed. Some memory will not be available."
> to something more visible and clear. 

Panicking the system seems a bit too harsh.
Those sections will not be initialized, and sure you will lose some memory,
but still.

I think that making sure that subsection_map_init() does not access
non-initialized values is enough.
Because wrt. error message, I am not sure it can get more clear that we
failed we allocate memory to back the section and so that section will
not be activated :-)

 

-- 
Oscar Salvador
SUSE Labs
