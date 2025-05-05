Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D6B14B965
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746430139; cv=none; b=A18d1aWhoEhMQEpYrP5S4To6K6NiYduQjlK4mt6JpWjM1tAQYw13UJU2453KleFnzUlN2PL7yz2wbaQXJCyOdkOC3/RQNeaL8Lue1hXV8immplrLCXWs9RExdGSMzEhFFRlTVpLzJf88m4JTAfwj52JcF/R1DpNLbaMEQkucxPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746430139; c=relaxed/simple;
	bh=N/WYXhhmK7JVEpB4ReOywQ7bpwTS0f3Q1iuQk9QqmsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KpMh9ZU4bfPeQ4mGzIcwxnD0rCX9GnvKnKPDGaBHvanuFtrJUf4DmS7KgKb6SQFPVgdNEEyj5aIg8yVeyucQ5K8y+FIhj3L3WbleFsH8n/P+RMVaEdcsB6OgBYsPc04fHjyDF3d7J6HZF9lTnwBMb93G1S147SO7pUoR/P2ZUHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PneJWDha; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OohfR+Ag; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F+8R65GK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xJJw1lhk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PneJWDha";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OohfR+Ag";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F+8R65GK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xJJw1lhk"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D1AFE2125C;
	Mon,  5 May 2025 07:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746430130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sEYsB7uW34S76OweS7u+InfeYR/X8HZiTEj8FSKCUN0=;
	b=PneJWDhayP30w9A8ogY8FM4MU0dpp+8dyuOcoMp2/SJE66T+31kM/LjAkzoqpAaHn+Fuox
	TrEij4+brhmzLFQWAmER+OauM9ZggUkoryaXY8oTN9Safd6yW7f+/pbzSwvitBu+ki1x/T
	Zr4UZfM9irliscomy1h4V/RxhFYGUrU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746430130;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sEYsB7uW34S76OweS7u+InfeYR/X8HZiTEj8FSKCUN0=;
	b=OohfR+AgslAy42OiwCQAI3Nspb1ZGKRWC9cdpw4g3BZddHDiasqzsFlY2lFxf/Z1appdAj
	Ubvd/9MeZXRL7ODw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=F+8R65GK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xJJw1lhk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746430129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sEYsB7uW34S76OweS7u+InfeYR/X8HZiTEj8FSKCUN0=;
	b=F+8R65GKXrjkyrxIsalR6m8iv8Vm6RMngEUjzTojPXWIt3XihHrznLgQkVXm9BV3YHLzwQ
	N2QUWP68Ms/M8foCuDZl06kvVc01XdRXc/MCNIclC0xSXUUyxO0H2KThTRi4UupiP3Ee9m
	XH3SN6Yd7O6K3Jgo02/f1SMBRt4TucQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746430129;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sEYsB7uW34S76OweS7u+InfeYR/X8HZiTEj8FSKCUN0=;
	b=xJJw1lhkhSpiVJbGzextQDrsEnPJD0PRbLyqca4/cN1jOzbYm34ffcqsO3L/xC0/qP4t9l
	L10UgGwJD4nDDdDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B9A31372E;
	Mon,  5 May 2025 07:28:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 71ITALFoGGg6SAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 05 May 2025 07:28:49 +0000
Date: Mon, 5 May 2025 09:28:42 +0200
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
Message-ID: <aBhoqpC4Jy-c-74p@localhost.localdomain>
References: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>
 <aBdK2EIMYYRmmEwA@kernel.org>
 <a1e0cddc-ed38-4f48-b028-f3ab5025c157@linux.ibm.com>
 <188fbfba-afb4-4db7-bbba-7689a96be931@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <188fbfba-afb4-4db7-bbba-7689a96be931@redhat.com>
X-Rspamd-Queue-Id: D1AFE2125C
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,nvidia.com,linuxfoundation.org,linux-foundation.org,gmail.com,huawei.com,intel.com,kvack.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

On Mon, May 05, 2025 at 09:16:48AM +0200, David Hildenbrand wrote:
> memory hotplug code never calls register_one_node(), unless I am missing
> something.
> 
> During add_memory_resource(), we call __try_online_node(nid, false), meaning
> we skip register_one_node().
> 
> The only caller of __try_online_node(nid, true) is try_online_node(), called
> from CPU hotplug code, and I *guess* that is not required.

Well, I guess this is because we need to link the cpus to the node.
register_one_node() has two jobs: 1) register cpus belonging to the node
and 2) register memory-blocks belonging to the node (if any).

> I think the reason is simple: memory hotplug onlines the node before it adds
> any memory. So, there is no memory yet, consequently nothing to walk /
> register.
> 
> This whole code could deserve some cleanups. In particular, I am not sure if
> __try_online_node() must ever call register_one_node().

As stated, we need to call in, but maybe we can decouple it somehow (cpu
and memory).


-- 
Oscar Salvador
SUSE Labs
