Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79E41E0DBA
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 09:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749463073; cv=none; b=buR83t1a3utGrUo1H60F0kWMk9/svGAhh8/+BEHR3mgNoYF6nUU3txD6YV7fecx4YIomtFsEs9vHctRuCuHUWVibPSoEeo4TCCkLWtFCn17FLx5fRgmRJtkE0xgVapYmyTBpQyGlQrYz7yGjFhnPM67bPANBwvGNs9CbyD4WFH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749463073; c=relaxed/simple;
	bh=xFertUULP3gW1OINhPBssVsS/UW+0uHT6/ZiD7Xa0Ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qQYXOIaW+4zwbL/BgidHKFyOz8QPIkUGbJGAojVNsFIhPRIf37Gz8oO6bFkJgUl3eAQLNYad6kIwm8Y4J+QIYjOKh9nq3YzkZYPyoREoNFOamFmwY7IYyez3LLogctSzftqqy8FMYW+qmLcOLjoFB/fYTENNTYmqoReY5IY4Nn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=P0qzL/tJ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=igugslhJ; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=P0qzL/tJ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=igugslhJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="P0qzL/tJ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="igugslhJ";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="P0qzL/tJ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="igugslhJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 97C241F38F;
	Mon,  9 Jun 2025 09:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749463069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ajbZo35TbM+nni7JHDqQ2smmMXXwZys0F+ShuHpt1TY=;
	b=P0qzL/tJPoXS39PESvTe9PGw/0ZyZHeDaSCfK4swa99xmMqTlclZBnC0Z/dztkMiC5HdD8
	yljLrYMw58ZDHdwLAovBkj0YvidQrXDlpRkg/neXOShPJNKjxd95pB+L6VroyXhNC7KoDt
	1yrbCyIglzMokY9DSsd5zkFxHmDVrxo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749463069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ajbZo35TbM+nni7JHDqQ2smmMXXwZys0F+ShuHpt1TY=;
	b=igugslhJdy2XXN/KLcPPsad4DrtWDflPzWCcMgYnGDLOAwBNHyHEAr+imF58meyc+ghhnF
	LY9747ujFPg+VAAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="P0qzL/tJ";
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=igugslhJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1749463069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ajbZo35TbM+nni7JHDqQ2smmMXXwZys0F+ShuHpt1TY=;
	b=P0qzL/tJPoXS39PESvTe9PGw/0ZyZHeDaSCfK4swa99xmMqTlclZBnC0Z/dztkMiC5HdD8
	yljLrYMw58ZDHdwLAovBkj0YvidQrXDlpRkg/neXOShPJNKjxd95pB+L6VroyXhNC7KoDt
	1yrbCyIglzMokY9DSsd5zkFxHmDVrxo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1749463069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ajbZo35TbM+nni7JHDqQ2smmMXXwZys0F+ShuHpt1TY=;
	b=igugslhJdy2XXN/KLcPPsad4DrtWDflPzWCcMgYnGDLOAwBNHyHEAr+imF58meyc+ghhnF
	LY9747ujFPg+VAAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6CD6F13A1D;
	Mon,  9 Jun 2025 09:57:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IknuGB2wRmhxIgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 09 Jun 2025 09:57:49 +0000
Message-ID: <b387a3c6-1bf9-434f-a255-6e92269e6ba5@suse.cz>
Date: Mon, 9 Jun 2025 11:57:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
To: John Hubbard <jhubbard@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Peter Xu <peterx@redhat.com>
References: <1a7513cf-4a0a-4e58-b20d-31c1370b760f@lucifer.local>
 <e898e52e-a223-4567-9514-b4a021b5d460@nvidia.com>
 <72bb36f2-65b6-4785-af9d-5b1f8126fc78@lucifer.local>
 <2f866f12-2aa0-4456-b215-08ddc9b13b1e@redhat.com>
 <3dfbbd63-697d-42aa-8906-539d74df9123@nvidia.com>
 <44af8f5a-2d94-498b-a3e0-31f5dde74538@redhat.com>
 <20250606184212.GB63308@ziepe.ca>
 <f2d8febc-cf95-44dc-9f01-b28151fe1282@lucifer.local>
 <e5e88da7-d7c5-4a10-9318-76c1e38dd0a6@lucifer.local>
 <20250607134214.GA158671@ziepe.ca>
 <04f52d21-baeb-4286-99eb-99edead514b8@lucifer.local>
 <8ce6c104-d2fb-4fed-a108-224a6113c227@nvidia.com>
From: Vlastimil Babka <vbabka@suse.cz>
Content-Language: en-US
In-Reply-To: <8ce6c104-d2fb-4fed-a108-224a6113c227@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 97C241F38F
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Score: -4.51
X-Spam-Level: 

On 6/7/25 8:00 PM, John Hubbard wrote:
> On 6/7/25 6:53 AM, Lorenzo Stoakes wrote:
>>
>> Well that is simpler :)
>>
>> I have encountered situations where I've had more than one and needed
>> 2nd+
>> but it is rare as you say.
>>
>> My late night incoherent babbling yesterday was perhaps because I
>> misunderstood David/John as to what they encountered in the past... maybe
>> they can clarify...
> 
> I've debugged lots of production systems, often these were large HPC
> clusters and supercomputers. I've seen:
> 
> a) Long up-times, with (of course!) relatively small dmesg buffer sizes,
> so that early logs are long gone. This means that WARN_ON_ONCE() is
> quite often gone (overwritten). This is common.

There's no e.g. journald storing them permanently? I think trying to
hard in the kernel to provide this "recall first warning" if userspace
can handle this, is suboptimal. I think there are two main scenarios:

- the warning is indeed not fatal - userspace can likely save it
- it's (part of) something fatal - the system will crash before it
disappears from the ring buffer

> The worst part is that if you go to reproduce a problem, you don't
> see the next warning in the logs!! This is devastating, especially if
> the site makes it hard to ask for a system reboot. (If you have
> ~20,000 nodes in the cluster, a reboot is not a small affair.)

Assuming you know how to reproduce the problem... I wonder if it would
help if there was a way (sysctl?) to re-arm all the _ONCE warnings. It
shouldn't be that hard hopefully?


