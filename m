Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD5A1494DB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 18:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743533523; cv=none; b=mi8YwDGfHWdH9dptrodQ5qxRNWnjaZU+cAKtid01Fg2ZTZSu+IUkDUucyk4WgiXFTZEswCRo7wnSLbQ2t43Dxx8wJsUMxOK5w+D5F2X+ZHSQ3FIDsCVHheJDUmHE/XIkpIk8w1aqlrIe79gYZC+wDDVBIoQFFGIO+t06YDGPP6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743533523; c=relaxed/simple;
	bh=JFIUm1fbLn8azu0BaeYPgWcuIeeIHRyVIZGpsBvXr1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8m+Bk/4oIqpWB3V1H8KNfrr9Nr3SxAuqEersLMa21h/2OxEYoWJvf2fOZZDgtlbVb7tnufHZclOVwSorBaj1SUAoMLWjixOtoqMk3c7CMhz1bhQ7LBkmGE8Dkk1Af+YssmHiK5t+L61S3lpDSt1dx8V8HWfd3z+fYOojdqaY6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nk/qFZhB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IFEgjiST; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nk/qFZhB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IFEgjiST; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nk/qFZhB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IFEgjiST";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nk/qFZhB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IFEgjiST"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1FF5321170;
	Tue,  1 Apr 2025 18:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743533520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Avd+V83CqKMjKY5z6rVGHlfBxekZGot06UToENPfxyg=;
	b=nk/qFZhBvYezECcRXBhVpfifFLwOeDqPES+cMW/+gOarQyFcBfulKQaeMRxpbGj/DS12T5
	HlBGC+h0jIW3KovRBzyR0OG4cWjHckB880+6i8BjAfNfLhv4ZpS6sqWHeHdmFcznjDYuTt
	cs0f8PagrJBBhOBpuHSye4N5+3PTcG4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743533520;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Avd+V83CqKMjKY5z6rVGHlfBxekZGot06UToENPfxyg=;
	b=IFEgjiSTD0e2cxHZ2ydDL2ECb4EesHCuiSkLYB1R3/UYqLFFdqbbsy0GpO77TPFFowi6Cb
	rTJxcIab0bSocwAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="nk/qFZhB";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IFEgjiST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743533520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Avd+V83CqKMjKY5z6rVGHlfBxekZGot06UToENPfxyg=;
	b=nk/qFZhBvYezECcRXBhVpfifFLwOeDqPES+cMW/+gOarQyFcBfulKQaeMRxpbGj/DS12T5
	HlBGC+h0jIW3KovRBzyR0OG4cWjHckB880+6i8BjAfNfLhv4ZpS6sqWHeHdmFcznjDYuTt
	cs0f8PagrJBBhOBpuHSye4N5+3PTcG4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743533520;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Avd+V83CqKMjKY5z6rVGHlfBxekZGot06UToENPfxyg=;
	b=IFEgjiSTD0e2cxHZ2ydDL2ECb4EesHCuiSkLYB1R3/UYqLFFdqbbsy0GpO77TPFFowi6Cb
	rTJxcIab0bSocwAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB8B513691;
	Tue,  1 Apr 2025 18:51:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id C/YhJ8417GeENwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 01 Apr 2025 18:51:58 +0000
Date: Tue, 1 Apr 2025 20:51:57 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-acpi@vger.kernel.org, kernel-team@meta.com,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
	rafael@kernel.org, lenb@kernel.org, david@redhat.com,
	gregkh@linuxfoundation.org, akpm@linux-foundation.org,
	dan.j.williams@intel.com, Jonathan.Cameron@huawei.com,
	alison.schofield@intel.com, rrichter@amd.com, rppt@kernel.org,
	bfaccini@nvidia.com, haibo1.xu@intel.com, dave.jiang@intel.com,
	Fan Ni <fan.ni@samsung.com>, Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH v8 2/3] x86: probe memory block size advisement value
 during mm init
Message-ID: <Z-w1zdN9HaGiHkle@localhost.localdomain>
References: <20250127153405.3379117-1-gourry@gourry.net>
 <20250127153405.3379117-3-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127153405.3379117-3-gourry@gourry.net>
X-Rspamd-Queue-Id: 1FF5321170
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLeqp5gkuwhygrjzi4zhnnr4iu)];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,intel.com:email,samsung.com:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, Jan 27, 2025 at 10:34:04AM -0500, Gregory Price wrote:
> Systems with hotplug may provide an advisement value on what the
> memblock size should be.  Probe this value when the rest of the
> configuration values are considered.
> 
> The new heuristic is as follows
> 
> 1) set_memory_block_size_order value if already set (cmdline param)
> 2) minimum block size if memory is less than large block limit
> 3) if no hotplug advice: Max block size if system is bare-metal,
>    otherwise use end of memory alignment.
> 4) if hotplug advice: lesser of advice and end of memory alignment.
> 
> Convert to cpu_feature_enabled() while at it.[1]
> 
> [1] https://lore.kernel.org/all/20241031103401.GBZyNdGQ-ZyXKyzC_z@fat_crate.local/
> 
> Suggested-by: Borislav Petkov <bp@alien8.de>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Acked-by: Dan Williams <dan.j.williams@intel.com>
> Tested-by: Fan Ni <fan.ni@samsung.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Gregory Price <gourry@gourry.net>

Acked-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
