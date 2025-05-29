Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ECC218AAD
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 08:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748507960; cv=none; b=aih0qXs8qA57kbRfeUYKuChrWGHCs0gxJFeNEkEJLWO0xfQ693gmguNSIS5yXFhteZjO7s26F9vAoXJ3FIZOMWxkDWbvadZ7755XcbVgCmbD2dHFtZMovp/VphdUHgK7dQYnzB18iM6M4pR+wbu3hChx1lViRHtCoHN6aXJdtQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748507960; c=relaxed/simple;
	bh=uXBcfqJXex3RP0dMO8Q+N1Xh5QYRCpXpRkSsRYq0KjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUzmrT8eNBOVusuRMV/V8Pj9XYlyKHG6z4EGCM2gFxhjifQf9zUdEgvb6Z6+9XPCym+ONkDAll8hLNYV2gI50G+VEnkF3a5XzHzWCdYHVDiVyf4CrjyFxHlEupdzmuBSIKuFIPPCZ5KyHdh3Oe3QZ31WVJ1d3tlHNMzHAeMnYcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O6KNU+Qs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4LcfMGJq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=op/wsItB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zqyj64/E; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O6KNU+Qs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4LcfMGJq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="op/wsItB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zqyj64/E"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E8CDE1F74C;
	Thu, 29 May 2025 08:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748507954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8xV3LvE2zxilxOWpIQE1N13qMloAbg59B4oDkmgq8DI=;
	b=O6KNU+Qs4xMp10YgxTnHMMi/5i7OaU/xwUIJ0PXFLYanPOtQB9Rpgd6nmycngiq+LMVd+B
	zeclVoA+eZXd36d96wTSEZtA2uMLABLo7khH9q87QNoxSKeNpPMlpjvAa+5q4XexPx0Thm
	SwEAAsDJwMKEViM593LgolY7VE4uUZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748507954;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8xV3LvE2zxilxOWpIQE1N13qMloAbg59B4oDkmgq8DI=;
	b=4LcfMGJq1Ao+PvEVcTVfIPVo+1n7BYXXK+TDbb/yaSe9iOpzrNiYuzKdjf/VTztlp6fVn5
	8zQqd1vitDVMOsCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748507953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8xV3LvE2zxilxOWpIQE1N13qMloAbg59B4oDkmgq8DI=;
	b=op/wsItBU+PPu/9ES08ohvzDtSe3pkeE4eQ2JxKz3vw0TsrU0hy8RgzN6HvvBd9Vmi9Vrj
	QstB4jux5zOkVvidx0gXiO1WZSwmvrpNjr+wiBC4FiuV2tRrqS8kVMxoW605hVE5ZHdrC8
	I1XJLotu9dBjpfI4eD4EPhEHb4F2CnI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748507953;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8xV3LvE2zxilxOWpIQE1N13qMloAbg59B4oDkmgq8DI=;
	b=Zqyj64/Eb3N4KJM6roJIfl84SB+HKlmBBnYuzm5fGBbUi+94cL7+l2d8YcAaWNaaydBgy4
	B68qtxDWIAxJOICw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EC63136E0;
	Thu, 29 May 2025 08:39:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id crxQEzEdOGijZQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Thu, 29 May 2025 08:39:13 +0000
Date: Thu, 29 May 2025 09:39:11 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: lorenzo.stoakes@oracle.com
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, oliver.sang@intel.com
Subject: Re: [PATCH] tools/testing/vma: add missing function stub
Message-ID: <upfmiz7u2t4tzd6oogqm52mmgecepv7ecojgysmosgcu6ggov4@hgqlp3x27754>
References: <20250528-fix-vma-test-v1-1-c8a5f533b38f@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528-fix-vma-test-v1-1-c8a5f533b38f@oracle.com>
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.990];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Wed, May 28, 2025 at 03:15:39PM +0100, Lorenzo Stoakes via B4 Relay wrote:
> From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
> The hugetlb fix introduced in commit ee40c9920ac2 ("mm: fix copy_vma()
> error handling for hugetlb mappings") mistakenly did not provide a stub for
> the VMA userland testing, which results in a compile error when trying to
> build this.
> 
> Provide this stub to resolve the issue.
> 
> ---
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

I wonder if we could get the test bots to also build and run the userspace tests?
It would help finding this before getting merged, while also actively testing
vmas, xarray, maple, etc.

+Cc Oliver

-- 
Pedro
