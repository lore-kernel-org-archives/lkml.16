Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E33272E5F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749131777; cv=none; b=MUwSFYKG1+e/k/DabPU1fBRYhrDcvzfv91NGjdC2cgzOu/tJkajK+K35QNUI1OQCbrvPuA6nVf4Zt4ATOK+5qKjNlohG0XHK9sKiB2Gl/gXQFiW6p30zoKukqPpbCtPIL0P6ZgJ5MiN+PX6uFbmLU3jSC5QyobReF2m/fNj1NgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749131777; c=relaxed/simple;
	bh=JY8eguoeVMug3lejr2EeN0T76qesNyoGTWbhLfJBeaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XyV5FrREM103+NKBNDNbsHpX/yslNHiwnmBBUlRicIRQCcs8r39NVxv22UV+XtkGQxvXwEtNGlITJcvZnnH7iOtJNkiGsMUPvqMpgv00O8Nw5ApfQpQq0jNYN5YMgSX/uwUcxTz4esJXYhpSDtk+PezMLJdjcMY5F5Q9Z+sXxi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=dmUI5xfj; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=K2JRKfPm; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=UuDEupoa; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=mRuZUTQD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="dmUI5xfj";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="K2JRKfPm";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="UuDEupoa";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="mRuZUTQD"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E3D151F78F;
	Thu,  5 Jun 2025 13:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749131774; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Jq2iaoJFXus2AuXH2g2QKS5xKjjXyQACZE8THrqxkJc=;
	b=dmUI5xfj3LZATWHxgVomJxLpJ1kl0v9dCzZ1gHThVGka3hXgtLbPyxjQyEnG8KSE8GUOPb
	76GIpAIuO8HeDxsuqblULfZhTJCtuhpJGWPRyrPh3Dp+hphjZ1bRsM8psCkYLU5eXLHv3w
	2v6tFQKW2FKpKTk4wWPsj82Ams4JnkY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749131774;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Jq2iaoJFXus2AuXH2g2QKS5xKjjXyQACZE8THrqxkJc=;
	b=K2JRKfPmlUUF+Bue/R6qxmWiZDsd+tbTUzBZCDjp+08HVj5b7syFIbVrTnDs3DNfrhmSfx
	+363d0eXiNcCRSBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749131773; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Jq2iaoJFXus2AuXH2g2QKS5xKjjXyQACZE8THrqxkJc=;
	b=UuDEupoaZyyNVc0rJK3bmzudEYCGBK61joM4Im+fyLSvRLEI0F0GvUL1fJgNYCOmxNXdOD
	UWWY+Cas42L5pMNN3jxzGyE27JS0MkMteTgzovOeXnCCwbIxyZVRK2zW+iHaDipuHbSxjA
	usU3tknXvlhIBOjw5PCF76uxDauqJUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749131773;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Jq2iaoJFXus2AuXH2g2QKS5xKjjXyQACZE8THrqxkJc=;
	b=mRuZUTQDdgXF7d60CyE8ZNpxrj9ObeQdnPxxUjBFk/TeEIkRKnahVSzsDdw/Jg7CV9oHi0
	ruzhO2zd9B3m8OAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C53BF1373E;
	Thu,  5 Jun 2025 13:56:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wcDLL/2hQWhJPAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 05 Jun 2025 13:56:13 +0000
Message-ID: <69a4b093-1fbd-4178-906b-960a3d8bc529@suse.cz>
Date: Thu, 5 Jun 2025 15:56:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vmstat: Fix build with MEMCG=y and VM_EVENT_COUNTERS=n
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 muchun.song@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>,
 Konstantin Khlebnikov <koct9i@gmail.com>
References: <20250604095111.533783-1-kirill.shutemov@linux.intel.com>
 <6fffd2fe-0cee-405f-af78-b57b5e5d02e8@suse.cz>
 <20250604142043.bdfdf4f9a6a6cbb57946f1a5@linux-foundation.org>
 <03c2b01b-18f5-4015-a19b-79b8af656697@suse.cz>
 <7lakc6hxbimvkgakpocj3aa65sdhmskm5p6hlurbwzyps33gfb@2z2eoz253hs4>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <7lakc6hxbimvkgakpocj3aa65sdhmskm5p6hlurbwzyps33gfb@2z2eoz253hs4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,redhat.com,oracle.com,kernel.org,google.com,suse.com,cmpxchg.org,linux.dev,kvack.org,vger.kernel.org,infradead.org,gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.cz:email,suse.cz:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30

On 6/5/25 13:53, Kirill A. Shutemov wrote:
> On Thu, Jun 05, 2025 at 08:19:28AM +0200, Vlastimil Babka wrote:
>> On 6/4/25 23:20, Andrew Morton wrote:
>> > On Wed, 4 Jun 2025 11:56:42 +0200 Vlastimil Babka <vbabka@suse.cz> wrote:
>> > 
>> >> > There is no need to backport this fix to stable trees. Without the
>> >> > strict BUILD_BUG_ON(), the issue is not harmful. The elements in
>> >> > question would only be read by the memcg code, not by /proc/vmstat.
>> >> > 
>> >> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
>> >> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
>> >> > Fixes: ebc5d83d0443 ("mm/memcontrol: use vmstat names for printing statistics")
>> >> 
>> >> Well in that case I think we should put Fixes: to the BUILD_BUG_ON() change.
>> >> And if it's not yet a stable sha1, squash that together with this?
>> >> It doesn't seem ebc5d83d0443 alone needs this fix.
>> > 
>> > I shuffled things around.
>> > 
>> > I moved "mm: strictly check vmstat_text array size" from mm-hotfixes
>> > and back into mm-new for the next cycle.
>> > 
>> > I reworked "mm/vmstat: fix build with MEMCG=y and VM_EVENT_COUNTERS=n"
>> > so it precedes "mm: strictly check vmstat_text array size".
>> > 
>> > I reworked "mm/vmstat: utilize designated initializers for the
>> > vmstat_text array" so it comes last.
>> > 
>> > 
>> > So the applying order is now
>> 
>> I checked and in general it looks good, except a nit below.
>> 
>> > mm-hotfixes:
>> > mm-fix-vmstat-after-removing-nr_bounce.patch
>> > 
>> > mm-new:
>> > mm-vmstat-fix-build-with-memcg=y-and-vm_event_counters=n.patch
>> > mm-strictly-check-vmstat_text-array-size.patch
>> 
>> The changelogs of these two don't reflect the new ordering though, maybe
>> Kirill can provide updated ones?
> 
> Maybe something like this, for the first patch?

LGTM, thanks!

> > mm/vmstat: Make MEMCG select VM_EVENT_COUNTERS
> 
> The vmstat_text array contains labels for counters displayed in /proc/vmstat.
> It is important to keep the labels in sync with the counters.
> 
> There is a BUILD_BUG_ON() check in vmstat_start() that ensures the size of the
> vmstat_text is not smaller than VM_EVENT_COUNTERS. This helps to catch cases
> where a new counter is added but the label is not. However, it does not help if
> a counter is removed but the label remains.
> 
> It would be nice to make the BUILD_BUG_ON() check more strict to catch such
> cases. However, when compiling with MEMCG enabled but VM_EVENT_COUNTERS
> disabled, the vmstat_text array is larger than NR_VMSTAT_ITEMS.
> 
> This issue arises because some elements of the vmstat_text array are present
> when either MEMCG or VM_EVENT_COUNTERS is enabled, but NR_VMSTAT_ITEMS only
> accounts for these elements if VM_EVENT_COUNTERS is enabled.
> 
> Instead of adjusting the NR_VMSTAT_ITEMS definition to account for MEMCG, make
> MEMCG select VM_EVENT_COUNTERS. VM_EVENT_COUNTERS is enabled in most
> configurations anyway.
> 

