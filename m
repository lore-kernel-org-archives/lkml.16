Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052C820E6EE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 11:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743073926; cv=none; b=rAWlm5dtlo4H7RxaufEJ5fL7oOBOnEtRmhpcmpmUBeNaj953i6Mg4KqYH20d65AviLfSY9/0zs2tQZBcSbIuqIBOuG+wXTg/tnstclnawef3puH+qEEXNn0zWZLyxNTJXa5AFQs2f5WGjdnqEgNhu81J3Vb2BFSPRnB5tIkeV1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743073926; c=relaxed/simple;
	bh=1Qv2xdtcsyH3jkgQX9CBipPwUBT1CaRCgadYOgRa1Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHceHXnRoBVzo6/lwSEzj+a5bPGNP/ZpYcFaZal2DUECPpX4NlVf6jq3j1jmVv9m+wwMHpZ0lNTy8xCzitsJtIupd3hvx5NkJHNMp2xC4U1cs/TyVKY203zJ+wZN38MzClvskGpT5FZXIzxP7QatOxMtD2GSubcIsGjVHDguRbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D8K47/Uh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ySuBfIzx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D8K47/Uh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ySuBfIzx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D8K47/Uh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ySuBfIzx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D8K47/Uh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ySuBfIzx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1CBD421179;
	Thu, 27 Mar 2025 11:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743073923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TjSxCMikDKOCpX1zJJZgUpRMmRG4w92N20u/r6q2+vA=;
	b=D8K47/Uh/MmXmFLRIoZFrfi0kdaz16NtMOoSsx0T74ccbyeKpMy1S49qv6T7GqWDqH0Tha
	wnVdigw/9/ssEJasQYHX/j8GJQE7Pg98Y/x/sN+X2w7Ywl+C5Ms72L1lD8pgCEQIoKCY+X
	LfKchd48YD1KLbRVnLM4ZM61d53ee6Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743073923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TjSxCMikDKOCpX1zJJZgUpRMmRG4w92N20u/r6q2+vA=;
	b=ySuBfIzx6amopoICXCiR5eJI6rQa6TpcFvU3dseUFVaT94JsEwxjLG3az3x19Kib83cXpd
	cZXCtYSkXe9cUaAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743073923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TjSxCMikDKOCpX1zJJZgUpRMmRG4w92N20u/r6q2+vA=;
	b=D8K47/Uh/MmXmFLRIoZFrfi0kdaz16NtMOoSsx0T74ccbyeKpMy1S49qv6T7GqWDqH0Tha
	wnVdigw/9/ssEJasQYHX/j8GJQE7Pg98Y/x/sN+X2w7Ywl+C5Ms72L1lD8pgCEQIoKCY+X
	LfKchd48YD1KLbRVnLM4ZM61d53ee6Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743073923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TjSxCMikDKOCpX1zJJZgUpRMmRG4w92N20u/r6q2+vA=;
	b=ySuBfIzx6amopoICXCiR5eJI6rQa6TpcFvU3dseUFVaT94JsEwxjLG3az3x19Kib83cXpd
	cZXCtYSkXe9cUaAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7A2FE1376E;
	Thu, 27 Mar 2025 11:12:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ssVtF4Ey5Wc4IwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 27 Mar 2025 11:12:01 +0000
Date: Thu, 27 Mar 2025 12:11:55 +0100
From: Oscar Salvador <osalvador@suse.de>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: lsf-pc@lists.linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, gourry@gourry.net,
	ying.huang@linux.alibaba.com, hyeonggon.yoo@sk.com,
	honggyu.kim@sk.com, kernel-team@meta.com
Subject: Re: [LSF/MM/BPF TOPIC] Weighted interleave auto-tuning
Message-ID: <Z-Uye2V-6Urz2IIA@localhost.localdomain>
References: <20250109185048.28587-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109185048.28587-1-joshua.hahnjy@gmail.com>
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, Jan 09, 2025 at 01:50:48PM -0500, Joshua Hahn wrote:
> Hello everyone, I hope everyone has had a great start to 2025!

Hi Joshua,

as discussed in the LSFMM about how you can react to nodes becoming
memory{aware,less}, you can register a hotplug memory notifier, as
memory-tiering currently does.

The current use of the hotplug memory notifier by some consumers (e.g:
memory-tiering, slub, etc) is a bit suboptimal, as they only care about
nodes changing its memory state, yet they get notified for every
{online,offline}_pages operation.

I came up with [1]

I did not publish it yet upstream because I wanted to discuss it a bit
with David, but you can give it a try to see if it works for you.
But till it is upstream, you will have to use the hotplug memory
notifier.

[1] https://github.com/leberus/linux.git numa-node-notifier 

-- 
Oscar Salvador
SUSE Labs
