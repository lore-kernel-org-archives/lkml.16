Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BC61D54EF
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 09:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746437815; cv=none; b=fjLN52FVik/Qq/H9nynej5gc3ecZ5ff5TfNVyIwIVe9Yzn8QA+yI187P38H7K5qjB9ZRAG0ZslZMdb6U+ra57NYeK2e/D0tR74KmZ5L9+kA8FcRnwNmxNA3uNYmO6k7Bc9bQoQdse+2gdtk9zkEho/NH27ZvMPREPHGUcb6maqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746437815; c=relaxed/simple;
	bh=9Gbk7lkgmNYzrSyXOZUSXhYM7bgertIgWPf3jdsKU0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtV8PY2i/FtOR8/SjL0R+SlxA7/b+37YET2SZeQf8sbFrhpSUKigbNGnC7WMTLdiYw/4LPkTpAHlYjQrORJDPAhhuLXA5IQKfeSvLxN6iwuoclg27wXfRgCpwZzmIL020+G8wdT2fRs8gTbk0n9srRyh/HMCd0UhSSwyw7T5ij8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iZHawpJe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xRQWHzpb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iZHawpJe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xRQWHzpb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iZHawpJe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xRQWHzpb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iZHawpJe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xRQWHzpb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2AC5521751;
	Mon,  5 May 2025 09:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746437812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iqZVfig/8xyFjf3cLBUVBTTUuoxBEC4ZbopMJ9V8slI=;
	b=iZHawpJeTkZ5WQKGQ9B7dID4kMuT89/8pB+Vm7CZ+W0MtLr1CxEOkBFpaI6kFRwOWrguXr
	+Og03cyYPnLh7s0YtBb4WgXPAzKeStNlgpNZu4ODzX9x6BPJN74xYkITeDUOpNONZSfClQ
	opn5+u7cVWgFiMm/qbmR877wBOvb7IM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746437812;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iqZVfig/8xyFjf3cLBUVBTTUuoxBEC4ZbopMJ9V8slI=;
	b=xRQWHzpbaBRs5jZ0vrvtApqWUOd5cFt00HYLC9wszuqlKR/smkh/ZXu6osRqRUdnKAeHEo
	YvmlEIdIKgHJGsBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746437812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iqZVfig/8xyFjf3cLBUVBTTUuoxBEC4ZbopMJ9V8slI=;
	b=iZHawpJeTkZ5WQKGQ9B7dID4kMuT89/8pB+Vm7CZ+W0MtLr1CxEOkBFpaI6kFRwOWrguXr
	+Og03cyYPnLh7s0YtBb4WgXPAzKeStNlgpNZu4ODzX9x6BPJN74xYkITeDUOpNONZSfClQ
	opn5+u7cVWgFiMm/qbmR877wBOvb7IM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746437812;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iqZVfig/8xyFjf3cLBUVBTTUuoxBEC4ZbopMJ9V8slI=;
	b=xRQWHzpbaBRs5jZ0vrvtApqWUOd5cFt00HYLC9wszuqlKR/smkh/ZXu6osRqRUdnKAeHEo
	YvmlEIdIKgHJGsBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4038213883;
	Mon,  5 May 2025 09:36:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZrbQDLOGGGjubgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 05 May 2025 09:36:51 +0000
Date: Mon, 5 May 2025 11:36:42 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Donet Tom <donettom@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] driver/base: Optimize memory block registration
 to reduce boot time
Message-ID: <aBiGquz1Exx8KUqq@localhost.localdomain>
References: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>
 <aBdK2EIMYYRmmEwA@kernel.org>
 <a1e0cddc-ed38-4f48-b028-f3ab5025c157@linux.ibm.com>
 <188fbfba-afb4-4db7-bbba-7689a96be931@redhat.com>
 <aBhoqpC4Jy-c-74p@localhost.localdomain>
 <74c500dd-8d1c-4177-96c7-ddd51ca77306@redhat.com>
 <aBhva9D6H5BtkSID@localhost.localdomain>
 <0e568e33-34fa-40f6-a20d-ebf653de123d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e568e33-34fa-40f6-a20d-ebf653de123d@redhat.com>
X-Spam-Score: -2.79
X-Spamd-Result: default: False [-2.79 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.942];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,nvidia.com,linuxfoundation.org,linux-foundation.org,gmail.com,huawei.com,intel.com,kvack.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, May 05, 2025 at 10:12:48AM +0200, David Hildenbrand wrote:
> Assume you hotplug the second CPU. The node is already registered/online, so
> who does the register_cpu_under_node() call?
> 
> It's register_cpu() I guess? But no idea in which order that is called with
> node onlining.
> 
> The code has to be cleaned up such that onlining a node does not traverse
> any cpus / memory.
> 
> Whoever adds a CPU / memory *after onlining the node* must register the
> device manually under the *now online* node.

So, I think this is the sequence of events:

- hotplug cpu:
  acpi_processor_hotadd_init
   register_cpu
    register_cpu_under_node

  online_store
   device_online()->dev_bus_online()
    cpu_subsys->online()
     cpu_subsys_online
      cpu_device_up
       cpu_up
        try_online_node  <- brings node online
         ...
         register_one_node <- registers cpu under node
        _cpu_up

The first time we hotplug a cpu to the node, note that
register_cpu()->register_cpu_under_node() will bail out as node is still
offline, so only cpu's sysfs will be created but they will not be linked
to the node.

Later, online_store()->...->cpu_subsys_online()->..->cpu_up() will take
care of 1) onlining the node and 2) register the cpu to the node (so,
link the sysfs).

The second time we hotplug a cpu,
register_cpu()->register_cpu_under_node() will do its job as the node is
already onlined.
And we will not be calling register_one_node() from __try_online_node()
because of the same reason.

The thing that bothers me is having register_cpu_under_node() spread
around.
I think that ideally, we should only be calling register_cpu_under_node()
from register_cpu(), but we have this kinda of (sort of weird?) relation
that even if we hotplug the cpu, but we do not online it, the numa node
will remain online, and so we cannot do the linking part (cpu <-> node),
so we could not really only have register_cpu_under_node() in
register_cpu(), which is the hot-add part, but we also need it in the
cpu_up()->try_online_node() which is the online part.

And we cannot also remove the register_cpu_under_node() from
register_cpu() because it is used in other paths (e.g: at boot time ).

I have to confess that yes, this is a bit tangled.

Maybe there is room for improvement here, I will have to think about
this some more and see if I can come up with something that makes sense.



-- 
Oscar Salvador
SUSE Labs
