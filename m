Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EFC1DE4F3
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750162215; cv=none; b=Uhe0S67XENgfNWMzDdQdQLL1Y3t7utm5zTQfatszBDEZNRf9vYKW9j/zXNDi2TmYtb1/rHlAFWXSZd1FS+HL/aKtMJ/HnPuXoVmWaIENOqq0xnJzAOfkTA6QHKBNgJ9faVF19PKnw0I8fZUhFRdE0G3I4HsOmmnfWcQhRsN2fgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750162215; c=relaxed/simple;
	bh=MzzTZSj+R1wdb3vL1PAlZe0jy+u4Fwp/sFHKQSnRePg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxkOO0QA6/UXpdTvYiOolRvIDaUH/yfD7uD3oJ8F6BdYdiKEu7fYYTPzR0QbRCtgeAr1jdBo1c5SKa6SBIvF9FamiSrc9wFJhTuNknxa8snjUpkGv69VZlx5LH7Q0+dljkkEFBWSD12QkgvYFpnnf5+0pqCjr7ldwBQ8GAwvSRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WHLNpWqm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Y35zgBKQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WHLNpWqm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Y35zgBKQ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WHLNpWqm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y35zgBKQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WHLNpWqm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y35zgBKQ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A91DA1F78B;
	Tue, 17 Jun 2025 12:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750162211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H3tv14WSt0c8uWmDlD5dHVqan5MBcFz+Okygv/WCaY4=;
	b=WHLNpWqm0bSM54bEz567SLE49aGHEyqV1E2viIy5ugL7YlvRq2RqQifWbujG5C/baZl8pP
	xXMMU82b9C9vp7Fc74uN/1bjgOs/+AvRccfFrg+tWjkSsJUN3Yg5zGAIIKUagc1jVa8J3+
	6YRq+EnWk5TCtYVbFeaUi6wHEICvAMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750162211;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H3tv14WSt0c8uWmDlD5dHVqan5MBcFz+Okygv/WCaY4=;
	b=Y35zgBKQJQ0pt00ITua8nmr4M/m5p1Phc8OY/3+593btN6KHqeapD1srXspP2I6CIz8Hsj
	wK3VOU6lavXOqYCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750162211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H3tv14WSt0c8uWmDlD5dHVqan5MBcFz+Okygv/WCaY4=;
	b=WHLNpWqm0bSM54bEz567SLE49aGHEyqV1E2viIy5ugL7YlvRq2RqQifWbujG5C/baZl8pP
	xXMMU82b9C9vp7Fc74uN/1bjgOs/+AvRccfFrg+tWjkSsJUN3Yg5zGAIIKUagc1jVa8J3+
	6YRq+EnWk5TCtYVbFeaUi6wHEICvAMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750162211;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H3tv14WSt0c8uWmDlD5dHVqan5MBcFz+Okygv/WCaY4=;
	b=Y35zgBKQJQ0pt00ITua8nmr4M/m5p1Phc8OY/3+593btN6KHqeapD1srXspP2I6CIz8Hsj
	wK3VOU6lavXOqYCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A47513AE2;
	Tue, 17 Jun 2025 12:10:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id q5ZYByNbUWhWPQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 17 Jun 2025 12:10:11 +0000
Date: Tue, 17 Jun 2025 14:10:09 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	James Houghton <jthoughton@google.com>,
	Peter Xu <peterx@redhat.com>, Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] mm,hugetlb: Document the reason to lock the folio in
 the faulting path
Message-ID: <aFFbIXLHdYbM3ooa@localhost.localdomain>
References: <ffeeb3d2-0e45-43d1-b2e1-a55f09b160f5@redhat.com>
 <aEychl8ZkJDG1-5K@localhost.localdomain>
 <aE075ld-fOyMipcJ@localhost.localdomain>
 <a5e098d1-ee5a-447f-9e05-0187b22500e1@redhat.com>
 <aFAlupvoJ_w7jCIU@localhost.localdomain>
 <1297fdd5-3de2-45bc-b146-e14061643fee@redhat.com>
 <aFE9YTNcCHAGBtKi@localhost.localdomain>
 <11a1d0f7-ef4e-4836-9bde-d7651eebcd03@redhat.com>
 <aFFZtD4zN_qINo9P@localhost.localdomain>
 <3eb8e1e2-5887-47ed-addc-3be664dd7053@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3eb8e1e2-5887-47ed-addc-3be664dd7053@redhat.com>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,localhost.localdomain:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,localhost.localdomain:mid]
X-Spam-Level: 

On Tue, Jun 17, 2025 at 02:08:16PM +0200, David Hildenbrand wrote:
> folio lock is a sleeping lock, PTL is a spinlock. :)

Lol yes, overlooked that totally.
And I also saw the comment from mm/rmap.c about lockin order.


-- 
Oscar Salvador
SUSE Labs
