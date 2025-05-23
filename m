Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BBA153BF0
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990025; cv=none; b=mDri7TcG4KnrIAoqSBsIRUejUQY0MoFQ56l9DdC4VWy681UtW1s/O9iaV+ZRuLSpUmY/E4Y5v+GuNpirPI7gdR488PrWEKQDQyekDY90CSeAiCGJu4k82c+eUC01TyQ0pINGEulcAzntAM3FeU+rRRP2ct4l/Zpv+Bvy40J2WH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990025; c=relaxed/simple;
	bh=2vECnlVMKvbz1Hpbw4+NHpo2EGbe+uyUyROWguNpYQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hlg+hjtkwGCDpXrUMaGJZBBbNX8EqImvmjk/U4yRJBuomBmc4AUBo873nwaAUhjO/YChsQdCtWtK46AWG/1Xso9krePp6OQRDkBqvPsVTuQF/Xn1wRhJ0A0af0WcbKdB6Rwk32kAc05zhRILG3YCjNL3gZv7+ZReMcqdFUayrWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u76QZsxA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Uk3keI+g; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u76QZsxA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Uk3keI+g; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u76QZsxA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Uk3keI+g";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u76QZsxA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Uk3keI+g"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 47A6B2119D;
	Fri, 23 May 2025 08:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747990016; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LXyI3AqMFJC1J5JkLvRZl2d+NL/z02K5Xn/OXPOt4UI=;
	b=u76QZsxA9gh3Tix/qZxJ/tjAc9JpgcS3CXwEn4PTNnDYDeuzXw7zt0lWe2HCIO6wsr6BgV
	jzC8ocOJdsg+Nj0NjGm/rW3+i41yOUGqtevzUhMVrxyXXYvDLnWqGTKrvRQk8XTkH6xWaa
	XLyrtJY1NHNVhafjoPcbbzHV/vzJTio=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747990016;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LXyI3AqMFJC1J5JkLvRZl2d+NL/z02K5Xn/OXPOt4UI=;
	b=Uk3keI+g8KDbmmqm66Uu0NL+zWGuPqok1uPFSc5XmOJK8MLUCGICwfbFkarpYt9nW8tUTm
	CUGXnKAvrlTNNlDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=u76QZsxA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Uk3keI+g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747990016; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LXyI3AqMFJC1J5JkLvRZl2d+NL/z02K5Xn/OXPOt4UI=;
	b=u76QZsxA9gh3Tix/qZxJ/tjAc9JpgcS3CXwEn4PTNnDYDeuzXw7zt0lWe2HCIO6wsr6BgV
	jzC8ocOJdsg+Nj0NjGm/rW3+i41yOUGqtevzUhMVrxyXXYvDLnWqGTKrvRQk8XTkH6xWaa
	XLyrtJY1NHNVhafjoPcbbzHV/vzJTio=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747990016;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LXyI3AqMFJC1J5JkLvRZl2d+NL/z02K5Xn/OXPOt4UI=;
	b=Uk3keI+g8KDbmmqm66Uu0NL+zWGuPqok1uPFSc5XmOJK8MLUCGICwfbFkarpYt9nW8tUTm
	CUGXnKAvrlTNNlDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 63225137B8;
	Fri, 23 May 2025 08:46:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id e5NKFf81MGgINAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 23 May 2025 08:46:55 +0000
Date: Fri, 23 May 2025 10:46:49 +0200
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
Subject: Re: [PATCH v5 1/4] drivers/base/node: Optimize memory block
 registration to reduce boot time
Message-ID: <aDA1-TupYDhUZ_c1@localhost.localdomain>
References: <d2490e807b2c13950bc1d4199f22ec078cc4c56a.1747904868.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2490e807b2c13950bc1d4199f22ec078cc4c56a.1747904868.git.donettom@linux.ibm.com>
X-Spam-Level: 
X-Spamd-Bar: /
X-Spam-Flag: NO
X-Spam-Score: -0.01
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 47A6B2119D
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,linux-foundation.org,kernel.org,nvidia.com,linuxfoundation.org,gmail.com,kvack.org,vger.kernel.org,huawei.com,intel.com];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,localhost.localdomain:mid,suse.de:email,suse.de:dkim,nvidia.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]

On Thu, May 22, 2025 at 04:17:28AM -0500, Donet Tom wrote:
> During node device initialization, `memory blocks` are registered under
> each NUMA node. The `memory blocks` to be registered are identified using
> the node’s start and end PFNs, which are obtained from the node's pg_data
> 
... 
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>

With the fixup from Mike:

Acked-by: Oscar Salvador <osalvador@suse.de>

 

-- 
Oscar Salvador
SUSE Labs
