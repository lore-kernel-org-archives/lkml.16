Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C984C2FB
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751010355; cv=none; b=b+e1T9FdIEZyN7pb6E0xNJ6D00b8xFTDa+RInRal6h0TLwjvCc5tzDN3hmDi496i5AX8zWUp5eqt72xhvvPwHvgw1aly2PcVdqb1MB0LbwRIGKWktHQSzpAKqrOdJKh/36SRMKxD9kpalFVGjP9aGMhmdxirBB0VEccl7sNu7Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751010355; c=relaxed/simple;
	bh=qsv8lX2R+jjj7HaR3MGPWXprxxFXhiUsHzsjLqXkaFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8/pMTa5oX+SIMEYGES8hRyZkfvCj1yxG16C5Mud0yZVmm4DIs5tHrRwQibqAi0czx0gIIlelU7RETf2xLjDguE68B2H1jUJ2/SPNEgirogUTYthO/AFn32x1CZgipcNJnjdvHc36Yo4A0sIezVUb736dgox7Va4MWe+U36Rv0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pcKJcOO4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=svOvG1i1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rXUyVd1l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K/E9pd0f; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pcKJcOO4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="svOvG1i1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rXUyVd1l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K/E9pd0f"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BC81D21171;
	Fri, 27 Jun 2025 07:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751010352; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dvxjyj926UqSRTbrbUxqXNDmogrIF3eTQkUGhEy25zk=;
	b=pcKJcOO4/sdg+ixuq4nhO7EZFqYyqm4asTnc2AYKJ6C6j8aqqIx553wO68pHh167AXm665
	gLFXqW6HVn1WyEsbsmwHO4qpOjjqZ9pqVexFtBvPoJ6xmjHlebW+YoYVEyycBbqD1nxGjF
	N0A96p8DSL9ezjd6pi25erhjY4M6u2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751010352;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dvxjyj926UqSRTbrbUxqXNDmogrIF3eTQkUGhEy25zk=;
	b=svOvG1i1UkFRrX5HR+UCjNp8OMKXLCVu7/rwasd+jI+ZjgZgVdxA0OBW9aCka3/PdUkgaz
	M8bmj7d4Rf3XmXBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751010351; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dvxjyj926UqSRTbrbUxqXNDmogrIF3eTQkUGhEy25zk=;
	b=rXUyVd1lmpRHtsdziS5ilOCxgB+qPW5tp9wdlIJLojzjrNJZ+xxuluC/HjyXNgQUYPhBAk
	gKhTDxv+9SX7IfP45CEdhmKZvsfNJWfj/ZZIwE+cbcS1NYpabZcjqWU0R42ZB+glAa8KsO
	Gme6nojmUgkYPcxWWNnyM4KXH+/LD8c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751010351;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dvxjyj926UqSRTbrbUxqXNDmogrIF3eTQkUGhEy25zk=;
	b=K/E9pd0fntjiucNgk5TsNkVT4oqiGNI27qxrB0CH9ND+1WfzjGF+OwCAf1bxobo/S6weWU
	cRtM7koB3CTmTJDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A2F413786;
	Fri, 27 Jun 2025 07:45:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BexPOy5MXmiRTgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 27 Jun 2025 07:45:50 +0000
Date: Fri, 27 Jun 2025 09:45:49 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Gregory Price <gourry@gourry.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alistair Popple <apopple@nvidia.com>,
	Byungchul Park <byungchul@sk.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	kernel-team@meta.com
Subject: Re: [PATCH 1/2] mm/mempolicy: Simplify weighted interleave bulk
 alloc calculations
Message-ID: <aF5MLcXmLopuHDht@localhost.localdomain>
References: <20250626200936.3974420-1-joshua.hahnjy@gmail.com>
 <20250626200936.3974420-2-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626200936.3974420-2-joshua.hahnjy@gmail.com>
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Thu, Jun 26, 2025 at 01:09:33PM -0700, Joshua Hahn wrote:
> Simplify the math used to figure out how many pages should be allocated
> per node. Instead of making conditional additions and deletions, we can just
> make them unconditional by using min(). No functional changes intended.
> 
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
