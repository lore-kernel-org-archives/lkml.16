Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0921FBE83
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378375; cv=none; b=dkZ1b6xceN4yZklf8E2x6ThWSqGvNGMOe9q7wljq9Ks+TPAYtfUyXFODLoBWw14/cQnRze7j+0igK67EZiNSu3R2pD2qpAOIaSZL9fhEk2kyGo4oBarWbAc6ANLEi4So2m0cHsrsVJlIPH3ee/pOGWVsDbLw7NhxbZUjFyo3BHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378375; c=relaxed/simple;
	bh=Akx78TnuwoBCeXVuPwPFi5pPcmqB3gNdcTH2nU4K0CI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rlup6/dJ6yMB0mV3Lfz5YsIue/c1upEEo9nvSsPhuwbIYgNuHRz7/ZOhqs57OOGLrYqG9dE2A9st9Oq1LflZ+2A69hom8khu0OBI2fzMS3Gg8bE0GicT/JP5FGbrC9oOV/6AuFbvfpkFq+EvnYkxCmfMpdR97vO0XQmTv7XyZWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D95071F456;
	Fri, 11 Apr 2025 13:32:51 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C77F213886;
	Fri, 11 Apr 2025 13:32:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9F5hMAMa+WesdwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 11 Apr 2025 13:32:51 +0000
Message-ID: <f86be76f-7bcd-43f8-b472-ca7797ebecdc@suse.cz>
Date: Fri, 11 Apr 2025 15:32:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm,hugetlb: Allocate frozen pages in
 alloc_buddy_hugetlb_folio
Content-Language: en-US
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>, David Hildenbrand
 <david@redhat.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>
References: <20250411132359.312708-1-osalvador@suse.de>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250411132359.312708-1-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: D95071F456
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On 4/11/25 15:23, Oscar Salvador wrote:
> alloc_buddy_hugetlb_folio() allocates a rmappable folio, then strips the
> rmappable part and freezes it.
> We can simplify all that by allocating frozen pages directly.
> 
> Suggested-by: Vlastimil Babka <vbabka@suse.cz>
> Signed-off-by: Oscar Salvador <osalvador@suse.de>

Much nice.

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

