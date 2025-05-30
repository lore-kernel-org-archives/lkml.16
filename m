Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1D822D9F8
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748597681; cv=none; b=QRiVigpv0c3U71JuRNtbcVBzvls+pCo2Un3q1NAHSo0ttXpog4mSqsl1tOZYfYlSPJGbv1nz8o89yl1TvFC4H/BX1a9QgMl+VcXLlWnoOqBQyijXbrDKJTwtOpodyxV5hhQLcNFIx7liNnOpgYw8D+pFAleuNaL200gB20qCC24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748597681; c=relaxed/simple;
	bh=b+wG00NAHNH2WQRgMMTmBkjITAFnm0pZWIaTBBFJZh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igsTwGFsnPGlyGRPMUINhFX5g0cVkjwfXZx0K3XmhyCmSk4/6RqqOW5NmlptW4FuX5nItPNh+VwDNtIHwoZVdPCmyFo5ffN3XShvKmY2G0LretnGj+KOjwjHMIgt2uQGUr9tOxSveKJkt5mzXY3I93OLxfpPck6k9644Ix8Vouk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=YGybCRk+; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=QXF936EA; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=kMoFVsNA; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=XbeHvZ6j; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="YGybCRk+";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="QXF936EA";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="kMoFVsNA";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="XbeHvZ6j"
Received: from localhost (unknown [10.100.12.32])
	by smtp-out1.suse.de (Postfix) with ESMTP id 0496721199;
	Fri, 30 May 2025 09:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748597678; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ItuZODbQUON55ZfNqCBg9/7wO6q1b21kKNU9knhkEfc=;
	b=YGybCRk+GUMDo18XQr/74+0as7Za6cvWedFbBN0eXABoTliEi8gtfARRQzsoQxWiXZ/lZH
	jfgFLS4UWXExVFbrbyh09WWV+bQ4ZWC3dEtBjtyyUOHyZgPQLux/gRsBBDuiTN2EceffWJ
	PfwieiqzSav0/RJspFcSk862/LETdRU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748597678;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ItuZODbQUON55ZfNqCBg9/7wO6q1b21kKNU9knhkEfc=;
	b=QXF936EAdkErhGve4niFPkYmLyG5oz8HHFVS6y3t9bQl2Kse0glawCIuulJsMnlOIPEdXx
	aMST8TzTVdMmM5DA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748597677; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ItuZODbQUON55ZfNqCBg9/7wO6q1b21kKNU9knhkEfc=;
	b=kMoFVsNAX9J0KE3foXRbf5+dCc6zzp8RemYVFIyCNQlXT0bOGA1eN1R4LkFPRArUsB9/GL
	nMHAi/zkWITPJ7t+qZqIeCQT88ymc5HR3GJB4VfHBnA902ZV6mB766lGH2GX9o81uR5/u5
	b5c7ZLZN4KizPO8cjMOY12YVUf8t4iI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748597677;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ItuZODbQUON55ZfNqCBg9/7wO6q1b21kKNU9knhkEfc=;
	b=XbeHvZ6j21kgYeJ9uEQAmtKlapnWk6Gk0uFr1d5BKkSqquQ/jbw1S7pZ3tbWsSqZPpeYW5
	aXL+vWk1rcwnvHBw==
Date: Fri, 30 May 2025 11:34:36 +0200
From: Jiri Bohac <jbohac@suse.cz>
To: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
	Donald Dutile <ddutile@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
	Philipp Rudo <prudo@redhat.com>, Pingfan Liu <piliu@redhat.com>,
	Tao Liu <ltao@redhat.com>, linux-kernel@vger.kernel.org,
	David Hildenbrand <dhildenb@redhat.com>
Subject: Re: [PATCH v2 0/5] kdump: crashkernel reservation from CMA
Message-ID: <aDl7rHb34zIXEf6j@dwarf.suse.cz>
References: <04904e86-5b5f-4aa1-a120-428dac119189@redhat.com>
 <427fec88-2a74-471e-aeb6-a108ca8c4336@redhat.com>
 <Z8Z/gnbtiXT9QAZr@MiWiFi-R3L-srv>
 <e9c5c247-85fb-43f1-9aa8-47d62321f37b@redhat.com>
 <aDgQ0lbt1h5v0lgE@tiehlicka>
 <a1a5af90-bc8a-448a-81fa-485624d592f3@redhat.com>
 <aDlsF5tAcUxo4VgT@tiehlicka>
 <e0f7fc1e-2227-4c6b-985a-34a697a52679@redhat.com>
 <aDl1ViMpK_6q_z06@tiehlicka>
 <04a49de5-eb79-431b-ba5b-eae2536781c6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04a49de5-eb79-431b-ba5b-eae2536781c6@redhat.com>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dwarf.suse.cz:mid,localhost:helo]
X-Spam-Level: 

On Fri, May 30, 2025 at 11:11:40AM +0200, David Hildenbrand wrote:
> On 30.05.25 11:07, Michal Hocko wrote:
> > On Fri 30-05-25 10:39:39, David Hildenbrand wrote:
> > > On 30.05.25 10:28, Michal Hocko wrote:
> > [...]
> > > > All that being said I would go with an additional parameter to the
> > > > kdump cma setup - e.g. cma_sane_dma that would skip waiting and use 10s
> > > > otherwise. That would make the optimized behavior opt in, we do not need
> > > > to support all sorts of timeouts and also learn if this is not
> > > > sufficient.
> > > > 
> > > > Makes sense?
> > > 
> > > Just so I understand correctly, you mean extending the "crashkernel=" option
> > > with a boolean parameter? If set, e.g., wait 1s, otherwise magic number 10?
> > 
> > crashkernel=1G,cma,cma_sane_dma # no wait on transition
> 
> But is no wait ok? I mean, any O_DIRECT with any device would at least take
> a bit, no?
> 
> Of course, there is a short time between the crash and actually triggerying
> kdump.
> 
> > crashkernel=1G,cma # wait on transition with e.g. 10s timeout
> 
> In general, would work for me.

I don't like extending the crashkernel= syntax like this.
It would make hooking into the generic parsing code in
parse_crashkernel() really ugly. The syntax is already
convoluted as is and hard enough to explain in the documentation.

Also I don't see how adding a boolean knob is better than adding
one that allows setting any arbitrary timeout. It has less
flexibility and all the drawbacks of having an extra knob.

I am inclined to just setting the fixed delay to 10s for now and
adding a sysfs knob later if someone asks for it.

Would that work for you?

If you don't have other objections to the v3 series,
I'll just update it for v6.15 and post again a v4
with the 10s timeout...

Thanks for your input!

-- 
Jiri Bohac <jbohac@suse.cz>
SUSE Labs, Prague, Czechia

